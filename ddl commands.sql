-- (data defination language)
-- insert quiry
 -- data base ko hi schema bole che
-- creating the data base
create database nilesh;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- to select the data base
use nilesh;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- creating the tabel
create table users(
user_id integer primary key auto_increment,
name varchar(255) not null,
emial varchar(255) not null,
password varchar(255) not null
);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- inserting the values in table
insert into nilesh.users(user_id,name,emial,password)
values(null,'nilesh','nil@gmail.com', '1234'),
(null,'ram','ram@gmail.com','2345'),
(null,'sita','sita@gmail.com','3456'),
(null,'monu','momnuAgmail.com','4567');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- retrive command
-- select command
-- how to inmport dataset to my sql workbench
-- importing like this 1. go to table right click, 2.select table data import wizard, 3.last choose your file location
-- to fetch all rows and columns

select * from nilesh.placement where 1;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- how to filtered data
SELECT * FROM nilesh.smartphones_cleaned_v6;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- i use alias use for renaming the columns
select model,
sqrt(resolution_width * resolution_width + resolution_height* resolution_height) / screen_size as ppi
 from nilesh.smartphones_cleaned_v6;
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- distinct(unique) fetching this data distinct data

select distinct(brand_name) as "all brands" from nilesh.smartphones_cleaned_v6;

select distinct(processor_brand) as 'all processor'
from nilesh.smartphones_cleaned_v6;

select distinct(os) as 'all os'
from nilesh.smartphones_cleaned_v6;

-- uniique combinations
select distinct brand_name,processor_brand
from nilesh.smartphones_cleaned_v6;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- filtering rows using where clause
-- find the all samaung phones
select * from nilesh.smartphones_cleaned_v6 
where brand_name = 'samsung';

select * from nilesh.smartphones_cleaned_v6 
where brand_name = 'apple';

-- find the all phones with proice > 50000
select * from nilesh.smartphones_cleaned_v6
where price > 50000;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- beetwen operator
-- find all phones in with price range is 10000 to 20000
select * from nilesh.smartphones_cleaned_v6
where price > 10000 and price <20000;

select * from nilesh.smartphones_cleaned_v6
where price between 10000 and 20000;

-- find phone with rating  > 80  and price < 25000
select * from nilesh.smartphones_cleaned_v6
where price <15000 and rating >80 and processor_brand='snapdragon';

-- find all phones with ram >8gb
select * from nilesh.smartphones_cleaned_v6
where ram_capacity > 8 and brand_name='samsung';

-- find all phones with sanpdragon
select * from nilesh.smartphones_cleaned_v6
where processor_brand ='snapdragon' and brand_name ='samsung';

-- find all brand who sell phones with price 50000
select distinct(brand_name) from nilesh.smartphones_cleaned_v6
where price > 100000;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- in and not in operator
-- whene you find 2 or more than use (in operator )
select * from nilesh.smartphones_cleaned_v6
where processor_brand in ('snapdragon','exynos','bionic','dimencity');


select * from nilesh.smartphones_cleaned_v6
where processor_brand not in ('snapdragon','exynos','bionic');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- update 
update nilesh.smartphones_cleaned_v6
set processor_brand = 'dimensity'
where processor_brand ='mediatek';
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- delete
-- delete all phones price > 200000
select * from nilesh.smartphones_cleaned_v6
where price > 200000;

-- deleting the price above the 200000
delete from nilesh.smartphones_cleaned_v6


where price > 200000;

-- delete the primary camara is above the 100 pixel 
select * from nilesh.smartphones_cleaned_v6
where  primary_camera_rear > 150;

delete from nilesh.smartphones_cleaned_v6
where  primary_camera_rear > 150 and brande_name='samsung';
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- types of functions in mqsql
-- 1. aggregeate
-- 1.1 max & min

select max(price) from nilesh.smartphones_cleaned_v6;
select min(price) from nilesh.smartphones_cleaned_v6;

select * from nilesh.smartphones_cleaned_v6
where brand_name= 'samsung' and price= 136980;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- finding the average
-- find average rating of apple phones
select avg(rating) from nilesh.smartphones_cleaned_v6
where brand_name='apple';

select avg(rating) from nilesh.smartphones_cleaned_v6
where brand_name='samsung';

select avg(rating) from nilesh.smartphones_cleaned_v6
where brand_name='nokia';
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- sum (calculate the all numbers)
select sum(price) from nilesh.smartphones_cleaned_v6;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- count(count the number of instansis)
-- find the number of oneplus phones

select count(*) from nilesh.smartphones_cleaned_v6
where brand_name='oneplus';

select count(*) from nilesh.smartphones_cleaned_v6
where brand_name='samsung';

select count(*) from nilesh.smartphones_cleaned_v6
where brand_name='apple';
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- count(distinct) find the unique 
--  find the number of brands availabel

select count(distinct(brand_name)) from nilesh.smartphones_cleaned_v6;

select count(distinct(processor_brand)) from nilesh.smartphones_cleaned_v6;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- standerd devaition
-- find the std of screen size

select std(screen_size) from nilesh.smartphones_cleaned_v6;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- variance
-- find variance of ziomi phones prices
select variance(screen_size) from nilesh.smartphones_cleaned_v6;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- scaller functions
-- absolute
select abs(price - 100000) as 'temp' from nilesh.smartphones_cleaned_v6;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- round funtion (round is the how many you want to decimal places )
-- round the ppi 2 decimal place
select model,
round(sqrt(resolution_width * resolution_width + resolution_height* resolution_height) / screen_size,2) as 'ppi'
 from nilesh.smartphones_cleaned_v6;
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- ceil(ceil is the push the nex int number)
 
 select ceil(screen_size) from nilesh.smartphones_cleaned_v6;
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- fllor is the down the below the int number
 select floor(screen_size) from nilesh.smartphones_cleaned_v6;
 