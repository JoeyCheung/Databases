use TSQLV4

-- Simple Queries --

-- Write a query that generates 5 copies out of each employee row --
-- Tables involved: TSQLV4 database, Employees and Nums tables --
SELECT 
	E.empid, E.firstname, E.lastname, N.n
FROM HR.Employees AS E
	CROSS JOIN dbo.Nums AS N
WHERE N.n <= 5
ORDER BY n, empid;

use AdventureWorks2014

-- Write a query that collects business entity ID's of people and their passwords  --
-- Tables involved: Person.person and Person.Password --

SELECT F.BusinessEntityID, P.BusinessEntityID
FROM Person.person AS F
	INNER JOIN Person.Password as P
ON F.BusinessEntityID = P.BusinessEntityID;

use AdventureWorksDW2014

-- Select all from dbo.DimProduct --
-- Tables involved: dbo.DimProduct --
SELECT * FROM dbo.DimProduct;

use WideWorldImportersDW

-- Select all from Fact.movement --
-- Tables involved: Fact.Movement --
SELECT * FROM Fact.Movement;

-- Return customers with orders placed on Feb 12, 2016 along with their orders --
-- Tables involved: TSQLV4 database, Customers and Orders tables --
SELECT C.custid, C.companyname
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
		ON O.custid = C.custid
WHERE O.orderid IS NULL;

use WideWorldImporters
SELECT * FROM Sales.Orders;

-- Medium Queries -- 

-- 4
-- Return customers and their orders including customers who placed no orders --
-- Tables involved: TSQLV4 database, Customers and Orders tables --
SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid;

-- Return customers and their orders -- 
-- Tables involved: Customers and Order tables --

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
GROUP BY C.custid;

-- Write a query that is similar to the above query but where country is from japan -- 
-- Tables involved: Customers and Order tables --

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
		WHERE C.country = N'JPN'
GROUP BY C.custid;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY numorders;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY numorders ASC

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY numorders DESC;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY C.custid;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY C.custid ASC;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY C.custid DESC;

-- Write a query that keeps Sales.Customers and joins with Sales.Order and Sales.OrderDetails ordered by custid --
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Orders AS O
	INNER JOIN Sales.OrderDetails AS OD
		ON O.orderid = OD.orderid
	RIGHT OUTER JOIN Sales.Customers AS C
		ON O.custid = C.custid
GROUP BY C.custid
ORDER BY C.custid;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY totalqty;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY totalqty ASC;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
GROUP BY C.custid
ORDER BY totalqty DESC;
-- Write a query that's similar to the above query but preserves Orders and OrderDetails as an independent unit in descending order by productid --
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Customers AS C
	LEFT OUTER JOIN
		(Sales.Orders AS O
			INNER JOIN Sales.OrderDetails AS OD
				ON O.orderid = OD.orderid)
		ON C.custid = O.custid
ORDER BY OD.productid DESC;

-- Complicated Queries --

-- Write a query that matches customers with their orders including their order details audit --
-- Tables involved: Sales.Customers, Sales.Orders, Sales.OrderDetails, and Sales.OrderDetailsAudit -- 

SELECT C.custid, C.companyname, O.orderid, OD.productid, OD.qty, ODA.orderid
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON C.custid = O.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON O.orderid = OD.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit as ODA
		ON OD.orderid = ODA.orderid;

-- Return customers and their orders including customers who placed no orders and with their order detail audit -- 
-- Tables involved: Customers and Order tables --

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

-- Write a query that matches customers with their orders including their order details audit in ascending order of orderid --
-- Tables involved: Sales.Customers, Sales.Orders, Sales.OrderDetails, and Sales.OrderDetailsAudit -- 

SELECT C.custid, C.companyname, O.orderid, OD.productid, OD.qty, ODA.orderid
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON C.custid = O.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON O.orderid = OD.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit as ODA
		ON OD.orderid = ODA.orderid
ORDER BY ODA.orderid ASC;

-- Write a query that matches customers with their orders including their order details audit in descending order of orderid --
-- Tables involved: Sales.Customers, Sales.Orders, Sales.OrderDetails, and Sales.OrderDetailsAudit -- 

SELECT C.custid, C.companyname, O.orderid, OD.productid, OD.qty, ODA.orderid
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON C.custid = O.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON O.orderid = OD.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit as ODA
		ON OD.orderid = ODA.orderid
ORDER BY ODA.orderid DESC;

-- Write a query that's similar to the above query but preserves Orders, OrderDetails, and OrderDetailsAudit as an independent unit --
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Customers AS C
	LEFT OUTER JOIN
		(Sales.Orders AS O
			INNER JOIN Sales.OrderDetails AS OD
				ON O.orderid = OD.orderid
			LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
				ON OD.orderid = ODA.orderid)
		ON C.custid = O.custid;

-- Write a query that's similar to the above query but preserves Orders, OrderDetails, and OrderDetailsAudit as an independent unit in Ascending order by orderid--
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Customers AS C
	LEFT OUTER JOIN
		(Sales.Orders AS O
			INNER JOIN Sales.OrderDetails AS OD
				ON O.orderid = OD.orderid
			LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
				ON OD.orderid = ODA.orderid)
		ON C.custid = O.custid
ORDER BY O.orderid ASC;

-- Write a query that's similar to the above query but preserves Orders, OrderDetails, and OrderDetailsAudit as an independent unit in Descending order by orderid--
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Customers AS C
	LEFT OUTER JOIN
		(Sales.Orders AS O
			INNER JOIN Sales.OrderDetails AS OD
				ON O.orderid = OD.orderid
			LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
				ON OD.orderid = ODA.orderid)
		ON C.custid = O.custid
ORDER BY O.orderid DESC;

-- Write a query that keeps Sales.Customers and joins with Sales.Order and Sales.OrderDetails ordered by custid --
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Orders AS O
	INNER JOIN Sales.OrderDetails AS OD
		ON O.orderid = OD.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON OD.orderid = ODA.orderid
	RIGHT OUTER JOIN Sales.Customers AS C
		ON O.custid = C.custid;

-- Write a query that keeps Sales.Customers and joins with Sales.Order and Sales.OrderDetails ordered by custid in ascending order --
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Orders AS O
	INNER JOIN Sales.OrderDetails AS OD
		ON O.orderid = OD.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON OD.orderid = ODA.orderid
	RIGHT OUTER JOIN Sales.Customers AS C
		ON O.custid = C.custid
ORDER BY C.custid ASC;

-- Write a query that keeps Sales.Customers and joins with Sales.Order and Sales.OrderDetails ordered by custid in descending order --
-- Tables involved: Sales.Orders, Sales.Customers, and Sales.OrderDetails --

SELECT C.custid, O.orderid, OD.productid, OD.qty
FROM Sales.Orders AS O
	INNER JOIN Sales.OrderDetails AS OD
		ON O.orderid = OD.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON OD.orderid = ODA.orderid
	RIGHT OUTER JOIN Sales.Customers AS C
		ON O.custid = C.custid
ORDER BY C.custid DESC;
