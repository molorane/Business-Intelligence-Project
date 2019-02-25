---- Drop all OLTP tables and re-create them at program start

CREATE PROCEDURE spCreateDT
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