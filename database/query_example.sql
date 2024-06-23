
CALL VerifyLoginAndGetAids('admin', 'admin');

SELECT GetMaxPassedBid(2);

CALL GetBattleInfo('6-16 Black Rabbit, White Rabbit');

CALL GetCharacterInfo(1, 'Amiya');

CALL GetHighLevelCharacters(1, 50);

CALL CountHighLevelCharacters(1,50);

CALL CountLevelsPlayed(3,2024);

CALL CountCharacterUsage(3,2024, 'Amiya');

CALL AnnualLoginDays(3, 2024);

SELECT GetMostActiveBattleDay(3);

CALL GetFirstVictoryDetails(3, '0-1 Collapse');

CALL GetEnemyDefeatCount(1, 'Originium Slug');