DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube CHARACTER SET utf8mb4;
USE youtube;

CREATE TABLE users (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  password CHAR(60) NOT NULL,
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
  state ENUM('public', 'hidden', 'private'),
  upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  number_of_views INT UNSIGNED,
  number_of_likes INT UNSIGNED,
  number_of_dislikes INT UNSIGNED,
  FOREIGN KEY (user_id) REFERENCES users (id)
  );
  
CREATE TABLE tags (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) UNIQUE NOT NULL
  );
  
CREATE TABLE video_tags (
  video_id INT UNSiGNED NOT NULL,
  tag_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (video_id, tag_id),
  FOREIGN KEY (tag_id) 
    REFERENCES tags (id)
    ON DELETE CASCADE,
  FOREIGN KEY (video_id) 
    REFERENCES videos (id)
    ON DELETE CASCADE
  );
  
CREATE TABLE channels (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(1000),
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  FOREIGN KEY (user_id) REFERENCES users (id)
  );
  
CREATE TABLE subscriptions (
  user_id INT UNSIGNED NOT NULL,
  channel_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (user_id, channel_id),
  FOREIGN KEY (user_id) 
    REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (channel_id)
    REFERENCES channels (id)
    ON DELETE CASCADE
  );
  
CREATE TABLE video_likes (
  user_id INT UNSIGNED NOT NULL,
  video_id INT UNSIGNED NOT NULL,
  type ENUM('like', 'dislike') NOT NULL,
  like_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (user_id, video_id),
  FOREIGN KEY (user_id) 
    REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (video_id)
    REFERENCES videos (id)
    ON DELETE CASCADE
);

CREATE TABLE playlists (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  name VARCHAR(100) NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  state ENUM('public', 'private') DEFAULT 'private',
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
  );

CREATE TABLE playlist_videos (
  playlist_id INT UNSIGNED NOT NULL,
  video_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (playlist_id, video_id),
  FOREIGN KEY (playlist_id)
    REFERENCES playlists (id)
    ON DELETE CASCADE,
  FOREIGN KEY (video_id)
    REFERENCES videos (id)
    ON DELETE SET NULL
  );
  
CREATE TABLE comments (
  id INT UNSIGNED PRIMARY KEY NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  video_id INT UNSIGNED NOT NULL,
  text VARCHAR (10000) NOT NULL,
  comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (video_id)
    REFERENCES videos (id)
    ON DELETE CASCADE
  );
  
CREATE TABLE comment_likes (
  user_id INT UNSIGNED NOT NULL,
  comment_id INT UNSIGNED NOT NULL,
  type ENUM('like', 'dislike') NOT NULL,
  like_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (user_id, comment_id),
  FOREIGN KEY (user_id) 
    REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (comment_id)
    REFERENCES comments (id)
    ON DELETE CASCADE
);
  
  
  
  
  
  