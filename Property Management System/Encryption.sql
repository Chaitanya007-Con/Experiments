-------- Column Data Encryption --------
											
-- Encrypting Password for Manager

use michan 


use michan1

-- DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Test_michan';
--drop master key

-- certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'Manager Test Certificate',
EXPIRY_DATE = '2026-10-31';

-- symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;


INSERT INTO Manager([ManagerID],[FirstName],[LastName],[Username],[Password])

VALUES ('8789','Gisela','Chang','Owen',EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'R86537')))



-----------------------------------------------------------------------------------------------------


---- External Command----
-- Close the symmetric key
CLOSE SYMMETRIC KEY TestSymmetricKey;

-- Drop the symmetric key
DROP SYMMETRIC KEY TestSymmetricKey;

-- Drop the certificate
DROP CERTIFICATE TestCertificate;

-- Drop the DMK
DROP MASTER KEY;
