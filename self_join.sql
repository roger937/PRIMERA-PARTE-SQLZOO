---- self join
--ejercicio 1:
SELECT COUNT(*) AS total_stops FROM stops;

--ejercicio 2:
SELECT id FROM stops WHERE name = 'Craiglockhart';

--ejercicio 3:
SELECT stops.id, stops.name
FROM stops
JOIN route ON stops.id = route.stop
WHERE route.num = '4' 
AND route.company = 'LRT';

--ejercicio 4:
SELECT company, num, COUNT(*) AS stop_count
FROM route
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

--ejercicio 5:
SELECT a.company, a.num, a.stop AS from_stop, b.stop AS to_stop
FROM route a 
JOIN route b 
ON a.company = b.company AND a.num = b.num
WHERE a.stop = 53 AND b.stop = 149;

--ejercicio 6:
SELECT a.company, a.num, stopa.name AS from_stop, stopb.name AS to_stop
FROM route a 
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' 
  AND stopb.name = 'London Road';

--ejercicio 7:
SELECT DISTINCT a.company, a.num
FROM route a 
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Haymarket' 
  AND stopb.name = 'Leith';

--ejercicio 8:
SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' 
  AND stopb.name = 'Tollcross';
