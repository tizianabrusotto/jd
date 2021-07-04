-- group by - having

-- average salary for all the employees
select round(avg(salary), 2) as "avg salary"
from employees
order by 1 desc;

-- average salary for each department
select department_id, round(avg(salary)) as "avg salary"
from employees
group by department_id
order by 2 desc;

-- average salary for each department, excluding the employees not assigned to a department
select department_id, round(avg(salary)) as "avg salary"
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
