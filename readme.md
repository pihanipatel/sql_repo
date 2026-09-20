# SQL Database Project

## 📌 Project Overview

This project demonstrates fundamental SQL operations using MySQL. The SQL script creates and works with four main tables:

- `Customers_table` — stores customer information.
- `Orders_table` — stores order information and order amounts.
- `Products_table` — stores products, prices, and stock.
- `Orderdetails_table` — stores details of products included in orders.

The project demonstrates database creation, inserting records, retrieving records, updating records, deleting records, filtering, sorting, aggregate functions, and limiting query results.

> **Source:** This README is based on the provided `project_1.sql` file.

---

## 🗂️ Database Flow Chart

```text
                         ┌─────────────────────┐
                         │   SQL DATABASE      │
                         │      PROJECT        │
                         └──────────┬──────────┘
                                    │
             ┌──────────────────────┼──────────────────────┐
             │                      │                      │
             ▼                      ▼                      ▼
   ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
   │ Customers_table │    │  Orders_table   │    │ Products_table  │
   ├─────────────────┤    ├─────────────────┤    ├─────────────────┤
   │ CustomerID      │    │ OrderID         │    │ productID       │
   │ Name            │    │ CustomerID      │    │ productName     │
   │ Email           │    │ OrderDate       │    │ price           │
   │ Address         │    │ TotalAmount     │    │ stock           │
   └────────┬────────┘    └────────┬────────┘    └────────┬────────┘
            │                      │                      │
            │                      │                      │
            └──────────────────────┼──────────────────────┘
                                   │
                                   ▼
                       ┌─────────────────────┐
                       │ Orderdetails_table  │
                       ├─────────────────────┤
                       │ OrderdetailID       │
                       │ OrderID             │
                       │ ProductID           │
                       │ Quantity            │
                       │ SubTotal            │
                       └─────────────────────┘
```

### ⚠️ Relationship Note

The provided SQL defines ID columns in the tables, but it does **not** declare explicit `FOREIGN KEY` constraints between the tables. Therefore, the diagram above represents the intended data relationship based on the column names rather than enforced MySQL foreign-key relationships.

---

## 1. 👤 Customers Table

### Structure

`Customers_table` contains:

| Column | Type | Purpose |
|---|---|---|
| CustomerID | INT | Customer identifier / primary key |
| Name | VARCHAR(50) | Customer name |
| Email | VARCHAR(50) | Customer email |
| Address | VARCHAR(100) | Customer address |

### Operations performed

- Drops the table if it already exists.
- Creates the customer table.
- Inserts 5 customer records.
- Displays all customers.
- Updates the address of customer `2`.
- Deletes customer `3`.
- Searches for the customer named `alice`.

---

## 2. 🛒 Orders Table

### Structure

`Orders_table` contains:

| Column | Type | Purpose |
|---|---|---|
| OrderID | INT | Order identifier / primary key |
| CustomerID | INT | Customer associated with the order |
| OrderDate | DATE | Date of the order |
| TotalAmount | DECIMAL(10,2) | Total order amount |

### Operations performed

- Drops and recreates the table.
- Inserts 5 orders.
- Displays all orders.
- Updates `TotalAmount`.
- Deletes order `4`.
- Searches for orders from the last 30 days using `CURDATE()`.
- Calculates maximum, average, and minimum order amounts.

### Aggregate calculation

```sql
SELECT
    MAX(TotalAmount) AS highest_amount,
    AVG(TotalAmount) AS average_amount,
    MIN(TotalAmount) AS lowest_amount
FROM Orders_table;
```

---

## 3. 📦 Products Table

### Structure

`Products_table` contains:

| Column | Type | Purpose |
|---|---|---|
| productID | INT | Product identifier |
| productName | VARCHAR(50) | Product name |
| price | INT | Product price |
| stock | INT | Available stock |

### Operations performed

- Drops and recreates the products table.
- Inserts 5 products.
- Displays products ordered by price in descending order.
- Updates the price of product `4`.
- Deletes products where stock is `0`.
- Filters products using an `OR` condition.
- Finds the highest and lowest product prices.

---

## 4. 📋 Order Details Table

### Structure

`Orderdetails_table` contains:

