USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Delete Order
-- EXEC dbo.DeleteOrder 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.DeleteOrder
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        DELETE
        FROM dbo.[Order]
        WHERE OrderID = @OrderID;

    END TRY

    BEGIN CATCH

        SELECT ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO