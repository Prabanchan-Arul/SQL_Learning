create database Swiggy_db;

use Swiggy_db;

create table Order_table(
Customer_id int,
Customer_name varchar(30),
Order_id int,
Food_item varchar(50),
Amount int);

describe Order_table;

insert into Order_table values
(0001,'deepak',1001,'pizza',250),
(0002,'jeshu',1002,'biriyani',150),
(0003,'krishna',1003,'noodles',120),
(0004,'praba',1004,'juice',50),
(0005,'joseph',1005,'parotta',100),
(0002,'jeshu',1006,'chicken 65',120),
(0004,'praba',1008,'icecream',150),
(0008,'vijay',1007,'kothu_parotta',200),
(0005,'joseph',1009,'ramen',250),
(0010,'vishnu',1010,'dosa',100);

select * from Order_table;


update Order_table set Food_item = 'biriyani'
where Customer_id = 0004;

update Order_table Set Food_item = 'noodles'
where Order_id = 1009;

set sql_safe_updates = 0;

delete from Order_table
where Customer_id = 4;

delete from Order_table
where Order_id = 1010;


Select * from Order_table;

Select Customer_id, Food_item from Order_table;

select * from Order_table
where Amount > 100;

select * from order_table
where Food_item ='noodles';

select * from order_table
order by amount desc;











