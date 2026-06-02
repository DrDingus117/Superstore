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
-- Description: Update Order
--
-- EXEC UpdateOrder
--      @OrderID = 1,
--      @OrderDate = GETDATE(),
--      @CustomerID = 1,
--      @SalesPrice = 100.00,
--      @Quantity = 2,
--      @Discount = 5.00,
--      @Profit = 20.00,
--      @ShipModeID = 1,
--      @ShipDate = GETDATE(),
--      @OrderKey = 'ORD-100',
--      @CustomerKey = 'CUST-100',
--      @IsActive = 1
-- =============================================

CREATE PROCEDURE dbo.UpdateOrder
    @OrderID INT,
    @OrderDate DATETIME,
    @CustomerID INT,
    @SalesPrice DECIMAL(18,2),
    @Quantity INT,
    @Discount DECIMAL(18,2),
    @Profit DECIMAL(18,2),
    @ShipModeID INT,
    @ShipDate DATETIME,
    @OrderKey NVARCHAR(50),
    @CustomerKey NVARCHAR(50),
    @IsActive BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.[Order]
        SET
            OrderDate = @OrderDate,
            CustomerID = @CustomerID,
            SalesPrice = @SalesPrice,
            Quantity = @Quantity,
            Discount = @Discount,
            Profit = @Profit,
            ShipModeID = @ShipModeID,
            ShipDate = @ShipDate,
            OrderKey = @OrderKey,
            CustomerKey = @CustomerKey,
            IsActive = @IsActive,
            DateUpdated = GETDATE()
        WHERE OrderID = @OrderID;

        SELECT
            'Order Updated Successfully' AS Message;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO