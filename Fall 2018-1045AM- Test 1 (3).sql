/*
	Class 10:45 AM

	submit this file with the following name: YourName-Fall 2018-915AM-Test1.sql

	Name : _____________Joey Cheung______________________________

	Email: ___________________joeycheung0@gmail.com_________________________

	Open a second query window to do the work.  Put your answer below the question.

	Good Luck.

*/



/*
	Question 1
	Using the dbo.Digits table with itself to create the units, tens and hundreds table alias CalculatedNumber

		select Hundreds.digit                                  as Hundreds
			 , Tens.digit                                      as Tens
			 , Units.digit                                     as Units
			 , concat(Hundreds.digit, Tens.digit, Units.digit) as CalculatedNumber
		from dbo.digits           as Hundreds
			cross join dbo.digits as Tens
			cross join dbo.digits as Units

	Generate the predicate of  two sets of numbers  From 000 to 999 in ascending order through a cartesian product relatve to the hundreds digit

	CalculatedNumber	Tens digit					Units digit
	Set 1				Hundreds equals Tens + 1	Hundreds equals Units + 2
	Set 2				Hundreds equals Tens - 1	Hundreds equals Units - 2

			Hundreds	Tens	Units	CalculatedNumber  (Total rows: 16)
				0		1		2				012
				1		2		3				123
				2		1		0				210
				2		3		4				234
				3		2		1				321
				3		4		5				345
				4		3		2				432
				4		5		6				456
				5		4		3				543
				5		6		7				567
				6		5		4				654
				6		7		8				678
				7		6		5				765
				7		8		9				789
				8		7		6				876
				9		8		7				987

*/
select Hundreds.digit                                  as Hundreds
			 , Tens.digit                                      as Tens
			 , Units.digit                                     as Units
			 , concat(Hundreds.digit, Tens.digit, Units.digit) as CalculatedNumber
from dbo.digits           as Hundreds
			cross join dbo.digits as Tens
			cross join dbo.digits as Units
order by Hundreds ASC

/*
	Question 2
	Using the dbo.Nums table derive the calander year (September 28-2014 through April 28, 2015) months.
  
	Make sure the result set has only 12 rows
			n	TwentyEighthOfTheMonth
			1	2014-09-28
			2	2014-10-28
			3	2014-11-28
			4	2014-12-28
			5	2015-01-28
			6	2015-02-28
			7	2015-03-28
			8	2015-04-28
			9	2015-05-28
			10	2015-06-28
			11	2015-07-28
			12	2015-08-28

*/
select n, concat('2014-', n, '-28') as TwentyEighthOfTheMonth
from dbo.Nums
/*
		Question 3

		Use the Sales.OrderValues view

		Create a column alias has a space for the name "Order Number".
			The case statement where the conditions are the following based upon the column val: 

				Condition                 then		  Label
				=======================				 ==========================
				mod(orederid,10) greater then 7      "PO"+orderid
				mod(orederid,10) less then 2         "DISC"+orderid
				mod(orederid,2) equal 1              "SO"+orderid
				mod(orederid,2) equal 0              "OMPA"+orderid

			Create a column alias has a space for the name "Price Category".  
			The case statement where the conditions are the following based upon the column val: 

				Condition                 then     Label
				=======================           ==========================
				Less than 1000                  'Low Priced'
				Between 1000 and 3000           'Average Price'
				More than 3000                  'High End Price'
				otherwise                       'Missing Value'

		Hint:
				select  orderid  
		,		[Order Number] = case 
										--  Build the case statement
								 end
		,       custid
		,       val
		,       [Price Category] = case 
										--  Build the case statement
								   end
		from    Sales.OrderValues


	Make sure the result set has only 830 rows

			orderid	Order Number	custid	val		Price Category
			10248	PO10248			85		440.00	Less than 1000
			10249	PO10249			79		1863.40	Between 1000 and 3000
			10250	DISC10250		34		1552.60	Between 1000 and 3000
			10251	DISC10251		84		654.06	Less than 1000
			10252	OMPA10252		76		3597.90	More than 3000
			10253	SO10253			34		1444.80	Between 1000 and 3000
			10254	OMPA10254		14		556.62	Less than 1000
			10255	SO10255			68		2490.50	Between 1000 and 3000
			10256	OMPA10256		88		517.80	Less than 1000
			10257	SO10257			35		1119.90	Between 1000 and 3000
			10258	PO10258			20		1614.88	Between 1000 and 3000
*/ 
select orderid,
	case orderid
	when orderid % 10 > 7 then concat('PO',orderid)
	when orderid % 10 < 2 then  concat('DISC', orderid)
	when orderid % 2 = 1 then concat('SO', orderid)
	when orderid % 2 = 0 then concat('OMPA', orderid)
	end
	as OrderNumber, custid, val, 
	case val
	when val < 1000 then 'Low Priced'
	when val > 1000 and val < 3000 then 'Average price'
	when val > 3000 then 'High End Value'
	else 'Missing value'
	end
	as PriceCategory
