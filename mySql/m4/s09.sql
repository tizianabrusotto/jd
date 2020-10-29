-- create table by select

use me;

create table execs
as
    select employee_id as exec_id, first_name, last_name, hire_date, salary
    from employees
    where department_id = 90;
    
describe execs;

select *
from execs;

-- drop table execs;