-- index

-- index on a column
create index on execs(last_name);

-- index on more columns
create index on execs(first_name, last_name);

-- get rid of indices, by index name
drop index execs_first_name_last_name_idx;
drop index execs_last_name_idx;
