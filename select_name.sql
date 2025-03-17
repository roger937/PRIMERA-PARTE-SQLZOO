---select names
--ejercicio 1:
SELECT name FROM world
  WHERE name LIKE 'Y%'

--ejercicio 2:
SELECT name FROM world
  WHERE name LIKE '%y'

--ejercicio 3:
SELECT name FROM world
  WHERE name LIKE '%X%'

--ejercicio 4:
SELECT name FROM world
  WHERE name LIKE '%land'

--ejercicio 5:
SELECT name FROM world
  WHERE name LIKE 'C%ia'

--ejercicio 6:
SELECT name FROM world
  WHERE name LIKE '%oo%'

--ejercicio 7:
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

--ejercicio 8:
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

--ejercicio 9:
SELECT name FROM world
 WHERE name LIKE '%o__o%'

--ejercicio 10:
SELECT name  
FROM world  
WHERE name = capital

--ejercicio 11:
SELECT name  
FROM world  
WHERE capital = CONCAT(name,' City')

--ejercicio 12:
SELECT capital, name  
FROM world  
WHERE capital LIKE CONCAT('%', name, '%')

--ejercicio 13:
SELECT capital, name  
FROM world  
WHERE capital LIKE CONCAT(name, '%') 
AND capital <> name

--ejercicio 14:
SELECT name, REPLACE(capital, name, '') AS extension  
FROM world  
WHERE capital LIKE CONCAT(name, '%')  
AND REPLACE(capital, name, '') <> ''