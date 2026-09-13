use NORTHWND;

--Lấy ra tất cả khách hàng có tên liên hệ bắt đầu bằng chữ A
SELECT *
FROM [dbo].[Customers]
WHERE [ContactName] LIKE 'A%'
--10 rows

--Lấy ra các khách hàng có tên bắt đầu thành H và kí tự thứ 2 bất kì
SELECT *
FROM [dbo].[Customers]
WHERE [ContactName] LIKE 'H_%'
--7 rows

--Lấy các đơn hàng gửi đến thành phố bắt đầu từ L thứ 2 là u hoặc o
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'L[u,o]%'
--51 rows

--Lấy các đơn hàng gửi đến thành phố bắt đầu từ L nhưng kí tự thứ 2 không phải là u hoặc o
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'L[^u,o]%'
--42 rows

--Lấy các đơn hàng gửi đến thành phố bắt đầu từ L nhưng kí tự thứ 2 có thể bắt đầu từ a - e
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'L[a-e]%'
--14 rows

--bài tập
--Lấy ra khách hàng có tên công ty bắt đầu bằng kí tự A không chứa kí tự b
SELECT *
FROM [dbo].[Customers]
WHERE [CompanyName] LIKE 'A%[^b]%'
--4 rows

--2 câu tự làm
--Lấy ra 10 sản phẩm trong bảng product có chữ a trong tên nhưng không có chữ kế tiếp là e, sắp xếp theo giá từ thấp đến cao
SELECT TOP 10 [ProductName], 
[UnitPrice]
FROM [dbo].[Products]
WHERE [ProductName] LIKE '%a[^e]%'
ORDER BY [UnitPrice] ASC
--10 rows

--Láy các đơn có [ShipCity] bắt đầu từ A và kết thúc trong khoản từ b - n
SELECT [OrderID],
[ShipCity]
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'A%[b-n]'
--34 rows