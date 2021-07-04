-- select

-- select all
select *
from regions;

-- a plain select
select description
from regions
where region_id = 1;

show schemas;

-- select a single column
select manager_id
from employees;

-- select only distinct values in a column
select distinct manager_id
from employees;

-- alias
select title, min_salary as "original", min_salary as salary
from jobs;

-- select with change on results
select title, min_salary, min_salary + 200 as "option 1", min_salary + (min_salary * 0.05) as "option 2"
from jobs;

-- dual
select current_date;

select sqrt(25);

select 5/2, current_date;

-- concatenation by operator ||
select region_id || ': ' || country_id as "the countries"
from countries;

-- concatenation by concat()
select concat(region_id, ': ', country_id) as "the countries"
from countries;


-- limit to get result set with a specified size
select first_name, last_name
from employees
limit 10;

select first_name, last_name
from employees
offset 10 limit 10;

select first_name, last_name
from employees
offset 100 limit 10;
