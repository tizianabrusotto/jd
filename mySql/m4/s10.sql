-- alter table
use me;

-- alter table
describe items;

-- add a column
alter table items add column counter decimal(38, 0);

-- drop a column
alter table items drop column counter;

-- add check
alter table items add constraint check(status in ('A', 'B', 'X'));

-- Error Code: 3819. Check constraint 'items_chk_1' is violated.
insert into items values(13, 'Y', 'ciao', 13);

insert into items (item_id, status) values(43, 'X');

-- Error Code: 3819. Check constraint 'items_chk_1' is violated.
update items set status = '?';

-- I mean it, make items empty!
delete from items;

-- check the execs table
describe execs;
select * from execs;

-- add unique constraint
alter table execs add constraint unique (first_name, last_name);

insert into execs values(1222, 'Bruce', 'Austin', '2007-05-21', 6000.00);

-- Error Code: 1062. Duplicate entry 'Bruce-Austin' for key 'first_name'
insert into execs values(1223, 'Bruce', 'Austin', '2020-03-10', 6000.00);

insert into execs values(1223, 'Bruce Jr.', 'Austin', '2007-05-21', 6000.00);

-- add pk
alter table execs add constraint primary key(exec_id);
-- alter table execs modify exec_id int primary key;

-- drop pk
alter table execs drop primary key;

-- add pk w/ autoincrement
alter table execs modify exec_id int primary key auto_increment;
alter table execs change exec_id exec_id int primary key auto_increment;

-- drop autoincrement from pk
alter table execs change exec_id exec_id int;

-- add fk
alter table items add constraint foreign key(exec_id) references execs(exec_id);
