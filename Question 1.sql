
----- Percentage of Paid Customers Who Bought Both Product A and Product B -------

SELECT
    (CAST(
        (SELECT COUNT(DISTINCT cus.customer_id)
         FROM `customer purchase` cus
         JOIN `customer purchase` cus1 ON cus.customer_id = cus1.customer_id
         WHERE cus.product_id = 'A' AND cus.payment_status = 'Paid'
           AND cus1.product_id = 'B' AND cus1.payment_status = 'Paid') AS FLOAT)
     /
     (SELECT COUNT(DISTINCT customer_id)
      FROM `customer purchase`
      WHERE payment_status = 'Paid')) * 100 AS 'Percentage of Paid Customers Who Bought Both Product A and Product B';