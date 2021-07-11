-- delete

-- the current table status
select * from clients;

-- delete a single row
delete from clients
where client_id = 12;

-- multiline delete - be extra careful with it!
delete from clients
where client_id > 10;

-- even more careful here!
-- !!! another table references some of these rows, so the operation won't succeed !!!
delete from clients;
