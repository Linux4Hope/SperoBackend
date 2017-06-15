DROP TABLE FinalProduct;


CREATE TABLE IF NOT EXISTS Users (
    userID      VARCHAR(36) NOT NULL PRIMARY KEY,
    firstName   VARCHAR(25),
    lastName    VARCHAR(25),
    email       VARCHAR(50),
    phone       VARCHAR(20),
    password    CHAR(32)
);

-- saving uuids binary
--CREATE TABLE Users (userID BINARY(16));
-- INSERT INTO Users (id, user) VALUES
--  (UNHEX(REPLACE(UUID(),'-','')), 'Jimmy');

--another way to implement uuid
-- create table usersTest(id varchar(36), name varchar(200));
-- insert into usersTest values(uuid(), 'Andromeda');

-- encrypting password
-- INSERT INTO users (username,password) VALUES ('testuser',md5('password'));

CREATE TABLE IF NOT EXISTS Guest (
    userID      VARCHAR(36) NOT NULL PRIMARY KEY,
    CONSTRAINT FK_UserGuest FOREIGN KEY (userID)
        REFERENCES Users(userID)
);

CREATE TABLE IF NOT EXISTS Officer (
    userID          VARCHAR(36) NOT NULL PRIMARY KEY,
    streetAddress   VARCHAR(50),
    city            VARCHAR(30),
    state           VARCHAR(25),
    zip             VARCHAR(15),
    CONSTRAINT FK_UserOfficer FOREIGN KEY (userID)
        REFERENCES Users(userID)
);

