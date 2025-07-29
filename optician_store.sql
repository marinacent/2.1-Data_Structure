# create table??

CREATE TABLE `follows` (
  `following_user_id` integer,
  `followed_user_id` integer,
  `created_at` timestamp
);

CREATE TABLE `customers` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `address` varchar(50), # foreign key?
  `phone_number` integer,
  `email` varchar(50),
  `registered` date DEFAULT NOW(),
  `recommended_by` integer #foreign key?
);

CREATE TABLE `providers`(
	`id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `address` varchar(50), # foreign key?
    `phone_number` integer,
    `fax_number` integer,
    `nif` varchar(9)
);

CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `username` varchar(255),
  `role` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `posts` (
  `id` integer PRIMARY KEY,
  `title` varchar(255),
  `body` text COMMENT 'Content of the post',
  `user_id` integer NOT NULL,
  `status` varchar(255),
  `created_at` timestamp
);

ALTER TABLE `posts` ADD CONSTRAINT `user_posts` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`id`);
