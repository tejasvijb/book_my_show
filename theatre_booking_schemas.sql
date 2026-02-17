-- Theatre Booking Sample Database Schema
-- Version 1.0

SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS theatre_booking;
CREATE SCHEMA theatre_booking;
USE theatre_booking;

--
-- Table structure for table `theatre`
--

CREATE TABLE theatre (
  theatre_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  theatre_name VARCHAR(100) NOT NULL,
  address_line1 VARCHAR(150) NOT NULL,
  address_line2 VARCHAR(150) DEFAULT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  pincode VARCHAR(10) NOT NULL,
  contact_number VARCHAR(20) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (theatre_id),
  KEY idx_theatre_city (city)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `screen`
--

CREATE TABLE screen (
  screen_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  theatre_id SMALLINT UNSIGNED NOT NULL,
  screen_name VARCHAR(50) NOT NULL,
  total_seats SMALLINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (screen_id),
  KEY idx_fk_theatre_id (theatre_id),
  CONSTRAINT fk_screen_theatre
    FOREIGN KEY (theatre_id)
    REFERENCES theatre (theatre_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `movie`
--

CREATE TABLE movie (
  movie_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  movie_name VARCHAR(150) NOT NULL,
  duration_minutes SMALLINT UNSIGNED NOT NULL,
  genre VARCHAR(50) NOT NULL,
  release_date DATE NOT NULL,
  certification ENUM('U','UA','A') NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (movie_id),
  KEY idx_movie_name (movie_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `actor`
--

CREATE TABLE actor (
  actor_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  actor_name VARCHAR(100) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (actor_id),
  KEY idx_actor_name (actor_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `language`
--

CREATE TABLE language (
  language_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  language_name VARCHAR(50) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (language_id),
  UNIQUE KEY uk_language_name (language_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `format`
--

CREATE TABLE format (
  format_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  format_name VARCHAR(20) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (format_id),
  UNIQUE KEY uk_format_name (format_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `show`
--

CREATE TABLE `show` (
  show_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  show_date DATE NOT NULL,
  show_start_time TIME NOT NULL,
  show_end_time TIME NOT NULL,
  ticket_price DECIMAL(6,2) NOT NULL,
  show_status ENUM('Active','Cancelled','Housefull') NOT NULL DEFAULT 'Active',
  movie_id SMALLINT UNSIGNED NOT NULL,
  screen_id SMALLINT UNSIGNED NOT NULL,
  language_id TINYINT UNSIGNED NOT NULL,
  format_id TINYINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (show_id),
  KEY idx_show_date (show_date),
  KEY idx_fk_movie_id (movie_id),
  KEY idx_fk_screen_id (screen_id),
  KEY idx_fk_language_id (language_id),
  KEY idx_fk_format_id (format_id),
  CONSTRAINT fk_show_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (movie_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_show_screen
    FOREIGN KEY (screen_id)
    REFERENCES screen (screen_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_show_language
    FOREIGN KEY (language_id)
    REFERENCES language (language_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_show_format
    FOREIGN KEY (format_id)
    REFERENCES format (format_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `movie_actor`
--

CREATE TABLE movie_actor (
  movie_id SMALLINT UNSIGNED NOT NULL,
  actor_id SMALLINT UNSIGNED NOT NULL,
  role_name VARCHAR(100) DEFAULT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (movie_id, actor_id),
  KEY idx_fk_actor_id (actor_id),
  CONSTRAINT fk_movie_actor_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (movie_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_movie_actor_actor
    FOREIGN KEY (actor_id)
    REFERENCES actor (actor_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `movie_language`
--

CREATE TABLE movie_language (
  movie_id SMALLINT UNSIGNED NOT NULL,
  language_id TINYINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (movie_id, language_id),
  CONSTRAINT fk_movie_language_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (movie_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_movie_language_language
    FOREIGN KEY (language_id)
    REFERENCES language (language_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
