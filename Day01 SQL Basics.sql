/*
=========================================================
SQL Server SELECT Statement – Practice Script
Author: Your Name
Description:
- Creates sample Users & Transactions tables
- Inserts demo data
- Demonstrates major SELECT options
=========================================================
*/

/*========================================================
  1. CLEANUP (Safe to re-run)
========================================================*/
IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL
    DROP TABLE dbo.Transactions;

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
    DROP TABLE dbo.Users;


/*========================================================
  2. TABLE CREATION
========================================================*/

-- Users table
CREATE TABLE dbo.Users
(
    UserId     INT PRIMARY KEY,              -- Unique user ID
    FullName   VARCHAR(100) NOT NULL,        -- User full name
    City       VARCHAR(50) NOT NULL,         -- City
    UserType   VARCHAR(20) NOT NULL,         -- Individual / Business
    IsActive   BIT NOT NULL,                 -- 1 = Active, 0 = Inactive
    JoinedOn   DATE NOT NULL                 -- Account creation date
);

-- Transactions table
CREATE TABLE dbo.Transactions
(
    TransactionId INT PRIMARY KEY,           -- Unique transaction ID
    UserId        INT NOT NULL,              -- FK to Users
    TransactionDate DATE NOT NULL,           -- Date of transaction
    Amount        DECIMAL(10,2) NOT NULL,    -- Transaction amount
    Status        VARCHAR(20) NOT NULL,      -- Success / Failed / Pending
    PaymentType  VARCHAR(20) NOT NULL,       -- UPI / Card / NetBanking

    CONSTRAINT FK_Transactions_Users
        FOREIGN KEY (UserId)
        REFERENCES dbo.Users(UserId)
);


/*========================================================
  3. INSERT SAMPLE DATA
========================================================*/

-- Insert Users
INSERT INTO dbo.Users VALUES
(201, 'Rahul Verma',    'Pune',       'Individual', 1, '2025-08-12'),
(202, 'Sneha Iyer',     'Chennai',    'Business',   1, '2025-06-25'),
(203, 'Aman Khanna',    'Delhi',      'Individual', 1, '2025-07-10'),
(204, 'Neha Joshi',     'Jaipur',     'Individual', 0, '2024-11-18'),
(205, 'Vikram Reddy',   'Hyderabad',  'Business',   1, '2025-01-05');

-- Insert Transactions
INSERT INTO dbo.Transactions VALUES
(7001, 201, '2026-01-08', 1800.00, 'Success',  'UPI'),
(7002, 201, '2026-01-14',  600.00, 'Pending',  'Card'),
(7003, 202, '2026-01-03', 8200.00, 'Success',  'NetBanking'),
(7004, 203, '2025-12-28',  450.00, 'Failed',   'Cash'),
(7005, 205, '2026-01-19', 3600.00, 'Success',  'UPI'),
(7006, 202, '2026-01-22', 1400.00, 'Pending',  'UPI');


/*========================================================
  4. SELECT STATEMENT EXAMPLES
========================================================*/

-- A. SELECT all columns
SELECT *
FROM dbo.Users;

-- B. SELECT specific columns
SELECT UserId, FullName, City
FROM dbo.Users;

-- C. DISTINCT
SELECT DISTINCT City
FROM dbo.Users;

-- D. Column Alias
SELECT FullName AS UserName, City AS UserCity
FROM dbo.Users;

-- E. WHERE filter
SELECT *
FROM dbo.Users
WHERE City = 'Chennai';

-- F. AND / OR
SELECT *
FROM dbo.Transactions
WHERE Status = 'Success'
  AND PaymentType = 'UPI';

-- G. IN
SELECT *
FROM dbo.Users
WHERE City IN ('Pune', 'Delhi');

-- H. BETWEEN
SELECT *
FROM dbo.Transactions
WHERE Amount BETWEEN 1000 AND 4000;

-- I. LIKE
SELECT *
FROM dbo.Users
WHERE FullName LIKE 'R%';

-- J. ORDER BY
SELECT *
FROM dbo.Transactions
ORDER BY Amount DESC;

-- K. TOP
SELECT TOP 2 *
FROM dbo.Transactions
ORDER BY Amount DESC;

-- L. OFFSET / FETCH
SELECT *
FROM dbo.Transactions
ORDER BY TransactionDate DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

-- M. GROUP BY + Aggregates
SELECT Status,
       COUNT(*) AS TotalTransactions,
       SUM(Amount) AS TotalAmount
FROM dbo.Transactions
GROUP BY Status;

-- N. HAVING
SELECT UserId,
       SUM(Amount) AS TotalSpent
FROM dbo.Transactions
GROUP BY UserId
HAVING SUM(Amount) > 3000;

-- O. INNER JOIN
SELECT u.FullName, t.TransactionId, t.Amount, t.Status
FROM dbo.Users u
INNER JOIN dbo.Transactions t
    ON u.UserId = t.UserId;

-- P. LEFT JOIN
SELECT u.FullName, t.TransactionId, t.Status
FROM dbo.Users u
LEFT JOIN dbo.Transactions t
    ON u.UserId = t.UserId;

-- Q. Subquery
SELECT *
FROM dbo.Users
WHERE UserId IN (
    SELECT UserId
    FROM dbo.Transactions
    WHERE Status = 'Success'
);

-- R. CASE
SELECT TransactionId, Amount,
       CASE
           WHEN Amount >= 5000 THEN 'Large'
           WHEN Amount >= 1500 THEN 'Medium'
           ELSE 'Small'
       END AS TransactionSize
FROM dbo.Transactions;

-- S. EXISTS
SELECT u.UserId, u.FullName
FROM dbo.Users u
WHERE EXISTS (
    SELECT 1
    FROM dbo.Transactions t
    WHERE t.UserId = u.UserId
      AND t.Status = 'Pending'
);

-- T. UNION
SELECT City FROM dbo.Users WHERE City = 'Chennai'
UNION
SELECT City FROM dbo.Users WHERE City = 'Pune';

-- U. SELECT INTO
SELECT *
INTO dbo.SuccessTransactions
FROM dbo.Transactions
WHERE Status = 'Success';

-- V. CTE
WITH HighValueTransactions AS
(
    SELECT TransactionId, UserId, Amount
    FROM dbo.Transactions
    WHERE Amount >= 3000
)
SELECT *
FROM HighValueTransactions;
