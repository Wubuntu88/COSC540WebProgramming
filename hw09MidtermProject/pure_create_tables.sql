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