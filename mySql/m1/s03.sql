-- select
use me;

-- select all
select *
from regions;

-- selecting a single column and a single row (if exists)
select description
from regions
where region_id = 1;

-- select a single column, no row filtering
select manager_id
from employees;

-- selecting only non-duplicated values
select distinct manager_id
from employees;

-- select with changes on results
select title, min_salary, min_salary + 2000 as "option 1", min_salary * 3 + 1000 as "option 2"
from jobs;

-- column aliases
select title as "Job Title", min_salary + 2000 as "Salary option 1"
from jobs;

-- other column aliases
select title, min_salary as "original", min_salary as salary
from jobs;

select title, min_salary + 2000 as "increased min salary"
from jobs;

-- the dual table and the function current_date
select current_date;
-- from dual;

select sqrt(25);

select 1+2, 3-4, 2*6, 5/2, current_date;

-- concatenation
select concat(region_id, ": " ,country_id) as "the countries"
from countries;

-- limit to get a result set with a specified max size
select first_name, last_name
from employees
limit 10;

-- the second block of ten employees
select first_name, last_name
from employees
limit 10, 10;

-- there are less than 110 employees, so this result set is smaller than 10
select first_name, last_name
from employees
limit 100, 10;
