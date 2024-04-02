USE sys;
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal`  (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `animal_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `animal_dob` date NOT NULL,
  `animal_habitat` int NOT NULL,
  `animal_gender` int, -- 0 = male, 1 = female
  `animal_health` int, -- 0 = healthy, 1 = not healthy
  `animal_species` varchar(20) NOT NULL,
  `animal_status` int, -- 0 = healthy
  `animal_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`animal_id`) USING BTREE
  FOREIGN KEY `animal_habitat` REFERENCES `habitat`(`habitat_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES (1, 'Lion', '2010-01-01', 1, 'male','Healthy', 'Panthera Leo', 'Active', 'Leo');


-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_age` int check (employee_age >= 16),
  `employee_gender` ENUM('Male', 'Female', 'Other') NOT NULL, --  
  `employee_dob` date NOT NULL,
  `employee_ssn` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci UNIQUE,
  `employee_hours_worked` DECIMAL(10, 2) NOT NULL,
  `employee_salary` int NOT NULL,
  `hourly_rate` decimal(10,2),
  `overtime_hours` decimal(10,2),
  `overtime_pay` decimal(10,2),
  `employee_dept` int(11) NOT NULL,
  `employee_supe_id` int,
  `employee_type` varchar(250),
  `employee_role` int,
  
  PRIMARY KEY (`employee_id`) USING BTREE
  FOREIGN KEY(`employee_supe_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------


