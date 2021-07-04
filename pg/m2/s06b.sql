-- left/right outer join - from "many" perspective

-- Treasury is a department
select name
from departments
where department_id in (110, 120);

-- the inner join skips Treasury
select first_name, last_name, name
from employees join departments
using(department_id)
where department_id in (110, 120);

-- right outer join
select first_name, last_name, name
from employees right outer join departments
using(department_id)
where department_id in (110, 120);

-- as above, rewritten as left outer join
select first_name, last_name, name
from departments left outer join employees
using(department_id)
where department_id in (110, 120);
