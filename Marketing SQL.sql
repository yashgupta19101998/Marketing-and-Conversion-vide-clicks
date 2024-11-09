use marketing;

SELECT * FROM marketing;
SELECT * FROM engagement;
SELECT * FROM revenue;

DESCRIBE marketing;
DESCRIBE engagement;
DESCRIBE revenue;

# Task 6: Determine the conversion volume achieved by each marketing channel.
#- Query the joined tables to summarize users converted by each channel.
SELECT * FROM marketing;
SELECT * FROM engagement;
SELECT * FROM revenue;


SELECT distinct(m.Channel), COUNT(e.UserID) AS ConversionVolume FROM marketing
JOIN engagement e ON m.Campaign_ID = e.Campaign_ID JOIN revenue r ON m.Campaign_ID = r.Campaign_ID 
WHERE r.Converted = 1 
GROUP BY (m.Channel);

# Task 7: Identify the top-performing campaigns based on return metrics.
 # - Calculate each campaign’s return by comparing spending to revenue.
 
SELECT  m.Campaign_ID, m.Channel, m.Budget, r.New_User_Revenue, ((r.New_User_Revenue - m.Budget) / m.Budget) AS ROI
FROM  Marketing m JOIN Revenue r ON m.Campaign_ID = r.Campaign_ID
ORDER BY  ROI DESC
LIMIT 10;


#Task 8 Map user engagement progression through stages.
 # - Track impressions to conversions, calculating rates at each engagement stage.
  
SELECT * FROM marketing;
SELECT * FROM engagement;
SELECT * FROM revenue;

SELECT
    SUM(Impressions) AS TotalImpressions,
    SUM(Clicks) AS TotalClicks,
    SUM(Sign_Ups) AS TotalSignups,
    SUM(Conversions) AS TotalConversions,
    (SUM(Clicks) / SUM(Impressions)) * 100 AS ClickThroughRate,
    (SUM(Sign_Ups) / SUM(Clicks)) * 100 AS SignupRate,
    (SUM(Conversions) / SUM(Sign_Ups)) * 100 AS ConversionRate
FROM Engagement;

#Task 9
SELECT * FROM marketing;
SELECT * FROM engagement;
SELECT * FROM revenue;

SELECT 
    m.Campaign_ID,
    m.Channel,
    e.Impressions,
    e.Clicks,
    e.Sign_Ups,
    e.Conversions,
    r.New_User_Revenue
FROM Marketing AS m JOIN Engagement e 
ON m.Campaign_ID = e.Campaign_ID
JOIN Revenue r ON m.Campaign_ID = r.Campaign_ID;


 
 
 
