-- examples on comparison operators
use hron;

-- equality
select *
from region
where region_id = 1;

-- difference
select *
from region
where region_id != 2;

-- difference, alternative notation
select *
from region
where region_id <> 2;

-- strictly less than
select *
from region
where region_id < 3;

-- less or equal to
select *
from region
where region_id <= 3;

-- strictly bigger than
select *
from region
where region_id > 3;

-- greater or equal to
select *
from region
where region_id >= 3;

-- simple pattern matching
-- "like" a string starting with one char, then "ull", then 0, 1 or more chars
select first_name, last_name
from employee
where last_name like '_ull%';

-- "like" a string having an "m" anywhere
select name
from region
where name like '%m%';

-- "like" a string having a lowercase "m" anywhere
select name
from region
where name like binary '%m%';

-- starting with "a"
select first_name, last_name
from employee
where last_name like 'A%';

-- ...
select first_name, last_name
from employee
where last_name like '__ll%';

-- ...
select last_name
from employee
where last_name like '___';

-- implicit cast to string before checking the pattern
select last_name, first_name, hired
from employee
where hired like '2015%';

select last_name, first_name, hired
from employee
where hired like '%-05-%';

-- interval check with "between ... and ..."
select *
from region
where region_id between 1 and 3;

-- "between" strings
select *
from country
where name between 'belgium' and 'china';

-- ...
select *
from countries
where name between 'i' and 'j';

-- "between" dates
select last_name, first_name, hired
from employee
where hired between '2015-01-01' and '2015-12-31';

-- check if "in" a set
select *
from region
where region_id in (4, 2, 1);

-- "not like"
-- not an "a" anywhere
select name
from region
where name not like '%a%';

-- check if (not) in a set
select *
from region
where region_id not in (2, 4);

-- beware of null
select *
from employee
where commission not in (.30, null);

-- "is (not) null" is the only way to check it
select *
from employee
where commission is not null;

-- this one works fine
select *
from employee
where commission in (0.10, 0.15);

-- can't compare a 'good' value with null
select *
from region
where name not in (null) or name in (null);

-- this one works as expected
select *
from region
where name is not null or name is null;
