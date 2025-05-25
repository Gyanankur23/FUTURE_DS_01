CREATE DATABASE IF NOT EXISTS FutureInternsDB;
USE FutureInternsDB;


CREATE TABLE Customer_Sentiment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Timestamp DATETIME NOT NULL,
    Platform VARCHAR(50) NOT NULL,
    Sentiment VARCHAR(20) NOT NULL,
    Likes INT DEFAULT 0,
    Retweets INT DEFAULT 0,
    Hashtags TEXT
);

--  Insert Sample Data
INSERT INTO Customer_Sentiment (Timestamp, Platform, Sentiment, Likes, Retweets, Hashtags) VALUES
('2025-05-01 10:30:00', 'Twitter', 'Positive', 120, 35, '#customerlove #happy'),
('2025-05-02 15:45:00', 'Instagram', 'Neutral', 80, 12, '#newrelease #update'),
('2025-05-03 08:20:00', 'Facebook', 'Negative', 50, 8, '#poorservice #delay'),
('2025-05-04 12:10:00', 'LinkedIn', 'Positive', 95, 22, '#greatfeedback #growth'),
('2025-05-05 18:55:00', 'Twitter', 'Negative', 30, 5, '#unsatisfied #supportissue'),
('2025-05-06 20:25:00', 'Instagram', 'Positive', 110, 40, '#bestexperience #fastdelivery'),
('2025-05-07 14:00:00', 'Facebook', 'Neutral', 60, 15, '#announcement #info'),
('2025-05-08 09:45:00', 'LinkedIn', 'Positive', 130, 55, '#successstory #customerwin');

--  Retrieve Sentiment Count Per Platform
SELECT Platform, Sentiment, COUNT(*) AS Sentiment_Count
FROM Customer_Sentiment
GROUP BY Platform, Sentiment
ORDER BY Platform, Sentiment_Count DESC;

--  Identify Most Engaging Hashtags
SELECT Hashtags, SUM(Likes + Retweets) AS Total_Engagement
FROM Customer_Sentiment
GROUP BY Hashtags
ORDER BY Total_Engagement DESC
LIMIT 10;

--  Monthly Engagement Trends
SELECT DATE_FORMAT(Timestamp, '%Y-%m') AS Month_Year,
       SUM(Likes) AS Total_Likes, 
       SUM(Retweets) AS Total_Retweets
FROM Customer_Sentiment
GROUP BY Month_Year
ORDER BY Month_Year;

-- Find Most Active Days
SELECT DATE_FORMAT(Timestamp, '%Y-%m-%d') AS Date, 
       COUNT(*) AS Posts,
       SUM(Likes) AS Total_Likes, 
       SUM(Retweets) AS Total_Retweets
FROM Customer_Sentiment
GROUP BY Date
ORDER BY Posts DESC
LIMIT 5;

--  Detect Negative Sentiment Surge
SELECT DATE_FORMAT(Timestamp, '%Y-%m-%d') AS Date, COUNT(*) AS Negative_Posts
FROM Customer_Sentiment
WHERE Sentiment = 'Negative'
GROUP BY Date
ORDER BY Negative_Posts DESC
LIMIT 5;
