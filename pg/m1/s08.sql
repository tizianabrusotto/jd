-- comparison operators

-- that one
select *
from regions
where region_id = 1;

select *
from regions
where description = 'Asia';

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

-- notice: <, <=, >, >= operators on strings are case insensitive
select *
from regions
where description < 'asia';

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

-- case insensitive pattern matching
select first_name, last_name
from employees
where last_name ilike 'b%';

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
where last_name ilike 'sul%';

-- interval check by BETWEEN
select *
from regions
where region_id between 1 and 3;

-- notice: BETWEEN operator is case insensitive
select *
from countries
where name between 'a' and 'c';

select *
from countries
where name >= 'a' and name <= 'c';

select *
from countries
where name between 'c' and 'china';

-- check if (not) in a set by operator IN
select *
from regions
where region_id not in (2, 4);

select *
from regions
where region_id in (4, 2);

-- notice: IN operator is case sensitive
select *
from regions
where description in ('Europe', 'asia');

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
