SELECT *
FROM products
WHERE productCode IN (SELECT productCode 
					FROM orderdetails
					WHERE orderNumber IN (SELECT orderNumber
										FROM orders
                                        WHERE MONTH(orderDate) = 3
                                        AND YEAR(orderDate) = 2005
                                        )
					);
                    
                    
                    
SELECT *
FROM orders
WHERE MONTH(orderDate) = (SELECT MONTH(MAX(orderDate))
						FROM orders)
                        AND YEAR(orderDate) = (SELECT YEAR(MAX(orderDate)) FROM orders);
                        
                        
SELECT o.orderNumber, o.status,
		(SELECT SUM(quantityOrdered*priceEach)
        FROM orderdetails
        WHERE orderNumber = o.orderNumber) AS total
        FROM orders o;

#base thi ktr
SELECT c.customerName,
		(SELECT SUM(quantityOrdered*priceEach)
        FROM orderdetails
        WHERE orderNumber IN (SELECT orderNumber
								FROM orders
                                WHERE customerNumber = c.customerNumber)) AS totalPurchased,
		(SELECT SUM(amount)
		FROM payments
		WHERE customerNumber = c.customerNumber) AS totalPaid,
        (SELECT totalPurchased-totalPaid) AS currDebt,
        
        (SELECT SUM(quantityOrdered*priceEach)
        FROM orderdetails
        WHERE orderNumber IN (SELECT orderNumber
							FROM orders
							WHERE customerNumber = c.customerNumber 
                            AND status='Cancelled')
		) AS totalCancelled,
        (SELECT currDebt - IF(totalCancelled IS NULL, 0, totalCancelled) AS actualDebt
FROM customers c
HAVING currDebt > 0;

#cau 1 RFM
SELECT c.customerName,
	(SELECT DATEDIFF('2005-06-02', MAX(orderDate))
    FROM orders
    WHERE customerNumber = c.customerNumber) AS Recency,
    (SELECT COUNT(*)
    FROM orders
    WHERE customerNumber = 
	
FROM customers c;

#11/12 thi csdl thực hành (hình thức thi tại lớp), cần 1 file SQL/txt, 1 file word
#có thể bỏ câu 5, thi có khoảng 4-5 câu trong 60p, có thêm tgian để đóng gói các file