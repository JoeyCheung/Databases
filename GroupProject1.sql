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

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'JPN'
GROUP BY C.custid

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'JPN'
GROUP BY C.custid
ORDER BY totalqty DESC;

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'JPN'
GROUP BY C.custid
ORDER BY totalqty ASC;

-- Complicated Queries --

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(0) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(1) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(2) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(3) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(4) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(5) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(6) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(7) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(8) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;

drop function if exists dbo.GetCustOrders;
go
create function dbo.GetCustOrders
	(@cid AS INT) RETURNS TABLE
AS
RETURN
	SELECT orderid, custid, empid, orderdate, requireddate, shipregion, shippostalcode, shipcountry
	FROM Sales.Orders
	WHERE custid = @cid
GO

SELECT C.custid, COUNT( DISTINCT ODA.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM dbo.GetCustOrders(9) AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	LEFT OUTER JOIN Sales.OrderDetailsAudit AS ODA
		ON O.orderid = ODA.orderid
GROUP BY C.custid;
