# create table??

CREATE TABLE `customers` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `address` varchar(50), # foreign key?
  `phone_number` integer,
  `email` varchar(50),
  `registered` date DEFAULT NOW(),
  `recommended_by` integer,
  FOREIGN KEY (`recommended_by`) REFERENCES `customers` (`id`)
);

CREATE TABLE `providers`(
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50),
  `address` varchar(50), # foreign key?
  `phone_number` integer,
  `fax_number` integer,
  `nif` varchar(9)
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
