use NORTHWND;

--Đếm số lượng khách hàng trên bảng Customers
SELECT COUNT(*) AS [Số lượng khách hàng]
FROM [dbo].[Customers]
--91

--Tính tổng số tiền vận chuyển của tất cả các đơn hàng
SELECT SUM([Freight]) AS [Tổng tiền]
FROM [dbo].[Orders]
--64942.69

--Tính trung bình số lượng đặt hàng trong bảng Order Details
SELECT AVG([Quantity]) AS [Trung bình đặt hàng]
FROM [dbo].[Order Details]
--23

--Đếm số lượng, tổng lượng hàng trong kho và trung bình giá của các sản phẩm trong bảng Product
SELECT  COUNT([ProductID]) AS [Số lượng mặt hàng], 
		SUM([UnitsInStock]) AS [Lượng hàng tồn kho], 
		AVG([UnitPrice]) AS [Giá trung bình]
FROM [dbo].[Products]
--77, 3119, 28.8663

--Bài tập
--Đếm số lượng đơn hàng dùng 2 cách 
-- 1.*
SELECT COUNT(*) AS [Số lượng]
FROM [dbo].[Orders]
--830

-- 2.[OrderID]
SELECT COUNT([OrderID]) AS [Số lượng]
FROM [dbo].[Orders]
--830

--Tính trung bình cột [UnitPrice], tổng cột [Quantity] trong bảng [dbo].[Order Details]
SELECT AVG([UnitPrice]) AS [Giá trung bình], 
	   SUM([Quantity]) AS [Tổng số lượng]
FROM [dbo].[Order Details]
--26.2185, 51317

--3 Câu tự làm 
--Cho biết tổng số lượng nhân viên trong bảng [dbo].[Employees]
SELECT COUNT([EmployeeID]) AS [Số lượng đơn]
FROM [dbo].[Employees]
--9

--Tính tổng số lượng hàng đang được giao
SELECT SUM([UnitsOnOrder]) AS [Đang giao]
FROM [dbo].[Products]
--780

--Tính trung bình [Discount] trên mỗi đơn hàng trong [Order Details]
SELECT AVG([Discount]) AS [AvgDiscount]
FROM [dbo].[Order Details]
--0.0561670542022607