CREATE DATABASE  IF NOT EXISTS `zoodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zoodb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: zoodb.cfmqaom2q89a.us-east-2.rds.amazonaws.com    Database: zoodb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Temporary view structure for view `admin_view`
--

DROP TABLE IF EXISTS `admin_view`;
/*!50001 DROP VIEW IF EXISTS `admin_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin_view` AS SELECT 
 1 AS `adm_id`,
 1 AS `adm_username`,
 1 AS `adm_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `adm_id` int NOT NULL AUTO_INCREMENT,
  `adm_username` varchar(11) NOT NULL,
  `adm_phone` varchar(20) NOT NULL,
  `adm_gender` enum('Male','Female','Other') NOT NULL,
  `adm_name` varchar(100) NOT NULL,
  `adm_password` varchar(255) NOT NULL,
  PRIMARY KEY (`adm_id`),
  UNIQUE KEY `adm_username` (`adm_username`),
  UNIQUE KEY `adm_phone` (`adm_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'a','13812345678','Other','group11','a');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `animal_type` varchar(25) NOT NULL,
  `animal_dob` date NOT NULL,
  `animal_habitat` int NOT NULL,
  `animal_gender` int DEFAULT NULL,
  `animal_health` int DEFAULT NULL,
  `animal_species` varchar(20) NOT NULL,
  `animal_status` int DEFAULT '0',
  `animal_name` varchar(25) NOT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `animal_habitat` (`animal_habitat`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`animal_habitat`) REFERENCES `habitat` (`habitat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `animal_health_report_view`
--

DROP TABLE IF EXISTS `animal_health_report_view`;
/*!50001 DROP VIEW IF EXISTS `animal_health_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `animal_health_report_view` AS SELECT 
 1 AS `animal_id`,
 1 AS `animal_name`,
 1 AS `animal_species`,
 1 AS `health_status`,
 1 AS `medical_checkup`,
 1 AS `medical_cost`,
 1 AS `medical_status`,
 1 AS `next_checkup_due`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `animal_view`
--

DROP TABLE IF EXISTS `animal_view`;
/*!50001 DROP VIEW IF EXISTS `animal_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `animal_view` AS SELECT 
 1 AS `animal_id`,
 1 AS `animal_type`,
 1 AS `animal_dob`,
 1 AS `animal_habitat`,
 1 AS `animal_gender`,
 1 AS `animal_health`,
 1 AS `animal_species`,
 1 AS `animal_status`,
 1 AS `animal_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_phone` varchar(15) DEFAULT NULL,
  `membership_type` varchar(15) NOT NULL,
  `customer_age` int DEFAULT '0',
  `customer_email` varchar(50) NOT NULL,
  `customer_address` varchar(250) NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_email` (`customer_email`),
  UNIQUE KEY `customer_phone` (`customer_phone`),
  CONSTRAINT `customer_chk_1` CHECK ((`customer_age` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'123-456-7890','Gold',0,'john@example.com','123 Main St','John Doe');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_contact_view`
--

DROP TABLE IF EXISTS `customer_contact_view`;
/*!50001 DROP VIEW IF EXISTS `customer_contact_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_contact_view` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `customer_email`,
 1 AS `customer_phone`,
 1 AS `customer_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) NOT NULL,
  `employee_age` int DEFAULT NULL,
  `employee_gender` enum('Male','Female','Other') NOT NULL,
  `employee_dob` date NOT NULL,
  `employee_ssn` varchar(11) DEFAULT NULL,
  `employee_hours_worked` decimal(10,2) NOT NULL,
  `employee_salary` int NOT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `overtime_hours` decimal(10,2) DEFAULT NULL,
  `overtime_pay` decimal(10,2) DEFAULT NULL,
  `employee_dept` int NOT NULL,
  `employee_supe_id` int DEFAULT NULL,
  `employee_type` varchar(250) DEFAULT NULL,
  `employee_role` int DEFAULT NULL,
  `employee_phone` varchar(15) DEFAULT NULL,
  `employee_email` varchar(50) NOT NULL,
  `employee_address` varchar(250) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_email` (`employee_email`),
  UNIQUE KEY `employee_ssn` (`employee_ssn`),
  UNIQUE KEY `employee_phone` (`employee_phone`),
  KEY `employee_supe_id` (`employee_supe_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`employee_supe_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_chk_1` CHECK ((`employee_age` >= 16))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Thomas Leannon',43,'Male','1979-08-26','SSN-001',40.00,3000,25.00,0.00,0.00,1,NULL,'Type',1,'4121091095','Thomas.Leannon@gfg.com','Address1'),(2,'Faye Sauer',60,'Male','1962-06-28','SSN-002',40.00,3200,25.00,0.00,0.00,1,NULL,'Type',1,'4914696673','Faye.Sauer@gfg.com','Address2'),(3,'John Doe',35,'Male','1989-05-15','SSN-003',40.00,2800,25.00,0.00,0.00,1,NULL,'Type',1,'1234567890','John.Doe@gfg.com','Address3'),(4,'Alice Smith',28,'Female','1996-11-20','SSN-004',40.00,2600,25.00,0.00,0.00,1,NULL,'Type',1,'9876543210','Alice.Smith@gfg.com','Address4'),(5,'Michael Johnson',45,'Male','1979-03-10','SSN-005',40.00,3100,25.00,0.00,0.00,1,NULL,'Type',1,'2468013579','Michael.Johnson@gfg.com','Address5'),(6,'Emily Brown',31,'Female','1993-09-02','SSN-006',40.00,2700,25.00,0.00,0.00,1,NULL,'Type',1,'3692581470','Emily.Brown@gfg.com','Address6'),(7,'David Wilson',52,'Other','1972-07-18','SSN-007',40.00,3300,25.00,0.00,0.00,1,NULL,'Type',1,'7531902468','David.Wilson@gfg.com','Address7'),(8,'Jessica Taylor',40,'Female','1984-04-30','SSN-008',40.00,3000,25.00,0.00,0.00,1,NULL,'Type',1,'1593574802','Jessica.Taylor@gfg.com','Address8'),(9,'Daniel Anderson',37,'Male','1987-02-14','SSN-009',40.00,2850,25.00,0.00,0.00,1,NULL,'Type',1,'8024671359','Daniel.Anderson@gfg.com','Address9'),(10,'Jennifer Martinez',48,'Female','1976-12-05','SSN-010',40.00,3150,25.00,0.00,0.00,1,NULL,'Type',1,'4679135820','Jennifer.Martinez@gfg.com','Address10');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_details_view`
--

DROP TABLE IF EXISTS `employee_details_view`;
/*!50001 DROP VIEW IF EXISTS `employee_details_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_details_view` AS SELECT 
 1 AS `employee_id`,
 1 AS `employee_name`,
 1 AS `employee_age`,
 1 AS `gender`,
 1 AS `employee_dob`,
 1 AS `employee_salary`,
 1 AS `employee_hours_worked`,
 1 AS `hourly_rate`,
 1 AS `overtime_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  PRIMARY KEY (`event_id`),
  KEY `event_employee_id` (`event_employee_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Conference A','2024-04-10 00:00:00','2024-04-12 00:00:00','09:00:00','17:00:00','Organizer A','2024-04-05',1,101),(2,'Seminar B','2024-05-15 00:00:00','2024-05-15 00:00:00','10:00:00','13:00:00','Organizer B','2024-05-10',1,102),(3,'Workshop C','2024-06-20 00:00:00','2024-06-22 00:00:00','13:00:00','18:00:00','Organizer C','2024-06-15',1,103),(4,'Training D','2024-07-05 00:00:00','2024-07-07 00:00:00','09:30:00','16:30:00','Organizer D','2024-06-30',1,104),(5,'Convention E','2024-08-12 00:00:00','2024-08-14 00:00:00','08:00:00','18:00:00','Organizer E','2024-08-05',1,105),(6,'Exhibition F','2024-09-25 00:00:00','2024-09-27 00:00:00','10:00:00','16:00:00','Organizer F','2024-09-20',1,106),(7,'Symposium G','2024-10-08 00:00:00','2024-10-10 00:00:00','09:00:00','17:00:00','Organizer G','2024-10-01',1,107),(8,'Forum H','2024-11-15 00:00:00','2024-11-16 00:00:00','11:00:00','16:00:00','Organizer H','2024-11-10',1,108),(9,'Summit I','2024-12-20 00:00:00','2024-12-22 00:00:00','09:30:00','17:30:00','Organizer I','2024-12-15',1,109),(10,'Conference J','2025-01-10 00:00:00','2025-01-12 00:00:00','08:30:00','16:30:00','Organizer J','2025-01-05',1,110);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `event_overview_view`
--

DROP TABLE IF EXISTS `event_overview_view`;
/*!50001 DROP VIEW IF EXISTS `event_overview_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `event_overview_view` AS SELECT 
 1 AS `event_id`,
 1 AS `event_name`,
 1 AS `event_start_date`,
 1 AS `event_end_date`,
 1 AS `event_start_time`,
 1 AS `event_end_time`,
 1 AS `event_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `food_shop`
--

DROP TABLE IF EXISTS `food_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_shop` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `gftshop_id` int NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `gftshop_id` (`gftshop_id`),
  CONSTRAINT `food_shop_ibfk_1` FOREIGN KEY (`gftshop_id`) REFERENCES `gift_shop` (`gftshop_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_shop`
--

LOCK TABLES `food_shop` WRITE;
/*!40000 ALTER TABLE `food_shop` DISABLE KEYS */;
INSERT INTO `food_shop` VALUES (1,1,'Hambuger',50,5.99);
/*!40000 ALTER TABLE `food_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_shop`
--

DROP TABLE IF EXISTS `gift_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_shop` (
  `gftshop_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`gftshop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_shop`
--

LOCK TABLES `gift_shop` WRITE;
/*!40000 ALTER TABLE `gift_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitat` (
  `habitat_id` int NOT NULL AUTO_INCREMENT,
  `habitat_size` double DEFAULT NULL,
  `habitat_location` int DEFAULT NULL,
  `habitat_temp` double NOT NULL,
  `habitat_type` varchar(50) NOT NULL,
  `habitat_condition` int DEFAULT NULL,
  `habitat_humidity` double DEFAULT NULL,
  `habitat_security` varchar(100) NOT NULL,
  PRIMARY KEY (`habitat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
INSERT INTO `habitat` VALUES (1,150.5,101,25.5,'Forest',3,70.5,'Fenced perimeter'),(2,200.3,102,20.8,'Aquarium',4,80.2,'Underwater cameras'),(3,180.2,103,28,'Savanna',2,60,'Ranger patrols'),(4,120.8,104,18.5,'Tundra',1,45.3,'Barbed wire fence'),(5,250,105,30.2,'Desert',3,20,'Security cameras'),(6,190.7,106,22.6,'Rainforest',4,85,'Tree canopy observation'),(7,130.4,107,17.8,'Arctic',2,55.8,'Remote sensors'),(8,220.6,108,27.3,'Grassland',3,75.6,'Perimeter fence'),(9,160.9,109,21.9,'Wetland',2,65.4,'Marshland surveillance'),(10,140.2,110,19.7,'Mountain',3,40.2,'Mountain ranger patrols');
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health`
--

DROP TABLE IF EXISTS `health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health` (
  `health_id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int NOT NULL,
  `health_status` int NOT NULL,
  `recovery_status` int DEFAULT NULL,
  `health_weight` double DEFAULT NULL,
  `health_height` double DEFAULT NULL,
  `health_species` varchar(20) NOT NULL,
  PRIMARY KEY (`health_id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `health_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `health_chk_1` CHECK ((`health_weight` >= 0)),
  CONSTRAINT `health_chk_2` CHECK ((`health_height` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health`
--

LOCK TABLES `health` WRITE;
/*!40000 ALTER TABLE `health` DISABLE KEYS */;
/*!40000 ALTER TABLE `health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical`
--

DROP TABLE IF EXISTS `medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical` (
  `medical_name` varchar(100) NOT NULL,
  `medical_sku` int NOT NULL AUTO_INCREMENT,
  `medical_checkup` tinyint DEFAULT NULL,
  `medical_cost` decimal(10,2) DEFAULT NULL,
  `medical_status` int NOT NULL,
  `medical_quantity` int NOT NULL,
  `medical_id` int NOT NULL,
  `medical_supplier` varchar(100) NOT NULL DEFAULT 'NA',
  `medical_expiry_date` date DEFAULT NULL,
  `medical_storage_location` varchar(255) NOT NULL,
  `vet_id` int DEFAULT NULL,
  PRIMARY KEY (`medical_sku`),
  KEY `vet_id` (`vet_id`),
  KEY `medical_id` (`medical_id`),
  CONSTRAINT `medical_ibfk_1` FOREIGN KEY (`vet_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medical_ibfk_2` FOREIGN KEY (`medical_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical`
--

LOCK TABLES `medical` WRITE;
/*!40000 ALTER TABLE `medical` DISABLE KEYS */;
INSERT INTO `medical` VALUES ('HealthyPets Inc.',1001,1,120.50,1,50,2001,'NA','2025-06-30','Storage Room A',3001),('Vet Supplies Co.',1002,0,75.80,0,100,2002,'NA','2024-12-15','Storage Room B',3002),('Animal Health Ltd.',1003,1,200.25,1,30,2003,'NA','2024-11-20','Storage Room C',3003),('PetCare Solutions',1004,0,90.00,0,80,2004,'NA','2025-03-15','Storage Room D',3004),('Animal Wellness Co.',1005,1,150.00,1,20,2005,'NA','2025-08-10','Storage Room E',3005),('PetVet Supplies',1006,0,80.50,0,60,2006,'NA','2024-10-25','Storage Room F',3006),('HealthyPets Inc.',1007,1,135.75,1,45,2007,'NA','2025-05-05','Storage Room G',3007),('Vet Supplies Co.',1008,0,95.25,0,70,2008,'NA','2024-09-20','Storage Room H',3008),('Animal Health Ltd',1009,1,180.00,1,25,2009,'NA','2025-01-30','Storage Room I',3009),('PetCare Solutions',1010,0,85.00,0,90,2010,'NA','2024-07-15','Storage Room J',3010);
/*!40000 ALTER TABLE `medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` enum('ticket','food','gift') NOT NULL,
  `transaction_time` datetime NOT NULL,
  `transaction_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('Alice','alice@example.com',1,'food','2024-04-10 03:31:32',10.00),('Bob','bob@example.com',2,'food','2024-04-10 03:31:32',5.00),('Janice','janice@example.com',3,'food','2024-04-10 03:31:32',13.00),('Luke','luke@example.com',4,'food','2024-04-10 03:31:32',5.00),('Carl','Carl@example.com',5,'food','2024-04-10 03:31:32',2.00),('Jenny','jenny@example.com',6,'food','2024-04-10 03:31:32',3.00),('Alice','alice@example.com',7,'gift','2024-04-10 03:31:32',10.00),('Bob','bob@example.com',8,'gift','2024-04-10 03:31:32',5.00);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vet`
--

DROP TABLE IF EXISTS `vet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vet` (
  `vet_id` int NOT NULL AUTO_INCREMENT,
  `vet_name` varchar(100) NOT NULL,
  `vet_specialization` varchar(100) DEFAULT NULL,
  `patient_checkup` tinyint DEFAULT '0',
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`vet_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `vet_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vet`
--

LOCK TABLES `vet` WRITE;
/*!40000 ALTER TABLE `vet` DISABLE KEYS */;
/*!40000 ALTER TABLE `vet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `admin_view`
--

/*!50001 DROP VIEW IF EXISTS `admin_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_view` AS select `administrator`.`adm_id` AS `adm_id`,`administrator`.`adm_username` AS `adm_username`,`administrator`.`adm_name` AS `adm_name` from `administrator` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `animal_health_report_view`
--

/*!50001 DROP VIEW IF EXISTS `animal_health_report_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `animal_health_report_view` AS select `a`.`animal_id` AS `animal_id`,`a`.`animal_name` AS `animal_name`,`a`.`animal_species` AS `animal_species`,(case when (`a`.`animal_health` = 0) then 'Healthy' when (`a`.`animal_health` = 1) then 'Not Healthy' else 'Unknown' end) AS `health_status`,`m`.`medical_checkup` AS `medical_checkup`,`m`.`medical_cost` AS `medical_cost`,`m`.`medical_status` AS `medical_status`,`m`.`medical_expiry_date` AS `next_checkup_due` from (`animal` `a` join `medical` `m` on((`a`.`animal_id` = `m`.`medical_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `animal_view`
--

/*!50001 DROP VIEW IF EXISTS `animal_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `animal_view` AS select `animal`.`animal_id` AS `animal_id`,`animal`.`animal_type` AS `animal_type`,`animal`.`animal_dob` AS `animal_dob`,`animal`.`animal_habitat` AS `animal_habitat`,`animal`.`animal_gender` AS `animal_gender`,`animal`.`animal_health` AS `animal_health`,`animal`.`animal_species` AS `animal_species`,`animal`.`animal_status` AS `animal_status`,`animal`.`animal_name` AS `animal_name` from `animal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_contact_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_contact_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_contact_view` AS select `customer`.`customer_id` AS `customer_id`,`customer`.`customer_name` AS `customer_name`,`customer`.`customer_email` AS `customer_email`,`customer`.`customer_phone` AS `customer_phone`,`customer`.`customer_address` AS `customer_address` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_details_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_details_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_details_view` AS select `employee`.`employee_id` AS `employee_id`,`employee`.`employee_name` AS `employee_name`,`employee`.`employee_age` AS `employee_age`,(case when (`employee`.`employee_gender` = 0) then 'Male' else 'Female' end) AS `gender`,`employee`.`employee_dob` AS `employee_dob`,`employee`.`employee_salary` AS `employee_salary`,`employee`.`employee_hours_worked` AS `employee_hours_worked`,`employee`.`hourly_rate` AS `hourly_rate`,`employee`.`overtime_hours` AS `overtime_hours` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `event_overview_view`
--

/*!50001 DROP VIEW IF EXISTS `event_overview_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `event_overview_view` AS select `event`.`event_id` AS `event_id`,`event`.`event_name` AS `event_name`,`event`.`event_start_date` AS `event_start_date`,`event`.`event_end_date` AS `event_end_date`,`event`.`event_start_time` AS `event_start_time`,`event`.`event_end_time` AS `event_end_time`,`event`.`event_status` AS `event_status` from `event` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-20 21:41:01
