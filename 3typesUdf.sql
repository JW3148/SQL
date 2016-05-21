--scalar
--table valued a.inline b.multi-statement

--Scalar

CREATE FUNCTION AddTwoNumbers
(
@a int,
@b int
)
RETURNS int
AS
BEGIN
RETURN @a + @b
END
go;
--Returns[type]+Return[output] sturcture
--Must have schema name when being called

--Inline Table valued udf
CREATE FUNCTION Sales.ufn_CustomerNamesInRegion
                 ( @Region nvarchar(50) )
RETURNS table
AS
RETURN (
        SELECT DISTINCT s.Name AS Store, a.City
        FROM Sales.Store AS s
        WHERE sp.Name = @Region
       );
GO

--Multi-Line table valued, can have multiple sql statement
CREATE FUNCTION GetAuthorsByState
( @state char(2) )
RETURNS
@AuthorsByState table (
au_id Varchar(11),
au_fname Varchar(20)
)
AS
BEGIN
 
INSERT INTO @AuthorsByState
SELECT  au_id,
au_fname
FROM Authors
WHERE state = @state
 
IF @@ROWCOUNT = 0
BEGIN
INSERT INTO @AuthorsByState
VALUES ('','No Authors Found')
END
 
RETURN
END

--Can have multiple sql statement
--Returns[table variable, structure]+ return
