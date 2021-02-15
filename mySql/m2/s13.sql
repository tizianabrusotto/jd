use me;

-- right outer join
select first_name, last_name, department_name
from employees right outer join departments
using(department_id)
where department_id between 110 and 120;

-- as above, rewritten as left outer join
select first_name, last_name, department_name
from departments left outer join employees
using(department_id)
where department_id between 110 and 120;
