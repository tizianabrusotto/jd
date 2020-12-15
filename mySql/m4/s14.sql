-- view
use me;

select *
from execs;

-- create view
create or replace view junior_execs_view as
	select first_name, last_name, hire_date from execs
	where exec_id != 100;

select *
from junior_execs_view;

describe junior_execs_view;

update junior_execs_view
set last_name = 'Austeen'
where first_name = 'Bruce';

-- get rid of a view
drop view junior_execs_view;
