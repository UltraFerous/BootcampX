SELECT cohorts.name as cohort, COUNT(assignment_submissions.*) as total_submissions
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP By cohorts.name
ORDER BY COUNT(assignment_submissions.*) DESC
