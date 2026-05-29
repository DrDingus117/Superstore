USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 5/29/2026 2:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Update Product
--
-- EXEC UpdateProduct
--      @ProductID = 1,
--      @ProductName = 'Updated Product',
--      @CategoryID = 1,
--      @SubCategoryID = 1,
--      @UnitPrice = 19.99,
--      @ProductKey = 'UP-100',
--      @Inventory = 50
-- =============================================

ALTER PROCEDURE [dbo].[UpdateProduct]
    @ProductID INT,
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

        UPDATE dbo.Product
        SET
            ProductName = @ProductName,
            CategoryID = @CategoryID,
            SubCategoryID = @SubCategoryID,
            UnitPrice = @UnitPrice,
            ProductKey = @ProductKey,
            Inventory = @Inventory
        WHERE ProductID = @ProductID;

        SELECT
            'Product Updated Successfully' AS Message;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
