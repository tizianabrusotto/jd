-- update
use me;

select *
from clients;

-- updating regions
update clients
set nickname = concat('Client ', client_id)
where client_id > 10;

-- updating a single line
update clients
set name = 'Oz Singleton Factories', nickname = 'Ozzie'
where client_id = 23;
