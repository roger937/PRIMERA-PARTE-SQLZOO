--join
--ejercicio 1:
SELECT matchid, player FROM goal
WHERE teamid = 'GER' ORDER BY matchid

--ejercicio 2:
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012

--ejercicio 3:
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid = 'GER';

--ejercicio 4:
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal ON game.id = goal.matchid
WHERE goal.player LIKE 'Mario%'

--ejercicio 5:
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal
JOIN eteam ON goal.teamid = eteam.id
WHERE goal.gtime <= 10;

--ejercicio 6:
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam ON game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';

--ejercicio 7:
SELECT goal.player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE game.stadium = 'National Stadium, Warsaw';

--ejercicio 8:
SELECT DISTINCT goal.player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE (game.team1 = 'GER' OR game.team2 = 'GER') AND goal.teamid != 'GER';

--ejercicio 9:
SELECT eteam.teamname, COUNT(*) AS total_goals
FROM goal
JOIN eteam ON goal.teamid = eteam.id
GROUP BY eteam.teamname;

--ejercicio 10:
SELECT game.stadium, COUNT(*) AS total_goals  
FROM game  
JOIN goal ON game.id = goal.matchid  
GROUP BY game.stadium;

--ejercicio 11:
SELECT game.id AS matchid, game.mdate, COUNT(*) AS total_goals  
FROM game  
JOIN goal ON game.id = goal.matchid  
WHERE game.team1 = 'POL' OR game.team2 = 'POL'  
GROUP BY game.id, game.mdate;

--ejercicio 12:
SELECT game.id AS matchid, game.mdate, COUNT(*) AS goals_by_GER  
FROM game  
JOIN goal ON game.id = goal.matchid  
WHERE goal.teamid = 'GER'  
GROUP BY game.id, game.mdate;

--ejercicio 13:
SELECT
    game.mdate,
    game.team1,
    SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
    game.team2,
    SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM
    game
LEFT JOIN
    goal ON game.id = goal.matchid
GROUP BY
    game.id, game.mdate, game.team1, game.team2
ORDER BY
    game.mdate, game.id, game.team1, game.team2;

