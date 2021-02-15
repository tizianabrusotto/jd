-- order by
use me;

select *
from employees
order by last_name desc, first_name;

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
order by 1, 2 desc;
-- limit 5;
