use Wi2017_436_wgilles1;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS PrivateOwner;
DROP TABLE IF EXISTS Viewing;
DROP TABLE IF EXISTS PropertyForRent;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Branch (
	branchNo int NOT NULL AUTO_INCREMENT,
    street varchar(20) NOT NULL,
    city varchar(15) NOT NULL,
    postcode varchar(5) NOT NULL,
    PRIMARY KEY(branchNo)
);

CREATE TABLE Staff (
	staffNo int NOT NULL AUTO_INCREMENT,
    fName varchar(15) NOT NULL,
    lName varchar(15) NOT NULL,
    position varchar(15) NOT NULL,
    sex varchar(5) NOT NULL,
    DOB date NOT NULL,
    salary int NOT NULL,
    branchNo int,
    PRIMARY KEY(staffNo),
    FOREIGN KEY(branchNo) REFERENCES Branch(branchNo)
);

CREATE TABLE Client( #client
	clientNo int NOT NULL AUTO_INCREMENT,
    fName varchar(20) NOT NULL,
    lName varchar(20) NOT NULL,
    telNo varchar(20),
    prefType varchar(20),
    maxRent int,
    eMail varchar(20),
    PRIMARY KEY(clientNo)
);

CREATE TABLE PrivateOwner(
	ownerNo int NOT NULL AUTO_INCREMENT,
    fName varchar(20) NOT NULL,
    lName varchar(20) NOT NULL,
	address varchar(20),
    telNo varchar(20),
    eMail varchar(20),
    password varchar(20) NOT NULL,
    PRIMARY KEY(ownerNo)
);

CREATE TABLE PropertyForRent (
	propertyNo int NOT NULL AUTO_INCREMENT,
    street varchar(20) NOT NULL,
    city varchar(15) NOT NULL,
    postcode varchar(5) NOT NULL,
    type varchar(10) NOT NULL,
    rooms int NOT NULL,
    rent int NOT NULL,
    ownerNo int NOT NULL,
    staffNo int NOT NULL,
    branchNo int NOT NULL,
    PRIMARY KEY(propertyNo),
    FOREIGN KEY(ownerNo) REFERENCES PrivateOwner(ownerNo),
    FOREIGN KEY(staffNo) REFERENCES Staff(staffNo),
    FOREIGN KEY(branchNo) REFERENCES Branch(branchNo)
);

CREATE TABLE Viewing(
	clientNo int NOT NULL,
    propertyNo int NOT NULL,
    viewDate date NOT NULL,
    comments varchar(50),
    PRIMARY KEY(clientNo, propertyNo, viewDate),
    FOREIGN KEY(clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY(propertyNo) REFERENCES PropertyForRent(propertyNo)
);













    