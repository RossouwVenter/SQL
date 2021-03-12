--Counting rows
SELECT count(*)
FROM pls_fy2014_pupld14a;

SELECT count(*)
FROM pls_fy2009_pupld09a;
--------------------
--counting unique values
SELECT count(libname)
FROM pls_fy2014_pupld14a;

SELECT count(DISTINCT libname)
FROM pls_fy2014_pupld14a;
--------------------
--max and min values
SELECT max(visits), min(visits)
FROM pls_fy2014_pupld14a;
--------------------
--Group by: is similar than distinct
SELECT stabr
FROM pls_fy2014_pupld14a
GROUP BY stabr
ORDER BY stabr;
-------------
-- Same as group by
select distinct stabr
from pls_fy2014_pupld14a
------------------------------
SELECT stabr, stataddr, count(*)
FROM pls_fy2014_pupld14a
GROUP BY stabr, stataddr
ORDER BY stabr ASC, count(*) DESC;
--------------------------------
--Tels you how many visitors you had.
SELECT sum(visits) AS visits_2014
FROM pls_fy2014_pupld14a
WHERE visits >= 0;

SELECT sum(visits) AS visits_2009
FROM pls_fy2009_pupld09a
WHERE visits >= 0;
--------------------------
--pull data from both
SELECT sum(pls14.visits) AS visits_2014,
 sum(pls09.visits) AS visits_2009
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0;
--not needed to use as.
---------------------------------
--Grouping Visit Sums by State
SELECT pls14.stabr,
 sum(pls14.visits) AS visits_2014,
 sum(pls09.visits) AS visits_2009,
 round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
 sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.stabr
ORDER BY pct_change DESC;
-----------------------------------
--Filtering an Aggregate Query Using HAVING
SELECT pls14.stabr,
 sum(pls14.visits) AS visits_2014,
 sum(pls09.visits) AS visits_2009,
 round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
 sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.stabr
HAVING sum(pls14.visits) > 50000000
ORDER BY pct_change DESC;
--The having clause is similar to where.
------------------------------------------

