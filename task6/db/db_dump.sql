-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: task5
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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `supplier_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Wireless Mouse','Electronics',1,29.99,1),(2,'USB-C Cable','Accessories',1,15.50,1),(3,'Bluetooth Keyboard','Electronics',1,89.99,1),(4,'Phone Stand','Accessories',1,12.99,1),(5,'Laptop Charger','Electronics',1,45.99,1),(6,'LED Monitor 24\"','Displays',2,189.99,1),(7,'Gaming Headset','Audio',2,79.99,1),(8,'External Hard Drive 1TB','Storage',2,65.99,1),(9,'Webcam HD','Electronics',2,39.99,1),(10,'Power Bank 10000mAh','Accessories',2,25.99,1),(11,'Wireless Earbuds','Audio',2,129.99,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `purchase_date` date NOT NULL,
  `quantity` int NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,1,'2024-01-15',50,1200.00,1),(2,2,'2024-01-18',100,1400.00,1),(3,3,'2024-01-22',30,2400.00,1),(4,4,'2024-01-25',75,850.00,1),(5,5,'2024-01-28',40,1600.00,1),(6,1,'2024-02-05',60,1500.00,1),(7,2,'2024-02-08',80,1100.00,1),(8,3,'2024-02-12',25,2000.00,1),(9,4,'2024-02-15',90,1080.00,1),(10,5,'2024-02-18',35,1400.00,1),(11,1,'2024-03-02',45,1125.00,1),(12,2,'2024-03-05',120,1680.00,1),(13,3,'2024-03-08',20,1600.00,1),(14,4,'2024-03-12',65,780.00,1),(15,5,'2024-03-15',50,2000.00,1),(16,1,'2024-03-20',55,1375.00,1),(17,2,'2024-03-25',95,1330.00,1),(18,3,'2024-03-28',28,2240.00,1),(19,4,'2024-04-02',70,840.00,1),(20,5,'2024-04-05',42,1680.00,1),(21,6,'2024-01-12',25,4250.00,1),(22,7,'2024-01-16',40,2800.00,1),(23,8,'2024-01-20',30,1800.00,1),(24,9,'2024-01-24',50,1750.00,1),(25,10,'2024-01-28',80,1840.00,1),(26,11,'2024-02-02',35,4200.00,1),(27,6,'2024-02-06',20,3400.00,1),(28,7,'2024-02-10',45,3150.00,1),(29,8,'2024-02-14',25,1500.00,1),(30,9,'2024-02-18',60,2100.00,1),(31,10,'2024-02-22',70,1610.00,1),(32,11,'2024-02-26',30,3600.00,1),(33,6,'2024-03-05',22,3740.00,1),(34,7,'2024-03-08',38,2660.00,1),(35,8,'2024-03-12',28,1680.00,1),(36,9,'2024-03-16',55,1925.00,1),(37,10,'2024-03-20',65,1495.00,1),(38,11,'2024-03-24',32,3840.00,1),(39,6,'2024-03-28',18,3060.00,1),(40,7,'2024-04-02',42,2940.00,1);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `sale_date` date NOT NULL,
  `quantity` int NOT NULL,
  `revenue` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'2024-01-20',25,749.75,1),(2,2,'2024-01-23',40,620.00,1),(3,3,'2024-01-27',15,1349.85,1),(4,4,'2024-01-30',35,454.65,1),(5,5,'2024-02-03',20,919.80,1),(6,1,'2024-02-08',30,899.70,1),(7,2,'2024-02-12',50,775.00,1),(8,3,'2024-02-16',12,1079.88,1),(9,4,'2024-02-20',45,584.55,1),(10,5,'2024-02-24',25,1149.75,1),(11,1,'2024-03-05',28,839.72,1),(12,2,'2024-03-10',60,930.00,1),(13,3,'2024-03-14',10,899.90,1),(14,4,'2024-03-18',38,493.62,1),(15,5,'2024-03-22',30,1379.70,1),(16,1,'2024-03-26',32,959.68,1),(17,2,'2024-03-30',45,697.50,1),(18,3,'2024-04-05',18,1619.82,1),(19,4,'2024-04-10',40,519.60,1),(20,5,'2024-04-15',22,1011.78,1),(21,6,'2024-01-25',12,2279.88,1),(22,7,'2024-01-28',20,1599.80,1),(23,8,'2024-02-02',15,989.85,1),(24,9,'2024-02-05',25,999.75,1),(25,10,'2024-02-08',35,909.65,1),(26,11,'2024-02-12',18,2339.82,1),(27,6,'2024-02-15',10,1899.90,1),(28,7,'2024-02-18',22,1759.78,1),(29,8,'2024-02-22',12,791.88,1),(30,9,'2024-02-25',30,1199.70,1),(31,10,'2024-02-28',40,1039.60,1),(32,11,'2024-03-05',15,1949.85,1),(33,6,'2024-03-10',8,1519.92,1),(34,7,'2024-03-14',25,1999.75,1),(35,8,'2024-03-18',18,1187.82,1),(36,9,'2024-03-22',28,1119.72,1),(37,10,'2024-03-26',32,831.68,1),(38,11,'2024-03-30',20,2599.80,1),(39,6,'2024-04-05',14,2659.86,1),(40,7,'2024-04-10',19,1519.81,1);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'TechSupply Corp',1),(2,'ElectroMax Solutions',1);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20 12:38:55
