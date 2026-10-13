use nilesh;
----------------------------------------------------------------------------------------------
-- sorting data -- means the which order you want ot show the data like accending or decending based on the condtions.
-- 1.find top 5 samsung phones with biggest screen size

SELECT * FROM nilesh.smartphones_cleaned_v6;
select model,screen_size from nilesh.smartphones_cleaned_v6
where brand_name='samsung'
order by screen_size desc limit 5;
----------------------------------------------------------------------------------------------
-- 2.sort all the phones in decending order of number of total cameras

select model, num_front_cameras + num_rear_cameras as 'total_cameras' 
from nilesh.smartphones_cleaned_v6
order by total_cameras desc;
----------------------------------------------------------------------------------------------
-- 3.sort data don the basis of ppi in decending order

select model,
round(sqrt(resolution_width* resolution_width + resolution_height* resolution_height)/ screen_size,2) as 'ppi'
from nilesh.smartphones_cleaned_v6
order by ppi desc;
----------------------------------------------------------------------------------------------
-- 4.find the phones with 2nd largest battery

select model, battery_capacity
from smartphones_cleaned_v6
order by battery_capacity desc limit 3,2;
----------------------------------------------------------------------------------------------
-- 5.find the phones with 2nd lowest battery

select model, battery_capacity
from smartphones_cleaned_v6
order by battery_capacity asc limit 3,2;
----------------------------------------------------------------------------------------------
-- 6.find the name and rating of the wrost reted apple phones
select model,rating 
from nilesh.smartphones_cleaned_v6
where brand_name='apple'
order by rating asc limit 1;
----------------------------------------------------------------------------------------------
-- 7.sort alphabetical and then on the of basic of price in asc order

select * from nilesh.smartphones_cleaned_v6
order by brand_name asc, price asc;

-- 8.sort alphabetical and then on the of basic of rating in desc order
select * from nilesh.smartphones_cleaned_v6
order by brand_name asc, rating desc;
----------------------------------------------------------------------------------------------
-- grouping data
/* Grouping means organizing data into categories (or buckets) based on the values
 of one or more columns*/
 
 /*  1.gropu smartphones by brand and get the count,avg,price,max rating,avg screen size
 and avg bettry capacity group by animation */
 
select brand_name, count(*) as 'num_phones',
round(avg(price)) as 'avg_price',
max(rating) as 'max_rating',
round(avg(screen_size),2) as 'avg_screen_size' ,
round(avg(battery_capacity),2) as 'avg_battery_capacity'
from nilesh.smartphones_cleaned_v6
group by brand_name
order by num_phones desc limit 15;
----------------------------------------------------------------------------------------------
-- 2.group smartphones by whther they have NFC and get the average price and rating

select has_nfc,
avg(price) as 'avg price',
round(avg(rating),2) as 'rating'
from nilesh.smartphones_cleaned_v6
group by has_nfc;

select has_5g,
avg(price) as 'avg price',
round(avg(rating),2) as 'rating'
from nilesh.smartphones_cleaned_v6
group by has_5g;

select fast_charging_available,
avg(price) as 'avg price',
round(avg(rating),2) as 'rating'
from nilesh.smartphones_cleaned_v6
group by fast_charging_available;
----------------------------------------------------------------------------------------------
-- 3.group smartphones by the memory available and get the avrage price

select extended_memory_available,
avg(price) as 'avg price',
round(avg(rating),2) as 'rating'
from nilesh.smartphones_cleaned_v6
group by extended_memory_available;
----------------------------------------------------------------------------------------------
/* 4. group samrtphones by the brand name and get the count of models and avg primary 
camera resolution rear */

select brand_name,
processor_brand,
count(*) as 'num phones',
avg(primary_camera_rear) as 'avg camera resolution'
from nilesh.smartphones_cleaned_v6
group by brand_name,processor_brand;
----------------------------------------------------------------------------------------------
-- 5.find top 5 most costly phones brand 

