/* JOIN OPERATION
http://sqlzoo.net/wiki/The_JOIN_operation
*/

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'


SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012


SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'


SELECT team1, team2, player
FROM game 
INNER JOIN goal 
ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'


SELECT player, teamid, coach, gtime
  FROM goal 
JOIN eteam ON teamid=id
 WHERE gtime<=10


SELECT mdate, teamname 
FROM game 
JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'; 


SELECT player 
FROM goal
JOIN game 
ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw'


SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE (team1='GER' OR team2='GER')
    AND teamid!='GER'

SELECT teamname, count(matchid)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
 ORDER BY teamname


SELECT stadium, COUNT(matchid)
FROM game 
join goal ON (id = matchid)
GROUP BY stadium


SELECT game.id, game.mdate, COUNT(*)
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE (game.team1 = 'POL' OR game.team2 = 'POL')
GROUP BY game.id, game.mdate
ORDER BY game.id;


SELECT game.id, game.mdate, COUNT(*)
FROM game
JOIN goal
ON goal.matchid = game.id
WHERE goal.teamid = 'GER'
GROUP BY game.id, game.mdate;

###### Completed up to 12