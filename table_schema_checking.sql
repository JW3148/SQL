if OBJECT_ID('dbo.usp_GetSchemaChecksum','P') is not null
drop procedure dbo.usp_GetSchemaChecksum
go

create procedure dbo.usp_GetSchemaChecksum(
@db_name nvarchar(50),
@tb_name nvarchar(100),
@schema_checksum int out
) as
begin

declare @sqlstring nvarchar(4000)
set @sqlstring= 'select @schema_checksum = CHECKSUM_AGG(checksum(COLUMN_NAME,DATA_TYPE, CHARACTER_MAXIMUM_LENGTH,CHARACTER_OCTET_LENGTH,NUMERIC_PRECISION,NUMERIC_PRECISION_RADIX, NUMERIC_SCALE,COLLATION_NAME, COLUMN_DEFAULT, IS_NULLABLE))'+ char(13) + char(10)+
				'from '+@db_name+'.INFORMATION_SCHEMA.columns'+ char(13) + char(10) +
				'where table_name='''+@tb_name+''' and TABLE_SCHEMA=''dbo'''


/*
select @schema_checksum = CHECKSUM_AGG(checksum(COLUMN_NAME,DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH,NUMERIC_PRECISION,NUMERIC_PRECISION_RADIX, NUMERIC_SCALE,COLLATION_NAME, COLUMN_DEFAULT, IS_NULLABLE))
from syntaxreview.INFORMATION_SCHEMA.columns
where table_name='table1' and TABLE_SCHEMA='dbo'
*/

--print @sqlstring
exec sp_executesql @sqlstring ,N'@schema_checksum int OUTPUT', @schema_checksum OUTPUT

end
go




declare @schema_checksum int
exec dbo.usp_GetSchemaChecksum 'Adw2008R2','DimProduct', @schema_checksum output
select @schema_checksum

/*
1. build a permant table dbo. to store the static schema checksum, in act_definitiona
2. build  usp_GetSchemaChecksum to calculate checksum value for a table
3. usp_ValidTableSchema
   #table0 to get list of table transfered
   #table1 to store the calculated checksum for new copied table
   #table2 -- matching table
   #table3 -- filter unmatched

   if #table3 empty --> no issue
   if #table3 no empty --> schma changed, send the list of table by email




*/