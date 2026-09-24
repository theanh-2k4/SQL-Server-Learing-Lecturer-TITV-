use NORTHWND

WITH SHORT_E AS (
	SELECT E.EmployeeID, E.LastName, E.FirstName
	FROM [dbo].[Employees] E
)
SELECT * 
FROM SHORT_E;

--Lấy thông tin về các sản phẩm có cùng thể loại với một sản phẩm cụ thể

WITH Product_Category AS (
	SELECT P.CategoryID
	FROM [dbo].[Products] P
	WHERE P.ProductName = 'Chai'
)
SELECT p.ProductName, p.CategoryID
FROM [dbo].[Products] p
INNER JOIN Product_Category PC
ON P.CategoryID = PC.CategoryID;

--Lấy thông tin đơn hàng cùng với tổng giá trị đơn hàng và tỉ lệ tổng giá trị đơn hàng và phí giao hàng
--SubQuery
SELECT O.OrderID, o.OrderDate, o.Freight,
		(SELECT SUM(OD.Quantity *OD.UnitPrice)
		FROM [dbo].[Order Details] OD
		WHERE OD.OrderID = O.OrderID
		) AS [TotalPrice], 
		(SELECT SUM(OD.Quantity *OD.UnitPrice)
		FROM [dbo].[Order Details] OD
		WHERE OD.OrderID = O.OrderID
		)/o.Freight as Ratio
FROM [dbo].[Orders] O;

--CTE
WITH OrderTotal AS (
	SELECT OD.OrderID ,SUM(OD.Quantity *OD.UnitPrice) AS [TotalPrice]
	FROM [dbo].[Order Details] OD
	GROUP BY OD.OrderID
),
OTX AS (
	SELECT OD.OrderID ,SUM(OD.Quantity *OD.UnitPrice) AS [TotalPrice]
	FROM [dbo].[Order Details] OD
	GROUP BY OD.OrderID
)
SELECT O.OrderID, o.OrderDate, o.Freight, 
		OT.TotalPrice, (OT.TotalPrice /O.Freight) AS Ratio
FROM [dbo].[Orders] O
JOIN OrderTotal OT
ON OT.OrderID = O.OrderID;

--Bài tập
--1. tính tổng doanh số bán hàng cho từng sản phẩm từ 2 bảng [dbo].[Products] và  [dbo].[Order Details]
WITH OrderTotal AS (
	SELECT OD.ProductID ,SUM(OD.Quantity *OD.UnitPrice) AS [TotalPrice]
	FROM [dbo].[Order Details] OD
	GROUP BY OD.ProductID
)
SELECT P.CategoryID,
	P.ProductID, 
	P.ProductName,
	OT.TotalPrice
FROM [dbo].[Products] P
JOIN OrderTotal OT
ON OT.ProductID = P.ProductID;

--2 Tính tổng doanh số bán hàng theo từng khách hàng và sau đó sắp xếp danh sách theo tổng danh số giảm dần
WITH TotalRevenue AS (
	SELECT O.CustomerID, SUM(OD.Quantity *OD.UnitPrice) AS [TotalRevenue]
	FROM [dbo].[Orders] O
	JOIN [dbo].[Order Details] OD
	ON OD.OrderID = O.OrderID
	GROUP BY O.CustomerID
)
SELECT C.CustomerID, C.ContactName, TR.TotalRevenue
FROM [dbo].[Customers] C
JOIN TotalRevenue TR
ON TR.CustomerID = C.CustomerID
ORDER BY TR.TotalRevenue DESC;

--3 Tính tổng doanh số bán hàng theo năm từ bảng [dbo].[Orders] và [dbo].[Order Details]
SELECT YEAR(O.OrderDate) AS [Year]
FROM [dbo].[Orders] O
GROUP BY YEAR(O.OrderDate);
---

WITH TotalRevenue AS (
	SELECT YEAR(O.OrderDate) AS [Year],
	SUM(OD.Quantity *OD.UnitPrice) AS [TotalRevenue]
	FROM [dbo].[Order Details] OD
	JOIN [dbo].[Orders] O
	ON O.OrderID = OD.OrderID
	GROUP BY YEAR(O.OrderDate)
)
SELECT TR.* 
FROM TotalRevenue TR
ORDER BY TR.Year ASC