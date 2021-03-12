CREATE TABLE meat_poultry_egg_inspect (
    est_number varchar(50) CONSTRAINT est_number_key PRIMARY KEY,
    company varchar(100),
    street varchar(100),
    city varchar(30),
    st varchar(2),
    zip varchar(5),
    phone varchar(14),
    grant_date date,
    activities text,
    dbas text
);

COPY meat_poultry_egg_inspect
FROM 'C:\Users\rosso\OneDrive\Desktop\Resources SQL\practical-sql-master\practical-sql-master\Chapter_09\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

CREATE INDEX company_idx ON meat_poultry_egg_inspect (company);

-- Count the rows imported:
SELECT count(*) FROM meat_poultry_egg_inspect;
-------------------------------------------------------
--Interviewing the Data Set
SELECT company,
 street,
 city,
 st,
 count(*) AS address_count
FROM meat_poultry_egg_inspect
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;
---------------------------------------------------------
--Checking for missing values:
SELECT st,
 count(*) AS st_count
FROM meat_poultry_egg_inspect
GROUP BY st
ORDER BY st;
-- or use:
SELECT est_number,
 company,
 city,
 st,
 zip
FROM meat_poultry_egg_inspect
WHERE st IS NULL;
----
--finding city and state from zip code:
select  est_number,
 company,
 city,
 st,
 zip
 from meat_poultry_egg_inspect
 where zip like '53538' or zip like '36671' or zip like '55449';
 ---------------------------
 -- Checking for inconsistent data values:
 SELECT company,
 count(*) AS company_count
FROM meat_poultry_egg_inspect
GROUP BY company
ORDER BY company ASC;
-----------------------------------
--Checking for Malformed Values Using length()
SELECT length(zip),
 count(*) AS length_count
FROM meat_poultry_egg_inspect
GROUP BY length(zip)
ORDER BY length(zip) ASC;
--------------------------------------
--Modifying Tables, Columns, and Data
---Modifying Tables with ALTER TABLE-- rename a table or column
ALTER TABLE table ADD COLUMN column data_type;
-----------------------------------------
--Creating Backup Tables
CREATE TABLE meat_poultry_egg_inspect_backup AS
SELECT * FROM meat_poultry_egg_inspect;
-------------------------
--Comparing between the backups
SELECT
 (SELECT count(*) FROM meat_poultry_egg_inspect) AS original,
 (SELECT count(*) FROM meat_poultry_egg_inspect_backup) AS backup;
-------------------------
--Creating a Column Copy
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN st_copy varchar(2);

UPDATE meat_poultry_egg_inspect
SET st_copy = st;

SELECT st,
 st_copy
FROM meat_poultry_egg_inspect
ORDER BY st;
----------------------------
--Updating Rows Where Values Are Missing
UPDATE meat_poultry_egg_inspect
SET st = 'MN'
WHERE est_number = 'V18677A';
UPDATE meat_poultry_egg_inspect
SET st = 'AL'
WHERE est_number = 'M45319+P45319';
UPDATE meat_poultry_egg_inspect
SET st = 'WI'
WHERE est_number = 'M263A+P263A+V263A';
-----------------------------------
--Restoring Original Values
UPDATE meat_poultry_egg_inspect
SET st = st_copy;
UPDATE meat_poultry_egg_inspect original
SET st = backup.st
FROM meat_poultry_egg_inspect_backup backup
WHERE original.est_number = backup.est_number;
--update values for consitency
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN company_standard varchar(100);
UPDATE meat_poultry_egg_inspect
SET company_standard = company;
--
UPDATE meat_poultry_egg_inspect
SET company_standard = 'Armour-Eckrich Meats'
WHERE company LIKE 'Armour%';
SELECT company, company_standard
FROM meat_poultry_egg_inspect
WHERE company LIKE 'Armour%';
----------------------------
--Repairing ZIP Codes Using Concatenation
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN zip_copy varchar(5);
UPDATE meat_poultry_egg_inspect
SET zip_copy = zip;
--
UPDATE meat_poultry_egg_inspect
SET zip = '00' || zip
WHERE st IN('PR','VI') AND length(zip) = 3;
--
UPDATE meat_poultry_egg_inspect
SET zip = '0' || zip
WHERE st IN('CT','MA','ME','NH','NJ','RI','VT') AND length(zip) = 4;
--------------------------------
--Updating Values Across Tables
CREATE TABLE state_regions (
 st varchar(2) CONSTRAINT st_key PRIMARY KEY,
 region varchar(20) NOT NULL
);

COPY state_regions
FROM 'C:\Users\rosso\OneDrive\Desktop\Resources SQL\practical-sql-master\practical-sql-master\Chapter_09\state_regions.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

ALTER TABLE meat_poultry_egg_inspect ADD COLUMN inspection_date date;
UPDATE meat_poultry_egg_inspect inspect
SET inspection_date = '2019-12-01'
WHERE EXISTS (SELECT state_regions.region
 FROM state_regions
 WHERE inspect.st = state_regions.st
 AND state_regions.region = 'New England');
 
SELECT st, inspection_date
FROM meat_poultry_egg_inspect
GROUP BY st, inspection_date
ORDER BY st;

---------------------------------------------
--Deleting Rows from a Table
DELETE FROM meat_poultry_egg_inspect
WHERE st IN('PR','VI');
------------------------------------------
--Deleting a Column from a Table
ALTER TABLE meat_poultry_egg_inspect DROP COLUMN zip_copy;
-------------------------------------------
--Using Transaction Blocks to Save or Revert Changes
--
START TRANSACTION;
UPDATE meat_poultry_egg_inspect
SET company = 'AGRO Merchantss Oakland LLC'
WHERE company = 'AGRO Merchants Oakland, LLC';

SELECT company
FROM meat_poultry_egg_inspect
WHERE company LIKE 'AGRO%'
ORDER BY company;

ROLLBACK;
---------------------------------------------------------------

