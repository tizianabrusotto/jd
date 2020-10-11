-- update

alter session set current_schema = me;

select *
from clients;

-- prefer updating a single row
update clients
set name = 'Z'
where client_id = 1;

-- it is possible to update more rows
update clients
set name = 'X'
where client_id in (2, 3);

-- it is possible to update more columns
update clients
set client_id= 42, name = 'Y'
where client_id = 4;

-- remeber to explicity rollback - or commit
rollback;
