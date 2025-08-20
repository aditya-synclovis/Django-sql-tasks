-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fees
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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `date` date NOT NULL,
  `status` char(1) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_attendance_student_date` (`student_id`,`date`),
  CONSTRAINT `FK_attendance_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `attendance_chk_1` CHECK ((`status` in (_utf8mb4'P',_utf8mb4'A')))
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2024-01-01','P',1),(2,2,'2024-01-01','P',1),(3,3,'2024-01-01','P',1),(4,4,'2024-01-01','A',1),(5,5,'2024-01-01','A',1),(6,6,'2024-01-01','P',1),(7,7,'2024-01-01','P',1),(8,8,'2024-01-01','P',1),(9,9,'2024-01-01','A',1),(10,10,'2024-01-01','A',1),(11,11,'2024-01-01','P',1),(12,12,'2024-01-01','P',1),(13,13,'2024-01-01','A',1),(14,14,'2024-01-01','P',1),(15,15,'2024-01-01','P',1),(16,16,'2024-01-01','P',1),(17,17,'2024-01-01','P',1),(18,18,'2024-01-01','P',1),(19,19,'2024-01-01','P',1),(20,20,'2024-01-01','A',1),(21,21,'2024-01-01','P',1),(22,22,'2024-01-01','A',1),(23,23,'2024-01-01','P',1),(24,24,'2024-01-01','P',1),(25,25,'2024-01-01','P',1),(26,1,'2024-01-02','A',1),(27,2,'2024-01-02','A',1),(28,3,'2024-01-02','P',1),(29,4,'2024-01-02','A',1),(30,5,'2024-01-02','A',1),(31,6,'2024-01-02','P',1),(32,7,'2024-01-02','A',1),(33,8,'2024-01-02','P',1),(34,9,'2024-01-02','A',1),(35,10,'2024-01-02','P',1),(36,11,'2024-01-02','P',1),(37,12,'2024-01-02','A',1),(38,13,'2024-01-02','P',1),(39,14,'2024-01-02','P',1),(40,15,'2024-01-02','A',1),(41,16,'2024-01-02','P',1),(42,17,'2024-01-02','A',1),(43,18,'2024-01-02','A',1),(44,19,'2024-01-02','P',1),(45,20,'2024-01-02','P',1),(46,21,'2024-01-02','P',1),(47,22,'2024-01-02','P',1),(48,23,'2024-01-02','P',1),(49,24,'2024-01-02','A',1),(50,25,'2024-01-02','A',1),(51,1,'2024-01-03','P',1),(52,2,'2024-01-03','P',1),(53,3,'2024-01-03','P',1),(54,4,'2024-01-03','P',1),(55,5,'2024-01-03','A',1),(56,6,'2024-01-03','A',1),(57,7,'2024-01-03','P',1),(58,8,'2024-01-03','P',1),(59,9,'2024-01-03','A',1),(60,10,'2024-01-03','A',1),(61,11,'2024-01-03','P',1),(62,12,'2024-01-03','P',1),(63,13,'2024-01-03','P',1),(64,14,'2024-01-03','A',1),(65,15,'2024-01-03','P',1),(66,16,'2024-01-03','P',1),(67,17,'2024-01-03','P',1),(68,18,'2024-01-03','P',1),(69,19,'2024-01-03','P',1),(70,20,'2024-01-03','P',1),(71,21,'2024-01-03','A',1),(72,22,'2024-01-03','P',1),(73,23,'2024-01-03','A',1),(74,24,'2024-01-03','P',1),(75,25,'2024-01-03','P',1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Class 1',1),(2,'Class 2',1),(3,'Class 3',1),(4,'Class 4',1),(5,'Class 5',1);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_collections`
--

DROP TABLE IF EXISTS `fee_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_collections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `fee_type_id` int NOT NULL,
  `amount_paid` bigint NOT NULL,
  `paid_date` date NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fee_collections_ibfk_1_idx` (`student_id`),
  KEY `fee_collections_ibfk_2_idx` (`fee_type_id`),
  CONSTRAINT `fee_collections_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `fee_collections_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_collections`
--

