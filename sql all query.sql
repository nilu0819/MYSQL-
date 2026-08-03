-- Show all columns and rows from smartphones table
SELECT * FROM campux.smartphones;

-- Select only model, price, and rating columns
SELECT model, price, rating FROM campux.smartphones;

-- Select only model, battery capacity, and OS columns
SELECT model, battery_capacity, os FROM campux.smartphones;

-- Rename columns using aliases for readability
SELECT 
    os AS 'operating system',   -- renames os column
    model,                      -- keeps model column
    battery_capacity AS 'bc'    -- renames battery_capacity column
FROM campux.smartphones;

-- Show distinct processor brands (no duplicates)
SELECT DISTINCT processor_brand AS 'process brand'
FROM campux.smartphones;

-- Show distinct combinations of brand_name and processor_brand
SELECT DISTINCT brand_name, processor_brand
FROM campux.smartphones;

-- Filter rows where brand_name is samsung
SELECT * FROM campux.smartphones
WHERE brand_name = 'samsung';

-- Filter rows where price is greater than 100000
SELECT * FROM campux.smartphones
WHERE price > 100000;

-- Filter rows where price is between 10000 and 20000 (inclusive)
SELECT * FROM campux.smartphones
WHERE price BETWEEN 10000 AND 20000;

-- Filter rows where rating > 80 AND price > 25000
SELECT * FROM campux.smartphones
WHERE rating > 80 AND price > 25000;

-- Filter samsung phones with RAM capacity greater than 8 GB
SELECT * FROM campux.smartphones
WHERE brand_name = 'samsung' AND ram_capacity > 8;

-- Filter samsung phones with snapdragon processor
SELECT * FROM campux.smartphones
WHERE brand_name = 'samsung' AND processor_brand = 'snapdragon';

-- Show distinct brand names where price > 50000
SELECT DISTINCT brand_name FROM campux.smartphones
WHERE price > 50000;

-- Show all rows from smartphones table (default schema)
SELECT * FROM smartphones;

-- Filter phones with processor brand in given list
SELECT * FROM campux.smartphones
WHERE processor_brand IN ('snapdragon','exynos','dimensity');

-- Filter phones with processor brand NOT in given list
SELECT * FROM campux.smartphones
WHERE processor_brand NOT IN ('snapdragon','exynos','dimensity');

-- Filter phones with processor brand = mediatek
SELECT * FROM campux.smartphones
WHERE processor_brand = 'mediatek';

-- Update processor brand from mediatek to dimensity
UPDATE campux.smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek';

-- Filter phones with battery_capacity = 3000 OR price < 5000
SELECT * FROM campux.smartphones
WHERE battery_capacity = 3000 OR price < 5000;

-- Show all rows from users table
SELECT * FROM users;

-- Update user email and password where name = 'nilesh'
UPDATE users
SET email = 'nileshyhoo@gmail.com', password = '123456'
WHERE name = 'nilesh';

-- Filter phones with price > 200000
SELECT * FROM campux.smartphones
WHERE price > 200000;

-- Delete phones with price > 200000
DELETE FROM campux.smartphones
WHERE price > 200000;

-- Show all rows from smartphones table
SELECT * FROM smartphones;

-- Delete samsung phones with primary_camera_rear > 150 MP
DELETE FROM campux.smartphones
WHERE primary_camera_rear > 150 AND brand_name = 'samsung';

-- Find maximum price among all smartphones
SELECT MAX(price) FROM campux.smartphones;

-- Find minimum price among all smartphones
SELECT MIN(price) FROM campux.smartphones;

-- Find maximum price among samsung phones
SELECT MAX(price) FROM campux.smartphones
WHERE brand_name = 'samsung';

-- Find average rating of apple phones
SELECT AVG(rating) FROM campux.smartphones
WHERE brand_name = 'apple';

-- Find total sum of prices
SELECT SUM(price) FROM campux.smartphones;

-- Count number of samsung phones
SELECT COUNT(*) FROM campux.smartphones
WHERE brand_name = 'samsung';

-- Count distinct processor brands
SELECT COUNT(DISTINCT processor_brand) FROM campux.smartphones;

-- Find standard deviation of screen size
SELECT STD(screen_size) FROM campux.smartphones;

-- Show top 5 samsung models with largest screen size
SELECT model, screen_size FROM campux.smartphones
WHERE brand_name = 'samsung'
ORDER BY screen_size DESC 
LIMIT 5;

-- Show all rows again
SELECT * FROM campux.smartphones;

-- Calculate total cameras (rear + front) per model
SELECT model, num_rear_cameras + num_front_cameras AS 'total_cameras'
FROM campux.smartphones
ORDER BY total_cameras DESC;

-- Calculate approximate pixel density (ppi) using resolution
SELECT model,
ROUND(SQRT(resolution_width*resolution_width + resolution_height+resolution_height)) AS 'ppi'
FROM campux.smartphones
ORDER BY ppi DESC;

-- Find second smallest battery capacity (skip first row using LIMIT offset)
SELECT model, battery_capacity FROM campux.smartphones
ORDER BY battery_capacity ASC 
LIMIT 1,1;

-- Find lowest rated apple phone
SELECT model, rating FROM campux.smartphones
WHERE brand_name = 'apple'
ORDER BY rating ASC 
LIMIT 1;

-- Sort all phones by brand ascending, rating descending
SELECT * FROM campux.smartphones
ORDER BY brand_name ASC, rating DESC;

-- Brand-wise summary: count, avg price, max rating, avg screen size, avg battery
SELECT brand_name, COUNT(*) AS 'num_phones',
ROUND(AVG(price)) AS 'avg_price',
MAX(rating) AS 'max_rating',
ROUND(AVG(screen_size),2) AS 'avg_screen_size',
ROUND(AVG(battery_capacity),3) AS 'avg_battery_capacity'
FROM campux.smartphones
GROUP BY brand_name
ORDER BY num_phones DESC LIMIT 15;

-- Group by NFC availability, show avg price and rating
SELECT has_nfc,
AVG(price) AS 'avg_price',
AVG(rating) AS 'rating'
FROM campux.smartphones
GROUP BY has_nfc;

-- Group by fast charging availability
SELECT fast_charging_available,
AVG(price) AS 'avg_price',
AVG(rating) AS 'rating'
FROM campux.smartphones
GROUP BY fast_charging_available;

-- Group by extended memory availability
SELECT extended_memory_available,
AVG(price) AS 'avg_price',
AVG(rating) AS 'rating'
FROM campux.smartphones
GROUP BY extended_memory_available;

-- Group by brand and processor, count phones and avg rear camera
SELECT brand_name,
processor_brand,
COUNT(*) AS 'num_phones',
ROUND(AVG(primary_camera_rear)) AS 'avg_primary_camera_rear'
FROM campux.smartphones
GROUP BY brand_name, processor_brand;

-- Top 5 brands by average price
SELECT brand_name, ROUND(AVG(price)) AS 'avg_price'
FROM campux.smartphones
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5;

-- Brand with smallest average screen size
SELECT brand_name, ROUND(AVG(screen_size)) AS 'avg_screen_size'
FROM campux.smartphones
GROUP BY brand_name
ORDER BY avg_screen_size ASC LIMIT 1;

-- Brand with most phones having both NFC and IR blaster
SELECT brand_name, COUNT(*) AS 'count'
FROM campux.smartphones
WHERE has_nfc = 'True' AND has_ir_blaster = 'True'
GROUP BY brand_name
ORDER BY count DESC LIMIT 1;

-- Samsung phones grouped by NFC availability
SELECT has_nfc, AVG(price) AS 'avg_price'
FROM campux.smartphones
WHERE brand_name = 'samsung'
GROUP BY has_nfc;

-- Find most expensive phone
SELECT model, price FROM campux.smartphones
ORDER BY price DESC LIMIT 1;

-- Brands with more than 20 phones, sorted by avg rating
SELECT brand_name,
COUNT(*) AS 'count',
ROUND(AVG(rating),2) AS 'avg_rating'
FROM campux.smartphones
GROUP BY brand_name
HAVING COUNT(*) > 20
ORDER BY avg_rating DESC;

-- Top 3 brands with avg RAM capacity, only if refresh_rate > 90 and fast charging available
SELECT brand_name,
AVG(ram_capacity) AS 'avg_ram_capacity'
FROM campux.smartphones
WHERE refresh_rate > 90 AND fast_charging_available = 1
GROUP BY brand_name
HAVING COUNT(*) > 10
ORDER BY avg_ram_capacity DESC LIMIT 3;

-- Brands with 5G phones, avg price, only if avg rating > 70 and count > 10
SELECT brand_name, AVG(price) AS 'avg_price'
FROM campux.smartphones
WHERE has_5g = 'True'
GROUP BY brand_name
HAVING AVG(rating) > 70 AND COUNT(*) > 10;

-- Show all IPL data
SELECT * FROM campux.ipl;

-- Top 5 batters by total runs
SELECT batter, SUM(batsman_run) AS 'runs' 
FROM campux.ipl
GROUP BY batter
ORDER BY runs DESC LIMIT 5;

-- Batter with second highest number of sixes
SELECT batter, COUNT(*) AS 'sixs'
FROM campux.ipl
WHERE batsman_run = 6
GROUP BY batter
ORDER BY sixs DESC LIMIT 1,1;

-- Batters with more than 1000 balls faced, show strike rate (SR)
select batter,sum(batsman_run),count(batsman_run),
round((sum(batsman_run)/count(batsman_run)) *100,2) as 'sr'
from campux.ipl
group by batter
having count(batsman_run) > 1000
order by sr desc limit 5;

-- CROSS JOIN: returns Cartesian product (every user with every group)
SELECT * 
FROM campux.users t1
CROSS JOIN campux.groups t2;

