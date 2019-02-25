---- Drop all data warehouse dimensions and re-create them at program start


CREATE PROCEDURE spCreateDM
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