USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/28/2026
-- Update date: 5/31/2026
-- Description: Get Address Types
--
-- EXEC GetAddressTypes
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
