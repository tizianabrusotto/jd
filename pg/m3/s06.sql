-- date functions

-- current date (and time)
select current_date, current_timestamp;
select now();

-- operators -, +
select current_date - 1 as yesterday, current_date + 1 as tomorrow;

select extract(year from now()), extract(month from now()), extract(dow from now()), extract(doy from now());