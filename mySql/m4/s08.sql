-- create table
use me;

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

