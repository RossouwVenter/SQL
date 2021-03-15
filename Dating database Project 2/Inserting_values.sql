select * from interests

INSERT INTO interests(interest)
VALUES ('Sports'),
	   ('Hiking'),
	   ('Nature'),
	   ('Kulture'),
	   ('Music'),
	   ('Cars'),
	   ('Animals');
---------------------------------------
SELECT * FROM profession

INSERT INTO profession(profession)
VALUES	('IT'),
		('Profesional sportsman'),
		('Builder'),
		('Farmer'),
		('Salesman'),
		('Assistant'),
		('CEO');
--------------------------------------
SELECT * FROM  status

INSERT INTO status(status)
VALUES 	('Single'),
		('Single'),
		('Single'),
		('Single'),
		('Single'),
		('Single'),
		('Single');
-------------------------------------
SELECT * FROM zip_code

INSERT INTO zip_code(province,city)
VALUES 	('Gauteng','Pretoria'),
		('North West','Potchefstroom'),
		('Freestate','Bloemfontein'),
		('Northern Cape','Upington'),
		('KZN','Durban'),
		('Mpumalanga','Nelspruit'),
		('Eastern Cape','George');
--------------------------------------
SELECT * FROM seeking

INSERT INTO seeking (seeking)
VALUES 	('Male'),
		('Female'),
		('Male or Female'),
		('Male'),
		('Female'),
		('Male'),
		('Male or Female');
-------------------------------------
SELECT * FROM my_contacts

INSERT INTO my_contacts(last_name,first_name,phone,email,gender,birthday)
VALUES ('Adler','James',0815533625,'adlerjames@gmail.com','Female',1980-06-18),
('Anderson','Mike',0766145038 ,'anderson.jamer@gmail.com','Male',1999-07-30),
('Beckett','Robert',0829034724,'beckett.robert@gmail.co.za','Male',2000-08-20),
('Brady','Charnan',0846706149,'brady.charnan@mail.co.za','Female',1978-08-13),
('Carson','Michael',0845134527,'michael.carson@gmail.com','Male',2003-01-01),
('Carter','Elizabeth',0845440635,'elizabethcarter@gmail.co.za','Female',1988-10-15),
('Jennings','Sarah',0831018326,'sarah.jennings@gmail.com','Female',1995-07-14);

		