-- INNER JOIN: returns only users who have a membership record
SELECT * 
FROM campux.users t1
INNER JOIN campux.membership t2
ON t1.user_id = t2.user_id;

-- RIGHT JOIN: returns all users, plus membership info if available
SELECT * 
FROM campux.membership t1
RIGHT JOIN campux.users t2
ON t1.user_id = t2.user_id;

-- LEFT JOIN: returns all memberships, plus user info if available
SELECT * 
FROM campux.membership t1
LEFT JOIN campux.users t2
ON t1.user_id = t2.user_id;

-- UNION: combines rows from both tables, removes duplicates
SELECT * 
FROM campux.person1
UNION
SELECT * 
FROM campux.person2;

-- UNION ALL: combines rows from both tables, keeps duplicates
SELECT * 
FROM campux.person1
UNION ALL
SELECT * 
FROM campux.person2;

-- INTERSECT: returns only rows common to both tables
SELECT * 
FROM campux.person1
INTERSECT
SELECT * 
FROM campux.person2;

-- EXCEPT: returns rows in person1 that are not in person2
SELECT * 
FROM campux.person1
EXCEPT
SELECT * 
FROM campux.person2;

-- FULL OUTER JOIN (simulated using UNION of LEFT + RIGHT JOIN):
-- returns all memberships and all users, matching where possible
SELECT * 
FROM campux.membership t1
LEFT JOIN campux.users t2
ON t1.user_id = t2.user_id
UNION
SELECT * 
FROM campux.membership t1
RIGHT JOIN campux.users t2
ON t1.user_id = t2.user_id;

-- SELF JOIN: joins users table to itself to find emergency contacts
SELECT * 
FROM campux.users1 t1
JOIN campux.users1 t2
ON t1.emergency_contact = t2.user_id;

-- MULTI-CONDITION JOIN: matches students to classes by both class_id and enrollment_year
SELECT * 
FROM campux.students t1
JOIN campux.class t2
ON t1.class_id = t2.class_id
AND t1.enrollment_year = t2.class_year;

-- MULTI-TABLE JOIN: fetch order details with user info
SELECT t1.order_id, t1.amount, t1.profit, t3.name
FROM campux.order_details1 t1
JOIN campux.orders t2
ON t1.order_id = t2.order_id
JOIN campux.users t3
ON t2.user_id = t3.user_id;

-- INCOMPLETE QUERY (missing join condition):
-- likely intended to join orders with users to get name and city
SELECT t1.order_id, t2.name, t2.city
FROM campux.orders t1
JOIN campux.users t2
ON t1.user_id = t2.user_id;

-- 🎬 Movies Subqueries

-- Highest Profit Movie
SELECT * 
FROM movies
WHERE (gross - budget) = (SELECT MAX(gross - budget) FROM movies);

-- Movies Above Average Score
SELECT * 
FROM movies
WHERE score > (SELECT AVG(score) FROM movies);

-- Top Score in Year 2000
SELECT * 
FROM movies
WHERE year = 2000 
  AND score = (SELECT MAX(score) FROM movies WHERE year = 2000);

-- Max Score with Votes > Average
SELECT * 
FROM movies
WHERE score = (
    SELECT MAX(score) 
    FROM movies
    WHERE votes > (SELECT AVG(votes) FROM movies)
);

-- ❌ Invalid: LIMIT inside IN
SELECT * 
FROM movies
WHERE director IN (
    SELECT director
    FROM movies
    GROUP BY director
    ORDER BY SUM(gross) DESC
    LIMIT 3
);

-- ✅ Correct: JOIN with derived table
SELECT m.*
FROM movies m
JOIN (
    SELECT director
    FROM movies
    GROUP BY director
    ORDER BY SUM(gross) DESC
    LIMIT 3
) top_directors
ON m.director = top_directors.director;

-- 👥 Employee & Departments Subqueries

-- Tables
CREATE TABLE Employee(
    empid NUMERIC(10),
    name VARCHAR(20),
    salary NUMERIC(10),
    department VARCHAR(20)
);

CREATE TABLE Departments(
    deptid NUMERIC(10),
    department VARCHAR(20)
);

-- Sample Data
INSERT INTO Employee 
VALUES (100,"Jacob A",20000,"SALES"),
       (101,"James T",50000,"IT"),
       (102,"Riya S",30000,"IT");

INSERT INTO Departments 
VALUES (1,"IT"),(2,"ACCOUNTS"),(3,"SUPPORT");

-- ❌ Incorrect: '=' fails if subquery returns multiple rows
SELECT * 
FROM Employee 
WHERE department = (SELECT department FROM Departments WHERE deptid=1);

-- ✅ Correct using IN
SELECT * 
FROM Employee 
WHERE department IN (SELECT department FROM Departments WHERE deptid=1);

-- ✅ Cleaner using JOIN
SELECT e.*
FROM Employee e
JOIN Departments d
  ON e.department = d.department
WHERE d.deptid = 1;
