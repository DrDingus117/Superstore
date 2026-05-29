USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get all Customers
-- EXEC dbo.GetCustomers
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetCustomers
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
        ORDER BY LastName, FirstName;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO