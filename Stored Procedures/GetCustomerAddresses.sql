USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/26/2026
-- Update date: 5/30/2026
-- Description: Get all Addresses for Customer
--
-- EXEC GetCustomerAddresses @CustomerID = 1
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[GetCustomerAddresses]
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            a.AddressID,
            a.AddressLine1,
            a.AddressLine2,
            a.City,
            s.State,
            a.PostalCode,
            c.Country,
            r.Region,
            at.AddressType,
            a.CustomerID
        FROM dbo.Address AS a
        JOIN dbo.AddressType AS at
            ON a.AddressTypeID = at.AddressTypeID
        JOIN dbo.Country AS c
            ON a.CountryID = c.CountryID
        JOIN dbo.Region AS r
            ON a.RegionID = r.RegionID
        JOIN dbo.State AS s
            ON a.StateID = s.StateID
        WHERE a.IsActive = 1
            AND a.CustomerID = @CustomerID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO