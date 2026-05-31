USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/14/2026
-- Update date: 5/30/2026
-- Description: Delete Order
--
-- EXEC DeleteOrder @OrderID = 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.DeleteOrder
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.[Order]
        SET
            IsActive = 0,
            DateUpdated = GETDATE()
        WHERE OrderID = @OrderID;

        SELECT
            'Order Deleted Successfully' AS Message;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO