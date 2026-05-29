USE Superstore
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Update Address
-- =============================================

CREATE OR ALTER PROCEDURE dbo.UpdateAddress
    @AddressID INT,
    @AddressLine1 NVARCHAR(100),
    @AddressLine2 NVARCHAR(100),
    @City NVARCHAR(50),
    @StateID INT,
    @CountryID INT,
    @PostalCode INT,
    @RegionID INT,
    @AddressTypeID INT,
    @CustomerID INT,
    @CustomerKey NVARCHAR(50),
    @IsActive BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.Address
        SET
            AddressLine1 = @AddressLine1,
            AddressLine2 = @AddressLine2,
            City = @City,
            StateID = @StateID,
            CountryID = @CountryID,
            PostalCode = @PostalCode,
            RegionID = @RegionID,
            AddressTypeID = @AddressTypeID,
            CustomerID = @CustomerID,
            CustomerKey = @CustomerKey,
            IsActive = @IsActive,
            DateUpdated = GETDATE()
        WHERE AddressID = @AddressID;

    END TRY

    BEGIN CATCH

        SELECT ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO