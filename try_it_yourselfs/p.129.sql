--p129


--1. 
SELECT *
FROM us_counties_2000 LEFT JOIN us_counties_2010
ON us_counties_2000.id = us_counties_2010.id
WHERE us_counties_2010.id IS NULL;