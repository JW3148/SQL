
IF OBJECT_ID('dbo.usp_newsproc', 'P') IS NOT NULL
DROP PROCEDURE dbo.usp_newsproc;
GO

CREATE PROCEDURE dbo.usp_newsproc
  @a INT,
  @b INT,
  @c INT OUTPUT
AS
BEGIN
  BEGIN TRY
    BEGIN TRANSACTION;
      
	  /*
	  SQL STATEMENT
	  */
	  set @c=@a/@b



    COMMIT TRANSACTION;
  END TRY

  BEGIN CATCH
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;

    DECLARE @ErrorNumber INT = ERROR_NUMBER();
    DECLARE @ErrorLine INT = ERROR_LINE();
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();

    PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
    PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

	--THROW;
  END CATCH
END;
GO


DECLARE @catcher INT
EXEC usp_newsproc @a=4,@b=0,@c=@catcher out
print @catcher