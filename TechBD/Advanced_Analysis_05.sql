

  --1) Monthly Sales with Month-over-Month Growth (CTE + LAG)


WITH MonthlySales AS (
    SELECT
        FORMAT(OrderDate, 'yyyy-MM') AS SalesMonth,
        SUM(TotalItemAmount) AS Total_Sales
    FROM vw_SalesAnalysis
    GROUP BY FORMAT(OrderDate, 'yyyy-MM')
)
SELECT
    SalesMonth,
    Total_Sales,
    LAG(Total_Sales) OVER (ORDER BY SalesMonth) AS Previous_Month_Sales,
    Total_Sales - LAG(Total_Sales) OVER (ORDER BY SalesMonth) AS Sales_Difference,
    ROUND(
        (Total_Sales - LAG(Total_Sales) OVER (ORDER BY SalesMonth)) * 100.0
        / NULLIF(LAG(Total_Sales) OVER (ORDER BY SalesMonth), 0), 2
    ) AS Growth_Percentage
FROM MonthlySales
ORDER BY SalesMonth;



 --2) Running Total of Monthly Revenue (SUM OVER)

 WITH MonthlySales AS (
    SELECT
        FORMAT(OrderDate, 'yyyy-MM') AS SalesMonth,
        SUM(TotalItemAmount) AS Total_Sales
    FROM vw_SalesAnalysis
    GROUP BY FORMAT(OrderDate, 'yyyy-MM')
)
SELECT
    SalesMonth,
    Total_Sales,
    SUM(Total_Sales) OVER (
    ORDER BY SalesMonth
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS Running_Total
FROM MonthlySales
ORDER BY SalesMonth;


 --3) Product Ranking Within Each Category (RANK + PARTITION BY)

SELECT
    Category,
    ProductName,
    SUM(TotalItemAmount) AS Total_Revenue,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY SUM(TotalItemAmount) DESC
    ) AS Rank_In_Category
FROM vw_SalesAnalysis
GROUP BY Category, ProductName;



  -- 4) Top 3 Products per Category (CTE + Window Filter)

WITH RankedProducts AS (
    SELECT
        Category,
        ProductName,
        SUM(TotalItemAmount) AS Total_Revenue,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY SUM(TotalItemAmount) DESC
        ) AS Rank_In_Category
    FROM vw_SalesAnalysis
    GROUP BY Category, ProductName
)
SELECT *
FROM RankedProducts
WHERE Rank_In_Category <= 3
ORDER BY Category, Rank_In_Category;



  /*5) Customer Segmentation by Spending (CTE + NTILE)
   Splits customers into 4 spending tiers (quartiles)*/

WITH CustomerSpending AS (
    SELECT
        CustomerID,
        SUM(TotalItemAmount) AS Total_Spent
    FROM vw_SalesAnalysis
    GROUP BY CustomerID
)
SELECT
    CustomerID,
    Total_Spent,
    NTILE(4) OVER (ORDER BY Total_Spent DESC) AS Spending_Tier,
    CASE NTILE(4) OVER (ORDER BY Total_Spent DESC)
        WHEN 1 THEN 'VIP'
        WHEN 2 THEN 'High'
        WHEN 3 THEN 'Medium'
        ELSE 'Low'
    END AS Customer_Segment
FROM CustomerSpending
ORDER BY Total_Spent DESC;
