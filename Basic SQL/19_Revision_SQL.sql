use NORTHWND

--Cho biết các khách đặt nhiều hơn 20 đơn, sắp xếp giảm dần theo số đơn
SELECT [CustomerID],
		COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [CustomerID]
HAVING COUNT([OrderID]) > 20
ORDER BY COUNT([OrderID]) DESC
--3 rows
--1st row SAVEA	31

--Lọc ra các nhân viên có tổng số đơn hàng >= 100 sắp xếp theo tổng số đơn giảm dần
SELECT [EmployeeID],
		COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [EmployeeID]
HAVING COUNT([OrderID]) >= 100
ORDER BY COUNT([OrderID]) DESC
--4 rows
--1st row 4	156

--Cho biết những loại sản phẩm có số lượng sản phẩm khác nhau lớn hơn 11
SELECT [CategoryID], COUNT([ProductID]) AS [DistinctProducts]
FROM [dbo].[Products]
GROUP BY [CategoryID]
HAVING COUNT([ProductID]) > 11
--4 rows
--1st row 1	12

--Cho biết những thể loại có tổng sản phẩm trong kho lớn hơn 350
SELECT [CategoryID], SUM([UnitsInStock]) AS [TotalUnits]
FROM [dbo].[Products]
GROUP BY [CategoryID]
HAVING SUM([UnitsInStock]) > 350
--5 rows
--1st row 1	559

--Lọc ra những quốc gia có hơn 7 đơn hàng
SELECT [ShipCountry],
		COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [ShipCountry]
HAVING COUNT([OrderID]) > 7
--19 rows
--1st row Finland	22

--Cho biết những ngày có 5 đơn hàng được giao sắp xếp tăng dần  theo ngày giao
SELECT [ShippedDate], COUNT(*) AS [TotalShip]
FROM [dbo].[Orders]
WHERE [ShippedDate] IS NOT NULL
GROUP BY [ShippedDate]
HAVING COUNT(*) > 5
ORDER BY [ShippedDate] ASC
--1st row 1998-01-23 00:00:00.000	6

--Lọc ra những quốc gia có tên bắt đầu bằng A hoặc G
--có số đơn hàng lớn hơn 29, xếp theo đơn giảm dần
SELECT [ShipCountry],
		COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE '[A,G]%'
GROUP BY [ShipCountry]
HAVING COUNT([OrderID]) > 29
ORDER BY [TotalOrders] DESC
--1st row Germany	122

--Lọc ra các thành phố có số lượng đơn được giao khác 1 và 2, ngày đặt từ 1/4 -31/8 năm 1997
SELECT [ShipCity],
		COUNT([OrderID]) AS [TotalOrders],
		[OrderDate]
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1997-4-1' AND '1997-8-31'
GROUP BY [ShipCity], [OrderDate]
HAVING COUNT([OrderID]) NOT IN (1,2)
--0 row 