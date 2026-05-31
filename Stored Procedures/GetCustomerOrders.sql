USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/28/2026
-- Update date: 5/30/2026
-- Description: Get Orders for a Customer
--
-- EXEC GetCustomerOrders @CustomerID = 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetCustomerOrders
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            OrderID,
            OrderDate,
            CustomerID,
            SalesPrice,
            Quantity,
            Discount,
            Profit,
            ShipModeID,
            ShipDate,
            OrderKey,
            CustomerKey,
            IsActive,
            DateCreated,
            DateUpdated
        FROM dbo.[Order]
        WHERE CustomerID = @CustomerID
            AND IsActive = 1
        ORDER BY OrderDate DESC;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO