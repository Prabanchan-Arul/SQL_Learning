-- CTE - Common Table Expression --
-- database creation and table --
Create Database SwiggyDB;
use SwiggyDB;

-- Customer Table --
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Restaurant Table --
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(50),
    cuisine VARCHAR(50),
    city VARCHAR(50)
);

-- Order Table --
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);


-- Value Creation --
-- Customers Values --
INSERT INTO Customers VALUES
(1,'Arun','Chennai'),
(2,'Bala','Coimbatore'),
(3,'Charan','Chennai'),
(4,'Divya','Madurai'),
(5,'Ezhil','Bangalore'),
(6,'Farah','Chennai');

-- Restaurants Values --
INSERT INTO Restaurants VALUES
(101,'A2B','South Indian','Chennai'),
(102,'Dominos','Pizza','Chennai'),
(103,'SS Hyderabad','Biryani','Coimbatore'),
(104,'Burger King','Fast Food','Bangalore'),
(105,'Anjappar','Chettinad','Madurai');

-- Orders Values --
INSERT INTO Orders VALUES
(1001,1,101,250,'2026-11-01','Delivered'),
(1002,1,102,450,'2026-11-02','Delivered'),
(1003,2,103,600,'2026-11-03','Delivered'),
(1004,2,103,300,'2026-11-04','Cancelled'),
(1005,3,101,350,'2026-11-05','Delivered'),
(1006,3,102,700,'2026-11-06','Delivered'),
(1007,4,105,500,'2026-11-07','Pending'),
(1008,4,105,400,'2026-11-08','Delivered'),
(1009,5,104,800,'2026-11-09','Delivered'),
(1010,5,104,250,'2026-11-10','Delivered'),
(1011,6,101,150,'2026-11-11','Cancelled'),
(1012,6,102,550,'2026-11-12','Delivered');


-- Types and Examples --
-- 1. Simple CTE
-- Find all delivered orders --
with Delivered_orders as (
select* from Orders
Orders
where status = "delivered")
select * from Delivered_orders;

-- Type 2 using Where --
with Delivered_orders as (
select* from Orders
Orders
where status = "delivered")
select * from Delivered_orders
where order_amount > 500;

-- type 3 using aggregate Function
-- Calculate the total where status is delivered
with Total_amount as (
select Customer_id,Sum(order_amount) as Total_amount,status
from Orders
where status = "delivered"
group by customer_id )
select * from Total_amount;

-- type 4 using having --
-- find the delivered status whose amount having greaterr than 500
with Total_amount as (
select Customer_id,Sum(order_amount) as Total_amount,status
from Orders
where status = "delivered"
group by customer_id
having Total_amount >= 500)
select * from Total_amount;

-- CTE using join --
with Cust_spending as (
select Customer_ID,
status,
sum(Order_amount) as Total from Orders
where status ='delivered'
group by Customer_id)
select C.Customer_id,C.customer_name,h.Total
from Customers C
join Cust_Spending h
on C.Customer_id = h.Customer_id;

-- Multiple CTE --
with Cust_spending as (
select Customer_ID,
status,
sum(Order_amount) as Total from Orders
where status ='delivered'
group by Customer_id),
high_spending as (
select * from Cust_spending
where Total >= 500)
Select c.customer_name,h.total
from customers c
join high_spending h on c.customer_id = h.customer_id;

-- CTE with rank function --
with Cust_spending as (
select Customer_ID,
status,
sum(Order_amount) as Total from Orders
where status ='delivered'
group by Customer_id),
high_spending as (
select *, dense_rank() over(
order by total desc) as rank_num from Cust_spending)
select C.customer_name, h.rank_num,h.total from Customers c
join High_spending h on C.customer_id = h.Customer_id;

-- find restaurants having more than 1 orders using CTE and group by --
with restaurant_stats as (
select Restaurant_id,count(Order_id) as total_Orders from Orders
group by Restaurant_id
having Total_Orders > 1)
select * from restaurant_stats;

-- Using join --
with restaurant_stats as (
select Restaurant_id,count(Order_id) as total_Orders from Orders
group by Restaurant_id
having Total_Orders > 1)
select r.Restaurant_id, r.restaurant_name,rs.Total_orders from Restaurants r
join restaurant_stats rs on r.Restaurant_id = rs.Restaurant_id;