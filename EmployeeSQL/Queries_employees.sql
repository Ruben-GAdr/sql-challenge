
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT Emp.emp_no, Emp.last_name, Emp.first_name, Emp.sex, salaries.salary
FROM employees as Emp
JOIN salaries ON Emp.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT Emp.first_name, Emp.last_name, Emp.hire_date
FROM employees as Emp
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dp_m.dept_no, dps.dept_name, dp_m.emp_no, emp.last_name, emp.first_name
FROM dept_mng As dp_m
JOIN departments As dps ON dp_m.dept_no = dps.dept_no
JOIN employees As emp ON dp_m.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dps.dept_no, emp.emp_no, emp.last_name, emp.first_name, dps.dept_name
FROM employees As emp
JOIN dept_empl As dp_e ON emp.emp_no = dp_e.emp_no
JOIN departments As dps ON dp_e.dept_no = dps.dept_no
ORDER BY dps.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees as emp
WHERE first_name = 'Hercules' and last_name LIKE 'B%'
ORDER BY emp.sex, emp.last_name;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dps.dept_name
FROM employees as emp
JOIN dept_empl as dp_e ON emp.emp_no = dp_e.emp_no
JOIN departments as dps ON dp_e.dept_no = dps.dept_no
WHERE dps.dept_name  = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dps.dept_name
FROM employees as emp
JOIN dept_empl as dp_E ON emp.emp_no = dp_E.emp_no
JOIN departments as dps ON dp_e.dept_no = dps.dept_no
WHERE dps.dept_name in ('Sales','Development')


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT emp.last_name, COUNT(emp.last_name) AS "Frequency count"
FROM employees as emp
GROUP BY last_name
ORDER BY "Frequency count" DESC;
