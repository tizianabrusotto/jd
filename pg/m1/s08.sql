-- comparison operators /1
use me;

-- that one
select *
from regions
where region_id = 1;

-- the other ones
select *
from regions
where region_id != 2;

-- the other ones, alternative notation
select *
from regions
where region_id <> 2;

-- strictly less than
select *
from regions
where region_id < 3;

-- less or equal to
select *
from regions
where region_id <= 3;

-- simple pattern matching
select first_name, last_name
from employees
where last_name like '_ull%';

select first_name, last_name
from employees
where last_name like 'B%';

select first_name, last_name
from employees
where last_name like '__ll%';

select first_name, last_name
from employees
where last_name like '%ull_';

select last_name
from employees
where last_name like '___';

select last_name
from employees
where last_name like 'sul%';

-- interval check
select *
from regions
where region_id between 1 and 3;

select *
from countries
where name between 'a' and 'c';

select *
from countries
where name between 'c' and 'china';

-- check if (not) in a set
select *
from regions
where region_id not in (2, 4);

select *
from regions
where region_id in (4, 2);

-- beware of null
select *
from regions
where region_id not in (2, 3, null);

select *
from regions
where description not in ('Europe', null);

-- can't compare a 'good' value with null
select *
from regions
where region_id not in (null) or region_id in (null);

select *
from regions
where region_id is not null or region_id is null;

-- this works fine
select *
from employees
where commission_pct in (0.10, 0.15);

-- this does not select anything!
select *
from employees
where commission_pct in (null);

-- "is null" is the only way to check it
select *
from employees
where commission_pct is not null;
