USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get Customer By ID
-- EXEC dbo.GetCustomerById 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetCustomerById
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            CustomerID,
            FirstName,
            LastName,
            SegmentID,
            CustomerKey,
            IsActive,
            DateCreated,
            DateUpdated
        FROM dbo.Customer
        WHERE CustomerID = @CustomerID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO