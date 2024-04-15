-- Create the zoodb schema if it does not exist
CREATE SCHEMA IF NOT EXISTS zoodb;

-- Use the zoodb schema
USE zoodb;

-- Temporarily disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables in reverse order of dependency
DROP TABLE IF EXISTS `transaction_log`;
DROP TABLE IF EXISTS `transaction`;
DROP TABLE IF EXISTS `medical`;
DROP TABLE IF EXISTS `health`;
DROP TABLE IF EXISTS `animal`;
DROP TABLE IF EXISTS `habitat`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `food_shop`;
DROP TABLE IF EXISTS `gift_shop`;
DROP TABLE IF EXISTS `event`;
DROP TABLE IF EXISTS `administrator`;







-- Create habitat table
CREATE TABLE `habitat` (
  `habitat_id` int NOT NULL AUTO_INCREMENT,
  `habitat_size` double,
  `habitat_location` int,
  `habitat_temp` double NOT NULL,
  `habitat_type` varchar(50) NOT NULL,
  `habitat_condition` int,
  `habitat_humidity` double,
  `habitat_security` varchar(100) NOT NULL,
  PRIMARY KEY (`habitat_id`)
);

-- Insert records into habitat
INSERT INTO `habitat` 
(`habitat_size`, `habitat_location`, `habitat_temp`, `habitat_type`, `habitat_condition`, `habitat_humidity`, `habitat_security`) 
VALUES 
(150.5, 101, 25.5, 'Forest', 3, 70.5, 'Fenced perimeter'),
(200.3, 102, 20.8, 'Aquarium', 4, 80.2, 'Underwater cameras'),
(180.2, 103, 28, 'Savanna', 2, 60, 'Ranger patrols'),
(120.8, 104, 18.5, 'Tundra', 1, 45.3, 'Barbed wire fence'),
(250, 105, 30.2, 'Desert', 3, 20, 'Security cameras'),
(190.7, 106, 22.6, 'Rainforest', 4, 85, 'Tree canopy observation'),
(130.4, 107, 17.8, 'Arctic', 2, 55.8, 'Remote sensors'),
(220.6, 108, 27.3, 'Grassland', 3, 75.6, 'Perimeter fence'),
(160.9, 109, 21.9, 'Wetland', 2, 65.4, 'Marshland surveillance'),
(140.2, 110, 19.7, 'Mountain', 3, 40.2, 'Mountain ranger patrols');








-- Create animal table
CREATE TABLE `animal` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `animal_type` varchar(25) NOT NULL,
  `animal_dob` date NOT NULL,
  `animal_habitat` int NOT NULL,
  `animal_gender` int,
  `animal_health` int,
  `animal_species` varchar(20) NOT NULL,
  `animal_status` int,
  `animal_name` varchar(25) NOT NULL,
  PRIMARY KEY (`animal_id`),
  FOREIGN KEY (`animal_habitat`) REFERENCES `habitat`(`habitat_id`)
);










