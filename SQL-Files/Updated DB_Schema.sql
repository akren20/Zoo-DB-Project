-- Create the zoodb1 schema
CREATE DATABASE IF NOT EXISTS zoodb;

-- DROP DATABASE IF EXISTS zoodb;
-- Use the zoodb1 schema
USE zoodb;

-- ----------------------------
-- Table structure for habitat
-- ----------------------------
DROP TABLE IF EXISTS `habitat`;
CREATE TABLE `habitat` (
  `habitat_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `habitat_size` double,
  `habitat_location` int,
  `habitat_temp` double NOT NULL,
  `habitat_type` varchar(50) NOT NULL,
  `habitat_condition` int,
  `habitat_humidity` double,
  `habitat_security` varchar(100) NOT NULL
);


-- ----------------------------
-- Records of habitat
-- ----------------------------
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


-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal`  (
  `animal_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `animal_type` varchar(25) NOT NULL,
  `animal_dob` date NOT NULL,
  `animal_habitat` int NOT NULL,
  `animal_gender` int, -- 0 = male, 1 = female
  `animal_health` int, -- 0 = healthy, 1 = not healthy
  `animal_species` varchar(20) NOT NULL,
  `animal_status` int, -- 1 = seen already and 0 = has not been seen
  `animal_name` varchar(25) NOT NULL,
  FOREIGN KEY (`animal_habitat`) REFERENCES `habitat`(`habitat_id`)
);

ALTER TABLE `animal`
MODIFY COLUMN `animal_status` int DEFAULT 0;
-- ----------------------------
-- Records of animal
-- ----------------------------


-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `employee_name` varchar(100) NOT NULL,
  `employee_age` int check (employee_age >= 16),
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
  FOREIGN KEY(`employee_supe_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
); 


-- ----------------------------
-- Records of employee
-- ----------------------------
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


-- ----------------------------
-- Table structure for medical
-- ----------------------------
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

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Records of medical
-- ----------------------------
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

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Create the vet table
-- ----------------------------

DROP TABLE IF EXISTS `vet`;
CREATE TABLE `vet` (
  `vet_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `vet_name` varchar(100) NOT NULL,
  `vet_specialization` varchar(100),
  `patient_checkup` tinyint DEFAULT 0, -- 0 indicates no pending checkup
  `patient_id` int,
  FOREIGN KEY(`patient_id`) REFERENCES `animal`(`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
-- Table structure for health
-- ----------------------------
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



-- ----------------------------
-- Records of health
-- ----------------------------


-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `customer_phone` varchar(15) UNIQUE,
  `membership_type` varchar(15) NOT NULL,
  `customer_age` int DEFAULT 0 CHECK (customer_age >= 0),
  `customer_email` varchar(50) NOT NULL UNIQUE,
  `customer_address` varchar(250) NOT NULL,
  `customer_name` varchar(250) NOT NULL
);

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer`
(`customer_name`, `customer_email`, `customer_phone`, `customer_address`, `membership_type`) 
VALUES 
('John Doe', 'john@example.com', '123-456-7890', '123 Main St', 'Gold');



-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `customer_name` VARCHAR(255) REFERENCES `customer`(`customer_name`) ON DELETE CASCADE,
  `customer_email` VARCHAR(255) REFERENCES `customer`(`customer_name`) ON DELETE CASCADE,
  `transaction_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `transaction_type` ENUM('ticket', 'food', 'gift') NOT NULL,
  `transaction_time` datetime NOT NULL,
  `transaction_price` decimal(10,2) NOT NULL
);

ALTER TABLE `transaction` ADD COLUMN `quantity_purchased` INT;

-- ----------------------------
-- Records of transaction
-- ----------------------------
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




