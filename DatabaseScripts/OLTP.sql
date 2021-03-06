USE [master]
GO
/****** Object:  Database [BIProject]    Script Date: 11/17/2018 8:28:28 PM ******/
CREATE DATABASE [BIProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BIProject.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BIProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BIProject_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BIProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BIProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIProject] SET RECOVERY FULL 
GO
ALTER DATABASE [BIProject] SET  MULTI_USER 
GO
ALTER DATABASE [BIProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BIProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BIProject', N'ON'
GO
ALTER DATABASE [BIProject] SET QUERY_STORE = OFF
GO
USE [BIProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BIProject]
GO
/****** Object:  Table [dbo].[CustomerValueAnalysis]    Script Date: 11/17/2018 8:28:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerValueAnalysis](
	[customerID] [nvarchar](45) NOT NULL,
	[State] [nvarchar](45) NULL,
	[LifetimeValue] [decimal](18, 2) NULL,
	[Response] [nvarchar](5) NULL,
	[Coverage] [nvarchar](45) NULL,
	[Education] [nvarchar](45) NULL,
	[EffectiveToDate] [date] NULL,
	[EmploymentStatus] [nvarchar](45) NULL,
	[Gender] [nvarchar](1) NULL,
	[Income] [decimal](18, 2) NULL,
	[LocationCode] [nvarchar](45) NULL,
	[MaritalStatus] [nvarchar](45) NULL,
	[MonthlyPremiumAuto] [int] NULL,
	[MonthsSinceLastClaim] [int] NULL,
	[MonthsSincePolicyInception] [int] NULL,
	[NumberOfOpenComplaints] [int] NULL,
	[NumberOfPolicies] [int] NULL,
	[PolicyType] [nvarchar](45) NULL,
	[cusPolicy] [nvarchar](45) NULL,
	[RenewOfferType] [nvarchar](45) NULL,
	[SalesChannel] [nvarchar](45) NULL,
	[TotalClaimAmount] [decimal](18, 2) NULL,
	[VehicleClass] [nvarchar](45) NULL,
	[VehicleSize] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spCreateDT]    Script Date: 11/17/2018 8:28:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- Drop all tables


CREATE PROCEDURE [dbo].[spCreateDT]
AS
BEGIN
		---- Drop all tables

		DECLARE @deleteAllTablesSQL VARCHAR(max)

		SET @deleteAllTablesSQL = 
			 'IF EXISTS (SELECT NAME FROM SYS.OBJECTS WHERE object_id = OBJECT_ID(N''CustomerValueAnalysis'') AND TYPE in (N''U''))
				DROP TABLE CustomerValueAnalysis;'

		EXECUTE(@deleteAllTablesSQL)


		CREATE TABLE [CustomerValueAnalysis](
			[customerID] [nvarchar](45) PRIMARY KEY,
			[State] [nvarchar](45) NULL,
			[LifetimeValue] [decimal](18, 2) NULL,
			[Response] [nvarchar](5) NULL,
			[Coverage] [nvarchar](45) NULL,
			[Education] [nvarchar](45) NULL,
			[EffectiveToDate] [date] NULL,
			[EmploymentStatus] [nvarchar](45) NULL,
			[Gender] [nvarchar](1) NULL,
			[Income] [decimal](18, 2) NULL,
			[LocationCode] [nvarchar](45) NULL,
			[MaritalStatus] [nvarchar](45) NULL,
			[MonthlyPremiumAuto] [int] NULL,
			[MonthsSinceLastClaim] [int] NULL,
			[MonthsSincePolicyInception] [int] NULL,
			[NumberOfOpenComplaints] [int] NULL,
			[NumberOfPolicies] [int] NULL,
			[PolicyType] [nvarchar](45) NULL,
			[cusPolicy] [nvarchar](45) NULL,
			[RenewOfferType] [nvarchar](45) NULL,
			[SalesChannel] [nvarchar](45) NULL,
			[TotalClaimAmount] [decimal](18, 2) NULL,
			[VehicleClass] [nvarchar](45) NULL,
			[VehicleSize] [nvarchar](45) NULL
			)
END
GO
USE [master]
GO
ALTER DATABASE [BIProject] SET  READ_WRITE 
GO
