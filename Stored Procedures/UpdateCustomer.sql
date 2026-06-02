USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/16/2026
-- Update date: 5/30/2026
-- Description: Update Customer
--
-- EXEC UpdateCustomer
--      @CustomerID = 1,
--      @FirstName = 'Marcus',
--      @LastName = 'Pendleton',
--      @SegmentID = 1,
--      @CustomerKey = 'CUST-100',
--      @IsActive = 1
-- =============================================

CREATE PROCEDURE dbo.UpdateCustomer
    @CustomerID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @SegmentID INT,
    @CustomerKey NVARCHAR(50),
    @IsActive BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE c
        SET
            c.FirstName = @FirstName,
            c.LastName = @LastName,
            c.SegmentID = @SegmentID,
            c.CustomerKey = @CustomerKey,
            c.IsActive = @IsActive,
            c.DateUpdated = GETDATE()
        FROM dbo.Customer AS c
        WHERE c.CustomerID = @CustomerID;

        IF @@ROWCOUNT > 0
        BEGIN
            SELECT
                'Customer Updated Successfully' AS Message;
        END
        ELSE
        BEGIN
            SELECT
                'Customer Not Found' AS Message;
        END

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO