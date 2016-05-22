--cross apply
--enable you to join a table to a table-valued function
--so the function is invoked for each row returned from the table.
USE AdventureWorks2008
GO
IF OBJECT_ID (N'fn_inventory', N'IF') IS NOT NULL
  DROP FUNCTION dbo.fn_inventory
GO
CREATE FUNCTION fn_inventory (@ProductID int)
RETURNS TABLE
AS
RETURN
(
  SELECT
    ProductID,
    LocationID,
    Quantity
  FROM
    Production.ProductInventory
  WHERE
    ProductID = @ProductID
)
GO


SELECT LocationID, Quantity
FROM fn_inventory(915)


--apply function for each row
SELECT
  p.ProductID,
  p.Name,
  fn.Quantity
FROM
  Production.Product AS p
CROSS APPLY
  fn_inventory(p.ProductID) AS fn
ORDER BY p.ProductID