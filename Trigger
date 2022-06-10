#query

create database shop;
use shop;
create table PRODUCT(productID int primary key,name varchar(30),price int,qty_in_stock int);
create table SALES(SID int primary key,delivery_add varchar(40));
drop table SALEITEM;
create table SALEITEM(SID int,productID int,qty int,primary key(SID,productID),foreign key(productID)references PRODUCT(productID),foreign key(SID)references SALES(SID));
insert into PRODUCT values(003,'soap',30,400);
insert into SALES values(03,'abvkjashkjd');
insert into SALEITEM values(003,01,3);
select*from PRODUCT;
select * from SALES;

#TRIGGER

CREATE DEFINER=`root`@`localhost` TRIGGER `shop`.`update_qty` AFTER INSERT ON `SALEITEM` FOR EACH ROW
BEGIN
	update PRODUCT set qty_in_stock =qty_in_stock-new.qty where productID=new.productID;
END


