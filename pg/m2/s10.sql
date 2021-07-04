-- non-equi join

-- ex 1
-- name of department for a given employee
select d.name
from departments d join employees e
using (department_id)
where e.employee_id = 107;

-- name of other department for a given employee
select d.name
from departments d join employees e
on d.department_id != e.department_id
where e.employee_id = 107;

-- name of other _active_ department for a given employee
select d.name
from departments d join employees e
on d.department_id != e.department_id and d.manager_id is not null
where e.employee_id = 107;

-- ex 2
-- given an employee ...
select e.first_name, e.last_name, e.salary, j.title, j.job_id, j.min_salary, j.max_salary
from employees e join jobs j
using (job_id)
where employee_id = 107;

-- ... list of jobs with a compatible min/max salary
select j.title, j.min_salary, j.max_salary
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
where e.employee_id = 107;

-- ... list of _other_ jobs with a compatible min/max salary
select j.title, j.min_salary, j.max_salary
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
where e.employee_id = 107 and e.job_id != j.job_id;
