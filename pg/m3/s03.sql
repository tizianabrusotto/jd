-- string function

-- char and its representation
select ascii('A') as "A", chr(90) as "90";

-- string concatenation
select concat(first_name, ' ', last_name) as "name" from employees;
select first_name || ' ' || last_name as "name" from employees;

-- upper and lower case
select upper('upper') up, lower('LOWER') low;

-- find substring
select position('ba' in 'crab' ) as "not found", position('ra' in 'crab' ) as pos;

-- string size
select length('name');