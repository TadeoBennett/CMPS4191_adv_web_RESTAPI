-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 192.168.182.129    Database: laptopstore
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Belize','2023-10-12 06:38:55'),(2,'Corozal','2023-10-12 06:38:55'),(3,'OrangeWalk','2023-10-12 06:38:55'),(4,'Cayo','2023-10-12 06:38:55'),(5,'StannCreek','2023-10-12 06:38:55'),(6,'Toledo','2023-10-12 06:38:55');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Apple',1,'2023-10-12 06:38:55'),(2,'Dell',1,'2023-10-12 06:38:55'),(3,'HP (Hewlett-Packard)',1,'2023-10-12 06:38:55'),(4,'Lenovo',1,'2023-10-12 06:38:55'),(5,'Acer',1,'2023-10-12 06:38:55'),(6,'Asus',1,'2023-10-12 06:38:55'),(7,'Microsoft',1,'2023-10-12 06:38:55'),(8,'MSI (Micro-Star International)',1,'2023-10-12 06:38:55'),(9,'Samsung',1,'2023-10-12 06:38:55'),(10,'LG',1,'2023-10-12 06:38:55'),(11,'Sony (Sony VAIO)',1,'2023-10-12 06:38:55'),(12,'Toshiba',1,'2023-10-12 06:38:55'),(13,'Razer',1,'2023-10-12 06:38:55'),(14,'Alienware (a subsidiary of Dell)',1,'2023-10-12 06:38:55'),(15,'Huawei',1,'2023-10-12 06:38:55'),(16,'Gigabyte',1,'2023-10-12 06:38:55'),(17,'Fujitsu',1,'2023-10-12 06:38:55'),(18,'Panasonic',1,'2023-10-12 06:38:55'),(19,'Google (Pixelbook)',1,'2023-10-12 06:38:55'),(20,'LG (Gram)',1,'2023-10-12 06:38:55'),(21,'Chuwi',1,'2023-10-12 06:38:55'),(22,'Xiaomi',1,'2023-10-12 06:38:55'),(23,'Gateway',1,'2023-10-12 06:38:55'),(24,'Medion',1,'2023-10-12 06:38:55'),(25,'Aorus',1,'2023-10-12 06:38:55'),(26,'System76',1,'2023-10-12 06:38:55'),(27,'Vaio (Independent from Sony)',1,'2023-10-12 06:38:55'),(28,'Dynabook (formerly Toshiba)',1,'2023-10-12 06:38:55'),(29,'Clevo (primarily an ODM)',1,'2023-10-12 06:38:55'),(30,'Eluktronics',1,'2023-10-12 06:38:55'),(31,'Eurocom',1,'2023-10-12 06:38:55'),(32,'HCL',1,'2023-10-12 06:38:55'),(33,'Vizio',1,'2023-10-12 06:38:55'),(34,'Purism',1,'2023-10-12 06:38:55');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ultrabook','2023-10-12 06:38:55'),(2,'Gaming Laptop','2023-10-12 06:38:55'),(3,'Business Laptop','2023-10-12 06:38:55'),(4,'2-in-1 (convertible or Hybrid)','2023-10-12 06:38:55'),(5,'Chromebooks','2023-10-12 06:38:55'),(6,'Workstations','2023-10-12 06:38:55'),(7,'Budget','2023-10-12 06:38:55'),(8,'Rugged','2023-10-12 06:38:55'),(9,'Student','2023-10-12 06:38:55'),(10,'Multimedia','2023-10-12 06:38:55'),(11,'Travel','2023-10-12 06:38:55'),(12,'Laptops for Creative Professionals','2023-10-12 06:38:55'),(13,'Education','2023-10-12 06:38:55'),(14,'High-Performance','2023-10-12 06:38:55'),(15,'Linux','2023-10-12 06:38:55');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,2,4,'Exceptional Service and easy to use buying experience! Would Recommend!!','2023-10-12 06:38:56');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_permissions`
--

