CREATE DATABASE ZOODB;

USE ZOODB;

CREATE TABLE Animals(
    Animals_name VARCHAR(50) PRIMARY KEY,
    Animals_age INT,
    Animals_res VARCHAR(50),	--where in the zoo the animals reside
    Animals_feedfr INT,	--animals feeding frequency in hours
    Animals_stay INT	-- how long the animals have stayed at the zoo
);

INSERT INTO Animals (Animals_name, Animals_age, Animals_res, Animals_feedfr, Animals_stay)
VALUES ('Zebra', 20, 'Outside',5,3);

SELECT * FROM Animals;

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

