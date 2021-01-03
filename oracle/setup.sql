-- run this as root

-- uncomment next line after first use
drop user me cascade;

create user me identified by password account unlock;
grant connect, resource to me;
grant create view to me;

grant debug connect session to me;
grant debug any procedure to me;

alter user me quota unlimited on users;

connect me/password@localhost:1521/xepdb1

alter session set current_schema = me;

create or replace procedure drop_table_if_exists(
	p_table_name in varchar2)
is
    v_counter integer;
    v_table_name all_objects.object_name%type := upper(p_table_name);
begin
	select count(rownum)
	into v_counter
	from all_objects
    where owner = 'ME' and object_type = 'TABLE' and object_name = v_table_name;

    if v_counter != 0 then
        execute immediate 'drop table ' || v_table_name;
    end if;
end;
/

create or replace procedure drop_fk_if_exists(
	p_table_name in varchar2,
    p_fk_name in varchar2)
is
    v_count integer;
begin
    select count(rownum)
    into v_count
    from user_constraints
    where table_name = upper(p_table_name) and constraint_name = upper(p_fk_name);

    if v_count != 0 then
        execute immediate 'alter table ' || p_table_name || ' drop constraint ' || p_fk_name;
    end if;
end;
/

create or replace procedure drop_sequence_if_exists(
	p_sequence_name in varchar2)
is
    v_counter integer;    
begin
	select count(rownum)
	into v_counter
	from user_sequences
	where sequence_name = upper(p_sequence_name);

    if v_counter != 0 then
        execute immediate 'drop sequence ' || p_sequence_name;  
    end if;    
end;
/
