---window function
--ejercicio 1:
SELECT lastName, party, votes
FROM ge
WHERE constituency = 'S14000024'
  AND yr = 2017
ORDER BY votes DESC;

--ejercicio 2:
SELECT party, votes, 
       RANK() OVER (ORDER BY votes DESC) AS posn
FROM ge
WHERE constituency = 'S14000024'
  AND yr = 2017
ORDER BY party;

--ejercicio 3:
SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
ORDER BY party,yr

--ejercicio 4:
SELECT constituency, 
       party, 
       votes, 
       RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS posn
FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
  AND yr = 2017
ORDER BY posn, constituency;

--ejercicio 5:
SELECT constituency, party
FROM (
    SELECT constituency, 
           party, 
           RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS posn
    FROM ge
    WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
      AND yr = 2017
) AS ranked
WHERE posn = 1
ORDER BY constituency;

--ejercicio 6:
SELECT party, COUNT(1) AS seats_won
FROM ge
WHERE constituency LIKE 'S%'  
  AND yr = 2017
  AND votes = (SELECT MAX(votes) 
               FROM ge AS sub 
               WHERE sub.constituency = ge.constituency 
                 AND sub.yr = ge.yr)  
GROUP BY party
ORDER BY 
  CASE WHEN party = 'SNP' THEN 1 ELSE 0 END, 
  seats_won DESC;
