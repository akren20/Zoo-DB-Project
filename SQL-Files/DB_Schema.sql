-- Create the zoodb1 schema
CREATE SCHEMA IF NOT EXISTS zoodb1;

-- Use the zoodb1 schema
USE zoodb1;

-- Create the medical table
CREATE TABLE medical (
  medical_sku INT PRIMARY KEY,
  medical_checkup VARCHAR(1),
  medical_cost DOUBLE,
  medical_status INT,
  medical_quantity INT,
  animal_id INT,
  medical_supplier VARCHAR(100),
  medical_expiry_date DATE,
  medical_storage_location VARCHAR(255)
);

-- Create the animal table
CREATE TABLE animal (
  animal_id INT PRIMARY KEY,
  animal_name VARCHAR(25),
  animal_dob DATE,
  animal_habitat INT,
  animal_gender INT,
  animal_health VARCHAR(25),
  animal_species VARCHAR(20),
  medical_status INT
);

ALTER TABLE `medical` ADD FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);
-- ALTER TABLE `animal` ADD FOREIGN KEY (`medical_status`) REFERENCES `medical` (`medical_status`);

-- Create the customer table
CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  customer_phone VARCHAR(12),
  membership_type INT NOT NULL,
  customer_age INT,
  customer_email VARCHAR(50) NOT NULL,
  customer_address VARCHAR(250) NOT NULL,
  customer_name VARCHAR(250)
);

-- Create the administrator table
CREATE TABLE administrator (
  admin_id INT PRIMARY KEY,
  admin_username VARCHAR(10) NOT NULL,
  admin_phone VARCHAR(15) NOT NULL,
  admin_gender VARCHAR(2) NOT NULL,
  admin_age VARCHAR(3) NOT NULL CHECK (admin_age >= 18),
  admin_name VARCHAR(5) NOT NULL,
  admin_password VARCHAR(15) NOT NULL
);

-- Create the employee table
CREATE TABLE employee (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(250) NOT NULL,
  employee_age INT CHECK (employee_age >= 16),
  employee_gender INT NOT NULL,
  employee_dob DATE NOT NULL,
  employee_ssn VARCHAR(11),
  hours_worked DOUBLE,
  employee_salary INT NULL,
  hourly_rate DECIMAL(10, 2) NULL,
  weekly_hours DECIMAL(10, 2),
  overtime_hours DECIMAL(10, 2) NULL,
  overtime_pay DECIMAL(10, 2) NULL,
  employee_dept INT,
  employee_supe_id VARCHAR(250),
  -- FOREIGN KEY (employee_supe_id) REFERENCES employee(employee_id),
  employee_type VARCHAR(250),
  employee_role INT
);

ALTER TABLE employee
ALTER COLUMN employee_salary SET DEFAULT 0;

ALTER TABLE employee
ALTER COLUMN hourly_rate SET DEFAULT 0.0;

-- Create the ticket table
CREATE TABLE ticket (
  ticket_id INT PRIMARY KEY,
  ticket_type VARCHAR(25),
  ticket_time DATETIME,
  ticket_price DOUBLE,
  ticket_date DATE
);

-- Create the gift_shop table
CREATE TABLE gift_shop (
  gftshop_id INT PRIMARY KEY,
  gftshop_name VARCHAR(100),
  gftshop_location VARCHAR(255),
  gftshop_capacity INT,
  gftshop_inventory INT,
  gftshop_contact_info VARCHAR(250),
  gftshop_manager_id VARCHAR(100)
  -- FOREIGN KEY (gftshop_manager_id) REFERENCES employee(employee_id)
);

-- Create the food_shop table
CREATE TABLE food_shop (
  fdshop_id INT PRIMARY KEY,
  fdshop_name VARCHAR(100),
  fdshop_location VARCHAR(255),
  fdshop_manager_id INT,
  -- FOREIGN KEY (fdshop_manager_id) REFERENCES employee(employee_id),
  fdshop_capacity INT,
  fdshop_inventory INT,
  fdshop_contact_info VARCHAR(250)
);

-- Create the habitat table
CREATE TABLE habitat (
  habitat_id INT PRIMARY KEY,
  habitat_size DOUBLE,
  habitat_location INT,
  habitat_temp DOUBLE,
  habitat_type VARCHAR(50),
  habitat_condition INT,
  habitat_humidity DOUBLE,
  habitat_security VARCHAR(100),
  animal_health VARCHAR(25),
  -- FOREIGN KEY (animal_health) REFERENCES animal(animal_health),
  medical_status INT
  -- FOREIGN KEY (medical_status) REFERENCES medical(medical_status)
);

