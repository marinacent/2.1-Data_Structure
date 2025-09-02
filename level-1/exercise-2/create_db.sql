DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE `provinces` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50)
  );

CREATE TABLE `municipalities` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `province` INT UNSIGNED,
  FOREIGN KEY (`province`) REFERENCES `provinces` (`id`)
  );

CREATE TABLE `customers` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `surnames` VARCHAR(50),
  `address` VARCHAR(100),
  `postal_code` VARCHAR(25),
  `municipality_id` INT UNSIGNED,
  `phone_number` VARCHAR(25),
  FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`id`)
  );

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
  `product_id` INT UNSIGNED PRIMARY KEY NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `pizza_categories` (`id`)
  );

CREATE TABLE `stores` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100),
  `postal_code` VARCHAR(25),
  `municipality_id` INT UNSIGNED,
  FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`id`)
  );
  
  CREATE TABLE `employees` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `surnames` VARCHAR(50),
  `nif` CHAR(9) UNIQUE,
  `phone_number` VARCHAR(25),
  `type` ENUM('cook', 'delivery')
  );


CREATE TABLE `orders` (
  `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `datetime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  `type` ENUM('delivery', 'pickup'),
  `total_price` FLOAT,
  `store_id` INT UNSIGNED NOT NULL,
  `customer_id` INT UNSIGNED,
  FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`)
  );
  
CREATE TABLE `deliveries` (
  `order_id` INT UNSIGNED PRIMARY KEY NOT NULL,
  `delivery_person_id` INT UNSIGNED NOT NULL,
  `datetime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`delivery_person_id`) REFERENCES `employees` (`id`)
  );
  
  
CREATE TABLE `product_orders` (
  `order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
  );
  
  
  