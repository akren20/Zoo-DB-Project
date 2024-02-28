CREATE DATABASE  IF NOT EXISTS `zoodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zoodb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: zoodb
-- ------------------------------------------------------
-- Server version	8.0.36

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

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `animal_id` int NOT NULL,
  `animal_name` varchar(25) DEFAULT NULL,
  `animal_dob` date DEFAULT NULL,
  `animal_habitat` int DEFAULT NULL,
  `animal_gender` int DEFAULT NULL,
  `animal_health` int DEFAULT NULL,
  `animal_species` varchar(20) DEFAULT NULL,
  `medical_status` int DEFAULT NULL,
  PRIMARY KEY (`animal_id`),
  UNIQUE KEY `animal_id_UNIQUE` (`animal_id`),
  KEY `animal_id` (`animal_id`),
  KEY `animal_id_2` (`animal_id`)
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
-- Table structure for table `closure`
--

DROP TABLE IF EXISTS `closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closure` (
  `temperature` double NOT NULL,
  `precipitation_chance` int DEFAULT NULL,
  `weather_status` int NOT NULL,
  `days_closed` int DEFAULT NULL,
  `days_open` int DEFAULT NULL,
  `hours_open` int DEFAULT NULL,
  `hours_closed` int DEFAULT NULL,
  `number_visitors` int NOT NULL,
  `number_employees` int NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `contact_info` varchar(50) NOT NULL,
  PRIMARY KEY (`weather_status`),
  KEY `fk_customer` (`customer_email`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_email`) REFERENCES `customer` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closure`
--

LOCK TABLES `closure` WRITE;
/*!40000 ALTER TABLE `closure` DISABLE KEYS */;
/*!40000 ALTER TABLE `closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_phone` varchar(12) DEFAULT NULL,
  `membership_type` int NOT NULL,
  `customer_age` int DEFAULT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_address` varchar(250) NOT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  KEY `idx_customer_email` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `employee_age` int DEFAULT NULL,
  `employee_gender` int NOT NULL,
  `employee_dob` date NOT NULL,
  `employee_ssn` varchar(11) DEFAULT NULL,
  `hours_worked` double DEFAULT NULL,
  `employee_salary` int DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `weekly_hours` decimal(10,2) DEFAULT NULL,
  `overtime_hours` decimal(10,2) DEFAULT NULL,
  `overtime_pay` decimal(10,2) DEFAULT NULL,
  `employee_dept` int DEFAULT NULL,
  `employee_supe_id` varchar(11) DEFAULT NULL,
  `employee_type` varchar(250) DEFAULT NULL,
  `employee_role` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  CONSTRAINT `employee_chk_1` CHECK ((`employee_age` >= 16))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `event_start_date` date DEFAULT NULL,
  `event_end_date` date DEFAULT NULL,
  `event_organizer` varchar(100) DEFAULT NULL,
  `event_registration_deadline` date DEFAULT NULL,
  `event_start_time` time DEFAULT NULL,
  `event_end_time` time DEFAULT NULL,
  `event_status` int DEFAULT NULL,
  `event_employee_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_id_UNIQUE` (`event_id`),
  KEY `event_employee_id` (`event_employee_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_shop`
--

DROP TABLE IF EXISTS `food_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_shop` (
  `fdshop_id` int NOT NULL,
  `fdshop_name` varchar(100) DEFAULT NULL,
  `fdshop_location` varchar(255) DEFAULT NULL,
  `fdshop_manager_id` int DEFAULT NULL,
  `fdshop_capacity` int DEFAULT NULL,
  `fdshop_inventory` int DEFAULT NULL,
  `fdshop_contact_info` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`fdshop_id`),
  UNIQUE KEY `fdshop_id_UNIQUE` (`fdshop_id`),
  KEY `fdshop_manager_id` (`fdshop_manager_id`),
  CONSTRAINT `food_shop_ibfk_1` FOREIGN KEY (`fdshop_manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_shop`
--

LOCK TABLES `food_shop` WRITE;
/*!40000 ALTER TABLE `food_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_shop`
--

DROP TABLE IF EXISTS `gift_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_shop` (
  `gftshop_id` int NOT NULL,
  `gftshop_name` varchar(100) DEFAULT NULL,
  `gftshop_location` varchar(255) DEFAULT NULL,
  `gftshop_capacity` int DEFAULT NULL,
  `gftshop_inventory` int DEFAULT NULL,
  `gftshop_contact_info` varchar(250) DEFAULT NULL,
  `gftshop_manager_id` int DEFAULT NULL,
  PRIMARY KEY (`gftshop_id`),
  UNIQUE KEY `gftshop_id_UNIQUE` (`gftshop_id`),
  KEY `gftshop_manager_id` (`gftshop_manager_id`),
  CONSTRAINT `gift_shop_ibfk_1` FOREIGN KEY (`gftshop_manager_id`) REFERENCES `employee` (`employee_id`)
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
  `habitat_id` int NOT NULL,
  `habitat_size` double DEFAULT NULL,
  `habitat_location` int DEFAULT NULL,
  `habitat_temp` double DEFAULT NULL,
  `habitat_type` varchar(50) DEFAULT NULL,
  `habitat_condition` int DEFAULT NULL,
  `habitat_humidity` double DEFAULT NULL,
  `habitat_security` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`habitat_id`),
  UNIQUE KEY `habitat_id_UNIQUE` (`habitat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health`
--

DROP TABLE IF EXISTS `health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health` (
  `health_id` int DEFAULT NULL,
  `animal_id` int DEFAULT NULL,
  `health_status` int DEFAULT NULL,
  `recovery_status` int DEFAULT NULL,
  `health_weight` double DEFAULT NULL,
  `health_height` double DEFAULT NULL,
  `health_species` varchar(20) DEFAULT NULL,
  KEY `fk_animal` (`animal_id`),
  CONSTRAINT `fk_animal` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`)
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
  `medical_sku` int NOT NULL,
  `medical_checkup` varchar(1) DEFAULT NULL,
  `medical_cost` double DEFAULT NULL,
  `medical_status` int DEFAULT NULL,
  `medical_quantity` int DEFAULT NULL,
  `medical_id` int DEFAULT NULL,
  `medical_supplier` varchar(100) DEFAULT NULL,
  `medical_expiry_date` date DEFAULT NULL,
  `medical_storage_location` varchar(255) DEFAULT NULL,
  `vet_id` int DEFAULT NULL,
  PRIMARY KEY (`medical_sku`),
  UNIQUE KEY `medical_sku_UNIQUE` (`medical_sku`),
  KEY `medical_id` (`medical_id`),
  KEY `vet_id` (`vet_id`),
  CONSTRAINT `medical_ibfk_1` FOREIGN KEY (`medical_id`) REFERENCES `animal` (`animal_id`),
  CONSTRAINT `medical_ibfk_2` FOREIGN KEY (`vet_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical`
--

LOCK TABLES `medical` WRITE;
/*!40000 ALTER TABLE `medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL,
  `transaction_type` varchar(25) DEFAULT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `transaction_price` double DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_id_UNIQUE` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28  0:30:31
