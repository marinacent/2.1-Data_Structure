DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify CHARACTER SET utf8mb4;
USE spotify;

CREATE TABLE users (
  id INT UNSIGNED PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password CHAR(60) NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  date_of_birth DATE,
  gender ENUM('male', 'female', 'other'),
  country VARCHAR(50),
  postal_code VARCHAR(25)
  );
  