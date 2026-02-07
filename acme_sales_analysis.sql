/* =========================================================
   ACME CO - SALES ANALYSIS (2014–2018)
   T-SQL VERSION (SQL SERVER)
   ========================================================= */

USE YourDatabaseName;
GO

/* =========================================================
    DATA PROFILING
   ========================================================= */

-- Check table structure
EXEC sp_help 'dbo.acme_sales';
GO

-- Total rows
SELECT COUNT(*) AS total_rows
FROM dbo.acme_sales;
GO

-- Missing budgets
SELECT COUNT(*) AS missing_budget_rows
FROM dbo.acme_sales
WHERE budget IS NULL;
GO


/* =========================================================
    FEATURE ENGINEERING (Computed Metrics)
   ========================================================= */

-- Preview calculated metrics
SELECT TOP 10
    order_number,
    revenue,
    quantity,
    cost,
    quantity * cost AS total_cost,
    revenue - (quantity * cost) AS profit,
    CASE 
        WHEN revenue = 0 THEN 0
        ELSE (revenue - (quantity * cost)) / revenue * 100
    END AS profit_margin_pct
FROM dbo.acme_sales;
GO


/* =========================================================
    UNIVARIATE ANALYSIS
   ========================================================= */

-- Revenue statistics
SELECT 
    MIN(revenue) AS min_revenue,
    MAX(revenue) AS max_revenue,
    AVG(revenue) AS avg_revenue,
    STDEV(revenue) AS std_revenue
FROM dbo.acme_sales;
GO

-- Profit margin statistics
SELECT 
    MIN((revenue - quantity*cost)/revenue*100) AS min_margin,
    MAX((revenue - quantity*cost)/revenue*100) AS max_margin,
    AVG((revenue - quantity*cost)/revenue*100) AS avg_margin
FROM dbo.acme_sales
WHERE revenue <> 0;
GO


/* =========================================================
    TOP REVENUE DRIVERS
   ========================================================= */

-- Top 10 Products
SELECT TOP 10
    product_name,
    SUM(revenue) AS total_revenue,
    SUM(revenue - quantity*cost) AS total_profit
FROM dbo.acme_sales
GROUP BY product_name
ORDER BY total_revenue DESC;
GO

-- Channels
SELECT
    channel,
    SUM(revenue) AS total_revenue,
    SUM(revenue - quantity*cost) AS total_profit
FROM dbo.acme_sales
GROUP BY channel
ORDER BY total_revenue DESC;
GO

-- Regions
SELECT
    us_region,
    SUM(revenue) AS total_revenue,
    SUM(revenue - quantity*cost) AS total_profit
FROM dbo.acme_sales
GROUP BY us_region
ORDER BY total_revenue DESC;
GO


/* =========================================================
    TREND & SEASONALITY
   ========================================================= */

-- Yearly Trend
SELECT
    YEAR(order_date) AS year,
    SUM(revenue) AS total_revenue,
    SUM(revenue - quantity*cost) AS total_profit
FROM dbo.acme_sales
GROUP BY YEAR(order_date)
ORDER BY year;
GO

-- Monthly Trend (All Years Combined)
SELECT
    MONTH(order_date) AS month_num,
    DATENAME(MONTH, order_date) AS month_name,
    SUM(revenue) AS total_revenue
FROM dbo.acme_sales
GROUP BY MONTH(order_date), DATENAME(MONTH, order_date)
ORDER BY month_num;
GO

-- Monthly Trend by Year
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(revenue) AS total_revenue
FROM dbo.acme_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
GO


/* =========================================================
    BUDGET VS ACTUAL (2017)
   ========================================================= */

SELECT
    product_name,
    SUM(revenue) AS actual_2017_revenue,
    MAX(budget) AS budget_2017,
    SUM(revenue) - MAX(budget) AS variance
FROM dbo.acme_sales
WHERE YEAR(order_date) = 2017
GROUP BY product_name
ORDER BY variance DESC;
GO


/* =========================================================
    OUTLIER DETECTION
   ========================================================= */

-- Top 1% Revenue (Using NTILE)
WITH RevenueRank AS (
    SELECT *,
        NTILE(100) OVER (ORDER BY revenue DESC) AS percentile_rank
    FROM dbo.acme_sales
)
SELECT *
FROM RevenueRank
WHERE percentile_rank = 1;
GO

-- Highest Unit Price Transactions
SELECT TOP 20 *
FROM dbo.acme_sales
ORDER BY unit_price DESC;
GO


/* =========================================================
    CUSTOMER SEGMENTATION
   ========================================================= */

SELECT
    customer_name,
    SUM(revenue) AS total_revenue,
    AVG((revenue - quantity*cost)/revenue*100) AS avg_margin
FROM dbo.acme_sales
WHERE revenue <> 0
GROUP BY customer_name
ORDER BY total_revenue DESC;
GO


/* =========================================================
    REVENUE CONCENTRATION RISK
   ========================================================= */

SELECT
    product_name,
    SUM(revenue) AS product_revenue,
    ROUND(
        SUM(revenue) * 100.0 / 
        (SELECT SUM(revenue) FROM dbo.acme_sales),
        2
    ) AS revenue_share_pct
FROM dbo.acme_sales
GROUP BY product_name
ORDER BY revenue_share_pct DESC;
GO


/* =========================================================
    LOW MARGIN PRODUCTS (Pricing Risk)
   ========================================================= */

SELECT
    product_name,
    AVG((revenue - quantity*cost)/revenue*100) AS avg_margin
FROM dbo.acme_sales
WHERE revenue <> 0
GROUP BY product_name
HAVING AVG((revenue - quantity*cost)/revenue*100) < 20
ORDER BY avg_margin;
GO


/* =========================================================
    POWER BI VIEW (Aggregated KPI Layer)
   ========================================================= */

IF OBJECT_ID('dbo.vw_acme_kpi', 'V') IS NOT NULL
    DROP VIEW dbo.vw_acme_kpi;
GO

CREATE VIEW dbo.vw_acme_kpi AS
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    product_name,
    channel,
    us_region,
    SUM(revenue) AS revenue,
    SUM(quantity * cost) AS total_cost,
    SUM(revenue - quantity*cost) AS profit
FROM dbo.acme_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    product_name,
    channel,
    us_region;
GO

/* ===================== END OF FILE ====================== */
