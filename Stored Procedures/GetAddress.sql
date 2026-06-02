USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/21/2026
-- Update date: 5/30/2026
-- Description: Get Address
--
-- EXEC GetAddress @AddressID = 1
-- =============================================

CREATE PROCEDURE dbo.GetAddress
    @AddressID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT TOP 1
            a.AddressID,
            a.AddressLine1,
            a.AddressLine2,
            a.City,
            s.State,
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
            AND a.AddressID = @AddressID;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO
