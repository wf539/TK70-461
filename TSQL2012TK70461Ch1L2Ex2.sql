--Ch 2 Ex 2
----1. The following query returns 0 rows

SELECT
	[shipperid]
	, SUM([freight]) AS [Totalfreight]
FROM [Sales].[Orders]
WHERE
	[freight] > 20000.00
GROUP BY
	[shipperid]
	
--

----2.
SELECT
	[shipperid]
	, SUM([freight]) AS [Totalfreight]
FROM [Sales].[Orders]
HAVING [Totalfreight] > 20000.00


---------This works
SELECT
	[shipperid]
	, SUM([freight]) AS [Totalfreight]
FROM [Sales].[Orders]
GROUP BY
	[shipperid]
HAVING 
	SUM([freight]) > 20000.00