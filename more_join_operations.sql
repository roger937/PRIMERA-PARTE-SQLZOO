
--ejercicio 1:
SELECT id, title
 FROM movie
 WHERE yr=1962

--ejercicio 2:
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

--ejercicio 3:
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

--ejercicio 4:
SELECT id
FROM actor
WHERE name = 'Glenn Close';

--ejercicio 5:
SELECT id
FROM movie
WHERE title = 'Casablanca';

--ejercicio 6:
SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid = 11768;

--ejercicio 7:
SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Alien';

--ejercicio 8:
SELECT movie.title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford';

--ejercicio 9:
SELECT movie.title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1;

--ejercicio 10:
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1962 AND casting.ord = 1;

--ejercicio 11:
SELECT yr, COUNT(title)
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

--ejercicio 12:
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.id IN (
    SELECT movieid
    FROM casting
    WHERE actorid IN (
        SELECT id
        FROM actor
        WHERE name = 'Julie Andrews'
    )
) AND casting.ord = 1;

--ejercicio 13:
SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15
ORDER BY actor.name;

--ejercicio 14:
SELECT movie.title, COUNT(actor.id) AS num_actors
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY num_actors DESC, movie.title;

--ejercicio 15:
SELECT DISTINCT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.id IN (
    SELECT movieid
    FROM casting
    WHERE actorid IN (
        SELECT id
        FROM actor
        WHERE name = 'Art Garfunkel'
    )
) AND actor.name != 'Art Garfunkel';