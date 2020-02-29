USE [TSQL2012];
GO

INSERT INTO Production.Suppliers
(companyname, contactname, contacttitle, address, city, postalcode, country, phone)
VALUES(N'Supplier XYZ', N'Jiru', N'Head of Security', N'42 Sekimai Musashino-shi',
N'Tokyo', N'01759', N'Japan', N'(02) 4311-2609');

--------------------------------------------------------------------------------------

SELECT
	D.[n] AS [theday]
	, S.[n] AS [shiftno]
FROM [dbo].[Nums] AS D
	CROSS JOIN [dbo].[Nums] AS S (NOLOCK)
WHERE
	D.[n] <= 7
	AND S.[n] <= 3
ORDER BY
	theday
	, shiftno;

-----------------------------------------------------------------------------------------

SELECT
	PS.[companyname] AS [Supplier]
	, PS.[country]
	, PP.[productid]
	, PP.[productname]
	, PP.[unitprice]
FROM [Production].[Suppliers] AS PS
	LEFT OUTER JOIN [Production].[Products] AS PP (NOLOCK)
	ON PS.[supplierid] = PP.[supplierid]
	AND PS.[country] = N'Japan';

---------------------------------------------------------------------------------------------

SELECT
	PS.[companyname] AS [Supplier]
	, PS.[country]
	, PP.[productid]
	, PP.[productname]
	, PP.[unitprice]
	, PC.[categoryname]
FROM [Production].[Suppliers] AS PS
	LEFT OUTER JOIN [Production].[Products] AS PP (NOLOCK)
	ON PS.[supplierid] = PP.[supplierid]
	INNER JOIN [Production].[Categories] AS PC (NOLOCK)
	ON PC.[categoryid] = PP.[categoryid]
WHERE PS.[country] = N'Japan';								--Supplier XYZ discarded

---------------------------------------------------------------------------------------------

SELECT
	PS.[companyname] AS [Supplier]
	, PS.[country]
	, PP.[productid]
	, PP.[productname]
	, PP.[unitprice]
	, PC.[categoryname]
FROM [Production].[Suppliers] AS PS
	LEFT OUTER JOIN 
		([Production].[Products] AS PP (NOLOCK)
			INNER JOIN [Production].[Categories] AS PC (NOLOCK)
			ON PC.[categoryid] = PP.[categoryid])
	ON PS.[supplierid] = PP.[supplierid]
WHERE PS.[country] = N'Japan';

-------------------------------------------------------------------------------------------------------------

--Ex 1

SELECT
	SO.[custid]
	, SC.[companyname] AS [Company name]
	,SO.[orderid]	
	--, SO.[empid]
	, SO.[orderdate]
	--, SO.[requireddate]
	--, SO.[shippeddate]
	--, SO.[shipperid]
	--, SO.[freight]
	--, SO.[shipname]
	--, SO.[shipaddress]
	--, SO.[shipcity]
	--, SO.[shipregion]
	--, SO.[shippostalcode]
	--, SO.[shipcountry]
FROM [Sales].[Orders] AS SO
	INNER JOIN [Sales].[Customers] AS SC (NOLOCK)
	ON SO.[custid] = SC.[custid];

-----------------------------------------------------------------------------------------------------

--Ex 2
--SELECT
--	SO.[custid]
--	, SC.[companyname] AS [Company name]
--	,SO.[orderid]	
--	, SO.[orderdate]
--FROM [Sales].[Orders] AS SO
--	INNER JOIN [Sales].[Customers] AS SC (NOLOCK)
--	ON SO.[custid] = SC.[custid];

--Include Customers without orders in the result set
SELECT
	SC.[custid]
	, SC.[companyname]
	, SO.[orderid]
	, SO.[orderdate]
FROM [Sales].[Customers] AS SC
	LEFT OUTER JOIN [Sales].[Orders] AS SO (NOLOCK)
	ON SC.[custid] = SO.[custid];

--Return only customers without orders
SELECT
	SC.[custid]
	, SC.[companyname]
	, SO.[orderid]
	, SO.[orderdate]
FROM [Sales].[Customers] AS SC
	LEFT OUTER JOIN [Sales].[Orders] AS SO (NOLOCK)
	ON SC.[custid] = SO.[custid]
WHERE
	SO.[orderid] IS NULL;

--Return all Customers, but match orders only if they were placed in Feb 2008
SELECT
	SC.[custid]
	, SC.[companyname]
	, SO.[orderid]
	, SO.[orderdate]
FROM [Sales].[Customers] AS SC
	LEFT OUTER JOIN [Sales].[Orders] AS SO (NOLOCK)
	ON SC.[custid] = SO.[custid]
	AND SO.[orderdate] >= '20080201'
	AND SO.[orderdate] < '20080301';