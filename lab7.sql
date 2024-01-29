create database supply_204;
use supply_204;

create table supplier_204(
	sid int primary key, 
    sname varchar(20),
    city varchar(30)
);

create table parts_204(
	pid int primary key,
    pname varchar(20),
    color varchar(20)
);


create table catalog_204(
	sid int,
    pid int, 
    cost int,
    foreign key(sid) references supplier_204(sid),
    foreign key(pid) references parts_204(pid) 
);

insert into supplier_204 values
	(10001, "acne", "Bangalore"),
    (10002, "johns", "Kolkata"),
    (10003, "vimal", "Mumbai"),
    (10004, "reliance", "Delhi");
    
insert into parts_204 values
	(20001, "Book", "Red"),
    (20002, "Pen", "Red"),
    (20003, "Pencil", "Green"),
    (20004, "Mobile", "Green"),
    (20005, "Charger", "Black");

insert into catalog_204 values
	(10001, 20001, 10),
    (10001, 20002, 10),
    (10001, 20003, 30),
    (10001, 20004, 10),
    (10001, 20005, 10),
    (10002, 20001, 10),
    (10002, 20002, 20),
    (10003, 20003, 30),
    (10004, 20003, 40);
    
    
-- 1
select pname from parts_204 where pid in (select pid from catalog_204);
-- 2
select sname from supplier_204 where sid in 
(select sid from catalog_204 group by sid having count(distinct pid) = (select count(distinct pid) from parts_204));
-- 3
select distinct sname from supplier_204, parts_204, catalog_204 
where supplier_204.sid = catalog_204.sid and parts_204.pid = catalog_204.pid and parts_204.color="Red";
-- 4
select pname from parts_204 where pid not in 
(select pid from catalog_204 where sid in (select sid from supplier_204 where sname != "acne"));

-- 5
select sid from catalog_204 a where a.cost > (select avg(b.cost) from catalog_204 b where a.pid = b.pid group by b.pid);

-- 6
select pid, sname from catalog_204 a, supplier_204 
where a.cost = (select max(b.cost) from catalog_204 b where a.pid = b.pid group by b.pid) and supplier_204.sid = a.sid;

    


    
