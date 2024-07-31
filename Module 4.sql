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



