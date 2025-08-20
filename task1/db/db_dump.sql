-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: task1
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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Smith','New York',1),(2,'Sarah Johnson','Los Angeles',1),(3,'Michael Brown','Chicago',1),(4,'Emily Davis','Houston',1),(5,'David Wilson','Phoenix',1),(6,'Jessica Miller','Philadelphia',1),(7,'Christopher Jones','San Antonio',1),(8,'Amanda Garcia','San Diego',1),(9,'Matthew Rodriguez','Dallas',1),(10,'Ashley Martinez','San Jose',1),(11,'Daniel Anderson','Austin',1),(12,'Stephanie Taylor','Jacksonville',1),(13,'Ryan Thomas','Fort Worth',1),(14,'Nicole Hernandez','Columbus',1),(15,'Kevin Moore','Charlotte',1),(16,'Lauren Jackson','San Francisco',1),(17,'Brandon Martin','Indianapolis',1),(18,'Megan Lee','Seattle',1),(19,'Tyler Thompson','Denver',1),(20,'Samantha White','Washington',1),(21,'Justin Harris','Boston',1),(22,'Brittany Clark','Nashville',1),(23,'Andrew Lewis','Las Vegas',1),(24,'Kimberly Walker','Portland',1),(25,'Joshua Hall','Miami',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,1),(2,1,4,2,1),(3,2,3,1,1),(4,2,8,1,1),(5,3,2,1,1),(6,3,5,1,1),(7,3,9,3,1),(8,4,7,2,1),(9,4,10,1,1),(10,5,6,1,1),(11,5,1,1,1),(12,6,4,3,1),(13,6,9,2,1),(14,7,2,1,1),(15,7,7,1,1),(16,7,10,2,1),(17,8,3,1,1),(18,8,5,2,1),(19,9,8,3,1),(20,9,6,1,1),(21,10,1,2,1),(22,10,9,1,1),(23,11,4,1,1),(24,11,10,3,1),(25,12,2,1,1),(26,12,7,2,1),(27,12,5,1,1),(28,13,3,1,1),(29,13,8,1,1),(30,14,6,2,1),(31,14,1,1,1),(32,15,9,4,1),(33,15,4,1,1),(34,16,2,1,1),(35,16,10,2,1),(36,16,7,1,1),(37,17,5,1,1),(38,17,8,2,1),(39,18,1,1,1),(40,18,3,1,1),(41,18,6,1,1),(42,19,4,2,1),(43,19,9,1,1),(44,20,2,1,1),(45,20,7,3,1),(46,21,10,1,1),(47,21,5,2,1),(48,21,8,1,1),(49,22,1,1,1),(50,22,6,1,1),(51,23,3,2,1),(52,23,9,1,1),(53,24,4,1,1),(54,24,2,1,1),(55,24,10,2,1),(56,25,7,1,1),(57,25,5,3,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2024-11-02',1),(2,3,'2024-11-05',1),(3,7,'2024-11-08',1),(4,12,'2024-11-12',1),(5,15,'2024-11-15',1),(6,9,'2024-11-18',1),(7,22,'2024-11-22',1),(8,5,'2024-11-25',1),(9,18,'2024-11-28',1),(10,2,'2024-12-03',1),(11,14,'2024-12-06',1),(12,8,'2024-12-10',1),(13,21,'2024-12-13',1),(14,11,'2024-12-16',1),(15,19,'2024-12-19',1),(16,4,'2024-12-22',1),(17,25,'2024-12-26',1),(18,6,'2024-12-29',1),(19,13,'2025-01-05',1),(20,17,'2025-01-08',1),(21,20,'2025-01-12',1),(22,10,'2025-01-15',1),(23,23,'2025-01-18',1),(24,16,'2025-01-22',1),(25,24,'2025-01-25',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 15 Pro','Electronics',999.99,1),(2,'Samsung Galaxy S24','Electronics',849.99,1),(3,'MacBook Air M3','Electronics',1299.99,1),(4,'Levi\'s 501 Jeans','Clothing',89.99,1),(5,'Nike Air Max 270','Clothing',149.99,1),(6,'Adidas Hoodie','Clothing',79.99,1),(7,'The Great Gatsby','Books',12.99,1),(8,'Python Programming Guide','Books',34.99,1),(9,'Organic Almonds 1kg','Food',24.99,1),(10,'Premium Coffee Beans','Food',18.99,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20 12:35:02
