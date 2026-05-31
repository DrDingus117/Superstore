USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/21/2026
-- Update date: 5/30/2026
-- Description: Get all Categories
-- EXEC dbo.GetCategories
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetCategories
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            CategoryID,
            Category
        FROM dbo.Category
        ORDER BY Category;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO