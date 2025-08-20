-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: task3
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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Computer Science Engineering',1),(2,'Mechanical Engineering',1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `exam_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,1,1,87.50,'2024-12-15',1),(2,1,2,92.00,'2024-12-15',1),(3,1,3,78.75,'2024-12-15',1),(4,1,4,85.25,'2024-12-15',1),(5,1,5,89.00,'2024-12-15',1),(6,2,1,94.25,'2024-12-15',1),(7,2,2,88.50,'2024-12-15',1),(8,2,3,91.75,'2024-12-15',1),(9,2,4,86.00,'2024-12-15',1),(10,2,5,93.25,'2024-12-15',1),(11,3,1,76.00,'2024-12-15',1),(12,3,2,82.75,'2024-12-15',1),(13,3,3,79.50,'2024-12-15',1),(14,3,4,84.25,'2024-12-15',1),(15,3,5,77.75,'2024-12-15',1),(16,4,1,90.75,'2024-12-15',1),(17,4,2,95.00,'2024-12-15',1),(18,4,3,87.25,'2024-12-15',1),(19,4,4,89.50,'2024-12-15',1),(20,4,5,92.75,'2024-12-15',1),(21,5,1,83.25,'2024-12-15',1),(22,5,2,79.50,'2024-12-15',1),(23,5,3,85.75,'2024-12-15',1),(24,5,4,88.00,'2024-12-15',1),(25,5,5,81.25,'2024-12-15',1),(26,6,6,85.50,'2024-12-15',1),(27,6,7,78.25,'2024-12-15',1),(28,6,8,89.75,'2024-12-15',1),(29,6,9,82.00,'2024-12-15',1),(30,6,10,86.50,'2024-12-15',1),(31,7,6,92.25,'2024-12-15',1),(32,7,7,88.75,'2024-12-15',1),(33,7,8,94.00,'2024-12-15',1),(34,7,9,90.50,'2024-12-15',1),(35,7,10,87.75,'2024-12-15',1),(36,8,6,74.50,'2024-12-15',1),(37,8,7,81.25,'2024-12-15',1),(38,8,8,76.75,'2024-12-15',1),(39,8,9,79.00,'2024-12-15',1),(40,8,10,83.50,'2024-12-15',1),(41,9,6,88.75,'2024-12-15',1),(42,9,7,85.50,'2024-12-15',1),(43,9,8,91.25,'2024-12-15',1),(44,9,9,87.00,'2024-12-15',1),(45,9,10,89.75,'2024-12-15',1),(46,10,6,80.25,'2024-12-15',1),(47,10,7,77.50,'2024-12-15',1),(48,10,8,84.75,'2024-12-15',1),(49,10,9,81.00,'2024-12-15',1),(50,10,10,78.25,'2024-12-15',1);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `course_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Rahul Sharma',1,1),(2,'Priya Patel',1,1),(3,'Amit Kumar',1,1),(4,'Sneha Singh',1,1),(5,'Vikram Gupta',1,1),(6,'Arjun Reddy',2,1),(7,'Kavya Nair',2,1),(8,'Rohit Joshi',2,1),(9,'Anita Desai',2,1),(10,'Karan Mehta',2,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `course_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Data Structures and Algorithms',1,1),(2,'Database Management Systems',1,1),(3,'Operating Systems',1,1),(4,'Computer Networks',1,1),(5,'Software Engineering',1,1),(6,'Thermodynamics',2,1),(7,'Fluid Mechanics',2,1),(8,'Machine Design',2,1),(9,'Manufacturing Processes',2,1),(10,'Heat Transfer',2,1);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20 12:37:55
