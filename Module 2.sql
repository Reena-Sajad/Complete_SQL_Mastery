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
WHERE '2018-01-01' < order_date 

-- OPERATORS
SELECT *
FROM order_items
WHERE order_id = 6 AND (unit_price*quantity) > 30