| Column | Type | Purpose |
|---|---|---|
| OrderdetailID | INT | Order-detail identifier / primary key |
| OrderID | INT | Order identifier |
| ProductID | INT | Product identifier |
| Quantity | INT | Quantity in the order |
| SubTotal | INT | Subtotal value |

### Operations performed

- Drops and recreates the table.
- Inserts 5 order-detail records.
- Displays all records.
- Calculates a total using `Quantity * SubTotal`.
- Displays the first 3 records using `LIMIT`.
- Counts records with `COUNT(*)`.

---

## 🔄 SQL Operations Demonstrated

```text
CREATE
  │
  ▼
INSERT ───────► SELECT
  │               │
  ▼               ▼
UPDATE         FILTER / SORT
  │               │
  └──────► DELETE ◄┘
              │
              ▼
       AGGREGATE FUNCTIONS
       MAX / MIN / AVG / SUM / COUNT
```

The project therefore covers the following SQL concepts:

- `DROP TABLE IF EXISTS`
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `UPDATE`
- `DELETE`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `MAX()`
- `MIN()`
- `AVG()`
- `SUM()`
- `COUNT()`
- `CURDATE()`
- `INTERVAL`

---

## 📊 Query Categories

### Data Definition

```sql
DROP TABLE IF EXISTS ...
CREATE TABLE ...
```

Used to remove an existing table and create a new table structure.

### Data Insertion

```sql
INSERT INTO ...
VALUES (...);
```

Used to add records.

### Data Retrieval

```sql
SELECT ...
FROM ...;
```

Used to display information.

### Data Modification

```sql
UPDATE ...
SET ...
WHERE ...;
```

Used to change existing records.

### Data Deletion

```sql
DELETE FROM ...
WHERE ...;
```

Used to remove records.

### Filtering and Sorting

```sql
WHERE ...
ORDER BY ...
```

Used to filter and arrange results.

### Aggregate Functions

```text
MAX()   → highest value
MIN()   → lowest value
AVG()   → average value
SUM()   → total
COUNT() → number of records
```

---

## ⚠️ Important Notes About the Provided SQL

The README documents the supplied SQL as written. A few queries are worth reviewing before using this script in a real database:

1. `Orders_table.CustomerID` is not declared as a foreign key to `Customers_table.CustomerID`.
2. `Orderdetails_table.OrderID` and `ProductID` are not declared as foreign keys.
3. The IDs inserted into `Orders_table` (`11`–`15`) do not correspond to the customer IDs inserted into `Customers_table` (`1`–`5`).
4. The IDs in `Orderdetails_table` (`OrderID` `11`–`15` and `ProductID` `101`–`105`) do not correspond to the IDs shown in the other supplied tables.
5. `SELECT COUNT(*) AS product_sold_times FROM Orderdetails_table ORDER BY ProductID;` counts all rows but does not group the count by `ProductID`.
6. `SUM(Quantity * SubTotal)` multiplies quantity by the value already stored in `SubTotal`; verify that this matches the intended meaning of `SubTotal`.
7. `UPDATE Orders_table SET TotalAmount = 2400.33;` updates **every row** because there is no `WHERE` condition.
8. `DELETE FROM Products_table WHERE stock = 0;` is valid, but none of the supplied product records has stock `0`, so it will not remove a row from the supplied data.

These points are documented rather than silently changing the supplied SQL.

---

## 🚀 How to Run

1. Open MySQL Workbench or another MySQL client.
2. Open `project_1.sql`.
3. Review the table relationships and IDs.
4. Run the SQL statements in order.
5. Execute the `SELECT` statements to inspect the results.

---

## 📁 Project Files

```text
project/
├── project_1.sql
└── README.md
```

---

## 🎯 Learning Outcomes

After completing this project, you can demonstrate knowledge of:

- Creating SQL tables.
- Defining primary keys.
- Inserting data.
- Reading data with `SELECT`.
- Updating records.
- Deleting records.
- Filtering records with `WHERE`.
- Sorting results with `ORDER BY`.
- Limiting results with `LIMIT`.
- Using date calculations.
- Using aggregate functions.
- Understanding the intended relationships between customers, orders, products, and order details.

---

## 📝 Conclusion

This project provides practical examples of basic MySQL database operations across customer, order, product, and order-detail data. It combines table creation and data manipulation with filtering, sorting, date-based queries, and aggregate calculations.


