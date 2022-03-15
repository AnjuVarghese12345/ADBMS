CREATE DATABASE EXERCISE1;
use EXERCISE1;
create table jobs(job_id int(30),job_title varchar(20),min_salary int ,max_salary int,primary key(job_id));
create table employees(employee_id int(30),first_name varchar(20),last_name varchar(20),email varchar(20),phone_number int ,hire_date date,job_id int,salary int,primary key(employee_id),foreign key(job_id) references jobs(job_id));
create table dependents(dependent_id int(30),first_name varchar(20),last_name varchar(20),relationship varchar(20),employee_id int,primary key(dependent_id),foreign key(employee_id) references employees(employee_id));
create table departments(department_id int(30),department_name varchar(20),location_id int, primary key(department_id));
create table regions(region_id int(30),region_name varchar(20), primary key(region_id));
create table countries(country_id int,country_name varchar(20),region_id int,primary key(country_id),foreign key(region_id) references regions(region_id));
create table locations(location_id int(30),street_address varchar(20),postal_code int,city varchar(20),state_province varchar(20),country_id int,primary key(location_id),foreign key(country_id) references countries(country_id));
insert into jobs values(1,"s/w e",30000,50000);
insert into employees values(11,"Anju","Anchu","anchu123@gmail.com",1234567893,"20/04/2021");

