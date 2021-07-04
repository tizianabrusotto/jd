-- conversion

-- varchar cast
select cast(12345.67 as varchar);
select 12345.67::varchar;

-- date cast
select cast('2021-07-01' as date);
select cast('01-jul-21' as date);
select '01-jul-21'::date;