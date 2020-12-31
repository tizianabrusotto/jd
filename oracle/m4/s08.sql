-- create table

alter session set current_schema = me;

create table items (
    item_id integer primary key,
    status char,
    name varchar(20),
    coder_id integer);

select *
from items;

-- full insert
insert into items
values (2, 'x', 'breadcrumb', 23);

-- insert specifing only mandatory fields
insert into items (item_id)
values (18);


-- useless update, no row selected
update items
set status = 'z'
where item_id = 12;

-- careful! all rows removed
delete from items;

-- remeber to explicity rollback - or commit
rollback;

-- extreme cleanup
-- drop table items;
