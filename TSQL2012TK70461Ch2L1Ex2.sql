----70-461 Ch 3 Ex 1

USE [TSQL2012];
GO

--1.
SELECT
	S.[shipperid]
	, [companyname]
	, [phone] AS phone number
FROM [Sales].[Shippers] AS S;

--2.
SELECT
	S.[shipperid]
	, [companyname]
	, [phone] AS "phone number"
FROM [Sales].[Shippers] AS S;