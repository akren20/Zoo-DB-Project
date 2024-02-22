CREATE TABLE `animal` (
  `animal_id` int(11) PRIMARY KEY,
  `animal_name` varchar(25),
  `animal_dob` date,
  `animal_habitat` int,
  `animal_gender` int,
  `animal_health` varchar(25),
  `animal_species` varchar(20),
  `medical_status` int
);

CREATE TABLE `customer` (
  `customer_id` int(11) PRIMARY KEY,
  `customer_phone` varchar(12),
  `membership_type` int NOT NULL,
  `customer_age` int,
  `customer_email` varchar(50) NOT NULL,
  `customer_address` varchar(250) NOT NULL,
  `customer_name` varchar(250)
);

CREATE TABLE `administrator` (
  `admin_id` int(11) PRIMARY KEY,
  `admin_username` varchar(10) NOT NULL,
  `admin_phone` varchar(15) NOT NULL,
  `admin_gender` varchar(2) NOT NULL,
  `admin_age` varchar(3) NOT NULL,
  `admin_name` varchar(5) NOT NULL,
  `admin_password` varchar(15) NOT NULL
);

CREATE TABLE `employee` (
  `employee_id` int(11) PRIMARY KEY,
  `employee_name` varchar(250) NOT NULL,
  `employee_gender` int NOT NULL,
  `employee_dob` date NOT NULL,
  `employee_ssn` varchar(11),
  `hours_worked` double,
  `employee_salary` int NOT NULL,
  `employee_dept` int,
  `employee_supe` varchar(250),
  `employee_role` int
);

CREATE TABLE `ticket` (
  `ticket_id` int(11) PRIMARY KEY,
  `ticket_type` varchar(25),
  `ticket_time` datetime,
  `ticket_price` double,
  `ticket_date` date
);

CREATE TABLE `gift_shop` (
  `gftshop_id` int(11) PRIMARY KEY,
  `gftshop_name` varchar(100),
  `gftshop_location` varchar(255),
  `gftshop_capacity` int,
  `gftshop_inventory` int,
  `gftshop_contact_info` varchar(250),
  `gftshop_manager_id` varchar(100)
);

CREATE TABLE `food_shop` (
  `fdshop_id` int(11) PRIMARY KEY,
  `fdshop_name` varchar(100),
  `fdshop_location` varchar(255),
  `fdshop_manager_id` int,
  `fdshop_capacity` int,
  `fdshop_inventory` int,
  `fdshop_contact_info` varchar(250)
);

CREATE TABLE `medical` (
  `medical_sku` int(11) PRIMARY KEY,
  `medical_checkup` varchar(1),
  `medical_cost` double,
  `medical_status` int,
  `medical_quantity` int,
  `animal_id` int(11),
  `medical_supplier` varchar(100),
  `medical_expiry_date` date,
  `medical_storage_location` varchar(255)
);

CREATE TABLE `habitat` (
  `habitat_id` int(11) PRIMARY KEY,
  `habitat_size` double,
  `habitat_location` int,
  `habitat_temp` double,
  `habitat_type` varchar(50),
  `habitat_condition` integer,
  `habitat_humidity` double,
  `habitat_security` varchar(100),
  `medical_status` int
);

CREATE TABLE `event` (
  `event_id` int(11) PRIMARY KEY,
  `event_name` varchar(100),
  `event_start_date` date,
  `event_end_date` date,
  `event_organizer` varchar(100),
  `event_registration_deadline` date,
  `event_start_time` time,
  `event_end_time` time,
  `event_status` int,
  `employee_id` int
);

ALTER TABLE `medical` ADD FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);

ALTER TABLE `animal` ADD FOREIGN KEY (`medical_status`) REFERENCES `medical` (`medical_status`);

ALTER TABLE `gift_shop` ADD FOREIGN KEY (`gftshop_manager_id`) REFERENCES `employee` (`employee_id`);
