create database employee_database_204;
use employee_database_204;
create table project_204(
	pno int primary key,
	ploc varchar(20),
	pname varchar(20)
);
create table dept_204(
	deptno int primary key,
	dname varchar(30),
	dloc varchar(30)
);
create table employee_204(
	empno int primary key,
	ename varchar(20),
	mgr_no int,
	hiredate date,
	sal double,
	deptno int,
	foreign key(deptno) references dept_204(deptno)
);
create table assigned_to_204(
	empno int primary key,
	pno int,
	job_role varchar(20),
	foreign key(empno) references employee_204(empno),
	foreign key(pno) references project_204(pno)
);
create table incentives_204(
	empno int,
	incentive_date date primary key,
	incentive_amount double,
	foreign key(empno) references employee_204(empno)
);
insert into project_204 values
	(1,"bengaluru","abcd"),
	(2,"hyderabad","bcda"),
	(3,"bengaluru","abab"),
	(4,"bengaluru","baba"),
	(5,"hyderabad","cdcd"),
    (6, "mysuru", "efef");
insert into dept_204 values
	(1,"cse","bengaluru"),
	(2,"ise","hyderabad"),
	(3,"ece","bengaluru"),
	(4,"ete","hyderabad"),
	(5,"ime","bengaluru"),
    (6, "mech", "mysuru");
insert into employee_204 values 
	(1,"a",null,"2023-11-9",70000,1),
	(2,"b",2,"2023-8-9",70000,1),
	(3,"c",3,"2023-6-8",70000,2),
	(4,"d",null,"2023-8-6",70000,2),
	(5,"e",null,"2023-5-4",70000,3),
    (6, "f", null, "2023-6-1", 90000, 6);
insert into assigned_to_204 values
	(1,1,"employee"),
	(2,1,"manager"),
	(3,2,"manager"),
	(4,3,"employee"),
	(5,4,"employee"),
    (6, 6, "employee");
insert into incentives_204 values
	(1,"2023-12-9",10000),
	(2,"2023-8-9",10000),
	(3,"2023-6-8",10000),
	(4,"2023-5-4",10000),
	(5,"2023-12-8",10000);
-- 1
select assigned_to_204.empno from assigned_to_204, project_204 
where assigned_to_204.pno = project_204.pno and project_204.ploc in ("bengaluru", "mysuru", "hyderabad");
-- 2
select empno from employee_204 where empno not in (select empno from incentives_204);
-- 3
select employee_204.empno, ename, dname, job_role, dloc, ploc 
from employee_204, assigned_to_204, project_204, dept_204 
where ploc = dloc and assigned_to_204.empno = employee_204.empno
and employee_204.deptno = dept_204.deptno and project_204.pno = assigned_to_204.pno;






