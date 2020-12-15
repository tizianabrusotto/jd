-- select
use me;

-- a select
select region_name
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
select job_title, min_salary, min_salary + 2000 as "option 1", min_salary * 3 + 1000 as "option 2"
from jobs;

-- alias
select job_title, min_salary as original, min_salary as salary
from jobs;

select job_title, min_salary + 2000 as "increased min salary"
from jobs;

-- dual
select current_date, 1+2
from dual;

select 1+2, 3-4, 2*6, 5/2, current_date;

-- concatenation
select concat(region_id, ": " ,country_id)
from countries;

-- limit to get result set with a specified size
select first_name, last_name
from employees
limit 10;

select first_name, last_name
from employees
limit 100, 10;

