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

