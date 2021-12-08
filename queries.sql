queries.sql
-- drop table with cascade to delete all ties
-- who is to retire? 1952-55
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- who is to retire? 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- who is to retire? 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- who is to retire? 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- change select to select into (saves as a new table)
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- see new table
SELECT * FROM retirement_info;

-- Drop retirement info table
DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables (o-code, w/alias below)
-- SELECT departments.dept_name,
     -- dept_manager.emp_no,
     --dept_manager.from_date,
     --dept_manager.to_date
--FROM departments
--INNER JOIN dept_manager
--ON departments.dept_no = dept_manager.dept_no;

--same code with alias
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables (o-code, w/alias below)
--SELECT retirement_info.emp_no,
    --retirement_info.first_name,
    --retirement_info.last_name,
    --dept_emp.to_date
	--FROM retirement_info
	--LEFT JOIN dept_emp
	--ON retirement_info.emp_no = dept_emp.emp_no;

--	same code with alias' (ri=ret_info, de=dept_emp, FROM/LJOIN defines new alias)
SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

--ri-eligable emp (Ljoin ri-de; new table=into)
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');--filter

-- Employee count by department number
-- Employee count by department number then add order to order op
SELECT COUNT(ce.emp_no), de.dept_no
INTO ce_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;


--employee info list
SELECT * FROM salaries
ORDER BY to_date DESC;

-- same info as before
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--want to add age, gender
SELECT emp_no,
    first_name,
	last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
-- join to salaries, add to_date
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	  AND (de.to_date = '9999-01-01');

 -- List of managers per department???why only 5dept with man?
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

-- list of dept retireees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info ???why some 2x???
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

--info relevant to sales 7.3.6
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name = 'Sales'

--infor sales and dev
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name = 'Sales'OR Departments.dept_name = 'Development';
