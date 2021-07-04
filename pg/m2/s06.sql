-- left/right outer join - from "many" perspective

-- Kimberely is an employee
select first_name, last_name
from employees
where last_name like 'Gr%';

-- the inner join skips Kimberely
select first_name, last_name, name as department
from employees join departments
using (department_id)
where last_name like 'Gr%';

-- left outer join
select first_name, last_name, name
from employees left outer join departments
using (department_id)
where last_name like 'Gr%';

-- rewritten as right outer join
select first_name, last_name, name
from departments right outer join employees
using (department_id)
where last_name like 'Gr%';

-- "left" / "right" imply "outer"
select first_name, name
from employees left join departments
using (department_id)
where last_name = 'Grant';
