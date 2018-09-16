use TSQLV4

SELECT 
	E.empid, E.firstname, E.lastname, N.n
FROM HR.Employees AS E
	CROSS JOIN dbo.Nums AS N
WHERE N.n <= 5
ORDER BY n, empid;

SELECT E.empid,
	DATEADD(day, D.n - 1, CAST('20160612' AS DATE)) AS dt
FROM HR.Employees AS E
	CROSS JOIN dbo.Nums AS D
WHERE D.n <= DATEDIFF(day, '20160612', '20160616') + 1
ORDER BY empid, dt;

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
  INNER JOIN Sales.Orders AS O
    ON C.custid = O.custid;
-- You need aliases or the prefixes are defaulted by the source table name --

SELECT C.custid, COUNT( DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
	INNER JOIN Sales.OrderDetails AS OD
		ON OD.orderid = O.orderid
	WHERE C.country = N'USA'
	GROUP BY C.custid;

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
		ON C.custid = O.custid;

SELECT C.custid, C.companyname
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
		ON O.custid = C.custid
WHERE O.orderid IS NULL;

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
WHERE O.orderdate = '20160212';

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
		ON O.custid = C.custid
		AND O.orderdate = '20160212';

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
		ON O.custid = C.custid
WHERE O.orderdate = '20160212'
	OR O.orderid IS NULL;
-- This query filters out customers that didn't order at all but not the customers that ordered on other dates --

SELECT DISTINCT C.custid, C.companyname,
	CASE WHEN O.orderid IS NOT NULL THEN 'Yes' ELSE 'No' END AS HasOrderOn20160212
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
		ON O.custid = C.custid
		AND O.Orderdate = '20160212';