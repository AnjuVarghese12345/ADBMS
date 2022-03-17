create database company;
use company;
create table regions(
region_id int primary key,
region_name varchar(10));

desc regions;

create table countries(
country_id int primary key not null,
country_name varchar(10),
region_id int,
foreign key(region_id) references regions(region_id) 
on delete cascade
on update cascade);

desc countries;

create table locations(
location_id int primary key not null,
street_address varchar(30),
postal_code varchar(7),
city varchar(10),
state_province varchar(10),
country_id int,
foreign key(country_id) references countries(country_id)
on delete cascade
on update cascade);

desc locations;

create table departments(
department_id int primary key not null,
department_name varchar(10),
location_id int,
foreign key(location_id) references locations(location_id)
on delete cascade
on update cascade);

desc departments;

create table jobs(
job_id int primary key not null,
job_title varchar(10),
min_salary int,
max_salary int);

desc jobs;

create table employees(
employee_id int primary key not null,
first_name varchar(15),
last_name varchar(15),
email varchar(25),
phone_number varchar(10),
hire_date date,
job_id int,
salary int,
manager_id int,
department_id int,
foreign key(job_id) references jobs(job_id),
foreign key(department_id) references departments(department_id)
on delete cascade
on update cascade);

create table dependents(
dependent_id int primary key not null,
first_name varchar(15),
last_name varchar(15),
relationship varchar(10),
employee_id int,
foreign key(employee_id) references employees(employee_id)
on delete cascade
on update cascade);

alter table employees add foreign key(manager_id) references employees(employee_id);

desc dependents;

alter table dependents drop primary key;

alter table dependents modify dependent_id int null;
alter table dependents modify dependent_id int primary key;
desc dependents;
