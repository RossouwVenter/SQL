select * from salary_increase;

insert into salary_increase (salary_increase,Bonus)
values(90000,50000),
(50000,25000),
(100000,50000),
(30000,15000),
(75000,34000);
--------------------------------------------------
select * from titles;
insert into titles(title_name)
values('Intern'),
('Junior'),
('Manager'),
('CEO'),
('Senior');
-------------------------------------------------
select * from employee;

insert into employee (first_name,last_name,personal_id,email,date_of_employment,)
values('Jhon','SMITH','9875023219608','john.smith@gmail.com','2002-02-13'),
('Harry','JOHNSON','9875023219608','harry.johnson@gmail.com','2002-03-01'),
('Philip','WILLIAMS','7075023219608','philip.williams@gmail.com','1980-05-18'),
('Peter','JONES','200123219608','peter.jones@gmail.com','2004-09-25'),
('Dwyane','Jones','8005023219608','dwyane.jones@gmail.com','1999-10-05');

alter table employee
drop column emp_id;
alter table employee
add column emp_id serial primary key;