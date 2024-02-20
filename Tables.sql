CREATE DATABASE ZOODB;
GO

USE ZOODB;
GO

CREATE TABLE Animals(
    Animals_name VARCHAR(50) PRIMARY KEY,
    Animals_age INT,
    Animals_res VARCHAR(50),	--where in the zoo the animals reside
    Animals_feedfr INT,	--animals feeding frequency in hours
    Animals_stay INT	-- how long the animlas have stayed at the zoo
);
GO

INSERT INTO ANIMALS (Animals_name, Animals_age, Animals_res, Animals_feedfr, Animals_stay)
VALUES ('Zebra',20, 'Outside',5,3);
GO

SELECT * FROM ANIMALS;

CREATE TABLE Visitors (
    VisitorID INT PRIMARY KEY,
    Name VARCHAR(200),
    VisitDate DATE,
    TicketType VARCHAR(200),
    MembershipStatus BOOLEAN
);
CREATE TABLE Habitats (
    HabitatID INT PRIMARY KEY,
    Type VARCHAR(255),
    Location VARCHAR(255),
    Capacity INT,
    ClimateSettings VARCHAR(255)
);

