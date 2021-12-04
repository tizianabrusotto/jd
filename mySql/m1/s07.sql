-- examples on sorting
use hron;

select last_name, first_name
from employee
order by last_name, first_name;

-- sorting in natural order
select *
from employee
order by salary;

-- descending and limited
select first_name, last_name, salary
from employee
order by salary desc
limit 6;

-- ...
select first_name, last_name
from employee
where first_name like 'b%'
order by salary desc;

-- positional notation
select first_name, last_name
from employee order by 1, 2;

-- ...
select first_name, last_name, hired
from employee
where first_name like 'c%'
order by 3 asc;
