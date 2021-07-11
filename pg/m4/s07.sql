-- alter table

select * from items;

-- add a column
alter table items add column counter integer;

-- drop a column
alter table items drop column counter;

-- add check
alter table items add check(status in ('a', 'b', 'x'));

-- SQL Error [23514]: ERROR: new row for relation "items" violates check constraint "items_status_check"
insert into items values(13, 'y', 'ciao', 13);

insert into items (item_id, status) values(43, 'a');

-- SQL Error [23514]: ERROR: new row for relation "items" violates check constraint "items_status_check"
update items set status = '?';

-- I mean it, make items empty!
delete from items;

-- check the execs table
describe execs;
select * from execs;

--
-- let's work on execs, too
select * from execs;

-- add unique constraint
alter table execs add unique (first_name, last_name);

-- OK
insert into execs values(1222, 'Bruce', 'Austin', '2007-05-21', 6000.00);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "execs_first_name_last_name_key"
insert into execs values(1223, 'Bruce', 'Austin', '2020-03-10', 6000.00);

-- OK
insert into execs values(1223, 'Bruce Jr.', 'Austin', '2007-05-21', 6000.00);

-- add pk
alter table execs add primary key(exec_id);

-- add fk
alter table items add foreign key(exec_id) references execs(exec_id);

-- drop constraints
alter table items drop constraint items_exec_id_fkey;
alter table execs drop constraint execs_pkey;
