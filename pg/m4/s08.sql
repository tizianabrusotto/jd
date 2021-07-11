-- truncate / drop table

select * from other_constraints;

-- get rid of all rows (DML)
-- autocommit off
delete from other_constraints;

-- get rid of all rows (same as above, but faster)
truncate table other_constraints;

-- get rid of the table
 drop table other_constraints;

-- do not fail if table is missing
 drop table if exists other_constraints;