-- ----------------------------
-- Table structure for gift shop
-- ----------------------------
DROP TABLE IF EXISTS `gift_shop`;
CREATE TABLE `gift_shop` (
  `gftshop_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `gftshop_name` varchar(100) NOT NULL,
  `gftshop_location` varchar(255) NOT NULL,
  `gftshop_capacity` int,
  `gftshop_inventory` int,
  `gftshop_contact_info` varchar(250) NOT NULL,
  `gftshop_manager_id` int,
  FOREIGN KEY (`gftshop_manager_id`) REFERENCES `employee` (`employee_id`)
);

-- ----------------------------
-- Records of gift shop
-- ----------------------------

-- ----------------------------
-- Table structure for food shop
-- ----------------------------
DROP TABLE IF EXISTS `food_shop`;
CREATE TABLE `food_shop` (
  `fdshop_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `fdshop_name` varchar(100) NOT NULL,
  `fdshop_location` varchar(255) NOT NULL,
  `fdshop_capacity` int,
  `fdshop_inventory` int,
  `fdshop_contact_info` varchar(250) NOT NULL,
  `fdshop_manager_id` int,
  FOREIGN KEY (`fdshop_manager_id`) REFERENCES `employee`(`employee_id`)
);

-- ----------------------------
-- Employee records
-- ----------------------------
CREATE TABLE IF NOT EXISTS employee_audit (
  audit_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT,
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  description VARCHAR(255),
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);





-- ----------------------------
-- Table structure for the event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `event_name` varchar(100) NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_start_time` time NOT NULL,
  `event_end_time` time NOT NULL,
  `event_organizer` varchar(100) NOT NULL,
  `event_registration_deadline` date NOT NULL,
  `event_status` int NOT NULL,
  `event_employee_id` int NOT NULL,
  FOREIGN KEY (`event_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
);


SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` 
(`event_id`, `event_name`, `event_start_date`, `event_end_date`, `event_organizer`, `event_registration_deadline`, `event_status`, `event_employee_id`, `event_start_time`, `event_end_time`) 
VALUES 
(1, 'Conference A', '2024-04-10', '2024-04-12', 'Organizer A', '2024-04-05', 1, 101, '09:00:00', '17:00:00'),
(2, 'Seminar B', '2024-05-15', '2024-05-15', 'Organizer B', '2024-05-10', 1, 102, '10:00:00', '13:00:00'),
(3, 'Workshop C', '2024-06-20', '2024-06-22', 'Organizer C', '2024-06-15', 1, 103, '13:00:00', '18:00:00'),
(4, 'Training D', '2024-07-05', '2024-07-07', 'Organizer D', '2024-06-30', 1, 104, '09:30:00', '16:30:00'),
(5, 'Convention E', '2024-08-12', '2024-08-14', 'Organizer E', '2024-08-05', 1, 105, '08:00:00', '18:00:00'),
(6, 'Exhibition F', '2024-09-25', '2024-09-27', 'Organizer F', '2024-09-20', 1, 106, '10:00:00', '16:00:00'),
(7, 'Symposium G', '2024-10-08', '2024-10-10', 'Organizer G', '2024-10-01', 1, 107, '09:00:00', '17:00:00'),
(8, 'Forum H', '2024-11-15', '2024-11-16', 'Organizer H', '2024-11-10', 1, 108, '11:00:00', '16:00:00'),
(9, 'Summit I', '2024-12-20', '2024-12-22', 'Organizer I', '2024-12-15', 1, 109, '09:30:00', '17:30:00'),
(10, 'Conference J', '2025-01-10', '2025-01-12', 'Organizer J', '2025-01-05', 1, 110, '08:30:00', '16:30:00');

-- Re-enable foreign key constraint
SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `adm_id` int NOT NULL AUTO_INCREMENT,
  `adm_username` varchar(11) NOT NULL UNIQUE,
  `adm_phone` varchar(20) NOT NULL UNIQUE,
  `adm_gender` ENUM('Male', 'Female', 'Other') NOT NULL,
  `adm_name` varchar(100) NOT NULL,
  `adm_password` varchar(255) NOT NULL,
  PRIMARY KEY (`adm_id`)
);


-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` 
(`adm_id`, `adm_username`, `adm_phone`, `adm_gender`, `adm_name`, `adm_password`)
VALUES 
(1, 'a', '13812345678', 'Other', 'group11', 'a');

