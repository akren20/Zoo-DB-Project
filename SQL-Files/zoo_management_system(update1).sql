USE sys;
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `adm_id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_age` int(3) NOT NULL,
  `adm_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`adm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal`  (
  `animal_id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `animal_dob` date NOT NULL,
  `animal_habitat` int NOT NULL,
  `animal_gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `animal_health` varchar(25) NOT NULL,
  `animal_species` varchar(20) NOT NULL,
  `animal_status` varchar(25) NOT NULL,
  `animal_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`animal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES (1, 'Lion', '2010-01-01', 1, 'male','Healthy', 'Panthera Leo', 'Active', 'Leo');

-- ----------------------------
-- Table structure for medical
-- ----------------------------
DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical`(
  `medical_sku` int(11) NOT NULL AUTO_INCREMENT,
  `medical_checkup` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meidical_cost` double NOT NULL,
  `medical_status` int NOT NULL,
  `medical_quantity` int NOT NULL,
  `animal_id` int(11) NOT NULL,
  `medical_supplier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `medical_expiry_date` date NOT NULL,
  `medical_storage_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`medical_sku`) USING BTREE,
  FOREIGN KEY(`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
-- ----------------------------
-- Records of medical
-- ----------------------------

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `ann_id` int(11) NOT NULL AUTO_INCREMENT,
  `ann_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ann_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ann_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ann_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (1, 'Open Time', 'Zoo will open at 9:00 AM to 6:00 PM。', '2024-01-15 10:00:00');-- 动物园开放时间，动物园将每天上午9点至下午6点开放。
INSERT INTO `announcement` VALUES (2, 'New Party', 'There is a new party with differnet animals.', '2024-02-05 14:30:00');-- 新展览开放，精彩新展览，展示罕见物种。
INSERT INTO `announcement` VALUES (3, 'Test Annouomcement', 'This is a test announcement', '2024-12-25 14:32:45');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `membership_type` int NOT NULL,
  `customer_age` int NOT NULL,
  `customer_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY(`customer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
-- ----------------------------
-- Records of customer
-- ----------------------------


-- ----------------------------
-- Table structure for habitat
-- ----------------------------
DROP TABLE IF EXISTS `habitat`;
CREATE TABLE `habitat`  (
  `habitat_id` int(11) NOT NULL AUTO_INCREMENT,
  `habitat_size` double NOT NULL,
  `habitat_location` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habitat_temp` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habitat_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habitat_condition` int(11) NOT NULL,
  `habitat_humidity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habitat_security` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habitat_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`habitat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of habitat
-- ----------------------------

-- ----------------------------
-- Table structure for weather
-- ----------------------------
DROP TABLE IF EXISTS `weather`;
CREATE TABLE `weather` (
	`weather_id` int(11)  NOT NULL AUTO_INCREMENT,
    `weather_date` datetime NULL DEFAULT NULL,
    `temperature` float NOT NULL,
    `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `is_open` tinyint(1) NOT NULL,
    PRIMARY KEY (`weather_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `weather` (`weather_date`,`temperature`,`description`, `is_open` ) VALUES
('2024-02-20', 25, 'Sunny', 1),
('2024-02-21', 15, 'Rainy', 0),
('2024-02-22', 22, 'Cloudy', 1),
('2024-02-23', 35, 'HOT', 1);



-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_age` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_dob` date NOT NULL,
  `employee_ssn` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_worked` double NOT NULL,
  `employee_salary` int(11) NOT NULL,
  `employee_dept` int(11) NOT NULL,
  `employee_supe` varchar(250),
  `employee_role` int (11) NOT NULL,
  
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staff
-- ----------------------------

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticket_time`datetime NOT NULL,
  `ticket_price` double NOT NULL,
  `ticket_date` date NOT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for gift shop
-- ----------------------------
DROP TABLE IF EXISTS `gift_shop`;
CREATE TABLE `gift_shop` (
  `gftshop_id` int(11) NOT NULL AUTO_INCREMENT,
  `gftshop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gftshop_location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gftshop_capacity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gftshop_inventory` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gftshop_contact_info` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gftshop_manager_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`gftshop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of gift shop
-- ----------------------------

-- ----------------------------
-- Table structure for food shop
-- ----------------------------
DROP TABLE IF EXISTS `food_shop`;
CREATE TABLE `food_shop` (
  `fdshop_id` int(11) NOT NULL AUTO_INCREMENT,
  `fdshop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdshop_location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdshop_capacity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdshop_inventory` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdshop_contact_info` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fdshop_manager_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fdshop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Table structure for gftshop inventory
-- ----------------------------
DROP TABLE IF EXISTS `gftshop_inventory`;
CREATE TABLE `shop_inventory` (
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
INSERT INTO `gftshop_inventory` VALUES (1, 1, 'Panguin Toy', '50', '$19.99');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `event_start_date` date NOT NULL,
  `event_end_date` date NOT NULL,
  `event_organizer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `event_registration_deadline` date NOT NULL,
  `event_start_time` time NOT NULL,
  `event_end_time` time NOT NULL,
  `event_status` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  FOREIGN KEY(`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of event
-- ----------------------------

-- ----------------------------
-- View structure for admin_view
-- ----------------------------
DROP VIEW IF EXISTS `admin_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `admin_view` AS SELECT adm_id, adm_username, adm_telephone, adm_sex, adm_age, adm_name
FROM administrator ;

-- ----------------------------
-- View structure for animal_view
-- ----------------------------
DROP VIEW IF EXISTS `animal_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `animal_view` AS SELECT an_id, an_type, an_sex, an_age, an_name
FROM animal ;

-- ----------------------------
-- View structure for announcement_view
-- ----------------------------
DROP VIEW IF EXISTS `announcement_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `announcement_view` AS SELECT ann_id, ann_title, ann_content, ann_date
FROM announcement ;

-- ----------------------------
-- View structure for place_view
-- ----------------------------
DROP VIEW IF EXISTS `place_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `place_view` AS SELECT pl_type, pl_capacity, pl_time
FROM place ;

-- ----------------------------
-- Procedure structure for InsertAdministrator
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertAdministrator`;
delimiter ;;
CREATE PROCEDURE `InsertAdministrator`(IN p_username VARCHAR(10),
    IN p_telephone VARCHAR(15),
    IN p_sex VARCHAR(2),
    IN p_age VARCHAR(3),
    IN p_name VARCHAR(5),
    IN p_password VARCHAR(15))
BEGIN
    INSERT INTO administrator (adm_username, adm_telephone, adm_sex, adm_age, adm_name, adm_password)
    VALUES (p_username, p_telephone, p_sex, p_age, p_name, p_password);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertAnimal
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertAnimal`;
delimiter ;;
CREATE PROCEDURE `InsertAnimal`(IN p_type VARCHAR(5),
    IN p_sex VARCHAR(2),
    IN p_age VARCHAR(3),
    IN p_name VARCHAR(5))
BEGIN
    INSERT INTO animal (an_type, an_sex, an_age, an_name)
    VALUES (p_type, p_sex, p_age, p_name);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertAnnouncement
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertAnnouncement`;
delimiter ;;
CREATE PROCEDURE `InsertAnnouncement`(IN p_title VARCHAR(100),
    IN p_content TEXT,
    IN p_date DATETIME)
BEGIN
    INSERT INTO announcement (ann_title, ann_content, ann_date)
    VALUES (p_title, p_content, p_date);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertPlace
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertPlace`;
delimiter ;;
CREATE PROCEDURE `InsertPlace`(IN p_type VARCHAR(5),
    IN p_capacity VARCHAR(15),
    IN p_time VARCHAR(50))
BEGIN
    INSERT INTO place (pl_type, pl_capacity, pl_time)
    VALUES (p_type, p_capacity, p_time);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AssNewshop
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddNewShop`;
DELIMITER ;;
CREATE PROCEDURE `AddNewShop`(
    IN p_shop_name VARCHAR(50),
    IN p_shop_location VARCHAR(100),
    IN p_shop_telephone VARCHAR(15),
    IN p_opening_hours VARCHAR(50)
)
BEGIN
    INSERT INTO shop (shop_name, shop_location, shop_telephone, opening_hours)
    VALUES (p_shop_name, p_shop_location, p_shop_telephone, p_opening_hours);
END;;
DELIMITER ;
-- ----------------------------
-- Procedure structure for UpdateInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `UpdateInventory`;
DELIMITER ;;
CREATE PROCEDURE `UpdateInventory`(
    IN p_shop_id INT,
    IN p_product_name VARCHAR(50),
    IN p_quantity INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    INSERT INTO shop_inventory (shop_id, product_name, quantity, price)
    VALUES (p_shop_id, p_product_name, p_quantity, p_price)
    ON DUPLICATE KEY UPDATE quantity = p_quantity, price = p_price;
END;;
DELIMITER ;


-- ----------------------------
-- Triggers structure for table announcement
-- ----------------------------
DROP TRIGGER IF EXISTS `set_announcement_date`;
delimiter ;;
CREATE TRIGGER `set_announcement_date` BEFORE INSERT ON `announcement` FOR EACH ROW BEGIN
    IF NEW.ann_date IS NULL THEN
        SET NEW.ann_date = NOW();
    END IF;
END
;;
delimiter ;



-- ----------------------------
-- Triggers structure for table ticket
-- ----------------------------
DROP TRIGGER IF EXISTS `update_ticket_last_modified`;
delimiter ;;
CREATE TRIGGER `update_ticket_last_modified` BEFORE INSERT ON `ticket` FOR EACH ROW BEGIN
    SET NEW.last_modified = NOW();
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tourists
-- ----------------------------
DROP TRIGGER IF EXISTS `update_tourist_last_modified`;
delimiter ;;
CREATE TRIGGER `update_tourist_last_modified` AFTER UPDATE ON `tourists` FOR EACH ROW UPDATE tourists SET last_modified = NOW() WHERE tou_id = NEW.tou_id
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
