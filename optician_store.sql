CREATE DATABASE IF NOT EXISTS optician_store;
USE optician_store;

CREATE TABLE `addresses` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(50),
  `number` INT,
  `floor` INT,
  `door` CHAR,
  `city` VARCHAR(50),
  `postal_code` VARCHAR(25),
  `country` VARCHAR(50)
  );
  
  CREATE TABLE `providers`(
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `address` INT,
  `phone_number` VARCHAR(25),
  `fax_number` VARCHAR(25),
  `nif` CHAR(9),
  FOREIGN KEY (`address`) REFERENCES `addresses` (`id`)
);

CREATE TABLE `brands` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `provider` INT,
  FOREIGN KEY (`provider`) REFERENCES `providers` (`id`)
  );

CREATE TABLE `customers` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50),
  `address` INT,
  `phone_number` VARCHAR(25),
  `email` VARCHAR(50),
  `registered` TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  `recommended_by` INT,
  FOREIGN KEY (`address`) REFERENCES `addresses` (`id`),
  FOREIGN KEY (`recommended_by`) REFERENCES `customers` (`id`)
);

 CREATE TABLE `employees` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50)
  );

CREATE TABLE `glasses` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `brand` INT, 
  `prescription_right` VARCHAR(50),
  `prescription_left` VARCHAR(50),
  `frame_type` ENUM('rimless', 'plastic', 'metal'),
  `frame_color` VARCHAR(25),
  `color_right` VARCHAR(25),
  `color_left` VARCHAR(25),
  `price` FLOAT,
  FOREIGN KEY (`brand`) REFERENCES `brands` (`id`)
  );
  
  CREATE TABLE `sales`(
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `glasses` INT,
  `customer` INT,
  `employee` INT,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  FOREIGN KEY (`glasses`) REFERENCES `glasses` (`id`),
  FOREIGN KEY (`customer`) REFERENCES `customers` (`id`),
  FOREIGN KEY (`employee`) REFERENCES `employees` (`id`)
  );
