SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignments.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP By students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg(assignment_submissions.duration) ASC;



