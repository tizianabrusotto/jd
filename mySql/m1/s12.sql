-- order by
use me;

-- sorting in natural order
select *
from employees
order by salary;

-- descending
select first_name, last_name, salary
from employees
order by salary desc;

-- positional notation
select first_name, last_name
from employees
where first_name like 'a%'
order by 2
limit 5;
