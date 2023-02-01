-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for travel_city_db
CREATE DATABASE IF NOT EXISTS `travel_city_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `travel_city_db`;

-- Dumping structure for table travel_city_db.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel_city_db.cities: ~8 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `city_name`) VALUES
	(1, 'city_1'),
	(2, 'city_2'),
	(3, 'city_3'),
	(4, 'city_4'),
	(5, 'city_5'),
	(6, 'city_6'),
	(7, 'city_7'),
	(8, 'city_8');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table travel_city_db.city_travel_history
CREATE TABLE IF NOT EXISTS `city_travel_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traveller_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel_city_db.city_travel_history: ~9 rows (approximately)
/*!40000 ALTER TABLE `city_travel_history` DISABLE KEYS */;
INSERT INTO `city_travel_history` (`id`, `traveller_id`, `city_id`, `from_date`, `to_date`) VALUES
	(1, 1, 3, '2022-05-04', '2022-06-15'),
	(2, 2, 5, '2022-08-04', '2022-08-15'),
	(3, 4, 2, '2022-11-11', '2022-12-15'),
	(4, 4, 6, '2022-01-04', '2022-06-15'),
	(5, 5, 7, '2023-01-10', '2023-01-28'),
	(6, 3, 3, '2021-05-04', '2021-07-13'),
	(7, 6, 8, '2022-07-28', '2022-09-07'),
	(8, 8, 5, '2023-01-01', '2023-01-26'),
	(9, 1, 3, '2023-01-10', '2023-01-15');
/*!40000 ALTER TABLE `city_travel_history` ENABLE KEYS */;

-- Dumping structure for table travel_city_db.travelers
CREATE TABLE IF NOT EXISTS `travelers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traveller_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel_city_db.travelers: ~8 rows (approximately)
/*!40000 ALTER TABLE `travelers` DISABLE KEYS */;
INSERT INTO `travelers` (`id`, `traveller_name`) VALUES
	(1, 'Person_1'),
	(2, 'Person_2'),
	(3, 'Person_3'),
	(4, 'Person_4'),
	(5, 'Person_5'),
	(6, 'Person_6'),
	(7, 'Person_7'),
	(8, 'Person_8');
/*!40000 ALTER TABLE `travelers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
