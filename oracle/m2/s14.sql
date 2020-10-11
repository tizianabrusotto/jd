-- full outer join
alter session set current_schema = hr;

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
