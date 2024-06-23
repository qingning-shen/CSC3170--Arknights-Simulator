INSERT INTO USERS(uname, pwd, tel, email) VALUES("admin", SHA2("admin", 256), "123456789", "admin@hypergryph.com");
INSERT INTO USERS(uname, pwd, tel) VALUES("android_user", SHA2("114514", 256), "987654321");
INSERT INTO USERS(uname, pwd) VALUES("ios_user", SHA2("1919810", 256));
-- SELECT * FROM USERS;


INSERT INTO LOGIN(uid, ip, device) VALUES(1, "127.0.0.1", "PC");
INSERT INTO LOGIN(uid, ip, device) VALUES(2, "127.0.0.2", "Android");
INSERT INTO LOGIN(uid, ip, device) VALUES(3, "127.0.0.3", "iOS");
INSERT INTO LOGIN(uid, ip, device) VALUES(2, "127.0.0.4", "Android");
-- SELECT * FROM LOGIN;
-- SELECT * FROM LOGIN WHERE uid=2;


INSERT INTO ACCOUNT(uid, reg_date, alevel) VALUES(1, "2017-01-01", 120);
INSERT INTO ACCOUNT(uid, reg_date, alevel) VALUES(2, "2019-05-01", 100);
INSERT INTO ACCOUNT(uid, reg_date, alevel) VALUES(3, "2019-04-30", 110);
INSERT INTO ACCOUNT(uid, reg_date, alevel) VALUES(2, "2024-04-01", 20);
-- SELECT * FROM ACCOUNT;
-- SELECT * FROM ACCOUNT WHERE uid=2;


INSERT INTO
	CHARACTERS(cname, cimg, sk_1, sk_2, sk_3, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Amiya", "./char_img/Amiya.png",
		"Tactical Chant Gamma", "Spirit Burst", "Chimera",
		"Emotional Absorption",
		514, 110, 1198, 1
	);
INSERT INTO
	CHARACTERS(cname, cimg, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Castle-3", "./char_img/Castle-3.png",
		"Tactical Configuration",
		247, 63, 928, 1
	);
INSERT INTO
	CHARACTERS(cname, cimg, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Yato", "./char_img/Yato.png",
		"Fast Redeployment",
		150, 134, 721, 2
	);
INSERT INTO
	CHARACTERS(cname, cimg, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Noir Corne", "./char_img/Noir-Corne.png",
		"Improved Armor",
		180, 220, 1219, 3
	);
INSERT INTO
	CHARACTERS(cname, cimg, sk_1, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Ansel", "./char_img/Ansel.png",
		"Healing Range Up", "Additional Healing",
		156, 60, 634, 1
	);
INSERT INTO
	CHARACTERS(cname, cimg, sk_1, sk_2, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Platinum", "./char_img/Platinum.png",
		"ATK Up Gamma", "Pegasian Sight",
		"All-Out Attack",
		414, 139, 1271, 1
	);
INSERT INTO
	CHARACTERS(cname, cimg, sk_1, sk_2, sk_3, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Thorns", "./char_img/Thorns.png",
		"ATK Up Gamma", "Protective Spikes", "Destreza",
		"Nerve Corrosion",
		575, 333, 2063, 2
	);
INSERT INTO
	CHARACTERS(cname, cimg, sk_1, sk_2, sk_3, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Suzuran", "./char_img/Suzuran.png",
		"I'll Do My Best", "Childhood Frolic", "Foxfire Haze",
		"Binding Circle",
		432, 107, 1184, 1
	);
INSERT INTO
	CHARACTERS(cname, cimg, sk_1, sk_2, sk_3, talent, catk_0, cdef_0, chp_0, cblk)
	VALUES(
		"Texas the Omersota", "./char_img/Texas-the Omersota.png",
		"Silent Drizzle", "Unrelenting Downpour", "Torrential Sword Rain",
		"Texas Tradition",
		443, 268, 1246, 1
	);
-- SELECT * FROM CHARACTERS;


