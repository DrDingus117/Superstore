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
-- Description: Get Order Details By Order ID
-- EXEC GetOrderDetails @OrderID = 1
-- =============================================

CREATE PROCEDURE dbo.GetOrderDetails
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            od.OrderID,
            od.ProductID,
            od.OrderKey,
            od.ProductKey
        FROM dbo.OrderDetail AS od
        WHERE od.OrderID = @OrderID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO