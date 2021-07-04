-- inner join: using / on / natural

-- join-using, handier
select description, name
from regions join countries
using (region_id);

-- join-on, more flexible
select description, name
from regions r join countries c
on r.region_id = c.region_id;

-- natural join
select description, name
from regions natural join countries;