USE [Superstore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 4/28/2026
-- Update date: 5/30/2026
-- Description: Delete Product
--
-- EXEC DeleteProduct @ProductID = 1
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[DeleteProduct]
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE p
        SET
            p.IsActive = 0
        FROM dbo.Product AS p
        WHERE p.ProductID = @ProductID;

        IF @@ROWCOUNT > 0
        BEGIN
            SELECT
                'Product Deleted Successfully' AS Message;
        END
        ELSE
        BEGIN
            SELECT
                'Product Not Found' AS Message;
        END

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
GO