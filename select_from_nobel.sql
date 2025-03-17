
--ejercicio 1:
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--ejercicio 2:
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

--ejercicio 3:
SELECT yr, subject  
FROM nobel  
WHERE winner = 'Albert Einstein'

--ejercicio 4:
SELECT winner  
FROM nobel  
WHERE subject = 'Peace'  
  AND yr >= 2000

--ejercicio 5:
SELECT yr, subject, winner  
FROM nobel  
WHERE subject = 'Literature'  
  AND yr BETWEEN 1980 AND 1989

--ejercicio 6:
SELECT *  
FROM nobel  
WHERE winner IN ('Theodore Roosevelt', 
                 'Thomas Woodrow Wilson',
                 'Jimmy Carter', 
                 'Barack Obama')

--ejercicio 7:
SELECT *  
FROM nobel  
WHERE winner LIKE '%John%'

--ejercicio 8:
SELECT yr, subject, winner  
FROM nobel  
WHERE (subject = 'Physics' AND yr = 1980)  
   OR (subject = 'Chemistry' AND yr = 1984)

--ejercicio 9:
SELECT yr, subject, winner  
FROM nobel  
WHERE yr = 1980  
  AND subject NOT IN ('Chemistry', 'Medicine')

--ejercicio 10:
SELECT yr, subject, winner  
FROM nobel  
WHERE (subject = 'Medicine' AND yr < 1910)  
   OR (subject = 'Literature' AND yr >= 2004)

--ejercicio 11:
SELECT *  FROM nobel  
WHERE winner = 'PETER GRÜNBERG'

--ejercicio 12:
SELECT *  FROM nobel  
WHERE winner = 'EUGENE O''NEILL'

--ejercicio 13:
SELECT winner, yr, subject  
FROM nobel  
WHERE winner LIKE 'Sir%'  
ORDER BY yr DESC, winner ASC

--ejercicio 14:
SELECT winner, subject  
FROM nobel  
WHERE yr = 1984  
ORDER BY (subject IN ('Physics', 'Chemistry')), subject, winner
