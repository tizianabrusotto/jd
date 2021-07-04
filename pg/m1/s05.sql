-- Minimal SQL

-- select all
select *
from languages;

-- insert a new row
insert into languages (language_id, name) values (5, 'Spanish');

-- update a row
update languages 
set name = 'Greek'
where language_id = 5;

-- delete a row
delete from languages
where language_id = 5;