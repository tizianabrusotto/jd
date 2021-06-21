-- delete
use me;

-- check the current table status
select * from clients;

-- delete a single row
delete from clients
where client_id = 12;

-- multiline delete - be extra careful with it!
delete from clients
where client_id > 10;

-- even more careful here!
delete from clients;