-- Create employee table
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) NOT NULL,
  `employee_age` int CHECK (employee_age >= 16),
  `employee_gender` ENUM('Male', 'Female', 'Other') NOT NULL,
  `employee_dob` date NOT NULL,
  `employee_ssn` varchar(11) UNIQUE,
  `employee_hours_worked` DECIMAL(10, 2) NOT NULL,
  `employee_salary` int NOT NULL,
  `hourly_rate` decimal(10,2),
  `overtime_hours` decimal(10,2),
  `overtime_pay` decimal(10,2),
  `employee_dept` int NOT NULL,
  `employee_supe_id` int,
  `employee_type` varchar(250),
  `employee_role` int,
  `employee_phone` varchar(15) UNIQUE,
  `employee_email` varchar(50) NOT NULL UNIQUE,
  `employee_address` varchar(250) NOT NULL,
  PRIMARY KEY (`employee_id`),
  FOREIGN KEY(`employee_supe_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Insert records into employee
INSERT INTO `employee` 
(`employee_name`, `employee_age`, `employee_gender`, `employee_dob`, `employee_ssn`, `employee_hours_worked`, `employee_salary`, `hourly_rate`, `overtime_hours`, `overtime_pay`, `employee_dept`, `employee_supe_id`, `employee_type`, `employee_role`, `employee_phone`, `employee_email`, `employee_address`) 
VALUES 
('Thomas Leannon', 43, 'Male', '1979-08-26', 'SSN-001', 40, 3000, 25.00, 0, 0, 1, NULL, 'Type', 1, '4121091095', 'Thomas.Leannon@gfg.com', 'Address1'),
('Faye Sauer', 60, 'Male', '1962-06-28', 'SSN-002', 40, 3200, 25.00, 0, 0, 1, NULL, 'Type', 1, '4914696673', 'Faye.Sauer@gfg.com', 'Address2'),
('John Doe', 35, 'Male', '1989-05-15', 'SSN-003', 40, 2800, 25.00, 0, 0, 1, NULL, 'Type', 1, '1234567890', 'John.Doe@gfg.com', 'Address3'),
('Alice Smith', 28, 'Female', '1996-11-20', 'SSN-004', 40, 2600, 25.00, 0, 0, 1, NULL, 'Type', 1, '9876543210', 'Alice.Smith@gfg.com', 'Address4'),
('Michael Johnson', 45, 'Male', '1979-03-10', 'SSN-005', 40, 3100, 25.00, 0, 0, 1, NULL, 'Type', 1, '2468013579', 'Michael.Johnson@gfg.com', 'Address5'),
('Emily Brown', 31, 'Female', '1993-09-02', 'SSN-006', 40, 2700, 25.00, 0, 0, 1, NULL, 'Type', 1, '3692581470', 'Emily.Brown@gfg.com', 'Address6'),
('David Wilson', 52, 'Other', '1972-07-18', 'SSN-007', 40, 3300, 25.00, 0, 0, 1, NULL, 'Type', 1, '7531902468', 'David.Wilson@gfg.com', 'Address7'),
('Jessica Taylor', 40, 'Female', '1984-04-30', 'SSN-008', 40, 3000, 25.00, 0, 0, 1, NULL, 'Type', 1, '1593574802', 'Jessica.Taylor@gfg.com', 'Address8'),
('Daniel Anderson', 37, 'Male', '1987-02-14', 'SSN-009', 40, 2850, 25.00, 0, 0, 1, NULL, 'Type', 1, '8024671359', 'Daniel.Anderson@gfg.com', 'Address9'),
('Jennifer Martinez', 48, 'Female', '1976-12-05', 'SSN-010', 40, 3150, 25.00, 0, 0, 1, NULL, 'Type', 1, '4679135820', 'Jennifer.Martinez@gfg.com', 'Address10');






-- Create medical table
DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical`(
  `medical_name` varchar(100) NOT NULL,
  `medical_sku` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `medical_checkup` tinyint,
  `medical_cost` decimal(10,2),
  `medical_status` int NOT NULL,
  `medical_quantity` int NOT NULL,
  `medical_id` int NOT NULL ,
  `medical_supplier` varchar(100) NOT NULL,
  `medical_expiry_date` date,
  `medical_storage_location` varchar(255) NOT NULL,
  `vet_id` int,
  FOREIGN KEY(`vet_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(`medical_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE `medical` 
ALTER COLUMN `medical_supplier` SET DEFAULT 'NA';



-- insert into medical table
INSERT INTO `medical` 
(`medical_name`, `medical_sku`, `medical_checkup`, `medical_cost`, `medical_status`, `medical_quantity`, `medical_id`, `medical_expiry_date`, `medical_storage_location`, `vet_id`) 
VALUES 
('HealthyPets Inc.', 1001, 1, 120.50, 1, 50, 2001, '2025-06-30', 'Storage Room A', 3001),
('Vet Supplies Co.', 1002, 0, 75.80, 0, 100, 2002, '2024-12-15', 'Storage Room B', 3002),
('Animal Health Ltd.', 1003, 1, 200.25, 1, 30, 2003, '2024-11-20', 'Storage Room C', 3003),
('PetCare Solutions', 1004, 0, 90.00, 0, 80, 2004, '2025-03-15', 'Storage Room D', 3004),
('Animal Wellness Co.', 1005, 1, 150.00, 1, 20, 2005, '2025-08-10', 'Storage Room E', 3005),
('PetVet Supplies', 1006, 0, 80.50, 0, 60, 2006, '2024-10-25', 'Storage Room F', 3006),
('HealthyPets Inc.', 1007, 1, 135.75, 1, 45, 2007, '2025-05-05', 'Storage Room G', 3007),
('Vet Supplies Co.', 1008, 0, 95.25, 0, 70, 2008, '2024-09-20', 'Storage Room H', 3008),
('Animal Health Ltd', 1009, 1, 180.00, 1, 25, 2009, '2025-01-30', 'Storage Room I', 3009),
('PetCare Solutions', 1010, 0, 85.00, 0, 90, 2010, '2024-07-15', 'Storage Room J', 3010);


-- Create Health table
DROP TABLE IF EXISTS `health`;
CREATE TABLE `health` (
  `health_id` int AUTO_INCREMENT PRIMARY KEY,
  `animal_id` int NOT NULL,
  `health_status` int NOT NULL,
  `recovery_status` int,
  `health_weight` double CHECK (health_weight >= 0),
  `health_height` double CHECK (health_height >= 0),
  `health_species` varchar(20) NOT NULL,
  FOREIGN KEY(`animal_id`) REFERENCES `animal`(`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

 

-- Insert health data
















-- Create customer table
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_phone` varchar(15) UNIQUE,
  `membership_type` varchar(15) NOT NULL,
  `customer_age` int DEFAULT 0 CHECK (customer_age >= 0),
  `customer_email` varchar(50) NOT NULL UNIQUE,
  `customer_address` varchar(250) NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  PRIMARY KEY (`customer_id`)
);

-- Insert records into customer
INSERT INTO `customer`
(`customer_name`, `customer_email`, `customer_phone`, `customer_address`, `membership_type`) 
VALUES 
('John Doe', 'john@example.com', '123-456-7890', '123 Main St', 'Gold');







-- Create transaction table
CREATE TABLE `transaction` (
  `customer_name` VARCHAR(255) REFERENCES `customer`(`customer_name`) ON DELETE CASCADE,
  `customer_email` VARCHAR(255) REFERENCES `customer`(`customer_name`) ON DELETE CASCADE,
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` ENUM('ticket', 'food', 'gift') NOT NULL,
  `transaction_time` datetime NOT NULL,
  `transaction_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`transaction_id`)
);

ALTER TABLE `transaction` ADD COLUMN `quantity_purchased` INT;


-- Insert records into transaction
INSERT INTO `transaction` 
(`transaction_type`, `transaction_time`, `transaction_price`, `customer_name`, `customer_email`) 
VALUES 
('food', NOW(), 10.00, 'Alice', 'alice@example.com'),
('food', NOW(), 5.00, 'Bob', 'bob@example.com'),
('food', NOW(), 13.00, 'Janice', 'janice@example.com'),
('food', NOW(), 5.00, 'Luke', 'luke@example.com'),
('food', NOW(), 2.00, 'Carl', 'Carl@example.com'),
('food', NOW(), 3.00, 'Jenny', 'jenny@example.com'),
('gift', NOW(), 10.00, 'Alice', 'alice@example.com'),
('gift', NOW(), 5.00, 'Bob', 'bob@example.com');






-- Create transaction_log table
CREATE TABLE `transaction_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `transaction_type` ENUM('ticket', 'food', 'gift') NOT NULL,
  `transaction_time` datetime NOT NULL,
  `transaction_price` decimal(10,2) NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  PRIMARY KEY (`log_id`),
  FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`)
);




-- Create gift shop table
CREATE TABLE `gift_shop` (
  `gftshop_id` int NOT NULL AUTO_INCREMENT,
  `gftshop_name` varchar(100) NOT NULL,
  `gftshop_location` varchar(255) NOT NULL,
  `gftshop_capacity` int,
  `gftshop_inventory` int,
  `gftshop_contact_info` varchar(250) NOT NULL,
  `gftshop_manager_id` int,
  FOREIGN KEY (`gftshop_manager_id`) REFERENCES `employee` (`employee_id`),
  PRIMARY KEY (`gftshop_id`)
);







-- Create food shop table
CREATE TABLE `food_shop` (
  `fdshop_id` int NOT NULL AUTO_INCREMENT,
  `fdshop_name` varchar(100) NOT NULL,
  `fdshop_location` varchar(255) NOT NULL,
  `fdshop_capacity` int,
  `fdshop_inventory` int,
  `fdshop_contact_info` varchar(250) NOT NULL,
  `fdshop_manager_id` int,
  FOREIGN KEY (`fdshop_manager_id`) REFERENCES `employee`(`employee_id`),
  PRIMARY KEY (`fdshop_id`)
);






-- Create event table
CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_start_time` time NOT NULL,
  `event_end_time` time NOT NULL,
  `event_organizer` varchar(100) NOT NULL,
  `event_registration_deadline` date NOT NULL,
  `event_status` int NOT NULL,
  `event_employee_id` int NOT NULL,
  FOREIGN KEY (`event_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  PRIMARY KEY (`event_id`)
);

