USE practical_exam;

-- S2a: Average score by department (lowest first)
SELECT c.department, ROUND(AVG(a.score), 2) AS avg_score
FROM assessments a
JOIN courses c ON a.course_id = c.course_id
GROUP BY c.department
ORDER BY avg_score ASC;

-- S2b: Underperforming courses (average score below 60)
SELECT c.course, ROUND(AVG(a.score), 2) AS avg_score
FROM assessments a
JOIN courses c ON a.course_id = c.course_id
GROUP BY c.course
HAVING AVG(a.score) < 60
ORDER BY avg_score ASC;

-- S2c: Top two batches by average score (ties: alphabetical batch)
SELECT batch, ROUND(AVG(score), 2) AS avg_score
FROM assessments
GROUP BY batch
ORDER BY avg_score DESC, batch ASC
LIMIT 2;

-- S3: Integrity check - LEFT JOIN from courses to assessments
-- Courses with no matching assessment rows (zero expected)
SELECT c.course_id, c.course
FROM courses c
LEFT JOIN assessments a ON c.course_id = a.course_id
WHERE a.assessment_id IS NULL;

-- S3 (extra): Orphan keys - assessment rows with no lookup match (zero expected)
SELECT a.assessment_id, a.course_id
FROM assessments a
LEFT JOIN courses c ON a.course_id = c.course_id
WHERE c.course_id IS NULL;
