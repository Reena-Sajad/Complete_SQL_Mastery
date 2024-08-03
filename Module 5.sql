-- MODULE 5: SUMMARIZING DATA 

-- 5.1 Aggregate Functions
--  These functions take a series of values and aggregate them
 -- MAX(), MIN(), AVG(), SUM(), COUNT()
 -- Aggregate functions only operate on non null columns 
 
 SELECT
	'First half of 2019' AS date_range,
	SUM(invoice_total) AS total_sales,
	SUM(payment_total) AS total_payments,
    (SUM(invoice_total) - SUM(payment_total)) AS what_we_expect
 FROM
 sql_invoicing.invoices 
 WHERE 
 invoice_date BETWEEN '2019-01-01' AND '2019-07-01'
 UNION
 SELECT
	'Second half of 2019' AS date_range,
	SUM(invoice_total) AS total_sales,
	SUM(payment_total) AS total_payments,
    (SUM(invoice_total) - SUM(payment_total)) AS what_we_expect
 FROM
 sql_invoicing.invoices 
 WHERE 
invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
 UNION
 SELECT
	'Year 2019' AS date_range,
	SUM(invoice_total) AS total_sales,
	SUM(payment_total) AS total_payments,
    (SUM(invoice_total) - SUM(payment_total)) AS what_we_expect
 FROM
 sql_invoicing.invoices 
 WHERE 
 invoice_date BETWEEN '2019-01-01' AND '2019-12-31';
 
 -- 5.2 GROUP BY  
 -- The typical order for a query is as follows:
 -- SELECT
 -- FROM
 -- WHERE
 -- GROUP BY (Groups by acts on columns whereas order by acts on rows)
 -- ORDER BY (It is very important that group by comes before order by)

SELECT 
	date,
	pm.name AS payment_method,
	SUM(p.amount) AS total_payments
 FROM sql_invoicing.payments p
 JOIN sql_invoicing.payment_methods pm
 ON p.payment_method = pm.payment_method_id
 GROUP BY p.date, payment_method
 ORDER BY p.date;
 
 -- 5.3 HAVING Clause  
 -- The HAVING clause is used to filter data after using GROUP BY 
 -- The difference between WHERE and HAVING is with having data is filtered after grouping whereas
 -- with where clause the data is filtered before grouping
 --  having clause can have compound search conditions using AND
 -- Having clause can only reference columns specified by select whereas the where clause can
 -- specify any column in the data table
 
SELECT 
	c.customer_id,
	c.first_name,
	c.last_name,
	c.city,
	c.state,
	SUM(oi.quantity * oi.unit_price) AS total_amount_spent
FROM sql_store.customers c
 JOIN sql_store.orders o USING (customer_id)
 JOIN sql_store.order_items oi USING (order_id)
 WHERE state = 'VA'
 GROUP BY c.customer_id, c.first_name, c.last_name
 HAVING (total_amount_spent > 100);
 
 
 
 

 
 
 
 
 
