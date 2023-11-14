SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE student.end_date IS NULL
GROUP By students.name
ORDER BY avg(assignment_submissions.duration) DESC;



