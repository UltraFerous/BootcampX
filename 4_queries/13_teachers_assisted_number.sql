SELECT DISTINCT teachers.name, cohorts.name, COUNT(assistance_requests)
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON students.cohort_id = cohorts.id
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name;
