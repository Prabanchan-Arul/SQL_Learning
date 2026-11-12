-- Database and table creation --
create database Netflix_DB;
use Netflix_DB;

-- Table Creation --
create table Netflix(
Show_ID int primary key,
Title varchar(100),
genre varchar(50),
Country varchar(50),
release_year int,
rating decimal(3,1),
total_views int,
show_type varchar(20));

-- values Insert --
insert into Netflix values
(1,'Stranger Things','Sci-Fi','USA',2016, 9.0, 500000,'Series'),
(2,'Dark','Sci-Fi','Germany',2017, 8.7,300000,'Series'),
(3,'Money Heist','Crime','Spain',2018, 8.5,700000,'Series'),
(4,'Extraction','Action','USA',2020,7.5,800000,'Movie'),
(5,'Wednesday','Comedy','USA',2022,8.2,600000,'Series'),
(6,'RRR','Action','India',2022, 8.8, 900000,'Movie'),
(7,'Leo','Action','India',2023,7.8,750000,'Movie'),
(8,'Lupin','Crime','France',2021,7.9,400000,'Series'),
(9,'The Platform','Thriller','Spain',2019,7.0,250000,'Movie'),
(10,'Dangal','Drama','India',2016,8.4,650000,'Movie');


-- count function --
select count(*) as Total_rows from Netflix;

-- to count only movies --
select count(*) as Movies from Netflix
where Show_type = 'Movie';

-- to sum total views --
select SUM(total_views) as total_Vies 
from Netflix;

-- Average of ratings --
select AVG(Rating) as Average_ratings
from Netflix;

-- to find min and max of views --
select MIN(Total_views) as Low_views
from Netflix;

select MAX(Total_views) as High_views
from Netflix;

-- group by --
select genre,
count(*) as Total
from Netflix
group by genre;

select genre,
sum(total_views) as Total_views
from Netflix
group by genre;

-- average rating by genre --
select genre,
Avg(rating) as avg_rating_by_genre
from Netflix
group by genre;

-- to finding highest rating each genre --
select genre,
max(rating) as highest_rating
from Netflix
group by genre;

-- to find minium views by genre --
select genre,
min(total_views) as minimun_views
from netflix
group by genre;

-- to find minimum and maximum rating og each movies group by genre --
select genre,title,
max(rating) as high_rating,
min(rating) as low_rating
from netflix
group by genre,title;

-- having --
-- find a countries having more than 2 movies --
select country,
count(*) as Total_movies
from netflix
where Show_type = 'movie'
group by country
having count(*) >=2;

-- find the genre whose having rating above 8 --
select genre,
avg(rating) as Avg_rating
from Netflix
group by genre
having avg(rating) > 8;

-- find the first 5 values of ratings --
select * from Netflix
order by rating asc
limit 5;

select genre,
Avg(rating) as Avg_rating
from Netflix
group by genre
order by Avg_rating asc
limit 5;

-- how many movies and series available in each countries
select Show_type,Country,
Count(*) as Total_Shows
from Netflix
group by Country,Show_type
order by country;

-- find movies and series total using case when --
select 
sum(case
when show_type = 'movie' then 1 else 0 end ) as total_movies,
sum(case 
when show_type = 'series' then 1 else 0 end ) as total_series
from Netflix;

-- count movies and series based by countries.

select Country,
sum(case
when show_type ='movie' then 1 else 0 end) as Total_movies,
sum(case
when show_type='series' then 1 else 0 end) as Total_series  
from netflix
group by Country;