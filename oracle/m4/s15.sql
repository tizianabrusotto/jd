-- sequence

alter session set current_schema = me;

-- create
create sequence my_seq;

-- next value
select my_seq.nextval
from dual;

-- current value, no increase - seldom useful
-- can't be used before first time nextval is used
select my_seq.currval
from dual;

-- change sequence setting
alter sequence my_seq increment by 2;

-- get rid of it
drop sequence my_seq;

-- create a sequence for a table
select *
from execs;

create sequence exec_seq start with 200;

insert into execs (exec_id, first_name, last_name, hire_date, salary)
    values(exec_seq.nextval, 'Tommy', 'Kopp', SYSDATE, 12000);

-- remember to explicitly commit or rollback
commit;