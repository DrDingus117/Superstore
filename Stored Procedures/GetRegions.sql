USE Superstore
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/30/2026
-- Update date: 5/30/2026
-- Description: Get all Regions
-- EXEC dbo.GetRegions
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetRegions
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        RegionID,
        Region
    FROM dbo.Region
    ORDER BY Region;
END
GO