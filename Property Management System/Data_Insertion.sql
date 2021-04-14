--INSERT/ STORED PROCEDURE:

use michan1

-------------------------------------------------------------------------------------------------------------------------------
--	Stores Table
INSERT INTO Manager([ManagerID],[FirstName],[LastName],[Username],[Password])

VALUES ('8789','Gisela','Chang','Owen',EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'R86537')))

-------------------------------------------------------------------------------------------------------------------------------
-- ManagementStaff Table

INSERT INTO ManagementStaff([ManagementStaffID],[Name],[ManagementCategory]) 
VALUES('8986','Aidan Ellison','Repair '),('5568','Russell Ball','Repair '),('1865','Jessamine Stewart','Repair '),('7615','Gwendolyn Bush',' Leasing '),('1560','Hilel Valentine','Repair '),('8979','Barclay Snider',' Routine '),('2000','Audra Carr',' Emergency'),('7679','Nissim Trujillo',' Leasing '),('9559','Alma Moss',' Leasing '),('6833','Lamar Craig','Repair ');
-------------------------------------------------------------------------------------------------------------------------------

-- Management Table
INSERT INTO Management([ManagementID],[ManagerID],[ManagementstaffID],[ManagementFirstName],[ManagementLasttName],[OfficeLocation],[ContactInformation]) 
VALUES('5119','1790','1560','Dara','Jimenez','Retie','1012506878'),('4866','2670','1865','Paula','Day','Banjarmasin','7269450593'),('3698','4071','2000','Thomas','Peters','Scarborough','5954251459'),('9664','3589','5568','Edward','Cox','New Haven','3484710065'),('8441','4298','6833','Bethany','Leon','Bernburg','6589842618'),('6386','6301','7615','Stephanie','Wood','Gierle','4742268453'),('2632','6980','7679','Lunea','Cobb','Kurovskoye','9067113119'),('6002','7796','8979','Ciaran','Terry','Montoggio','5572907705'),('9848','8736','8986','Zachary','Houston','Ust-Katav','2001554295'),('1448','8789','9559','August','Keith','Rochester','9565231070');
-------------------------------------------------------------------------------------------------------------------------------
-- Lease Table

INSERT INTO Lease([LeaseID],[NumberofTenants],[StartDate],[EndDate],[UnitNumber],[BuildingNumber],[RentAmount])
VALUES('2778',2,'01-01-19','08-16-19',19,230,2983),('6431',3,'01-21-19','08-15-19',20,222,2565),('9643',4,'01-15-19','08-27-19',22,260,2488),('6025',1,'01-24-19','08-13-19',5,175,2218),('2230',3,'01-22-19','08-17-19',9,265,3464),('5280',3,'01-17-19','08-05-19',12,297,3464),('9443',1,'01-17-19','08-06-19',4,214,4488),('3740',3,'01-21-19','08-30-19',1,220,2578),('4019',4,'01-02-19','08-16-19',5,257,3539),('9619',3,'01-24-19','08-28-19',26,167,2130);

-------------------------------------------------------------------------------------------------------------------------------

-- Tenants Table
INSERT INTO Tenants([TenantsID],[RentInfo],[UserName],[Password],[LeaseID],[FirstName],[LastName],[TenantInformation]) 
VALUES('5770','Paid ','Isaac','Morbi','2230','Ashton','Atkinson','ac@congueelitsed.org'),('6655','Paid ','Hayfa','ante,','2778','Karly','Livingston','tellus.id@auctornunc.ca'),('5913','Paid ','Ann','In','3740','Tatum','House','lorem.vehicula.et@lectusasollicitudin.ca'),('8714',' Pending','Ria','Donec','4019','Cameron','Villarreal','eget.metus@Phasellus.com'),('9918','Paid ','Flynn','nec','5280','Cole','Wood','ornare@vitaeerat.net'),('4777','Paid ','Catherine','pretium','6025','Fiona','Medina','lectus.ante.dictum@libero.org'),('5191','Paid ','Austin','nulla','6431','Lester','Barnes','fames@odio.ca'),('9930',' Pending','Burke','Quisque','9443','Raven','Wagner','mauris.sapien@massaQuisque.ca'),('4280','Paid ','MacKenzie','elit.','9619','Illana','Craft','In@tincidunt.co.uk'),('3342',' Pending','Wylie','condimentum.','9643','Eleanor','Duran','augue.Sed@sedpedeCum.ca');
-------------------------------------------------------------------------------------------------------------------------------

-- MaintenanceService table

INSERT INTO MaintenanceService([MaintenanceServiceID],[TenantID],[TypeOfMaintenance]) 
VALUES('4245','3342',' Emergency '),('7711','4280',' Inspect '),('6146','4777','Repair '),('1882','5191',' Inspect '),('8657','5770',' Inspect '),('5961','5913',' Inspect '),('6831','6655','Repair '),('7349','8714',' Emergency '),('6279','9918',' Emergency '),('3144','9930',' Inspect ');