-- ----------------------------
-- Table structure for gftshop inventory
-- ----------------------------
DROP TABLE IF EXISTS `gift_shop`;
CREATE TABLE `gift_shop` (
  `gftshop_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `product_name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL
);



-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `cart_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user_id` int NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `customer`(`customer_id`)
);

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cart_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `quantity` int NOT NULL,
  FOREIGN KEY (`cart_id`) REFERENCES `carts`(`cart_id`),
  FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`ticket_id`)
);

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `ticket_type` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
);




-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` (`ticket_type`, `price`)
VALUES
('General', 15.00),
('Bronze', 20.00),
('Silver', 25.00),
('Gold', 30.00);





-- ----------------------------
-- Records of shop inventory
-- ----------------------------


-- ----------------------------
-- Table structure for fdshop inventory
-- ----------------------------
DROP TABLE IF EXISTS `food_shop`;
CREATE TABLE `food_shop` (
  `inventory_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `gftshop_id` int NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  FOREIGN KEY (`gftshop_id`) REFERENCES `gift_shop` (`gftshop_id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `register_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `register_fname` varchar(100) NOT NULL,
  `register_lname` varchar(100) NOT NULL,
  `register_type` varchar(8) NOT NULL, -- user type
  `register_username` varchar(100) NOT NULL,
  `register_password` varchar(250) NOT NULL
);

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `login_username` varchar(100) NOT NULL,
  `login_password` varchar(250) NOT NULL
--   FOREIGN KEY (`login_username`) REFERENCES `register` (`register_username`),
--   FOREIGN KEY (`login_password`) REFERENCES `register` (`register_password`)
);

CREATE INDEX idx_register_username ON register(register_username);
CREATE INDEX idx_register_password ON register(register_password);


SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Records of shop inventory
-- ----------------------------
INSERT INTO `food_shop` VALUES (1, 1, 'Hambuger', '50', '5.99');
SET FOREIGN_KEY_CHECKS = 1;




-- ----------------------------
-- View structure for admin_view
-- ----------------------------
DROP VIEW IF EXISTS `admin_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `admin_view` AS 
SELECT adm_id, 
  adm_username, 
  adm_name
FROM administrator ;

-- ----------------------------
-- View structure for animal_view
-- ----------------------------
DROP VIEW IF EXISTS `animal_view`;
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

-- ----------------------------
-- View structure for customer contact
-- ----------------------------
DROP VIEW IF EXISTS `customer_contact_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `customer_contact_view` AS
SELECT 
    customer_id,
    customer_name,
    customer_email,
    customer_phone,
    customer_address
FROM 
    customer;

-- ----------------------------
-- View structure for Employee Details
-- ----------------------------
DROP VIEW IF EXISTS `employee_details_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `employee_details_view` AS
SELECT 
    employee_id,
    employee_name,
    employee_age,
    CASE 
        WHEN employee_gender = 0 THEN 'Male' 
        ELSE 'Female' 
    END AS gender,
    employee_dob,
    employee_salary,
    employee_hours_worked,
    hourly_rate,
    overtime_hours
FROM 
    employee;

-- ----------------------------
-- View structure for Event Overview
-- ----------------------------
DROP VIEW IF EXISTS `event_overview_view`;
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

-- ----------------------------
-- View structure for animal_health_report_view
-- ----------------------------
DROP VIEW IF EXISTS `animal_health_report_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `animal_health_report_view` AS 
SELECT 
    a.animal_id,
    a.animal_name,
    a.animal_species,
    CASE 
        WHEN a.animal_health = 0 THEN 'Healthy'
        WHEN a.animal_health = 1 THEN 'Not Healthy'
        ELSE 'Unknown'
    END AS health_status,
    m.medical_checkup,
    m.medical_cost,
    m.medical_status,
    m.medical_expiry_date AS next_checkup_due
FROM 
    animal a
