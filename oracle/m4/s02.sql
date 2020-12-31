-- insert

alter session set current_schema = me;

describe clients;

select *
from clients;

-- plain insert
insert into clients (client_id, name, nickname)
values (20, 'Mordor Kitchen Inc.', 'Moki');

-- nullable / defaulted column could be skipped
insert into clients (client_id, name)
values (21, 'Something Else Production');

-- insert relying on column definition on table
insert into clients
values (22, 'Rohan Horse Power', 'Rohp');

-- remember to explicitly commit - or rollback
commit;
