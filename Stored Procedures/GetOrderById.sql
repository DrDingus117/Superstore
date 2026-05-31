USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/29/2026
-- Update date: 5/30/2026
-- Description: Get Order By ID
--
-- EXEC GetOrderById @OrderID = 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetOrderById
    @OrderID INT
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
        WHERE OrderID = @OrderID
            AND IsActive = 1;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO