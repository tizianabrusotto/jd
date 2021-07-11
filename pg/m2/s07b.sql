-- using UNION to emulate an inner join

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
