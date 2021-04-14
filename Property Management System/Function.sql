
-- Function
-------------------------------------------------------------------------------------------------------------------------------

--Total Rent Function
CREATE FUNCTION dbo.totalleaserent(@Rent INT)
RETURNS INT
AS
BEGIN 
   RETURN 8*@Rent
END 

-------------------------------------------------------------------------------------------------------------------------------

--Total Average Electicity Bill Function
CREATE FUNCTION dbo.AverageElecticityBill(@UnitCost INT)
RETURNS INT
AS
BEGIN 
	--877 Kwh is average residential units of electricity usage
   RETURN 0.1*877*@UnitCost 
END 

-------------------------------------------------------------------------------------------------------------------------------

--Total Average Gas Bill Function
CREATE FUNCTION dbo.AverageGasBill(@UnitCost INT)
RETURNS INT
AS
BEGIN 
	--1200 Kwh is average residential units of gas usage
   RETURN 0.1*1200*@UnitCost 
END 

-------------------------------------------------------------------------------------------------------------------------------

