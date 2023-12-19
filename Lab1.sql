show databases;
use mydatabase;
CREATE TABLE Student(
stdin INT(5), stdname varchar(20), dob date, doj date, fee int(5), gender char);
desc student;
insert into student values(1, "SHAREEF", "2001-01-10", "2001-10-05", 10000, 'M');
insert into student values(2, "NADEEM", "2019-11-3", "2001-10-26", 11000, 'M');
alter table Student rename to student_info;
-- alter table Student add phone_no nvarchar(10);
select * from student_info;
create table product(
productID int(4), 
productCode char(3), 
name varchar(20), 
quantity int, 
price float
);
desc product;
insert into product values(1001, "PEN", "Pen Red", 5000, 1.23);
insert into product values(1002, "PEN", "Pen Blue", 8000, 1.23);
insert into product values(1003, "PEN", "Pen Black", 2000, 1.23);
insert into product values(1004, "PEC", "Pencil 2B", 10000, 1.23);
insert into product values(1005, "PEC", "Pencil 2H", 8000, 1.23);
insert into product values(1006, "PEC", "Pencil HB", 0, 1.23);
select * from product;
delete from product where quantity = 0;
use mydatabase;
delete from student_info where stdin = 2;
select * from product;
alter table product rename to product_info;
desc product_info;
update product_info set price = 10.0 where name != "Pen Blue";
select * from product_info;
alter table product_info drop column productCode;
select * from product_info;
alter table product_info rename column productID to ID;
create table product(
productID int(4) primary key, 
productCode char(3), check (productCode = "PEN" or productCode = "PEC"), 
name varchar(20), 
quantity int, 
price float
);
insert into product values(1001, "PEN", "Pen Red", 5000, 1.23);
insert into product values(1002, "PEN", "Pen Blue", 8000, 1.23);
insert into product values(1003, "PEN", "Pen Black", 2000, 1.23);
insert into product values(1004, "PEC", "Pencil 2B", 10000, 1.23);
insert into product_info values(1005, "Pencil 2H", 8000, 1.23);
insert into product values(1006, "PEC", "Pencil HB", 0, 1.23);
insert into product values(1007, "PEX", "Smth", 0, 0);
alter table product rename column productID to ID;
desc product;
drop table product;
select * from product_info;
delete from product_info where ID = 1005 ;
show tables;





