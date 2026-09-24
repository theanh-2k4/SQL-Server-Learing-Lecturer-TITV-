use NORTHWND
--Lấy cột CompanyName và PostalCode lần lượt đặt tên là Tên Công Ty và Mã Bưu Điện (91 rows)
SELECT [CompanyName] AS [Tên Công Ty],
		[PostalCode] AS "Mã Bưu Điện",
		[City] AS "Thành Phố"
FROM [dbo].[Customers]

-- Lấy cột Họ và Tên từ bảng Employees
SELECT [LastName] AS "Họ", [FirstName] AS "Tên"
FROM [dbo].[Employees]

--Lấy 15 dòng dữ liệu đầu tiên từ bảng Order,đặt tên bảng Order là o
SELECT TOP 15 o.*
FROM [dbo].[Orders] AS o

--Bài tập
--Lấy 5 sản phẩm đầu tiên trong bảng product p
--Đặt tên thay thế như sau
--ProductName -> Tên sản phẩm
--SupplierID -> Mã nhà cung cấp
--CategoryID -> Mã thể loại
SELECT TOP 5 p.ProductName AS [Tên sản phẩm], 
			 p.SupplierID AS [Mã nhà cung cấp] ,
			 p.CategoryID AS [Mã thể loại] 
FROM [dbo].[Products] AS [p]

--2 bài tự làm 
--lấy 15 "Mã nhà cung cấp" đầu tiên, "Địa chỉ", "Số điện thoại" từ bảng Suppliers s
SELECT TOP 15 s.[SupplierID] AS "Mã nhà cung cấp", 
			  s.[Address] AS "Địa chỉ", 
			  s.[Phone] AS "Số điện thoại"
FROM [dbo].[Suppliers] AS [s]

--Lấy 20 địa chỉ giao hàng và mã đơn hàng riêng biệt từ bảng Orders o
SELECT DISTINCT TOP 20 o.[ShipAddress] AS [Địa chỉ giao hàng],
			  o.[OrderID] AS [Mã đơn hàng]
FROM [dbo].[Orders] AS [o]