Create Database CustomerDATA

SELECT * FROM [dbo].[CustomerData 4 SQL]

...QUESTION 1: Retrieve the total number of customers from each region....

SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[CustomerData 4 SQL]
GROUP BY Region

...QUESTION 2: find the most popular subscription type by the number of customers..

SELECT SubscriptionType, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[CustomerData 4 SQL]
GROUP BY SubscriptionType

...QUESTION 3: Find customers who canceled their subscription within 6 months

SELECT CustomerName,Canceled,SubscriptionType,SubscriptionStart
FROM [dbo].[CustomerData 4 SQL]
WHERE Canceled = 'TRUE'  -- Use 'TRUE' as a string to match text values
  AND DATEDIFF(day, SubscriptionStart, SubscriptionEnd) <= 365;

...QUESTION 4: Calculate the average subscription duration for all customers.

SELECT Count(CustomerID) As All_Customers,AVG(DATEDIFF(DAY,SubscriptionStart,SubscriptionEnd)) AS Average_Subscription_Duration
FROM [dbo].[CustomerData 4 SQL]
WHERE SubscriptionEnd IS NOT NULL

...QUESTION 5: Find customers with subscriptions longer than 12 months

SELECT CustomerName,SubscriptionType,SubscriptionStart,SubscriptionEnd
FROM [dbo].[CustomerData 4 SQL]
WHERE DATEDIFF(MONTH,SubscriptionEnd, SubscriptionStart) >=12

...QUESTION 6: Calculate total revenue by subscription type. 
 
 SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[CustomerData 4 SQL]
GROUP BY SubscriptionType

...QUESTION 7: Find the top 3 regions by subscription cancellations

SELECT TOP 3 Region,Canceled
FROM [dbo].[CustomerData 4 SQL]

...QUESTION 8: Find the total number of active and canceled subscriptions

SELECT
  canceled,
  COUNT(*) AS total_count
  FROM
  [dbo].[CustomerData 4 SQL]
  GROUP BY 
  canceled;




