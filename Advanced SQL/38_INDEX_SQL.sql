USE AdventureWorks2022;

SELECT *
FROM [Sales].[SalesOrderDetail];
--121 317 rows

--bật hiển thị thống kê
SET STATISTICS IO ON;

SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE [CarrierTrackingNumber]='1B2B-492F-A9';

SET STATISTICS IO OFF;
--logical reads 1238

--Tạo INDEX cho [CarrierTrackingNumber]
CREATE INDEX idx_CarrierTrackingNumber
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber]);

--logical reads 69, sau khi tạo index, tốc độ tăng 17 lần

--bài tập 
--tạo index trên bảng [Person].[Address] cột [AddressLine1] và đánh giá hiệu xuất truy vấn
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM [Person].[Address] --19,614 rows
WHERE [AddressLine1] LIKE '5175 Elm Rd.';

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
--logical reads 8
--tạo index 
CREATE INDEX idx_AddressLine1
ON [Person].[Address] ([AddressLine1]);
--truy vấn sau tạo index
--logical reads 8
--trong lần truy vấn này dùng INDEX không cải thiện tốc độ truy vấn

--làm tương tự với cột [Name] của [Production].[Product] và đánh giá hiệu xuất
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM  [Production].[Product]--504 rows
WHERE [Name] LIKE 'Adjustable Race';

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
--trước khi tạo index
--Scan count 1, logical reads 4, physical reads 2
CREATE INDEX idx_Name 
ON [Production].[Product] ([Name]);
--sau khi tạo index
--Scan count 1, logical reads 4, physical reads 0
--trong lần truy vấn này dùng INDEX không cải thiện tốc độ truy vấn
--dùng index trong 1 table nhỏ không tối ưu trên tập dữ liệu nhỏ 