-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: alan_school
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) DEFAULT NULL,
  `abbreviation` char(2) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `abbreviation` (`abbreviation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'United States','US'),(2,'United Kingdom','GB'),(3,'Greece','GR');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) DEFAULT NULL,
  `credits` decimal(3,1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Calculus I',3.0,1),(2,'Organic Chemistry',4.5,1),(3,'Ancient World History',3.0,1),(4,'Microeconomics',3.0,0),(5,'English Literature',3.0,1),(6,'General Physics',4.0,1),(7,'Digital Marketing',2.0,1),(8,'Artificial Intelligence',4.0,0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollments` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `enrollment_date` date DEFAULT NULL,
  `grade` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,'2024-01-10',8.3),(1,2,'2024-01-10',8.0),(1,3,'2024-01-11',8.7),(1,4,'2024-01-27',9.4),(1,6,'2024-01-12',5.8),(1,8,'2024-01-22',6.1),(2,1,'2024-01-10',7.7),(2,2,'2024-01-10',5.5),(2,4,'2024-01-15',9.4),(2,7,'2024-01-15',5.5),(2,8,'2024-01-22',9.2),(3,1,'2024-01-11',9.7),(3,3,'2024-01-11',5.8),(3,4,'2024-01-12',5.0),(3,5,'2024-01-23',7.6),(3,7,'2024-01-13',7.9),(4,1,'2024-01-23',6.6),(4,2,'2024-01-10',9.3),(4,4,'2024-01-10',6.9),(4,6,'2024-01-14',6.3),(4,8,'2024-01-14',6.1),(5,1,'2024-01-11',6.6),(5,2,'2024-01-16',9.8),(5,3,'2024-01-24',9.2),(5,5,'2024-01-11',6.4),(5,7,'2024-01-16',9.5),(6,1,'2024-01-24',8.4),(6,2,'2024-01-17',8.4),(6,3,'2024-01-12',6.9),(6,4,'2024-01-12',9.2),(6,6,'2024-01-17',5.4),(7,1,'2024-01-13',9.3),(7,2,'2024-01-13',5.2),(7,4,'2024-01-25',8.1),(7,5,'2024-01-18',10.0),(7,8,'2024-01-18',5.6),(8,2,'2024-01-10',8.0),(8,3,'2024-01-19',8.2),(8,5,'2024-01-10',6.9),(8,6,'2024-01-25',9.9),(8,7,'2024-01-19',8.7),(9,1,'2024-01-26',8.7),(9,3,'2024-01-11',7.7),(9,4,'2024-01-11',7.3),(9,6,'2024-01-20',8.5),(9,8,'2024-01-20',5.5),(10,1,'2024-01-12',7.0),(10,2,'2024-01-21',8.5),(10,3,'2024-01-26',6.7),(10,5,'2024-01-12',7.8),(10,7,'2024-01-21',8.9);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `fk_students_countries` (`country_id`),
  CONSTRAINT `fk_students_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Alice','Johnson','F','2005-03-15','123 Maple St','Springfield',1),(2,'Bob','Smith','M','2004-11-22','456 Oak Ave','Riverdale',1),(3,'Charlie','Davis','M','2005-01-10','789 Pine Rd','Lakeshore',1),(4,'Diana','Prince','F','2004-05-20','101 Amazon Blvd','Themyscira',3),(5,'Ethan','Hunt','M','2005-07-04','202 Spy Ln','Mission City',1),(6,'Fiona','Gallagher','F','2003-12-30','303 South Side','Chicago',1),(7,'George','Miller','M','2005-09-12','404 High St','London',2),(8,'Hannah','Abbott','F','2004-02-28','505 Hufflepuff Dr','Highlands',2),(9,'Ian','Wright','M','2005-06-18','606 Stadium Way','London',2),(10,'Julia','Roberts','F','2004-10-25','707 Hollywood Blvd','Los Angeles',1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-03  9:54:04
