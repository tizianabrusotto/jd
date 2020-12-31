-- run this as root
-- extracted from the script setup.sql

-- drop user me cascade;

create user me identified by password account unlock;
grant connect, resource to me;

alter user me quota unlimited on users;