INSERT INTO ACC_CHAR VALUES(1, 1, 80, 6);
INSERT INTO ACC_CHAR VALUES(1, 2, 30, 6);
INSERT INTO ACC_CHAR VALUES(1, 3, 30, 6);
INSERT INTO ACC_CHAR VALUES(1, 4, 30, 6);
INSERT INTO ACC_CHAR VALUES(1, 5, 55, 6);
INSERT INTO ACC_CHAR VALUES(1, 6, 80, 6);
INSERT INTO ACC_CHAR VALUES(1, 7, 90, 6);
INSERT INTO ACC_CHAR VALUES(1, 8, 90, 6);
INSERT INTO ACC_CHAR VALUES(1, 9, 90, 6);

INSERT INTO ACC_CHAR VALUES(2, 1, 60, 6);
INSERT INTO ACC_CHAR VALUES(2, 2, 30, 6);
INSERT INTO ACC_CHAR VALUES(2, 3, 30, 6);
INSERT INTO ACC_CHAR VALUES(2, 4, 30, 6);
INSERT INTO ACC_CHAR VALUES(2, 5, 55, 6);
INSERT INTO ACC_CHAR VALUES(2, 6, 80, 6);
INSERT INTO ACC_CHAR VALUES(2, 8, 30, 1);
INSERT INTO ACC_CHAR VALUES(2, 9, 90, 4);

INSERT INTO ACC_CHAR VALUES(3, 1, 60, 6);
INSERT INTO ACC_CHAR VALUES(3, 2, 1, 6);
INSERT INTO ACC_CHAR VALUES(3, 3, 1, 6);
INSERT INTO ACC_CHAR VALUES(3, 4, 1, 6);
INSERT INTO ACC_CHAR VALUES(3, 5, 55, 6);
INSERT INTO ACC_CHAR VALUES(3, 7, 90, 4);

INSERT INTO ACC_CHAR VALUES(4, 1, 20, 3);
INSERT INTO ACC_CHAR VALUES(4, 2, 15, 5);
INSERT INTO ACC_CHAR VALUES(4, 3, 20, 4);
INSERT INTO ACC_CHAR VALUES(4, 4, 20, 6);
INSERT INTO ACC_CHAR VALUES(4, 5, 55, 2);

-- SELECT * FROM ACC_CHAR;
-- SELECT * FROM ACC_CHAR WHERE aid=3;
-- SELECT * FROM ACC_CHAR WHERE cid=5;


INSERT INTO BATTLE(bname, map)
	VALUES("0-1 Collapse", "./map_img/main_00-01.png");
INSERT INTO BATTLE(bname, map)
	VALUES("1-7 The Tyrant", "./map_img/main_01-07.png");
INSERT INTO BATTLE(bname, map)
	VALUES("4-4 Nerves of Steel", "./map_img/main_04-04.png");
INSERT INTO BATTLE(bname, map)
	VALUES("6-16 Black Rabbit, White Rabbit", "./map_img/main_06-16.png");
INSERT INTO BATTLE(bname, map)
	VALUES("7-18 Death of a Patriot", "./map_img/main_07-18.png");

-- SELECT * FROM BATTLE;


INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(1, 1, "2019-05-01 12:23:00", 3);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, cid_5, cid_6, sk_1, sk_2, sk_3, sk_4, sk_5, sk_6)
	VALUES(1, 1, 5, 6, 7, 8, 9, 1, 1, 2, 3, 3, 3);

INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 1, "2019-05-01 12:48:00", 3);
INSERT INTO
	TEAM(vid, cid_1, sk_1)
	VALUES(2, 6, 2);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 2, "2020-04-01 13:33:56", 2);
INSERT INTO
	TEAM(vid, cid_1, cid_2, sk_1, sk_2)
	VALUES(3, 6, 7, 2, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 2, "2020-04-01 13:43:34", 3);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, sk_1, sk_2, sk_3)
	VALUES(4, 6, 7, 8, 2, 3, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 3, "2021-06-01 20:00:12", 0);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, sk_1, sk_2, sk_3, sk_4)
	VALUES(5, 6, 7, 8, 9, 2, 3, 3, 2);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 3, "2024-08-30 08:23:12", 2);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, sk_1, sk_2, sk_3, sk_4)
	VALUES(6, 6, 7, 8, 9, 2, 3, 3, 2);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 3, "2024-01-30 08:35:59", 3);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, sk_1, sk_2, sk_3, sk_4)
	VALUES(7, 6, 7, 8, 9, 2, 3, 3, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 4, "2024-01-30 08:43:28", 3);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, cid_5, sk_1, sk_2, sk_3, sk_4, sk_5)
	VALUES(8, 6, 7, 8, 9, 5, 2, 3, 3, 2, 1);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(2, 5, "2024-01-31 20:46:12", 3);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, cid_5, cid_6, sk_1, sk_2, sk_3, sk_4, sk_5, sk_6)
	VALUES(9, 6, 7, 8, 9, 5, 1, 2, 3, 3, 2, 1, 3);

INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(3, 1, "2022-07-30 21:23:46", 3);
INSERT INTO
	TEAM(vid, cid_1, sk_1)
	VALUES(10, 7, 1);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(3, 2, "2023-06-28 06:33:12", 3);
INSERT INTO
	TEAM(vid, cid_1, sk_1)
	VALUES(11, 7, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(3, 3, "2023-06-28 08:20:42", 3);
INSERT INTO
	TEAM(vid, cid_1, cid_2, sk_1, sk_2)
	VALUES(12, 1, 7, 1, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(3, 4, "2024-08-12 20:51:02", 0);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, sk_1, sk_2, sk_3, sk_4)
	VALUES(13, 1, 2, 3, 7, 1, 1, 1, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(3, 4, "2024-08-12 21:03:49", 0);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, sk_1, sk_2, sk_3, sk_4)
	VALUES(14, 1, 2, 3, 7, 1, 1, 1, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(3, 4, "2024-08-12 21:23:53", 0);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, sk_1, sk_2, sk_3, sk_4)
	VALUES(15, 1, 2, 3, 7, 1, 1, 1, 3);
INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(3, 4, "2024-08-12 21:43:59", 2);
INSERT INTO
	TEAM(vid, cid_1, cid_2, cid_3, cid_4, cid_5, cid_6, sk_1, sk_2, sk_3, sk_4, sk_5, sk_6)
	VALUES(16, 1, 2, 3, 4, 5, 7, 1, 1, 1, 1, 1, 3);

INSERT INTO EVENT(aid, bid, time, pass_state)
	VALUES(4, 1, "2024-03-22 15:22:43", 2);
INSERT INTO
	TEAM(vid)
	VALUES(17);

-- SELECT * FROM EVENT;
-- SELECT * FROM TEAM;

INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Originium Slug", 130, 0, 550);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Hound Pro", 260, 0, 1700);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Infused Glacial Originium Slug", 300, 0, 3200);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Sarkaz Greatswordsman", 600, 230, 7500);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Ursus Assault Crossbowman", 350, 200, 4000);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("FrostNova, Winters Scar", 440, 380, 30000);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Patriot", 1600, 500, 45000);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Jesselton Williams", 700, 400, 25000);
INSERT INTO ENEMY(ename, eatk, edef, ehp) VALUES("Crownslayer", 300, 150, 6000);
-- SELECT * FROM ENEMY;

INSERT INTO APPEAR VALUES(1, 1, 10);
INSERT INTO APPEAR VALUES(1, 8, 1);
INSERT INTO APPEAR VALUES(2, 1, 20);
INSERT INTO APPEAR VALUES(2, 2, 10);
INSERT INTO APPEAR VALUES(3, 2, 30);
INSERT INTO APPEAR VALUES(3, 4, 10);
INSERT INTO APPEAR VALUES(3, 9, 1);
INSERT INTO APPEAR VALUES(4, 1, 20);
INSERT INTO APPEAR VALUES(4, 3, 30);
INSERT INTO APPEAR VALUES(4, 4, 5);
INSERT INTO APPEAR VALUES(4, 6, 1);
INSERT INTO APPEAR VALUES(5, 1, 10);
INSERT INTO APPEAR VALUES(5, 2, 10);
INSERT INTO APPEAR VALUES(5, 4, 10);
INSERT INTO APPEAR VALUES(5, 5, 20);
INSERT INTO APPEAR VALUES(5, 7, 1);
-- SELECT * FROM APPEAR WHERE bid=5;