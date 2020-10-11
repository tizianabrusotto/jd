-- conversion

select to_char(12345.67) as "string", to_char(12345.67, '99,999.999') as "pattern"
from dual;

-- not fitting -> ####
select to_char(12345.67, '9.9') as "misfit"
from dual;

select to_char(2020, 'RN') as "roman", to_number('970,13') * 2 "doubled"
from dual;

-- from string to date, then increase
select cast('05-APR-20' as date) + 2 as "day after tomorrow"
from dual;

-- cast to NUMBER following its rules, rounding when required
select cast(12345.678 as number(10,2)) as "number(10,2)"
from dual;

-- ORA-01438: value larger than specified precision allowed for this column
select cast(12345.678 as number(4))
from dual;
