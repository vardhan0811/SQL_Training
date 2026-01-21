USE [master]
GO
/****** Object:  Database [SQLSERVER]    Script Date: 1/21/2026 4:07:54 PM ******/
CREATE DATABASE [SQLSERVER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLSERVER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\SQLSERVER.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQLSERVER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\SQLSERVER_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SQLSERVER] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLSERVER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLSERVER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLSERVER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLSERVER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLSERVER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLSERVER] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLSERVER] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SQLSERVER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLSERVER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLSERVER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLSERVER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLSERVER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLSERVER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLSERVER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLSERVER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLSERVER] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SQLSERVER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLSERVER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLSERVER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLSERVER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLSERVER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLSERVER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLSERVER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLSERVER] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SQLSERVER] SET  MULTI_USER 
GO
ALTER DATABASE [SQLSERVER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLSERVER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLSERVER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLSERVER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SQLSERVER] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SQLSERVER] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SQLSERVER] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [SQLSERVER] SET QUERY_STORE = ON
GO
ALTER DATABASE [SQLSERVER] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SQLSERVER]
GO
/****** Object:  Table [dbo].[SuccessTransactions]    Script Date: 1/21/2026 4:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuccessTransactions](
	[TransactionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[PaymentType] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 1/21/2026 4:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[PaymentType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/21/2026 4:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[UserType] [varchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[JoinedOn] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SuccessTransactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7001, 201, CAST(N'2026-01-08' AS Date), CAST(1800.00 AS Decimal(10, 2)), N'Success', N'UPI')
INSERT [dbo].[SuccessTransactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7003, 202, CAST(N'2026-01-03' AS Date), CAST(8200.00 AS Decimal(10, 2)), N'Success', N'NetBanking')
INSERT [dbo].[SuccessTransactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7005, 205, CAST(N'2026-01-19' AS Date), CAST(3600.00 AS Decimal(10, 2)), N'Success', N'UPI')
GO
INSERT [dbo].[Transactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7001, 201, CAST(N'2026-01-08' AS Date), CAST(1800.00 AS Decimal(10, 2)), N'Success', N'UPI')
INSERT [dbo].[Transactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7002, 201, CAST(N'2026-01-14' AS Date), CAST(600.00 AS Decimal(10, 2)), N'Pending', N'Card')
INSERT [dbo].[Transactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7003, 202, CAST(N'2026-01-03' AS Date), CAST(8200.00 AS Decimal(10, 2)), N'Success', N'NetBanking')
INSERT [dbo].[Transactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7004, 203, CAST(N'2025-12-28' AS Date), CAST(450.00 AS Decimal(10, 2)), N'Failed', N'Cash')
INSERT [dbo].[Transactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7005, 205, CAST(N'2026-01-19' AS Date), CAST(3600.00 AS Decimal(10, 2)), N'Success', N'UPI')
INSERT [dbo].[Transactions] ([TransactionId], [UserId], [TransactionDate], [Amount], [Status], [PaymentType]) VALUES (7006, 202, CAST(N'2026-01-22' AS Date), CAST(1400.00 AS Decimal(10, 2)), N'Pending', N'UPI')
GO
INSERT [dbo].[Users] ([UserId], [FullName], [City], [UserType], [IsActive], [JoinedOn]) VALUES (201, N'Rahul Verma', N'Pune', N'Individual', 1, CAST(N'2025-08-12' AS Date))
INSERT [dbo].[Users] ([UserId], [FullName], [City], [UserType], [IsActive], [JoinedOn]) VALUES (202, N'Sneha Iyer', N'Chennai', N'Business', 1, CAST(N'2025-06-25' AS Date))
INSERT [dbo].[Users] ([UserId], [FullName], [City], [UserType], [IsActive], [JoinedOn]) VALUES (203, N'Aman Khanna', N'Delhi', N'Individual', 1, CAST(N'2025-07-10' AS Date))
INSERT [dbo].[Users] ([UserId], [FullName], [City], [UserType], [IsActive], [JoinedOn]) VALUES (204, N'Neha Joshi', N'Jaipur', N'Individual', 0, CAST(N'2024-11-18' AS Date))
INSERT [dbo].[Users] ([UserId], [FullName], [City], [UserType], [IsActive], [JoinedOn]) VALUES (205, N'Vikram Reddy', N'Hyderabad', N'Business', 1, CAST(N'2025-01-05' AS Date))
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users]
GO
USE [master]
GO
ALTER DATABASE [SQLSERVER] SET  READ_WRITE 
GO






/*
=========================================================
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


