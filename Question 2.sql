
----- Percentage of Sales Attributed to Promotions on First and Last Days -------

-- Step 1: Identify sales on the first and last day of promotions
WITH PromotionSales AS (
    SELECT
        s.sale_id,
        s.amount,
        CASE
            WHEN s.sale_date = p.start_date THEN 'First Day'
            WHEN s.sale_date = p.end_date THEN 'Last Day'
        END AS promotion_day
    FROM Sales s
    JOIN Promotions p ON s.promotion_id = p.promotion_id
    WHERE s.sale_date = p.start_date OR s.sale_date = p.end_date
),

-- Step 2: Calculate the total sales amount
TotalSales AS (
    SELECT
        SUM(amount) AS total_amount
    FROM Sales
),

-- Step 3: Calculate the total sales amount for each promotion day
PromotionDaySales AS (
    SELECT
        promotion_day,
        SUM(amount) AS day_amount
    FROM PromotionSales
    GROUP BY promotion_day
),

-- Step 4: Create a list of all promotion days for a complete join
AllDays AS (
    SELECT 'First Day' AS promotion_day
    UNION
    SELECT 'Last Day' AS promotion_day
)

-- Step 5: Calculate the percentage of sales attributed to each promotion day
SELECT
    ad.promotion_day AS `Promotion Day`,
    COALESCE((pds.day_amount / ts.total_amount) * 100, 0) AS `Percentage of Sales Attributed to Promotions`
FROM AllDays ad
LEFT JOIN PromotionDaySales pds ON ad.promotion_day = pds.promotion_day
JOIN TotalSales ts;
