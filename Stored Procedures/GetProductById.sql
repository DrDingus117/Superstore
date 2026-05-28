USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get Product By ID
-- EXEC GetProductById @ProductID = 1
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[GetProductById]
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            p.ProductID,
            p.ProductName,
            p.CategoryID,
            c.Category,
            p.SubCategoryID,
            sc.SubCategory,
            p.UnitPrice,
            p.ProductKey,
            p.Inventory
        FROM dbo.Product AS p
        INNER JOIN dbo.Category AS c
            ON p.CategoryID = c.CategoryID
        INNER JOIN dbo.SubCategory AS sc
            ON p.SubCategoryID = sc.SubCategoryID
        WHERE p.ProductID = @ProductID
            AND p.IsActive = 1;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO