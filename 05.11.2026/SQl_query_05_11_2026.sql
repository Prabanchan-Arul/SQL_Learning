-- Database Creation --
Create Database Flower_db;

-- Set as default Database --
Use Flower_db;

-- Table Creation --
Create table Flowers(
Flower_ID int,
Flower_Name varchar(30),
Price int,
stock int,
color varchar(30));

-- add the values --
insert into Flowers values
(1001,'Jasmine',150,15,'White'),
(1002,'Lilly',200,20,'white'),
(1003,'Lotus',250,10,'pink'),
(1004,'Rose',350,25,'Red'),
(1005,'Sunflower',500,30,'yellow');

-- Customer Table --
create table Customer(
Customer_ID int,
Customer_Name Varchar(30),
Customer_City varchar(10),
Customer_Phone Varchar(15));

-- Add the values to Customer Table --
insert into Customer values
(1111,'jeshu','Chennai','9050152585'),
(1112,'deepak','Madurai','8923674621'),
(1113,'Praba','Cuddalore','9952470784'),
(1114,'Krishna','Trichy','6374097823'),
(1115,'sham','karur','9075243412');

-- Order Table Creation --
create table Orders(
Order_ID int,
Customer_ID int,
FLower_ID int,
Quantity int,
Toatal_Amount int);

-- Insert data into Orders Table --
Insert into Orders values
(1011,1126,1101,20,500),
(1012,1127,1102,25,750),
(1013,1128,1103,15,250),
(1014,1129,1104,40,1000),
(1015,1130,1105,50,1500);

-- Activity Questions --
-- 1. Display All Tables --
select * from Flowers;
select * from Customer;
select * from Orders;

-- 2.Display all table structures
describe Flowers;
Describe Orders;
describe Customer;

-- 3. retrieve all the records from table --
select * from Flowers;
select * from Customer;
select * from Orders;

-- 4. Retrieve flower name and price from flower table --
select Flower_Name,Price
from Flowers;

-- 5.Display the flower data whose price is greater than 100
select * from Flowers
where Price > 200;

-- 6.Display the flower Data whose color is red
select * from FLowers
where color = 'Red';

-- 7. display the flower data whose stock is greater than 15
select * from Flowers
where stock > 15;

-- 8. display the flower data based on price in ascending order
select * from Flowers
order by Price asc;

-- 9. increase the rose price equal to 20
Update Flowers set Price = 20
where Flower_Name = 'Rose';

set sql_safe_Updates = 0;

-- 10 change the fourth customer city to trichy --
Update Customer set Customer_City = 'Trichy'
where Customer_ID = 1111;

-- 11. delete the record from customer table whose ID = 1114
delete from Customer
where Customer_ID = 1114;

-- 12. delete the record from flower table whose id = 1002
delete from Flowers
where Flower_ID = 1002;

-- 13. add a new column into flower table
alter table FLowers 
add column Flower_Type varchar(30);

-- 14. modify the flower name column size into 100
alter table Flowers 
Modify Flower_Name varchar(100);

-- 15. Rename the table Flower into Flower_table
Rename table Flowers to Flowers_Tables;

-- 16. retrieve the distinct customer cities
Select distinct Customer_City from Customer;

-- 17. retrieve the distinct flower name and color
select distinct FLower_Name,Color
from Flowers_tables;

-- 18. show the flower data using price column in desc order using limit 3
select * from Flowers_tables
Order by price desc
limit 3;


