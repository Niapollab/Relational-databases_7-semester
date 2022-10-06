-- Connect to XEPDB1 as SYS
--
CONN SYS/Passw0rd@XEPDB1 AS SYSDBA

-- Create new user
--
CREATE USER ME IDENTIFIED BY Passw0rd QUOTA UNLIMITED ON USERS;

-- Grant all privileges
--
GRANT ALL PRIVILEGES TO ME;