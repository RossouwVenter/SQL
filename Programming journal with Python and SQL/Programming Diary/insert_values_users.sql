INSERT INTO users 
VALUES('Rolf','Smith'),
('John', 'Smith'),
('Anne','Pun'),
('Charlie','Graham'),
('Robert','Baratheon');


SELECT first_name,surname FROM users;

DROP TABLE IF EXISTS users;

SELECT * FROM users WHERE  surname = 'Smith';


