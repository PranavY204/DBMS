use employee_204_database_204;
insert into employee_204 values (7, "g", 2, "2023-6-1", 90000, 6);
-- 1
-- select * from employee_204 e1, employee_204 e2 
-- where e1.empno = e2.mgr_no having count(e1.mgr_no) = (select count(e1.ename) 
-- from employee_204 e1, employee_204 e2 where e1.empno = e2.mgr_no group by e1.ename order by count(e1.empname)));

-- 2
-- select 

-- 1
select e1.ename
from employee_204 e1, employee_204 e2
where e1.empno=e2.mgr_no group by e1.ename
having count(e1.mgr_no)=(select count(e1.ename)
from employee_204 e1, employee_204 e2 where e1.empno=e2.mgr_no
group by e1.ename order by count(e1.ename) desc limit 1);

-- 2
update employee_204 set sal = 100000 where empno = 2;
select m.ename from employee_204 m
where m.empno in
(select mgr_no from employee_204)
and m.sal >(select avg(n.sal) from employee_204 n
where n.mgr_no=m.empno);

-- 3
select ename from employee_204 where empno in(select distinct mgr_no
from employee_204 where empno in
(select distinct mgr_no from employee_204 where empno in
(select distinct mgr_no from employee_204)));

-- 4
select * from employee_204 where empno=
(select i.empno from incentives_204 i
where i.incentive_amount= (select max(n.incentive_amount) from incentives_204 n
where n.incentive_amount < (select max(inc.incentive_amount) from incentives_204 inc
where inc.incentive_date between 2023-01-01 and 2023-12-31) and incentive_date
between 2023-01-01 and 2023-12-31));

select e2.ename
from employee_204 e1, employee_204 e2
where e1.empno=e2.mgr_no and e1.deptno=e2.deptno;
