-- aggregate functions

alter session set current_schema = me;

-- count all
select count(*), count(ROWID), count(ROWNUM)
from employees;

-- beware of null
select count(manager_id)
from employees;

-- distinct values
select count(distinct manager_id) as "distinct managers"
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

-- standard deviation
select round(stddev(salary)) as "rounded sigma"
from employees;

-- variance
select round(variance(salary)) as "rounded sigma^2"
from employees;

-- median
select median(salary)
from employees;

-- who has the most common salary: requires subquery
select first_name, last_name
from employees
where salary = (select median(salary) from employees);
