USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/30/2026
-- Update date: 5/30/2026
-- Description: Add Order
--
-- EXEC AddOrder
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

CREATE PROCEDURE dbo.AddOrder
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

        INSERT INTO dbo.[Order]
        (
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
        )
        VALUES
        (
            @OrderDate,
            @CustomerID,
            @SalesPrice,
            @Quantity,
            @Discount,
            @Profit,
            @ShipModeID,
            @ShipDate,
            @OrderKey,
            @CustomerKey,
            @IsActive,
            GETDATE(),
            GETDATE()
        );

        SELECT
            SCOPE_IDENTITY() AS NewOrderID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO