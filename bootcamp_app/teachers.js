const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
    SELECT DISTINCT teachers.name as teacher_name, cohorts.name as cohort_name
    FROM assistance_requests
    JOIN students ON students.id = student_id
    JOIN cohorts ON students.cohort_id = cohorts.id
    JOIN teachers ON teachers.id = assistance_requests.teacher_id
    WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
    ORDER BY teacher_name
    `)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort_name}: ${user.teacher_name}`);
    });
    process.exit();
  })
  .catch(err => {
    console.log(err.message);
    process.exit();
  });
