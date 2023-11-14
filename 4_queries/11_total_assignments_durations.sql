SELECT day, COUNT(assignments), SUM(duration)
FROM assignments
GROUP BY assignments.day
ORDER BY day;