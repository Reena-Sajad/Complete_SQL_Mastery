-- 4.1 COLUMN ATTRIBUTES 
-- PK: primary key, NN: Not Null, AI: Auto Increment etc

-- 4.2 Inserting a Row
-- INSERT INTO statement, VALUES() keyword

INSERT INTO sql_store.customers 
VALUES(
DEFAULT,
'Reena',
'Sajad',
NULL,
NULL,
'address',
'city',
'ME',
DEFAULT);

-- 4.3 Inserting multiple rows
-- Use multiple parenthesis after the values keyword

INSERT INTO sql_store.products (name, quantity_in_stock, unit_price)
VALUES 
('beans', 45, 1.45),
('potatoes', 56, 2.67),
('boots', 23, 5.70);

-- 4.4 Inserting Hierarchical Rows: Inserting into multiple tables 
-- LAST_INSERT_ID()

INSERT INTO orders (customer_id, order_date)
VALUES (2,'2024-12-12');

INSERT INTO order_items
VALUES
(LAST_INSERT_ID(), 1, 2, 3.45),
(LAST_INSERT_ID(), 2, 2, 2.23)

-- 4.5 Copying data from one table to another: By using select * from the original table
-- truncate table - delete table

USE sql_invoicing;
CREATE TABLE invoices_archive AS
SELECT i.invoice_id, i.number, c.name, i.invoice_total, i.payment_total, i.invoice_date, i.due_date, i.payment_date
FROM invoices i
LEFT JOIN clients c
ON i.client_id = c.client_id
WHERE payment_date IS NOT NULL;

