-- EXEC CreateAddress @AddressLine1 = '123 Main St', @AddressLine2 = 'Apt 4', @City = 'Anytown', @StateID = 1, CountryID = 1, @PostalCode = 12345, @RegionID = 1, @AddressTypeID = 1, @CustomerID = 1, @CustomerID = 1

-- EXEC CreateCustomer @FirstName = 'Marcus', @LastName = 'Pendleton', @SegmentID = 1

-- EXEC CreateProduct @ProductName = 'New Product', @CategoryID = 1, @SubCategoryID = 1, @UnitPrice = 0.00, @Quantity = 10

-- EXEC DeleteAddress @CustomerID = 1
-- EXEC DeleteAddress @CustomerID = 1, @Delete = 1

-- EXEC DeleteCustomer @CustomerID = 1

-- EXEC DeleteOrder @OrderID = 1
-- EXEC DeleteOrder @OrderID = 1, @Delete = 1

-- EXEC DeleteOrderDetail @OrderID = 1

-- EXEC DeleteProduct @ProductID = 1
-- EXEC DeleteProduct @ProductID = 1, @Delete = 1

-- EXEC GetAddress @AddressID = 1

-- EXEC GetAllAddresses @CustomerID = 1

-- EXEC GetAllCustomers

-- EXEC GetCustomer @CustomerID = 1

-- EXEC GetProduct @ProductID = 1

-- EXEC GetProducts

-- EXEC UpdateAddress @AddressID = 1
-- EXEC UpdateAddress @AddressID = 1, @AddressLine1 = '123 Main St', @AddressLine2 = 'Apt 4', @City = 'Anytown', @StateID = 1, CountryID = 1, @PostalCode = 12345, @RegionID = 1, @AddressTypeID = 1, @CustomerID = 1, @CustomerID = 1

-- EXEC UpdateCustomer @CustomerID = 1
-- EXEC UpdateCustomer @FirstName = 'Marcus', @LastName = 'Pendleton', @SegmentID = 1, @CustomerID = 

-- EXEC UpdateProduct @ProductID = 1, @ProductName = 'New Product'
-- EXEC UpdateProduct @ProductID = 1, @ProductName = 'New Product', @CategoryID = 1,
-- EXEC UpdateProduct @ProductID = 1, @ProductName = 'New Product', @CategoryID = 1, @SubCategoryID = 1, @UnitPrice = 0.00, @Quantity = 10

-- EXEC GetAllCategories

-- EXEC GetAllSubCategories

--EXEC GetAllCategories @CategoryID = 1, @SubCategoryID = 1
