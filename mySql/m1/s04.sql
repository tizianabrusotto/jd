-- null
use me;

-- check null
select employee_id, first_name, last_name, commission_pct
from employees
where commission_pct is null
and last_name = 'King';

select employee_id, first_name, last_name, commission_pct
from employees
where commission_pct is not null
and last_name = 'King';

-- !!! WRONG !!! check null
select employee_id, first_name, last_name, commission_pct
from employees
where commission_pct = null
and last_name = 'King';

-- !!! WRONG !!!
select employee_id, first_name, last_name, commission_pct
from employees
where commission_pct != null
and last_name = 'King';

-- null in operations
select first_name, last_name, salary * commission_pct
from employees
where last_name = 'King';

-- what if the commission is null?
select employee_id, last_name, salary * ifnull(commission_pct, 0)
from employees
where last_name = 'King';
