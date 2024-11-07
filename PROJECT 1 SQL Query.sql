select * from [dbo].[CleanSalesDATA]


1.....Retrieve the total sales for each product category.....

select product, SUM(Quantity*Unitprice) AS Total_Sales from [dbo].[CleanSalesDATA]
GROUP BY product

2......find the number of sales transactions in each region.... 

SELECT region, COUNT(*) AS sales_transaction
FROM [dbo].[CleanSalesDATA]
GROUP BY region;

3.....find the highest-selling product by total sales value.....

SELECT TOP 1 product, SUM(Quantity*Unitprice) AS total_sales
FROM [dbo].[CleanSalesDATA]
GROUP BY product
ORDER BY total_sales DESC;

4.....calculate total revenue per product. 

SELECT product, SUM(Quantity*Unitprice) AS total_revenue
FROM [dbo].[CleanSalesDATA]
WHERE product = 'shirt'
GROUP BY product

SELECT product, SUM(Quantity*Unitprice) AS total_revenue
FROM [dbo].[CleanSalesDATA]
WHERE product = 'gloves'
GROUP BY product

SELECT product, SUM(Quantity*Unitprice) AS total_revenue
FROM [dbo].[CleanSalesDATA]
WHERE product = 'hat'
GROUP BY product

SELECT product, SUM(Quantity*Unitprice) AS total_revenue
FROM [dbo].[CleanSalesDATA]
WHERE product = 'jacket'
GROUP BY product

SELECT product, SUM(Quantity*Unitprice) AS total_revenue
FROM [dbo].[CleanSalesDATA]
WHERE product = 'shoes'
GROUP BY product

SELECT product, SUM(Quantity*Unitprice) AS total_revenue
FROM [dbo].[CleanSalesDATA]
WHERE product = 'socks'
GROUP BY product


5......calculate monthly sales totals for the current year. 

SELECT MONTH(orderdate) AS month, SUM(Quantity*Unitprice) AS monthly_total_sales
FROM [dbo].[CleanSalesDATA]
WHERE YEAR(orderdate) = YEAR(GETDATE())  -- Filters for the current year
GROUP BY MONTH(orderdate)
ORDER BY month

6.....find the top 5 customers by total purchase amount. 

SELECT TOP 5 orderid, region, SUM(Quantity*Unitprice) AS total_purchase_amount
FROM [dbo].[CleanSalesDATA]
GROUP BY orderid, 
region
ORDER BY total_purchase_amount DESC

7.....calculate the percentage of total sales contributed by each region. 

SELECT 
    region,
    SUM(Quantity*Unitprice) AS region_sales,
    (SUM(Quantity*Unitprice) * 100.0 / (SELECT SUM(Quantity*Unitprice) 
	FROM [dbo].[CleanSalesDATA])) AS sales_percentage
FROM 
    [dbo].[CleanSalesDATA]
GROUP BY 
    region
ORDER BY 
    sales_percentage DESC;


8......identify products with no sales in the last quarter. ..

SELECT DISTINCT product
FROM [dbo].[CleanSalesDATA]
WHERE product NOT IN (
    SELECT product
    FROM [dbo].[CleanSalesDATA]
    WHERE orderdate >= DATEADD(QUARTER, -1, GETDATE())
)
ORDER BY product;























