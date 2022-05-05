create database emp ;
use emp;
create table staff(staff_id int primary key,sname varchar(20),designation varchar(50),qualification varchar(50),type_of_appointment varchar(50),salary int(20),dept_id int,foreign key(dept_id) references department(dept_id));
create table department(dept_id int primary key,dept_name varchar(100));
desc staff;

insert into staff values(1,"Ramesh","professor","doctorate","regular",12000,2),
(2,"Sam","asst professor","doctorate","contract",15000,3),
                     (3,"Ram","professor","mca","regular",12000,2),
                        (4,"Bobby","programmer","bsc","contract",10000,4),
                      (5,"Rocky","helper","plus two","regular",7000,2);
insert into department values(2,'mca');
insert into department values(3,'mtech');
insert into department values(4,'mba');

select * from department;
select * from staff;
select count(type_of_appointment) from staff where type_of_appointment="contract";
#select department.dept_name from department innerjoin (staff) on department.dept_id=staff.staff_id where max
select avg(staff.salary),department.dept_name from staff,department where department.dept_id=staff.dept_id and staff.type_of_appointment="contract" group by staff.dept_id;
select max(staff.salary),staff.sname,department.dept_name from staff,department where staff.dept_id=department.dept_id  group by staff.dept_id order by staff.salary desc;
	


