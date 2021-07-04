-- null

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

-- coalesce: if commission is null use 0 instead
select employee_id, last_name, salary * coalesce(commission_pct, 0)
from employees
where last_name = 'King';
