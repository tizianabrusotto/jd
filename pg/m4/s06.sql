-- constraints

drop table if exists some_constraints;

create table some_constraints (
	pk integer primary key,
    a integer,
    b integer not null,
    c integer unique,
    d integer unique not null,
    e integer,
    f integer,
    g integer check (g > 100),
    
	unique (e),
	foreign key (f) references clients(client_id)
);

select * from some_constraints;

-- SQL Error [23502]: ERROR: null value in column "pk" of relation "some_constraints" violates not-null constraint
insert into some_constraints (pk, a, b, c, d, e, f, g) values (null, null, null, null, null, null, null, null);

-- SQL Error [23502]: ERROR: null value in column "b" of relation "some_constraints" violates not-null constraint
insert into some_constraints (pk, a, b, c, d, e, f, g) values (1, null, null, null, null, null, null, null);

-- SQL Error [23502]: ERROR: null value in column "d" of relation "some_constraints" violates not-null constraint
insert into some_constraints (pk, a, b, c, d, e, f, g) values (1, null, 1, null, null, null, null, null);

-- OK
insert into some_constraints (pk, a, b, c, d, e, f, g) values (1, null, 1, null, 1, null, null, null);
-- OK
insert into some_constraints (pk, a, b, c, d, e, f, g) values (2, null, 1,     1,2,    1, null, null);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraints_c_key"
insert into some_constraints (pk, a, b, c, d, e, f, g) values (3, 1, 1, 1, 3, 2, null, null);

-- OK
insert into some_constraints (pk, a, b, c, d, e, f, g) values (3, 1, 1, 2, 3, 2, null, null);

-- !! TO BE REVIEWED !! 
-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraints_d_key"
insert into some_constraints (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 3, 2, null, null);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraints_e_key"
insert into some_constraints (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 4, 2, null, null);

-- OK
insert into some_constraints (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 4, 3, null, null);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraints_pkey"
insert into some_constraints (pk, a, b, c, d, e, f, g) values (4, 1, 1, 4, 5, 4, null, null);

-- OK
insert into some_constraints (pk, a, b, c, d, e, f, g) values (5, 1, 1, 4, 5, 4, null, null);

-- SQL Error [23503]: ERROR: insert or update on table "some_constraints" violates foreign key constraint "some_constraints_f_fkey"
--  Detail: Key (f)=(100) is not present in table "clients".
insert into some_constraints (pk, a, b, c, d, e, f, g) values (6, 1, 1, 5, 6, 5, 100, null);

-- OK
insert into some_constraints (pk, a, b, c, d, e, f, g) values (6, 1, 1, 5, 6, 5, 1, null);

-- SQL Error [23514]: ERROR: new row for relation "some_constraints" violates check constraint "some_constraints_g_check"
insert into some_constraints (pk, a, b, c, d, e, f, g) values (7, 1, 1, 6, 7, 6, 1, 100);

-- OK
insert into some_constraints (pk, a, b, c, d, e, f, g) values (7, 1, 1, 6, 7, 6, 1, 101);

--
--
--

drop table if exists other_constraints;

create table other_constraints (
	pk serial,
    a integer,
    b integer,
    f integer,
    
    primary key(pk),
    unique(a, b),
	foreign key (f) references clients(client_id) on delete cascade
--    constraint foreign key (f) references clients(client_id) on delete set null
);

select * from other_constraints;

insert into other_constraints default values;
insert into other_constraints (a, b) values (1, 1);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "other_constraints_a_b_key"
insert into other_constraints (a, b) values (1, 1);
