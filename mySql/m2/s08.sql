-- cross join
use me;

-- cartesian product - non SQL/92 compliant!
select description, name
from regions join teams;

-- cartesian product - right SQL/92 syntax
select description, name
from regions cross join teams;

-- "classic" cartesian product
select description, name
from regions, teams;
