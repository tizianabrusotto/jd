-- this script should run on postgres
--
-- psql -U postgres \i setup.sql

drop database if exists me;
drop user if exists me;

create user me with password 'password';
create database me owner=me;