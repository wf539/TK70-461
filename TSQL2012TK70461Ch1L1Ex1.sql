----------Ex 1 p 11 (43)
SELECT
	[custid]
	, YEAR(orderdate)	--No name for attribute (No column alias)
FROM [Sales].[Orders]
ORDER BY				--Presentation order is forced; ordinal positions used
	1
	, 2;