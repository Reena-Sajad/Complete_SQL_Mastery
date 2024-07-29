-- INNER JOINS The INNER JOIN keyword selects records that have matching values in both tables. JOIN generally refers to inner join
use sql_store;

SELECT order_id, oi.product_id, quantity, oi.unit_price
from order_items oi
JOIN products p 
ON oi.product_id = p.product_id
