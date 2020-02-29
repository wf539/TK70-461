USE [TSQL2012];
GO

--Lesson 1 Ex 1
-- Returns 0 rows. two unknons compared = unknown; result filtered out
SELECT
	[orderid]
	, [orderdate]
	, [custid]
	, [empid]
FROM [Sales].[Orders]
WHERE
	[shippeddate] = NULL;

SELECT
	[orderid]
	, [orderdate]
	, [custid]
	, [empid]
FROM [Sales].[Orders]
WHERE
	[shippeddate] IS NULL;

--Lesson 1 Ex 2
--BETWEEN includes order for Feb 13
SELECT
	[orderid]
	, [orderdate]
	, [custid]
	, [empid]
FROM [Sales].[Orders]
WHERE
	[orderdate] BETWEEN '20080211' AND '20080212 23:59:59.999';

--
	SELECT
	[orderid]
	, [orderdate]
	, [custid]
	, [empid]
FROM [Sales].[Orders]
WHERE
	[orderdate] >= '20080211' 
	AND [orderdate] < '20080213';

--Lesson 2 Ex 1
--Step 2
SELECT
	[orderid]
	,[empid]
	,[shipperid]
	,[shippeddate]
FROM [Sales].[Orders]
WHERE 
	[custid] = 77;

--Step 3
SELECT
	[orderid]
	,[empid]
	,[shipperid]
	,[shippeddate]
FROM [Sales].[Orders]
WHERE 
	[custid] = 77
ORDER BY
	[shipperid];
	
--Lesson 2 Ex 2
--Step 1
SELECT
	[orderid]
	,[empid]
	,[shipperid]
	,[shippeddate]
FROM [Sales].[Orders]
WHERE 
	[custid] = 77
ORDER BY
	[shipperid]
	,[shippeddate] DESC;

--Step 2
SELECT
	[orderid]
	,[empid]
	,[shipperid]
	,[shippeddate]
FROM [Sales].[Orders]
WHERE 
	[custid] = 77
ORDER BY
	[shipperid]
	,[shippeddate] DESC
	,[orderid] DESC;			--Added DESC