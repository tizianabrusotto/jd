-- order by

select *
from employees
order by last_name, first_name;

-- sorting in natural order
select *
from employees
order by salary;

-- descending
select first_name, last_name, salary
from employees
order by salary desc
limit 3;

-- positional notation
select first_name, last_name, salary
from employees
where first_name like 'A%'
order by 3 desc
limit 5;

select first_name, last_name, hire_date
from employees
where first_name like 'A%'
order by 3 desc
limit 5;
