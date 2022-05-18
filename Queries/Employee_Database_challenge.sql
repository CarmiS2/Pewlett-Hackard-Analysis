-- Deliverable 1.a
Select e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date
INTO retirment_titles
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

--Deliverable 1.b
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirment_titles as e
WHERE (to_date = '9999-01-01')
ORDER BY e.emp_no, e.to_date DESC;

--Deliverable 1.c
SELECT COUNT(emp_no) as tic, 
	title
INTO retiring_titles
from unique_titles as u
group by title
order by tic DESC;

-- deliverable 2 

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date, 
	de.from_date, 
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');

SELECT COUNT(emp_no) as tic, 
	title
-- INTO retiring_titles
from mentorship_eligibility as u
group by title
order by tic DESC;
Select * from retiring_titles