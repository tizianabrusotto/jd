-- view

-- check existing table
select * from execs;

-- create view
create or replace view junior_execs_view as
	select exec_id, first_name, last_name, hire_date from execs
	where exec_id != 100;

-- check the derived view
select * from junior_execs_view;

-- get rid of a view
drop view junior_execs_view;
