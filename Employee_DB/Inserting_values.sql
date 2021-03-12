--Select * from employee 
INSERT INTO employee (first_name,last_name,Personal_id,email,date_of_employment)
values ('Jose','Martin','8721568749125','jose.martin@gmail.com','2002-08-23'),
		('Madden','Long','9321468597152','madden,long@gmail.com','2004-09-15'),
		('Triston','Dalton','9501234781068','triston.dalton@gmail.com','1995-01-26'),
		('Alexis','Larson','7851803604912','alexis.larson@gmail.com','2000-05-13'),
		('Rylee','Daniel','8620541935267','rylee,daniel@gmail.com','1999-05-16');
		
select * from department;
alter Table department 
drop column marketing,
drop column operations,
drop column sales,
drop column it,
drop column engineering,
drop column management;
--------------------------------------------------
alter Table department
add column department_name varchar(50);
-------------------------------------------------

