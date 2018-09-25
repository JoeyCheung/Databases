USE TSQLV4;

SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
WHERE orderdate =
  (SELECT MAX(O.orderdate) FROM Sales.Orders AS O);

SELECT custid, orderid, orderdate, empid
FROM Sales.Orders
WHERE custid IN
  (SELECT TOP (1) WITH TIES O.custid
   FROM Sales.Orders AS O
   GROUP BY O.custid
   ORDER BY COUNT(*) DESC);

SELECT empid, FirstName, lastname
FROM HR.Employees
WHERE empid NOT IN
  (SELECT O.empid
   FROM Sales.Orders AS O
   WHERE O.orderdate >= '20160501');

SELECT DISTINCT country
FROM Sales.Customers
WHERE country NOT IN
  (SELECT E.country FROM HR.Employees AS E);

SELECT custid, orderid, orderdate, empid
FROM Sales.Orders AS O1
WHERE orderdate =
  (SELECT MAX(O2.orderdate)
   FROM Sales.Orders AS O2
   WHERE O2.custid = O1.custid)
ORDER BY custid;

SELECT custid, companyname
FROM Sales.Customers AS C
WHERE EXISTS
  (SELECT *
   FROM Sales.Orders AS O
   WHERE O.custid = C.custid
     AND O.orderdate >= '20150101'
     AND O.orderdate < '20160101')
  AND NOT EXISTS
  (SELECT *
   FROM Sales.Orders AS O
   WHERE O.custid = C.custid
     AND O.orderdate >= '20160101'
     AND O.orderdate < '20170101');

SELECT custid, companyname
FROM Sales.Customers AS C
WHERE EXISTS
  (SELECT *
   FROM Sales.Orders AS O
   WHERE O.custid = C.custid
     AND EXISTS
       (SELECT *
        FROM Sales.OrderDetails AS OD
        WHERE OD.orderid = O.orderid
          AND OD.ProductID = 12));

SELECT custid, ordermonth, qty,
  (SELECT SUM(O2.qty)
   FROM Sales.CustOrders AS O2
   WHERE O2.custid = O1.custid
     AND O2.ordermonth <= O1.ordermonth) AS runqty
FROM Sales.CustOrders AS O1
ORDER BY custid, ordermonth;

-- Step 1: get previous order date
SELECT custid, orderdate, orderid,
  (SELECT TOP (1) O2.orderdate
   FROM Sales.Orders AS O2
   WHERE O2.custid = O1.custid
     AND (    O2.orderdate = O1.orderdate AND O2.orderid < O1.orderid
           OR O2.orderdate < O1.orderdate )
   ORDER BY O2.orderdate DESC, O2.orderid DESC) AS prevdate
FROM Sales.Orders AS O1
ORDER BY custid, orderdate, orderid;

-- Step 2: compute the difference
SELECT custid, orderdate, orderid,
  DATEDIFF(day,
    (SELECT TOP (1) O2.orderdate
     FROM Sales.Orders AS O2
     WHERE O2.custid = O1.custid
       AND (    O2.orderdate = O1.orderdate AND O2.orderid < O1.orderid
             OR O2.orderdate < O1.orderdate )
     ORDER BY O2.orderdate DESC, O2.orderid DESC),
    orderdate) AS diff
FROM Sales.Orders AS O1
ORDER BY custid, orderdate, orderid;
