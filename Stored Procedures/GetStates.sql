USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get all States
-- EXEC dbo.GetStates
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetStates
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            StateID,
            State
        FROM dbo.State
        ORDER BY State;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO