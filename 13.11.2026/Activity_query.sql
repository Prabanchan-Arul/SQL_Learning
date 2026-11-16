-- Database and table creation --
create database Warehouse_DB;
use Warehouse_DB;

create table Customer(
Customer_ID int primary key,
Customer_Name varchar(30) not null,
City varchar(30));

insert into Customer values
(101,"arun","chennai"),
(102,"priya","bangalore"),
(103,"kumar","hyderabad"),
(104,"divya","coimbatore");

insert into Customer values(105,"viyana","cuddalore");

create table Orders(
Order_ID int primary key,
Customer_ID int,
Product varchar(50) not null,
Amount decimal(10,2),
foreign key (Customer_ID)
references Customer(Customer_ID));

insert into Orders values
(501,101,"laptop",50000.00),
(502,101,"mouse",1000.00),
(503,102,"mobile",20000.00),
(504,104,"keyboard",2000.00);


-- INNER JOIN --
select  * from customer c
inner join Orders o
on c.Customer_ID = o.Customer_ID;

-- Customer Wise Total --
select c.customer_name,
sum(o.amount) as total
from customer c
inner join orders o
on c.customer_id = o.customer_id
group by c.Customer_name;

-- customer wise total with city --
select c.customer_name,c.city,
sum(o.amount) as total
from customer c
inner join orders o
on c.customer_id = o.customer_id
group by c.Customer_name,c.city;

-- left join --
select c.Customer_name,o.product,o.amount
from Customer c
left join orders o
on c.Customer_id = o.Customer_id;

-- find the customer who doesnt place order --
select c.customer_name,c.customer_id,o.product,
o.amount
from customer c
left join orders o
on c.customer_id = o.customer_id
where O.product is null;

-- right join --
select o.order_id,o.amount,o.Customer_id,C.Customer_ID
from Orders o
right join Customer c
on o.Customer_id = c.customer_ID
where o.order_ID is null;

-- cross join --
select C.customer_name, 
o.product
from Customer c
cross join Orders o;

-- 
select C.customer_name, 
o.product
from Customer c
cross join Orders o
where o.amount > 20000;

-- self join --
select c1.customer_name as group_1,
c2.customer_name as group_2
from customer c1
join customer c2
on c1.customer_id < c2.Customer_id




