USE [master]
GO
/****** Object:  Database [test]    Script Date: 08-07-2019 16:54:27 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
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
USE [test]
GO
/****** Object:  Table [dbo].[nobel_win]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nobel_win](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NULL,
	[SUBJECT] [varchar](25) NULL,
	[WINNER] [varchar](25) NULL,
	[COUNTRY] [varchar](25) NULL,
	[CATEGORY] [varchar](25) NULL,
 CONSTRAINT [PK_nobel_win] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[winner]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[winner]
AS
SELECT        WINNER, SUBJECT
FROM            dbo.nobel_win
GO
/****** Object:  Table [dbo].[emp_details]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_details](
	[EMP_IDNO] [bigint] NOT NULL,
	[EMP_FNAME] [varchar](25) NULL,
	[EMP_LNAME] [varchar](25) NULL,
	[EMP_DEPT] [int] NULL,
 CONSTRAINT [PK__emp_deta__807453223C89172F] PRIMARY KEY CLUSTERED 
(
	[EMP_IDNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[emp_fun]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[emp_fun]()
returns table
as
return(select * from emp_details)		
GO
/****** Object:  Table [dbo].[customer]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
	[cust_name] [varchar](25) NULL,
	[city] [varchar](25) NULL,
	[grade] [smallint] NULL,
	[salesman_id] [int] NULL,
 CONSTRAINT [PK__customer__CD65CB85529C8C8D] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomersBackup2017]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersBackup2017](
	[salesman_id] [int] NOT NULL,
	[name] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[commission] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dept]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dept](
	[did] [int] NOT NULL,
	[dname] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp](
	[empid] [int] NOT NULL,
	[empname] [varchar](20) NULL,
	[salary] [int] NULL,
	[city] [varchar](20) NULL,
	[did] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_details1]    Script Date: 08-07-2019 16:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_details1](
	[EMP_IDNO] [bigint] NOT NULL,
	[EMP_FNAME] [varchar](25) NULL,
	[EMP_LNAME] [varchar](25) NULL,
	[EMP_DEPT] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FB_Login]    Script Date: 08-07-2019 16:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FB_Login](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[providename] [varchar](30) NULL,
	[name] [varchar](30) NULL,
	[emailid] [varchar](50) NULL,
 CONSTRAINT [PK_FB_Login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_mast]    Script Date: 08-07-2019 16:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_mast](
	[PRO_ID] [int] NOT NULL,
	[PRO_NAME] [varchar](25) NULL,
	[PRO_PRICE] [int] NULL,
	[PRO_COM] [int] NULL,
 CONSTRAINT [PK__item_mas__0A464EEB06884668] PRIMARY KEY CLUSTERED 
(
	[PRO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 08-07-2019 16:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[ord_no] [bigint] NOT NULL,
	[purch_amt] [float] NULL,
	[ord_date] [date] NULL,
	[customer_id] [int] NOT NULL,
	[salesman_id] [int] NOT NULL,
 CONSTRAINT [PK__orders__DC386904EEF52945] PRIMARY KEY CLUSTERED 
(
	[ord_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRO_MST]    Script Date: 08-07-2019 16:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRO_MST](
	[PRO_ID] [int] NOT NULL,
	[PRO_NAME] [varchar](25) NULL,
	[PRO_PRICE] [int] NULL,
	[PRO_COM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRO_MST_new]    Script Date: 08-07-2019 16:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRO_MST_new](
	[PRO_ID] [int] NOT NULL,
	[PRO_NAME] [varchar](25) NULL,
	[PRO_PRICE] [int] NULL,
	[PRO_COM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salesman]    Script Date: 08-07-2019 16:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salesman](
	[salesman_id] [int] NOT NULL,
	[name] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[commission] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[salesman_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3001, N'Nick Rimando', N'New York', 100, 5001)
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3002, N'Graham Zusi', N'California', 200, 5002)
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3003, N'Brad Guzan', N'London', 0, 5005)
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3004, N'Fabian Johns', N'Paris', 300, 5006)
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3005, N'Brad Davis', N'New York', 200, 5001)
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3006, N'Geoff Camero', N'Berlin', 100, 5003)
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3007, N'Julian Green', N'London', 300, 5002)
INSERT [dbo].[customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3008, N'Jozy Altidor', N'Moscow', 200, 5006)
INSERT [dbo].[CustomersBackup2017] ([salesman_id], [name], [city], [commission]) VALUES (5001, N'James Hoog', N'New York', 11)
INSERT [dbo].[CustomersBackup2017] ([salesman_id], [name], [city], [commission]) VALUES (5002, N'Nail Knite', N'Paris', 13)
INSERT [dbo].[CustomersBackup2017] ([salesman_id], [name], [city], [commission]) VALUES (5003, N'Nail Knite', N'London', 11)
INSERT [dbo].[CustomersBackup2017] ([salesman_id], [name], [city], [commission]) VALUES (5005, N'Lauson Hen', N'London', 12)
INSERT [dbo].[CustomersBackup2017] ([salesman_id], [name], [city], [commission]) VALUES (5006, N'Paul Adam', N'Rome', 13)
INSERT [dbo].[CustomersBackup2017] ([salesman_id], [name], [city], [commission]) VALUES (5008, N'sa', N'surat', 19)
INSERT [dbo].[CustomersBackup2017] ([salesman_id], [name], [city], [commission]) VALUES (5009, N'sagar', N'surat', 19)
INSERT [dbo].[dept] ([did], [dname]) VALUES (1, N'marketing')
INSERT [dbo].[dept] ([did], [dname]) VALUES (2, N'sales')
INSERT [dbo].[dept] ([did], [dname]) VALUES (3, N'purchase')
INSERT [dbo].[emp] ([empid], [empname], [salary], [city], [did]) VALUES (1, N'sagar', 55000, N'surat', 1)
INSERT [dbo].[emp] ([empid], [empname], [salary], [city], [did]) VALUES (2, N'sa', 5000, N'surat', 1)
INSERT [dbo].[emp] ([empid], [empname], [salary], [city], [did]) VALUES (3, N'da', 5000, N'baroda', 2)
INSERT [dbo].[emp] ([empid], [empname], [salary], [city], [did]) VALUES (4, N'dhar', 5000, N'mumbai', 3)
INSERT [dbo].[emp] ([empid], [empname], [salary], [city], [did]) VALUES (5, N'sagar', 5000, N'surat', 3)
INSERT [dbo].[emp] ([empid], [empname], [salary], [city], [did]) VALUES (6, N'as', 14000, N'baroda', 2)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (127323, N'Michale', N'Robbin', 57)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (328717, N'Jhon', N'Snares', 63)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (444527, N'Joseph', N'Dosni', 47)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (526689, N'Carlos', N'Snares', 63)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (539569, N'George', N'Mardy', 27)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (555935, N'Alex', N'Manuel', 57)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (631548, N'Alex', N'Snappy', 27)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (659831, N'Zanifer', N'Emily', 47)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (733843, N'Mario', N'Saule', 63)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (748681, N'Henrey', N'Gabriel', 47)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (839139, N'Maria', N'Foster', 57)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (843795, N'Enric', N'Dosio', 57)
INSERT [dbo].[emp_details] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (847674, N'Kuleswar', N'Sitaraman', 57)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (127323, N'Michale', N'Robbin', 57)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (328717, N'Jhon', N'Snares', 63)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (444527, N'Joseph', N'Dosni', 47)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (526689, N'Carlos', N'Snares', 63)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (539569, N'George', N'Mardy', 27)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (555935, N'Alex', N'Manuel', 57)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (631548, N'Alex', N'Snappy', 27)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (659831, N'Zanifer', N'Emily', 47)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (733843, N'Mario', N'Saule', 63)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (748681, N'Henrey', N'Gabriel', 47)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (839139, N'Maria', N'Foster', 57)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (843795, N'Enric', N'Dosio', 57)
INSERT [dbo].[emp_details1] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (847674, N'Kuleswar', N'Sitaraman', 57)
SET IDENTITY_INSERT [dbo].[FB_Login] ON 

INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (1, N'Facebook', N'SagarRana', NULL)
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (2, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (3, N'Google', N'sagurana', N'sagarrana24958@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (4, N'Google', N'sagurana', N'sagarrana24958@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (5, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (6, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (7, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (8, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (9, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (11, N'Google', N'sagurana', N'sagarrana24958@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (12, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10002, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10003, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10004, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10005, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10006, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10007, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10008, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10009, N'Facebook', N'SagarRana', N'sagurana.sa143@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10010, N'Google', N'sagurana', N'sagarrana24958@gmail.com')
INSERT [dbo].[FB_Login] ([id], [providename], [name], [emailid]) VALUES (10011, N'Google', N'sagurana', N'sagarrana24958@gmail.com')
SET IDENTITY_INSERT [dbo].[FB_Login] OFF
INSERT [dbo].[item_mast] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (101, N'Mother Board', 3200, 15)
INSERT [dbo].[item_mast] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (102, N'Key Board', 450, 16)
INSERT [dbo].[item_mast] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (104, N'Speaker Dual', 900, 20)
INSERT [dbo].[item_mast] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (105, N'Monitor single piece', 5000, 11)
INSERT [dbo].[item_mast] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (106, N'DVD drive', 900, 12)
INSERT [dbo].[item_mast] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (107, N'CD drive', 800, 12)
INSERT [dbo].[item_mast] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (108, N'Printer', 2600, 13)
SET IDENTITY_INSERT [dbo].[nobel_win] ON 

INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1, 1970, N'Physics', N'Hannes Alfven', N'Sweden', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (2, 1970, N'Physics', N'Louis Neel', N'France', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (3, 1970, N'Chemistry', N'Luis Federico Leloir', N'France', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (4, 1970, N'Physiology', N'Ulf von Euler', N'Sweden', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (5, 1970, N'Physiology', N'Bernard Katz', N'Germany', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (6, 1970, N'Literature', N'Aleksandr Solzhenitsyn', N'Russia', N'Linguist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (7, 1970, N'Economics', N'Paul Samuelson', N'USA', N'Economist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (8, 1970, N'Physiology', N'Julius Axelrod', N'USA', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (9, 1971, N'Physics', N'Dennis Gabor', N'Hungary', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (10, 1971, N'Chemistry', N'Gerhard Herzberg', N'Germany', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (11, 1971, N'Peace', N'Willy Brandt', N'Germany', N'Chancellor')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (12, 1971, N'Literature', N'Pablo Neruda', N'Chile', N'Linguist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (13, 1971, N'Economics', N'Simon Kuznets', N'Russia', N'Economist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (14, 1978, N'Peace', N'Anwar al-Sadat', N'Egypt', N'President')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (15, 1978, N'Peace', N'Menachem Begin', N'Israel', N'Prime Minister')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (16, 1987, N'Chemistry', N'Donald J. Cram', N'USA', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (17, 1987, N'Chemistry', N'Jean-Marie Lehn', N'France', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (18, 1987, N'Physiology', N'Susumu Tonegawa', N'Japan', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (19, 1994, N'Economics', N'Reinhard Selten', N'Germany', N'Economist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (20, 1994, N'Peace', N'Yitzhak Rabin', N'Israel', N'Prime Minister')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (21, 1987, N'Physics', N'Johannes Georg Bednorz', N'Germany', N'Scientist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (22, 1987, N'Literature', N'Joseph Brodsky', N'Russia', N'Linguist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (23, 1987, N'Economics', N'Robert Solow', N'USA', N'Economist')
INSERT [dbo].[nobel_win] ([Id], [YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (24, 1994, N'Literature', N'Kenzaburo Oe', N'Japan', N'Linguist')
SET IDENTITY_INSERT [dbo].[nobel_win] OFF
INSERT [dbo].[orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70001, 150.5, CAST(N'2012-10-05' AS Date), 3005, 5002)
INSERT [dbo].[orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70002, 270.65, CAST(N'2012-09-10' AS Date), 3001, 5005)
INSERT [dbo].[orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70003, 65.26, CAST(N'2012-10-05' AS Date), 3002, 5001)
INSERT [dbo].[orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70004, 110.5, CAST(N'2012-08-17' AS Date), 3008, 5003)
INSERT [dbo].[orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70005, 948.5, CAST(N'2012-09-10' AS Date), 3005, 5002)
INSERT [dbo].[orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70006, 2400.6, CAST(N'2012-07-27' AS Date), 3007, 5001)
INSERT [dbo].[orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70007, 5760, CAST(N'2012-09-10' AS Date), 3002, 5001)
INSERT [dbo].[PRO_MST] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (101, N'Mother Board', 3200, 15)
INSERT [dbo].[PRO_MST] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (102, N'Key Board', 450, 16)
INSERT [dbo].[PRO_MST] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (104, N'Speaker Dual', 900, 20)
INSERT [dbo].[PRO_MST] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (105, N'Monitor single piece', 5000, 11)
INSERT [dbo].[PRO_MST] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (106, N'DVD drive', 900, 12)
INSERT [dbo].[PRO_MST] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (107, N'CD drive', 800, 12)
INSERT [dbo].[PRO_MST] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (108, N'Printer', 2600, 13)
INSERT [dbo].[PRO_MST_new] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (101, N'Mother Board', 3200, 15)
INSERT [dbo].[PRO_MST_new] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (102, N'Key Board', 450, 16)
INSERT [dbo].[PRO_MST_new] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (104, N'Speaker Dual', 900, 20)
INSERT [dbo].[PRO_MST_new] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (105, N'Monitor single piece', 5000, 11)
INSERT [dbo].[PRO_MST_new] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (106, N'DVD drive', 900, 12)
INSERT [dbo].[PRO_MST_new] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (107, N'CD drive', 800, 12)
INSERT [dbo].[PRO_MST_new] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (108, N'Printer', 2600, 13)
INSERT [dbo].[salesman] ([salesman_id], [name], [city], [commission]) VALUES (5001, N'James Hoog', N'New York', 11)
INSERT [dbo].[salesman] ([salesman_id], [name], [city], [commission]) VALUES (5002, N'Nail Knite', N'Paris', 13)
INSERT [dbo].[salesman] ([salesman_id], [name], [city], [commission]) VALUES (5003, N'Nail Knite', N'London', 11)
INSERT [dbo].[salesman] ([salesman_id], [name], [city], [commission]) VALUES (5005, N'Lauson Hen', N'London', 12)
INSERT [dbo].[salesman] ([salesman_id], [name], [city], [commission]) VALUES (5006, N'Paul Adam', N'Rome', 13)
INSERT [dbo].[salesman] ([salesman_id], [name], [city], [commission]) VALUES (5008, N'sa', N'surat', 19)
INSERT [dbo].[salesman] ([salesman_id], [name], [city], [commission]) VALUES (5009, N'sagar', N'surat', 19)
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK__customer__salesm__4E88ABD4] FOREIGN KEY([salesman_id])
REFERENCES [dbo].[salesman] ([salesman_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK__customer__salesm__4E88ABD4]
GO
ALTER TABLE [dbo].[emp]  WITH CHECK ADD FOREIGN KEY([did])
REFERENCES [dbo].[dept] ([did])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([salesman_id])
REFERENCES [dbo].[salesman] ([salesman_id])
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUser]    Script Date: 08-07-2019 16:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_LoginUser]
@name varchar(20)

as
begin
insert into FB_Login([name])
select @name
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nobel_win"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'winner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'winner'
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
