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

-- OPERATORS
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

-- REGEXP
-- ^ - must begin with that expression (Ex: '^trail')
-- $ - must end with that expression (Ex: 'trail$')
-- |(logical or) - multiple search patterns (Ex: 'rose|trail$')
 -- [] - multiple letters before a letter (Ex: '[gmr]e' this is for ge,me or re)
--  [] with hyphen - to represent a range of letters (Ex: '[a-h]e' this is for ae,be,ce....he)

SELECT * 
FROM customers
WHERE first_name REGEXP 'elka|ambur';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'ey$|on$';

SELECT * 
FROM customers 
WHERE last_name REGEXP '^my|se';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'b[ru]';

-- IS_NULL OPERATOR
-- IS NULL - To check if it is null
-- IS NOT NULL - To check if it is not null
SELECT * 
FROM orders 
WHERE shipped_date IS NULL;

-- ORDER BY CLAUSE
-- ORDER BY - ascending
-- ORDER BY DESC - descending 

SELECT * 
FROM order_items
WHERE order_id = 2
ORDER BY (quantity * unit_price) DESC;

-- LIMIT Clause
-- LIMIT a,b - skip the first a records and disply the next b records (so a+1, a+2 ... b)

SELECT *
FROM customers 
ORDER BY points DESC
LIMIT 3
 
