-- Database Creation --
create database Uber;
use Uber;

-- Table Creation --
create table Uber_rides(
Ride_ID int primary key,
Customer_Name varchar(50) not null,
Pickup_city varchar(15),
fare decimal(10,2),
ride_status varchar(15),
driver_ID int);

-- Data Insertion --
insert into Uber_rides values
(101,'Arun','chennai',250.00,'completed',501),
(102,'priya','bangalore',650.00,'completed',502),
(103,'karthik','chennai',450.00,'cancelled',503),
(104,'divya','hyderabad',900.00,'completed',504),
(105,'ravi','chennai',150.00,'pending',NULL),
(106,'meena','bangalore',750.00,'completed',506),
(107,'suresh','chennai',550.00,'completed',507),
(108,'nila','hyderabad',300.00,'pending',NULL);


-- WHERE --
select * from Uber_rides
where Customer_Name = 'arun';

select * from Uber_rides
where Pickup_city = 'chennai';

select * from Uber_rides
where Driver_ID is null; -- to check null driver Id 

-- AND Operator -- find completed rides from chennai
select * from Uber_rides
where Pickup_city = 'chennai' and ride_status = 'completed';

-- OR operator -- 
select * from Uber_rides
where pickup_city = 'chennai' or ride_status ='completed';

-- not operator -- except cancelled ride
select * from Uber_rides
where not ride_status ='cancelled'; 

-- find rides costing more than 500
select * from Uber_rides
where fare > 500;

-- find rides costs less than 200
select * from Uber_rides
where fare < 200;

-- CASE WHEN --
select Ride_ID, Customer_Name,Fare,
case
when fare >=700 then 'high fare'
when fare >=500 then 'medium fare'
when fare >=300 then 'low fare'
else 'NA'
end as fare_category from uber_rides;

-- categorizes the ride status --

select Ride_ID, Customer_name, Ride_status,
case
when ride_status = 'completed' then 'successfull ride'
when ride_status ='cancelled' then 'Unsuccessfull ride'
when ride_status ='pending' then 'waiting for driver'
else 'NA'
end as status_Category from Uber_rides;

-- IN operator -- show customer pickup city is chennai and hyderabad
select * from Uber_rides
where Pickup_city in ('chennai','hyderabad');

-- Between Operator --
select * from Uber_rides
where fare between 500 and 700;

-- like Operator --
select * from Uber_rides
where Customer_name like 'S%'; -- name starts with S letter

select * from Uber_rides
where Customer_name like '%i'; -- name ends with I characters

select * from Uber_rides
where Customer_name like '%r%'; -- name contains R letter

select * from Uber_rides
where Customer_name like '____'; -- name with four characters

-- NOT NULL --
-- to identify all where the rider already been assigned --
select * from Uber_rides
where Driver_id is not null;

-- Order by --
select * from Uber_rides
Order by fare Asc; -- ascending order

select * from Uber_rides
order by fare desc; -- descending order

-- limit --
select * from Uber_rides
limit 3;

-- top 3 expensive rides --
select * from Uber_rides
order by fare desc
limit 3;

-- latest 2 bookings --
select * from Uber_rides
order by Ride_id desc
limit 2;

select * from Uber_rides
order by Ride_id asc
limit 3
offset 3;

-- find unique cities --
select distinct Pickup_city
from Uber_rides;

-- find uniue fares --
select distinct fare 
from Uber_rides;

-- find unique city and ride status --
select distinct pickup_city,Ride_status
from Uber_rides;

-- find top 2 expensive rides from chennai
select * from Uber_rides
where Pickup_city='chennai'
order by fare desc
limit 2;

-- display only two unique cties
select distinct Pickup_city from Uber_rides
limit 2;

-- find latest 3 rides --
select * from uber_rides
order by Ride_ID desc
limit 3;


-- display all rides booked by priya --
select * from Uber_rides
where Customer_name = 'priya';

-- display all rides from bangalore
select * from Uber_rides
where pickup_city = "bangalore";

-- find rides with fare more than 400
select * from Uber_rides
where fare > 400;

-- Find rides with a fare less than or equal to ₹300.
select * from Uber_rides
where fare <= 300;

-- Find completed rides from Chennai.
select * from uber_rides
where Pickup_city ='chennai' and ride_status = 'completed';

-- Display rides that are either pending or cancelled.
select * from uber_rides
where Ride_status = 'pending' or ride_status = 'cancelled';

-- Find all rides except completed rides.
select * from uber_rides
where ride_status != 'Completed';

-- Find rides from Chennai, Bangalore and Hyderabad using IN.
select * from uber_rides
where Pickup_city in ('chennai','Bangalore','Hyderabad');

-- Find rides with fares between ₹200 and ₹600.
select * from Uber_rides
where fare between 200 and 600;

-- Find customers whose names start with S.
select * from uber_rides
where Customer_name like 'S%';

-- Find customers whose names end with a.
select * from Uber_rides
where Customer_name like '%a';

-- Find customers whose names contain the letter i.
select * from uber_rides
where Customer_name like '%i%';

-- Find rides where the driver is not assigned.
select Ride_ID, Customer_Name,Driver_ID,PIckup_city
from Uber_rides
where Driver_ID is null;

-- Find rides where the driver is assigned.
select * from Uber_rides
where Driver_ID is not null;

-- Display rides in ascending order of fare
select * from Uber_rides
order by fare asc;

-- Display rides in descending order of fare.
select * from Uber_rides
order by fare desc;

-- Display the top 2 highest-fare rides.
select * from Uber_rides
order by fare desc
limit 2;

-- Display unique pickup cities
select distinct Pickup_city
from Uber_rides;

-- Display unique ride statuses.
select distinct ride_status
from Uber_rides;

-- Categorize rides as High Fare, Medium Fare and Low Fare using CASE WHEN.
select Ride_ID, Customer_name,Fare,
case
when fare >=700 then 'high fare'
when fare >=500 then 'moderate fare'
when fare >=300 then 'low fare'
else "na"
end as fare_category from Uber_rides;