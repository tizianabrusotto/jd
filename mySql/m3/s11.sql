-- subquery
use me;

-- most common subquery: select - where
-- who is the manager of John Chen
-- fine, but only if first + last name is not duplicated!
select employee_id, first_name, last_name, salary
from employees
where employee_id = (
	select manager_id
	from employees
	where first_name = 'John' and last_name = 'Chen');

-- a safer version select - where, using "in" and checking for null
-- who are the manager of employees having last name starting with 'K' (null not included)
select first_name, last_name
from employees
where employee_id in (
	select manager_id
	from employees
	where last_name like 'K%' and manager_id is not null);

-- update - where subquery
-- assuming department name is not duplicated!
update employees
set salary = salary + 100
where employee_id = (
	select manager_id
	from departments
	where name = 'IT');

-- subquery in select - from
-- get the top salary from the ones specified in the subquery
select max(e.salary)
from (
	select employee_id, salary
	from employees
	where employee_id between 112 and 115) as e;

-- subquery in select - group by - having + another one in select - from
-- step 1: average salaries for each department
select avg(salary)
from employees
group by department_id
order by 1 desc;

-- step 2: highest salary among the average salary for each department
select max(tmp.avg_sal) from (
	select avg(salary) avg_sal
	from employees
	group by department_id) tmp;

-- average salaries for each department (no null), excluding the topmost one
select department_id, round(avg(salary))
from employees
group by department_id having avg(salary) < (select max(x.sal) from (
	select avg(salary) sal
	from employees
	group by department_id) x
    where department_id is not null)
order by 2 desc;

-- subquery in select - from - join
-- how many countries for each region
select description, c.country_count
from regions natural join (
    select region_id, count(*) country_count
    from countries
    group by region_id) c;

-- multirow subquery in select - where
-- to get manager names
select first_name, last_name
from employees
where employee_id in (
    select distinct manager_id
    from employees
    where manager_id is not null)
order by 2;
