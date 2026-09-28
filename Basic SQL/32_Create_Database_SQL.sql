CREATE DATABASE NVDB
ON
(	NAME = 'nvdb_data',
	FILENAME = 'C:\data\nvdb_data.mdf', --> có thể quy định vị trí cụ thể
	SIZE = 10MB, --> có thể quy định kích cỡ ban đầu
	MAXSIZE = 100MB, --> quy định kích cỡ tối đa
	FILEGROWTH = 5MB) --> kích cỡ tăng khi hết dung lượng
LOG ON
(	NAME = 'nvdb_log',
	FILENAME = 'C:\data\nvdb_log.ldf', 
	SIZE = 5MB, 
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB) 
