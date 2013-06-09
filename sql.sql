/*
            Creating a table:

*/
create table AA_personal_info (
pin             integer             not null,
last_name       char(20)            not null,
first_name      char(20),
pass            varchar(20)         not null,
gender          char(1)             not null,
primary key (pin)
);

--Inserting a single row of data
insert into aa_personal_info values
(1, 'Marini', 'Brian', 'forever8', 'm');

insert into aa_personal_info values
(13, 'Boru', 'Brian', 'king1', 'm');

--Basic select statement:  selecting all from the 'aa_personal_info' table
select * from aa_personal_info;

--Select statement that will only return the 'first_name' and 'last_name' columns
select first_name, last_name from aa_personal_info;

--using the WHERE statement
select * from aa_personal_info
where gender = 'm';

--using the AND statement, will only return items that fit both conditions
select pin, first_name, last_name from aa_personal_info
where gender = 'm'
and pin > 2;

--using the OR statement, will return all items that fit either condition
select * from aa_personal_info
where gender = 'f'
or first_name = 'Brian';

--using ORDER BY for sorting data
select * from aa_personal_info
order by first_name;

--ORDER BY descending
select * from aa_personal_info
order by pin desc;

--ORDER BY with a second column (for duplicates)
select * from aa_personal_info
order by first_name, last_name;

--After building the aa_location table...

--Selecting columns from multiple tables, using a dot separator
select aa_location.pin, first_name, last_name, city, zip
from aa_personal_info, aa_location
where aa_personal_info.pin = aa_location.pin;

--COUNT, shows how many data entries are within a table
select count(*)
from aa_personal_info;

select count(first_name)
from aa_personal_info;

--SUM feature: can only be run on numerical columns
select sum(pin) from aa_personal_info;

--renames the column
select sum(zip) as TOTAL from aa_location;

--MIN and MAX
select min(pin) as monkeybutt from aa_personal_info;
select max(pin) as buttmonkey from aa_personal_info;

/*
SUBQUERY-
    Will return all of the given columns, so long as
    the pin equals the number of the subquery within
    the parenthesis.
*/
select pin, first_name, last_name
from aa_personal_info
where pin = (select max(pin) from aa_personal_info);

--UPDATE a table
update aa_personal_info
set last_name = 'Ghost'
where pin = 3;

update aa_personal_info
set first_name = null
where pin = 3;

--deleting a record from a table
delete from aa_personal_info
where pin = 4;

--IN and NOT IN
select * from aa_personal_info
where first_name in ('Brian', 'Steve');

select * from aa_personal_info
where first_name not in ('Brian', 'Steve');

--Using BETWEEN in place of greater than and less that combind
select * from aa_personal_info
where pin between 3 and 10;

--Using LIKE and % to guess a query
select * from aa_personal_info
where last_name like 'M%'
or last_name like '%os%';

select * from aa_personal_info
where last_name not like '%M%';

--Creating a new view
create view sec (lname, fname, gender) as
select last_name, first_name, gender from aa_personal_info;

select * from sec;

--Distinct (unique)
select distinct fname from sec;
--This query returns entries unique to all columns combined
select distinct zip, city from aa_location;

--ROWNUM
select * from aa_personal_info
where rownum <= 5;

--IN
select * from aa_personal_info
where pin in (4, 5, 6);