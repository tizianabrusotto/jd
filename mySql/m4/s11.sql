-- create table w/ constraints
use me;

drop table if exists details;

create table details (
--    detail_id integer primary key
--        constraint detail_id_ck check (mod(detail_id, 2) = 1),
    detail_id integer primary key auto_increment,
    status char default 'A'
        constraint detail_status_ck check (status in ('A', 'B', 'X')),
--	status enum('A', 'B', 'X') default 'A',
--	name varchar(20),
--	name varchar(20) not null,
	name varchar(20) unique,

    exec_id integer,

    constraint details_exec_fk foreign key(exec_id) references execs(exec_id),
--    constraint details_coder_fk foreign key(coder_id) references coders(coder_id) on delete cascade,
--    constraint details_coder_fk foreign key(coder_id) references coders(coder_id) on delete set null,
        
    constraint details_name_status_uq unique(name, status)
);

insert into execs values(412, 'Bill', 'Mates', curdate(), 1950);

insert into details (exec_id) values(412);

select *
from details;

-- beware of orphans
delete from execs
where exec_id = 412;

commit;
