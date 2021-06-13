-- run this as admin on ADW - Oracle Autonomous Data Warehouse

-- drop user me cascade;

create user me identified by S4feP4ssword account unlock;
grant dwrole to me;

alter user me quota unlimited on data;

grant connect, resource to me;
grant create view to me;

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
