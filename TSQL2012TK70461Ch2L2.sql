--Ch 2 L2 Ex 1

USE [TSQL2012];
GO

--Ex 1.
SELECT
	[empid] AS [employee ID]
	, ([firstname] + ' ' + [lastname]) AS [fullname]
	, YEAR([birthdate]) AS [birthyear]
FROM [HR].[Employees];

--Ex 2.
SELECT EOMONTH(SYSDATETIME()) AS [Date of the last day of the current month];

SELECT DATEFROMPARTS(YEAR(SYSDATETIME()), 12, 31) AS [Date of the last day of the current year];


--Ex 3.
--1.
SELECT
	[productid]
	, CONCAT(REPLICATE('0', 10 - LEN(CAST([productid] AS CHAR(10)))), CAST([productid] AS CHAR(10))) AS [PID w leading 0s]--[PID w leading 0s]
FROM [Production].[Products];

--Alternatively:
SELECT
	[productid] AS productid
	, FORMAT([productid], '000000000') AS [PID w leading 0s]--[PID w leading 0s]
FROM [Production].[Products];

--Or even more simply:
SELECT
	[productid] AS productid
	, FORMAT([productid], 'd10') AS [PID w leading 0s]--[PID w leading 0s]
FROM [Production].[Products];
