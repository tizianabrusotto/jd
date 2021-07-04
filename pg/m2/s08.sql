-- cross join

-- cartesian product - SQL/92
select description, name
from regions cross join teams;

-- "classic" cartesian product
select description, name
from regions, teams;
