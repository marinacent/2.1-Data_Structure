DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube CHARACTER SET utf8mb4;
USE youtube;

CREATE TABLE users (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(30) NOT NULL,
  username VARCHAR(50) NOT NULL,
  date_of_birth DATE,
  gender ENUM('male', 'female', 'other'),
  country VARCHAR(50),
  postal_code VARCHAR(25)
  );