
--ejercicio 1:
SELECT 
    ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response), 0) AS percentage_strongly_agree
FROM nss
WHERE question = 'Q01'
  AND institution = 'Edinburgh Napier University'
  AND subject = '(8) Computer Science';

--ejercicio 2:
SELECT institution, subject
FROM nss
WHERE question = 'Q15'
  AND score >= 100;

--ejercicio 3:
SELECT institution, score
FROM nss
WHERE question = 'Q15'
  AND subject = '(8) Computer Science'
  AND score < 50;

--ejercicio 4:
SELECT subject, SUM(response) AS total_responses
FROM nss
WHERE question = 'Q22'
  AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

--ejercicio 5:
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100) AS total_strongly_agree
FROM nss
WHERE question = 'Q22'
  AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

--ejercicio 6:
SELECT subject, 
       ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response), 0) AS percentage_strongly_agree
FROM nss
WHERE question = 'Q22'
  AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

--ejercicio 7:
SELECT institution, 
       ROUND(SUM(response * score) / SUM(response), 0) AS average_score
FROM nss
WHERE question = 'Q22'
  AND institution LIKE '%Manchester%'
GROUP BY institution;

--ejercicio 8:
SELECT institution, 
       SUM(sample) AS total_sample_size,
       SUM(CASE WHEN subject = '(8) Computer Science' THEN sample ELSE 0 END) AS comp
FROM nss
WHERE question = 'Q01'
  AND institution LIKE '%Manchester%'
GROUP BY institution;