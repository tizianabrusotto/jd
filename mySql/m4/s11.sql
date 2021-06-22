-- truncate / drop table
use me;

-- get rid of all rows (DML)
delete from other_constraints;

-- get rid of all rows (DDL)
truncate table other_constraints;

-- get rid of the table (DDL)
drop table other_constraints;

-- do not fail if table is missing
drop table if exists other_constraints;
