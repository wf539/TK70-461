--Ch 2 Ex 1
----The following query fails:

SELECT
	[custid]
	, [orderid]
FROM [Sales].[Orders]
GROUP BY
	[custid]

--Msg 8120, Level 16, State 1, Line 5
--Column 'Sales.Orders.orderid' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

------------------------------
SELECT
	[custid]
	, MAX([orderid]) AS [Highest OrderID]
FROM [Sales].[Orders]
GROUP BY
	[custid]