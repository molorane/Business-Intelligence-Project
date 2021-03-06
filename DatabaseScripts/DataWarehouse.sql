USE [master]
GO
/****** Object:  Database [BIDWProject]    Script Date: 11/17/2018 8:25:41 PM ******/
CREATE DATABASE [BIDWProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIDWProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BIDWProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BIDWProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BIDWProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BIDWProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIDWProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIDWProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIDWProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIDWProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIDWProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIDWProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIDWProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIDWProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIDWProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIDWProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIDWProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIDWProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIDWProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIDWProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIDWProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIDWProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BIDWProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIDWProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIDWProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIDWProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIDWProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIDWProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIDWProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIDWProject] SET RECOVERY FULL 
GO
ALTER DATABASE [BIDWProject] SET  MULTI_USER 
GO
ALTER DATABASE [BIDWProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIDWProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIDWProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIDWProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BIDWProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BIDWProject', N'ON'
GO
ALTER DATABASE [BIDWProject] SET QUERY_STORE = OFF
GO
USE [BIDWProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BIDWProject]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](45) NULL,
	[Coverage] [nvarchar](45) NULL,
	[Education] [nvarchar](45) NULL,
	[EmploymentStatus] [nvarchar](45) NULL,
	[Gender] [nvarchar](1) NULL,
	[LocationCode] [nvarchar](45) NULL,
	[MaritalStatus] [nvarchar](45) NULL,
	[LocationKey] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[dDateKey] [int] IDENTITY(1,1) NOT NULL,
	[dDate] [date] NULL,
	[dYear] [int] NULL,
	[dQuarter] [nvarchar](45) NULL,
	[dMonth] [nvarchar](45) NULL,
	[dDayOfWeek] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[dDateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimFact]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFact](
	[CustomerKey] [int] NOT NULL,
	[PolicyKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[VehicleKey] [int] NOT NULL,
	[SalesChannelKey] [int] NOT NULL,
	[MonthlyPremiumAuto] [int] NULL,
	[MonthsSinceLastClaim] [int] NULL,
	[MonthsSincePolicyInception] [int] NULL,
	[NumberOfComplaints] [int] NULL,
	[NumberOfPolicies] [int] NULL,
	[TotalClaimAmount] [decimal](18, 2) NULL,
	[CustomerLifetimeValue] [decimal](18, 2) NULL,
	[AveragClaimPerPolicy] [decimal](18, 2) NULL,
	[Income] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC,
	[PolicyKey] ASC,
	[DateKey] ASC,
	[VehicleKey] ASC,
	[SalesChannelKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationKey] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPolicy]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPolicy](
	[PolicyKey] [int] IDENTITY(1,1) NOT NULL,
	[Policy] [nvarchar](45) NULL,
	[PolicyType] [nvarchar](45) NULL,
	[RenewOfferType] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[PolicyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSaleChannel]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSaleChannel](
	[SalesChannelKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesChannel] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesChannelKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVehicle]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVehicle](
	[VehicleKey] [int] IDENTITY(1,1) NOT NULL,
	[VehicleClass] [nvarchar](45) NULL,
	[VehicleSize] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimCustomer]  WITH CHECK ADD  CONSTRAINT [FKCustomerLocation] FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimCustomer] CHECK CONSTRAINT [FKCustomerLocation]
