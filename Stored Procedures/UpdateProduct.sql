USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/28/2026
-- Update date: 5/15/2026
-- Description: Update a Product
-- COALESCE is used to keep existing values when NULL is passed
-- CASE is used to handle multiple conditions for Quantity
-- EXEC UpdateProduct @ProductID = 1, @ProductName = 'New Product'
-- EXEC UpdateProduct @ProductID = 1, @ProductName = 'New Product', @CategoryID = 1,
-- EXEC UpdateProduct @ProductID = 1, @ProductName = 'New Product', @CategoryID = 1, @SubCategoryID = 1, @UnitPrice = 0.00, @Quantity = 10
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct]
    @ProductID INT,
    @ProductName NVARCHAR(150) = NULL,
    @CategoryID INT = NULL,
    @SubCategoryID INT = NULL,
    @UnitPrice DECIMAL(18,2) = NULL,
    @Quantity INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.Product
        SET 
            ProductName = COALESCE(@ProductName, ProductName),
            CategoryID = COALESCE(@CategoryID, CategoryID),
            SubCategoryID = COALESCE(@SubCategoryID, SubCategoryID),
            UnitPrice = COALESCE(@UnitPrice, UnitPrice),

            -- CASE handles multiple conditions (NULL or invalid values)
            Quantity =
                CASE
                    WHEN @Quantity IS NULL THEN Quantity
                    WHEN @Quantity < 0 THEN Quantity
                    ELSE @Quantity
                END

        WHERE ProductID = @ProductID;

    END TRY

    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;

END
GO