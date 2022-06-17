-- 1. I want to know how many employees with each title were born after 1965-01-01. 

SELECT
	t.title,
    count(t.title) AS 'employee count'
FROM titles t
JOIN employees e
	ON t.emp_no = e.emp_no
WHERE e.birth_date > '1965-01-01'
GROUP BY t.title

----------------------------------------------------------------

-- 2. I want to know the average salary per title. 

SELECT 
	t.title,
    avg(s.salary) AS avg_salary
FROM titles t
JOIN salaries s
	ON t.emp_no = s.emp_no
GROUP BY t.title

----------------------------------------------------------------

-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992? 

SELECT
	sum(s.salary) AS salary_spent
FROM salaries s
JOIN dept_emp de
	ON s.emp_no = de.emp_no
WHERE de.dept_no = 'd001' 
	AND s.from_date > '1990-01-01' 
    AND s.from_date < '1993-01-01'