-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: task2
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `appt_date` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,'2025-08-20 09:00:00',1),(2,2,2,'2025-08-20 10:30:00',1),(3,3,3,'2025-08-20 14:00:00',1),(4,4,4,'2025-08-21 09:30:00',1),(5,5,5,'2025-08-21 11:00:00',1),(6,6,6,'2025-08-21 15:30:00',1),(7,7,7,'2025-08-22 08:30:00',1),(8,8,8,'2025-08-22 10:00:00',1),(9,9,9,'2025-08-22 13:30:00',1),(10,10,10,'2025-08-23 09:15:00',1),(11,11,11,'2025-08-23 11:30:00',1),(12,1,12,'2025-08-23 14:45:00',1),(13,2,13,'2025-08-24 08:00:00',1),(14,3,14,'2025-08-24 10:15:00',1),(15,4,15,'2025-08-24 12:30:00',1),(16,5,16,'2025-08-25 09:45:00',1),(17,6,17,'2025-08-25 11:15:00',1),(18,7,18,'2025-08-25 15:00:00',1),(19,8,19,'2025-08-26 08:45:00',1),(20,9,20,'2025-08-26 10:30:00',1),(21,10,21,'2025-08-26 13:00:00',1),(22,11,22,'2025-08-27 09:30:00',1),(23,1,23,'2025-08-27 11:45:00',1),(24,2,24,'2025-08-27 14:15:00',1),(25,3,25,'2025-08-28 10:00:00',1);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Cardiology',1),(2,'Neurology',1),(3,'Pediatrics',1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `dept_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Dr. Sarah Johnson',1,1),(2,'Dr. Michael Chen',1,1),(3,'Dr. Emily Rodriguez',1,1),(4,'Dr. David Thompson',1,1),(5,'Dr. Robert Williams',2,1),(6,'Dr. Lisa Anderson',2,1),(7,'Dr. Jennifer Martinez',3,1),(8,'Dr. Christopher Lee',3,1),(9,'Dr. Amanda Foster',3,1),(10,'Dr. Kevin Wright',3,1),(11,'Dr. Samantha Clark',3,1);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `admitted_date` date DEFAULT NULL,
  `discharged_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'John Smith','2025-08-01','2025-08-05',1),(2,'Maria Garcia','2025-08-02',NULL,1),(3,'James Wilson','2025-07-28','2025-08-03',1),(4,'Linda Brown','2025-08-05',NULL,1),(5,'Robert Davis','2025-07-25','2025-07-30',1),(6,'Patricia Miller','2025-08-10',NULL,1),(7,'Michael Johnson','2025-08-01','2025-08-07',1),(8,'Elizabeth Wilson','2025-08-12',NULL,1),(9,'William Moore','2025-07-20','2025-07-25',1),(10,'Jennifer Taylor','2025-08-08',NULL,1),(11,'David Anderson','2025-08-03','2025-08-09',1),(12,'Mary Thomas','2025-08-15',NULL,1),(13,'Richard Jackson','2025-07-30','2025-08-04',1),(14,'Susan White','2025-08-06',NULL,1),(15,'Joseph Harris','2025-08-11',NULL,1),(16,'Jessica Martin','2025-07-22','2025-07-28',1),(17,'Thomas Thompson','2025-08-14',NULL,1),(18,'Sarah Garcia','2025-08-09','2025-08-13',1),(19,'Christopher Martinez','2025-08-16',NULL,1),(20,'Nancy Robinson','2025-07-26','2025-08-01',1),(21,'Daniel Clark','2025-08-07',NULL,1),(22,'Lisa Rodriguez','2025-08-13',NULL,1),(23,'Matthew Lewis','2025-08-04','2025-08-10',1),(24,'Karen Lee','2025-08-17',NULL,1),(25,'Anthony Walker','2025-08-02','2025-08-08',1);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20 12:37:05
