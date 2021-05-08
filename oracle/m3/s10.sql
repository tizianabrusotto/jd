-- aggregate functions

alter session set current_schema = me;

-- count all
select count(*), count(ROWID), count(ROWNUM)
from employees;

-- beware of null
select count(manager_id)
from employees;

-- count distinct values
select count(distinct manager_id) as "distinct managers"
from employees;

-- explicitly count all (not null) values
select count(all manager_id) as "employees having a manager"
from employees;

-- max, min
select max(salary), min(salary)
from employees;

-- sum
select sum(salary)
from employees
where department_id = 50;

-- average
select round(avg(salary), 2) "Round to cent"
from employees
where department_id = 50;

-- the most common salary
select median(salary)
from employees;