GO
ALTER TABLE [dbo].[DimFact]  WITH CHECK ADD  CONSTRAINT [FK_FactCustomerKey] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[DimFact] CHECK CONSTRAINT [FK_FactCustomerKey]
GO
ALTER TABLE [dbo].[DimFact]  WITH CHECK ADD  CONSTRAINT [FK_FactDateKey] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([dDateKey])
GO
ALTER TABLE [dbo].[DimFact] CHECK CONSTRAINT [FK_FactDateKey]
GO
ALTER TABLE [dbo].[DimFact]  WITH CHECK ADD  CONSTRAINT [FK_FactPolicyKey] FOREIGN KEY([PolicyKey])
REFERENCES [dbo].[DimPolicy] ([PolicyKey])
GO
ALTER TABLE [dbo].[DimFact] CHECK CONSTRAINT [FK_FactPolicyKey]
GO
ALTER TABLE [dbo].[DimFact]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesChannel] FOREIGN KEY([SalesChannelKey])
REFERENCES [dbo].[DimSaleChannel] ([SalesChannelKey])
GO
ALTER TABLE [dbo].[DimFact] CHECK CONSTRAINT [FK_FactSalesChannel]
GO
ALTER TABLE [dbo].[DimFact]  WITH CHECK ADD  CONSTRAINT [FK_FactVehicleKey] FOREIGN KEY([VehicleKey])
REFERENCES [dbo].[DimVehicle] ([VehicleKey])
GO
ALTER TABLE [dbo].[DimFact] CHECK CONSTRAINT [FK_FactVehicleKey]
GO
/****** Object:  StoredProcedure [dbo].[spCreateDM]    Script Date: 11/17/2018 8:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- Drop all tables


CREATE PROCEDURE [dbo].[spCreateDM]
AS
BEGIN
		---- Drop all tables

		DECLARE @deleteAllTablesSQL VARCHAR(max)

		SET @deleteAllTablesSQL = 
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''DimFact'') AND TYPE in (N''U''))
				DROP TABLE DimFact; '+
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''DimCustomer'') AND TYPE in (N''U''))
				DROP TABLE DimCustomer; '+
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''DimLocation'') AND TYPE in (N''U''))
				DROP TABLE DimLocation; '+
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''DimPolicy'') AND TYPE in (N''U''))
				DROP TABLE DimPolicy; '+
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''DimDate'') AND TYPE in (N''U''))
				DROP TABLE DimDate;'+
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''DimVehicle'') AND TYPE in (N''U''))
				DROP TABLE DimVehicle; '+
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''DimSaleChannel'') AND TYPE in (N''U''))
				DROP TABLE DimSaleChannel;'

		EXECUTE(@deleteAllTablesSQL)


		CREATE TABLE [DimLocation](
			[LocationKey] [int] IDENTITY(1,1) PRIMARY KEY,
			[State] [nvarchar](45) NULL,
		);


		CREATE TABLE [DimCustomer](
			[CustomerKey] [int] IDENTITY(1,1) PRIMARY KEY,
			[CustomerID] [nvarchar](45) NULL,
			[Coverage] [nvarchar](45) NULL,
			[Education] [nvarchar](45) NULL,
			[EmploymentStatus] [nvarchar](45) NULL,
			[Gender] [nvarchar](1) NULL,
			[LocationCode] [nvarchar](45) NULL,
			[MaritalStatus] [nvarchar](45) NULL,
			[LocationKey] [int] NULL,
			CONSTRAINT FKCustomerLocation FOREIGN KEY (LocationKey) REFERENCES DimLocation(LocationKey)
		);


		CREATE TABLE [DimPolicy](
			[PolicyKey] [int] IDENTITY(1,1) PRIMARY KEY,
			[Policy] [nvarchar](45) NULL,
			[PolicyType] [nvarchar](45) NULL,
			[RenewOfferType] [nvarchar](45) NULL,
		);


		CREATE TABLE [DimDate](
			[dDateKey] [int] IDENTITY(1,1) PRIMARY KEY,
			[dDate] [date] NULL,
			[dYear] [int] NULL,
			[dQuarter] [nvarchar](45) NULL,
			[dMonth] [nvarchar](45) NULL,
			[dDayOfWeek] [nvarchar](45) NULL,
		);



		CREATE TABLE [DimVehicle](
			[VehicleKey] [int] IDENTITY(1,1) PRIMARY KEY,
			[VehicleClass] [nvarchar](45) NULL,
			[VehicleSize] [nvarchar](45) NULL,
		);


		CREATE TABLE [DimSaleChannel](
			[SalesChannelKey] [int] IDENTITY(1,1) PRIMARY KEY,
			[SalesChannel] [nvarchar](45) NULL,
		);


		CREATE TABLE DimFact(
		[CustomerKey] [int],
		[PolicyKey] [int],
		[DateKey] [int] ,
		[VehicleKey] [int],
		[SalesChannelKey] [int],
		[MonthlyPremiumAuto] [int] NULL,
		[MonthsSinceLastClaim] [int] NULL,
		[MonthsSincePolicyInception] [int] NULL,
		[NumberOfComplaints] [int] NULL,
		[NumberOfPolicies] [int] NULL,
		[TotalClaimAmount] [decimal](18, 2) NULL,
		[CustomerLifetimeValue] [decimal](18, 2) NULL,
		[AveragClaimPerPolicy] [decimal](18, 2) NULL,
		[Income] [decimal](18, 2) NULL,
		CONSTRAINT FK_FactCustomerKey FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
		CONSTRAINT FK_FactPolicyKey FOREIGN KEY (PolicyKey) REFERENCES DimPolicy(PolicyKey),
		CONSTRAINT FK_FactDateKey FOREIGN KEY (DateKey) REFERENCES DimDate(dDateKey),
		CONSTRAINT FK_FactVehicleKey FOREIGN KEY (VehicleKey) REFERENCES DimVehicle(VehicleKey),
		CONSTRAINT FK_FactSalesChannel FOREIGN KEY (SalesChannelKey) REFERENCES DimSaleChannel(SalesChannelKey),
		PRIMARY KEY(CustomerKey, PolicyKey, DateKey, VehicleKey, SalesChannelKey)
		)
END
GO
USE [master]
GO
ALTER DATABASE [BIDWProject] SET  READ_WRITE 
GO
