-- self join

-- SQL/92
select concat(e.first_name, ' ', e.last_name) as Employee, concat(m.first_name, ' ', m.last_name) as Manager
from employees e join employees m
on e.manager_id = m.employee_id
order by 1;

-- "classic"
select concat(e.first_name, ' ', e.last_name) as Employee, concat(m.first_name, ' ', m.last_name) as Manager
from employees e, employees m
where e.manager_id = m.employee_id
order by 1;
