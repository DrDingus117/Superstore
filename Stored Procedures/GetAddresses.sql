USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get all Addresses
-- EXEC dbo.GetAddresses
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetAddresses
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            AddressID,
            AddressLine1,
            AddressLine2,
            City,
            StateID,
            CountryID,
            PostalCode,
            RegionID,
            AddressTypeID,
            CustomerID,
            CustomerKey,
            IsActive,
            DateCreated,
            DateUpdated
        FROM dbo.Address
        ORDER BY AddressID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO