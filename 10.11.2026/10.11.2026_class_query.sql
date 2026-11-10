-- Database creation
create database Amazon_db;

use Amazon_db;

-- order table creation 
create table Orders(
order_ID int primary key,
customer_name varchar(30),
Product_name varchar(30),
Price decimal(10,2));

insert into Orders values
(1001,'Arul','Coolers',2500.00),
(1002,'Latha','Tv',20000.00),
(1003,'Vishnu','Shirt',800.00),
(1004,'Saran','Cricket Bat',8000.00),
(1005,'Praba','Laptop',50000.00);


-- product table creation
create Table products(
product_ID int primary key,
Product_Name varchar(30) Not null,
price decimal(10,2)); -- decimal constraint used

insert into products values
(101,'Laptop',65000.00),
(102,'Cricket Bat',8000.00),
(104,'Cricket Ball',600.00),
(103,"null",45.00);

-- Customer Table creation 
create table Customers(
Customer_ID int primary key, -- primary key used
Customer_Name varchar(30) not null, -- not null used
Customer_Email varchar(30) unique); -- unique used

insert into Customers values
(1011,'Prabanchan','praba@email.com'),
(1012,'Vimal','Vimal@email.com'),
(1013,'Saran','saran@eail.com');
 -- (1014,'vimal','vimal@email.com');
 
 -- Check constraint
 create table Product(
 Product_ID int primary key,
 product_Name varchar(30) not null,
 Product_Price decimal(10,2) check(Product_Price > 0));
 
 insert into Product values
 (0001, 'Laptop',45000.00),
 (0002,'handbag', 2500.00),
 (0003,'cricket bat',2500.00);
 
 select * from product;
 
 -- default Constraint
 create table Orders_1(
 Order_ID int primary key,
 Customer_Name varchar(30),
 Order_status varchar(30) default 'pending'
 );
 
 insert into Orders_1 (Order_ID, Customer_Name) values
 (1111,'praba'),
 (1112,'Arul'),
 (1113,'Vimal');
 
 select * from Orders_1;
 
 -- foreign key
 create table Customer(
 Customer_ID int primary key,
 Customer_Name varchar(30));
 
 insert into Customer values
 (1011,'praba'),
 (1012,'vimal'),
 (1013,'vishnu'),
 (1014,'saran'),
 (1015,'krishna');
 
 
 create table Orders_2(
 Order_ID int primary key,
 Product_Name varchar(30) not null,
 customer_ID int,
 foreign key(Customer_ID)
 references Customer(Customer_ID));
 
 insert into Orders_2 values
 (10,'Cricket bat', 1015),
 (15,'gloves',1013);
 
 select * from Orders_2;
 
 -- date and datetime
 
 create table data(
 start_date date,
 end_date datetime);
 
 insert into data values
 ('2005-07-30',"2026-07-20 11:45:00"),
 ('2026-09-15',"2027-08-15 12:00:00");
 
 select * from data;
 
 -- Composite keys
 create table cart_items(
 Customer_ID int,
 product_ID int,
 quantity int not null,
 primary key(Customer_ID,product_ID)); -- composite keys used
 
 insert into cart_items values
 (11,01,15),
 (12,02,20),
 (13,04,50);
 
 select* from cart_items;
 
 describe cart_items;
 
 
 
 