select brand_name, avg(price) as 'avg_price'
from nilesh.smartphones_cleaned_v6
group by brand_name
order by avg_price desc limit 5;
----------------------------------------------------------------------------------------------
-- 6.which brand makes the smallest smartphones
select brand_name, avg(screen_size) as 'avg_screen_time'
from nilesh.smartphones_cleaned_v6
group by brand_name
order by avg_screen_time asc limit 5;
----------------------------------------------------------------------------------------------
-- 7.avg price of 5g phones vs price of non 5g phones
select brand_name, round(avg(screen_size)) as 'avg_screen_size'
from nilesh.smartphones_cleaned_v6
group by brand_name
order by avg_screen_size asc limit 1;
----------------------------------------------------------------------------------------------
/* 8.group smartphones by the brand and ind with highest number pf models that have both 
NFC and an OT blaster */

select brand_name, count(*) as 'count'
from nilesh.smartphones_cleaned_v6
where has_nfc ='True' and has_ir_blaster = 'True'
group by brand_name
order by count desc limit 1;
----------------------------------------------------------------------------------------------
-- 9. find all samsung 5g enabled smartphones and find the avg price for non-nfc phones

select has_nfc, avg(price) as 'avg_price'
from nilesh.smartphones_cleaned_v6
where brand_name = 'samsung'
group by has_nfc;
----------------------------------------------------------------------------------------------
-- 10. find the phones name price of the costliest phones
select model,price from nilesh.smartphones_cleaned_v6
order by price desc limit 1;
----------------------------------------------------------------------------------------------
/* having clause (The HAVING clause is used with GROUP BY to apply conditions on
 aggregate functions like COUNT(), SUM(), AVG(), MAX(), and MIN().) */
 ----------------------------------------------------------------------------------------------
 -- 1.find the avg rating of smartphones brand which have more than 20 phones
 
 select brand_name,
 count(*) as 'count',
 avg(rating) as 'avg_rating'
 from nilesh.smartphones_cleaned_v6
 group by brand_name
 having count > 40
 order by avg_rating desc;
 ----------------------------------------------------------------------------------------------
/* 2.find the top 3 brands with highest avg ram that have a refresh rate at least 90hz
and fast charging availabel and dont considerd brand which have than 10 phones */

select brand_name,
avg(ram_capacity) as 'avg_ram'
from nilesh.smartphones_cleaned_v6
where refresh_rate > 90 and fast_charging_available=1
group by brand_name
having count(*) > 10
order by 'avg_ram' desc limit 3;
----------------------------------------------------------------------------------------------
/* 3.find the avg price  if all the phone brands with avg rating >70 and num_phones
more than 10 among than 10 all 5g enabled phones*/

select brand_name,
avg(price) as 'avg_price'
from nilesh.smartphones_cleaned_v6
where has_5g = 'True'
group by brand_name
having avg (rating) >70 and count(*) >10;
----------------------------------------------------------------------------------------------
SELECT * FROM nilesh.ipl_ball_by_ball_2008_2022;

-- 1.find the top 5 batsman in IPL

select batter,sum(batsman_run) as 'runs'
from nilesh.ipl_ball_by_ball_2008_2022
group by batter
order by runs desc limit 5; 
----------------------------------------------------------------------------------------------
-- 2. find the 2nd highest 6 hitter in IPL

select batter, count(*) as 'num_sixes'
 from nilesh.ipl_ball_by_ball_2008_2022
where batsman_run =6
group by batter
order by num_sixes desc limit 1,1;
----------------------------------------------------------------------------------------------
-- 3. find the top 5 batsman with higher strick rate who have played a min of 1000 balls

select batter,sum(batsman_run),count(batsman_run),
round((sum(batsman_run)/count(batsman_run)) * 100,2) as 'sr'
from nilesh.ipl_ball_by_ball_2008_2022
group by batter
having count(batsman_run) > 1000
order by sr desc limit 5;


 