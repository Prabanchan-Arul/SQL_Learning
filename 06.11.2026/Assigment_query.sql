-- 1.Create a database named MovieBooking.
create database Movie_Booking;

use Movie_Booking;

-- 2. Create a table named Movies with the following columns: 
-- Movie_ID, Movie_Name, Genre, Language, Duration, Release_Year.
create table Movies(
Movie_ID int,
Movie_Name varchar(30),
Genre varchar(30),
Language varchar(30),
Duration int,
Release_Year year);

insert into Movies values
(106,'Leo','Action','tamil',145,2023),
(107,'Jananayagan','Political','tamil',180,2026),
(110,'Scene','Thriller','Tamil',150,2026),
(111,'418','horror','telugu',160,2026),
(112,'bramayugam','horror','malayalam',170,2024);

-- 3.Create a table named Customers with: Customer_ID, Customer_Name, Email, Phone, Age.
create table Customer(
Customer_ID int,
Customer_Name varchar(30),
Email varchar(30),
Phone varchar(15),
Age int);

insert into Customer values
(101,'vimal','vimal@email.com','9785467980',17),
(102,'praba','praba@gmail.com','9952470784',21),
(103,'vishnu','vishnu@email.com','9345193361',16),
(105,'Krishna','krishna@email.com','8790657689',23),
(106,'kesavan','kesavan@email.com','7685490323',19);

-- 4.Create a table named Bookings with: Booking_ID, Customer_ID, Movie_ID, Theatre_ID, Booking_Date, Tickets, Total_Amount.
create table booking(
Booking_ID int,
Customer_ID int,
Movie_ID int,
Theatre_ID int,
Booking_date date,
Tickets int,
Total_amount int);

insert into booking values
(1001,101,105,001,'2025-05-01',5,1000),
(1002,102,106,002,'2024-01-01',8,1600),
(1003,103,107,003,'2025-02-08',0,0),
(1004,104,109,005,'2025-07-09',20,4000),
(1005,105,110,007,'2024-12-30',5,1000);

-- 5. Create a theatre table with : theatre_ID, theatre_name, location, Phone. 
create table theatres(
Theatre_ID int,
Theatre_name varchar(30),
location varchar(30),
Phone varchar(15));

insert into theatres values
(0001,'vels','tiruniravur','9034738392'),
(0002,'rohini','koyambedu','9723456709'),
(0004,'kamala','vadapalani','8056980912'),
(0003,'rakki','ambattur','7867894567'),
(0005,'ags','villivakkam','6785489012');

-- 6. Add a new column Rating to the Movies table.
alter table Movies
add column Ratings int;

-- 7. Add a new column Seat_Type to the Bookings table
alter table Booking
add column Seat_type varchar(30);

-- 8. Change the size of the Movie_Name column to VARCHAR(150).
alter table Movies
modify column Movie_Name varchar(150);

-- 9. Rename the column Phone to Mobile_Number in the Customers table.
alter table Customer
rename column Phone to Mobile_Number;

-- 10. Rename the table Theatres to Cinema_Halls.
rename table theatres to Cinema_halls;

-- 11.Remove the Rating column from the Movies table.
alter table Movies
drop column ratings;

-- 12.Create a backup table named Movies_Backup using the structure and data of the Movies table.
create table Movies_backup 
like Movies;

-- 13.Display the structure of all four tables.
describe Booking;
describe Cinema_halls;
describe Customer;
describe Movies;

-- 14.Display all databases available in MySQL
show databases;

-- 15.Delete the entire Movies_Backup table from the database.
drop table movies_backup;

-- 16.Delete all bookings where the number of tickets is 0.
delete from booking
where tickets = 0;

-- 17.A particular customer permanently deleted their account. Delete the customer whose Customer_ID is 105.
delete from customer
where Customer_ID = 105;

-- 18.A theatre has stopped operating. Delete the theatre record with Theatre_ID = 4.
delete from cinema_halls
where theatre_ID = 0004;

-- 19.Remove all booking records made before 2025-01-01.
delete from booking
where Booking_date < '2025-01-01';

-- 20.Delete all movies belonging to the Horror genre.
delete from movies
where genre = 'horror';

-- 21.A movie is no longer available in the application. Delete the movie with Movie_ID = 110.
delete from movies
where Movie_ID = 110;

-- 22.Delete all customers whose age is below 18.
delete from Customer
where Age < 18;

-- 23.The management wants to clear all booking records while keeping the Bookings table structure. Write a query for this requirement.
truncate table booking;