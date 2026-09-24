use NORTHWND

--Lọc ra những khách hàng đến từ quốc gia bắt đầu từ 'A'
SELECT *
FROM [dbo].[Customers]
WHERE [Country] LIKE 'A%'
--5 rows

--Lấy danh sách đơn hàng được gửi đến thành phố có chữ a
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE '%a%'
--491 rows

----Lấy danh sách đơn hàng có điều kiện 
-- [ShipCountry] LIKE 'U_'
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'U_'
--56 rows ,1 _ dại diện cho lấy ra 1 kí tự 

-- [ShipCountry] LIKE 'U%'
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'U%'
--178 rows, miễn bắt dầu bằng kí tự U

--Bài tập
--Lấy ra nhà cung cấp có chữ b trong tên 
SELECT *
FROM [dbo].[Suppliers]
WHERE [CompanyName] LIKE '%b%'
-- 12 rows

--2 bài tự làm 
--Liệt kê các sản phẩm bắt đầu bằng chữ A có giá bán từ thấp đến cao có mã thể lọai khác 1
SELECT *
FROM [dbo].[Products]
WHERE [ProductName] LIKE 'A%' AND [CategoryID] <> 1
ORDER BY [UnitPrice] ASC
--2 rows 

--Liệt kê những nhân viên không có chữ 'i' trong tên riêng và đến từ London
SELECT *
FROM [dbo].[Employees]
WHERE NOT [FirstName] LIKE '%i%' AND [City] = 'London'
--3 rows