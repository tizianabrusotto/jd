-- join - on, using, natural, classic - where
use me;

-- join using
select description, name
from regions join countries
using (region_id)
where region_id = 1;

-- join on
select description, name
from regions r join countries c
on r.region_id = c.region_id
where r.region_id = 1;

-- natural join
select description, name
from regions natural join countries
where region_id = 1;

-- "classic" join
select description, name
from regions r, countries c
where r.region_id = c.region_id and r.region_id = 1;
