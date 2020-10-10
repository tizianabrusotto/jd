-- run this as root

-- uncomment next line after first use
-- drop user me cascade;

create user me identified by password account unlock;
grant connect, resource to me;
grant create view to me;
grant select on hr.employees to me;

grant debug connect session to me;
grant debug any procedure to me;

alter user me quota unlimited on users;

connect me/password

alter session set current_schema = me;

create or replace procedure drop_sequence_if_exists(
	p_sequence_name in varchar2)
is
    v_counter integer;    
begin
	select count(rownum)
	into v_counter
	from user_sequences
	where sequence_name = p_sequence_name;

    if v_counter != 0 then
        execute immediate 'drop sequence ' || upper(p_sequence_name);  
    end if;    
end;
/

create or replace procedure drop_table_if_exists(
	p_table_name in varchar2)
is
    v_counter integer;    
begin
	select count(rownum)
	into v_counter
	from all_objects
    where object_type = 'TABLE' and object_name = p_table_name;

    if v_counter != 0 then
        execute immediate 'drop table ' || upper(p_table_name);  
    end if;    
end;
/

