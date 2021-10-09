
-- Use Dictinct with Orderby to remove duplicate rows

DROP TABLE unique_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles

FROM retirement_titles 
ORDER BY
emp_no ASC, to_date DESC, title DESC;

SELECT * FROM unique_titles; 

DROP TABLE retiring_titles;
CREATE TABLE retiring_titles(count INTEGER NOT NULL, 
title VARCHAR(50) NOT NULL);

SELECT COUNT(title) as count, title FROM unique_titles GROUP BY title ORDER BY count DESC; 

DROP TABLE mentorsihip_eligibiity;

--CREATE TABLE mentorsihip_eligibiity(emp_no INT NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
birth_date DATE NOT NULL,
from_date DATE NOT NULL ,
to_date DATE NOT NULL,
title VARCHAR(30));

DROP TABLE mentorsihip_eligibiity;

SELECT * FROM mentorsihip_eligibiity;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;
DROP TABLE torsihip_eligibility;
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
birth_date

INTO mentorsihip_eligibility


FROM employees

ORDER BY
emp_no ASC;
DROP TABLE new_employees;
SELECT * FROM mentorsihip_eligibility;


SELECT 	employees.emp_no,
		employees.first_name,
     	employees.last_name,
		employees.birth_date,
		dept_emp.from_date,
		dept_emp.to_date
	 INTO new_employees
FROM employees	 
RIGHT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
;

DROP TABLE mentorsihip_eligibility;

SELECT * FROM new_employees;

SELECT 	new_employees.emp_no,
		new_employees.first_name,
     	new_employees.last_name,
		new_employees.birth_date,
		new_employees.from_date,
		new_employees.to_date,
		titles.title
	 INTO mentorsihip_eligibility
FROM new_employees	 
RIGHT JOIN titles
ON new_employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no
;

SELECT * FROM mentorsihip_eligibility;
