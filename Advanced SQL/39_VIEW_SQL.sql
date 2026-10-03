USE NORTHWND;

CREATE VIEW ThongKeTheoThang AS
SELECT 
	YEAR([OrderDate]) AS 'Năm',
	MONTH([OrderDate]) AS 'Tháng',
	COUNT([OrderID]) AS 'Số lương đơn hàng'
FROM [dbo].[Orders]
GROUP BY YEAR([OrderDate]), MONTH([OrderDate]);

--Truy vấn trên VIEW
SELECT * FROM [dbo].[ThongKeTheoThang];
--tương đương
SELECT * FROM (
	SELECT 
	YEAR([OrderDate]) AS 'Năm',
	MONTH([OrderDate]) AS 'Tháng',
	COUNT([OrderID]) AS 'Số lương đơn hàng'
	FROM [dbo].[Orders]
	GROUP BY YEAR([OrderDate]), MONTH([OrderDate])
) AS Temp;

--tạo VIEW kết hợp giữa 2 bảng [dbo].[Orders] và [dbo].[Customers]
CREATE VIEW CustomerOrders AS 
SELECT 
	C.CustomerID,
	C.ContactName,
	C.CompanyName,
	O.OrderID,
	O.OrderDate,
	O.ShipCountry
FROM [dbo].[Customers] C
JOIN [dbo].[Orders] O
ON O.CustomerID = C.CustomerID;

--Tạo view hiển thị tổng giá trị đơn hàng và id khách hàng
CREATE VIEW OrderTotalValue AS
SELECT 
	O.OrderID,
	O.CustomerID,
	SUM(OD.Quantity *(OD.UnitPrice -(OD.UnitPrice * OD.Discount))) AS OrderTotalValue
FROM [dbo].[Orders] O 
JOIN [dbo].[Order Details] OD 
ON O.OrderID = OD.OrderID
GROUP BY O.OrderID, O.CustomerID;

--bài tập
--tạo VIEW HighValueProducts hiển thi danh sach các sản phẩm cao hơn 50$
DROP VIEW HighValueProducts;
----
CREATE VIEW HighValueProducts AS
SELECT P.ProductID, P.ProductName, P.CategoryID, P.UnitPrice
FROM [dbo].[Products] P
WHERE P.UnitPrice > 50;
--7 rows

--CustomerOrders hiển thị thông tin khách hàng  và số đơn hàng của họ
DROP VIEW CustomerOrders;
----
CREATE VIEW CustomerOrders AS 
SELECT 
	C.CustomerID,
	C.ContactName,
	C.CompanyName,
	COUNT(O.OrderID) AS [TotalOrders]
FROM [dbo].[Customers] C
JOIN [dbo].[Orders] O
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.ContactName, C.CompanyName;

--EmployeeSalesByYear hiển thị danh số bán hàng của từng nhân viên theo năm
CREATE VIEW EmployeeSalesByYear AS 
WITH SalesByYear AS (
	SELECT 
		O.EmployeeID, 
		YEAR(O.OrderDate) AS OrderYear,
		SUM(OD.Quantity *(OD.UnitPrice -(OD.UnitPrice * OD.Discount))) AS OrderTotalValue
	FROM [dbo].[Orders] O
	JOIN [dbo].[Order Details] OD
	ON O.OrderID = OD.OrderID
	GROUP BY O.EmployeeID, YEAR(O.OrderDate)
) 
SELECT 
	E.EmployeeID,
	(E.LastName + E.FirstName ) AS [FullName],
	SY.OrderYear,
	SY.OrderTotalValue
FROM [dbo].[Employees] E
JOIN SalesByYear SY
ON SY.EmployeeID = E.EmployeeID;

--CategoryProductCounts để hiển thị số lượng sản phẩm trong danh mục sản phẩm
CREATE VIEW CategoryProductCounts AS
SELECT P.CategoryID, C.CategoryName, COUNT(P.ProductID) AS [TotalProducts]
FROM [dbo].[Products] P
JOIN [dbo].[Categories] C
ON P.CategoryID = C.CategoryID
GROUP BY P.CategoryID, C.CategoryName;

--CustomerOrderSummary hiển thị tổng giá trị đơn hàng của mỗi khách hàng
CREATE VIEW CustomerOrderSummary AS
WITH OrderTotalValue AS (
	SELECT 
		O.CustomerID, 
		SUM(OD.Quantity *(OD.UnitPrice -(OD.UnitPrice * OD.Discount))) AS OrderTotalValue
	FROM [dbo].[Orders] O
	JOIN [dbo].[Order Details] OD
	ON O.OrderID = OD.OrderID
	GROUP BY O.CustomerID
) 
SELECT 
	C.CustomerID,
	C.ContactName,
	C.CompanyName,
	OTV.OrderTotalValue
FROM [dbo].[Customers] C
JOIN OrderTotalValue OTV
ON C.CustomerID = OTV.CustomerID;



