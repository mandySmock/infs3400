#By Mandy Smock
#Homework 3, 02/23/2022
#Group By, Having, and Subquery

USE w3schoolsdb ;

SELECT DISTINCT c.CustomerID, c.CustomerName, c.Country, e.EmployeeID
FROM customers AS c
INNER JOIN orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN employees AS e
ON o.EmployeeID = e.EmployeeID
WHERE e.EmployeeID = 9
GROUP BY c.CustomerID
;

SELECT DISTINCT c.CustomerID, c.CustomerName, c.Country
FROM customers AS c
WHERE c.CustomerID IN
(
	SELECT o.CustomerID
	FROM orders AS o
	WHERE o.EmployeeID IN 
	(	
		SELECT e.EmployeeID
		FROM employees AS e
		WHERE e.EmployeeID = 9
	)
)
GROUP BY c.CustomerID
;

SELECT o.CustomerID, COUNT(*) AS NumOrders
FROM orders AS o
GROUP BY o.CustomerID
ORDER BY NumOrders DESC
;

SELECT c.Country, COUNT(*) AS NumOrders
FROM customers AS c
INNER JOIN orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.Country
HAVING NumOrders> 10
ORDER BY NumOrders DESC
;

SELECT ca.CategoryName, SUM(pr.Price) AS SumValue
FROM categories AS ca
INNER JOIN products AS pr
ON ca.CategoryID = pr.CategoryID
WHERE ca.CategoryName = "Meat/Poultry" AND ca.CategoryName = "Seafood" IN
(
		SELECT SUM(pr.Price)
		FROM products AS pr
		WHERE pr.CategoryID
)
ORDER BY SumValue DESC
;