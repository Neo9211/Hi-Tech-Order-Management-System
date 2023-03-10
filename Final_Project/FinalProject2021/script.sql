USE [FinalProjectDB]
GO
/****** Object:  Table [dbo].[AuthorBooks]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorBooks](
	[AuthorID] [int] NOT NULL,
	[ISBN] [nvarchar](50) NOT NULL,
	[YearPublished] [nvarchar](50) NOT NULL,
	[Edition] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ISBN] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[YearPublished] [nvarchar](50) NOT NULL,
	[QOH] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[StreetAddress] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[FaxNumber] [nvarchar](50) NULL,
	[CreditLimit] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[EmployeeFirstName] [nvarchar](50) NOT NULL,
	[EmployeelastName] [nvarchar](50) NOT NULL,
	[EmployeePassword] [nvarchar](100) NOT NULL,
	[EmployeePosition] [nvarchar](100) NOT NULL,
	[UserID] [int] NULL,
	[EmployeePhoneNumber] [nvarchar](100) NULL,
	[EmployeeEmail] [nvarchar](100) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ISBN] [nvarchar](50) NOT NULL,
	[QuantityOrdered] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderDate] [nvarchar](50) NOT NULL,
	[OrderType] [nvarchar](50) NOT NULL,
	[ShipppingDate] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Payment] [nvarchar](50) NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL,
	[WebAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersAccount]    Script Date: 2021-11-29 7:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersAccount](
	[UserID] [int] NOT NULL,
	[UserPassword] [nvarchar](10) NOT NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_UsersAccount] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AuthorBooks] ([AuthorID], [ISBN], [YearPublished], [Edition]) VALUES (1, N'12345678', N'2010', N'1.5')
INSERT [dbo].[AuthorBooks] ([AuthorID], [ISBN], [YearPublished], [Edition]) VALUES (3, N'12345678', N'2000', N'2.0')
INSERT [dbo].[AuthorBooks] ([AuthorID], [ISBN], [YearPublished], [Edition]) VALUES (3, N'12345678', N'2001', N'3.0')
INSERT [dbo].[AuthorBooks] ([AuthorID], [ISBN], [YearPublished], [Edition]) VALUES (2, N'88888888', N'2018', N'4.5')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (1, N'Yujie', N'Xie', N'yujiexie@qq.com')
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (2, N'Samuel', N'Lee', N'samel767@outlook.com')
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (3, N'Steven', N'Hawkings', N'stevenresearch@gmail.com')
GO
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [YearPublished], [QOH], [CategoryID], [PublisherID]) VALUES (N'12345678', N'Hachi: Yujie''s Pet', 18, N'2001', 18, 1, 1)
INSERT [dbo].[Books] ([ISBN], [Title], [UnitPrice], [YearPublished], [QOH], [CategoryID], [PublisherID]) VALUES (N'88888888', N'Yujie''s Personal Life', 16, N'2020', 12, 3, 1)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Tools')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Cartoon')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Honor')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'F.Tale')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [StreetAddress], [City], [PostalCode], [PhoneNumber], [FaxNumber], [CreditLimit], [Email]) VALUES (1, N'Concordia', N'190 Dundas', N'Montreal', N'H3H2A2', N'3887678787', N'2345432454', N'10000', N'Concordia@ca.com')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [StreetAddress], [City], [PostalCode], [PhoneNumber], [FaxNumber], [CreditLimit], [Email]) VALUES (5, N'LaPie', N'966St.Cath.O', N'Sept.Iles', N'B7B3O2', N'7678990989', N'3243256545', N'15000', N'Lapie@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [StreetAddress], [City], [PostalCode], [PhoneNumber], [FaxNumber], [CreditLimit], [Email]) VALUES (9, N'UDQ', N'656Hellen.Est', N'Quebec', N'5C37B8', N'9867655656', N'3545767857', N'8000', N'Udq@edu.com')
GO
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeelastName], [EmployeePassword], [EmployeePosition], [UserID], [EmployeePhoneNumber], [EmployeeEmail]) VALUES (1, N'Henry', N'Brown', N'1234567', N'MIS_Manager', 1, N'3247879876', N'Brown@gmail.com')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeelastName], [EmployeePassword], [EmployeePosition], [UserID], [EmployeePhoneNumber], [EmployeeEmail]) VALUES (2, N'Thomas', N'Moore', N'1234567', N'Sales_Manager', 2, N'4567899876', N'Thomas@gmail.com')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeelastName], [EmployeePassword], [EmployeePosition], [UserID], [EmployeePhoneNumber], [EmployeeEmail]) VALUES (3, N'Peter', N'Wang', N'1234567', N'Inventory_Controller', 3, N'8744679898', N'Peter@hotmail.com')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeelastName], [EmployeePassword], [EmployeePosition], [UserID], [EmployeePhoneNumber], [EmployeeEmail]) VALUES (4, N'Jennifer', N'Bouchard', N'1234567', N'Order_Clerk', 4, N'2435436787', N'Bouch@qq.com')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeelastName], [EmployeePassword], [EmployeePosition], [UserID], [EmployeePhoneNumber], [EmployeeEmail]) VALUES (5, N'Mary', N'Brown', N'1234567', N'Order_Clerk', 5, N'9809085423', N'MaryB@yahoo.com')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeelastName], [EmployeePassword], [EmployeePosition], [UserID], [EmployeePhoneNumber], [EmployeeEmail]) VALUES (6, N'Kim', N'HoaNguyen', N'1234567', N'Accountant', 6, N'4356768787', N'Kim@outlook.com')
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [ShipppingDate], [Status], [Payment], [CustomerID]) VALUES (10, N'12.10.2019', N'Phone', N'1.1.2020', N'Finshed', N'Credit', 1)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [ShipppingDate], [Status], [Payment], [CustomerID]) VALUES (12, N'2.1.2021', N'Email', N'2.2.2021', N'Processed', N'Debit', 9)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [ShipppingDate], [Status], [Payment], [CustomerID]) VALUES (15, N'2.8.2021', N'Phone', NULL, N'Processed', N'Credit', 5)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [WebAddress]) VALUES (1, N'YujieMedia', N'www.yjm.ca')
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [WebAddress]) VALUES (2, N'JetNews', N'www.jtn.qc.ca')
GO
INSERT [dbo].[UsersAccount] ([UserID], [UserPassword], [EmployeeID]) VALUES (8, N'7654321', 2)
INSERT [dbo].[UsersAccount] ([UserID], [UserPassword], [EmployeeID]) VALUES (9, N'7654321', 5)
INSERT [dbo].[UsersAccount] ([UserID], [UserPassword], [EmployeeID]) VALUES (12, N'7654321', 1)
INSERT [dbo].[UsersAccount] ([UserID], [UserPassword], [EmployeeID]) VALUES (23, N'87654321', 2)
GO
ALTER TABLE [dbo].[AuthorBooks]  WITH CHECK ADD  CONSTRAINT [FK_AuthorBooks_AuthorID] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[AuthorBooks] CHECK CONSTRAINT [FK_AuthorBooks_AuthorID]
GO
ALTER TABLE [dbo].[AuthorBooks]  WITH CHECK ADD  CONSTRAINT [FK_AuthorBooks_ISBN] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Books] ([ISBN])
GO
ALTER TABLE [dbo].[AuthorBooks] CHECK CONSTRAINT [FK_AuthorBooks_ISBN]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_CategoryID]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_PublisherID] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_PublisherID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ISBN] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Books] ([ISBN])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ISBN]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_CustomerID]
GO
ALTER TABLE [dbo].[UsersAccount]  WITH CHECK ADD  CONSTRAINT [FK_UsersAccount_UsersAccount] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[UsersAccount] CHECK CONSTRAINT [FK_UsersAccount_UsersAccount]
GO
USE [master]
GO
ALTER DATABASE [FinalProjectDB] SET  READ_WRITE 
GO
