DELIMITER $$

-- 0. 输入uname和password，如果密码正确，则返回uid下所有aid

DROP PROCEDURE IF EXISTS VerifyLoginAndGetAids$$

CREATE PROCEDURE VerifyLoginAndGetAids(IN input_uname VARCHAR(20), IN input_password VARCHAR(256))
BEGIN
    DECLARE hashed_password VARCHAR(64);
    DECLARE stored_password VARCHAR(64);
    DECLARE result VARCHAR(100);
    DECLARE input_uid INT;

    SELECT uid INTO input_uid FROM USERS WHERE uname = input_uname LIMIT 1;
    IF input_uid IS NOT NULL THEN
        SELECT pwd INTO stored_password FROM USERS WHERE uname = input_uname LIMIT 1;
        IF stored_password IS NOT NULL THEN
            -- 计算输入密码的哈希值
            SET hashed_password = SHA2(input_password, 256);

            -- 比较哈希值，判断是否登录成功
            IF hashed_password = stored_password THEN
                SET result = 'Login successful';
                SELECT result AS LoginResult;  -- 输出登录成功结果
                SELECT aid FROM ACCOUNT WHERE uid = input_uid;  -- 获取并返回所有相关的aid
            ELSE
                SET result = 'Login failed';
                SELECT result AS LoginResult;  -- 输出登录失败结果
            END IF;
        ELSE
            SET result = 'No password found for user';
            SELECT result AS LoginResult;
        END IF;
    ELSE
        SET result = 'No such user found';
        SELECT result AS LoginResult;
    END IF;
END$$

-- 1.查询指定aid的当前关卡进度

DROP FUNCTION IF EXISTS GetMaxPassedBid$$

CREATE FUNCTION GetMaxPassedBid(user_aid INT) RETURNS INT READS SQL DATA
BEGIN
    DECLARE max_bid INT;

    SELECT MAX(bid) INTO max_bid
    FROM EVENT
    WHERE aid = user_aid AND pass_state >= 1;

    RETURN max_bid;
END$$

-- 2.查询指定bname的关卡信息，返回为map，对应enemy信息以及数量num

DROP PROCEDURE IF EXISTS GetBattleInfo$$

CREATE PROCEDURE GetBattleInfo(IN input_bname VARCHAR(100))
BEGIN
    SELECT b.map, e.ename, a.num, e.eatk, e.edef, e.ehp
    FROM battle b
    JOIN appear a ON b.bid = a.bid
    JOIN enemy e ON a.eid = e.eid
    WHERE b.bname = input_bname;
END$$

-- 3.查询指定aid的指定干员信息

DROP PROCEDURE IF EXISTS GetCharacterInfo$$

CREATE PROCEDURE GetCharacterInfo(IN input_aid INT, IN input_cname VARCHAR(20))
BEGIN
    SELECT 
        ac.clevel, 
        ac.cpotent, 
        c.sk_1, 
        c.sk_2, 
        c.sk_3, 
        c.talent
    FROM 
        acc_char ac
    JOIN 
        account a ON ac.aid = a.aid
    JOIN 
        characters c ON ac.cid = c.cid
    WHERE 
        a.aid = input_aid AND
        c.cname = input_cname;
END$$

-- 4.查询aid下大于等于n级的所有干员名称

DROP PROCEDURE IF EXISTS GetHighLevelCharacters$$

CREATE PROCEDURE GetHighLevelCharacters(IN input_aid INT, IN level_threshold INT)
BEGIN
    SELECT 
        c.cname
    FROM 
        account a
    JOIN 
        acc_char ac ON a.aid = ac.aid
    JOIN 
        characters c ON ac.cid = c.cid
    WHERE 
        a.aid = input_aid AND
        ac.clevel >= level_threshold;
END$$

-- 5.查询aid下大于等于n级的干员总数

DROP PROCEDURE IF EXISTS CountHighLevelCharacters$$

CREATE PROCEDURE CountHighLevelCharacters(IN input_aid INT, IN level_threshold INT)
BEGIN
    SELECT 
        COUNT(c.cid) AS character_count
    FROM 
        account a
    JOIN 
        acc_char ac ON a.aid = ac.aid
    JOIN 
        characters c ON ac.cid = c.cid
    WHERE 
        a.aid = input_aid AND
        ac.clevel >= level_threshold;
END$$

-- 6.修改uid下的绑定email

DROP PROCEDURE IF EXISTS UpdateEmail$$

CREATE PROCEDURE UpdateEmail(IN input_uid INT, IN input_email VARCHAR(30))
BEGIN
    UPDATE USERS
    SET email = input_email
    WHERE uid = input_uid;
END$$

-- 7.修改uid下的绑定手机

DROP PROCEDURE IF EXISTS UpdateTel$$

CREATE PROCEDURE UpdateTel(IN input_uid INT, IN input_tel VARCHAR(20))
BEGIN
    UPDATE USERS
    SET tel = input_tel
    WHERE uid = input_uid;
END$$


-- 8.插入新的登陆信息

DROP PROCEDURE IF EXISTS InsertLoginInfo$$

CREATE PROCEDURE InsertLoginInfo(
    IN input_uid INT,
    IN input_ip VARCHAR(20),
    IN input_device VARCHAR(20)
)
BEGIN
    INSERT INTO LOGIN (uid, ip, device)
    VALUES (input_uid, input_ip, input_device);