-------------------------------------------------------------------------------------------------------------------------------

--  MaintenanceStaff table

INSERT INTO MaintenanceStaff([MaintenanceStaffID],[MaintenanceServiceID],[MaintenanceCategory]) 
VALUES('2142','1882',' Emergency '),('6157','3144',' Routine '),('4792','4245',' Routine '),('8479','5961',' Emergency '),('8676','6146',' Emergency '),('4417','6279',' Emergency '),('5220','6831','Complaint '),('7356','7349',' Emergency '),('8289','7711',' Emergency '),('1238','8657','Complaint ');

-------------------------------------------------------------------------------------------------------------------------------

--  GasUtility table

INSERT INTO GasUtility([GasUtilityID],[ProviderName],[UnitCost])
VALUES('8700','Exxon Mobil ','1 '),('6507',' ConocoPhillips','1 '),('9865',' Anadarko ',' 2'),('1557',' Anadarko ',' 2'),('2175',' Anadarko ','1 '),('7192',' ConocoPhillips','1 '),('2144','Exxon Mobil ',' 2'),('8554',' ConocoPhillips',' 2'),('4251',' Anadarko ','1 '),('7601',' Anadarko ','1 ');

-------------------------------------------------------------------------------------------------------------------------------

--  WifiUtilities table

INSERT INTO WifiUtilities([WiFiID],[ProviderName],[Cost],[PlanName]) 
VALUES('6871',' Xfinity ',' 75 ','Beginner Bronze '),('9186',' Verizon',' 100',' Turbo Silver '),('5129',' Verizon','50 ',' Platinum '),('2454',' Xfinity ','50 ','Beginner Bronze '),('3147',' Verizon',' 75 ',' Turbo Silver '),('8913',' Verizon',' 75 ',' Platinum '),('8465','T-Mobile ','50 ',' Turbo Silver '),('7648',' Verizon',' 75 ','Beginner Bronze '),('7874',' Xfinity ',' 75 ',' Platinum '),('6793','T-Mobile ',' 75 ','Beginner Bronze ');

-------------------------------------------------------------------------------------------------------------------------------

-- ElectricityUtilities table

INSERT INTO ElectricityUtilities([ElectricityProviderID],[ProviderName],[UnitCost],[Billing],[Emergency]) 
VALUES('1389','Pacific Gas Electric ',' 2 ','184',' NO'),('8045',' Eversource ','1 ','264','YES '),('8346',' Eversource ',' 3','174',' NO'),('5336','Pacific Gas Electric ',' 2 ','179','YES '),('9966',' Southern California Edison',' 3','219',' NO'),('2552',' Eversource ','1 ','290','YES '),('5104',' Southern California Edison','1 ','73',' NO'),('3760',' Eversource ',' 3','117','YES '),('8572',' Southern California Edison','1 ','202','YES '),('6024','Pacific Gas Electric ','1 ','61','YES ');

-------------------------------------------------------------------------------------------------------------------------------
--  Utilities table

INSERT INTO Utilities([UtilitiesID],[GasUtilityID],[ElectricityProviderID],[WifiID])
VALUES('6704','1557','1389','2454'),('6782','2144','2552','3147'),('5108','8700','3760','5129'),('9927','2175','5104','6793'),('5669','4251','5336','6871'),('4986','6507','6024','7648'),('8747','7192','8045','7874'),('2005','7601','8346','8465'),('8470','8554','8572','8913'),('6142','9865','9966','9186');

-------------------------------------------------------------------------------------------------------------------------------

--  Owner table

INSERT INTO Owner([OwnerID],[OwnerFirstName],[OwnerLastName]) 
VALUES('5524','Yoko','Park'),('1625','Tanek','Hahn'),('3710','Kessie','Baxter'),('4869','Sybil','Albert'),('7125','Clark','Reilly'),('1396','Deanna','Gentry'),('9153','Evan','Mcintosh'),('6571','Charity','Holden'),('8173','Carolyn','Wiley'),('2299','Hayden','Silva');

-------------------------------------------------------------------------------------------------------------------------------

--  Agent table

INSERT INTO Agent([AgentID],[AgentName],[EmailID],[ContactNumber]) 
VALUES('8737','Diana Mccoy','a.arcu.Sed@vitaealiquameros.ca','5754234741'),('9748','Charity Simons','urna.suscipit@pharetra.org','5754214241'),('7686','Ishmael Bird','enim@tellus.net','3473666803'),('2367','Aidan Gilbert','risus.a.ultricies@sitametconsectetuer.ca','5754614451'),('2191','Ivory Gates','feugiat.nec.diam@faucibus.org','4836630819'),('2649','Martha Morris','odio.tristique@rhoncusDonec.org','7754214241'),('3318','Michael Marshall','Nulla.tempor@Crasvulputatevelit.ca','1888492831'),('6657','Rowan Wyatt','nec.urna@Nunclaoreet.org','9754214241'),('6344','Adam Charles','ullamcorper.Duis.cursus@nuncsed.edu','5732511984'),('6636','Elmo Walter','egestas@ipsum.org','2763087179');

