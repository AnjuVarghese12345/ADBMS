create database college;
use college;
create table dept(dept_id varchar(20) primary key,dept_name varchar(30));
create table staff(staff_id int primary key,sname varchar(30),desig varchar(30),quali varchar(30),type_appoi varchar(30),salary int,dept_id varchar(30),foreign key(dept_id)references dept(dept_id));
insert into dept values('A01','CS');
insert into dept values('A02','CA');
insert into dept values('A03','CA');
insert into dept values('A04','CS');
insert into dept values('A05','CA');

insert into staff values(1,'Smith','s/w engineer','MCA','contract',25000,'A05');
insert into staff values(2,'Mary','s/w tester','MCA','contract',45000,'A02');
insert into staff values(3,'John','s/w engineer','doctorate','regular',70000,'A03');
insert into staff values(4,'Mark','system administrator','CSE','regular',55000,'A01');
insert into staff values(5,'Lilly','s/w engineer','CSE','regular',25000,'A04');
select count(*)  from staff where type_appoi='contract'; 
select  avg(salary) from staff where type_appoi='contract';