CREATE TABLE IF NOT EXISTS Branch (
    bLocation       VARCHAR(50) NOT NULL PRIMARY KEY,
    bStreetAddress  VARCHAR(50),
    bCity           VARCHAR(30),
    bState          VARCHAR(25),
    bZip            VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Income (
    bLocation       VARCHAR(50) NOT NULL,
    incomeDate      DATE NOT NULL,
    obtainedFrom    VARCHAR(50) NOT NULL,
    amount          DOUBLE,
    reason          TEXT,
    CONSTRAINT PK_Income PRIMARY KEY (bLocation, incomeDate, obtainedFrom),
    CONSTRAINT FK_BranchIncome FOREIGN KEY (bLocation)
        REFERENCES Branch(bLocation)
);

CREATE TABLE IF NOT EXISTS Expenses (
    bLocation       VARCHAR(50) NOT NULL,
    paymentDate     DATE NOT NULL,
    paidTo          VARCHAR(50) NOT NULL,
    amount          DOUBLE,
    reason          TEXT,
    CONSTRAINT PK_Income PRIMARY KEY (bLocation, paymentDate, paidTo),
    CONSTRAINT FK_BranchExpenses FOREIGN KEY (bLocation)
        REFERENCES Branch(bLocation)
);

CREATE TABLE IF NOT EXISTS Application (
    officerID       VARCHAR(36) NOT NULL,
    userID          VARCHAR(36) NOT NULL,
    bLocation       VARCHAR(50) NOT NULL,
    aDate           DATE NOT NULL,
    aStreetAddress  VARCHAR(50),
    aCity           VARCHAR(30),
    aState          VARCHAR(25),
    aZip            VARCHAR(15),
    status          VARCHAR(15),
    CONSTRAINT PK_Application PRIMARY KEY (officerID, userID, bLocation, aDate),
    CONSTRAINT FK_OfficerApplication FOREIGN KEY (officerID)
        REFERENCES Officer(userID),
    CONSTRAINT FK_UsersApplication FOREIGN KEY (userID)
        REFERENCES Users(userID),
    CONSTRAINT FK_BranchApplication FOREIGN KEY (bLocation)
        REFERENCES Branch(bLocation)
);

CREATE TABLE IF NOT EXISTS Donation (
    officerID       VARCHAR(36) NOT NULL,
    userID          VARCHAR(36) NOT NULL,
    bLocation       VARCHAR(50) NOT NULL,
    aDate           DATE NOT NULL,
    dQuestion       TEXT,
    CONSTRAINT PK_Donation PRIMARY KEY (officerID, userID, bLocation, aDate),
    CONSTRAINT FK_ApplicationDonation FOREIGN KEY (officerID, userID, bLocation, aDate)
        REFERENCES Application(officerID, userID, bLocation, aDate)
);

CREATE TABLE IF NOT EXISTS Request (
    officerID       VARCHAR(36) NOT NULL,
    userID          VARCHAR(36) NOT NULL,
    bLocation       VARCHAR(50) NOT NULL,
    aDate           DATE NOT NULL,
    rQuestion       TEXT,
    CONSTRAINT PK_Request PRIMARY KEY (officerID, userID, bLocation, aDate),
    CONSTRAINT FK_ApplicationRequest FOREIGN KEY (officerID, userID, bLocation, aDate)
        REFERENCES Application(officerID, userID, bLocation, aDate)
);

CREATE TABLE IF NOT EXISTS Part (
    officerID       VARCHAR(36),
    userID          VARCHAR(36),
    bLocation       VARCHAR(50),
    aDate           DATE,
    pSerialNumber   VARCHAR(50) NOT NULL PRIMARY KEY,
    pType           VARCHAR(50),
    notes           TEXT,
    CONSTRAINT FK_DonationPart FOREIGN KEY (officerID, userID, bLocation, aDate)
        REFERENCES Donation(officerID, userID, bLocation, aDate)
);

CREATE TABLE IF NOT EXISTS Computer (
    officerID           VARCHAR(36),
    userID              VARCHAR(36),
    bLocation           VARCHAR(50),
    aDate               DATE,
    cSerialNumber       VARCHAR(50) NOT NULL PRIMARY KEY,
    make                VARCHAR(50),
    model               VARCHAR(50),
    processor           VARCHAR(50),
    storage             VARCHAR(50),
    ram                 VARCHAR(50),
    conditionStatus     VARCHAR(50),
    recycledStatus      VARCHAR(50),
    notes               TEXT,
    CONSTRAINT FK_DonationComputer FOREIGN KEY (officerID, userID, bLocation, aDate)
        REFERENCES Donation(officerID, userID, bLocation, aDate)
);

CREATE TABLE IF NOT EXISTS Monetary (
    officerID           VARCHAR(36),
    userID              VARCHAR(36) NOT NULL,
    bLocation           VARCHAR(50) NOT NULL,
    aDate               DATE NOT NULL,
    amount              DOUBLE NOT NULL,
    CONSTRAINT PK_Monetary PRIMARY KEY (userID, bLocation, aDate, amount),
    CONSTRAINT FK_DonationMonetary FOREIGN KEY (officerID, userID, bLocation, aDate)
        REFERENCES Donation(officerID, userID, bLocation, aDate)
);

CREATE TABLE IF NOT EXISTS FinalProduct (
    officerID       VARCHAR(36) NOT NULL,
    userID          VARCHAR(36) NOT NULL,
    bLocation       VARCHAR(50) NOT NULL,
    aDate           DATE,
    dateDonated     DATE NOT NULL,
    operatingSystem VARCHAR(50),
    CONSTRAINT PK_FinalProduct PRIMARY KEY (officerID, userID, bLocation, dateDonated),
    CONSTRAINT FK_RequestFinalProduct FOREIGN KEY (officerID, userID, bLocation, aDate)
        REFERENCES Request(officerID, userID, bLocation, aDate)
);

CREATE TABLE IF NOT EXISTS FP_Parts (
    officerID       VARCHAR(36) NOT NULL,
    userID          VARCHAR(36) NOT NULL,
    bLocation       VARCHAR(50),
    dateDonated     DATE NOT NULL,
    pSerialNumber   VARCHAR(50) NOT NULL,
    CONSTRAINT PK_fpParts PRIMARY KEY (officerID, userID, dateDonated, pSerialNumber),
    CONSTRAINT FK_FinalProductParts FOREIGN KEY (officerID, userID, bLocation, dateDonated)
        REFERENCES FinalProduct(officerID, userID, bLocation, dateDonated),
    CONSTRAINT FK_PartFinalPart FOREIGN KEY (pSerialNumber)
        REFERENCES Part(pSerialNumber)
);

CREATE TABLE IF NOT EXISTS FP_PartComp (
    officerID       VARCHAR(36) NOT NULL,
    userID          VARCHAR(36) NOT NULL,
    bLocation       VARCHAR(50),
    dateDonated     DATE NOT NULL,
    cSerialNumber   VARCHAR(50) NOT NULL,
    pSerialNumber   VARCHAR(50) NOT NULL,
    CONSTRAINT PK_fpPartComp PRIMARY KEY (officerID, userID, dateDonated, cSerialNumber, pSerialNumber),
    CONSTRAINT FK_FinalProductPartComp FOREIGN KEY (officerID, userID, bLocation, dateDonated)
        REFERENCES FinalProduct(officerID, userID, bLocation, dateDonated),
    CONSTRAINT FK_PartFinalPartComp FOREIGN KEY (pSerialNumber)
        REFERENCES Part(pSerialNumber),
    CONSTRAINT FK_CompFinalPartComp FOREIGN KEY (cSerialNumber)
        REFERENCES Computer(cSerialNumber)
);

CREATE TABLE IF NOT EXISTS FP_Comp (
    officerID       VARCHAR(36) NOT NULL,
    userID          VARCHAR(36) NOT NULL,
    bLocation       VARCHAR(50),
    dateDonated     DATE NOT NULL,
    cSerialNumber   VARCHAR(50) NOT NULL,
    CONSTRAINT PK_fpPartComp PRIMARY KEY (officerID, userID, dateDonated, cSerialNumber),
    CONSTRAINT FK_FinalProductComp FOREIGN KEY (officerID, userID, bLocation, dateDonated)
        REFERENCES FinalProduct(officerID, userID, bLocation, dateDonated),
    CONSTRAINT FK_CompFinalComp FOREIGN KEY (cSerialNumber)
        REFERENCES Computer(cSerialNumber)
);