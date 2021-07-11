-- update

-- the current table status
select * from clients;

-- updating a single row (if found)
update clients
set name = 'K&R Associates', nickname = 'Keyra'
where client_id = 12;

-- updating all rows - by mistake?
-- ??? is autocommit off ???
update clients
set nickname = 'mistake!';

-- updating (potentially) more rows
update clients
set nickname = 'N/A'
where client_id > 10;
