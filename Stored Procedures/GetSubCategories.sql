USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get all SubCategories
-- EXEC GetSubCategories
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[GetSubCategories]
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            SubCategoryID,
            SubCategory
        FROM dbo.SubCategory
        ORDER BY SubCategory;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO