-- inner join
use me;

-- name of a region and name of countries for that region
select description
from regions
where region_id = 1;

select name
from countries
where region_id = 1;

-- ...
select description
from regions
where region_id = 4;

select name
from countries
where region_id = 4;

-- join the two tables and see the full result in a single shot
select regions.region_id as r_id, description, country_id, name
from regions, countries
where regions.region_id = countries.region_id;

-- using table (and column) aliases
select r.region_id as r_id, description as "Region Name", name as Country
from regions r, countries c
where r.region_id = c.region_id;