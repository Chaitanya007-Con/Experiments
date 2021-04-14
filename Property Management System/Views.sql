
--View 

-------------------------------------------------------------------------------------------------------------------------------
------To view Tenants in the apartments
CREATE VIEW vwTenantsApartments 
AS
select T.TenantsID , T.FirstName , A.UnitID 
from dbo.Tenants T
INNER JOIN dbo.ApartmentUnit A
ON T.TenantsID=A.TenantsID ;

------
SELECT * FROM vwTenantsApartments ;
------
--DROP VIEW vwTenantsApartments ;

-------------------------------------------------------------------------------------------------------------------------------

-----To view Manager Information

CREATE VIEW vwManagement 
AS
select MT.ManagementID , MT.ManagementFirstName , MG.ManagerID , MG.FirstName
from dbo.Management MT 
INNER JOIN dbo.Manager MG
ON MT.ManagerID = MG.ManagerID ;

------
SELECT * FROM vwManagement ;
------
DROP VIEW vwManagement ;

-------------------------------------------------------------------------------------------------------------------------------

------To view Manager Details
CREATE VIEW vwBuildingManager 
AS
select bm.BuildingManagerID , bm.Name , bm.BuildingID , B.BuildingName
from dbo.BuildingManager bm
INNER JOIN dbo.Building  B
ON bm.BuildingID = B.BuildingID;
----
SELECT * FROM vwBuildingManager ;
-----
DROP VIEW vwBuildingManager ;

-------------------------------------------------------------------------------------------------------------------------------