END$$

-- 9. 插入新的team以及event信息

DROP PROCEDURE IF EXISTS InsertTeamAndEvent$$

CREATE PROCEDURE InsertTeamAndEvent(
	IN input_vid INT,
    IN input_aid INT, 
    IN input_bid INT, 
    IN input_pass_state INT, 
    IN cid1 INT, IN cid2 INT, IN cid3 INT, IN cid4 INT, IN cid5 INT, IN cid6 INT, 
    IN sk1 INT, IN sk2 INT, IN sk3 INT, IN sk4 INT, IN sk5 INT, IN sk6 INT)
BEGIN
    -- 插入新的team信息
    INSERT INTO TEAM (cid_1, cid_2, cid_3, cid_4, cid_5, cid_6, sk_1, sk_2, sk_3, sk_4, sk_5, sk_6)
    VALUES (cid1, cid2, cid3, cid4, cid5, cid6, sk1, sk2, sk3, sk4, sk5, sk6);

    -- 获取刚插入的team的ID
    SET @last_team_id = LAST_INSERT_ID();

    -- 插入新的event信息，注意team_vid设置为刚插入的team ID
    INSERT INTO EVENT (vid, aid, bid, time, pass_state, team_vid)
    VALUES (input_vid, input_aid, input_bid, CURRENT_TIMESTAMP, input_pass_state, @last_team_id);
END$$

-- 10.对应aid在某一年进行了多少次战斗

DROP PROCEDURE IF EXISTS CountLevelsPlayed$$

CREATE PROCEDURE CountLevelsPlayed(IN input_aid INT, IN input_year INT)
BEGIN
    SELECT 
        COUNT(*) AS total_levels_played
    FROM 
        EVENT
    WHERE 
        aid = input_aid AND
        YEAR(time) = input_year;
END$$

-- 11.对应uid在某一年使用某干员的次数

DROP PROCEDURE IF EXISTS CountCharacterUsage$$

CREATE PROCEDURE CountCharacterUsage(IN input_aid INT, IN input_year INT, IN input_cname VARCHAR(20))
BEGIN
    SELECT 
        COUNT(*) AS total_times_used
    FROM 
        EVENT e
    JOIN 
        TEAM t ON e.vid = t.vid
    JOIN 
        CHARACTERS c ON c.cid = t.cid_1 OR c.cid = t.cid_2 OR c.cid = t.cid_3 OR 
                       c.cid = t.cid_4 OR c.cid = t.cid_5 OR c.cid = t.cid_6
    WHERE 
        e.aid = input_aid AND
        YEAR(e.time) = input_year AND
        c.cname = input_cname;
END$$

-- 12. uid年度登陆天数

DROP PROCEDURE IF EXISTS AnnualLoginDays$$

CREATE PROCEDURE AnnualLoginDays(IN input_uid INT, IN input_year INT)
BEGIN
    SELECT 
        COUNT(DISTINCT DATE(time)) AS unique_login_days
    FROM 
        LOGIN
    WHERE 
        uid = input_uid AND
        YEAR(time) = input_year;
END$$

-- 13.查询aid生涯作战最多日期

DROP FUNCTION IF EXISTS GetMostActiveBattleDay$$

CREATE FUNCTION GetMostActiveBattleDay(input_aid INT) RETURNS DATE READS SQL DATA
BEGIN
    DECLARE most_active_day DATE;
    
    SELECT DATE(time) INTO most_active_day
    FROM EVENT
    WHERE aid = input_aid
    GROUP BY DATE(time)
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    RETURN most_active_day;
END$$

-- 14. 查询aid首次3星通关指定battle的日期和使用的team

DROP PROCEDURE IF EXISTS GetFirstVictoryDetails$$

CREATE PROCEDURE GetFirstVictoryDetails(IN input_aid INT, IN input_bname VARCHAR(20))
BEGIN
    SELECT 
        E.time AS VictoryDate,
        T.cid_1, T.cid_2, T.cid_3, T.cid_4, T.cid_5, T.cid_6,
        T.sk_1, T.sk_2, T.sk_3, T.sk_4, T.sk_5, T.sk_6
    FROM 
        EVENT E
    JOIN 
        BATTLE B ON E.bid = B.bid
    JOIN 
        TEAM T ON E.vid = T.vid
    WHERE 
        E.aid = input_aid AND
        B.bname = input_bname AND
        E.pass_state = 3
    ORDER BY 
        E.time ASC
    LIMIT 1;
END$$

-- 15. 查询aid生涯击败某种敌人的次数

DROP PROCEDURE IF EXISTS GetEnemyDefeatCount$$

CREATE PROCEDURE GetEnemyDefeatCount(IN input_aid INT, IN input_ename VARCHAR(20))
BEGIN
    SELECT 
        SUM(A.num) AS TotalDefeats
    FROM 
        EVENT E
    JOIN 
        APPEAR A ON E.bid = A.bid
    JOIN 
        ENEMY EN ON A.eid = EN.eid
    WHERE 
        E.aid = input_aid AND
        EN.ename = input_ename AND
        E.pass_state >=  1 
    GROUP BY 
        E.aid, EN.ename;
END$$

DELIMITER ;
