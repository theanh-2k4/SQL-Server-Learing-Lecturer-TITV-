use NORTHWND

SELECT *
INTO Customers_1
FROM [dbo].[Customers];

--xóa khách hàng có mã ALFKI
DELETE FROM Customer_1
WHERE [CustomerID] LIKE 'ALFKI';

SELECT *
FROM Customer_1
WHERE [CustomerID] LIKE 'ALFKI'


--Xóa toàn bộ khách hàng có quốc gia bắt đầu bằng U
SELECT DISTINCT [Country]
FROM [dbo].[Customer_1];

DELETE FROM Customer_1
WHERE [Country] LIKE 'U%';

--Xóa sạch 1 bảng
DELETE FROM Customer_1;

--DELETE FROM khác gì TRUNCATE

--bài tập 
--xóa 1 đơn hàng cụ thể dựa trên order_id, ví dụ với id =1
SELECT *
INTO ORDERS_1
FROM [dbo].[Orders];
---
DELETE FROM ORDERS_1
WHERE [OrderID] = 1;

--Xóa sản phẩm trong bảng Products có lượng tồn kho =0
SELECT *
INTO PRODUCTS_1
FROM [dbo].[Products];
---
DELETE FROM PRODUCTS_1
WHERE [UnitsInStock] = 0;
--6 rows 

--Xóa tất cả đơn hàng liên quan đên 1 khách hàng cụ thể dùng id khách hàng
SELECT *
INTO ORDER_DETAILS_1
FROM [dbo].[Order Details];

--cần phải xóa bảng ORDER_DETAILS_1 trước vì 2 bảng có quan hệ khóa ngoại
DELETE OD1 FROM ORDER_DETAILS_1 OD1
JOIN [dbo].[ORDERS_1] O1
ON O1.[OrderID] = OD1.[OrderID]
WHERE O1.[CustomerID] LIKE 'ALFKI';

DELETE FROM [dbo].[ORDERS_1]
WHERE [CustomerID] LIKE 'ALFKI';