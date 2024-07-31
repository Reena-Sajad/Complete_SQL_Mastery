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

-- 4.4 Inserting Hierarchical Rows


