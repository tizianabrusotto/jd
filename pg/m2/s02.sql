-- inner join

-- !!! VERY BAD IDEA !!!
-- using UNION to emulate a join - long, difficult, error prone
select region_id, description
from regions;

-- 1|Europe
-- 2|Americas
-- 3|Asia
-- 4|Middle East and Africa

	select region_id as r_id, 'Europe' as "region name", country_id, name as country
	from countries
	where region_id = 1
union
	select region_id as r_id, 'Americas', country_id, name
	from countries
	where region_id = 2
union
	select region_id as r_id, 'Asia', country_id, name
	from countries
	where region_id = 3
union
	select region_id as r_id, 'Middle East and Africa', country_id, name as country
	from countries
	where region_id = 4
order by 1, 4;

-- join the two tables and see the full result in a single shot
select regions.region_id as r_id, description as "region name", country_id, name as country
from regions, countries
where regions.region_id = countries.region_id
order by 1, 4;

-- table alias
select r.region_id as r_id, description as "region name", country_id, name as country
from regions r, countries c
where r.region_id = c.region_id
order by 1, 4;
