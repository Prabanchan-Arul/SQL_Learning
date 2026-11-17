-- Windows Function --
-- database creation and Table Creation --
create database Amazon1_DB;
use Amazon1_DB;

create table Amazon_sales(
Sale_id int primary key,
Category Varchar(30),
Product varchar(30),
Sale_Date date,
Amount int);

insert into Amazon_sales values
(1, 'Electronics', 'iPhone 15', '2026-01-05', 80000),
(2, 'Electronics', 'Echo Dot', '2026-01-12', 5000),
(3, 'Electronics', 'Kindle', '2026-01-20', 12000),
(4, 'Electronics', 'Fire TV Stick', '2026-01-28', 5000),
(5, 'Books', 'Atomic Habits', '2026-01-03', 500),
(6, 'Books', 'Deep Work', '2026-01-15', 600),
(7, 'Books', 'Python Crash Course', '2026-01-25', 600),
(8, 'Books', 'Clean Code', '2026-02-02', 900);

-- Exist --
select * from Amazon_sales t1
where Exists(select 1 from Amazon_sales t2 where t2.amount = t1.amount and t2.Sale_id <> T1.sale_id);

-- Not Exists --
select * from Amazon_sales t1
where not Exists (select 1 from Amazon_sales t2 where t2.amount=t1.amount and t2.Sale_id <> T1.sale_id);

-- category wise group by --
select category,sum(amount) from amazon_sales
group by category;

-- uing windows function --
select category,product,amount,
sum(amount) over (partition by Category) as Total
from Amazon_sales;

-- Row_Number --
select *, row_number()
over(
order by amount desc) as R_no
from Amazon_sales;

select *, Row_number()
over(
order by Product desc) as R_no
from Amazon_sales;

select *, Row_number()
over(
order by Product Asc) as R_no
from Amazon_sales;

-- Rank Function --
select *, Rank()
over(
order by amount desc) as Rank_no
from Amazon_sales;

-- dense_rank --
select *, dense_rank()
over(
order by amount desc) as R_no
from Amazon_sales;

-- Ntile --
select *,
ntile(4) over(order by Amount desc) as product_name
from Amazon_sales;

-- partition by category find sum for each category --
select *,
sum(Amount) over (partition by Category) as total_amount
from amazon_sales;

select Distinct Category,
count(product) over(partition by Category) as Total_products
from Amazon_sales;

select Distinct (Category),
Min(amount) over(partition by Category) as min_product,
Max(amount) over(partition by Category) as max_product
from Amazon_sales;

-- First_value --
select *,
first_value(amount) over(partition by Category order by Sale_date) as Max_num
from Amazon_sales;

-- last value --
select *,
last_value(amount) over(partition by Category order by sale_date desc) as Max_num
from Amazon_sales;

insert into Amazon_sales values
(9, 'Electronics', 'iPhone 15', '2026-01-05', 45000);