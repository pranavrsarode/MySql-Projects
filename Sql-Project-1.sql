create database Project;
use Project;
create table Customers(Customer_ID int auto_increment primary key,
Customer_NAME varchar (30) not null,
Gender ENUM('Male', 'Female','other') DEFAULT 'Male',
Customer_CITY varchar (20),
Customer_JOINDATE date);
select * from Customers;

create table Products(Product_ID int auto_increment primary key,
Product_NAME varchar(20) not null,
Product_CATEGORY varchar(20),
Product_UNITPRICE decimal(10,2));
select * from Products;

create table Orders(Order_ID int auto_increment primary key,
Customer_ID int not null,
Order_DATE date,
Order_SHIPDATE date,
Order_STATUS varchar(50),
foreign key (Customer_ID) references Customers(Customer_ID));
select * from Orders;
describe orders;
drop table orders;

create table Orders_Details(Detail_ID int auto_increment primary key,
Order_ID int not null,
Product_ID int not null,
Quantity int,Price decimal,
Discount decimal(10,2),
foreign key (Order_ID) references Orders(Order_ID),
foreign key (Product_ID) references Products(Product_ID));
select * from Orders_Details;

insert into Orders_Details values (3,3,3,4,65000,11.5),(4,4,4,6,65000,15.5);

insert into Customers (Customer_Name,Gender,Customer_CITY,Customer_JOINDATE) values
('Amit Sharma','Male','Mumbai','2023-02-10'),
('Priya Singh','Female','Delhi','2024-01-05'),
('Rahul Patel','Male','Mumbai','2022-11-20'),
('Sneha Rao','Female','Pune','2023-06-12'),
('Rakesh Kumar','Male','Bengaluru','2024-03-22'),
('Anjali Mehta','Female','Chennai','2021-09-30'),
('Vikram Desai','Male','Ahmedabad','2024-07-01'),
('Kavita Joshi','Female','Mumbai','2023-12-15');

insert into Products (Product_NAME,Product_CATEGORY,Product_UNITPRICE) values
('Wireless Mouse','Accessories',499.00),
('Bluetooth Headphones','Electronics',2499.00),
('Water Bottle 1L','Home & Kitchen',199.00),
('Notebook - A4','Stationery',49.00),
('Office Chair','Furniture',5999.00),
('LED Desk Lamp','Home & Kitchen',999.00),
('USB-C Cable','Accessories',299.00),
('Smartphone Case','Accessories',399.00);
select * from Products;

insert into Orders (Customer_ID,Order_DATE,Order_SHIPDATE,Order_STATUS) values (1,'2024-01-15','2024-01-17','Shipped'),(2,'2024-01-15','2024-01-17','Shipped'),
(3,'2024-02-20','2024-02-27','Delivered'),(4,'2024-03-10','2024-03-15','Delivered'),
(1,'2024-03-25','2024-03-27','Shipped'),(5,'2024-04-02',NULL,'Processing'),
(6,'2024-04-18','2024-04-20','Delivered'),(7,'2024-05-05','2024-05-09','Delivered'),
(8,'2024-05-20','2024-05-22','Shipped'),(2,'2024-06-11','2024-06-13','Delivered'),
(3,'2024-07-01','2024-07-06','Delivered'),(4,'2024-07-18','2024-07-22','Returned');
select * from orders;

select Customer_NAME,(Customer_CITY) from Customers where Customer_CITY='Mumbai';

select Product_NAME,Product_CATEGORY,(Product_UNITPRICE) from Products where Product_UNITPRICE > 500;

select count(Order_DATE) from Orders where Order_DATE between '1-jan-2024' and '31-dec-2024';

select distinct Product_CATEGORY from Products;

select Customer_NAME,Gender,Customer_CITY from Customers where Customer_JOINDATE>'2023-12-31';

select order_STATUS from Orders where Order_STATUS = "Shipped";

select * from Orders where Order_STATUS = "Shipped";

select Product_NAME,Product_UNITPRICE from Products;

select * from Orders order by Order_DATE desc;

select Customer_CITY,COUNT(Customer_CITY) from Customers group by Customer_CITY; 

select o.Order_ID,o.Order_DATE,Product_ID,Quantity,Product_UNITPRICE from Orders as o join Orders_Details as od on o.Order_ID = od.Order_ID where o.Customer_ID = 101;

select Order_ID,Product_ID,Quantity,Product_UNITPRICE,(Quantity * Price) as TotalSales from Orders_Details;

select Order_ID,Product_ID,Quantity,Price,(Quantity * Price) as TotalSales from Orders_Details;

select Product_Name,sum (Quantity * Price) as total_sales from Products group by Products_Name;

select month(Order_Date) as SalesMonth from Orders where year(Order_Date) = 2024 group by month(Order_Date) order by SalesMonth;

select * from  Orders where DATEDIFF(order_SHIPDATE, order_DATE) > 3;

select Order_ID,Product_ID,Quantity,Price,Discount,(Price * Quantity* Discount /100) as DiscountAmount from Orders_Details;

select C.Customer_ID,C.Customer_Name from Customers as C left join Orders as O on C.Customer_ID = O.Customer_ID where O.Order_ID is null;

select Customer_ID,count(Order_ID) as NumberOfOrders from Orders group by Customer_ID;

select Product_CATEGORY,sum(Product_CATEGORY) as total_categories from Products  group by Product_CATEGORY having sum(Product_CATEGORY) > 50000;

select Product_ID, avg(Discount * 100) as averageDiscountPercentage from Orders_Details group by Product_ID;

select Product_UNITPRICE, sum(Product_UNITPRICE) as total_purchase from Products group by Product_UNITPRICE;