from Sales.OrderValues



/*
		Question 4

		Create the location alias (rename) from country,region and city with commas seperating the columns in the output
		using the concat function

		Make sure the result set has only 91 rows

				custid	country	region	city		location
					1	Germany	NULL	Berlin		Germany,Berlin
					2	Mexico	NULL	México D.F.	Mexico,México D.F.
					3	Mexico	NULL	México D.F.	Mexico,México D.F.
					4	UK		NULL	London		UK,London
					5	Sweden	NULL	Luleå		Sweden,Luleå
					6	Germany	NULL	Mannheim	Germany,Mannheim
					7	France	NULL	Strasbourg	France,Strasbourg
					8	Spain	NULL	Madrid		Spain,Madrid
					9	France	NULL	Marseille	France,Marseille
					10	Canada	BC		Tsawassen	Canada,BC,Tsawassen
*/
select top(91) custid, country, region, city, concat(country, ',', city) as location
from Sales.Customers

/*
	Question 5

	Using the Sales.Customers table return companyname,	contactname and location 

	Use the previous question's create the location alias (rename) from 
	country,region and city with commas seperating the columns in the output using the concat function
	No compound conditions to solve this problem.

	Make sure the result set has only 9 rows

		companyname			contactname				location
		Customer JYPSC		Goldin, Maxim			Belgium,Bruxelles
		Customer SFOGW		Luper, Steve			Belgium,Charleroi
		Customer YQQWW		Edwards, Josh			Brazil,SP,Sao Paulo
		Customer SRQVM		Li, Yan					Brazil,SP,Resende
		Customer JUWXK		Richardson, Shawn		Brazil,SP,Sao Paulo
		Customer KIDPX		Russo, Giuseppe			Brazil,SP,Sao Paulo
		Customer QVEPD		Garden, Euan			Brazil,RJ,Rio de Janeiro
		Customer WULWD		Meisels, Josh			Brazil,RJ,Rio de Janeiro
		Customer WFIZJ		Misiec, Anna			Brazil,SP,Sao Paulo
		Customer YJCBX		Orint, Neil				Brazil,SP,Campinas
		Customer IBVRG		Zhang, Frank			Brazil,RJ,Rio de Janeiro
		Customer FRXZL		Óskarsson, Jón Harry	Ireland,Co. Cork,Cork
		Customer CQRAA		Duerr, Bernard			Italy,Bergamo
		Customer LHANT		Voss, Florian			Italy,Reggio Emilia
		Customer WMFEA		Schmöllerl, Martin		Italy,Torino

*/
select top(9) companyname, contactname, concat(country, ',', city) as location
from Sales.Customers


/*
	Question 6

		Use the Sales.Orders table

		Find all orders with an orderdate for the calendar year 2015 
		grouped on the month of the orderdate and use the alias OrderMonth
		aggregate: 
					TotalCountPerMonth
					TotalFreigtCharges
		ordered by 
					OrderMonth ascending

		OrderMonth	TotalCountPerMonth	TotalFreigtCharges
		1					33				2238.98
		2					29				1601.45
		3					30				1888.81
		4					31				2939.10
		5					32				3461.40
		6					30				1852.65
		7					33				2458.72
		8					33				3078.27
		9					37				3237.05
		10					38				3945.53
		11					34				2008.85
		12					48				3757.96

*/
select orderdate, month(orderdate) as OrderMonth, count(*) as TotalCountPerMonth, sum(freight) as TotalFreightCharges
from Sales.Orders
order by OrderMonth, orderdate ASC

