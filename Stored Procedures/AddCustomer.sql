USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Add Customer
-- =============================================

CREATE OR ALTER PROCEDURE dbo.AddCustomer
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @SegmentID INT,
    @CustomerKey NVARCHAR(50),
    @IsActive BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        INSERT INTO dbo.Customer
        (
            FirstName,
            LastName,
            SegmentID,
            CustomerKey,
            IsActive,
            DateCreated,
            DateUpdated
        )
        VALUES
        (
            @FirstName,
            @LastName,
            @SegmentID,
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