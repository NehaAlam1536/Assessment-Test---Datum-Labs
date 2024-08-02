# Assessment-Test---Datum-Labs
SQL Questions
Q1.	The query calculates the percentage of paid customers who bought both Product A and Product B.
Explanation:
In this query, two inner sub queries have been used. 
Step 1:  Inner Subquery 1
First subquery calculates the number of distinct customers who have paid for both Product A and Product B.
Step 2: Inner Subquery 2:
Second subquery calculates the total number of distinct customers who have made any payment.
Step 3:  Final Calculation:
Value of first subquery is divided by the result of the second subquery (total paying customers).
The result is multiplied by 100 to convert it into a percentage.
The final result is aliased as 'Percentage of Paid Customers Who Bought Both Product A and Product B'.


Q2.	The query calculates the percentage of total sales that are attributed to promotions on the first and last days of the promotional periods.
Explanation:
Step 1: Identify sales on the first and last day of promotions
Firstly, CTE named PromotionSales is created to identify sales that happened specifically on the first or last day of promotions.
Step 2: Calculate the total sales amount
CTE named TotalSales is created to calculate the total sales amount
Step 3: Calculate the total sales amount for each promotion day
CTE named PromotionDaySales is created to calculate the total sales amount for each promotion day ('First Day' or 'Last Day').
Step 4: Create a list of all promotion days for a complete join
CTE named AllDays is created to ensure that both 'First Day' and 'Last Day' are considered in the final result, even if there were no sales on one of these days.
It uses a UNION to create a list of the two promotion days.
Step 5: Calculate the percentage of sales attributed to each promotion day
At end, percentage of total sales attributed to each promotion day is calculated.


Q3.	The query identifies the top 5 complementary products for customers who bought Product A, meaning it finds which other products were most frequently bought by the same customers who purchased Product A.
Explanation:
 Step 1: Identify customers who bought Product A
CTE named CustomersWhoBoughtA is created to identify unique customers who have purchased Product A.
Step 2: Find all purchases by these customers including Product A
CTE named PurchasesByCustomers is created to find all purchases made by customers who bought Product A.
Step 3: Filter out Product A and count occurrences of each other product
CTE named OtherProductsCount to count the number of times each product (excluding Product A) was purchased by these customers.
Step 4: Select the top 5 products bought alongside Product A
selects the top 5 products that were bought alongside Product A, based on their purchase count.
 
