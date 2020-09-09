-- select

-- ensure we are working on HR
alter session set current_schema = hr;

-- a select
select region_name
from regions
where region_id = 1;

-- select all
select *
from regions;

-- select distinct
select distinct manager_id
from employees;

-- select with change on results
select job_title, min_salary, min_salary + 2000, min_salary * 3 + 1000
from jobs;

-- alias
select job_title, min_salary as original, min_salary salary
from jobs;

select job_title, min_salary + 2000 as "increased min salary"
from jobs;

-- dual
select sysdate, current_date, 1+2
from dual;

-- concatenation
select country_id || '...' || region_id || '!'
from countries;

-- pseudo columns
select rowid, rownum
from regions;