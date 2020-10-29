-- commit, rollback, savepoint
-- autocommit is expected being off

use me;

select *
from clients;

insert into clients (name) values ('Kerr & Reetch Associates');
savepoint sp;

insert into clients (name) values ('Oz Singleton Factories');

rollback to sp; -- keep K&R, rollback Oz

commit; -- persist K&R
