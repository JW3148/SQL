CREATE TYPE DeptType AS TABLE
(
DeptId INT, DeptName VARCHAR(30)
);


CREATE PROCEDURE InsertDepartment
@InsertDept_TVP DeptType READONLY
AS

SELECT * FROM @InsertDept_TVP;

GO

declare @DepartmentTVP deptType
EXEC InsertDepartment @DepartmentTVP;
GO