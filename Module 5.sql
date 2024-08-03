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
 
 
 

 
 
 
 
 
