USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/16/2026
-- Update date: 5/30/2026
-- Description: Delete Customer
-- EXEC DeleteCustomer @CustomerID = 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.DeleteCustomer
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE c
        SET
            c.IsActive = 0,
            c.DateUpdated = GETDATE()
        FROM dbo.Customer AS c
        WHERE c.CustomerID = @CustomerID;

        IF @@ROWCOUNT > 0
        BEGIN
            SELECT
                'Customer Deleted Successfully' AS Message;
        END
        ELSE
        BEGIN
            SELECT
                'Customer Not Found' AS Message;
        END

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO