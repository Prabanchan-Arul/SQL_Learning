-- SQL ASSIGNMENT 3 --
-- GenAI Application – SQL Data Types and Constraints --

-- 1. Create a database named GenAI_App
create database GenAI_App;
use GenAI_App;

-- 2. Create a table named Users with the following columns:
-- user_id – Integer, Primary Key
-- username – Maximum 50 characters, cannot be NULL
-- email – Maximum 100 characters, must be unique
-- age – Integer, must be 18 or above
-- phone – Fixed 10 characters
-- registration_date – Date
-- account_status – Default value should be 'Active

-- Query --
create table Users(
User_ID int primary key,
Username varchar(50) Not null,
Email varchar(50) unique,
Age int check(Age > 18),
Phone varchar(10),
Registration_date date,
Account_status varchar(10) default 'Active');

-- Data insertion --
insert into Users values
(1001,"Prabanchan","Prabaarul@email.com",21,"9952470784","2026-10-21",default),
(1002,"krishna","krishna@email.com",23,"9056789234","2025-09-25","inactive"),
(1003,"Arul","arul@email.com",52,"7339413422","2024-12-12",default),
(1004,"Aishwarya","aishu@gmail.com",21,"8956784509","2026-07-20","suspended"),
(1005,"Latha","latha@gmail.com",45,"9025678921","2023-05-21",default);

-- 3. Create a table named AI_Models with:
-- model_id – Integer, Primary Key
-- model_name – Maximum 50 characters, cannot be NULL
-- model_version – Maximum 20 characters
-- is_available – Boolean, default value TRUE

-- Query:
create table AI_Models(
Model_ID int primary key,
Model_Name varchar(50) not null,
Model_version varchar(20),
Is_Available boolean default TRUE);

-- Data Insertion
insert into AI_Models values
(1111,"Gemini-Flash","v3.0",Default),
(1112,"Claude-Sonnet","v6.0",False),
(1113,"Mixtral-8x22B","v5.0",default),
(1114,"GPT-4o","v3.0",False);

-- 4. Create a table named Conversations with:
-- chat_id – Integer, Primary Key
-- user_id – Integer, Foreign Key referencing Users
-- model_id – Integer, Foreign Key referencing AI_Models
-- user_prompt – Text, cannot be NULL
-- ai_response – Text
-- token_count – Integer, must be zero or above
-- chat_time – Date and Time

-- Query:
create table Conversations(
Chat_ID int primary key,
user_ID int not null,
model_ID int not null,
User_prompt text not null,
AI_response text,
token_count int check(token_count >= 0),
chat_time datetime,

foreign key(user_ID)
references Users(User_ID), -- User table User ID reference

foreign key(model_ID)
references AI_models(Model_ID)); -- AI_Model Model_ID reference

-- Data Insertions --
insert into Conversations values
(1011,1001,1113,"Fix this grammar: She don't know nothing.","She doesn't know anything.",250,"2026-07-23 12:05:00"),
(1012,1004,1111,"Generate a quick JavaScript arrow function to square a number.","const square = x => x * x;",640,"2026-07-23 18:09:00"),
(1013,1003,1112,"What does the SQL command TRUNCATE do?","It deletes all rows from a table quickly without logging individual row deletions.",310,"2026-07-23 20:07:00"),
(1014,1002,1113,"Give a quick tip to reduce stress.","Try the 4-7-8 breathing technique: inhale for 4 seconds, hold for 7, and exhale for 8.",780,"2026-07-23 09:08:00");

-- 5. Payment Table Creations --
CREATE TABLE Payments (
payment_id INT PRIMARY KEY,
user_id INT,
amount DECIMAL(10,2),
payment_date DATETIME,
payment_status VARCHAR(20) default 'Paid',
FOREIGN KEY (user_id) REFERENCES Users(user_id));

-- Data Insertion --
insert into Payments values
(1101,1001,250.00,"2026-03-23 12:45:00",default),
(1102,1002,650.00,"2026-10-10 15:00:00","unpaid"),
(1103,1004,1000.00,"026-11-12 23:00:45",default),
(1104,1005,600.00,"2026-10-07 14:00:00","processing");

-- 6.Display all records from the four tables.
Select * from Users;
select * from AI_Models;
select * from Conversations;
select * from Payments;

-- 7.display only the username and email of all users.
select Username,Email
from Users;

-- 8.Display users whose age is greater than 25.
select * from users
where Age > 25;

-- 9.Display AI models that are currently available.
select * from AI_Models
where Is_Available = TRUE;

-- 10.Display conversations where token_count is greater than 500.
select chat_ID,User_ID,Model_ID,Token_count from Conversations
where Token_count > 500;

-- 11. Display payments with an amount greater than ₹500.
select * from payments
where amount > 500.00;

-- 12.Try inserting a duplicate email into the Users table. Observe the result.
insert into Users values
(1006,"Saran","prabaarul@email.com",21,"9345193361","2026-11-10",default);

-- 13.Try inserting a user below 18 years of age. Observe the result.
insert into Users values
(1007,"kani","kaniarul@emai.com",17,"9807675849","2026-11-11","inactive");

-- 14.Insert a payment without specifying payment_status. Check the default value
insert into payments (payment_id,user_id,amount,payment_date) values
(1105,1003,1500.00,"2026-11-10 12:00:00");

select * from payments;