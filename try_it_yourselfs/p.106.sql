--p106
--1.
select Pi()*5 ^2;

--2.
Select geo_name,state_us_abbreviation,p0010001 AS total_population, p0010005 as american_indian_alaska_native_alone,
(CAST (p0010005 as numeric(8,1)) / p0010001) * 100
as percent_american_indian_alaska_native_alone
from us_counties_2010
Where state_us_abbreviation = 'NY'
order by percent_american_indian_alaska_native_alone DESC;

--3.

