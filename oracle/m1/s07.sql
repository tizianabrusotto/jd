-- information on tables

alter session set current_schema = hr;

-- tables in the current database
select table_name
from user_tables;

-- table information
-- specific to Oracle DB
describe countries;

select column_name, nullable, data_type, data_length, data_precision, data_scale
from user_tab_columns
where table_name = 'JOBS';
