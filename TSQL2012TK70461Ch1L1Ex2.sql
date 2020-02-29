----------Ex 2 p 11 (43)
SELECT DISTINCT
	[custid]
	, YEAR(orderdate)	AS [Order year]
FROM [Sales].[Orders]
--ORDER BY				--Presentation order is forced; ordinal positions used
--	1
--	, 2;