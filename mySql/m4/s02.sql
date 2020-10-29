-- insert
use me;

select *
from clients;

describe clients;

-- plain insert
insert into clients (client_id, name, nickname)
values (20, 'Mordor Shifty Solutions', 'Moh');

-- multiline insert
insert into clients (client_id, name, nickname) values
	(21, 'East Gondor Real Estate', 'Gondy'),
	(22, 'Rohan Horse Equipments', 'Ron');

-- nullable column could be skipped
insert into clients (client_id, name)
values (12, 'Kerr & Reetch Associates');

-- auto-incremented value for pk
insert into clients (name)
values ('Multiple Oz Factories');

-- insert relying on column definition on table
insert into clients
values (13, 'Rainydays Tour Operator', null);
