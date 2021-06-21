-- update
use me;

-- check the current table status
describe clients;
select * from clients;

-- updating a single row (if found)
update clients
set name = 'K&R Associates', nickname = 'Keyra'
where client_id = 12;

-- updating all rows - by mistake?
update clients
set nickname = 'mistake!';

-- updating (potentially) more rows
update clients
set nickname = 'N/A'
where client_id > 10;
