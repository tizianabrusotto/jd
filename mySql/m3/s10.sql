-- group by - having
use me;

-- average salary for all the employees
select round(avg(salary), 2) as 'avg salary'
from employees
order by 1 desc;

-- average salary for each department
select department_id, round(avg(salary)) as 'avg salary'
from employees
group by department_id
order by 2 desc;

-- average salary for each department, excluding the employees not assigned to a department
select department_id, truncate(avg(salary), 0) as 'avg salary'
from employees
where department_id is not null
group by department_id
order by 2 desc;

-- group by - having

-- get employees with a salary less than 8000
-- group them by manager id
-- keep the groups with an average salary above 6000
-- and order the result by the the second column, descending
select manager_id, round(avg(salary))
from employees
where salary < 8000
group by manager_id
having avg(salary) > 6000
order by 2 desc;

-- average salary for department, excluding "null" department and low average ones
select name, truncate(avg(salary), 0) as 'avg salary'
from employees join departments
using(department_id)
where department_id is not null
group by department_id
having round(avg(salary)) > 6000
order by 2 desc;

-- self join + group by
select concat(m.first_name, ' ', m.last_name) as Manager, round(avg(e.salary)) as "Avg group salary"
from employees e join employees m
on e.manager_id = m.employee_id 
where e.salary < 8000
group by e.manager_id
having round(avg(e.salary)) > 6000
order by 2 desc;
