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
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
  );
  

CREATE TABLE card_subscriptions (
  user_id INT UNSIGNED PRIMARY KEY,
  number VARCHAR(19) NOT NULL,
  expiry_month TINYINT NOT NULL,
  expiry_year YEAR NOT NULL,
  security_code VARCHAR(4) NOT NULL,
  FOREIGN KEY (user_id)
    REFERENCES subscriptions (user_id)
    ON DELETE CASCADE
  );
  
CREATE TABLE paypal_subscriptions (
  user_id INT UNSIGNED PRIMARY KEY,
  paypal_username VARCHAR(255),
  FOREIGN KEY (user_id)
    REFERENCES subscriptions (user_id)
    ON DELETE CASCADE
  );
  
CREATE TABLE payments (
  id INT UNSIGNED PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  total_paid FLOAT NOT NULL,
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
  );
  
CREATE TABLE artists (
  id INT UNSIGNED PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  profile_picture LONGBLOB
  );
  
CREATE TABLE folllowed_artists (
  user_id INT UNSIGNED NOT NULL,
  artist_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (artist_id)
    REFERENCES artists (id)
    ON DELETE CASCADE
  );
  
  
  
CREATE TABLE albums (
  id INT UNSIGNED PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  artist_id INT UNSIGNED NOT NULL,
  release_year YEAR NOT NULL,
  cover LONGBLOB,
  FOREIGN KEY (artist_id)
    REFERENCES artists (id)
    ON DELETE CASCADE
  );
  
CREATE TABLE tracks (
  id INT UNSIGNED PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  album_id INT UNSIGNED NOT NULL,
  duration_ms BIGINT UNSIGNED NOT NULL,
  number_of_plays BIGINT UNSIGNED NOT NULL,
  FOREIGN KEY (album_id)
    REFERENCES albums (id)
    ON DELETE CASCADE
  );
  
  
  
-- how to compute number of songs¿?
CREATE TABLE playlists (
  id INT UNSIGNED PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  name VARCHAR(100) NOT NULL,
  number_of_tracks SMALLINT UNSIGNED,
  date_of_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  state ENUM('active', 'deleted') DEFAULT 'active',
  deletion_date TIMESTAMP DEFAULT NULL,
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
);


CREATE TABLE playlist_tracks (
  track_id INT UNSIGNED NOT NULL,
  playlist_id INT UNSIGNED NOT NULL,
  added_by_user_id INT UNSIGNED NOT NULL,
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (track_id, playlist_id),
  FOREIGN KEY (track_id)
    REFERENCES tracks (id)
    ON DELETE CASCADE,
  FOREIGN KEY (playlist_id)
    REFERENCES playlists (id)
    ON DELETE CASCADE,
  FOREIGN KEY (added_by_user_id)
    REFERENCES users (id)
    ON DELETE SET NULL
  );
    
    
    
    
    
    
    
    
  