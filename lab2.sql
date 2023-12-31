create database insurance_204;
use insurance_204;
create table person_204(
driver_id varchar(3) primary key, 
name varchar(20) not null, 
address varchar(100) 
);

create table car_204(
reg_no char(8) primary key, 
model varchar(20), 
year int(4) not null
);

create table accident_204(
	report_no int(4) primary key,
    accident_date date, 
    location varchar(100)
);

create table owns_204(
	driver_id varchar(3), 
	reg_no char(8), 
	foreign key(driver_id) references person_204(driver_id), 
    foreign key(reg_no) references car_204(reg_no)
);

create table participated_204(
	driver_id varchar(3), 
    reg_no char(8), 
    report_no int(4), 
    damage_amt int, 
    foreign key(driver_id) references person_204(driver_id), 
    foreign key(reg_no) references car_204(reg_no), 
    foreign key (report_no) references accident_204(report_no)
);

insert into person_204 values
	("A01", "Richard", "Sri Nagar"), 
	("A02", "Pradeep", "Raj Nagar"),
    ("A03", "Smith", "Ashok Nagar"),
    ("A04", "Venu", "N R Colony"),
    ("A05", "John", "Hanu Nagar");
    
insert into car_204 values
	("KA052250", "Indica", 1990),
    ("KA031181", "Lancer", 1957),
    ("KA095477", "Toyota", 1998),
    ("KA053408", "Honda", 2008),
    ("KA041702", "Audi", 2005);
    
insert into owns_204 values 
("A01", "KA052250");
insert into owns_204 values 
("A02", "KA031181");
insert into owns_204 values 
("A03", "KA095477");
insert into owns_204 values 
("A04", "KA053408");
insert into owns_204 values 
("A05", "KA041702");

insert into accident_204 values
	(11, "01-01-03", "Mysore Rd"), 
    (12, "02-02-04", "SE Circle"), 
    (13, "21-01-03", "Bull Temple Rd"), 
    (14, "17-02-08", "Mysore Rd"), 
    (15, "04-03-05", "KR Puram");
    
insert into participated_204 values
	("A01", "KA052250", 11, 10000), 
    ("A02", "KA031181", 12, 50000), 
    ("A03", "KA053408", 13, 25000), 
    ("A04", "KA095477", 14, 3000), 
    ("A05", "KA041702", 15, 5000);
    
desc person_204; 
desc car_204; 
desc accident_204; 
desc owns_204;
desc participated_204;

select * from person_204; 
select * from car_204; 
select * from accident_204; 
select * from  owns_204;
select * from participated_204;

update participated_204 set damage_amt = 25000 where reg_no = "KA031181" and report_no = 12;
select count(driver_id) people_involved from participated_204, accident_204 where participated_204.report_no = accident_204.report_no and accident_204.accident_date like "%-08";
insert into accident_204 values (16, "01-01-10", "BTM");
select accident_date as date, location from accident_204; 
select participated_204.driver_id as driver_id from accident_204, participated_204 where accident_204.report_no = participated_204.report_no and participated_204.damage_amt >= 25000;


