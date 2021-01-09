-- this script should run on me

drop table if exists job_history;
alter table if exists departments drop constraint if exists departments_manager_fk;
drop table if exists employees;
drop table if exists departments;
drop table if exists locations;
drop table if exists countries;
drop table if exists regions;
drop table if exists jobs;

drop table if exists team_coder;
drop table if exists teams;
drop table if exists coders;
drop table if exists clients;

drop sequence if exists language_seq;
drop table if exists languages;

drop table if exists regions;

create table regions(
	region_id serial primary key,
	region_name varchar(25)
);

start transaction;

insert into regions (region_name) values ('Europe');
insert into regions (region_name) values ('Americas');
insert into regions (region_name) values ('Asia');
insert into regions (region_name) values ('Middle East and Africa');

commit;
--
create table countries(
	country_id char(2) primary key,
	country_name varchar(40),
	region_id integer,

    constraint countries_region_fk foreign key(region_id) references regions(region_id)
);

start transaction;

insert into countries (country_id, country_name, region_id) values ('AR', 'Argentina', 2);
insert into countries (country_id, country_name, region_id) values ('AU', 'Australia', 3);
insert into countries (country_id, country_name, region_id) values ('BE', 'Belgium', 1);
insert into countries (country_id, country_name, region_id) values ('BR', 'Brazil', 2);
insert into countries (country_id, country_name, region_id) values ('CA', 'Canada', 2);
insert into countries (country_id, country_name, region_id) values ('CH', 'Switzerland', 1);
insert into countries (country_id, country_name, region_id) values ('CN', 'China', 3);
insert into countries (country_id, country_name, region_id) values ('DE', 'Germany', 1);
insert into countries (country_id, country_name, region_id) values ('DK', 'Denmark', 1);
insert into countries (country_id, country_name, region_id) values ('EG', 'Egypt', 4);
insert into countries (country_id, country_name, region_id) values ('FR', 'France', 1);
insert into countries (country_id, country_name, region_id) values ('IL', 'Israel', 4);
insert into countries (country_id, country_name, region_id) values ('IN', 'India', 3);
insert into countries (country_id, country_name, region_id) values ('IT', 'Italy', 1);
insert into countries (country_id, country_name, region_id) values ('JP', 'Japan', 3);
insert into countries (country_id, country_name, region_id) values ('KW', 'Kuwait', 4);
insert into countries (country_id, country_name, region_id) values ('ML', 'Malaysia', 3);
insert into countries (country_id, country_name, region_id) values ('MX', 'Mexico', 2);
insert into countries (country_id, country_name, region_id) values ('NG', 'Nigeria', 4);
insert into countries (country_id, country_name, region_id) values ('NL', 'Netherlands', 1);
insert into countries (country_id, country_name, region_id) values ('SG', 'Singapore', 3);
insert into countries (country_id, country_name, region_id) values ('UK', 'United Kingdom', 1);
insert into countries (country_id, country_name, region_id) values ('US', 'United States of America', 2);
insert into countries (country_id, country_name, region_id) values ('ZM', 'Zambia', 4);
insert into countries (country_id, country_name, region_id) values ('ZW', 'Zimbabwe', 4);

commit;
--
create table jobs(
	job_id varchar(10) primary key,
	job_title varchar(35) not null,
	min_salary integer,
	max_salary integer
);

start transaction;

insert into jobs (job_id, job_title, min_salary, max_salary) values ('AD_PRES', 'President', 20080, 40000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('AD_VP', 'Administration Vice President', 15000, 30000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('AD_ASST', 'Administration Assistant', 3000, 6000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('FI_MGR', 'Finance Manager', 8200, 16000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('FI_ACCOUNT', 'Accountant', 4200, 9000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('AC_MGR', 'Accounting Manager', 8200, 16000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('SA_MAN', 'Sales Manager', 10000, 20080);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('SA_REP', 'Sales Representative', 6000, 12008);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('PU_MAN', 'Purchasing Manager', 8000, 15000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('PU_CLERK', 'Purchasing Clerk', 2500, 5500);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('ST_MAN', 'Stock Manager', 5500, 8500);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('ST_CLERK', 'Stock Clerk', 2008, 5000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('SH_CLERK', 'Shipping Clerk', 2500, 5500);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('IT_PROG', 'Programmer', 4000, 10000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('MK_MAN', 'Marketing Manager', 9000, 15000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('MK_REP', 'Marketing Representative', 4000, 9000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('HR_REP', 'Human Resources Representative', 4000, 9000);
insert into jobs (job_id, job_title, min_salary, max_salary) values ('PR_REP', 'Public Relations Representative', 4500, 10500);

commit;
--
create table locations(
	location_id serial primary key,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30) not null,
	state_province varchar(25),
	country_id char(2),

    constraint locations_country_fk foreign key(country_id) references countries(country_id)
);

alter sequence locations_location_id_seq restart with 1000 increment by 100;

start transaction;

insert into locations (street_address,postal_code,city,state_province,country_id) values ('1297 Via Cola di Rienzo', '00989', 'Roma', null, 'IT');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('93091 Calle della Testa', '10934', 'Venice', null, 'IT');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('9450 Kamiya-cho', '6823', 'Hiroshima', null, 'JP');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('40-5-12 Laogianggen', '190518', 'Beijing', null, 'CN');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('198 Clementi North', '540198', 'Singapore', null, 'SG');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('8204 Arthur St', null, 'London', null, 'UK');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL');
insert into locations (street_address,postal_code,city,state_province,country_id) values ('Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX');

commit;
--
create table departments(
	department_id serial primary key,
	department_name varchar(30) not null,
	manager_id integer,
	location_id integer,

    constraint departments_location_fk foreign key(location_id) references locations(location_id)
);

alter sequence departments_department_id_seq restart with 10 increment by 10;

start transaction;

insert into departments (department_name, manager_id, location_id) values ('Administration', 200, 1700);
insert into departments (department_name, manager_id, location_id) values ('Marketing', 201, 1800);
insert into departments (department_name, manager_id, location_id) values ('Purchasing', 114, 1700);
insert into departments (department_name, manager_id, location_id) values ('Human Resources', 203, 2400);
insert into departments (department_name, manager_id, location_id) values ('Shipping', 121, 1500);
insert into departments (department_name, manager_id, location_id) values ('IT', 103, 1400);
insert into departments (department_name, manager_id, location_id) values ('Public Relations', 204, 2700);
insert into departments (department_name, manager_id, location_id) values ('Sales', 145, 2500);
insert into departments (department_name, manager_id, location_id) values ('Executive', 100, 1700);
insert into departments (department_name, manager_id, location_id) values ('Finance', 108, 1700);
insert into departments (department_name, manager_id, location_id) values ('Accounting', 205, 1700);
insert into departments (department_name, manager_id, location_id) values ('Treasury', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Corporate Tax', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Control And Credit', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Shareholder Services', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Benefits', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Manufacturing', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Construction', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Contracting', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Operations', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('IT Support', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('NOC', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('IT Helpdesk', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Government Sales', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Retail Sales', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Recruiting', null, 1700);
insert into departments (department_name, manager_id, location_id) values ('Payroll', null, 1700);

commit;

create table employees(
	employee_id serial primary key,
	first_name varchar(20),
	last_name varchar(25) not null,
	email varchar(25) unique not null,
	phone_number varchar(20),
	hire_date date not null,
	job_id varchar(10) not null,
	salary decimal(8,2),
	commission_pct decimal(2,2),
	manager_id integer,
	department_id integer,

	constraint emp_salary_min check (salary > 0),
    constraint employees_job_fk foreign key(job_id) references jobs(job_id),
    constraint employees_department_fk foreign key(department_id) references departments(department_id)
);

alter sequence employees_employee_id_seq restart with 100;

start transaction;

insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Steven','King','SKING','515.123.4567','17-JUN-03','AD_PRES','24000',null,null,'90');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Neena','Kochhar','NKOCHHAR','515.123.4568','21-SEP-05','AD_VP','17000',null,'100','90');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Lex','De Haan','LDEHAAN','515.123.4569','13-JAN-01','AD_VP','17000',null,'100','90');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Alexander','Hunold','AHUNOLD','590.423.4567','03-JAN-06','IT_PROG','9000',null,'102','60');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Bruce','Ernst','BERNST','590.423.4568','21-MAY-07','IT_PROG','6000',null,'103','60');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('David','Austin','DAUSTIN','590.423.4569','25-JUN-05','IT_PROG','4800',null,'103','60');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Valli','Pataballa','VPATABAL','590.423.4560','05-FEB-06','IT_PROG','4800',null,'103','60');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Diana','Lorentz','DLORENTZ','590.423.5567','07-FEB-07','IT_PROG','4200',null,'103','60');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Nancy','Greenberg','NGREENBE','515.124.4569','17-AUG-02','FI_MGR','12008',null,'101','100');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Daniel','Faviet','DFAVIET','515.124.4169','16-AUG-02','FI_ACCOUNT','9000',null,'108','100');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('John','Chen','JCHEN','515.124.4269','28-SEP-05','FI_ACCOUNT','8200',null,'108','100');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Ismael','Sciarra','ISCIARRA','515.124.4369','30-SEP-05','FI_ACCOUNT','7700',null,'108','100');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Jose Manuel','Urman','JMURMAN','515.124.4469','07-MAR-06','FI_ACCOUNT','7800',null,'108','100');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Luis','Popp','LPOPP','515.124.4567','07-DEC-07','FI_ACCOUNT','6900',null,'108','100');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Den','Raphaely','DRAPHEAL','515.127.4561','07-DEC-02','PU_MAN','11000',null,'100','30');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Alexander','Khoo','AKHOO','515.127.4562','18-MAY-03','PU_CLERK','3100',null,'114','30');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Shelli','Baida','SBAIDA','515.127.4563','24-DEC-05','PU_CLERK','2900',null,'114','30');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Sigal','Tobias','STOBIAS','515.127.4564','24-JUL-05','PU_CLERK','2800',null,'114','30');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Guy','Himuro','GHIMURO','515.127.4565','15-NOV-06','PU_CLERK','2600',null,'114','30');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Karen','Colmenares','KCOLMENA','515.127.4566','10-AUG-07','PU_CLERK','2500',null,'114','30');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Matthew','Weiss','MWEISS','650.123.1234','18-JUL-04','ST_MAN','8000',null,'100','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Adam','Fripp','AFRIPP','650.123.2234','10-APR-05','ST_MAN','8200',null,'100','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Payam','Kaufling','PKAUFLIN','650.123.3234','01-MAY-03','ST_MAN','7900',null,'100','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Shanta','Vollman','SVOLLMAN','650.123.4234','10-OCT-05','ST_MAN','6500',null,'100','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Kevin','Mourgos','KMOURGOS','650.123.5234','16-NOV-07','ST_MAN','5800',null,'100','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Julia','Nayer','JNAYER','650.124.1214','16-JUL-05','ST_CLERK','3200',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Irene','Mikkilineni','IMIKKILI','650.124.1224','28-SEP-06','ST_CLERK','2700',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('James','Landry','JLANDRY','650.124.1334','14-JAN-07','ST_CLERK','2400',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Steven','Markle','SMARKLE','650.124.1434','08-MAR-08','ST_CLERK','2200',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Laura','Bissot','LBISSOT','650.124.5234','20-AUG-05','ST_CLERK','3300',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Mozhe','Atkinson','MATKINSO','650.124.6234','30-OCT-05','ST_CLERK','2800',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('James','Marlow','JAMRLOW','650.124.7234','16-FEB-05','ST_CLERK','2500',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('TJ','Olson','TJOLSON','650.124.8234','10-APR-07','ST_CLERK','2100',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Jason','Mallin','JMALLIN','650.127.1934','14-JUN-04','ST_CLERK','3300',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Michael','Rogers','MROGERS','650.127.1834','26-AUG-06','ST_CLERK','2900',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Ki','Gee','KGEE','650.127.1734','12-DEC-07','ST_CLERK','2400',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Hazel','Philtanker','HPHILTAN','650.127.1634','06-FEB-08','ST_CLERK','2200',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Renske','Ladwig','RLADWIG','650.121.1234','14-JUL-03','ST_CLERK','3600',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Stephen','Stiles','SSTILES','650.121.2034','26-OCT-05','ST_CLERK','3200',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('John','Seo','JSEO','650.121.2019','12-FEB-06','ST_CLERK','2700',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Joshua','Patel','JPATEL','650.121.1834','06-APR-06','ST_CLERK','2500',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Trenna','Rajs','TRAJS','650.121.8009','17-OCT-03','ST_CLERK','3500',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Curtis','Davies','CDAVIES','650.121.2994','29-JAN-05','ST_CLERK','3100',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Randall','Matos','RMATOS','650.121.2874','15-MAR-06','ST_CLERK','2600',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Peter','Vargas','PVARGAS','650.121.2004','09-JUL-06','ST_CLERK','2500',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('John','Russell','JRUSSEL','011.44.1344.429268','01-OCT-04','SA_MAN','14000','0.4','100','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Karen','Partners','KPARTNER','011.44.1344.467268','05-JAN-05','SA_MAN','13500','0.3','100','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','10-MAR-05','SA_MAN','12000','0.3','100','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','15-OCT-07','SA_MAN','11000','0.3','100','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','29-JAN-08','SA_MAN','10500','0.2','100','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Peter','Tucker','PTUCKER','011.44.1344.129268','30-JAN-05','SA_REP','10000','0.3','145','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('David','Bernstein','DBERNSTE','011.44.1344.345268','24-MAR-05','SA_REP','9500','0.25','145','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Peter','Hall','PHALL','011.44.1344.478968','20-AUG-05','SA_REP','9000','0.25','145','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Christopher','Olsen','COLSEN','011.44.1344.498718','30-MAR-06','SA_REP','8000','0.2','145','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','09-DEC-06','SA_REP','7500','0.2','145','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Oliver','Tuvault','OTUVAULT','011.44.1344.486508','23-NOV-07','SA_REP','7000','0.15','145','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Janette','King','JKING','011.44.1345.429268','30-JAN-04','SA_REP','10000','0.35','146','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Patrick','Sully','PSULLY','011.44.1345.929268','04-MAR-04','SA_REP','9500','0.35','146','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Allan','McEwen','AMCEWEN','011.44.1345.829268','01-AUG-04','SA_REP','9000','0.35','146','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Lindsey','Smith','LSMITH','011.44.1345.729268','10-MAR-05','SA_REP','8000','0.3','146','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Louise','Doran','LDORAN','011.44.1345.629268','15-DEC-05','SA_REP','7500','0.3','146','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Sarath','Sewall','SSEWALL','011.44.1345.529268','03-NOV-06','SA_REP','7000','0.25','146','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Clara','Vishney','CVISHNEY','011.44.1346.129268','11-NOV-05','SA_REP','10500','0.25','147','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Danielle','Greene','DGREENE','011.44.1346.229268','19-MAR-07','SA_REP','9500','0.15','147','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Mattea','Marvins','MMARVINS','011.44.1346.329268','24-JAN-08','SA_REP','7200','0.1','147','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('David','Lee','DLEE','011.44.1346.529268','23-FEB-08','SA_REP','6800','0.1','147','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Sundar','Ande','SANDE','011.44.1346.629268','24-MAR-08','SA_REP','6400','0.1','147','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Amit','Banda','ABANDA','011.44.1346.729268','21-APR-08','SA_REP','6200','0.1','147','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Lisa','Ozer','LOZER','011.44.1343.929268','11-MAR-05','SA_REP','11500','0.25','148','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Harrison','Bloom','HBLOOM','011.44.1343.829268','23-MAR-06','SA_REP','10000','0.2','148','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Tayler','Fox','TFOX','011.44.1343.729268','24-JAN-06','SA_REP','9600','0.2','148','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('William','Smith','WSMITH','011.44.1343.629268','23-FEB-07','SA_REP','7400','0.15','148','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Elizabeth','Bates','EBATES','011.44.1343.529268','24-MAR-07','SA_REP','7300','0.15','148','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Sundita','Kumar','SKUMAR','011.44.1343.329268','21-APR-08','SA_REP','6100','0.1','148','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Ellen','Abel','EABEL','011.44.1644.429267','11-MAY-04','SA_REP','11000','0.3','149','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Alyssa','Hutton','AHUTTON','011.44.1644.429266','19-MAR-05','SA_REP','8800','0.25','149','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Jonathon','Taylor','JTAYLOR','011.44.1644.429265','24-MAR-06','SA_REP','8600','0.2','149','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Jack','Livingston','JLIVINGS','011.44.1644.429264','23-APR-06','SA_REP','8400','0.2','149','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Kimberely','Grant','KGRANT','011.44.1644.429263','24-MAY-07','SA_REP','7000','0.15','149',null);
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Charles','Johnson','CJOHNSON','011.44.1644.429262','04-JAN-08','SA_REP','6200','0.1','149','80');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Winston','Taylor','WTAYLOR','650.507.9876','24-JAN-06','SH_CLERK','3200',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Jean','Fleaur','JFLEAUR','650.507.9877','23-FEB-06','SH_CLERK','3100',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Martha','Sullivan','MSULLIVA','650.507.9878','21-JUN-07','SH_CLERK','2500',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Girard','Geoni','GGEONI','650.507.9879','03-FEB-08','SH_CLERK','2800',null,'120','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Nandita','Sarchand','NSARCHAN','650.509.1876','27-JAN-04','SH_CLERK','4200',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Alexis','Bull','ABULL','650.509.2876','20-FEB-05','SH_CLERK','4100',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Julia','Dellinger','JDELLING','650.509.3876','24-JUN-06','SH_CLERK','3400',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Anthony','Cabrio','ACABRIO','650.509.4876','07-FEB-07','SH_CLERK','3000',null,'121','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Kelly','Chung','KCHUNG','650.505.1876','14-JUN-05','SH_CLERK','3800',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Jennifer','Dilly','JDILLY','650.505.2876','13-AUG-05','SH_CLERK','3600',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Timothy','Gates','TGATES','650.505.3876','11-JUL-06','SH_CLERK','2900',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Randall','Perkins','RPERKINS','650.505.4876','19-DEC-07','SH_CLERK','2500',null,'122','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Sarah','Bell','SBELL','650.501.1876','04-FEB-04','SH_CLERK','4000',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Britney','Everett','BEVERETT','650.501.2876','03-MAR-05','SH_CLERK','3900',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Samuel','McCain','SMCCAIN','650.501.3876','01-JUL-06','SH_CLERK','3200',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Vance','Jones','VJONES','650.501.4876','17-MAR-07','SH_CLERK','2800',null,'123','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Alana','Walsh','AWALSH','650.507.9811','24-APR-06','SH_CLERK','3100',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Kevin','Feeney','KFEENEY','650.507.9822','23-MAY-06','SH_CLERK','3000',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Donald','OConnell','DOCONNEL','650.507.9833','21-JUN-07','SH_CLERK','2600',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Douglas','Grant','DGRANT','650.507.9844','13-JAN-08','SH_CLERK','2600',null,'124','50');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Jennifer','Whalen','JWHALEN','515.123.4444','17-SEP-03','AD_ASST','4400',null,'101','10');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Michael','Hartstein','MHARTSTE','515.123.5555','17-FEB-04','MK_MAN','13000',null,'100','20');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Pat','Fay','PFAY','603.123.6666','17-AUG-05','MK_REP','6000',null,'201','20');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Susan','Mavris','SMAVRIS','515.123.7777','07-JUN-02','HR_REP','6500',null,'101','40');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Hermann','Baer','HBAER','515.123.8888','07-JUN-02','PR_REP','10000',null,'101','70');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('Shelley','Higgins','SHIGGINS','515.123.8080','07-JUN-02','AC_MGR','12008',null,'101','110');
insert into employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) values ('William','Gietz','WGIETZ','515.123.8181','07-JUN-02','AC_ACCOUNT','8300',null,'205','110');

commit;

alter table departments add constraint departments_manager_fk foreign key(manager_id) references employees(employee_id);
alter table employees add constraint employees_manager_fk foreign key(manager_id) references employees(employee_id);
--
create table job_history(
	employee_id integer not null,
	start_date date not null,
	end_date date not null,
	job_id varchar(10) not null,
	department_id integer,

	constraint jhistory_pk primary key(employee_id, start_date),
	constraint jhistory_date_interval check (end_date > start_date),
    constraint jhistory_employee_fk foreign key(employee_id) references employees(employee_id),
    constraint jhistory_job_fk foreign key(job_id) references jobs(job_id),
    constraint jhistory_department_fk foreign key(department_id) references departments(department_id)
);

start transaction;

insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('102','13-JAN-01','24-JUL-06','IT_PROG','60');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('101','21-SEP-97','27-OCT-01','AC_ACCOUNT','110');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('101','28-OCT-01','15-MAR-05','AC_MGR','110');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('201','17-FEB-04','19-DEC-07','MK_REP','20');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('114','24-MAR-06','31-DEC-07','ST_CLERK','50');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('122','01-JAN-07','31-DEC-07','ST_CLERK','50');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('200','17-SEP-95','17-JUN-01','AD_ASST','90');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('176','24-MAR-06','31-DEC-06','SA_REP','80');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('176','01-JAN-07','31-DEC-07','SA_MAN','80');
insert into job_history (employee_id,start_date,end_date,job_id,department_id) values ('200','01-JUL-02','31-DEC-06','AC_ACCOUNT','90');

commit;
--
create table clients (
  client_id serial primary key,
  name varchar(30) not null,
  nickname varchar(10)
);

start transaction;

insert into clients (name, nickname) values('Aleph Microservices', 'Alpha');
insert into clients (name, nickname) values('Bertha Heavy Duty Industries', 'Beta');
insert into clients (name, nickname) values('Teragamma Consulting', 'Gamma');
insert into clients (name, nickname) values('Delta Oscar Services', 'Delta');

commit;
--
create table coders (
  coder_id serial primary key,
  first_name varchar(20),
  last_name varchar(25),
  hire_date date not null,
  salary decimal(8, 2),
  
  constraint coders_name_uq unique(first_name, last_name)
);

alter sequence coders_coder_id_seq restart with 201;

start transaction;

insert into coders(coder_id, first_name, last_name, hire_date, salary)
    select employee_id, first_name, last_name, hire_date, salary
    from employees
    where department_id = 60;

insert into coders (first_name, last_name, hire_date, salary) values ('Tim', 'Ice', current_date, 5760);

commit;

-- a procedure on coders

create or replace procedure get_coder_salary(
	p_coder_id in coders.coder_id%type,
    p_salary inout coders.salary%type)
language plpgsql as $$ begin
	select salary
	into p_salary
	from coders
	where coder_id = p_coder_id;
end; $$;
--
create table teams(
	team_id serial primary key,
	name varchar(25) not null,
    leader_id integer unique not null,
    client_id integer not null,
    constraint teams_leader_fk foreign key(leader_id) references coders(coder_id),
    constraint teams_client_fk foreign key(client_id) references clients(client_id)
);

start transaction;

insert into teams(name, leader_id, client_id) values('red', 103, 1);
insert into teams(name, leader_id, client_id) values('blue', 107, 1);
insert into teams(name, leader_id, client_id) values('green', 105, 2);

commit;
--
create table team_coder(
	team_id integer,
    coder_id integer,
	constraint team_coder_pk primary key(team_id, coder_id),
    constraint team_coder_fk foreign key(team_id) references teams(team_id),
    constraint coder_team_fk foreign key(coder_id) references coders(coder_id)
);

start transaction;

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
--
create sequence language_seq;

create table languages (
  language_id integer primary key,
  name varchar(25) unique not null
);
 
start transaction;

insert into languages values(nextval('language_seq'), 'English');
insert into languages values(nextval('language_seq'), 'Italian');
insert into languages values(nextval('language_seq'), 'German');
insert into languages values(nextval('language_seq'), 'French');

commit;