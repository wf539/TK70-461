----70-461 Ch 3 Ex 1

USE [TSQL2012];
GO

--2.
SELECT
	[shipperid]
	, [companyname]
	, [phone]
FROM [Sales].[Shippers];

--3.
SELECT
	S.[shipperid]
	, [companyname]
	, [phone]
FROM [Sales].[Shippers] AS S;