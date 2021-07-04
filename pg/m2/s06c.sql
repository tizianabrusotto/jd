-- full outer join

-- Ki and Kimberely
select first_name, last_name, department_id 
from employees
where first_name like 'Ki%';

-- Treasury
select name
from departments
where name like 'T%';

-- inner join, Kimberely and Treasury discarded
select first_name, last_name, name
from employees e join departments d 
using(department_id)
where first_name like 'Ki%' or d.name like 'T%';

-- left join, Treasury discarded
select first_name, last_name, name
from employees e left outer join departments d 
using(department_id)
where first_name like 'Ki%' or d.name like 'T%';

-- right join, Kimberely discarded
select first_name, last_name, name
from employees e right outer join departments d 
using(department_id)
where first_name like 'Ki%' or d.name like 'T%';

-- full join, Kimberely and Treasury are in!
select first_name, last_name, name
from employees e full outer join departments d 
using(department_id)
where first_name like 'Ki%' or d.name like 'T%';