/*
	Question 7

	Find for the month of October, calculate the 8 Highest orders for the derived OrderPrice

	calculate the 
					static column HighestAndLowestOrderPrices using the text 'Highest Order Prices'
				    OctoberOrders  alias deriving substring(cast(o.orderdate as char(10)), 1, 7)
					OrderPrice alias deriving product of unitprice and qty.
					DiscountedOrderPrice alias deriving by extending the OrderPrice calculation and applying the discount (1.-discount).
					DaysFromOrderToShip alias deriving the number of days between orderdate and shippeddate

		HighestAndLowestOrderPrices	custid	orderdate	shippeddate	October Orders	unitprice	qty	discount	DaysFromOrderToShip	OrderPrice	DiscountedOrderPrice
		Highest Order Prices		63		2015-10-03	2015-10-22	2015-10			123.79		40	0.000			19				4951.60		4951.6000000
		Highest Order Prices		75		2014-10-15	2014-10-23	2014-10			210.80		20	0.050			8				4216.00		4005.2000000
		Highest Order Prices		71		2015-10-21	2015-10-29	2015-10			32.80		120	0.000			8				3936.00		3936.0000000
		Highest Order Prices		71		2014-10-08	2014-10-10	2014-10			35.10		80	0.150			2				2808.00		2386.8000000
		Highest Order Prices		83		2015-10-01	2015-10-07	2015-10			45.60		60	0.100			6				2736.00		2462.4000000
		Highest Order Prices		63		2015-10-06	2015-10-09	2015-10			30.00		90	0.000			3				2700.00		2700.0000000
		Highest Order Prices		63		2015-10-03	2015-10-22	2015-10			49.30		48	0.000			19				2366.40		2366.4000000
		Highest Order Prices		37		2015-10-13	2015-10-15	2015-10			55.00		42	0.150			2				2310.00		1963.5000000


*/
select custid, o.orderdate, unitprice, qty, discount, substring(cast(o.orderdate as char(10)), 1, 7) as OctoberOrders, sum(qty* unitprice) as OrderPrice, sum(1 - discount *(qty*unitprice)) as DiscountedOrderPrice, DATEDIFF(orderdate,'', shippeddate) as DaysFromOrderToShip
from Sales.orders as o, Sales.OrderDetails

/*
	Question 8

			Find  12 customers (Sales.Customers, Sales.Orders and Sales.OrderDetails) with the Highest sales.
			Use the following projection (custid, companyname,contactname,orderid)

				Hint:

				select *
				from Sales.Customers              as c
					inner join Sales.Orders       as o
						on o.custid = c.custid
					inner join Sales.OrderDetails as od
						on od.orderid = o.orderid

			Number of rows 12
			companyname				contactname			TotalOrders	TotalAmountPurchased
			Customer IRRVL			Veronesi, Giorgio		28			117483.39
			Customer LCOUJ			Navarro, Tomás			31			115673.39
			Customer THHDP			Kane, John				30			113236.68
			Customer FRXZL			Óskarsson, Jón Harry	19			57317.39
			Customer NYUHS			Moore, Michael			18			52245.90

*/
select companyname, contactname, count(*) as TotalOrders, sum(qty*unitprice) as TotalAmountPurchased
from Sales.Customers as c
	inner join 
	Sales.Orders as o
		on o.custid = c.custid
	inner join Sales.OrderDetails as od
		on od.orderid = o.orderid
group by o.orderid
/*
	Question 9

		Using the two queries as input for the set operations

		select country, region, city FROM sales.Customers as c
		select country, region, city FROM HR.Employees

	What is the distinct count of the union of the queries?
	What is the count of the union with duplicates of the queries?
	What is intersection of the queries?
	What is the difference of sets of these two sets (HR.Employees - sales.Customers) ?

*/
select country, region, city
from sales.Customers as c

union

select country, region, city 
from HR.Employees

select country, region, city
from sales.Customers as c

union all

select country, region, city 
from HR.Employees
  

select country, region, city
from sales.Customers as c

intersect

select country, region, city 
from HR.Employees

select country, region, city
from HR.employees

except

select country, region, city 
from Sales.Customers
/*
	Question 10
	Using the query
	
	 select s.supplierid, s.contacttitle, s.companyname, s.contactname from Production.Suppliers AS s

	Hint: use the following built-in functions reverse, substring, charindex and datediff

	Number of rows 91

		custid	contacttitle			ReverseContactTitle			companyname		StripCustomerFromCompanyname	contactname			ContactnameFirstName	ContactnameLastName
		1		Sales Representative	evitatneserpeR selaS		Customer NRZBB				NRZBB				Allen, Michael		Michael						Allen
		2		Owner					renwO						Customer MLTDN				MLTDN				Hassall, Mark		Mark						Hassall
		3		Owner					renwO						Customer KBUDE				KBUDE				Strome, David		David						Strome
		4		Sales Representative	evitatneserpeR selaS		Customer HFBZG				HFBZG				Cunningham, Conor	Conor						Cunningham
		5		Order Administrator		rotartsinimdA redrO			Customer HGVLZ				HGVLZ				Higginbotham, Tom	Tom							Higginbotham

*/

select s.supplierid, s.contacttitle,reverse(contacttitle) as ReverseContactTitle, s.companyname, substring(s.companyname) as StripCustomerFromCompanyName, s.contactname from Production.Suppliers AS s