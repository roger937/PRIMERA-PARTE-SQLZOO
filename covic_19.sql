---covic 19
--ejercicio 1:
SELECT name, DAY(whn),
 confirmed, deaths, recovered
 FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

--ejercicio 2:
SELECT name, 
       DAY(whn) AS day, 
       confirmed, 
       LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS previous_day_confirmed
FROM covid
WHERE name = 'Italy'
  AND MONTH(whn) = 3 
  AND YEAR(whn) = 2020
ORDER BY whn;

--ejercicio 3:
SELECT name, 
       DAY(whn) AS DÍA, 
       confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS nuevo
FROM covid
WHERE name = 'Italy'
  AND MONTH(whn) = 3 
  AND YEAR(whn) = 2020
ORDER BY whn;

--ejercicio 4:
SELECT name, 
       DATE_FORMAT(whn, '%Y-%m-%d') AS formatted_date,
       confirmed - LAG(confirmed) OVER (PARTITION BY name ORDER BY whn) AS new_this_week
FROM covid
WHERE name = 'Italy'
  AND WEEKDAY(whn) = 0  
  AND YEAR(whn) = 2020
ORDER BY whn;

--ejercicio 5:
SELECT tw.name, 
       DATE_FORMAT(tw.whn, '%Y-%m-%d') AS formatted_date, 
       (tw.confirmed - lw.confirmed) AS new_this_week
FROM covid tw 
LEFT JOIN covid lw 
    ON DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn
    AND tw.name = lw.name
WHERE tw.name = 'Italy'
  AND WEEKDAY(tw.whn) = 0  
ORDER BY tw.whn;

--ejercicio 6:
SELECT 
   name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) AS confirmed_rank,
   deaths,
   RANK() OVER (ORDER BY deaths DESC) AS deaths_rank
FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC;