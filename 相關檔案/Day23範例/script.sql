USE [master]
GO
/****** Object:  Database [Orders]    Script Date: 9/17/2021 11:46:43 AM ******/
CREATE DATABASE [Orders]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Orders', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Orders.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Orders_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Orders_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Orders] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Orders].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Orders] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Orders] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Orders] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Orders] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Orders] SET ARITHABORT OFF 
GO
ALTER DATABASE [Orders] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Orders] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Orders] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Orders] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Orders] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Orders] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Orders] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Orders] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Orders] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Orders] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Orders] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Orders] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Orders] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Orders] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Orders] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Orders] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Orders] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Orders] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Orders] SET  MULTI_USER 
GO
ALTER DATABASE [Orders] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Orders] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Orders] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Orders] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Orders] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Orders] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Orders] SET QUERY_STORE = OFF
GO
USE [Orders]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 9/17/2021 11:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[number] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[tel] [nvarchar](50) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 9/17/2021 11:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_number] [nvarchar](50) NOT NULL,
	[product_number] [nvarchar](50) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [decimal](18, 4) NOT NULL,
	[total] [decimal](18, 4) NOT NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 9/17/2021 11:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[number] [nvarchar](50) NOT NULL,
	[shipping_date] [datetime2](7) NOT NULL,
	[shipping_address] [nvarchar](500) NOT NULL,
	[customer_signature] [nvarchar](100) NULL,
	[customer_number] [nvarchar](50) NOT NULL,
	[total] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 9/17/2021 11:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[number] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 9/17/2021 11:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[number] [int] NULL,
	[type] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[customers] ([number], [name], [tel]) VALUES (N'U001', N'XXX', N'09-11111111')
INSERT [dbo].[customers] ([number], [name], [tel]) VALUES (N'U002', N'NNN', N'09-00000000')
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_number], [product_number], [amount], [price], [total], [remark]) VALUES (1, N'A002', N'P001', 2, CAST(15000.0000 AS Decimal(18, 4)), CAST(30000.0000 AS Decimal(18, 4)), N'請勿重摔')
INSERT [dbo].[order_details] ([id], [order_number], [product_number], [amount], [price], [total], [remark]) VALUES (2, N'A002', N'P002', 3, CAST(10000.0000 AS Decimal(18, 4)), CAST(30000.0000 AS Decimal(18, 4)), N'請勿重摔')
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
INSERT [dbo].[orders] ([number], [shipping_date], [shipping_address], [customer_signature], [customer_number], [total]) VALUES (N'A002', CAST(N'2021-09-05T00:00:00.0000000' AS DateTime2), N'高雄市鼓山區XXX', N'XXX', N'U001', CAST(60000.0000 AS Decimal(18, 4)))
INSERT [dbo].[orders] ([number], [shipping_date], [shipping_address], [customer_signature], [customer_number], [total]) VALUES (N'A003', CAST(N'2021-09-08T00:00:00.0000000' AS DateTime2), N'台南市OOO區', N'', N'U001', CAST(0.0000 AS Decimal(18, 4)))
GO
INSERT [dbo].[products] ([number], [name], [price]) VALUES (N'P001', N'PS5', CAST(15000.0000 AS Decimal(18, 4)))
INSERT [dbo].[products] ([number], [name], [price]) VALUES (N'P002', N'PS4', CAST(10000.0000 AS Decimal(18, 4)))
GO
SET IDENTITY_INSERT [dbo].[test] ON 

INSERT [dbo].[test] ([number], [type], [id]) VALUES (1, 1, 1)
INSERT [dbo].[test] ([number], [type], [id]) VALUES (5, 2, 2)
INSERT [dbo].[test] ([number], [type], [id]) VALUES (3, 1, 3)
INSERT [dbo].[test] ([number], [type], [id]) VALUES (4, 1, 4)
INSERT [dbo].[test] ([number], [type], [id]) VALUES (2, 2, 7)
INSERT [dbo].[test] ([number], [type], [id]) VALUES (4, 2, 11)
INSERT [dbo].[test] ([number], [type], [id]) VALUES (8, 1, 12)
SET IDENTITY_INSERT [dbo].[test] OFF
GO
USE [master]
GO
ALTER DATABASE [Orders] SET  READ_WRITE 
GO
