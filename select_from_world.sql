
--ejercicio 1:
SELECT name, continent, population FROM world

--ejercicio 2:
SELECT name FROM world
WHERE population >= 200000000

--ejercicio 3:
SELECT name , gdp/population
FROM world
WHERE population >= 200000000

--ejercicio 4:
SELECT name, population / 1000000 AS population_in_millions  
FROM world  
WHERE continent = 'South America'

--ejercicio 5:
SELECT name, population  
FROM world  
WHERE name IN ('France', 'Germany', 'Italy')

--ejercicio 6:
SELECT name  
FROM world  
WHERE name LIKE '%United%'

--ejercicio 7:
SELECT name, population, area  
FROM world  
WHERE area > 3000000  
   OR population > 250000000

--ejercicio 8:
SELECT name, population, area  
FROM world  
WHERE (area > 3000000 XOR population > 250000000)

--ejercicio 9:
SELECT name, 
       ROUND(population / 1000000, 2) AS population_in_millions, 
       ROUND(gdp / 1000000000, 2) AS gdp_in_billions  
FROM world  
WHERE continent = 'South America'

--ejercicio 10:
SELECT name, 
       ROUND(gdp / population, -3) AS gdp_per_capita  
FROM world  
WHERE gdp >= 1000000000000

--ejercicio 11:
SELECT name, capital  
FROM world  
WHERE LENGTH(name) = LENGTH(capital)

--ejercicio 12:
SELECT name, capital  
FROM world  
WHERE LEFT(name, 1) = LEFT(capital, 1)  
  AND name <> capital

--ejercicio 13:
SELECT name  
FROM world  
WHERE name LIKE '%a%'  
  AND name LIKE '%e%'  
  AND name LIKE '%i%'  
  AND name LIKE '%o%'  
  AND name LIKE '%u%'  
  AND name NOT LIKE '% %'
