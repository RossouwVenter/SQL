select employee.first_name,employee.last_name,
	department.department_name,
	salaries.salary,
	titles.Title_name,
	overtime_hours.Overtime_hours 
	FROM employee LEFT JOIN department
	ON employee.department_id = department.department_id
	LEFT JOIN salaries 
	ON employee.salary_id = salaries.salary_id
	LEFT JOIN salary_increase
	ON employee.salary_increase_id = salary_increase.salary_increase_id
	LEFT JOIN titles
	ON employee.titles_id = titles.title_id
	LEFT JOIN overtime_hours 
	ON employee.overtime_id = overtime_hours.overtime_id;