INNER JOIN 
    medical m ON a.animal_id = m.medical_id;

DROP PROCEDURE IF EXISTS `AddEmployee`;
delimiter ;;
CREATE PROCEDURE `AddEmployee`(
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_gender INT,
    IN p_dob DATE,
    IN p_ssn VARCHAR(11),
    IN p_dept INT)
BEGIN
    INSERT INTO employee (employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_dept)
    VALUES (p_name, p_age, p_gender, p_dob, p_ssn, p_dept);
END;
--Add employee.
--exp: CALL AddEmployee('xxx xxx', 30, 0, '1999-01-01', '123-45-6789'. 1);


DROP PROCEDURE IF EXISTS `DeleteAnimal`;
delimiter ;;
CREATE PROCEDURE `DeleteAnimal`(
    IN p_animal_id INT)
BEGIN
    DELETE FROM animal
    WHERE animal_id = p_animal_id;
END;
--delete animal with animal_id
--exp: CALL DeleteAnimal(2)

DROP PROCEDURE IF EXISTS `GenerateMonthlyReport`;
delimiter ;;
CREATE PROCEDURE `GenerateMonthlyReport`(
    IN p_month INT,
    IN p_year INT)
BEGIN
    SELECT a.animal_id, a.animal_name, m.medical_checkup, m.medical_status
    FROM animal a
    JOIN medical m ON a.animal_id = m.medical_id
    WHERE MONTH(m.medical_checkup) = p_month AND YEAR(m.medical_checkup) = p_year;
END;

CREATE TABLE `transaction_log` (
  `transaction_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `transaction_type` ENUM('ticket', 'food', 'gift') NOT NULL,
  `transaction_time` datetime NOT NULL,
  `transaction_price` decimal(10,2) NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
   FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`)
);

-- Generate monthly report of animal's health.
-- exp: CALL GenerateMonthlyReport(4,2023);

-- ------------------------------------------------------
-- Trigger to automatically update animal health status
-- ------------------------------------------------------
GRANT UPDATE, TRIGGER ON your_database.* TO 'admin';

-- Create a trigger to update animal_status and set patient_checkup in vet table
-- whenever a new health record is inserted, the trigger will update the animal_health and animal_status fields in 
-- the animal table, with animal_status defaulting to 0 if it's a new entry incdicating that the animal needs to have its first checkup. Additionally, it will set patient_checkup to 
-- 0 in the vet table for the corresponding vet.

DELIMITER //
CREATE TRIGGER update_animal_health AFTER INSERT ON health
FOR EACH ROW
BEGIN
    -- Update animal_health and animal_status
    UPDATE animal 
    SET animal_health = NEW.health_status,
        animal_status = 0
    WHERE animal_id = NEW.animal_id;

    -- Set patient_checkup to 0 in the vet table
    UPDATE vet SET patient_checkup = 0 WHERE vet_id = NEW.vet_id;
END;
//
DELIMITER ;

DELIMITER //
-- This trigger will prevent the deletion of animals from the animal table if they have associated medical records in the medical table.
-- to make sure that an animal's medical records have not accidentally been cleared/deleted from the database if they are still part of the zoo.
-- 
CREATE TRIGGER prevent_delete_animal BEFORE DELETE ON animal
FOR EACH ROW
BEGIN
    DECLARE med_count INT;
    SELECT COUNT(*) INTO med_count FROM medical WHERE medical_id = OLD.animal_id;
    IF med_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete animal with associated medical records';
    END IF;
END;
//
DELIMITER ;
-- trigger if any updates were made to employee table
DELIMITER $$
CREATE TRIGGER AfterEmployeeUpdate
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
   INSERT INTO employee_audit(employee_id, description)
   VALUES (OLD.employee_id, CONCAT('Updated employee data from ', OLD.name, ' to ', NEW.name));
END$$

DELIMITER ;

-- ALTER USER 'admin'@'70-138-67-151.lightspeed.hstntx.sbcglobal.net' IDENTIFIED BY 'umadb123!';


-- select * from employee;


