-- left outer join
alter session set current_schema = hr;

-- get all employee named Grant
select first_name, last_name, department_id
from employees
where last_name = 'Grant';

-- inner join for Grant
select first_name, department_name
from employees join departments
using(department_id)
where last_name = 'Grant';

-- left outer join
select first_name, department_name
from employees left outer join departments
using(department_id)
where last_name = 'Grant';

-- same, rewritten as right outer join
select first_name, department_name
from departments right outer join employees 
using(department_id)
where last_name = 'Grant';