-- Insert records into event
INSERT INTO `event` 
(`event_name`, `event_start_date`, `event_end_date`, `event_organizer`, `event_registration_deadline`, `event_status`, `event_employee_id`, `event_start_time`, `event_end_time`) 
VALUES 
('Conference A', '2024-04-10', '2024-04-12', 'Organizer A', '2024-04-05', 1, 101, '09:00:00', '17:00:00'),
('Seminar B', '2024-05-15', '2024-05-15', 'Organizer B', '2024-05-10', 1, 102, '10:00:00', '13:00:00'),
('Workshop C', '2024-06-20', '2024-06-22', 'Organizer C', '2024-06-15', 1, 103, '13:00:00', '18:00:00'),
('Training D', '2024-07-05', '2024-07-07', 'Organizer D', '2024-06-30', 1, 104, '09:30:00', '16:30:00'),
('Convention E', '2024-08-12', '2024-08-14', 'Organizer E', '2024-08-05', 1, 105, '08:00:00', '18:00:00'),
('Exhibition F', '2024-09-25', '2024-09-27', 'Organizer F', '2024-09-20', 1, 106, '10:00:00', '16:00:00'),
('Symposium G', '2024-10-08', '2024-10-10', 'Organizer G', '2024-10-01', 1, 107, '09:00:00', '17:00:00'),
('Forum H', '2024-11-15', '2024-11-16', 'Organizer H', '2024-11-10', 1, 108, '11:00:00', '16:00:00'),
('Summit I', '2024-12-20', '2024-12-22', 'Organizer I', '2024-12-15', 1, 109, '09:30:00', '17:30:00'),
('Conference J', '2025-01-10', '2025-01-12', 'Organizer J', '2025-01-05', 1, 110, '08:30:00', '16:30:00');








