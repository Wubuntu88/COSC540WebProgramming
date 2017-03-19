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
    address varchar(30),
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
('b005', '22 Deer Rd', 'London', 'SW14EH'),
('b007', '16 Argyll St', 'Aberdeen', 'AB23SU'),
('b003', '163 Main St', 'Glasgow', 'G119QX'),
('b004', '32 Manse Rd', 'Bristol', 'BS991NZ'),
('b002', '64 Clover Dr', 'London', 'NW106EU');

/* INSERT INTO Branch */

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-1', 30000, 'b005'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', 12000, 'b003'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', 18000, 'b003'),
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-01-19', 9000, 'b007'),
('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', 24000, 'b003'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-3', 9000, 'b005');

/* INSERT INTO Client */


INSERT INTO Client
(ClientNo, fName, lName, telNo, prefType, maxRent, eMail)
VALUES 
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com'),
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com'),
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750, 'mritchie01@yahoo.co.uk'),
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.co.uk');

/* INSERT INTO PrivateOwner */
INSERT INTO PrivateOwner
(OwnerNo, fName, lName, address, telNo,  eMail, password)
VALUES 
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB27XW', '01224-861212', 'jkeogh@lhh.com', '12345'),
('CO87', 'Carol', 'Farrel', '6 Archray St, Glasgow G329DX', '0141-357-7419', 'cfarrel@gmail.com', '12345'),
('CO40', 'Tina', 'Murphy', '36 Well St, Glasgow G42', '0141-943-1728', 'tinam@hotmail.com', '12345'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G40QR', '0141-225-7025', 'tony.shaw@ark.com', '12345');

/* INSERT INTO PropertyForRent */
INSERT INTO PropertyForRent
(propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB755U', 'House', 6, 650, 'CO46', 'SA9', 'b007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87', 'SL41', 'b005'),
('PG4', '6 Lawrence St', 'Glasgow', 'G119QX', 'Flat', 3, 350, 'CO40', 'SG5', 'b003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G324QX', 'Flat', 3, 375, 'CO93', 'SG37', 'b003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'b003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G129AX', 'Flat', 4, 450, 'CO93', 'SG14', 'b003');

INSERT INTO Viewing
(clientNo, propertyNo, viewDate, comments)
VALUES
('CR56', 'PA14', '2013-05-24', 'too small'),
('CR76', 'PG4', '2013-04-20', 'too remote'),
('CR56', 'PG4', '2013-05-26', 'bad views'),
('CR62', 'PA14', '2013-05-14', 'no dining room'),
('CR56', 'PG36', '2013-04-28', 'small interior');






