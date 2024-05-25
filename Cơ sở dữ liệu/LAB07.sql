SELECT customers.customerName, orders.status
FROM customers INNER JOIN orders ON customers.customerNumber = orders.customerNumber ORDER BY customerName;

SELECT customers.customerName, SUM(orderdetails.priceEach*orderdetails.quantityOrdered) AS totalPurchased
FROM customers INNER JOIN orders, orderdetails
WHERE customers.customerNumber = orders.customerNumber AND orders.orderNumber = orderdetails.orderNumber
GROUP BY customers.customerNumber;

SELECT employees.firstName, employees.lastName, offices.addressLine1
FROM employees NATURAL JOIN offices;

SELECT customers.customerName,orders.orderNumber, orders.orderDate, orders.requiredDate, orders.status,
SUM(orderdetails.quantityOrdered*orderdetails.priceEach) AS totalValue
FROM orders, orderdetails, customers
WHERE orders.orderNumber = orderdetails.orderNumber AND MONTH(orders.orderDate) = 3 AND
YEAR(orders.orderDate) = 2003
GROUP BY orders.orderNumber, customers.customerName;


SELECT customers.customerName, orders.status
FROM customers LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.orderNumber IS NULL;

SELECT e1.*, e2.jobTitle	
FROM employees e1, employees e2
WHERE e1.reportsTo = e2.reportsTo

