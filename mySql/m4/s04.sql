-- delete
use me;

-- check the current status
select *
from clients;

-- delete a single row
delete from clients
where client_id = 22;

-- multiline delete - be extra careful with it!
delete from clients
where client_id > 10;

-- even more careful here
delete from clients;
