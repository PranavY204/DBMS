show databases;
create database employee_204;
use employee_204;
create table dept_204(
		dept_no int primary key,
        dept_name varchar(20),
        dept_loc varchar(20)
);
create table emp_204(
	e_no int primary key,
    e_name varchar(20),
    mgr_no int,
    hiredate date,
    sal int,
    dept_no int, 
    foreign key(dept_no) references dept_204(dept_no)
);

create table incentive_204(
	emp_no int,
    incentive_date int primary key, 
    incentive_amt int,
    foreign key(emp_no) references emp_204(e_no)
);

create table projects_204(
	project_no int primary key,
    project_loc varchar(40),
    project_name varchar(20) 
);

create table assigned_to_204(
		emp_no int,
        project_no int,
        role varchar(20),
        foreign key(emp_no) references emp_204(e_no),
        foreign key(project_no) references projects_204(project_no)
);

INSERT INTO dept_204 VALUES
  (62, 'Finance', 'Paris'),
  (61, 'Marketing', 'New York'),
  (5, 'Marketing', 'Berlin'),
  (60, 'HR', 'New York'),
  (91, 'IT', 'London');
  
INSERT INTO emp_204 VALUES
  (21, 'Michael Brown', 2, '2023-04-15', 80000, 5),
  (75, 'Jane Doe', 1, '2023-10-07', 60000, 91),
  (66, 'Jane Doe', 5, '2023-05-12', 70000, 62),
  (67, 'Emily Jones', 5, '2023-05-20', 90000, 62),
  (25, 'John Smith', 5, '2023-01-19', 80000, 91);
  
INSERT INTO incentive_204 VALUES
  (75, 345, 4334),
  (67, 38, 3115),
  (66, 132, 4562),
  (25, 233, 1809),
  (67, 81, 1394);

INSERT INTO projects_204 VALUES
  (66, 'Seattle', 'Project Phoenix'),
  (81, 'Chicago', 'Project Green Leaf'),
  (27, 'San Francisco', 'Project Quantum Leap'),
  (70, 'Seattle', 'Project Blue Sky'),
  (18, 'San Francisco', 'Project Blue Sky');

INSERT INTO assigned_to_204 VALUES
  (66, 70, 'Team Lead'),
  (25, 66, 'Developer'),
  (67, 81, 'Developer'),
  (25, 27, 'Project Manager'),
  (21, 27, 'Designer');
  


  






