-- run it on MySQL as root

drop user if exists me;
drop schema if exists me;

-- !!! don't choose such a lousy password in real life! !!!
create user me identified by 'password';
create schema me;

grant all privileges on me.* to me;
grant alter routine on me.* to me;

use me;

DELIMITER //

create procedure drop_fk_if_exists(
	in my_table varchar(64),
    in my_fk varchar(64)
) begin
	if exists(
		select enforced
        from information_schema.table_constraints
		where table_schema = schema() and table_name = my_table and constraint_name = my_fk and constraint_type = 'FOREIGN KEY')
	then
		set @query = concat('ALTER TABLE ', my_table, ' DROP FOREIGN KEY ', my_fk, ';');
 		prepare stmt from @query;
		execute stmt;
		deallocate prepare stmt;
 	end if;
end;

//
DELIMITER ;

