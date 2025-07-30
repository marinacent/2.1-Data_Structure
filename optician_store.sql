# create table??

CREATE TABLE `customers` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `address` integer,
  `phone_number` integer,
  `email` varchar(50),
  `registered` date DEFAULT NOW(),
  `recommended_by` integer,
  FOREIGN KEY (`address`) REFERENCES `addresses` (`id`),
  FOREIGN KEY (`recommended_by`) REFERENCES `customers` (`id`)
);

CREATE TABLE `providers`(
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50),
  `address` integer,
  `phone_number` integer,
  `fax_number` integer,
  `nif` varchar(9),
  FOREIGN KEY (`address`) REFERENCES `addresses` (`id`)
);

CREATE TABLE `glasses` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `brand` integer, # should this be a varchar 'brand'??
  `prescription_right` varchar(50),
  `prescription_left` varchar(50),
  `frame_type` enum('rimless', 'plastic', 'metal'),
  `frame_color` varchar(25), #what if the frame_type is rimless?
  `color_right` varchar(25),
  `color_left` varchar(25),
  `price` float,
  FOREIGN KEY (`brand`) REFERENCES `brands` (`id`)
  );
  
CREATE TABLE `brands` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50),
  `provider` integer,
  FOREIGN KEY (`provider`) REFERENCES `providers` (`id`)
  );
  
  CREATE TABLE `employees` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50),
  `last_name` varchar(50)
  );
  
  CREATE TABLE `sales`(
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `glasses` integer,
  `customer` integer,
  `employee` integer,
  FOREIGN KEY (`glasses`) REFERENCES `glasses` (`id`),
  FOREIGN KEY (`customer`) REFERENCES `customers` (`id`),
  FOREIGN KEY (`employee`) REFERENCES `employees` (`id`)
  );
  
  CREATE TABLE `addresses` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `street` varchar(50),
  `number` integer,
  `floor` integer,
  `door` varchar(1),
  `city` varchar(50),
  `postal_code` varchar(25),
  `country` varchar(50)
  );
