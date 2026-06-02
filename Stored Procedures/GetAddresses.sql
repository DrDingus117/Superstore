USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/28/2026
-- Update date: 5/30/2026
-- Description: Get all Addresses
--
-- EXEC GetAddresses
-- =============================================

CREATE PROCEDURE dbo.GetAddresses
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            a.AddressID,
            a.AddressLine1,
            a.AddressLine2,
            a.City,
            a.StateID,
            s.State,
            a.CountryID,
            c.Country,
            a.PostalCode,
            a.RegionID,
            r.Region,
            a.AddressTypeID,
            at.AddressType,
            a.CustomerID,
            a.CustomerKey,
            a.IsActive,
            a.DateCreated,
            a.DateUpdated
        FROM dbo.Address AS a
        LEFT JOIN dbo.State AS s
            ON a.StateID = s.StateID
        LEFT JOIN dbo.Country AS c
            ON a.CountryID = c.CountryID
        LEFT JOIN dbo.Region AS r
            ON a.RegionID = r.RegionID
        LEFT JOIN dbo.AddressType AS at
            ON a.AddressTypeID = at.AddressTypeID
        WHERE a.IsActive = 1
        ORDER BY a.AddressID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO