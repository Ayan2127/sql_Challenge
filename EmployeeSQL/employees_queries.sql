--CREATED TABLES WITH CONSTRAINTS (PK, FK)-- 
--THEN IMPORTED DATA TO EACH CORRESPONDING TABLE
--TO START THE CHALLENGE


--List employee number, last name, first name
--sex, and salary of EACH employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries as s
ON (e.emp_no = s.emp_no);

--List the first name, last name, 
--and hire date for the employees who were hired in 1986.
--SET WHERE HIRE_DATE STATEMENTS SO THAT IT ACCOUNTS & AGGREGATES
--FOR ALL MONTHS WITHIN 1986--SINCE HIRE_DATE IS IN DATE FORMAT
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date >= '01/01/1986'
AND hire_date <= '12/31/1986'
ORDER BY hire_date;

--List the manager of each department along with their department number
-- department name, employee number, last name, and first name
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager as dept
JOIN departments as d
ON (d.dept_no = dept.dept_no) 
JOIN employees as e
ON (e.emp_no = dept.emp_no);

--List the department number for EACH employee 
--along with that employee’s employee number, last name, 
--first name, and department name.
--LISTS ALL EMPLOYEES WITH CORRESPONDING DEPT_NO & DEPT_NAME
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as dept_e
ON (e.emp_no = dept_e.emp_no)
JOIN departments as d
ON (d.dept_no = dept_e.dept_no);

--List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins 
--with the letter B.
--SOURCE for finding specific letter of name in SQL:https://www.geeksforgeeks.org/sql-query-to-find-the-name-of-a-person-whose-name-starts-with-specific-letter/
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each employee in the Sales department 
--including their employee number, last name, and first name
--LISTS EVERY EMPLOYEE IN SALES ONLY, WHERE STATEMENT USED
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp as dept_e
JOIN employees as e
ON (e.emp_no = dept_e.emp_no)
JOIN departments as d
ON (d.dept_no = dept_e.dept_no)
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments
--including their employee number, last name, first name
--and department name.
--LISTS EVERY EMPLOYEE IN SALES OR DEVELOPMENT
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp as dept_e
JOIN employees as e
ON (e.emp_no = dept_e.emp_no)
JOIN departments as d
ON (d.dept_no = dept_e.dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--List the frequency counts, in descending order
--of all the employee last names 
--(that is, how many employees share each last name).
--COUNT OF LAST NAMES FOR EACH LAST NAME
Select last_name, count(last_name) as "Last_Name_Frequency"
FROM employees
Group by last_name
ORDER BY "Last_Name_Frequency" DESC;

