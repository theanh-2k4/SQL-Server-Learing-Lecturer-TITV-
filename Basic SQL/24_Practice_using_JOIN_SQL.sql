USE NORTHWND
--1 Liệt kê tên sp và tên nhà cung cấp sản phẩm đã được bán trong Order Details
SELECT DISTINCT P.ProductName, S.CompanyName
FROM [dbo].[Order Details] OD
JOIN [dbo].[Products] P
ON P.ProductID = OD.ProductID
JOIN [dbo].[Suppliers] S
ON P.SupplierID = S.SupplierID
--77 rows

--Liệt kê tên khách hàng và tên nhân viên phụ trách đơn hàng
SELECT O.OrderID, C.ContactName, E.FirstName, E.LastName
FROM [dbo].[Orders] O
LEFT JOIN [dbo].[Employees] E
ON O.EmployeeID = E.EmployeeID
LEFT JOIN [dbo].[Customers] C
ON O.CustomerID = C.CustomerID
--830 rows

--Liệt kê tên khách hàng và tên nhân viên phụ trách đơn hàng, gồm cả khách không có đơn
SELECT O.OrderID, C.ContactName, E.FirstName, E.LastName
FROM [dbo].[Orders] O
RIGHT JOIN [dbo].[Employees] E
ON O.EmployeeID = E.EmployeeID
RIGHT JOIN [dbo].[Customers] C
ON O.CustomerID = C.CustomerID
--834 rows

----4 Liệt kê tên danh mục và tên nhà cung cấp sản phẩm 
SELECT DISTINCT P.ProductName, S.CompanyName, C.CategoryName
FROM [dbo].[Products] P
FULL JOIN [dbo].[Categories] C
ON P.CategoryID = C.CategoryID
FULL JOIN [dbo].[Suppliers] S
ON P.SupplierID = S.SupplierID
--80 rows

--5 Liệt kê tên khách hàng và tên sp đã được đặt trong bảng [dbo].[Orders], [dbo].[Order Details]
SELECT DISTINCT C.ContactName, P.ProductName
FROM [dbo].[Customers] C
JOIN [dbo].[Orders] O
ON O.CustomerID = C.CustomerID
JOIN [dbo].[Order Details] OD
ON OD.OrderID = O.OrderID
JOIN [dbo].[Products] P
ON P.ProductID = OD.ProductID
--1685 rows

--Liệt kê tên nhân viên và tên khách hàng của các đơn trong bảng Orders, gồm cả những đơn không có nhân viên hoặc khách tương ứng
SELECT (E.LastName +' ' +E.FirstName) AS [FullName], C.ContactName, O.OrderID
FROM [dbo].[Customers] C
LEFT JOIN [dbo].[Orders] O
ON O.CustomerID = C.CustomerID
RIGHT JOIN [dbo].[Employees] E
ON O.EmployeeID = E.EmployeeID
--830 rows
