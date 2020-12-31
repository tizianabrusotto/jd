-- create table as select

alter session set current_schema = me;

-- requisite: granted select on table
select employee_id, first_name, last_name, hire_date, salary
from employees
where department_id = 90;

-- create table by select
create table execs
as
    select employee_id as exec_id, first_name, last_name, hire_date, salary
    from employees
    where department_id = 90;

select * from execs;

-- drop table execs;
