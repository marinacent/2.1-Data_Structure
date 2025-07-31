DROP DATABASE IF EXISTS optician_store;
CREATE DATABASE optician_store CHARACTER SET utf8mb4;
USE optician_store;

CREATE TABLE `addresses` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `street` VARCHAR(50),
  `number` VARCHAR(25),
  `floor` VARCHAR(25),
  `door` CHAR,
  `city` VARCHAR(50),
  `postal_code` VARCHAR(25),
  `country` VARCHAR(50)
  );
  
  CREATE TABLE `providers`(
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `id_address` INT,
  `phone_number` VARCHAR(25),
  `fax_number` VARCHAR(25),
  `nif` CHAR(9) UNIQUE,
  FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id`)
);

CREATE TABLE `brands` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `id_provider` INT,
  FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id`)
  );

CREATE TABLE `customers` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50),
  `id_address` INT,
  `phone_number` VARCHAR(25),
  `email` VARCHAR(50),
  `registered` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `id_recommended_by` INT,
  FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id`),
  FOREIGN KEY (`id_recommended_by`) REFERENCES `customers` (`id`)
);

 CREATE TABLE `employees` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50)
  );

CREATE TABLE `glasses` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_brand` INT, 
  `prescription_right` VARCHAR(50),
  `prescription_left` VARCHAR(50),
  `frame_type` ENUM('rimless', 'plastic', 'metal'),
  `frame_color` VARCHAR(25),
  `lens_color` VARCHAR(25),
  `price` FLOAT,
  FOREIGN KEY (`id_brand`) REFERENCES `brands` (`id`)
  );
  
  CREATE TABLE `sales`(
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_glasses` INT,
  `id_customer` INT,
  `id_employee` INT,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id`),
  FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`)
  );
