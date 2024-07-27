USE sql_store;

-- SELECT CLAUSE
SELECT 
name,
unit_price,
unit_price * 1.1 AS new_price
FROM products;

-- WHERE CLAUSE
USE sql_store;

SELECT *
FROM orders
WHERE '2018-01-01' < order_date;

-- OPERATORS: NOT, AND, OR
SELECT *
FROM order_items
WHERE order_id = 6 AND (unit_price*quantity) > 30;

-- IN OPERATOR
SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72);

-- BETWEEN OPERATOR
SELECT * 
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- LIKE OPERATOR
-- % - Any number of characters
-- _ - Specific number of characters 
SELECT *
FROM customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

SELECT *
FROM customers
WHERE phone LIKE '%9';
