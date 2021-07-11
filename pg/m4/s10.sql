-- commit, rollback, savepoint
-- autocommit is expected to be off

select * from clients;

insert into clients (name) values ('Example 1');
savepoint first_step;

insert into clients (name) values ('Example 2');

rollback to first_step; -- keep Example 1, rollback Example 2

commit; -- persist Example 1

-- rollback after commit is useless
-- rollback;