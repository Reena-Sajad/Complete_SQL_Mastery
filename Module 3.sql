-- 3.1 INNER JOINS The INNER JOIN keyword selects records that have matching values in both tables. JOIN generally refers to inner join
use sql_store;

SELECT order_id, oi.product_id, quantity, oi.unit_price
from order_items oi
JOIN products p 
ON oi.product_id = p.product_id;

-- 3.2 Joins across Data Bases can be done by stating name of database followed by period followed by name of table

SELECT *
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id = p.product_id;

-- 3.3 SELF JOIN: Joins across the same database

USE sql_hr;

SELECT e.employee_id, 
e.first_name, 
m.first_name AS Manager_name 
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;

-- 3.4 Joining more than two tables 

USE sql_invoicing;
SELECT 
	p.date,
	p.invoice_id,
	p.amount,
	c.name,
	pm.name AS payment_method
FROM payments p
JOIN clients c
ON p.client_id = c.client_id
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id;

-- 3.5 Compound Join 
-- When a combination of columns to uniquely identify tables it is a table with COMPOSITE PRIMARY KEY
-- Joining that table with other tables is compound join
-- We use AND to compare all primary keys from both tables

USE sql_store;
SELECT *
FROM order_items o
JOIN order_item_notes oin 
ON o.order_id = oin.order_id 
AND o.product_id = oin.product_id;

-- 3.6 IMPLICIT JOIN SYNTAX - Doing joins without using join syntax. This metj=hod is not recommended because the
-- absence of the where clause will result in a cross join 
SELECT * 
FROM customers c, orders o
WHERE c.customer_id = o.customer_id;

-- 3.7 OUTER JOIN: 2 types left and right

USE sql_store;

SELECT 
	p.product_id,
    p.name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id; 

-- 3.9 SElf Outer Join
USE sql_hr;

SELECT e.employee_id, 
e.first_name, 
m.first_name AS Manager_name 
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;

-- 3.10 USING clause instead of ON . This clause can only be used if the common cloumn has the 
-- same name in both tables  
 USE sql_invoicing;
 
 SELECT 
 p.date,
 c.name,
 p.amount,
 pm.name
 FROM clients c 
 JOIN payments p
 USING (client_id)
 JOIN payment_methods pm
 ON p.payment_method = pm.payment_method_id;
 
 -- 3.11 NATURAL JOIN: 
 --  with natural join you dont have to specify column name that is common, you just let the 
 -- database find the common column and join based on that column
 
 -- CROSS JOIN
 -- Combining every record in ome table with every record in another table. Two types:
 -- Explicit syntax (CROSS JOIN keyword), implicit syntax (FROM table1, table2)
 
 USE sql_store;
  SELECT * 
  FROM shippers 
  CROSS JOIN products;
  
  SELECT *
  FROM shippers, products;
 
 -- 3.12 UNIONS
 -- Joins combine columns from multiple tables whereas unions combine rows from multiple tables
 -- They are essentialy used to combine results of multiple queries. But, the number of columns each query returns
 -- must be equal for the union to work

 SELECT 
 customer_id,
 first_name,
 points,
 'Bronze' AS type
 FROM sql_store.customers
 WHERE points < 2000
 UNION
  SELECT 
 customer_id,
 first_name,
 points,
 'Silver' AS type
 FROM sql_store.customers
 WHERE 2000 < points < 3000
UNION
 SELECT 
 customer_id,
 first_name,
 points,
 'Gold' AS type
 FROM sql_store.customers
 WHERE points > 3000
 ORDER BY first_name;
 
