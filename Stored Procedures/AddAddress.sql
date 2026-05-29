USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Add Address
-- =============================================

CREATE OR ALTER PROCEDURE dbo.AddAddress
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

        INSERT INTO dbo.Address
        (
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
        )
        VALUES
        (
            @AddressLine1,
            @AddressLine2,
            @City,
            @StateID,
            @CountryID,
            @PostalCode,
            @RegionID,
            @AddressTypeID,
            @CustomerID,
            @CustomerKey,
            @IsActive,
            GETDATE(),
            GETDATE()
        );

    END TRY

    BEGIN CATCH

        SELECT ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO