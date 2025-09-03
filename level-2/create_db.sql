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

CREATE TABLE videos (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(5000),
  size FLOAT,
  file_name VARCHAR(255),
  length TIME,
  thumbnail LONGBLOB,
  number_of_views INT UNSIGNED,
  number_of_likes INT UNSIGNED,
  number_of_dislikes INT UNSIGNED 
  );
  
  
  
  
  
  
  