USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 5/29/2026 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Marcus Pendleton
-- Create date: 5/7/2026
-- Description: Delete Product
--
-- EXEC DeleteProduct @ProductID = 1
-- =============================================

ALTER   PROCEDURE [dbo].[DeleteProduct]
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.Product
        SET
            IsActive = 0
        WHERE ProductID = @ProductID;

        SELECT
            'Product Deleted Successfully' AS Message;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_MESSAGE() AS ErrorMessage;

    END CATCH
END
