-- run this script with SQL*Plus connected as me to populate the ME schema

alter session set current_schema = me;

begin
    drop_sequence_if_exists('TEAM_SEQ');
    drop_sequence_if_exists('CODER_SEQ');
    drop_sequence_if_exists('CLIENT_SEQ');
    
    drop_table_if_exists('TEAM_CODER');
    drop_table_if_exists('TEAMS');
    drop_table_if_exists('CODERS');
    drop_table_if_exists('CLIENTS');
end;
/

--
create sequence coder_seq start with 201;
create sequence team_seq;
create sequence client_seq;

--
create table clients (
  client_id integer primary key,
  name varchar2(25) not null,
  nickname varchar2(10)
);

insert into clients values(client_seq.nextval, 'Aleph Microservices', 'Alpha');
insert into clients values(client_seq.nextval, 'Bertha Heavy Duty Industries', 'Beta');
insert into clients values(client_seq.nextval, 'Teragamma Consulting', 'Gamma');
insert into clients values(client_seq.nextval, 'Delta Oscar Services', 'Delta');

commit;

--
create table coders
as
    select employee_id as coder_id, first_name, last_name, hire_date, salary
    from hr.employees
    where department_id = 60;

alter table coders modify coder_id int primary key;
alter table coders add constraint coders_name_uq unique (first_name, last_name);

insert into coders (coder_id, first_name, last_name, hire_date, salary)
values (coder_seq.nextval, 'Tim', 'Ice', sysdate, 5760);

commit;

-- a procedure on coders

create or replace procedure get_coder_salary(
	p_coder_id in coders.coder_id%type,
    p_salary out coders.salary%type) is
begin
	select salary
	into p_salary
	from coders
	where coder_id = p_coder_id;
end;
/

create table teams(
	team_id integer primary key,
	name varchar(25) not null,
    leader_id integer unique not null,
    client_id integer not null,
    constraint teams_leader_fk foreign key(leader_id) references coders(coder_id),
    constraint teams_client_fk foreign key(client_id) references clients(client_id)
);

insert into teams(team_id, name, leader_id, client_id) values(team_seq.nextval, 'red', 103, 1);
insert into teams(team_id, name, leader_id, client_id) values(team_seq.nextval, 'blue', 107, 1);
insert into teams(team_id, name, leader_id, client_id) values(team_seq.nextval, 'green', 105, 2);

commit;

-- 
create table team_coder(
	team_id integer,
    coder_id integer,
	constraint team_coder_pk primary key(team_id, coder_id),
    constraint team_coder_fk foreign key(team_id) references teams(team_id),
    constraint coder_team_fk foreign key(coder_id) references coders(coder_id)
);

insert into team_coder values(1, 104);
insert into team_coder values(1, 106);
insert into team_coder values(1, 201);
insert into team_coder values(2, 105);
insert into team_coder values(2, 106);
insert into team_coder values(2, 107);
insert into team_coder values(3, 105);
insert into team_coder values(3, 106);
insert into team_coder values(3, 103);

commit;
