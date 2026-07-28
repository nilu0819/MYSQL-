# MYSQL-
# 📊 SQL Practice Project — Smartphones & IPL Dataset

This repository contains a collection of **SQL queries** written for practice and learning.  
The queries demonstrate skills in **data selection, filtering, aggregation, grouping, updating, and deleting records** using two datasets:

- `campux.smartphones` — Smartphone specifications and features  
- `campux.ipl` — Indian Premier League (IPL) batting statistics  

---

## 📱 Smartphones Dataset Queries

### 🔎 Basic Selection
- Show all columns and rows from the table  
- Select specific columns (model, price, rating, battery capacity, OS)  
- Use **aliases** to rename columns for readability  

### 🎯 Filtering
- Filter by brand (Samsung, Apple, etc.)  
- Filter by price ranges (`BETWEEN`, `>`, `<`)  
- Combine conditions with `AND` / `OR`  
- Use `IN` and `NOT IN` for processor brands  

### 🛠 Updating & Deleting
- Update processor brand (`mediatek → dimensity`)  
- Update user email and password in `users` table  
- Delete records (e.g., phones priced above ₹200,000, Samsung phones with rear camera > 150 MP)  

### 📈 Aggregations
- `MAX`, `MIN`, `AVG`, `SUM`, `COUNT`  
- Standard deviation of screen size  
- Group by brand, NFC availability, fast charging, extended memory  
- Calculate brand-wise summaries (avg price, max rating, avg battery, avg screen size)  

### 📊 Advanced Analysis
- Top 5 Samsung models by screen size  
- Total cameras per model (rear + front)  
- Approximate pixel density (ppi) calculation  
- Lowest rated Apple phone  
- Most expensive phone  
- Top brands by average price, RAM capacity, and 5G availability  

---

## 🏏 IPL Dataset Queries

### 🔎 Basic Selection
- Show all rows from `campux.ipl`

### 📈 Batting Analysis
- Top 5 batters by total runs  
- Batter with second highest number of sixes  
- Strike rate (SR) calculation for batters with >1000 balls faced  

---

## 🚀 Skills Demonstrated
- SQL **SELECT, UPDATE, DELETE** statements  
- Use of **WHERE, GROUP BY, HAVING, ORDER BY, LIMIT**  
- Aggregate functions: `SUM`, `AVG`, `MAX`, `MIN`, `COUNT`, `STD`  
- Column aliasing and derived calculations  
- Practical business-style queries for analytics  

---

## 📂 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/sql-practice.git

