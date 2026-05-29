USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Get Address By ID
-- EXEC dbo.GetAddressById 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.GetAddressById
    @AddressID INT
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
        WHERE AddressID = @AddressID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO