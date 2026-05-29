USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 5/29/2026 2:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/28/2026
-- Update date: 5/7/2026
-- Description: Get all Products
-- EXEC GetProducts
-- =============================================

ALTER PROCEDURE [dbo].[GetProducts]
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
        WHERE p.IsActive = 1
        ORDER BY p.ProductID DESC;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
