USE NORTHWND

DROP TABLE CUSTOMERS_1;

SELECT *
INTO CUSTOMERS_1
FROM [dbo].[Customers];

--Cập nhật địa chỉ của khách hàng có customerid=ALFKI
UPDATE [dbo].[CUSTOMERS_1]
SET [Address] = 'New Address'
WHERE [CustomerID] LIKE 'ALFKI';

--Tăng giá toàn bộ sản phẩm lên 10%
DROP TABLE PRODUCTS_1;
SELECT * 
INTO PRODUCTS_1
FROM [dbo].[Products];
---
UPDATE [dbo].[PRODUCTS_1]
SET [UnitPrice] = [UnitPrice]*1.1

--cập nhật thông tin cho sp có productid =7 đổi tên thành 'Máy tính xách tay mới'
--cập nhật giá bán thành 999.99$
UPDATE [dbo].[PRODUCTS_1]
SET [ProductName] = 'Máy tính xách tay mới', [UnitPrice] = 999.99
WHERE [ProductID] = 7;

--bài tập
--cập nhật thông tin khách hàng có thành phố là 'Paris'
--cập nhật quốc gia của họ thành 'PHÁP'
UPDATE [dbo].[CUSTOMERS_1]
SET [Country] = 'PHÁP'
WHERE [City] LIKE 'Paris';

--cập nhật  thông tin của một sản phẩm cụ thể trong bảng Products dựa trên tên sp, lấy ví dụ 'Chai'
UPDATE [dbo].[PRODUCTS_1]
SET [SupplierID] = 1, [CategoryID] = 2, [QuantityPerUnit] = '24perbottles', [UnitPrice] = 20,
	[UnitsInStock] = 100, [UnitsOnOrder] = 50, [ReorderLevel] = 2, [Discontinued] = 0
WHERE [ProductName] LIKE 'Chai';

SELECT *
FROM [dbo].[PRODUCTS_1]
WHERE [ProductName] LIKE 'Chai';