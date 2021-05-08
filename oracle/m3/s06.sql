-- date functions

-- 2020-12-31
alter session set nls_date_format = 'YYYY-MM-DD';
select sysdate from dual;

-- 31-DIC-20
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ITALIAN';
select sysdate from dual;

-- 31-DEC-20
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
select sysdate from dual;

select add_months(sysdate, 3)
from dual;

select months_between(sysdate, date'2020-12-31')
from dual;

select next_day(sysdate, 'mon')
from dual;

select last_day(sysdate)
from dual;

select round(sysdate, 'year'), round(sysdate, 'month')
from dual;

select trunc(sysdate, 'year'), trunc(sysdate, 'month')
from dual;
