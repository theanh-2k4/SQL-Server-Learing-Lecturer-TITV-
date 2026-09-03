use NORTHWND;

--Liệt kê các nhà cung cấp theo thứ tự A-Z - 29 rows
SELECT *
FROM [dbo].[Suppliers]
ORDER BY [CompanyName] ASC --Sắp xếp tăng dần

--Liệt kê tất cả các sản phẩm theo thứ tự giá giảm giần - 77 rows
SELECT *
FROM [dbo].[Products]
ORDER BY [UnitPrice] DESC --Sắp xếp giảm dần

--Liệt kê tên các cả nhân viên theo thứ tự họ và tên đệm - 9 rows
SELECT *
FROM [dbo].[Employees]
ORDER BY [LastName], [FirstName]

--Lấy ra 1 sản phẩm có số lượng bán nhiều nhất trong bảng [Order Details] không dùng MAX
SELECT TOP 1 *
FROM [dbo].[Order Details]
ORDER BY [Quantity] DESC
-- 130

--Bài tập
--Liệt kê danh sách các đơn đặt hàng trong bảng Orders theo thứ tự giảm dần ngày đặt hàng
SELECT [OrderID], [OrderDate]
FROM [dbo].[Orders]
ORDER BY [OrderDate] DESC
--ID: 11077,ORDERDATE: 1998-05-06 00:00:00.000

--Liệt kê tên, đơn giá, số lượng trong kho của tất cả sản phẩm theo thứ tự giảm dần số lượng trong kho
SELECT [ProductName], [UnitPrice], [UnitsInStock]
FROM [dbo].[Products]
ORDER BY [UnitsInStock] DESC
-- Rhönbräu Klosterbier,	7.75,	125

--3 Câu tự làm
--Liệt kê tất cả các nhân viên theo thứ tự giảm dần ngày sinh
SELECT *
FROM [dbo].[Employees]
ORDER BY [BirthDate] DESC

--Cho biết 3 đơn hàng có mức giảm giá tốt nhất
SELECT  TOP 3 *
FROM [dbo].[Order Details]
ORDER BY [Discount] DESC

--Cho biết ngày xa nhất có đơn đặt hàng, không dùng MAXMIN
SELECT TOP 1 [OrderDate]
FROM [dbo].[Orders]
ORDER BY [OrderDate] DESC
-- 1996-07-04 00:00:00.000