SELECT lastName, firstName FROM employees
WHERE reportsTo IS NULL;

SELECT customerNumber FROM payments;

SELECT * FROM orders
WHERE shippedDate = '2003/01/18';

SELECT * FROM orders
WHERE shippedDate >= '2005/04/1' AND shippedDate <= '2005/04/30' 
AND status = "Shipped";

SELECT * FROM products
WHERE productLine = "Classic Cars";