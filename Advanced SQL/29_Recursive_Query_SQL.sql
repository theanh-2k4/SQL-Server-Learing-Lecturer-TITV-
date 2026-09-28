use NORTHWND

--fibo
WITH fibo(prev_n, n) AS (
	--khoi tao 
	SELECT 
		0 AS prev_n,
		1 AS n
	UNION ALL
	--de quy
	SELECT 
		n AS prev_n,
		prev_n+n AS n
	FROM fibo
)
SELECT * FROM fibo
OPTION (MAXRECURSION 5);

--Giai thua
WITH giaiThua(stt, giaiThuaX) AS (
	--khoi tao 
	SELECT 
		1 AS stt,
		1 AS giaiThuaX
	UNION ALL
	--de quy
	SELECT 
		stt+1 AS stt,
		(stt+1)*giaiThuaX AS giaiThuaX
	FROM giaiThua
)
SELECT * FROM giaiThua
OPTION (MAXRECURSION 5);

--Lấy ra cấu trúc công ty từ bảng [dbo].[Employees]
declare @EmployeeId int
set @EmployeeId = 1;

WITH E_CTE AS (
	--khoi tao
	SELECT E.EmployeeID, 
			(E.FirstName +' ' + E.LastName) AS [Name],
			e.ReportsTo AS [ManagerId],
			0 as Level
	FROM [dbo].[Employees] E

	UNION ALL
	--de quy
	SELECT E1.EmployeeID, 
			(E1.FirstName +' ' + E1.LastName) AS [Name],
			E1.ReportsTo AS [ManagerId],
			Level+1 as Level
	FROM [dbo].[Employees] E1
	JOIN E_CTE ON E1.ReportsTo = E_CTE.EmployeeID
)
SELECT * FROM E_CTE
OPTION (MAXRECURSION 500);