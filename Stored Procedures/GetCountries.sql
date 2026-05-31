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
-- Description: Get all Countries
-- EXEC dbo.GetCountries
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetCountries
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CountryID,
        Country
    FROM dbo.Country
    ORDER BY Country;
END
GO