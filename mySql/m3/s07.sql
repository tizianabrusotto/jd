-- regex
use me;

-- plain LIKE
select last_name
from employees
where last_name like 'A%' or last_name like 'E%'
order by 1;

-- LIKE with regular expression
select last_name
from employees
where regexp_like(last_name, '^[ae].*');

select last_name
from employees
where last_name rlike '^[ae].*';

select last_name
from employees
where regexp_like(last_name, '.*[nt]$');

select last_name
from employees
where last_name regexp '^[ae].*';

select last_name
from employees
where last_name regexp '[nt]$';

select last_name
from employees
where last_name rlike '.*[nt]$';
