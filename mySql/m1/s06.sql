-- select
use me;

-- a select
select name
from regions
where region_id = 1;

-- select all
select *
from regions;

show schemas;

-- select distinct
select distinct manager_id
from employees;

select manager_id
from employees;

-- select with change on results
select title, min_salary, min_salary + 2000 as "option 1", min_salary * 3 + 1000 as "option 2"
from jobs;

select title as "Job Title", min_salary + 2000 as "Salary option 1"
from jobs;

-- alias
select title, min_salary as "original", min_salary as salary
from jobs;

select title, min_salary + 2000 as "increased min salary"
from jobs;

-- dual
select current_date;
-- from dual;

select sqrt(25);

select 1+2, 3-4, 2*6, 5/2, current_date;

-- concatenation
select concat(region_id, ": " ,country_id) as "the countries"
from countries;

-- limit to get result set with a specified size
select first_name, last_name
from employees
limit 10;

select first_name, last_name
from employees
limit 10, 10;

select first_name, last_name
from employees
limit 100, 10;