-- ----------------------------
-- Table structure for medical
-- ----------------------------
DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical`(
  `medical_sku` int NOT NULL AUTO_INCREMENT,
  `medical_checkup` tinyint,
  `medical_cost` decimal(10,2),
  `medical_status` int NOT NULL,
  `medical_quantity` int NOT NULL,
  `medical_id` int NOT NULL,
  `medical_supplier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
  `medical_expiry_date` date,
  `medical_storage_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vet_id` int,
  PRIMARY KEY (`medical_sku`) USING BTREE,
  FOREIGN KEY(`vet_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(`medical_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
-- ----------------------------
-- Records of medical
-- ----------------------------


-- ----------------------------
-- Table structure for health
-- ----------------------------
DROP TABLE IF EXISTS `health`;
CREATE TABLE `health`  (
  `health_id` int(11) AUTO_INCREMENT,
  `animal_id` int NOT NULL,
  `health_status` int NOT NULL,
  `recovery_status` int,
  `health_weight` double CHECK (health_weight >= 0),
  `health_height` double CHECK (health_height >= 0),
  `health_species` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`health_id`) USING BTREE
  FOREIGN KEY('animal_id') REDERENCES `animal`(`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of health
-- ----------------------------


-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci UNIQUE,
  `membership_type` int NOT NULL,
  `customer_age` int CHECK (customer_age >= 0),
  `customer_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
  `customer_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY(`customer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
-- ----------------------------
-- Records of customer
-- ----------------------------



-- ----------------------------
-- Table structure for closure
-- ----------------------------
DROP TABLE IF EXISTS `closure`;
CREATE TABLE `closure` (
  `closure_id` int  NOT NULL AUTO_INCREMENT,
  `temperature` double NOT NULL,
  `precipitation_chance` int CHECK (precipitation_change >= 0 AND precipitation_change <= 100),
  `weather_status` ENUM(`sunny`, `cloudy`, `raining`),
  `days_closed` int,
  `days_open` int,
  `hours_open` int,
  `hours_closed` int,
  `number_visitors` int NOT NULL,
  `number_employees` int NOT NULL,
  `contact_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`closure_id
  FOREIGN KEY (`customer_email`) REFERENCES `customer`(`customer_email`)  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
-- ----------------------------
-- Records of closure
-- ----------------------------




-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` ENUM(`ticket`, `food`, `gift`) NOT NULL,
  `transaction_time` datetime NOT NULL,
  `transaction_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`transaction_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of transaction
-- ----------------------------




-- ----------------------------
-- Table structure for gift shop
-- ----------------------------
DROP TABLE IF EXISTS `gift_shop`;
CREATE TABLE `gift_shop` (
  `gftshop_id` int NOT NULL AUTO_INCREMENT,
  `gftshop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gftshop_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gftshop_capacity` int,
  `gftshop_inventory` int,
  `gftshop_contact_info` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gftshop_manager_id` int,
  PRIMARY KEY (`gftshop_id`)
  FOREIGN KEY(`gftshop_manager_id`) REFERENCES `employee`(`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of gift shop
-- ----------------------------

-- ----------------------------
-- Table structure for food shop
-- ----------------------------
DROP TABLE IF EXISTS `food_shop`;
CREATE TABLE `food_shop` (
  `fdshop_id` int NOT NULL AUTO_INCREMENT,
  `fdshop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdshop_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdshop_capacity` int,
  `fdshop_inventory` int,
  `fdshop_contact_info` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdshop_manager_id` int,
  PRIMARY KEY (`fdshop_id`)
  FOREIGN KEY (`fdshop_manager_id`) REFERENCES `employee`(`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of shop
-- ----------------------------




-- ----------------------------
-- Table structure for habitat
-- ----------------------------
DROP TABLE IF EXISTS `habitat`;
CREATE TABLE `habitat`  (
  `habitat_id` int NOT NULL AUTO_INCREMENT,
  `habitat_size` double,
  `habitat_location` int,
  `habitat_temp` double NOT NULL,
  `habitat_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habitat_condition` int,
  `habitat_humidity` double,
  `habitat_security` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`habitat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of habitat
-- ----------------------------



-- ----------------------------
-- Table structure for the event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_organizer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `event_registration_deadline` date NOT NULL,
  `event_status` int NOT NULL,
  `event_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  FOREIGN KEY(`event_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of event
-- ----------------------------



-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `adm_id` int NOT NULL AUTO_INCREMENT,
  `adm_username` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
  `adm_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
  `adm_gender` ENUM(`Male`, `Female`, `Other`) NOT NULL,
  `adm_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`adm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'aa', '13812345678', 'male', '25', 'aaa', 'password123');
INSERT INTO `administrator` VALUES (2, 'bb', '13987654321', 'female', '30', 'bbb', 'admin456');
INSERT INTO `administrator` VALUES (3, 'cc', '13711112222', 'male', '28', 'ccc', 'pass987');
INSERT INTO `administrator` VALUES (4, 'dd', '13655556666', 'female', '22', 'ddd', 'secure789');
INSERT INTO `administrator` VALUES (5, 'ee', '13533334444', 'male', '35', 'eee', 'access567');
INSERT INTO `administrator` VALUES (6, 'test', '1234567890', 'male', '30', 'test1', 'test123');

-- ----------------------------
-- Table structure for gftshop inventory
-- ----------------------------
DROP TABLE IF EXISTS `gftshop_inventory`;
CREATE TABLE `gftshop_inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `gftshop_id` int(11) NOT NULL,
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  FOREIGN KEY (`gftshop_id`) REFERENCES `gift_shop` (`gftshop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of shop inventory
-- ----------------------------
INSERT INTO `gftshop_inventory` VALUES (1, 1, 'Penguin Toy', '50', '19.99');


-- ----------------------------
-- Table structure for fdshop inventory
-- ----------------------------
DROP TABLE IF EXISTS `fdshop_inventory`;
CREATE TABLE `fdshop_inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `fdshop_id` int(11) NOT NULL,
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  FOREIGN KEY (`fdshop_id`) REFERENCES `food_shop` (`fdshop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of shop inventory
-- ----------------------------
INSERT INTO `fdshop_inventory` VALUES (1, 1, 'Hambuger', '50', '5.99');


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
DROP ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW IF EXISTS `customer_contact_view`;
CREATE VIEW `customer_contact_view` AS
SELECT 
    customer_id,
    customer_name,
    customer_email,
    customer_phone,
    customer_address
FROM 
    customer;



--------------------------------------------------------
-- Trigger to automatically update animal health status
--------------------------------------------------------
DROP TRIGGER IF EXISTS `UpdateAnimalHealthStatus`;
DELIMITER ;;
CREATE TRIGGER `UpdateAnimalHealthStatus` AFTER INSERT ON medical FOR EACH ROW BEGIN
    UPDATE animal
    SET animal_health = NEW.medical_status
    WHERE animal_id = NEW.animal_id
END;

DELIMITER ;

------------------------------------
-- Trigger to log data changes
------------------------------------
DROP TRIGGER IF EXISTS `LogAdminChanges`;
DELIMITER ;;
CREATE TRIGGER `LogAdminChanges` AFTER UPDATE ON administrator FOR EACH ROW BEGIN
	INSERT INTO admin_changes_log(admin_id, operation_type, operation_time)
    VALUES (NEW.adm_id, 'UPDATE', NOW())
END;
DELIMITER ;

--------------------------------------------------------
-- Trigger to automatically calculate employee salaries
--------------------------------------------------------
DROP TRIGGER IF EXISTS `CalculateEmployeeSalary`;
DELIMITER ;;
CREATE TRIGGER `CalculateEmployeeSalary` AFTER UPDATE ON employee FOR EACH ROW BEGIN
  SET NEW.employee_salary = NEW.employee_hours_worked * NEW.employee_hourly_rate;
END;
DELIMITER ;
