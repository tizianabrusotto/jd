-- create table

-- create a simple table with a primary key
create table items (
    item_id integer primary key,
    status char,
    name varchar(20),
    exec_id integer);

-- table created empty
select * from items;

insert into items (item_id) values (12);

select *
from items;

update items
set status = 'x', name = 'thing'
where item_id = 12;

-- create a table by data extraction
create table execs
as
    select employee_id as exec_id, first_name, last_name, hire_date, salary
    from employees
    where department_id = 90;

select *
from execs;
