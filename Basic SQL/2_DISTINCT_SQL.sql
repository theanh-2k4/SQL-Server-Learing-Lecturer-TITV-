use NORTHWND;

--Select distinct lấy ra các dữ liệu không trùng lặp

--Lấy ra các country khác nhau từ bảng Customers dùng Distinct (21 rows) không dùng Distinct (91 rows)
--Select distinct countries from the Customers table using DISTINCT (21 rows), without DISTINCT (91 rows).
SELECT [COUNTRY]
FROM [DBO].[Customers]

SELECT DISTINCT [COUNTRY]
FROM [DBO].[Customers]

--Lấy mã số bưu điện (postalcode) khác nhau từ bảng nhà cung cấp Suppliers
Select [PostalCode]
from [dbo].[Suppliers]
--29 rows

Select Distinct [PostalCode]
from [dbo].[Suppliers]
--29 rows

--Lấy dữ liệu khác nhau về Lastname và TitleofCourtesy từ bảng nhân viên Employees (9rows)
--Extract distinct LastName and TitleOfCourtesy data from the Employees table (9 rows)
Select Distinct [LastName], [TitleOfCourtesy]
From [dbo].[Employees]

--Bài tập
--Lấy mã đơn vị vận chuyển ShipVia khác nhau của các đơn hàng Orders (3 rows)
Select distinct [ShipVia]
From [dbo].[Orders]

--2 câu hỏi tự nghĩ 
--Lấy địa chỉ vận chuyển hàng riêng biệt của các đơn hàng Orders
Select distinct [ShipAddress]
from [dbo].[Orders]
--89 rows

Select [ShipAddress]
from [dbo].[Orders]
--830 rows

--Lấy riêng biệt địa chỉ thành phố City từ bảng Customers 69 rows
Select Distinct [City]
From [dbo].[Customers]