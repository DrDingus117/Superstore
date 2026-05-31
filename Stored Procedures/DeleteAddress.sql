USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/23/2026
-- Update date: 5/30/2026
-- Description: Delete Address
--
-- EXEC DeleteAddress @AddressID = 1
-- =============================================

CREATE OR ALTER PROCEDURE dbo.DeleteAddress
    @AddressID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.Address
        SET
            IsActive = 0,
            DateUpdated = GETDATE()
        WHERE AddressID = @AddressID;

        SELECT
            'Address Deleted Successfully' AS Message;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO