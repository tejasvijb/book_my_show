-- Theatre Booking Sample Data
-- Version 1.0

SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE theatre_booking;

SET AUTOCOMMIT=0;

--
-- Dumping data for table theatre
--

INSERT INTO theatre 
(theatre_id, theatre_name, address_line1, address_line2, city, state, pincode, contact_number, last_update)
VALUES
(1, 'PVR Phoenix Mall', 'Phoenix Marketcity', NULL, 'Chennai', 'Tamil Nadu', '600042', '04412345678', NOW()),
(2, 'INOX Marina Mall', 'OMR Road', NULL, 'Chennai', 'Tamil Nadu', '600119', '04487654321', NOW());

--
-- Dumping data for table screen
--

INSERT INTO screen 
(screen_id, theatre_id, screen_name, total_seats, last_update)
VALUES
(1, 1, 'Screen 1', 150, NOW()),
(2, 1, 'Screen 2', 120, NOW()),
(3, 2, 'Screen 1', 180, NOW());

--
-- Dumping data for table language
--

INSERT INTO language 
(language_id, language_name, last_update)
VALUES
(1, 'English', NOW()),
(2, 'Hindi', NOW());

--
-- Dumping data for table format
--

INSERT INTO format 
(format_id, format_name, last_update)
VALUES
(1, '2D', NOW()),
(2, 'IMAX', NOW());

--
-- Dumping data for table movie
--

INSERT INTO movie
(movie_id, movie_name, duration_minutes, genre, release_date, certification, last_update)
VALUES
(1, 'The Truman Show', 103, 'Drama/Sci-Fi', '1998-06-05', 'U', NOW()),
(2, 'Good Will Hunting', 126, 'Drama', '1997-12-05', 'U', NOW()),
(3, 'Inception', 148, 'Sci-Fi/Thriller', '2010-07-16', 'UA', NOW()),
(4, 'Oppenheimer', 180, 'Biography/Drama', '2023-07-21', 'UA', NOW());

--
-- Dumping data for table actor
--

INSERT INTO actor
(actor_id, actor_name, last_update)
VALUES
(1, 'Jim Carrey', NOW()),
(2, 'Laura Linney', NOW()),
(3, 'Matt Damon', NOW()),
(4, 'Robin Williams', NOW()),
(5, 'Leonardo DiCaprio', NOW()),
(6, 'Joseph Gordon-Levitt', NOW()),
(7, 'Cillian Murphy', NOW()),
(8, 'Robert Downey Jr.', NOW());

--
-- Dumping data for table movie_actor
--

INSERT INTO movie_actor
(movie_id, actor_id, role_name, last_update)
VALUES
(1, 1, 'Truman Burbank', NOW()),
(1, 2, 'Meryl Burbank', NOW()),
(2, 3, 'Will Hunting', NOW()),
(2, 4, 'Sean Maguire', NOW()),
(3, 5, 'Dom Cobb', NOW()),
(3, 6, 'Arthur', NOW()),
(4, 7, 'J. Robert Oppenheimer', NOW()),
(4, 8, 'Lewis Strauss', NOW());

--
-- Dumping data for table movie_language
--

INSERT INTO movie_language
(movie_id, language_id, last_update)
VALUES
(1, 1, NOW()),
(2, 1, NOW()),
(3, 1, NOW()),
(4, 1, NOW()),
(3, 2, NOW()),
(4, 2, NOW());

--
-- Dumping data for table show
--

INSERT INTO `show`
(show_id, show_date, show_start_time, show_end_time, ticket_price, show_status, movie_id, screen_id, language_id, format_id, last_update)
VALUES
(1, '2026-02-20', '10:00:00', '11:43:00', 250.00, 'Active', 1, 1, 1, 1, NOW()),
(2, '2026-02-20', '13:00:00', '15:06:00', 250.00, 'Active', 2, 1, 1, 1, NOW()),
(3, '2026-02-20', '16:30:00', '19:58:00', 300.00, 'Active', 3, 2, 1, 1, NOW()),
(4, '2026-02-20', '20:00:00', '23:00:00', 450.00, 'Active', 4, 3, 1, 2, NOW()),
(5, '2026-02-21', '14:00:00', '16:28:00', 300.00, 'Active', 3, 2, 2, 1, NOW()),
(6, '2026-02-21', '18:00:00', '21:00:00', 450.00, 'Active', 4, 3, 2, 2, NOW());

COMMIT;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