LOCK TABLES `fee_collections` WRITE;
/*!40000 ALTER TABLE `fee_collections` DISABLE KEYS */;
INSERT INTO `fee_collections` VALUES (1,1,1,1000,'2025-06-05',1),(2,1,2,500,'2025-06-05',1),(3,1,3,200,'2025-06-05',1),(4,2,1,1000,'2025-06-06',1),(5,2,4,100,'2025-06-06',1),(6,3,1,600,'2025-06-07',1),(7,4,1,1000,'2025-06-08',1),(8,4,2,300,'2025-06-08',1),(9,4,4,300,'2025-06-08',1),(10,6,1,1200,'2025-06-09',1),(11,6,2,600,'2025-06-09',1),(12,6,3,300,'2025-06-09',1),(13,7,1,800,'2025-06-10',1),(14,7,4,400,'2025-06-10',1),(15,9,1,1200,'2025-06-11',1),(16,9,2,400,'2025-06-11',1),(17,11,1,1500,'2025-06-12',1),(18,11,2,700,'2025-06-12',1),(19,11,3,400,'2025-06-12',1),(20,13,1,1500,'2025-06-13',1),(21,13,3,200,'2025-06-13',1),(22,14,1,1500,'2025-06-14',1),(23,14,2,400,'2025-06-14',1),(24,14,4,500,'2025-06-14',1),(25,16,1,1800,'2025-06-15',1),(26,16,2,800,'2025-06-15',1),(27,16,4,200,'2025-06-15',1),(28,18,1,900,'2025-06-16',1),(29,18,3,500,'2025-06-16',1),(30,19,1,1800,'2025-06-17',1),(31,19,2,600,'2025-06-17',1),(32,19,3,500,'2025-06-17',1),(33,21,1,2000,'2025-06-18',1),(34,21,2,900,'2025-06-18',1),(35,21,4,600,'2025-06-18',1),(36,23,1,1000,'2025-06-19',1),(37,23,3,600,'2025-06-19',1),(38,24,1,2000,'2025-06-20',1),(39,24,2,900,'2025-06-20',1),(40,24,3,600,'2025-06-20',1);
/*!40000 ALTER TABLE `fee_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_mappings`
--

DROP TABLE IF EXISTS `fee_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_mappings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `fee_type_id` int NOT NULL,
  `amount` bigint NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fee_mappings_ibfk_1_idx` (`student_id`),
  KEY `fee_mappings_ibfk_2_idx` (`fee_type_id`),
  CONSTRAINT `fee_mappings_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `fee_mappings_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_mappings`
--

LOCK TABLES `fee_mappings` WRITE;
/*!40000 ALTER TABLE `fee_mappings` DISABLE KEYS */;
INSERT INTO `fee_mappings` VALUES (1,1,1,1000,1),(2,1,2,500,1),(3,1,3,200,1),(4,2,1,1000,1),(5,2,4,300,1),(6,3,1,1000,1),(7,3,3,200,1),(8,4,1,1000,1),(9,4,2,500,1),(10,4,4,300,1),(11,5,1,1000,1),(12,6,1,1200,1),(13,6,2,600,1),(14,6,3,300,1),(15,7,1,1200,1),(16,7,4,400,1),(17,8,1,1200,1),(18,8,3,300,1),(19,9,1,1200,1),(20,9,2,600,1),(21,9,4,400,1),(22,10,1,1200,1),(23,11,1,1500,1),(24,11,2,700,1),(25,11,3,400,1),(26,12,1,1500,1),(27,13,1,1500,1),(28,13,3,400,1),(29,14,1,1500,1),(30,14,2,700,1),(31,14,4,500,1),(32,15,1,1500,1),(33,16,1,1800,1),(34,16,2,800,1),(35,16,4,500,1),(36,17,1,1800,1),(37,18,1,1800,1),(38,18,3,500,1),(39,19,1,1800,1),(40,19,2,800,1),(41,19,3,500,1),(42,20,1,1800,1),(43,21,1,2000,1),(44,21,2,900,1),(45,21,4,600,1),(46,22,1,2000,1),(47,23,1,2000,1),(48,23,3,600,1),(49,24,1,2000,1),(50,24,2,900,1),(51,24,3,600,1),(52,25,1,2000,1);
/*!40000 ALTER TABLE `fee_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_types`
--

DROP TABLE IF EXISTS `fee_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_types`
--

LOCK TABLES `fee_types` WRITE;
/*!40000 ALTER TABLE `fee_types` DISABLE KEYS */;
INSERT INTO `fee_types` VALUES (1,'Tuition Fee',1),(2,'Transport Fee',1),(3,'Library Fee',1),(4,'Sports Fee',1);
/*!40000 ALTER TABLE `fee_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class_id` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `students_ibfk_1_idx` (`class_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Rahul Verma',1,1),(2,'Priya Sharma',1,1),(3,'Amit Singh',1,1),(4,'Neha Rani',1,1),(5,'Vikas Kumar',1,1),(6,'Sneha Patel',2,1),(7,'Aryan Gupta',2,1),(8,'Kiran Joshi',2,1),(9,'Deepak Yadav',2,1),(10,'Simran Kaur',2,1),(11,'Mohit Sinha',3,1),(12,'Anjali Mehta',3,1),(13,'Sourav Das',3,1),(14,'Megha Roy',3,1),(15,'Ravi Jha',3,1),(16,'Tarun Jain',4,1),(17,'Alka Nair',4,1),(18,'Piyush Sen',4,1),(19,'Sheetal Rao',4,1),(20,'Nikhil Bhatia',4,1),(21,'Harshita Goel',5,1),(22,'Manish Desai',5,1),(23,'Divya Reddy',5,1),(24,'Akash Tripathi',5,1),(25,'Gauri Menon',5,1);
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

-- Dump completed on 2025-08-20 12:36:40