DROP TABLE IF EXISTS `key_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  `method_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_id` (`key_id`),
  KEY `permission_id` (`permission_id`),
  KEY `method_id` (`method_id`),
  CONSTRAINT `key_permissions_ibfk_1` FOREIGN KEY (`key_id`) REFERENCES `user_keys` (`key_id`) ON DELETE CASCADE,
  CONSTRAINT `key_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`),
  CONSTRAINT `key_permissions_ibfk_3` FOREIGN KEY (`method_id`) REFERENCES `methods` (`method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_permissions`
--

LOCK TABLES `key_permissions` WRITE;
/*!40000 ALTER TABLE `key_permissions` DISABLE KEYS */;
INSERT INTO `key_permissions` VALUES (1,1,1,1,'2023-10-12 06:38:56',1),(2,1,2,1,'2023-10-12 06:38:56',1),(3,1,3,1,'2023-10-12 06:38:56',1),(4,1,4,1,'2023-10-12 06:38:56',1),(5,1,1,2,'2023-10-12 06:38:56',1),(6,1,1,3,'2023-10-12 06:38:56',1),(7,1,1,4,'2023-10-12 06:38:56',1),(8,1,4,2,'2023-10-12 06:38:56',1),(9,1,4,3,'2023-10-12 06:38:56',1),(10,1,4,4,'2023-10-12 06:38:56',1),(11,2,4,1,'2023-10-12 06:38:56',1),(13,4,1,1,'2023-10-12 06:42:49',1),(14,4,2,1,'2023-10-12 06:42:49',1),(15,4,3,1,'2023-10-12 06:42:49',1),(16,4,4,1,'2023-10-12 06:42:49',1),(17,4,1,2,'2023-10-12 06:42:49',1),(18,4,1,3,'2023-10-12 06:42:49',1),(19,4,1,4,'2023-10-12 06:42:49',1),(20,4,4,2,'2023-10-12 06:42:49',1),(21,4,4,3,'2023-10-12 06:42:49',1),(22,4,4,4,'2023-10-12 06:42:49',1);
/*!40000 ALTER TABLE `key_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptops`
--

DROP TABLE IF EXISTS `laptops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptops` (
  `laptop_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand` int DEFAULT NULL,
  `cpu_type` varchar(255) DEFAULT NULL,
  `cpu_name` varchar(255) DEFAULT NULL,
  `ram` int DEFAULT NULL,
  `ram_type` varchar(255) DEFAULT NULL,
  `storage_type` varchar(255) DEFAULT NULL,
  `storage_capacity` int DEFAULT NULL,
  `has_gpu` tinyint(1) DEFAULT NULL,
  `gpu_type` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `operating_system` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`laptop_id`),
  KEY `category_id` (`category_id`),
  KEY `brand` (`brand`),
  CONSTRAINT `laptops_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `laptops_ibfk_2` FOREIGN KEY (`brand`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptops`
--

LOCK TABLES `laptops` WRITE;
/*!40000 ALTER TABLE `laptops` DISABLE KEYS */;
INSERT INTO `laptops` VALUES (1,1,'Laptop Alpha',8,'Intel','Core i5',8,'DDR4','SSD',256,1,'NVIDIA GeForce GTX 1650','15.6\" LED','Full HD','Windows 10',999,1,'2023-10-12 06:38:56'),(2,2,'Laptop Beta',10,'AMD','Ryzen 7',16,'DDR4','NVMe SSD',512,1,'NVIDIA GeForce RTX 3070','17.3\" IPS','4K UHD','Windows 11',1499,1,'2023-10-12 06:38:56'),(3,3,'Laptop Gamma',3,'Intel','Core i7',16,'DDR4','SSD',512,1,'NVIDIA GeForce RTX 3060','15.6\" IPS','Full HD','Windows 10',1299,1,'2023-10-12 06:38:56'),(4,4,'MyNewLaptop 23',15,'AMD','Ryzen 5',64,'DDR4','HDD',128,0,NULL,'14\" LCD','HD','Linux',699,1,'2023-10-12 06:38:56'),(5,5,'Laptop Epsilon',8,'Intel','Core i9',32,'DDR4','SSD',1000,1,'NVIDIA GeForce RTX 3080','17.3\" OLED','4K UHD','Windows 10',2499,1,'2023-10-12 06:38:56'),(6,6,'Laptop Zeta',5,'Intel','Core i7',16,'DDR4','SSD',512,1,'NVIDIA GeForce GTX 1660 Ti','15.6\" LED','Full HD','Windows 11',1199,1,'2023-10-12 06:38:56'),(7,7,'Laptop Eta',2,'AMD','Ryzen 5',8,'DDR4','SSD',256,1,'AMD Radeon Graphics','14\" IPS','Full HD','Windows 10',899,1,'2023-10-12 06:38:56'),(8,8,'Laptop Theta',4,'Intel','Core i3',4,'DDR3','HDD',500,0,NULL,'13.3\" LED','HD','Windows 10',499,1,'2023-10-12 06:38:56'),(9,9,'Laptop Iota',9,'AMD','Ryzen 9',32,'DDR4','NVMe SSD',1000,1,'NVIDIA GeForce RTX 3060','15.6\" IPS','Full HD','Windows 11',1599,1,'2023-10-12 06:38:56'),(10,10,'Laptop Kappa',11,'Intel','Core i7',16,'DDR4','SSD',512,1,'Intel Iris Xe Graphics','14\" IPS','Full HD','Windows 11',1299,1,'2023-10-12 06:38:56'),(11,11,'Laptop Lambda',14,'AMD','Ryzen 5',8,'DDR4','SSD',256,1,'AMD Radeon Graphics','13.3\" LED','Full HD','Windows 10',799,1,'2023-10-12 06:38:56'),(12,12,'Laptop Mu',1,'Intel','Celeron',4,'DDR3','HDD',320,0,NULL,'15.6\" LED','HD','Windows 10',399,1,'2023-10-12 06:38:56'),(13,13,'Laptop Nu',7,'Intel','Core i5',8,'DDR4','SSD',256,1,'Intel UHD Graphics','15.6\" LED','Full HD','Windows 10',699,1,'2023-10-12 06:38:56'),(14,14,'Laptop Xi',12,'AMD','Ryzen 3',8,'DDR4','SSD',512,0,NULL,'14\" LCD','HD','Linux',549,1,'2023-10-12 06:38:56'),(15,15,'Laptop Omicron',6,'Intel','Core i5',8,'DDR4','SSD',512,1,'Intel Iris Xe Graphics','15.6\" IPS','Full HD','Windows 10',849,1,'2023-10-12 06:38:56'),(16,16,'Laptop Pi',3,'AMD','Ryzen 7',16,'DDR4','NVMe SSD',1000,1,'NVIDIA GeForce GTX 1660 Ti','17.3\" IPS','Full HD','Windows 11',1399,1,'2023-10-12 06:38:56'),(17,17,'Laptop Rho',5,'Intel','Core i7',16,'DDR4','SSD',256,1,'NVIDIA GeForce GTX 1650','15.6\" LED','Full HD','Windows 11',1199,1,'2023-10-12 06:38:56'),(18,18,'Laptop Sigma',2,'AMD','Ryzen 9',32,'DDR4','SSD',1000,1,'NVIDIA GeForce RTX 3070','17.3\" OLED','4K UHD','Windows 11',1899,1,'2023-10-12 06:38:56'),(19,19,'Laptop Tau',13,'Intel','Core i3',4,'DDR3','HDD',500,0,NULL,'13.3\" LED','HD','Windows 10',499,1,'2023-10-12 06:38:56'),(20,20,'Laptop Upsilon',4,'Intel','Core i7',16,'DDR4','NVMe SSD',512,1,'NVIDIA GeForce GTX 1660 Ti','15.6\" IPS','Full HD','Windows 10',1299,1,'2023-10-12 06:38:56'),(21,12,'Laptop Mu',7,'Intel','Core i5',8,'DDR4','SSD',512,1,'Intel UHD Graphics','14\" LED','Full HD','Windows 10',749,1,'2023-10-12 06:38:56'),(22,6,'Laptop Chi',8,'Intel','Core i5',8,'DDR4','SSD',256,1,'Intel UHD Graphics','15.6\" LED','Full HD','Windows 10',799,1,'2023-10-12 06:38:56'),(23,11,'Laptop Psi',2,'AMD','Ryzen 3',8,'DDR4','SSD',256,0,NULL,'14\" LCD','HD','Linux',549,1,'2023-10-12 06:38:56'),(24,3,'Laptop Omega',9,'Intel','Core i7',16,'DDR4','NVMe SSD',1000,1,'NVIDIA GeForce GTX 1660 Ti','17.3\" IPS','Full HD','Windows 11',1399,1,'2023-10-12 06:38:56'),(26,7,'Laptop Eta',14,'AMD','Ryzen 9',32,'DDR4','SSD',1000,1,'NVIDIA GeForce RTX 3070','17.3\" OLED','4K UHD','Windows 11',1899,1,'2023-10-12 06:38:56'),(27,2,'Laptop Theta',3,'Intel','Core i3',4,'DDR3','HDD',500,0,NULL,'13.3\" LED','HD','Windows 10',499,1,'2023-10-12 06:38:56'),(28,13,'Laptop Iota',1,'AMD','Ryzen 7',16,'DDR4','NVMe SSD',1000,1,'NVIDIA GeForce RTX 3060','15.6\" IPS','Full HD','Windows 11',1599,1,'2023-10-12 06:38:56'),(29,4,'Laptop Kappa',6,'Intel','Core i7',16,'DDR4','SSD',512,1,'Intel Iris Xe Graphics','14\" IPS','Full HD','Windows 11',1299,1,'2023-10-12 06:38:56'),(30,1,'Laptop Lambda',5,'AMD','Ryzen 5',8,'DDR4','SSD',256,0,NULL,'15.6\" LED','Full HD','Windows 10',899,1,'2023-10-12 06:38:56');
/*!40000 ALTER TABLE `laptops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `methods` (
  `method_id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methods`
--

LOCK TABLES `methods` WRITE;
/*!40000 ALTER TABLE `methods` DISABLE KEYS */;
INSERT INTO `methods` VALUES (1,'GET','2023-10-12 06:38:56'),(2,'POST','2023-10-12 06:38:56'),(3,'PUT','2023-10-12 06:38:56'),(4,'DELETE','2023-10-12 06:38:56');
/*!40000 ALTER TABLE `methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `laptop_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `laptop_id` (`laptop_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`laptop_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,1,'2023-10-12 06:38:56');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'users','/','2023-10-12 06:38:56',1),(2,'users','employees','2023-10-12 06:38:56',1),(3,'users','customers','2023-10-12 06:38:56',1),(4,'laptops','/','2023-10-12 06:38:56',1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'employee','2023-10-12 06:38:55'),(2,'customer','2023-10-12 06:38:55');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_keys`
--

DROP TABLE IF EXISTS `user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_keys` (
  `key_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `expired` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_keys`
--

LOCK TABLES `user_keys` WRITE;
/*!40000 ALTER TABLE `user_keys` DISABLE KEYS */;
INSERT INTO `user_keys` VALUES (1,1,'awt_Klw8!LhJ!2e,+?R%;#NZ_2967926746',0,'2023-10-12 06:38:56',1),(2,2,'awt_H=D}ZPACJe:=a;XP*ity_3331065083',0,'2023-10-12 06:38:56',1),(4,4,'awt_yE>uRlg41IM,6%X!t,FwOf*w_2456145190',0,'2023-10-12 06:42:49',1);
/*!40000 ALTER TABLE `user_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` int DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `member` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `address` (`address`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`address`) REFERENCES `addresses` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Tadeo','Bennett','TBennett','tadeo@gmail.com',4,'',21,'Tadeo2002',0,1,'2023-10-12 06:38:55'),(2,2,'Luke','SKyWalker','LSkyWalker','luke@gmail.com',6,'',22,'William2002',1,1,'2023-10-12 06:38:55'),(4,1,'John','Doe','JDoe','john@gmail.com',3,NULL,NULL,'password',0,1,'2023-10-12 06:42:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12  2:34:14
