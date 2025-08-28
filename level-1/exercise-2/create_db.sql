DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE `municipalities` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `province` INT UNSIGNED,
  FOREIGN KEY (`province`) REFERENCES `provinces` (`id`)
  );

CREATE TABLE `provinces` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50)
  );

CREATE TABLE `customers` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `surnames` VARCHAR(50),
  `address` VARCHAR(100),
  `postal_code` VARCHAR(25),
  `municipality` INT UNSIGNED,
  `province` INT UNSIGNED,
  `phone_number` VARCHAR(25)
  );
  

DELIMITER $$

CREATE TRIGGER customers_before_insert
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
  IF NEW.municipality IS NOT NULL THEN
    SET NEW.province = (
      SELECT province FROM municipalities WHERE id = NEW.municipality
	);
  END IF;
END$$

CREATE TRIGGER customers_before_update
BEFORE UPDATE ON customers
FOR EACH ROW
BEGIN
  IF NEW.municipality IS NOT NULL THEN
    SET NEW.province = (
      SELECT province FROM municipalities WHERE id = NEW.municipality
	);
  END IF;
END$$

DELIMITER ;

CREATE TABLE `pizza_categories` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL
  );

CREATE TABLE `products` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `description` VARCHAR(150),
  `type` ENUM('pizza', 'burger', 'drink') NOT NULL,
  `image` LONGBLOB,
  `price` FLOAT NOT NULL
  );

CREATE TABLE `pizzas` (
  `product_id` INT PRIMARY KEY NOT NULL,
  `category_id` INT NOT NULL,
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `pizza_categories` (`id`)
  );
  

CREATE TABLE `orders` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `datetime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  `type` ENUM('delivery', 'pickup'),
  `total_price` FLOAT
  );
  
CREATE TABLE `product_orders` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`prodict_id`) REFERENCES `products` (`id`)
  );
  
  
  
  