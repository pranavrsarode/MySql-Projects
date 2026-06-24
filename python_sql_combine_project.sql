create database sales_project;
use sales_project;

create table sales (
    order_id int,
    order_date date,
    product varchar(100),
    category varchar(100),
    quantity int,
    price float,
    city varchar(100),
    sales_amount decimal(10,2)
);
drop table sales;
select * from sales;
insert into sales values 
(1,'2026-05-02','Laptop','Electronics',2,80000,'Mumbai',750000),
(2,'2026-04-10','HeadPhone','Electronics',1,35000,'Pune',30000),
(3,'2026-10-15','Laptop','Electronics',1,75000,'Sangli',600000),
(4,'2024-08-25','Mobile','Electronics',2,10000,'Nashik',80000),
(5,'2026-05-02','HeadPhone','Electronics',2,14000,'Mumbai',7000);

select database();
describe sales;
