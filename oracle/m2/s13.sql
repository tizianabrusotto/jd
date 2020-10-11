-- right outer join
alter session set current_schema = hr;

-- a few departments
select department_id, department_name
from departments
where department_id between 110 and 120;

-- employees in those departments (none in 120!)
select first_name, last_name, department_id
from employees
where department_id between 110 and 120;

-- right outer join, department name is preserved
select first_name, last_name, department_name
from employees right outer join departments
using (department_id)
where department_id between 110 and 120;



select first_name, last_name, department_id
from employees
where department_id between 110 and 120 or last_name = 'Grant';

select department_id, department_name
from departments
where department_id between 110 and 120;

-- right outer join
select first_name, last_name, department_name
from employees right outer join departments
using (department_id)
where department_id between 110 and 120 or last_name = 'Grant';

-- left outer join
select first_name, last_name, department_name
from employees left outer join departments
using (department_id)
where department_id between 110 and 120 or last_name = 'Grant';

-- full outer join
select first_name, last_name, department_name
from employees full outer join departments
using (department_id)
where department_id between 110 and 120 or last_name = 'Grant';