-- Create the event table
CREATE TABLE event (
  event_id INT PRIMARY KEY,
  event_name VARCHAR(100),
  event_start_date DATE,
  event_end_date DATE,
  event_organizer VARCHAR(100),
  event_registration_deadline DATE,
  event_start_time TIME,
  event_end_time TIME,
  event_status INT,
  employee_id INT
  -- FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

ALTER TABLE `zoodb1`.`administrator` 
ADD UNIQUE INDEX `admin_id_UNIQUE` (`admin_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`animal` 
ADD UNIQUE INDEX `animal_id_UNIQUE` (`animal_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`customer` 
ADD UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`employee` 
ADD UNIQUE INDEX `employee_id_UNIQUE` (`employee_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`gift_shop` 
ADD UNIQUE INDEX `gftshop_id_UNIQUE` (`gftshop_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`food_shop` 
ADD UNIQUE INDEX `fdshop_id_UNIQUE` (`fdshop_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`event` 
ADD UNIQUE INDEX `event_id_UNIQUE` (`event_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`habitat` 
ADD UNIQUE INDEX `habitat_id_UNIQUE` (`habitat_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`medical` 
ADD UNIQUE INDEX `medical_sku_UNIQUE` (`medical_sku` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`ticket` 
ADD UNIQUE INDEX `ticket_id_UNIQUE` (`ticket_id` ASC) VISIBLE;
;

ALTER TABLE `zoodb1`.`employee` 
CHANGE COLUMN `hours_worked` `hours_worked` DOUBLE NULL DEFAULT 0 ;


-- DELIMITER //

-- -- Trigger to prevent salary decrease for employees
-- CREATE TRIGGER trg_prevent_salary_decrease
-- BEFORE UPDATE ON employee
-- FOR EACH ROW
-- BEGIN
--     IF NEW.employee_salary < OLD.employee_salary THEN
--         SIGNAL SQLSTATE 'SLRYDCRSE_ERR' SET MESSAGE_TEXT = 'Salary cannot be decreased';
--     END IF;
-- END//

-- DELIMITER ;

-- DELIMITER //

-- -- Trigger to prevent salaried employees from working more than 40 hours during insertion
-- CREATE TRIGGER trg_prevent_excessive_hours_insert
-- BEFORE INSERT ON employee
-- FOR EACH ROW
-- BEGIN
--     IF NEW.hours_worked > 40 AND NEW.employee_salary > 0 THEN
--         SIGNAL SQLSTATE 'OVERTME_ERR' SET MESSAGE_TEXT = 'Salaried employees cannot work more than 40 hours';
--     END IF;
-- END//

-- DELIMITER ;

-- DELIMITER //

-- -- Trigger to prevent salaried employees from working more than 40 hours during update
-- CREATE TRIGGER trg_prevent_excessive_hours_update
-- BEFORE UPDATE ON employee
-- FOR EACH ROW
-- BEGIN
--     IF NEW.hours_worked > 40 AND NEW.employee_salary > 0 THEN
--         SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'Salaried employees cannot work more than 40 hours';
--     END IF;
-- END//

-- DELIMITER ;

-- DELIMITER //

-- -- Trigger to ensure only healthy animals are assigned to habitats
-- CREATE TRIGGER trg_ensure_valid_habitat
-- BEFORE INSERT ON animal
-- FOR EACH ROW
-- BEGIN
--     DECLARE habitat_count INT;
--     
--     -- Check if the habitat exists
--     SELECT COUNT(*) INTO habitat_count
--     FROM habitat
--     WHERE habitat_id = NEW.animal_habitat;
--     
--     -- If habitat doesn't exist, raise an error
--     IF habitat_count = 0 THEN
--         SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'Invalid habitat ID. Please assign the animal to a valid habitat.';
--     END IF;
-- END//

-- DELIMITER ;

-- DELIMITER //

-- CREATE TRIGGER calculate_overtime_pay
-- BEFORE UPDATE ON employee
-- FOR EACH ROW
-- BEGIN
--     DECLARE hourly_rate DECIMAL(10, 2);
--     DECLARE weekly_hours DECIMAL(10, 2);
--     DECLARE overtime_hours DECIMAL(10, 2);
--     DECLARE overtime_pay DECIMAL(10, 2);
--     
--     -- Get the hourly rate for the employee
--     SELECT employee_salary INTO hourly_rate
--     FROM employee
--     WHERE employee_id = NEW.employee_id;
--     
--     -- Calculate total hours worked in the week
--     SELECT SUM(hours_worked) INTO weekly_hours
--     FROM employee
--     WHERE employee_id = NEW.employee_id;
--     
--     -- Calculate overtime hours
--     SET overtime_hours = GREATEST(weekly_hours - 40, 0);
--     
--     -- Calculate overtime pay (time and a half)
--     SET overtime_pay = IF(hourly_rate > 0, (overtime_hours * 1.5 * hourly_rate), 0);
--     
--     -- Update employee's salary with overtime pay
--     SET NEW.employee_salary = NEW.employee_salary + overtime_pay;
-- END//

-- DELIMITER ;

-- ALTER TABLE `medical` ADD FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);
-- ALTER TABLE `animal` ADD FOREIGN KEY (`medical_status`) REFERENCES `medical` (`medical_status`);
-- ALTER TABLE `gift_shop` ADD FOREIGN KEY (`gftshop_manager_id`) REFERENCES `employee` (`employee_id`);