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
-- Description: Get all Segments
-- EXEC dbo.GetSegments
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetSegments
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        SegmentID,
        Segment
    FROM dbo.Segment
    ORDER BY Segment;
END
GO