-- insert

-- the current table status
select * from clients;

-- plain insert
insert into clients (client_id, name, nickname)
values (20, 'Mirdor Shifty Solutions', 'MiSS');

-- multiline insert
insert into clients (client_id, name, nickname) values
	(21, 'Old Gondor Real Estate', 'OGRE'),
	(22, 'Rohan Horse Equipments', 'RHEq');

-- column with default value (nullable or other) could be skipped
insert into clients (client_id, name)
values (12, 'Kerr & Reetch Associates');

-- auto-incremented value for pk
insert into clients (name)
values ('Multiple Oz Factories');

-- insert relying on column definition on table
insert into clients
values (13, 'Rainydays Tour Operator', null);
