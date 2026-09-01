use NORTHWND;

--lấy tên tất cả sản phẩm (77 rows)
SELECT [ProductName]
FROM [dbo].[Products]

--Lấy tên sản phẩm, giá bán trên mỗi đơn vị, số lượng sản phẩm trên đơn vị (77 rows)
SELECT [ProductName], [UnitPrice], [QuantityPerUnit]
FROM [DBO].[Products]

--Lấy tên công ty khách hàng và quốc gia của khách hàng (91 rows)\
SELECT [CompanyName], [Country]
FROM [DBO].[Customers]

--Lấy tên và số điện thoại của tất cả các nhà cung cấp hàng (29 rows)
Select [CompanyName], [Phone] 
FROM [dbo].[Suppliers]

--Lấy tất cả dữ liệu từ bảng Products (77 rows)
Select * 
FROM [dbo].[Products]

--Lấy tất cả dữ liệu từ bảng Customers (91 rows)
SELECT *
FROM [DBO].[Customers]

--Lấy tất cả dữ liệu từ bảng Suppliers (29 rows)
SELECT * 
FROM [DBO].[Suppliers]

--2 câu hỏi luyện tập
--1. Lấy tên, thành phố và ngày thuê của nhân viên (9 rows)
SELECT [FirstName], [City], [HireDate]
FROM [DBO].[Employees]

--2. Lấy ngày đặt hàng và địa chỉ ship (830 rows)
SELECT [ORDERDATE], [ShipAddress]
FROM [DBO].[Orders]