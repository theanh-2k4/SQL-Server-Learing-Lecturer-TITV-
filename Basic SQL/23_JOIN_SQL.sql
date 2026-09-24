USE NORTHWND
--INNER JOIN
--Lấy ra mã ,tên thể loại, mã, tên sản phẩm
SELECT C.CategoryID, C.CategoryName, P.ProductID, P.ProductName
FROM [dbo].[Categories] C
INNER JOIN [dbo].[Products] P
ON C.CategoryID = P.CategoryID

--Lấy ra mã, tên thể loại, số lượng sản phẩm
SELECT C.CategoryID, C.CategoryName, COUNT(P.ProductID) AS [TOTALPRODUCTS]
FROM [dbo].[Categories] C
INNER JOIN [dbo].[Products] P
ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID, C.CategoryName
--1ST ROW 1	Beverages	12

--Lấy ra mã đơn hàng, tên công ty khách hàng
SELECT O.OrderID, C.CompanyName
FROM [dbo].[Customers] C
JOIN [dbo].[Orders] O
ON C.CustomerID = O.CustomerID
--1ST ROW 10643	Alfreds Futterkiste

--LEFT JOIN
--Lấy ra mã ,tên thể loại, mã, tên sản phẩm
SELECT C.CategoryID, C.CategoryName, P.ProductID, P.ProductName
FROM [dbo].[Categories] C
INNER JOIN [dbo].[Products] P
ON C.CategoryID = P.CategoryID

SELECT C.CategoryID, C.CategoryName, P.ProductID, P.ProductName
FROM [dbo].[Categories] C
LEFT JOIN [dbo].[Products] P
ON C.CategoryID = P.CategoryID

--Lấy ra mã, tên thể loại, số lượng sản phẩm
SELECT C.CategoryID, C.CategoryName, COUNT(P.ProductID) AS [TOTALPRODUCTS]
FROM [dbo].[Categories] C
INNER JOIN [dbo].[Products] P
ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID, C.CategoryName

SELECT C.CategoryID, C.CategoryName, COUNT(P.ProductID) AS [TOTALPRODUCTS]
FROM [dbo].[Categories] C
LEFT JOIN [dbo].[Products] P
ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID, C.CategoryName

--RIGHT JOIN
--Lấy ra mã đơn hàng, tên công ty khách hàng
SELECT O.OrderID, C.CompanyName
FROM [dbo].[Orders] O
JOIN [dbo].[Customers] C
ON O.CustomerID = C.CustomerID

SELECT O.OrderID, C.CompanyName
FROM [dbo].[Orders] O
RIGHT JOIN [dbo].[Customers] C
ON O.CustomerID = C.CustomerID

--Lấy ra tổng số đơn hàng, tên công ty khách hàng
SELECT C.CompanyName, COUNT(O.OrderID)
FROM [dbo].[Orders] O
JOIN [dbo].[Customers] C
ON O.CustomerID = C.CustomerID
GROUP BY C.CompanyName
--89 rows

SELECT C.CompanyName, COUNT(O.OrderID)
FROM [dbo].[Orders] O
RIGHT JOIN [dbo].[Customers] C
ON O.CustomerID = C.CustomerID
GROUP BY C.CompanyName
--92 rows

--FULL OUTER JOIN
SELECT C.CategoryID, C.CategoryName, P.ProductID, P.ProductName
FROM [dbo].[Categories] C
FULL JOIN [dbo].[Products] P
ON C.CategoryID = P.CategoryID

--Bài tập
--1
--Liệt kê tên nhân viên và khách hàng của các đơn hàng trong bảng Orders
SELECT (E.LastName +' ' +E.FirstName) AS [FullName], C.ContactName, O.OrderID
FROM [dbo].[Employees] E
INNER JOIN [dbo].[Orders] O
ON E.EmployeeID = O.EmployeeID
INNER JOIN [dbo].[Customers] C
ON C.CustomerID = O.CustomerID
--1st row Buchanan Steven	Paul Henriot	10248

--2 
--Liệt kê tên nhà cung cấp, tên sản phẩm của nhà cung cấp đó, liệt kê cả sản phẩm không có nhà cung cấp
SELECT S.CompanyName, P.ProductName
FROM [dbo].[Products] P
LEFT JOIN [dbo].[Suppliers] S
ON S.SupplierID = P.SupplierID

--3 
--Liệt kê tên khách hàng và mã đơn hàng của các đơn trong bảng Orders, gồm cả những khách hàng không có đơn
SELECT C.ContactName, O.OrderID
FROM [dbo].[Orders] O
RIGHT JOIN [dbo].[Customers] C
ON O.CustomerID = C.CustomerID
--WHERE O.OrderID IS NULL -> Kiểm tra 

--4
--Liệt kê tên danh mục và tên nhà cung cấp các sp bảng Products, gồm cả danh mục và nhà cung cấp không có sp
SELECT C.CategoryName, S.CompanyName, p.ProductName
FROM [dbo].[Products] P
FULL JOIN [dbo].[Suppliers] S
ON P.SupplierID = S.SupplierID
FULL JOIN [dbo].[Categories] C
ON P.CategoryID = C.CategoryID
--WHERE C.CategoryName IS NULL OR S.CompanyName IS NULL

--Bài tự làm 
--Liệt kê tên khách hàng, mã đơn hàng và số tiền cần thanh toán của mỗi đơn,chưa tính giảm giá, lấy cả những khách hàng chưa có đơn hàng nào
SELECT C.ContactName, O.OrderID, SUM(OD.Quantity *OD.UnitPrice) AS [Total]
FROM [dbo].[Customers] C
FULL JOIN [dbo].[Orders] O
ON C.CustomerID = O.CustomerID
LEFT JOIN [dbo].[Order Details] OD
ON O.OrderID = OD.OrderID
GROUP BY C.ContactName, O.OrderID