-- Create administrator table
CREATE TABLE `administrator` (
  `adm_id` int NOT NULL AUTO_INCREMENT,
  `adm_username` varchar(11) NOT NULL UNIQUE,
  `adm_phone` varchar(20) NOT NULL UNIQUE,
  `adm_gender` ENUM('Male', 'Female', 'Other') NOT NULL,
  `adm_name` varchar(100) NOT NULL,
  `adm_password` varchar(255) NOT NULL,
  PRIMARY KEY (`adm_id`)
);

-- Insert records into administrator
INSERT INTO `administrator` 
(`adm_username`, `adm_phone`, `adm_gender`, `adm_name`, `adm_password`)
VALUES 
('admin1', '13812345678', 'Other', 'group11', 'password123');






/* Re-enable foreign key checks */
SET FOREIGN_KEY_CHECKS = 1;















DROP VIEW IF EXISTS `admin_view`;
DROP VIEW IF EXISTS `animal_view`;
DROP VIEW IF EXISTS `customer_contact_view`;
DROP VIEW IF EXISTS `employee_details_view`;
DROP VIEW IF EXISTS `event_overview_view`;


-- View structure for admin_view
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `admin_view` AS 
SELECT adm_id, 
  adm_username, 
  adm_name
FROM administrator;

-- View structure for animal_view
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `animal_view` AS 
SELECT animal_id, 
  animal_type, 
  animal_dob, 
  animal_habitat, 
  animal_gender,
  animal_health,
  animal_species,
  animal_status,
  animal_name
