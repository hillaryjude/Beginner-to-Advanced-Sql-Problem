# Farmers Market SQL Practice Problems (Part 1)

Welcome to the Farmers Market SQL Practice Problems repository! This collection is designed for beginners looking to sharpen their SQL skills using practical queries based on a fictional Farmers Market database.

## Getting Started

### Prerequisites
- Basic knowledge of SQL
- SQL environment set up (e.g., MySQL, PostgreSQL, SQLite, etc.)

### Database Schema

The Farmers Market database consists of the following tables:
1. **products**
2. **vendor_booth_assignments**
3. **customer_purchases**
4. **customers**
5. **product_category**
6. **market_date_info**

Ensure you have these tables created in your database to proceed with the queries.

### Problems and Solutions

1. **Get all the products available in the market**
    ```sql
    SELECT * FROM farmers_market.product;
    ```

2. **List down 10 rows of farmer’s market vendor booth assignments, displaying the market date, vendor ID, and booth number from the vendor_booth_assignments table.**
    ```sql
    SELECT 
    market_date,
    vendor_id,
    booth_number
    FROM farmers_market.vendor_booth_assignments
    LIMIT 10;
    ```

3. **In the customer purchases, we have quantity and cost per qty separate. Query the total amount that the customer has paid along with date, customer ID, vendor ID, qty, cost per qty, and the total amount.**
    ```sql
    SELECT 
    vendor_id,
    market_date,
    customer_id,
    quantity,
    cost_to_customer_per_qty,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS 'Total amount'
    FROM farmers_market.customer_purchases;
    ```

4. **Merge each customer’s name into a single column that contains the first name, then a space, and then the last name.**
    ```sql
    SELECT 
    CONCAT(customer_first_name, ' ', customer_last_name) AS 'Full name'
    FROM customer;
    ```

5. **Extract all the product names that are part of product category 1.**
    ```sql
    SELECT product_category_id, product_category_name 
    FROM product_category
    WHERE product_category_id = 1;
    ```

6. **Print a report of everything customer_id 4 has ever purchased at the farmer’s market, sorted by market date, vendor ID, and product ID.**
    ```sql
    SELECT 
    market_date,
    vendor_id,
    p.product_id,
    p.product_name,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS 'Total amt'
    FROM customer_purchases AS cp
    LEFT JOIN farmers_market.product AS p
    ON cp.product_id = p.product_id
    WHERE customer_id = 4 
    ORDER BY market_date, vendor_id, p.product_id;
    ```

7. **Get all the product info for products with id between 3 and 8 (not inclusive) and product with id 10.**
    ```sql
    SELECT 
    *
    FROM PRODUCT
    WHERE product_id = 10 OR (product_id > 3 AND product_id < 8);
    ```

8. **Details of all the purchases made by customer_id 4 at vendor_id 7, along with the total amount.**
    ```sql
    SELECT 
    market_date,
    vendor_id,
    product_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS 'Total amount'
    FROM customer_purchases AS cp
    WHERE customer_id = 4 
    HAVING vendor_id = 7
    ORDER BY market_date, vendor_id, product_id;
    ```

9. **Find the customer detail with the first name of “Carlos” or the last name of “Diaz”.**
    ```sql
    SELECT * FROM CUSTOMER
    WHERE customer_first_name = 'Carlos' OR customer_last_name = 'Diaz';
    ```

10. **Find the booth assignments for vendor 7 for any market date that occurred between April 3, 2019, and May 16, 2019, including either of the two dates.**
    ```sql
    SELECT 
    market_date,
    booth_number
    FROM vendor_booth_assignments
    WHERE vendor_id = 7 AND market_date BETWEEN '2019-04-03' AND '2019-05-16'
    ORDER BY market_date;
    ```

11. **Return a list of customers with selected last names - [Diaz, Edwards, and Wilson].**
    ```sql
    SELECT 
    customer_id,
    customer_first_name, 
    customer_last_name
    FROM CUSTOMER
    WHERE customer_first_name IN ('Diaz', 'Edwards', 'Wilson') OR customer_last_name IN ('Diaz', 'Edwards', 'Wilson');
    ```

12. **Analyze purchases made at the farmer’s market on days when it rained.**
    ```sql
    SELECT 
    market_date,
    market_rain_flag,
    cp.product_id,
    ROUND(cp.quantity * cp.cost_to_customer_per_qty, 2) AS 'Total Amount'
    FROM market_date_info AS md
    JOIN customer_purchases AS cp ON md.market_date = cp.market_date
    WHERE md.market_rain_flag = 'Y';
    ```

## Contributing

Feel free to contribute to this repository by adding more beginner-friendly SQL practice problems or improving the solutions provided.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Happy querying! 🚀
