
----- Top 5 Complementary Products for Product A -------

-- Step 1: Identify customers who bought Product A
WITH CustomersWhoBoughtA AS (
    SELECT DISTINCT customer_id
    FROM `customer purchase`
    WHERE product_id = 'A'
),

-- Step 2: Find all purchases by these customers including Product A
PurchasesByCustomers AS (
    SELECT cp.customer_id, cp.product_id
    FROM `customer purchase` cp
    JOIN CustomersWhoBoughtA cpa ON cp.customer_id = cpa.customer_id
),

-- Step 3: Filter out Product A and count occurrences of each other product
OtherProductsCount AS (
    SELECT product_id, COUNT(*) AS purchase_count
    FROM PurchasesByCustomers
    WHERE product_id <> 'A'
    GROUP BY product_id
)

-- Step 4: Select the top 5 products bought alongside Product A
SELECT product_id, purchase_count
FROM OtherProductsCount
ORDER BY purchase_count DESC
LIMIT 5;
