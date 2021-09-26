-- conversion functions

use me;

-- explicit cast to char
select cast(12345.67 as char);

-- explicit cast to date
select cast('2021-10-01' as date);

-- bad format -> NULL
select cast('01-10-2021' as date);
