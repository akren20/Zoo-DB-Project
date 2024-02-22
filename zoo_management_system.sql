
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `adm_id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_age` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
  `an_id` int(11) NOT NULL AUTO_INCREMENT,
  `an_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `an_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `an_age` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `an_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`an_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES (1, 'Lion', 'male', '5', 'Leo');
INSERT INTO `animal` VALUES (2, 'Elephont', 'female', '8', 'Ella');
INSERT INTO `animal` VALUES (3, 'Panguin', 'female', '2', 'Penny');
INSERT INTO `animal` VALUES (4, 'Test', 'female', '4', 'Test');

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
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`  (
  `pl_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pl_capacity` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pl_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pl_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES ('Panguin Zone', '40', '11:00:00 - 15:00:00');
INSERT INTO `place` VALUES ('Elephont Zone', '30', '10:00:00 - 16:00:00');
INSERT INTO `place` VALUES ('Lion Zone', '50', '09:00:00 - 17:00:00');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `sta_id` int(11) NOT NULL AUTO_INCREMENT,
  `sta_username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sta_telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sta_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sta_age` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sta_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sta_password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sta_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, 'staff1', '111222333', 'male', '28', 'zzz', 'staffpass');
INSERT INTO `staff` VALUES (2, 'staff2', '444888999', 'male', '28', 'yyy', 'staff456');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ti_id` int(11) NOT NULL AUTO_INCREMENT,
  `ti_category` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ti_quantity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ti_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (1, 'Adult Ticket', '100', NULL);
INSERT INTO `ticket` VALUES (2, 'Child Ticket', '50', NULL);
INSERT INTO `ticket` VALUES (3, 'Student Ticket', '30', NULL);
INSERT INTO `ticket` VALUES (12, 'Adult Ticket', '50', '2024-12-25 14:46:29');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shop_location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shop_telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opening_hours` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, 'Panguin Shop', 'Panguin Zone', '1112223333', '11:00 - 17:00');

-- ----------------------------
-- Table structure for shop inventory
-- ----------------------------
DROP TABLE IF EXISTS `shop_inventory`;
CREATE TABLE `shop_inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- Records of shop inventory
-- ----------------------------
INSERT INTO `shop` VALUES (1, 1, 'Panguin Toy', '50', '$19.99');

-- ----------------------------
-- Table structure for tourists
-- ----------------------------
DROP TABLE IF EXISTS `tourists`;
CREATE TABLE `tourists`  (
  `tou_id` int(11) NOT NULL AUTO_INCREMENT,
  `tou_username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tou_telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tou_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tou_age` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tou_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tou_password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tou_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tourists
-- ----------------------------
INSERT INTO `tourists` VALUES (1, 'Guest 1', '987654321', 'female', '25', 'Vister 1', 'password123');
INSERT INTO `tourists` VALUES (2, 'Guest 2', '555666777', 'male', '30', 'Vister 2', 'pass456');

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