use NORTHWND;

--Lấy 5 dòng đầu tiên của toàn bộ cột trong bảng customers
select top 5 *
from [dbo].[Customers]

--Lấy ra 30% nhân viên của công ty hiện tại (3 rows)
Select top 30 PERCENT *
FROM [dbo].[Employees]

--lấy 5 dòng mã khách hàng không trùng lặp đầu tiên
SELECT TOP 5 [CustomerID]
FROM [dbo].[Orders]
--5 dòng đầu tiên đều là ALFKI

SELECT DISTINCT TOP 5 [CustomerID]
FROM [dbo].[Orders]
--5 dòng mã khác nhau

--Bài tập
--Lấy 3 dòng đầu tiên các sản phẩm có mã thể loại không trùng lặp từ bảng Products
SELECT DISTINCT TOP 3 [ProductName], [CategoryID]
FROM [dbo].[Products]

--2 câu hỏi tự giải
--Truy vấn 30% số lượng mã khách hàng và địa chỉ thành phố khách hàng từ bảng Customers
SELECT TOP 30 PERCENT [CustomerID], [City]
FROM [dbo].[Customers]

--Lấy 20 địa chỉ giao hàng đầu tiên khác nhau từ bảng Orders
SELECT TOP 20 [ShipAddress]
FROM [dbo].[Orders]

SELECT DISTINCT TOP 20 [ShipAddress]
FROM [dbo].[Orders]