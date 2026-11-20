-- Database Creation -- And Table Creation --
CREATE DATABASE food_delivery;
USE food_delivery;

-- Customer Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    signup_date DATE
);

-- Restaurants Tables
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1) DEFAULT 3.0
);

-- Orders Tables
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
);

-- Order Items Tables 
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    item_name VARCHAR(100),
    quantity INT,
    item_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- Values Insertion --
-- Customer Values
INSERT INTO customers VALUES
(1,'Arun','Chennai','arun@gmail.com','2025-01-10'),
(2,'Priya','Bangalore','priya@gmail.com','2025-02-15'),
(3,'Rahul','Chennai','rahul@gmail.com','2025-03-01'),
(4,'Divya','Hyderabad','divya@gmail.com','2025-03-10'),
(5,'Karthik','Bangalore','karthik@gmail.com','2025-04-05'),
(6,'Sneha','Chennai','sneha@gmail.com','2025-04-20'),
(7,'Vikram','Mumbai','vikram@gmail.com','2025-05-01'),
(8,'Meena','Hyderabad','meena@gmail.com','2025-05-15'),
(9,'Ajay','Pune','ajay@gmail.com','2025-06-01'),
(10,'Nisha','Chennai','nisha@gmail.com','2025-06-15');

-- restaurants Data insertion
INSERT INTO restaurants VALUES
(101,'Spicy Kitchen','Chennai','Indian',4.5),
(102,'Pizza World','Bangalore','Italian',4.2),
(103,'Burger Hub','Hyderabad','Fast Food',3.9),
(104,'Wok Express','Chennai','Chinese',4.6),
(105,'Green Bowl','Pune','Healthy',4.7),
(106,'Taco House','Mumbai','Mexican',4.1);

-- order data Insertion 
INSERT INTO orders VALUES
(1001,1,101,'2025-07-01',500,'Delivered'),
(1002,2,102,'2025-07-01',800,'Delivered'),
(1003,1,104,'2025-07-02',1200,'Delivered'),
(1004,3,101,'2025-07-02',300,'Cancelled'),
(1005,4,103,'2025-07-03',450,'Delivered'),
(1006,5,102,'2025-07-03',900,'Delivered'),
(1007,2,101,'2025-07-04',700,'Delivered'),
(1008,6,104,'2025-07-04',1500,'Delivered'),
(1009,7,106,'2025-07-05',350,'Pending'),
(1010,8,103,'2025-07-05',600,'Delivered'),
(1011,1,101,'2025-07-06',1000,'Delivered'),
(1012,9,105,'2025-07-06',400,'Cancelled'),
(1013,5,102,'2025-07-07',1100,'Delivered'),
(1014,10,104,'2025-07-07',750,'Delivered'),
(1015,3,101,'2025-07-08',650,'Delivered'),
(1016,6,104,'2025-07-08',950,'Delivered');

-- order items data Insertions
INSERT INTO order_items VALUES
(1,1001,'Biryani',2,250),
(2,1002,'Pizza',2,400),
(3,1003,'Noodles',3,400),
(4,1004,'Burger',1,300),
(5,1005,'Burger',3,150),
(6,1006,'Pizza',2,450),
(7,1007,'Biryani',2,350),
(8,1008,'Fried Rice',3,500),
(9,1009,'Tacos',2,175),
(10,1010,'Burger',2,300),
(11,1011,'Biryani',2,500),
(12,1012,'Salad',2,200),
(13,1013,'Pizza',2,550),
(14,1014,'Noodles',3,250),
(15,1015,'Biryani',1,650),
(16,1016,'Fried Rice',2,475);


-- Questions --
-- 1. select all the records  -- select,distinct,alias
select * from Customers;
select * from order_items;
select * from Orders;
select * from Restaurants;



-- 2.display customer name and cities
select Customer_name,City
from Customers;

-- 3 .display unique customer city--
select distinct(city)
from Customers;

