-- group by - having

alter session set current_schema = me;

-- get employees with a salary less than 8000
-- group them by manager id
-- keep the groups with an average salary above 6000
-- and order the result by rounded salary, descending
select manager_id, round(avg(salary)) as "rounded avg salary"
from employees
where salary < 8000
group by manager_id
having avg(salary) > 6000
order by 2 desc;
