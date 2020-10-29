-- alter table
use me;

-- alter table
describe items;
-- add/drop column from table
alter table items add counter decimal(38, 0);
alter table items drop column counter;

-- add check
alter table items add constraint items_status_ck check(status in ('A', 'B', 'X'));

-- this one won't work
insert into items values(13, 'Y', 'ciao', 13);

select *
from items;

insert into items (item_id, status) values(43, 'X');

update items set status = '?';

-- careful with this one!
delete from items;

describe execs;

select *
from execs;

-- add unique
alter table execs add constraint execs_name_uq unique (first_name, last_name);

insert into execs values(1222, 'Bruce', 'Austin', '2007-05-21', 6000.00);

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
