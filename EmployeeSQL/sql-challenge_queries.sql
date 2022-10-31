
-- *** DATA ANALYSIS ***

-- 1) List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee AS e
INNER JOIN salary AS s ON e.emp_no = s.emp_no;


-- 2) List the first name, last name, and hire date for the employees who were hired in 1986.
-- Solution 1 - date_part
SELECT last_name, first_name, hire_date
FROM employee
WHERE date_part('year', hire_date) = '1986';
-- Solution 2 - BETWEEN
SELECT last_name, first_name, hire_date
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- 3) List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN department AS d ON dm.dept_no = d.dept_no
INNER JOIN employee AS e ON e.emp_no = dm.emp_no;


-- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN department AS d ON de.dept_no = d.dept_no
INNER JOIN employee AS e ON e.emp_no = de.emp_no;

-- Script to test the results from question 4
SELECT first_name, last_name, emp_no
FROM employee
WHERE first_name = 'Karoline'
AND last_name = 'Cesareni';

-- Script to test the results from question 4
SELECT * FROM dept_emp
WHERE emp_no = 10228;


-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6) List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN department AS d ON de.dept_no = d.dept_no
INNER JOIN employee AS e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';


-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN department AS d ON de.dept_no = d.dept_no
INNER JOIN employee AS e ON e.emp_no = de.emp_no
WHERE dept_name IN ('Sales','Development');


-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS count_last_name
FROM employee 
GROUP BY last_name
ORDER BY last_name DESC;


-- *** BONUS ***

-- Average salary by title.
SELECT  t.title, round(avg(s.salary),2) AS average_salary
FROM title AS t
INNER JOIN employee AS e ON t.title_id = e.emp_title_id
INNER JOIN salary AS s ON s.emp_no = e.emp_no
GROUP BY t.title