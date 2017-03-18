use Wi2017_436_wgilles1;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS PrivateOwner;
DROP TABLE IF EXISTS Viewing;
DROP TABLE IF EXISTS PropertyForRent;

SET FOREIGN_KEY_CHECKS = 1;

#2&3

CREATE TABLE Branch (
    branchNo varchar(8) NOT NULL,
    street varchar(20) NOT NULL,
    city varchar(15) NOT NULL,
    postcode varchar(8) NOT NULL,
    PRIMARY KEY(branchNo)
);

CREATE TABLE Staff (
    staffNo varchar(8) NOT NULL,
    fName varchar(15) NOT NULL,
    lName varchar(15) NOT NULL,
    position varchar(15) NOT NULL,
    sex varchar(5) NOT NULL,
    DOB date NOT NULL,
    salary int NOT NULL,
    branchNo varchar(8) NOT NULL,
    PRIMARY KEY(staffNo),
    FOREIGN KEY(branchNo) REFERENCES Branch(branchNo)
);

CREATE TABLE Client( #client
    clientNo varchar(8) NOT NULL,
    fName varchar(20) NOT NULL,
    lName varchar(20) NOT NULL,
    telNo varchar(20),
    prefType varchar(20),
    maxRent int,
    eMail varchar(30),
    PRIMARY KEY(clientNo)
);

CREATE TABLE PrivateOwner(
    ownerNo varchar(8) NOT NULL,
    fName varchar(20) NOT NULL,
    lName varchar(20) NOT NULL,
    address varchar(20),
    telNo varchar(20),
    eMail varchar(30),
    password varchar(20) NOT NULL,
    PRIMARY KEY(ownerNo)
);

CREATE TABLE PropertyForRent (
    propertyNo varchar(8) NOT NULL,
    street varchar(20) NOT NULL,
    city varchar(15) NOT NULL,
    postcode varchar(8) NOT NULL,
    type varchar(10) NOT NULL,
    rooms int NOT NULL,
    rent int NOT NULL,
    ownerNo varchar(8) NOT NULL,
    staffNo varchar(8) NOT NULL,
    branchNo varchar(8) NOT NULL,
    PRIMARY KEY(propertyNo),
    FOREIGN KEY(ownerNo) REFERENCES PrivateOwner(ownerNo),
    FOREIGN KEY(staffNo) REFERENCES Staff(staffNo),
    FOREIGN KEY(branchNo) REFERENCES Branch(branchNo)
);

CREATE TABLE Viewing(
    clientNo varchar(8) NOT NULL,
    propertyNo varchar(8) NOT NULL,
    viewDate date NOT NULL,
    comments varchar(50),
    PRIMARY KEY(clientNo, propertyNo, viewDate),
    FOREIGN KEY(clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY(propertyNo) REFERENCES PropertyForRent(propertyNo)
);

#4) Populate the bales with at least three records each.  Show the INSERT commands.
# After the tables are populated, show the contents of all tables.

/* INSERT INTO Branch */

INSERT INTO Branch
(branchNo, street, city, postcode)
VALUES 
('b005', '22 Deer Rd', 'London', 'SW14EH');

INSERT INTO Branch
(branchNo, street, city, postcode)
VALUES 
('b007', '16 Argyll St', 'Aberdeen', 'AB23SU');

INSERT INTO Branch
(branchNo, street, city, postcode)
VALUES 
('b003', '163 Main St', 'Glasgow', 'G119QX');

INSERT INTO Branch
(branchNo, street, city, postcode)
VALUES 
('b004', '32 Manse Rd', 'Bristol', 'BS991NZ');

INSERT INTO Branch
(branchNo, street, city, postcode)
VALUES 
('b002', '64 Clover Dr', 'London', 'NW106EU');

/* INSERT INTO Branch */

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-1', 30000, 'b005');

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', 12000, 'b003');

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', 18000, 'b003');

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-01-19', 9000, 'b007');

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', 24000, 'b003');

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-3', 9000, 'b005');

/* INSERT INTO Client */


INSERT INTO Client
(ClientNo, fName, lName, telNo, prefType, maxRent, eMail)
VALUES 
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com');

INSERT INTO Client
(ClientNo, fName, lName, telNo, prefType, maxRent, eMail)
VALUES 
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com');

INSERT INTO Client
(ClientNo, fName, lName, telNo, prefType, maxRent, eMail)
VALUES 
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750, 'mritchie01@yahoo.co.uk');

INSERT INTO Client
(ClientNo, fName, lName, telNo, prefType, maxRent, eMail)
VALUES 
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.co.uk');














