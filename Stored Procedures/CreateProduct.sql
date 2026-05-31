USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 5/29/2026 2:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/28/2026
-- Update date: 5/30/2026
-- Description: Create Product
--
-- EXEC CreateProduct
--      @ProductName = 'Test Product',
--      @CategoryID = 1,
--      @SubCategoryID = 1,
--      @UnitPrice = 9.99,
--      @ProductKey = 'TP-100',
--      @Inventory = 25
-- =============================================

ALTER PROCEDURE [dbo].[CreateProduct]
    @ProductName NVARCHAR(100),
    @CategoryID INT,
    @SubCategoryID INT,
    @UnitPrice DECIMAL(18,2),
    @ProductKey NVARCHAR(50),
    @Inventory INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        INSERT INTO dbo.Product
        (
            ProductName,
            CategoryID,
            SubCategoryID,
            UnitPrice,
            ProductKey,
            Inventory,
            IsActive
        )
        VALUES
        (
            @ProductName,
            @CategoryID,
            @SubCategoryID,
            @UnitPrice,
            @ProductKey,
            @Inventory,
            1
        );

        SELECT
            SCOPE_IDENTITY() AS NewProductID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
