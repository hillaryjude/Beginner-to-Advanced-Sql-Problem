-- Get all the products available in the market

select * from farmers_market.product;

-- List down 10 rows of farmer’s market vendor booth assignments, displaying the 
-- market date, vendor ID, and booth number from the vendor_booth_assignments 
-- table.

select 
market_date,
vendor_id,
booth_number
from farmers_market.vendor_booth_assignments
LIMIT 10;

-- In the customer purchases, we have quantity and cost per qty separate, 
-- query the total amount that the customer has paid along with date, customer id, 
-- vendor_id, qty, cost per qty and the total amt.?

select 
vendor_id,
market_date,
customer_id,
quantity,
cost_to_customer_per_qty,
round(quantity * cost_to_customer_per_qty, 2) as 'Total amount'
from farmers_market.customer_purchases;

-- We want to merge each customer’s name into a single column that 
-- contains the first name, then a space, and then the last name

select 
concat(customer_first_name, ' ', customer_last_name) as 'Full name'
from customer;

-- Extract all the product names that are part of product category 1

SELECT product_category_id, product_category_name FROM product_category
WHERE product_category_id = 1;

-- Print a report of everything customer_id 4 has ever purchased 
-- at the farmer’s market, sorted by market date, vendor ID, and product ID.
SELECT 
market_date,
vendor_id,
p.product_id,
p.product_name,
round(quantity * cost_to_customer_per_qty, 2) as 'Total amt'
from customer_purchases as cp
left join farmers_market.product as p
on cp.product_id = p.product_id
where customer_id = 4 
order by market_date, vendor_id, p.product_id;

-- Get all the product info for products with id between 3 and 8 
-- (not inclusive) and product with id 10.
 
SELECT 
*
FROM PRODUCT
WHERE product_id = 10 OR product_id > 3 AND product_id < 8;

-- Details of all the purchases made by 
-- customer_id 4 at vendor_id 7, along with the total_amt.

SELECT 
market_date,
vendor_id,
product_id,
ROUND(quantity * cost_to_customer_per_qty, 2) AS 'Total amount'
FROM customer_purchases as cp
WHERE customer_id = 4 
HAVING vendor_id = 7
ORDER BY market_date, vendor_id, product_id;

-- Find the customer detail with the first 
-- name of “Carlos” or the last name of “Diaz”.

SELECT * FROM CUSTOMER
WHERE customer_first_name = 'Carlos' or customer_last_name = 'Diaz';

-- Find the booth assignments for vendor 7 for any 
-- market date that occurred between April  3, 2019, and May 
-- 16, 2019, including either of the two dates.

select 
market_date,
booth_number
from vendor_booth_assignments
where vendor_id = 7 and market_date between '2019-04-03' and '2019-05-16'
order by market_date;

-- Return a list of customers with selected last names - [Diaz, Edwards and Wilson]
SELECT 
customer_id,
customer_first_name, 
customer_last_name
FROM CUSTOMER
WHERE customer_first_name IN ('Diaz', 'Edwards', 'Wilson') OR customer_last_name IN ('Diaz', 'Edwards', 'Wilson');

-- Analyze purchases made at the farmer’s market on days when it rained.

SELECT market_date,
market_rain_flag,
cp.product_id,
round(cp.quantity * cp.cost_to_customer_per_qty,2) as 'Total Amount'
from market_date_info as md
