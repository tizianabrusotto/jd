-- comparison operators /2
use me;

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

select last_name, first_name, hire_date
from employees
where hire_date not like '2005%';

select last_name, first_name, hire_date
from employees
where hire_date like '____-05-%';

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
where description not in (null) or description in (null);

-- this one works as expected
select *
from regions
where description is not null or description is null;

-- this one is wrong
select *
from regions
where description != null or description = null;

-- this one works fine
select *
from employees
where commission_pct in (0.10, 0.15);

-- this one does not select anything!
select *
from employees
where commission_pct in (null);

-- "is null" is the only way to check it
select *
from employees
where commission_pct is not null;
