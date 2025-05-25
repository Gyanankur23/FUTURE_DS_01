# 🚀 FUTURE_DS_01 - Customer Sentiment Analysis  
**Repository Link:** [FUTURE_DS_01](https://github.com/Gyanankur23/FUTURE_DS_01.git)  

## 📌 Overview  
This repository contains a **complete customer sentiment analysis** project using **Power BI, Python, and SQL** to analyze social media engagement across various platforms.  

### **📂 Contents**
✅ **Power BI Dashboard (PBIT Template)** → Interactive data visualization  
✅ **Python Data Visualization Script** (`Customer_Sentiment_Analysis.py`) → Generates sentiment trends and engagement insights  
✅ **SQL Queries for Insights** (`Customer_Sentiment_Queries.sql`) → Structured data analysis  
✅ **Raw Dataset** (`TAsk1FutureInterns.xlsx`) → Available for ease of accessibility  
✅ **Screenshots** (`output/`) → Visual representation of the results  


### **🏆 Power BI Dashboard** (TAsk1FutureInterns.pbit)  
📊 Features  
- Interactive Sentiment Analysis  
- Engagement Metrics (Likes, Retweets, Hashtag trends)  
- Geospatial Mapping & KPI Cards  

### 📸 **Screenshot** (Main Dashboard)  
Customer Sentiment Dashboard  

### **🐍 Python Visualization Script** (Customer_Sentiment_Analysis.py)  
📊 Key Features  
✅ Sentiment Breakdown Bar Chart  
✅ Engagement Trends Over Time  
✅ Likes Distribution Across Platforms  
✅ Top 10 Hashtags Analysis  

### 🚀 **Run the Script**  

python Customer_Sentiment_Analysis.py

Here’s the updated README.md section with the requested bold headings:
**📸 Screenshots of Python Visualizations**  
**Sentiment Analysis**  
**Sentiment Analysis**  
**Engagement Trends & Platform Insights**  
**Python Visualization**  
**Python Visualization**  
**Python Visualization**  

### **🗄️ SQL Queries (Customer_Sentiment_Queries.sql)**  
This file contains **key SQL queries** to analyze customer sentiment trends.  

### **🔍 Sample Queries**  
**1️⃣ Sentiment Count Per Platform**  

SELECT Platform, Sentiment, COUNT(*) AS Sentiment_Count
FROM Customer_Sentiment
GROUP BY Platform, Sentiment
ORDER BY Platform, Sentiment_Count DESC;


2️⃣ Most Engaging Hashtags
SELECT Hashtags, SUM(Likes + Retweets) AS Total_Engagement
FROM Customer_Sentiment
GROUP BY Hashtags
ORDER BY Total_Engagement DESC
LIMIT 10;


3️⃣ Monthly Engagement Trends
SELECT DATE_FORMAT(Timestamp, '%Y-%m') AS Month_Year,
       SUM(Likes) AS Total_Likes, 
       SUM(Retweets) AS Total_Retweets
FROM Customer_Sentiment
GROUP BY Month_Year
ORDER BY Month_Year;


### 📂 **Dataset - TAsk1FutureInterns.xlsx**
For ease of accessibility, the dataset is available in the repository.

## 🔥 How to Clone This Repository  
Run the following command to **clone the repo**:

git clone https://github.com/Gyanankur23/FUTURE_DS_01.git
cd FUTURE_DS_01

### ⚖️ **License**
This project is licensed under the MIT License.
MIT License

**Copyright (c) 2025 Gyanankur Baruah**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction.
