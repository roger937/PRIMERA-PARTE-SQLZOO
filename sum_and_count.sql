
--ejercicio 1:
SELECT SUM(population)
FROM world

--ejercicio 2:
SELECT DISTINCT continent
FROM world

--ejercicio 3:
SELECT SUM(gdp) AS pib_total_africa
FROM world
WHERE continent = 'Africa'

--ejercicio 4:
SELECT COUNT(*) AS total_paises
FROM world
WHERE area >= 1000000

--ejercicio 5:
SELECT SUM(population) AS poblacion_total
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

--ejercicio 6:
SELECT continent, COUNT(name) AS numero_de_paises FROM world
GROUP BY continent

--ejercicio 7:
SELECT continent, COUNT(name) AS numero_de_paises
FROM world WHERE population >= 10000000
GROUP BY continent

--ejercicio 8:
SELECT continent FROM world GROUP BY continent
HAVING SUM(population) >= 100000000
