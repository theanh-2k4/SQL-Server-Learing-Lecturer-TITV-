use NORTHWND;
---Tính số lượng hàng còn lại trong kho UnitsÍntock sau khi bán hết sản phẩm đã được đặt
SELECT [ProductID], 
		[ProductName],
		([UnitsInStock]-[UnitsOnOrder]) AS [StockRemaining]
FROM [dbo].[Products]
--77 rows
--1st row 1	Chai	39

--Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
SELECT [OrderID], 
	   [ProductID],
	   ([UnitPrice]*[Quantity]) AS [OrderDetailValue]
FROM [dbo].[Order Details]
--2155 rows  
-- 1st row 10248	11	168.00

---
SELECT *,
	   ([UnitPrice]*[Quantity]) AS [OrderDetailValue]
FROM [dbo].[Order Details]
-- 2155 rows
-- 1st row 10248	11	14.00	12	0	168.00

--Tính tỉ lệ giá vận chuyển đơn đặt hàng Freight trung bình so với giá trị vận chuyển của đơn lớn nhất MaxFreight
SELECT (AVG([Freight]) /MAX([Freight])) AS [FreightRatio]
FROM [dbo].[Orders]
-- 0.0776

--Bài tập
--Liệt kê sản phẩm và giá sản phẩm sau khi giảm 10% dùng 2 cách 
--1 dùng phép nhân + chia 
SELECT [ProductName],
	   [UnitPrice]
FROM [dbo].[Products]
-- 1st row - Chai	18.00
--------------------------
SELECT [ProductName],
	   ([UnitPrice]*90)/100 AS [UnitPriceAfterDiscount]
FROM [dbo].[Products]
--1st row - Chai	16.20

--2 dùng mỗi phép nhân
SELECT [ProductName],
	   ([UnitPrice]*0.9) AS [UnitPriceAfterDiscount]
FROM [dbo].[Products]
--1st row - Chai	16.20000

--2 bài tự làm
--Lấy ra họ tên đầy đủ của các nhân viên
SELECT ([LastName] + ' ' + [FirstName]) AS [FullName]
FROM [dbo].[Employees]
--Davolio Nancy

--2 tính giá trị trung bình của đơn hàng trong bảng product rồi chia 10 lấy dữ
SELECT AVG([UnitPrice])% 10 AS [Module]
FROM [dbo].[Products]
--8.8663