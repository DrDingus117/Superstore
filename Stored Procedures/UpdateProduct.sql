USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/28/2026
-- Update date: 5/30/2026
-- Description: Update Product

-- EXEC UpdateProduct
--      @ProductID = 1,
--      @ProductName = 'Updated Product',
--      @CategoryID = 1,
--      @SubCategoryID = 1,
--      @UnitPrice = 19.99,
--      @ProductKey = 'UP-100',
--      @Inventory = 50
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[UpdateProduct]
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

```
BEGIN TRY

    UPDATE p
    SET
        p.ProductName = @ProductName,
        p.CategoryID = @CategoryID,
        p.SubCategoryID = @SubCategoryID,
        p.UnitPrice = @UnitPrice,
        p.ProductKey = @ProductKey,
        p.Inventory = @Inventory
    FROM dbo.Product AS p
    WHERE p.ProductID = @ProductID;

    IF @@ROWCOUNT > 0
    BEGIN
        SELECT
            'Product Updated Successfully' AS Message;
    END
    ELSE
    BEGIN
        SELECT
            'Product Not Found' AS Message;
    END

END TRY

BEGIN CATCH

    SELECT
        ERROR_MESSAGE() AS ErrorMessage;

END CATCH
```

END
GO
