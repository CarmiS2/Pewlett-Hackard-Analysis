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