-- display first 5 customers --
select * from Customers
limit 5;

-- find the 3 most recent customer --
select * from customers
order by Customer_id desc
limit 3;

-- find customer from chennai or bangalore--
select * from Customers
where city = 'chennai' or city ='bangalore';

select * from Customers
where city in ('chennai','bangalore');

-- find customer whose email is missing
select * from Customers
where email is null;

-- find customer whose name starts with A --
select * from Customers 
where Customer_name like 'A%';

-- find the delivered order above 500 from restaurant 101 and 104
select * from orders
where restaurant_id in ('101','104')
having Order_amount > 500;

-- delete, alter, modify
-- change customer 1 city to coimbatore
update customers set city = 'coimbatore'
where Customer_id = 1;

-- add phone number column --
alter table Customers 
add column phone_number varchar(10);

-- moify the phone_number size of the column
alter table Customers
modify column phone_number varchar(20);

-- drop the phone Number column--
alter table Customers drop column phone_number;

-- aggregate functions
-- calculate the total order_values
select sum(order_amount) as total_order_amount
from Orders;


-- find the highest and lower order amount
select 
min(order_amount) as min_amount,
max(order_amount) as max_amount
from orders;

-- find restaurants with more than 2 orders --
select restaurant_id,count(*) as no_of_orders
from orders
group by restaurant_id
having count(*) >2;

-- find the restaurants with average order values above 700
select restaurant_id,avg(order_amount) as Average_amount
from orders
group by restaurant_id
having avg(order_amount) > 700;

-- case when ,group by, order --
-- categorize the order above 1000 is high ,above 500 medium, below 500 low
select *,
case
when order_amount >= 1000 then "high"
when order_amount >=500 then "medium"
else 'low' end as Category_price
from Orders;

-- calculate revenue from the restaurants --
select restaurant_id,sum(order_amount) as revenue
from orders
group by Restaurant_id;

-- constarints --
-- create a student table with primary key and required name
create table Students (
student_id int primary key,
student_name varchar(30) not null,
student_age int);

-- create a product table with positive price check --
create table Products (
Product_id int primary key,
Product_name varchar(30) not null,
Product_price Decimal(10,2) check(Product_price >0));

-- create a enrollment table with composite key --
create table enroll (
student_id int,
Course_id int,
Course_name varchar(30) not null,
Course_price int,
primary key (Student_id, Course_name));

-- joins --
-- shows the customer name with their orders --
select c.customer_name,c.customer_id,o.order_id,Order_amount
from Customers c
join Orders o
on C.customer_id = O.customer_id;

-- show the customers including their without orders
select c.Customer_name,c.customer_id,o.Order_id,O.order_amount
from Customers C
left join Orders o
on C.customer_id = O.Customer_id;

-- show every possible sutomer with restaurants combinations --
select Customer_name, o.restaurant_id
from Customers c
cross join orders o
on C.customer_id = o.Customer_id;

-- outer join --
select c.customer_name,o.order_id
from Customers c
left join orders o
on c.customer_id = o.customer_id
union select c.Customer_id,o.order_id
from customers c
right join orders o
on c.Customer_id = o.customer_id;

-- sub_query --
-- find customers who placed one orders using exists
select * from Customers o1
where exists ( select 1 from orders o2 where o2.customer_id = o1.Customer_id);

-- windows function --
-- divide orders into four amount groups --
select *,
ntile(4) over(order by Order_amount desc) as Amount_group
from orders;

-- SubQuery plus window_functions --
-- find top 3 restaurants from delivered revenue --
select * from
(select restaurant_id,sum(Order_amount),Order_status, dense_rank() over(order by sum(order_amount) desc )
as Rank_num
from orders
where order_status = 'delivered'
group by restaurant_id ) as restaurants
where rank_num <= 3;

-- list delivered orders using cte --
with Delivered_orders as (
select * from orders
where order_status = "delivered"
having order_amount > 700)
select * from Delivered_orders;