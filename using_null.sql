----using null

--ejercicio 1:
SELECT name
FROM teacher
WHERE dept IS NULL;

--ejercicio 2:
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id
WHERE dept.name IS NOT NULL;

--ejercicio 3:
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

--ejercicio 4:
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;

--ejercicio 5:
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile_number
FROM teacher;

--ejercicio 6:
SELECT teacher.name, COALESCE(dept.name, 'None') AS department
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

--ejercicio 7:
SELECT COUNT(name) AS teacher_count, COUNT(mobile) AS mobile_count
FROM teacher;

--ejercicio 8:
SELECT dept.name, COUNT(teacher.name) AS staff_count
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

--ejercicio 9:
SELECT name,
       CASE
           WHEN dept IN (1, 2) THEN 'Sci'
           ELSE 'Art'
       END AS department_type
FROM teacher;

--ejercicio 10:
SELECT name,
       CASE
           WHEN dept IN (1, 2) THEN 'Sci'
           WHEN dept = 3 THEN 'Art'
           ELSE 'None'
       END AS department_type
FROM teacher;

