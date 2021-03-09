-- try it yourself p. 57
--1.
select kind from animals order by kind asc;
--2.
select kind from animals where kind like 's%' and date_arrived > '2010-01-01';
--3.
select * from animals 
where date_arrived > '2010-01-01' order by date_arrived ASC
----------------------------------------------------------------
