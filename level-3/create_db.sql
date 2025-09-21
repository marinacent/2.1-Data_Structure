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

CREATE TABLE subscriptions (
  user_id INT UNSIGNED PRIMARY KEY,
  subscription_date DATE,
  renewal_date DATE NOT NULL,
  payment_method ENUM('card', 'paypal') NOT NULL,
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE,
  );
    
    
    
    
    
    
    
    
  