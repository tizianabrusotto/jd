-- create table
use me;

-- create a simple table with a primary key
create table items (
    item_id integer primary key,
    status char,
    name varchar(20),
    exec_id integer);

describe items;

insert into items (item_id) values (12);

select *
from items;

update items
set status = 'x', name = 'thing'
where item_id = 12;

-- create a table cloning items
create table cloned_items like items;

-- same structure
describe cloned_items;

-- ... but empty
select *
from cloned_items;

-- create a table by data extraction
create table execs
as
    select employee_id as exec_id, first_name, last_name, hire_date, salary
    from employees
    where department_id = 9;
    
describe execs;

select *
from execs;