FROM animal;

-- View structure for customer contact
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `customer_contact_view` AS
SELECT 
    customer_id,
    customer_name,
    customer_email,
    customer_phone,
    customer_address
FROM 
    customer;

-- View structure for Employee Details
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `employee_details_view` AS
SELECT 
    employee_id,
    employee_name,
    employee_age,
    CASE 
        WHEN employee_gender = 'Male' THEN 'Male' 
        WHEN employee_gender = 'Female' THEN 'Female' 
        ELSE 'Other' 
    END AS gender,
    employee_dob,
    employee_salary,
    employee_hours_worked,
    hourly_rate,
    overtime_hours
FROM 
    employee;

-- View structure for Event Overview
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `event_overview_view` AS
SELECT 
    event_id,
    event_name,
    event_start_date,
    event_end_date,
    event_start_time,
    event_end_time,
    event_status
FROM 
    event;






-- Procedure to add an employee
DROP PROCEDURE IF EXISTS `AddEmployee`;
DELIMITER ;;
CREATE PROCEDURE `AddEmployee`(
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_gender ENUM('Male', 'Female', 'Other'),
    IN p_dob DATE,
    IN p_ssn VARCHAR(11),
    IN p_dept INT
)
BEGIN
    INSERT INTO employee (employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_dept)
    VALUES (p_name, p_age, p_gender, p_dob, p_ssn, p_dept);
END;;
DELIMITER ;

-- Procedure to delete an animal
DROP PROCEDURE IF EXISTS `DeleteAnimal`;
DELIMITER ;;
CREATE PROCEDURE `DeleteAnimal`(
    IN p_animal_id INT
)
BEGIN
    DELETE FROM animal WHERE animal_id = p_animal_id;
END;;
DELIMITER ;

-- Procedure to generate a monthly report
DROP PROCEDURE IF EXISTS `GenerateMonthlyReport`;
DELIMITER ;;
CREATE PROCEDURE `GenerateMonthlyReport`(
    IN p_month INT,
    IN p_year INT
)
BEGIN
    SELECT a.animal_id, a.animal_name, m.medical_checkup, m.medical_status
    FROM animal a
    JOIN medical m ON a.animal_id = m.medical_id
    WHERE MONTH(m.medical_expiry_date) = p_month AND YEAR(m.medical_expiry_date) = p_year;
END;;
DELIMITER ;







GRANT UPDATE, TRIGGER ON your_database.* TO 'admin';


-- Trigger to update animal health status
DROP TRIGGER IF EXISTS `update_animal_status`;
DELIMITER //
CREATE TRIGGER update_animal_status
AFTER INSERT ON health
FOR EACH ROW
BEGIN
    DECLARE v_animal_health INT;
    SELECT animal_health INTO v_animal_health FROM animal WHERE animal_id = NEW.animal_id;
    IF v_animal_health = 1 AND NEW.health_status = 0 THEN
        UPDATE animal SET animal_status = 0 WHERE animal_id = NEW.animal_id;
    END IF;
END //
DELIMITER ;









-- Trigger to track transactions
DROP TRIGGER IF EXISTS `track_transactions`;
DELIMITER //
CREATE TRIGGER track_transactions
AFTER INSERT ON transaction 
FOR EACH ROW 
BEGIN 
    INSERT INTO transaction_log (transaction_id, transaction_type, transaction_time, transaction_price, customer_name, customer_email) 
    VALUES (NEW.transaction_id, NEW.transaction_type, NEW.transaction_time, NEW.transaction_price, NEW.customer_name, NEW.customer_email); 
END //
DELIMITER ;

-- Reset the delimiter to standard SQL statement terminator
DELIMITER ;

-- Optionally, further SQL commands such as `SELECT` queries or additional `INSERT` operations could be included here.



