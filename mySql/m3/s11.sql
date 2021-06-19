-- group by - having
use me;

-- get employees with a salary less than 8000
-- group them by manager id
-- keep the groups with an average salary above 6000
-- and order the result by the the second column, descending
select e.manager_id, round(avg(e.salary)), m.first_name, m.last_name
from employees e join employees m
on e.manager_id = m.employee_id 
where e.salary < 8000
group by e.manager_id
having round(avg(e.salary)) > 6000
order by 2 desc;