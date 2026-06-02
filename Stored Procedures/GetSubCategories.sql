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
-- Description: Get all Sub Categories
-- EXEC dbo.GetSubCategories
-- =============================================

CREATE PROCEDURE dbo.GetSubCategories
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        SubCategoryID,
        SubCategory
    FROM dbo.SubCategory
    ORDER BY SubCategory;
END
GO