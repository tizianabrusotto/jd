-- run it as root

-- drop user me;

create user me identified by password account unlock;
grant connect, resource to me;
alter user me quota unlimited on users;
