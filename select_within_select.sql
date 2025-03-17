
--ejercicio 1:
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--ejercicio 2:
SELECT name
FROM world
WHERE continent ='Europe' AND 
     gdp/population > ( 
   SELECT gdp/population
     FROM world
     WHERE name = 'United Kingdom' )

--ejercicio 3:
SELECT name, continent  
FROM world  
WHERE continent IN ('South America', 'Oceania')  
ORDER BY name

--ejercicio 4:
SELECT name, population  
FROM world  
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom')  
AND population < (SELECT population FROM world WHERE name = 'Germany')

--ejercicio 5:
SELECT name, 
       CONCAT(ROUND(100 * population / (SELECT population FROM world WHERE name = 'Germany')),     '%') 
FROM world
WHERE continent = 'Europe'

--ejercicio 6:
SELECT name
FROM world
WHERE gdp > (
    SELECT MAX(gdp)
    FROM world
    WHERE continent = 'Europe'
)

--ejercicio 7:
SELECT continent, name, area
FROM world w1
WHERE area = (
    SELECT MAX(area)
    FROM world w2
    WHERE w1.continent = w2.continent
)

--ejercicio 8:
SELECT continent, name
FROM world w1
WHERE name = (
    SELECT MIN(name) 
    FROM world w2
    WHERE w1.continent = w2.continent
)

--ejercicio 9:
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    GROUP BY continent
    HAVING MAX(population) <= 25000000
)

--ejercicio 10:
FROM world w1
WHERE w1.population >= 3 * (
    SELECT MAX(w2.population)
    FROM world w2
    WHERE w2.continent = w1.continent
    AND w2.name <> w1.name
)
