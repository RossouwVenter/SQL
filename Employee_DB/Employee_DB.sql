create table Employee(
	First_name char(50),
	Last_name char(50),
	Personal_ID char(13),
	Employee_ID bigserial,
	Email varchar(50),
	Date_of_Employment date,
	Department_ID serial REFERENCES Department (Department_ID),
	Salary_ID serial REFERENCES Salaries (Salary_ID),
	Titles_id serial REFERENCES Titles (Titles_ID),
	Overtime_ID serial REFERENCES overtime (Overtime_ID),
	Salary_Increase_ID bigserial REFERENCES Salary (Salary_Increase),
	Constraint Employee_key Primary key (Employee_iD)	
);

create table Department(
	Department_ID serial,
	Marketing varchar(50),
	Operations varchar(50),
	Sales varchar(50),
	IT varchar(50),
	Engineering varchar(50),
	Management varchar(50),
	constraint Department_Key Primary key (department_ID)
);
Create Table Salaries(
	Salary_ID serial,
	Titles varchar(50),
	Salary numeric(10,2),
	constraint salary_key Primary Key (Salary_ID)
);

create table Titles(
	Titles_ID serial,
	CONSTRAINT Titles_key PRIMARY KEY(Titles_ID)
);
create table Overtime_hours(
	Overtime_ID serial,
	Overtime_Salary numeric(10,2),
	overtime_hours int,
	CONSTRAINT Overtime_key PRIMARY KEY (Overtime_ID)
);
create table Salary_Increase(
	Salary_Increase_ID bigserial,
	Salary_increase numeric(10,2),
	Bonus numeric,
	constraint Salary_Icrease_ID PRIMARY KEY (Salary_Increase_ID)
);
	