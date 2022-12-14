USE [master]
GO
/****** Object:  Database [FShop]    Script Date: 8/14/2022 8:55:22 PM ******/
CREATE DATABASE [FShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FShop] SET  MULTI_USER 
GO
ALTER DATABASE [FShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FShop] SET QUERY_STORE = OFF
GO
USE [FShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/14/2022 8:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[password] [char](64) NOT NULL,
	[enabled] [bit] NOT NULL,
	[role] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/14/2022 8:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 8/14/2022 8:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descriptions] [nvarchar](200) NOT NULL,
	[userName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/14/2022 8:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (1, N'Admin', N'9652 Los Angeles', N'0123456789', N'a@petstore.com', N'admin', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', 1, N'ROLE_ADMIN')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (2, N'Employee1', N'5747 Shirley Drive', N'1234567890', N'e1@petstore.com', N'e1', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', 1, N'ROLE_EMPLOYEE')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (3, N'Employee2', N'3841 Silver Oaks Place', N'2345678901', N'e2@petstore.com', N'e2', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', 1, N'ROLE_EMPLOYEE')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (4, N'Customer1', N'1873 Lion Circle', N'5678901234', N'c1@gmail.com', N'c1', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', 1, N'ROLE_CUSTOMER')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (5, N'Customer2', N'5747 Shirley Drive', N'6789872314', N'c2@gmail.com', N'c2', N'6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', 1, N'ROLE_CUSTOMER')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (6, N'nguyen', N'HCM City', N'0933684909', N'asd', N'KabuVG', N'anhpro111                                                       ', 1, N'ROLE_CUSTOMER')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (1007, N'tu', N'HCM City', N'0933684909', N'asd', N'tu', N'anhpro111                                                       ', 1, N'ROLE_CUSTOMER')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (1008, N'hung anh', N'HCM City', N'0933684909', N'asd', N'hung anh', N'anhpro111                                                       ', 1, N'ROLE_CUSTOMER')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Apple')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Samsung')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Oppo')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Nokia')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [descriptions], [userName]) VALUES (1, N'Good', N'tu')
INSERT [dbo].[Feedback] ([id], [descriptions], [userName]) VALUES (2, N'Very good', N'hung anh')
INSERT [dbo].[Feedback] ([id], [descriptions], [userName]) VALUES (1001, N'nice', N'KabuVG')
INSERT [dbo].[Feedback] ([id], [descriptions], [userName]) VALUES (2001, N'ok
', N'hung anh')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (1, N'iPhone 7 16GB', 5000.99, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (2, N'iPhone 7Plus 32GB', 5280.94, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (3, N'iPhone 7 64GB', 6004.11, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (4, N'iPhone 8 16GB', 5252.73, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (5, N'iPhone 8 32GB', 7811.13, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (6, N'iPhone 8Plus 64GB', 9100.55, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (7, N'iPhone X 16GB', 7500.01, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (8, N'iPhone X 32GB', 7700.17, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (9, N'iPhone X 64GB', 7900.03, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (10, N'iPhone XS 16GB', 8008.19, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (11, N'iPhone XS 32GB', 8200.31, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (12, N'iPhone XS 64GB', 8600.47, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (13, N'iPhone XR 16GB', 8055.58, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (14, N'iPhone XR 32GB', 8204.26, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (15, N'iPhone XR 64GB', 8650.25, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (16, N'iPhone Xs Max 16GB Gold', 9209.9, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (17, N'iPhone Xs Max 16GB', 9004.29, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (18, N'iPhone Xs Max 32GB', 10046.36, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (19, N'iPhone Xs Max 64GB', 15114.76, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (20, N'iPhone Xs Max 256GB', 15135.82, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (21, N'iPhone 11 64GB', 15981.46, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (22, N'iPhone 11 128GB', 16151.89, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (23, N'iPhone 11 256GB', 19115.7, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (24, N'iPhone 13 ProMax 128GB', 30698.16, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (25, N'Samsung Galaxy S22 Ultra 5G 128GB', 30990.25, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (26, N'Samsung Galaxy Z Fold3 5G 512GB', 41990.36, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (27, N'SamsungZ Flip3 5G 256GB', 23500.08, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (28, N'Samsung Note20 Ultra 4G ', 18570.92, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (29, N'Samsung S21 FE 5G', 13570.81, 0, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (30, N'Samsung M22', 4151, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (31, N'Samsung A52s 5G 256GB', 9990.34, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (32, N'Samsung A32', 6070.23, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (33, N'Samsung A03', 6036.5, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (34, N'Samsung Tab S7 FE', 13024.68, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (35, N'Samsung BudsPro', 2988.71, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (36, N'Samsung BudsPro', 2190.43, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (37, N'Oppo A53 4GB 128GB', 4100, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (38, N'Oppo A92 8GB 128GB', 5206.57, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (39, N'Oppo Reno 4 ', 5163.48, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (40, N'Oppo Reno 5', 5192.3, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (41, N'Oppo Reno 5', 5168.69, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (42, N'Oppo Reno 5', 5117.89, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (43, N'Oppo A93 8GB 128GB', 5906.34, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (44, N'Oppo A93 8GB 128GB', 5158.61, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (45, N'Oppo A93 8GB 128GB', 5209.96, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (46, N'Oppo A93 4GB 128GB', 4176.24, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (47, N'Oppo A92 4GB 128GB', 4174.28, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (48, N'Oppo A92 8GB 128GB', 4070.65, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (49, N'Nokia 5.4 4GB 128GB', 3176.24, 0, 4)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (50, N'Nokia 3.4 4Gb 128Gb', 2174.28, 0.05, 4)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (51, N'Nokia C10 Plus 2GB 16Gb', 2070.65, 0, 4)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (52, N'Nokia C2 Plus 2GB 16Gb', 1070.65, 0, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__66DCF95C5E0DCB21]    Script Date: 8/14/2022 8:55:29 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B') FOR [password]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[Account] ([userName])
GO
USE [master]
GO
ALTER DATABASE [FShop] SET  READ_WRITE 
GO
