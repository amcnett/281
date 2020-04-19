-- SQL Masking Review

-- (1) Create table with masking
-- (2) Mask the email and phone number as well with the mask you feel is most appropriate
-- (3) Modify SQL below where you find ?

CREATE TABLE Membership  
  (MemberID int IDENTITY PRIMARY KEY,  
   FirstName varchar(100) MASKED WITH (FUNCTION = 'partial(1,"XXXXXXX",0)') NULL,  
   LastName varchar(100) NOT NULL,  
   Phone varchar(12) NULL,  
   Email varchar(100) NULL);  

-- Insert Records
INSERT Membership (FirstName, LastName, Phone, Email) VALUES   
('Roberto', 'Tamburello', '555.123.4567', 'RTamburello@contoso.com'),  
('Janice', 'Galvin', '555.123.4568', 'JGalvin@contoso.com.co'),  
('Zheng', 'Mu', '555.123.4569', 'ZMu@contoso.net'); 
 
-- Give a user permissions to run "select" on this table
-- Add SQL below
--?
 
-- Run the query (you should see masked data)
-- Modify the "?" with the username
EXEC ('SELECT * FROM Membership') AS USER = '?'

-- Modify the user permissions and allow them to unmask the data
-- Modify the "?" with the username
GRANT UNMASK TO ?; 

-- Run the query (you should see unmasked data)
-- Modify the "?" with the username
EXEC ('SELECT * FROM Membership') AS USER = '?'
