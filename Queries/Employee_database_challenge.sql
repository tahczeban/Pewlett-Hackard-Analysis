-DELIVERABLE 1
--1,2 retrieve emp no/1st name/last name cols from employees table, title/from/to date from t.
SELECT emp_no, first_name, last_name
from employees AS e
SELECT title, from_date, to_date
FROM titles AS t
--3 create retirement_titles table using into clause	 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles 
--4, 5 join both tables on primary key (emp_no), filter data for b date
FROM employees AS e
	INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
--disply retirement_titles table to check
SELECT * FROM retirement_titles 

--6-13 sort unique titles table 
SELECT DISTINCT ON (emp_no)emp_no,
	first_name,
	last_name,
	title,
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC,to_date DESC;
SELECT * FROM unique_titles

--16-19 retiring titles table
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;
SELECT * FROM retiring_titles

--DELIVERABLE 2
--1-11 retrieve info from e, from-to from de, distinct on(), 
--mentorship eligibility table
SELECT DISTINCT ON (e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
ON (E.EMP_NO = de.EMP_NO)
INNER JOIN titles as t
ON (E.EMP_NO = t.EMP_NO)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01') ORDER BY EMP_NO ;
SELECT * FROM mentorship_eligibilty
