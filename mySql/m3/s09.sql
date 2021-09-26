-- aggregate functions
use me;

-- count, count distinct
select count(*), count(manager_id), count(distinct manager_id), count(commission_pct)
from employees;

-- max, min
select max(salary), min(salary)
from employees;

-- min, max on dates
select min(hire_date), max(hire_date)
from employees;

-- sum
select sum(salary)
from employees
where department_id = 5;

-- average
select round(avg(salary), 2)
from employees
where department_id = 5;
