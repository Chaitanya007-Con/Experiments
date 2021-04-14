
USE [michan1];

-------------------------------------------------------------------------------------------------------------------------------
-- Create table manager
CREATE TABLE [Manager] (
  [ManagerID] INT NOT NULL PRIMARY KEY,
  [FirstName] Varchar(20) NOT NULL,
  [LastName] Varchar(20) NOT NULL,
  [Username] Varchar(30) NOT NULL UNIQUE,
  [Password] VARBINARY(250) NOT NULL,
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [ManagementStaff] (
  [ManagementStaffID] INT NOT NULL PRIMARY KEY ,
  [Name] Varchar(20) NOT NULL,
  [ManagementCategory] Varchar(20) NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Management] (
  [ManagementID] INT NOT NULL PRIMARY KEY ,
  [ManagerID] INT  NOT NULL REFERENCES  Manager(ManagerID) ,
  [ManagementstaffID] INT  NOT NULL REFERENCES  ManagementStaff(ManagementStaffID),  
  [ManagementFirstName] Varchar(20) NOT NULL,
  [ManagementLasttName] Varchar(20) NOT NULL,
  [OfficeLocation] Varchar(20) NOT NULL,
  [ContactInformation] Varchar(20) NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Lease] (
  [LeaseID] INT  NOT NULL PRIMARY KEY,
  [NumberofTenants] INT NOT NULL,
  [StartDate] Date NOT NULL,
  [EndDate] Date NOT NULL,
  [UnitNumber] INT NOT NULL,
  [BuildingNumber] INT NOT NULL,
  [RentAmount] INT NOT NULL,
);

-------------------------------------------------------------------------------------------------------------------------------
C

CREATE TABLE [Tenants] (
  [TenantsID] INT NOT NULL PRIMARY KEY,
  [RentInfo] VARCHAR (10) NOT NULL,
  [UserName] VARCHAR (10) NOT NULL UNIQUE ,
  [Password] VARCHAR (20) NOT NULL ,
  [LeaseID] INT NOT NULL REFERENCES Lease(LeaseID),
  [FirstName] VARCHAR (10) NOT NULL ,
  [LastName] VARCHAR (10) NOT NULL ,
  [TenantInformation] VARCHAR (100) NOT NULL ,
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [MaintenanceService] (
  [MaintenanceServiceID] INT NOT NULL PRIMARY KEY,
  [TenantID] INT NOT NULL REFERENCES Tenants(TenantsID),
  [TypeOfMaintenance] VARCHAR (10) NOT NULL , 
 );
 
 -------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [MaintenanceStaff] (
  [MaintenanceStaffID] INT NOT NULL PRIMARY KEY,
  [MaintenanceServiceID] INT NOT NULL REFERENCES MaintenanceService (MaintenanceServiceID),
  [MaintenanceCategory] VARCHAR (20) NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE [GasUtility] (
  [GasUtilityID] INT NOT NULL PRIMARY KEY,
  [ProviderName] VARCHAR (20) NOT NULL,
  [UnitCost] INT NOT NULL,
  [AverageGasBill] AS dbo.AverageGasBill(UnitCost)
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [WifiUtilities] (
  [WiFiID] INT NOT NULL PRIMARY KEY,
  [ProviderName] VARCHAR (20) NOT NULL,
  [Cost] INT NOT NULL,
  [PlanName] VARCHAR (20) NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [ElectricityUtilities] (
  [ElectricityProviderID] INT NOT NULL PRIMARY KEY ,
  [ProviderName] VARCHAR (50) NOT NULL,
  [UnitCost] INT NOT NULL,
  [Billing] INT NOT NULL,
  [Emergency] VARCHAR (50) NOT NULL,
  [AverageElecticityBill] AS dbo.AverageElecticityBill(UnitCost)
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Utilities] (
  [UtilitiesID] INT NOT NULL PRIMARY KEY,
  [GasUtilityID] INT NOT NULL REFERENCES GasUtility(GasUtilityID),
  [ElectricityProviderID] INT NOT NULL REFERENCES ElectricityUtilities(ElectricityProviderID),
  [WifiID] INT NOT NULL REFERENCES WifiUtilities(WiFiID),
  
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Owner] (
  [OwnerID] INT NOT NULL PRIMARY KEY,
  [OwnerFirstName] Varchar(20) NOT NULL,
  [OwnerLastName] Varchar(20) NOT NULL,
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Agent] (
  [AgentID] INT  NOT NULL PRIMARY KEY,
  [AgentName] Varchar(50) NOT NULL,
  [EmailID] nvarchar(50) NOT NULL,
  [ContactNumber] Varchar(50) NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [FloorPlan] (
  [FloorPlanID] INT NOT NULL PRIMARY KEY,
  [NumberOfBathrooms] INT NOT NULL,
  [NumberOfRooms] INT NOT NULL,
  [AreaOfApartment] INT NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [ApartmentUnit] (
  [UnitID] INT NOT NULL PRIMARY KEY,
  [FloorPlanID] INT NOT NULL REFERENCES FloorPlan (FloorPlanID),
  [UtilitiesID] INT NOT NULL REFERENCES Utilities (UtilitiesID), 
  [OwnerID] INT NOT NULL REFERENCES Owner(OwnerID),
  [AgentID] INT NOT NULL REFERENCES Agent (AgentID),
  [TenantsID] INT NOT NULL REFERENCES Tenants(TenantsID),
  [Status] VARCHAR (20) NOT NULL, 
  [Rent] INT NOT NULL,  
  [Totalleaserent] AS dbo.totalleaserent(Rent)
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Building] (
  [BuildingID] INT NOT NULL PRIMARY KEY,
  [ManagementID] INT NOT NULL REFERENCES Management(ManagementID),
  [UnitID] INT NOT NULL REFERENCES ApartmentUnit (UnitID),
  [BuildingName] VARCHAR (20) NOT NULL , 
  [Location] VARCHAR (50) NOT NULL ,
  [Numberofunits] INT  NOT NULL
  
);

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [BuildingManager] (
  [BuildingManagerID] INT NOT NULL PRIMARY KEY,
  [BuildingID] INT NOT NULL REFERENCES Building(BuildingID),
  [Name] Varchar(30) NOT NULL,
  [EmailID] Varchar(50) NOT NULL,
  [ContactNumber] Varchar(20) NOT NULL,
 );

-------------------------------------------------------------------------------------------------------------------------------