-------------------------------------------------------------------------------------------------------------------------------

--  FloorPlan table

INSERT INTO FloorPlan([FloorPlanID],[NumberOfBathrooms],[NumberOfRooms],[AreaOfApartment])
VALUES('4309',' 3',' 3 ',2393),('2436',' 3',' 2',2582),('4958',' 2 ',' 2',2542),('2984',' 2 ',' 3 ',1956),('8315','1 ',' 2',2746),('7263',' 3','1',2132),('8996',' 2 ',' 4',2816),('2516','1 ',' 2',2542),('9657','1 ',' 2',1301),('7042','1 ',' 3 ',1327);

-------------------------------------------------------------------------------------------------------------------------------

--  ApartmentUnit table

INSERT INTO ApartmentUnit([UnitID],[FloorPlanID],[UtilitiesID],[OwnerID],[AgentID],[TenantsID],[Status],[Rent]) 
VALUES
('1314','2436','2005','1396','2191','3342','Unavailable',2969),
('5359','2516','4986','1625','2367','4280','Unavailable',2032),
('3177','2984','5108','2299','2649','4777','Unavailable',3444),
('8557','4309','5669','3710','3318','5191','Unavailable',3663),
('5802','4958','6142','4869','6344','5770','Unavailable',3887),
('1992','7042','6704','5524','6636','5913','Available ',3421),
('7004','7263','6782','6571','6657','6655','Available ',2267),
('6285','8315','8470','7125','7686','8714','Available ',2871),
('2696','8996','8747','8173','8737','9918','Unavailable',2398),
('1486','9657','9927','9153','9748','9930','Available ',2054);

-------------------------------------------------------------------------------------------------------------------------------

--  Building table

INSERT INTO Building([BuildingID],[ManagementID],[UnitID],[BuildingName],[Location],[Numberofunits]) 
VALUES
('1312','1448','1314','ipsum','Ap #668-1225 Pellentesque St.',28),
('7098','2632','1486','placerat','P.O. Box 673, 7302 Tortor St.',24),(
'7181','3698','1992','nisl.','Ap #812-221 Convallis Ave',39),(
'1467','4866','2696','mauris','P.O. Box 256, 2318 Aliquam Rd.',28),
('8555','5119','3177','sem','1924 Sit Ave',26),
('5262','6002','5359','magna','772-7434 Sociis Ave',40),
('6484','6386','5802','ante.','Ap #274-2719 Parturient Rd.',20),
('4339','8441','6285','sem,','P.O. Box 937, 5970 Non, Rd.',25),(
'7291','9664','7004','quis','Ap #660-3581 Risus Rd.',26),
('6816','9848','8557','nascetur','5497 Convallis Ave',38);

-------------------------------------------------------------------------------------------------------------------------------

--  BuildingManager table


INSERT INTO BuildingManager([BuildingManagerID],[BuildingID],[Name],[EmailID],[ContactNumber]) 
VALUES('8758','1312','Tyler Britt','turpis@velitegestas.co.uk','5215178120'),
('4311','1467','Jerry Talley','sagittis.augue.eu@at.com','2622255904'),
('6800','4339','Stacey Eaton','libero.Morbi@ornare.org','9827481645'),
('3079','5262','Penelope Rivas','pellentesque.tellus@sagittisDuisgravida.edu','3202190815'),
('8812','6484','Carl Barron','non@eu.edu','3894929861'),
('9098','6816','Fiona Rodriguez','adipiscing.elit.Curabitur@fermentum.org','7309788555'),
('5221','7098','Melinda Jenkins','accumsan.laoreet.ipsum@Quisque.org','7848868540'),
('6499','7181','Macaulay Harris','vel.lectus.Cum@cursuset.ca','9618761075'),
('9689','7291','Guinevere Garrett','placerat.Cras@interdum.com','2646419628'),
('1149','8555','Courtney Hopkins','eu.tellus@sagittis.ca','2792915968');

-------------------------------------------------------------------------------------------------------------------------------

--Procedure 

--totalleaserent procedure

CREATE FUNCTION dbo.totalleaserent(@Rent INT)
RETURNS INT
AS
BEGIN 
   RETURN 8*@Rent
END 

-------------------------------------------------------------------------------------------------------------------------------
--House availablity procedure

CREATE PROCEDURE displayapartment_info @Status varchar(20)
AS
SELECT * FROM dbo.ApartmentUnit WHERE Status = @Status 

EXEC displayapartment_info @Status = 'Available';












