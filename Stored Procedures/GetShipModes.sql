USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get all Ship Modes
-- EXEC dbo.GetShipModes
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetShipModes
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            ShipModeID,
            ShipMode
        FROM dbo.ShipMode
        ORDER BY ShipMode;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO