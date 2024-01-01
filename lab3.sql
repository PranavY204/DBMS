create database bank_204;
use bank_204;

create table branch_204(
	branch_name varchar(20) primary key, 
	branch_city varchar(20), 
	assets float
);

create table bank_account_204(
	acc_no int primary key, 
	branch_name varchar(20), 
    balance float,
    foreign key(branch_name) references branch_204(branch_name)
);

create table deposits_204(
	customer_name varchar(20), 
    acc_no int,
    foreign key(acc_no) references bank_account_204(acc_no), 
    foreign key(customer_name) references bank_customer_204(customer_name)
);

create table bank_customer_204(
	customer_name varchar(20) primary key, 
    customer_street varchar(50), 
    city varchar(15)
);

create table loans_204(
	loan_no int primary key, 
    branch_name varchar(20), 
    amt float,
    foreign key(branch_name) references branch_204(branch_name)
);

insert into branch_204 values
("Chamrajpet","Banglore",50000),
("ResideRoad","Banglore",10000),
("ShivaRoad","Bombay",20000),
("Parliament","Delhi",10000),
("JMantar","Delhi",20000);

insert into bank_account_204 values
(1,"Chamrajpet",2000),
(2,"ResideRoad",5000),
(3,"ShivaRoad",6000),
(4,"Parliament",9000),
(5,"JMantar",8000),
(6,"ShivaRoad",4000),
(8,"ResideRoad",4000),
(9,"Parliament",3000),
(10,"ResideRoad",5000),
(11,"JMantar",2000);

insert into bank_customer_204 values
("Avinash","BulTemple","Banglore"),
("Dinesh","Banrgutta","Banglore"),
("Mohan","National college","Banglore"),
("Nikhil","Akbar road","Delhi"),
("Ravi","Prithviraj road","Delhi");

insert into deposits_204 values
("Avinash",1),
("Dinesh",2),
("Nikhil",4),
("Ravi",5),
("Avinash",8),
("Nikhil",9),
("Dinesh",10),
("Nikhil",11);

insert into loans_204 values
(1,"Chamrajpet",1000),
(2,"ResideRoad",2000),
(3,"ShivaRoad",3000),
(4,"Parliament",4000),
(5,"JMantar",5000);

-- 1
select branch_name, assets_in_lks from branch_204;
-- 2 
alter table branch_204 rename column assets to assets_in_lks;
-- 3
select customer_name from deposits_204 where acc_no in (select acc_no from bank_account_204 group by branch_name having count(*) > 1);
-- 4
create view loansum as (
	select branch_name, sum(amt) from loans_204 group by branch_name
);

select * from loansum;




