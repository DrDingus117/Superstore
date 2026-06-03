# How to Run

1. Open a terminal and navigate to the `api` folder.

2. Run `dotnet run` and give it a few minutes to start.

3. Open another terminal and navigate to the `front-end` folder.

4. Run `npm install` (or `npm i`) and wait for it to finish.

5. Run `npm start` and allow the application to load.

## Features

### Add Product

* Enter the product name.
* Enter a Category ID:

  * `1` = Furniture
  * `2` = Technology
  * `3` = Office Supplies
* Enter a SubCategory ID between `1` and `3`.
* Enter a price (for example, `2999.99`).
* Enter the inventory quantity.
* Enter a Product Key (for example, `Cat-Toy`).

### Edit Product

* Use this option to correct or update any product information.

### View Products

* Displays the product ID, name, category, price, and inventory quantity.

### Delete Product

* Click **Delete** and confirm by selecting **Yes** or **No**.
* If confirmed, the product will be removed from the list.

## Validation Rules

* Values below `1` (such as `0` or `-1`) are not allowed and will generate an error message.
* Extremely large values (such as `1,000,000` (a million)) will tell you no and to check the console.

# Superstore
This project consists of a Front-End written in React.JS, a back-end written in C#, and MS SQL Stored Procedures.

## Superstore API

### Address
- **GET** /api/addresses/{id}
- **POST** /api/addresses
- **PUT** /api/addresses/{id}
- **DELETE** /api/addresses/{id}

### Product
- **GET** /api/products
- **GET** /api/products/{id}
- **POST** /api/products
- **PUT** /api/products/{id}
- **DELETE** /api/products/{id}

### Customer
- **GET** /api/customers
- **GET** /api/customers/{id}
- **GET** /api/customers/{id}/addresses
- **GET** /api/customers/{id}/orders
- **POST** /api/customers
- **PUT** /api/customers/{id}
- **DELETE** /api/customers/{id}

### Order
- **GET** /api/orders
- **GET** /api/orders/{id}
- **GET** /api/orders/{id}/orderdetails
- **POST** /api/orders
- **PUT** /api/orders/{id}
- **DELETE** /api/orders/{id}

### AddressType (Lookup Table)
- **GET** /api/addresstypes

### Region (Lookup Table)
- **GET** /api/regions

### Segment (Lookup Table)
- **GET** /api/segments

### ShipMode (Lookup Table)
- **GET** /api/shipmodes

### Category (Lookup Table)
- **GET** /api/categories

### Country (Lookup Table)
- **GET** /api/countries

### State (Lookup Table)
- **GET** /api/states

### SubCategory (Lookup Table)
- **GET** /api/subcategories