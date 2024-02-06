CREATE DATABASE ZOODB;
GO

USE ZOODB;
GO

CREATE TABLE ANIMALS(
ANIMAL_NAME VARCHAR(50) PRIMARY KEY,
ANIMAL_AGE INT,
ANIMAL_RES VARCHAR(50),	--where in the zoo the animals reside
ANIMAL_FEEDFR INT,	--animals feeding frequency in hours
ANIMAL_STAY INT	-- how long the animlas have stayed at the zoo
);
GO

INSERT INTO ANIMALS (ANIMAL_NAME, ANIMAL_AGE, ANIMAL_RES, ANIMAL_FEEDFR, ANIMAL_STAY)
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

