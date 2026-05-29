USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get all Address Types
-- EXEC dbo.GetAddressTypes
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetAddressTypes
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            AddressTypeID,
            AddressType
        FROM dbo.AddressType
        ORDER BY AddressType;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO