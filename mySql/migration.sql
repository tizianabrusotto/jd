-- source this script from MySQL

use me;

-- main tables cleanup
drop table if exists job_history;
call drop_fk_if_exists('departments', 'departments_manager_fk');
drop table if exists employees;
drop table if exists departments;
drop table if exists locations;
drop table if exists countries;
drop table if exists regions;
drop table if exists jobs;

create table regions(
	region_id integer primary key auto_increment,
	name varchar(25)
);

insert into regions (name) values ('Europe'), ('Americas'), ('Asia'), ('Middle East and Africa');
commit;

create table countries(
	country_id char(2) primary key,
	name varchar(40),
	region_id integer,

    constraint countries_region_fk foreign key(region_id) references regions(region_id)
);

insert into countries (country_id, name, region_id) values
	('AR','Argentina', 2), ('AU', 'Australia', 3), ('BE', 'Belgium', 1),  ('BR', 'Brazil', 2), ('CA', 'Canada', 2),
    ('CH', 'Switzerland', 1), ('CN', 'China', 3), ('DE', 'Germany', 1), ('DK', 'Denmark', 1), ('EG', 'Egypt', '4'),
    ('FR', 'France', 1), ('IL', 'Israel', '4'), ('IN', 'India', 3), ('IT', 'Italy', 1), ('JP', 'Japan', 3), ('KW', 'Kuwait', '4'),
    ('ML', 'Malaysia', 3), ('MX', 'Mexico', 2), ('NG', 'Nigeria', '4'), ('NL', 'Netherlands', 1), ('SG', 'Singapore', 3),
    ('UK', 'United Kingdom', 1), ('US', 'United States of America', 2), ('ZM', 'Zambia', '4'), ('ZW', 'Zimbabwe', '4');

commit;

create table jobs(
	job_id varchar(10) primary key,
	title varchar(35) not null,
	min_salary decimal(6,0),
	max_salary decimal(6,0)
);

insert into jobs (job_id, title, min_salary, max_salary) values
	('AD_PRES', 'President', 20080, 40000), ('AD_VP', 'Administration Vice President', 15000, 30000),
	('AD_ASST', 'Administration Assistant', 3000, 6000), ('FI_MGR', 'Finance Manager', 8200, 16000),
	('FI_ACCOUNT', 'Accountant', 4200, 9000), ('AC_MGR', 'Accounting Manager', 8200, 16000),
	('AC_ACCOUNT', 'Public Accountant', 4200, 9000), ('SA_MAN', 'Sales Manager', 10000, 20080),
	('SA_REP', 'Sales Representative', 6000, 12008), ('PU_MAN', 'Purchasing Manager', 8000, 15000),
    ('PU_CLERK', 'Purchasing Clerk', 2500, 5500), ('ST_MAN', 'Stock Manager', 5500, 8500),
	('ST_CLERK', 'Stock Clerk', 2008, 5000), ('SH_CLERK', 'Shipping Clerk', 2500, 5500),
	('IT_PROG', 'Programmer', 4000, 10000), ('MK_MAN', 'Marketing Manager', 9000, 15000),
	('MK_REP', 'Marketing Representative', 4000, 9000), ('HR_REP', 'Human Resources Representative', 4000, 9000),
    ('PR_REP', 'Public Relations Representative', 4500, 10500);

commit;

create table locations(
	location_id integer primary key auto_increment,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30) not null,
	state_province varchar(25),
	country_id char(2),

    constraint locations_country_fk foreign key(country_id) references countries(country_id)
);

insert into locations (street_address, postal_code, city, state_province, country_id) values
	('Via Cola di Rienzo, 1297', '00989', 'Roma', null, 'IT'), ('Calle della Testa, 93091', '10934', 'Venice', null, 'IT'),
    ('2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'), ('9450 Kamiya-cho', '6823', 'Hiroshima', null, 'JP'),
    ('2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'), ('2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
    ('2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'), ('2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
    ('147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'), ('6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
    ('40-5-12 Laogianggen', '190518', 'Beijing', null, 'CN'), ('1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
    ('12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'), ('198 Clementi North', '540198', 'Singapore', null, 'SG'),
    ('8204 Arthur St', null, 'London', null, 'UK'), ('Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
    ('9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK'), ('Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
    ('Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'), ('20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
    ('Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'), ('Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
    ('Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal,', 'MX');

commit;

create table departments(
	department_id integer primary key auto_increment,
	name varchar(30) not null,
	manager_id integer,
	location_id integer,

    constraint departments_location_fk foreign key(location_id) references locations(location_id)
);

insert into departments (name, manager_id, location_id) values
	('Administration', 200, 8), ('Marketing', 201, 9), ('Purchasing', 114, 8), ('Human Resources', 203, 15),
    ('Shipping', 121, 6), ('IT', 103, 5), ('Public Relations', 204, 18), ('Sales', 145, 16), ('Executive', 100, 8),
    ('Finance', 108, 8), ('Accounting', 205, 8), ('Treasury', null, 8), ('Corporate Tax', null, 8), ('Control And Credit', null, 8),
    ('Shareholder Services', null, 8), ('Benefits', null, 8), ('Manufacturing', null, 8), ('Construction', null, 8), ('Contracting', null, 8),
    ('Operations', null, 8), ('IT Support', null, 8), ('NOC', null, 8), ('IT Helpdesk', null, 8), ('Government Sales', null, 8),
    ('Retail Sales', null, 8), ('Recruiting', null, 8), ('Payroll', null, 8);

commit;

create table employees(
	employee_id integer primary key auto_increment,
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

	constraint employees_salary_min check (salary > 0),
    constraint employees_job_fk foreign key(job_id) references jobs(job_id),
    constraint employees_department_fk foreign key(department_id) references departments(department_id)
);

alter table employees auto_increment = 100;

insert into employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values
 ('Steven','King','SKING','515.123.4567', str_to_date('17-JUN-03','%d-%b-%y'),'AD_PRES','24000',null,null, 9),
 ('Neena','Kochhar','NKOCHHAR','515.123.4568', str_to_date('21-SEP-05','%d-%b-%y'),'AD_VP','17000',null, 100, 9),
 ('Lex','De Haan','LDEHAAN','515.123.4569', str_to_date('13-JAN-01','%d-%b-%y'),'AD_VP','17000',null, 100, 9),
 ('Alexander','Hunold','AHUNOLD','590.423.4567', str_to_date('03-JAN-06','%d-%b-%y'),'IT_PROG','9000',null, 102, 6),
 ('Bruce','Ernst','BERNST','590.423.4568', str_to_date('21-MAY-07','%d-%b-%y'),'IT_PROG','6000',null, 103, 6),
 ('David','Austin','DAUSTIN','590.423.4569', str_to_date('25-JUN-05','%d-%b-%y'),'IT_PROG','4800',null, 103, 6),
 ('Valli','Pataballa','VPATABAL','590.423.4560', str_to_date('05-FEB-06','%d-%b-%y'),'IT_PROG','4800',null, 103, 6),
 ('Diana','Lorentz','DLORENTZ','590.423.5567', str_to_date('07-FEB-07','%d-%b-%y'),'IT_PROG','4200',null, 103, 6),
 ('Nancy','Greenberg','NGREENBE','515.124.4569', str_to_date('17-AUG-02','%d-%b-%y'),'FI_MGR','12008',null, 101, 10),
 ('Daniel','Faviet','DFAVIET','515.124.4169', str_to_date('16-AUG-02','%d-%b-%y'),'FI_ACCOUNT','9000',null, 108, 10),
 ('John','Chen','JCHEN','515.124.4269', str_to_date('28-SEP-05','%d-%b-%y'),'FI_ACCOUNT','8200',null, 108, 10),
 ('Ismael','Sciarra','ISCIARRA','515.124.4369', str_to_date('30-SEP-05','%d-%b-%y'),'FI_ACCOUNT','7700',null, 108, 10),
 ('Jose Manuel','Urman','JMURMAN','515.124.4469', str_to_date('07-MAR-06','%d-%b-%y'),'FI_ACCOUNT','7800',null, 108, 10),
 ('Luis','Popp','LPOPP','515.124.4567', str_to_date('07-DEC-07','%d-%b-%y'),'FI_ACCOUNT','6900',null, 108, 10),
 ('Den','Raphaely','DRAPHEAL','515.127.4561', str_to_date('07-DEC-02','%d-%b-%y'),'PU_MAN','11000',null, 100, 3),
 ('Alexander','Khoo','AKHOO','515.127.4562', str_to_date('18-MAY-03','%d-%b-%y'),'PU_CLERK','3100',null, 114, 3),
 ('Shelli','Baida','SBAIDA','515.127.4563', str_to_date('24-DEC-05','%d-%b-%y'),'PU_CLERK','2900',null, 114, 3),
 ('Sigal','Tobias','STOBIAS','515.127.4564', str_to_date('24-JUL-05','%d-%b-%y'),'PU_CLERK','2800',null, 114, 3),
 ('Guy','Himuro','GHIMURO','515.127.4565', str_to_date('15-NOV-06','%d-%b-%y'),'PU_CLERK','2600',null, 114, 3),
 ('Karen','Colmenares','KCOLMENA','515.127.4566', str_to_date('10-AUG-07','%d-%b-%y'),'PU_CLERK','2500',null, 114, 3),
 ('Matthew','Weiss','MWEISS','650.123.1234', str_to_date('18-JUL-04','%d-%b-%y'),'ST_MAN','8000',null, 100, 5),
 ('Adam','Fripp','AFRIPP','650.123.2234', str_to_date('10-APR-05','%d-%b-%y'),'ST_MAN','8200',null, 100, 5),
 ('Payam','Kaufling','PKAUFLIN','650.123.3234', str_to_date('01-MAY-03','%d-%b-%y'),'ST_MAN','7900',null, 100, 5),
 ('Shanta','Vollman','SVOLLMAN','650.123.4234', str_to_date('10-OCT-05','%d-%b-%y'),'ST_MAN','6500',null, 100, 5),
 ('Kevin','Mourgos','KMOURGOS','650.123.5234', str_to_date('16-NOV-07','%d-%b-%y'),'ST_MAN','5800',null, 100, 5),
 ('Julia','Nayer','JNAYER','650.124.1214', str_to_date('16-JUL-05','%d-%b-%y'),'ST_CLERK','3200',null, 120, 5),
 ('Irene','Mikkilineni','IMIKKILI','650.124.1224', str_to_date('28-SEP-06','%d-%b-%y'),'ST_CLERK','2700',null, 120, 5),
 ('James','Landry','JLANDRY','650.124.1334', str_to_date('14-JAN-07','%d-%b-%y'),'ST_CLERK','2400',null, 120, 5),
 ('Steven','Markle','SMARKLE','650.124.1434', str_to_date('08-MAR-08','%d-%b-%y'),'ST_CLERK','2200',null, 120, 5),
 ('Laura','Bissot','LBISSOT','650.124.5234', str_to_date('20-AUG-05','%d-%b-%y'),'ST_CLERK','3300',null, 121, 5),
 ('Mozhe','Atkinson','MATKINSO','650.124.6234', str_to_date('30-OCT-05','%d-%b-%y'),'ST_CLERK','2800',null, 121, 5),
 ('James','Marlow','JAMRLOW','650.124.7234', str_to_date('16-FEB-05','%d-%b-%y'),'ST_CLERK','2500',null, 121, 5),
 ('TJ','Olson','TJOLSON','650.124.8234', str_to_date('10-APR-07','%d-%b-%y'),'ST_CLERK','2100',null, 121, 5),
 ('Jason','Mallin','JMALLIN','650.127.1934', str_to_date('14-JUN-04','%d-%b-%y'),'ST_CLERK','3300',null, 122, 5),
 ('Michael','Rogers','MROGERS','650.127.1834', str_to_date('26-AUG-06','%d-%b-%y'),'ST_CLERK','2900',null, 122, 5),
 ('Ki','Gee','KGEE','650.127.1734', str_to_date('12-DEC-07','%d-%b-%y'),'ST_CLERK','2400',null, 122, 5),
 ('Hazel','Philtanker','HPHILTAN','650.127.1634', str_to_date('06-FEB-08','%d-%b-%y'),'ST_CLERK','2200',null, 122, 5),
 ('Renske','Ladwig','RLADWIG','650.121.1234', str_to_date('14-JUL-03','%d-%b-%y'),'ST_CLERK','3600',null, 123, 5),
 ('Stephen','Stiles','SSTILES','650.121.2034', str_to_date('26-OCT-05','%d-%b-%y'),'ST_CLERK','3200',null, 123, 5),
 ('John','Seo','JSEO','650.121.2019', str_to_date('12-FEB-06','%d-%b-%y'),'ST_CLERK','2700',null, 123, 5),
 ('Joshua','Patel','JPATEL','650.121.1834', str_to_date('06-APR-06','%d-%b-%y'),'ST_CLERK','2500',null, 123, 5),
 ('Trenna','Rajs','TRAJS','650.121.8009', str_to_date('17-OCT-03','%d-%b-%y'),'ST_CLERK','3500',null, 124, 5),
 ('Curtis','Davies','CDAVIES','650.121.2994', str_to_date('29-JAN-05','%d-%b-%y'),'ST_CLERK','3100',null, 124, 5),
 ('Randall','Matos','RMATOS','650.121.2874', str_to_date('15-MAR-06','%d-%b-%y'),'ST_CLERK','2600',null, 124, 5),
 ('Peter','Vargas','PVARGAS','650.121.2004', str_to_date('09-JUL-06','%d-%b-%y'),'ST_CLERK','2500',null, 124, 5),
 ('John','Russell','JRUSSEL','011.44.1344.429268', str_to_date('01-OCT-04','%d-%b-%y'),'SA_MAN','14000','0.4', 100, 8),
 ('Karen','Partners','KPARTNER','011.44.1344.467268', str_to_date('05-JAN-05','%d-%b-%y'),'SA_MAN','13500','0.3', 100, 8),
 ('Alberto','Errazuriz','AERRAZUR','011.44.1344.429278', str_to_date('10-MAR-05','%d-%b-%y'),'SA_MAN','12000','0.3', 100, 8),
 ('Gerald','Cambrault','GCAMBRAU','011.44.1344.619268', str_to_date('15-OCT-07','%d-%b-%y'),'SA_MAN','11000','0.3', 100, 8),
 ('Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018', str_to_date('29-JAN-08','%d-%b-%y'),'SA_MAN','10500','0.2', 100, 8),
 ('Peter','Tucker','PTUCKER','011.44.1344.129268', str_to_date('30-JAN-05','%d-%b-%y'),'SA_REP','10000','0.3', 145, 8),
 ('David','Bernstein','DBERNSTE','011.44.1344.345268', str_to_date('24-MAR-05','%d-%b-%y'),'SA_REP','9500','0.25', 145, 8),
 ('Peter','Hall','PHALL','011.44.1344.478968', str_to_date('20-AUG-05','%d-%b-%y'),'SA_REP','9000','0.25', 145, 8),
 ('Christopher','Olsen','COLSEN','011.44.1344.498718', str_to_date('30-MAR-06','%d-%b-%y'),'SA_REP','8000','0.2', 145, 8),
 ('Nanette','Cambrault','NCAMBRAU','011.44.1344.987668', str_to_date('09-DEC-06','%d-%b-%y'),'SA_REP','7500','0.2', 145, 8),
 ('Oliver','Tuvault','OTUVAULT','011.44.1344.486508', str_to_date('23-NOV-07','%d-%b-%y'),'SA_REP','7000','0.15', 145, 8),
 ('Janette','King','JKING','011.44.1345.429268', str_to_date('30-JAN-04','%d-%b-%y'),'SA_REP','10000','0.35', 146, 8),
 ('Patrick','Sully','PSULLY','011.44.1345.929268', str_to_date('04-MAR-04','%d-%b-%y'),'SA_REP','9500','0.35', 146, 8),
 ('Allan','McEwen','AMCEWEN','011.44.1345.829268', str_to_date('01-AUG-04','%d-%b-%y'),'SA_REP','9000','0.35', 146, 8),
 ('Lindsey','Smith','LSMITH','011.44.1345.729268', str_to_date('10-MAR-05','%d-%b-%y'),'SA_REP','8000','0.3', 146, 8),
 ('Louise','Doran','LDORAN','011.44.1345.629268', str_to_date('15-DEC-05','%d-%b-%y'),'SA_REP','7500','0.3', 146, 8),
 ('Sarath','Sewall','SSEWALL','011.44.1345.529268', str_to_date('03-NOV-06','%d-%b-%y'),'SA_REP','7000','0.25', 146, 8),
 ('Clara','Vishney','CVISHNEY','011.44.1346.129268', str_to_date('11-NOV-05','%d-%b-%y'),'SA_REP','10500','0.25', 147, 8),
 ('Danielle','Greene','DGREENE','011.44.1346.229268', str_to_date('19-MAR-07','%d-%b-%y'),'SA_REP','9500','0.15', 147, 8),
 ('Mattea','Marvins','MMARVINS','011.44.1346.329268', str_to_date('24-JAN-08','%d-%b-%y'),'SA_REP','7200','0.1', 147, 8),
 ('David','Lee','DLEE','011.44.1346.529268', str_to_date('23-FEB-08','%d-%b-%y'),'SA_REP','6800','0.1', 147, 8),
 ('Sundar','Ande','SANDE','011.44.1346.629268', str_to_date('24-MAR-08','%d-%b-%y'),'SA_REP','6400','0.1', 147, 8),
 ('Amit','Banda','ABANDA','011.44.1346.729268', str_to_date('21-APR-08','%d-%b-%y'),'SA_REP','6200','0.1', 147, 8),
 ('Lisa','Ozer','LOZER','011.44.1343.929268', str_to_date('11-MAR-05','%d-%b-%y'),'SA_REP','11500','0.25', 148, 8),
 ('Harrison','Bloom','HBLOOM','011.44.1343.829268', str_to_date('23-MAR-06','%d-%b-%y'),'SA_REP','10000','0.2', 148, 8),
 ('Tayler','Fox','TFOX','011.44.1343.729268', str_to_date('24-JAN-06','%d-%b-%y'),'SA_REP','9600','0.2', 148, 8),
 ('William','Smith','WSMITH','011.44.1343.629268', str_to_date('23-FEB-07','%d-%b-%y'),'SA_REP','7400','0.15', 148, 8),
 ('Elizabeth','Bates','EBATES','011.44.1343.529268', str_to_date('24-MAR-07','%d-%b-%y'),'SA_REP','7300','0.15', 148, 8),
 ('Sundita','Kumar','SKUMAR','011.44.1343.329268', str_to_date('21-APR-08','%d-%b-%y'),'SA_REP','6100','0.1', 148, 8),
 ('Ellen','Abel','EABEL','011.44.1644.429267', str_to_date('11-MAY-04','%d-%b-%y'),'SA_REP','11000','0.3', 149, 8),
 ('Alyssa','Hutton','AHUTTON','011.44.1644.429266', str_to_date('19-MAR-05','%d-%b-%y'),'SA_REP','8800','0.25', 149, 8),
 ('Jonathon','Taylor','JTAYLOR','011.44.1644.429265', str_to_date('24-MAR-06','%d-%b-%y'),'SA_REP','8600','0.2', 149, 8),
 ('Jack','Livingston','JLIVINGS','011.44.1644.429264', str_to_date('23-APR-06','%d-%b-%y'),'SA_REP','8400','0.2', 149, 8),
 ('Kimberely','Grant','KGRANT','011.44.1644.429263', str_to_date('24-MAY-07','%d-%b-%y'),'SA_REP','7000','0.15', 149, null),
 ('Charles','Johnson','CJOHNSON','011.44.1644.429262', str_to_date('04-JAN-08','%d-%b-%y'),'SA_REP','6200','0.1', 149, 8),
 ('Winston','Taylor','WTAYLOR','650.507.9876', str_to_date('24-JAN-06','%d-%b-%y'),'SH_CLERK','3200',null, 120, 5),
 ('Jean','Fleaur','JFLEAUR','650.507.9877', str_to_date('23-FEB-06','%d-%b-%y'),'SH_CLERK','3100',null, 120, 5),
 ('Martha','Sullivan','MSULLIVA','650.507.9878', str_to_date('21-JUN-07','%d-%b-%y'),'SH_CLERK','2500',null, 120, 5),
 ('Girard','Geoni','GGEONI','650.507.9879', str_to_date('03-FEB-08','%d-%b-%y'),'SH_CLERK','2800',null, 120, 5),
 ('Nandita','Sarchand','NSARCHAN','650.509.1876', str_to_date('27-JAN-04','%d-%b-%y'),'SH_CLERK','4200',null, 121, 5),
 ('Alexis','Bull','ABULL','650.509.2876', str_to_date('20-FEB-05','%d-%b-%y'),'SH_CLERK','4100',null, 121, 5),
 ('Julia','Dellinger','JDELLING','650.509.3876', str_to_date('24-JUN-06','%d-%b-%y'),'SH_CLERK','3400',null, 121, 5),
 ('Anthony','Cabrio','ACABRIO','650.509.4876', str_to_date('07-FEB-07','%d-%b-%y'),'SH_CLERK','3000',null, 121, 5),
 ('Kelly','Chung','KCHUNG','650.505.1876', str_to_date('14-JUN-05','%d-%b-%y'),'SH_CLERK','3800',null, 122, 5),
 ('Jennifer','Dilly','JDILLY','650.505.2876', str_to_date('13-AUG-05','%d-%b-%y'),'SH_CLERK','3600',null, 122, 5),
 ('Timothy','Gates','TGATES','650.505.3876', str_to_date('11-JUL-06','%d-%b-%y'),'SH_CLERK','2900',null, 122, 5),
 ('Randall','Perkins','RPERKINS','650.505.4876', str_to_date('19-DEC-07','%d-%b-%y'),'SH_CLERK','2500',null, 122, 5),
 ('Sarah','Bell','SBELL','650.501.1876', str_to_date('04-FEB-04','%d-%b-%y'),'SH_CLERK','4000',null, 123, 5),
 ('Britney','Everett','BEVERETT','650.501.2876', str_to_date('03-MAR-05','%d-%b-%y'),'SH_CLERK','3900',null, 123, 5),
 ('Samuel','McCain','SMCCAIN','650.501.3876', str_to_date('01-JUL-06','%d-%b-%y'),'SH_CLERK','3200',null, 123, 5),
 ('Vance','Jones','VJONES','650.501.4876', str_to_date('17-MAR-07','%d-%b-%y'),'SH_CLERK','2800',null, 123, 5),
 ('Alana','Walsh','AWALSH','650.507.9811', str_to_date('24-APR-06','%d-%b-%y'),'SH_CLERK','3100',null, 124, 5),
 ('Kevin','Feeney','KFEENEY','650.507.9822', str_to_date('23-MAY-06','%d-%b-%y'),'SH_CLERK','3000',null, 124, 5),
 ('Donald','OConnell','DOCONNEL','650.507.9833', str_to_date('21-JUN-07','%d-%b-%y'),'SH_CLERK','2600',null, 124, 5),
 ('Douglas','Grant','DGRANT','650.507.9844', str_to_date('13-JAN-08','%d-%b-%y'),'SH_CLERK','2600',null, 124, 5),
 ('Jennifer','Whalen','JWHALEN','515.123.4444', str_to_date('17-SEP-03','%d-%b-%y'),'AD_ASST','4400',null, 101, 1),
 ('Michael','Hartstein','MHARTSTE','515.123.5555', str_to_date('17-FEB-04','%d-%b-%y'),'MK_MAN','13000',null, 100, 2),
 ('Pat','Fay','PFAY','603.123.6666', str_to_date('17-AUG-05','%d-%b-%y'),'MK_REP','6000',null, 201, 2),
 ('Susan','Mavris','SMAVRIS','515.123.7777', str_to_date('07-JUN-02','%d-%b-%y'),'HR_REP','6500',null, 101, 4),
 ('Hermann','Baer','HBAER','515.123.8888', str_to_date('07-JUN-02','%d-%b-%y'),'PR_REP','10000',null, 101, 7),
 ('Shelley','Higgins','SHIGGINS','515.123.8080', str_to_date('07-JUN-02','%d-%b-%y'),'AC_MGR','12008',null, 101, 11),
 ('William','Gietz','WGIETZ','515.123.8181', str_to_date('07-JUN-02','%d-%b-%y'),'AC_ACCOUNT','8300',null, 205, 11);

commit;

alter table departments add constraint departments_manager_fk foreign key(manager_id) references employees(employee_id);
alter table employees add constraint employees_manager_fk foreign key(manager_id) references employees(employee_id);

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

insert into job_history (employee_id,start_date,end_date,job_id,department_id) values
	(102 ,str_to_date('13-JAN-01','%d-%b-%y'), str_to_date('24-JUL-06','%d-%b-%y'), 'IT_PROG', 6),
    (101 ,str_to_date('21-SEP-97','%d-%b-%y'), str_to_date('27-OCT-01','%d-%b-%y'), 'AC_ACCOUNT', 11),
    (101 ,str_to_date('28-OCT-01','%d-%b-%y'), str_to_date('15-MAR-05','%d-%b-%y'), 'AC_MGR', 11),
    (201 ,str_to_date('17-FEB-04','%d-%b-%y'), str_to_date('19-DEC-07','%d-%b-%y'), 'MK_REP', 2),
    (114 ,str_to_date('24-MAR-06','%d-%b-%y'), str_to_date('31-DEC-07','%d-%b-%y'), 'ST_CLERK', 5),
    (122 ,str_to_date('01-JAN-07','%d-%b-%y'), str_to_date('31-DEC-07','%d-%b-%y'), 'ST_CLERK', 5),
    (200 ,str_to_date('17-SEP-95','%d-%b-%y'), str_to_date('17-JUN-01','%d-%b-%y'), 'AD_ASST', 9),
    (176 ,str_to_date('24-MAR-06','%d-%b-%y'), str_to_date('31-DEC-06','%d-%b-%y'), 'SA_REP', 8),
    (176 ,str_to_date('01-JAN-07','%d-%b-%y'), str_to_date('31-DEC-07','%d-%b-%y'), 'SA_MAN', 8),
    (200 ,str_to_date('01-JUL-02','%d-%b-%y'), str_to_date('31-DEC-06','%d-%b-%y'), 'AC_ACCOUNT', 9);

commit;

-- extra playground
drop table if exists team_coder;
drop table if exists teams;
drop table if exists coders;
drop table if exists clients;

--
create table clients (
  client_id integer primary key auto_increment,
  name varchar(25) not null,
  nickname varchar(10)
);

insert into clients (name, nickname) values('Aleph Microservices', 'Alpha');
insert into clients (name, nickname) values('Heavy Bertha Industries', 'Beta');
insert into clients (name, nickname) values('Teragamma Consulting', 'Gamma');
insert into clients (name, nickname) values('Lima Delta Services', 'Delta');

commit;

--
create table coders
as
    select employee_id as coder_id, first_name, last_name, hire_date, salary
    from employees
    where department_id = 6;

alter table coders modify coder_id int primary key auto_increment;
alter table coders auto_increment = 201;

alter table coders add constraint coders_name_uq unique(first_name, last_name);

insert into coders (first_name, last_name, hire_date, salary) values ('Tim', 'Ice', curdate(), 5760);

commit;

-- a procedure on coders

drop procedure if exists get_coder_salary;

DELIMITER //

CREATE PROCEDURE get_coder_salary(
	in p_coder_id integer,
    out p_salary decimal(8, 2)
)
begin
	select salary
	into p_salary
	from coders
	where coder_id = p_coder_id;
end;

//
DELIMITER ;

create table teams(
	team_id integer primary key auto_increment,
	name varchar(25),
    leader_id integer unique,
    client_id integer not null,

    constraint teams_leader_fk foreign key(leader_id) references coders(coder_id),
    constraint teams_client_fk foreign key(client_id) references clients(client_id)
);

insert into teams (name, leader_id, client_id) values ('red', 103, 1);
insert into teams (name, leader_id, client_id) values ('blue', 107, 1);
insert into teams (name, leader_id, client_id) values ('green', 105, 2);

commit;

create table team_coder(
	team_id integer,
    coder_id integer,

	constraint team_coder_pk primary key(team_id, coder_id),
    constraint team_coder_fk foreign key(team_id) references teams(team_id),
    constraint coder_team_fk foreign key(coder_id) references coders(coder_id)
);

insert into team_coder values (1, 104);
insert into team_coder values (1, 106);
insert into team_coder values (1, 201);
insert into team_coder values (2, 105);
insert into team_coder values (2, 106);
insert into team_coder values (2, 107);
insert into team_coder values (3, 105);
insert into team_coder values (3, 106);
insert into team_coder values (3, 103);

commit;