USE [Superstore]
GO

CREATE OR ALTER PROCEDURE dbo.GetAddressTypes
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        AddressTypeID,
        AddressType
    FROM dbo.AddressType
    ORDER BY AddressType;
END
GO