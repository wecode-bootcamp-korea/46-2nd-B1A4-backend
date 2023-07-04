-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: space_around
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `amenities_options`
--

DROP TABLE IF EXISTS `amenities_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `icon_img` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities_options`
--

LOCK TABLES `amenities_options` WRITE;
/*!40000 ALTER TABLE `amenities_options` DISABLE KEYS */;
INSERT INTO `amenities_options` VALUES (1,'셀프 체크인','키패드를 이용해 체크인하세요','https://github.com/wooooongee/wooooongee/assets/123567359/233ef735-9101-43d7-8d5c-747b8f1f1e15'),(2,'인터넷 / 와이파이','무료 인터넷을 사용하세요','https://github-production-user-asset-6210df.s3.amazonaws.com/123567359/247100291-2b25f045-5af8-4514-a966-ef7b0b3424d1.png'),(3,'무료 주차','무료 주차장을 이용하세요','https://github.com/wooooongee/wooooongee/assets/123567359/e596c11c-7d3c-45d5-9360-41a8f1a1f04f');
/*!40000 ALTER TABLE `amenities_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_list`
--

DROP TABLE IF EXISTS `booking_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `user_id` int NOT NULL,
  `studio_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `total_guest` int NOT NULL,
  `booking_date` date DEFAULT NULL,
  `time_slot` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_time_slot_booking_date` (`time_slot`,`booking_date`),
  KEY `user_id` (`user_id`),
  KEY `booking_id` (`booking_id`),
  KEY `studio_id` (`studio_id`),
  CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  CONSTRAINT `booking_list_ibfk_3` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`),
  CONSTRAINT `fk_booking_list_time_slot` FOREIGN KEY (`time_slot`) REFERENCES `time_slot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_list`
--

LOCK TABLES `booking_list` WRITE;
/*!40000 ALTER TABLE `booking_list` DISABLE KEYS */;
INSERT INTO `booking_list` VALUES (1,1,24,9,12000.00,1,'2023-06-29',3),(2,1,24,9,12000.00,1,'2023-06-29',4),(3,2,28,9,12000.00,2,'2023-06-29',5),(4,2,28,9,12000.00,2,'2023-06-29',6);
/*!40000 ALTER TABLE `booking_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
INSERT INTO `booking_status` VALUES (1,'SUCCESS'),(2,'FAIL');
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `booking_status_id` int NOT NULL,
  `booking_number` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `booking_status_id` (`booking_status_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,24,1,'92b6f9ee-99b0-48d7-85fa-02fc37c8961f','2023-06-29 10:22:59',NULL),(2,28,1,'fd8eff8e-1389-47c2-ad0e-e5d706d617e7','2023-06-29 12:29:25',NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `studio_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studio_id` (`studio_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`),
  CONSTRAINT `hosts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (1,'2023-06-29 05:43:06',NULL,9,1),(2,'2023-06-29 05:48:55',NULL,1,2),(3,'2023-06-29 05:48:55',NULL,2,3),(4,'2023-06-29 05:48:55',NULL,8,4),(5,'2023-06-29 05:48:55',NULL,10,5),(6,'2023-06-29 05:48:55',NULL,11,6),(7,'2023-06-29 05:48:55',NULL,3,7),(8,'2023-06-29 05:48:55',NULL,4,8),(9,'2023-06-29 05:48:55',NULL,20,9),(10,'2023-06-29 05:48:55',NULL,21,10),(18,'2023-06-29 12:35:07','2023-06-29 12:35:55',115,28);
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `studio_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `liked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_studio` (`user_id`,`studio_id`),
  KEY `studio_id` (`studio_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2578 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (2528,28,13,'2023-06-29 12:24:07',0),(2529,28,10,'2023-06-29 12:24:09',1),(2530,28,11,'2023-06-29 12:24:14',1),(2531,28,12,'2023-06-29 12:24:15',0),(2532,28,60,'2023-06-29 12:24:17',0),(2533,28,61,'2023-06-29 12:24:18',0),(2553,24,9,'2023-06-29 15:04:41',0),(2554,24,11,'2023-06-29 15:04:45',0),(2556,24,10,'2023-06-29 15:04:49',0);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_status`
--

LOCK TABLES `payment_status` WRITE;
/*!40000 ALTER TABLE `payment_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `payment_status_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `payment_status_id` (`payment_status_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_images`
--

DROP TABLE IF EXISTS `review_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `image` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `review_images_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_images`
--

LOCK TABLES `review_images` WRITE;
/*!40000 ALTER TABLE `review_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `review_content` text,
  `rating` float NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `studio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `studio_id` (`studio_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,'😊 환상적인 사진 스튜디오 체험!\n\n이곳 사진 스튜디오에서의 경험은 정말 환상적이었습니다! 사진 스튜디오의 분위기는 매우 아름답고 현대적이며, 스태프들은 정말로 전문적이었습니다.\n\n스튜디오 공간은 넓고 편안하여 모델링을 할 때 완벽한 조명과 배경을 갖출 수 있었습니다. 또한, 스튜디오에는 최신 카메라와 장비들이 구비되어 있어 진정한 전문 사진 작가처럼 느껴졌습니다.\n\n스태프들은 친절하고 신속하게 도와주었으며, 사진 촬영에 대한 전문적인 조언과 가이드를 제공해주어 사진 촬영 경험이 더욱 풍부해졌습니다. 그들은 우리의 아름다움을 최대한으로 강조하는데 열심히 일했습니다.\n\n최종적으로 나온 사진들은 말할 수 없이 멋졌습니다! 나와 가족들의 아름다움과 행복한 순간들을 완벽하게 담아냈습니다. 사진 품질은 정말 탁월하며, 포즈와 조명도 완벽했습니다.\n\n이 사진 스튜디오는 정말로 추천할 만합니다. 전문적인 스태프들과 아름다운 공간에서 최고의 사진을 얻을 수 있습니다. 다시 한 번 방문하고 싶은 곳이었습니다!',4.5,'2023-06-29 12:33:00','2023-06-29 12:35:25',9),(2,1,'🌈 완벽한 사진 스튜디오!\n\n이 사진 스튜디오는 완벽했습니다! ',3,'2023-06-29 12:33:56','2023-06-29 13:32:25',9);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(128) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20230619023125'),('20230619023321'),('20230619023328'),('20230619023342'),('20230619023347'),('20230619023359'),('20230619023410'),('20230619023415'),('20230619023420'),('20230619023425'),('20230619023435'),('20230619023436'),('20230619023458'),('20230619023505'),('20230619023511'),('20230619041156'),('20230619041224'),('20230619041254'),('20230619041306'),('20230619041329'),('20230619041411'),('20230619041434'),('20230619042351'),('20230619042417'),('20230619042440'),('20230619065134'),('20230620060339'),('20230621021130'),('20230621030457'),('20230621052551'),('20230621053210'),('20230621054358'),('20230621060556'),('20230621060649'),('20230621061530'),('20230622025510'),('20230622030818'),('20230622055810'),('20230622063542'),('20230622081401'),('20230622082357'),('20230626073742'),('20230626073802'),('20230626075747'),('20230626081629'),('20230627124157'),('20230627132733'),('20230627133733'),('20230628003745'),('20230628010349'),('20230628010704'),('20230628095426'),('20230628110034'),('20230628110046'),('20230628111325'),('20230628111330'),('20230628111902'),('20230628120608'),('20230628120828');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_amenities`
--

DROP TABLE IF EXISTS `studio_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studio_id` int DEFAULT NULL,
  `amenity_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `amenity_id` (`amenity_id`),
  KEY `studio_id` (`studio_id`),
  CONSTRAINT `studio_amenities_ibfk_1` FOREIGN KEY (`amenity_id`) REFERENCES `amenities_options` (`id`),
  CONSTRAINT `studio_amenities_ibfk_2` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_amenities`
--

LOCK TABLES `studio_amenities` WRITE;
/*!40000 ALTER TABLE `studio_amenities` DISABLE KEYS */;
INSERT INTO `studio_amenities` VALUES (1,9,1),(2,9,2),(3,9,3);
/*!40000 ALTER TABLE `studio_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_category`
--

DROP TABLE IF EXISTS `studio_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(500) DEFAULT NULL,
  `icon_img` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_category`
--

LOCK TABLES `studio_category` WRITE;
/*!40000 ALTER TABLE `studio_category` DISABLE KEYS */;
INSERT INTO `studio_category` VALUES (1,'촬영스튜디오','faCameraRetro'),(2,'파티룸','faCakeCandles'),(3,'스터디룸','faBook'),(4,'카페','faMugSaucer'),(5,'스몰웨딩','faChampagneGlasses'),(6,'공유주방','faCookieBite'),(7,'공유오피스','faBuilding'),(8,'보컬연습실','faMicrophoneLines');
/*!40000 ALTER TABLE `studio_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_images`
--

DROP TABLE IF EXISTS `studio_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studio_id` int NOT NULL,
  `image` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `studio_id` (`studio_id`),
  CONSTRAINT `studio_images_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_images`
--

LOCK TABLES `studio_images` WRITE;
/*!40000 ALTER TABLE `studio_images` DISABLE KEYS */;
INSERT INTO `studio_images` VALUES (1,1,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/cafe1-1.jpeg'),(2,2,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/cafe2-1.jpeg'),(3,2,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/cafe2-2.jpeg'),(4,3,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/cafe3-1.jpeg'),(5,3,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/cafe3-2.jpeg'),(6,4,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/cafe4.jpeg'),(7,5,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/kitchen1-1.jpeg'),(8,6,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/kitchen2-1.jpeg'),(9,6,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/kitchen2-2.jpeg'),(10,7,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/kitchen3-1.jpeg'),(11,7,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/kitchen3-1.jpeg'),(12,8,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/partyroom1-1.jpeg'),(13,8,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/partyroom1-2.jpeg'),(14,8,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/partyroom1-3.jpeg'),(15,9,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom1-1.jpeg'),(16,9,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom1-2.jpeg'),(17,10,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom2-1.jpeg'),(18,10,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom2-2.jpeg'),(19,11,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom3-1.jpeg'),(20,11,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom3-2.jpeg'),(21,12,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom4.jpeg'),(22,13,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom5-1.jpeg'),(23,13,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom5-2.jpeg'),(24,13,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom5-3.jpeg'),(25,14,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/photoroom6.jpeg'),(26,15,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/sharedoffice1-1.jpeg'),(27,15,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/sharedoffice1-2.jpeg'),(28,16,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/sharedoffice2-1.jpeg'),(29,16,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/sharedoffice2-2.jpeg'),(30,17,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/studyroom1-1.jpeg'),(31,17,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/studyroom1-2.jpeg'),(32,18,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/studyroom2-1.jpeg'),(33,18,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/studyroom2-2.jpeg'),(34,19,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/wedding1-1.jpeg'),(35,19,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/wedding1-2.jpeg'),(36,20,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/wedding2-1.jpeg'),(37,20,'https://raw.githubusercontent.com/kayllason/photos/8adee6f0d68a39e054f0bfbcbbc8ad4d7b4678c6/wedding2-2.jpeg'),(38,21,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/2.%ED%8C%8C%ED%8B%B0%EB%A3%B8/adi-goldstein-Hli3R6LKibo-unsplash.jpg'),(39,22,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/2.%ED%8C%8C%ED%8B%B0%EB%A3%B8/amy-shamblen-X3ijISYzlM4-unsplash.jpg'),(40,23,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/2.%ED%8C%8C%ED%8B%B0%EB%A3%B8/kelsey-chance-tAH2cA_BL5g-unsplash.jpg'),(41,24,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/2.%ED%8C%8C%ED%8B%B0%EB%A3%B8/lidya-nada-MD_ha01Bk7c-unsplash.jpg'),(42,25,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/2.%ED%8C%8C%ED%8B%B0%EB%A3%B8/samantha-gades-fIHozNWfcvs-unsplash.jpg'),(43,26,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/alexandru-acea-Zg9R__O-8fM-unsplash.jpg'),(44,27,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/freddie-marriage-vSchPA-YA_A-unsplash.jpg'),(45,28,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/gabriel-beaudry-WuQME0I_oZA-unsplash.jpg'),(46,29,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/ivo-rainha-0rzUepBXHN0-unsplash.jpg'),(47,30,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/john-mark-arnold-ti4kGLkGgmU-unsplash.jpg'),(48,31,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/julien-paoletti-InbrvPARzM4-unsplash.jpg'),(49,32,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/kari-shea-tOVmshavtoo-unsplash.jpg'),(50,32,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/michael-soledad-B4GwdlgTh5Y-unsplash.jpg'),(51,33,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/priscilla-du-preez-hSY-SQ-rT9I-unsplash.jpg'),(52,33,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/samantha-gades-BlIhVfXbi9s-unsplash.jpg'),(53,34,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/slava-keyzman-ZG4Y6lLPARw-unsplash.jpg'),(54,34,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/3.%EC%8A%A4%ED%84%B0%EB%94%94%EB%A3%B8/slava-keyzman-qr4d407hSjo-unsplash.jpg'),(55,35,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/andriyko-podilnyk-bdmdX_XMcV4-unsplash.jpg'),(56,35,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/breakslow-UMUCQcDdLws-unsplash.jpg'),(57,36,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/briana-tozour-V_Nkf1E-vYA-unsplash.jpg'),(58,36,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/cagan-sevencan-ekDdIRQbrwE-unsplash.jpg'),(59,37,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/ceyda-ciftci--ylyzFOEBS0-unsplash.jpg'),(60,37,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/firza-pratama-1BEAIg-79H0-unsplash.jpg'),(61,38,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/jazmin-quaynor-9Y8vxVQN4o4-unsplash.jpg'),(62,38,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/kaylah-matthews-6e5hgWV2DAo-unsplash.jpg'),(63,39,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/kristaps-grundsteins-tQMXs0ee8B0-unsplash.jpg'),(64,39,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/4.%EC%B9%B4%ED%8E%98/louis-hansel-R9c1IyG8tjM-unsplash.jpg'),(65,40,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/evelina-friman-hw_sKmjb0ns-unsplash.jpg'),(66,40,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/cody-chan-7jgtAhJkjwk-unsplash.jpg'),(67,41,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/elvis-bekmanis-WJc87MVcDaA-unsplash.jpg'),(68,41,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/evelina-friman-hw_sKmjb0ns-unsplash.jpg'),(69,42,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/jeremy-wong-weddings-K41SGnGKxVk-unsplash.jpg'),(70,42,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/jeremy-wong-weddings-K8KiCHh4WU4-unsplash.jpg'),(71,43,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/thomas-william-nAvodiKjbTM-unsplash.jpg'),(72,43,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/olivia-bauso-30UOqDM5QW0-unsplash.jpg'),(73,44,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/vitor-monthay-JL2n-GWXCJo-unsplash.jpg'),(74,44,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/5.%EC%8A%A4%EB%AA%B0%EC%9B%A8%EB%94%A9/marc-babin-aQWmCH_b3MU-unsplash.jpg'),(75,45,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/becca-tapert-uGak0qtrphM-unsplash.jpg'),(76,45,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/good-soul-shop-DlO0yz4U67A-unsplash.jpg'),(77,46,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/cat-han-VgyN_CWXQVM-unsplash.jpg'),(78,46,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/kam-idris-Ot2iTXgC6fY-unsplash.jpg'),(79,47,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/christian-mackie-cc0Gg3BegjE-unsplash.jpg'),(80,47,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/marcin-galusz-Xq0lte4P7rQ-unsplash.jpg'),(81,48,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/christian-mackie-euBmypOZUZA-unsplash.jpg'),(82,48,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/naomi-hebert-MP0bgaS_d1c-unsplash.jpg'),(83,49,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/collov-home-design-zsIx8uc-EcA-unsplash.jpg'),(84,49,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/6.%EA%B3%B5%EC%9C%A0%EC%A3%BC%EB%B0%A9/r-architecture-M66lRZPX-hU-unsplash.jpg'),(85,50,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/adolfo-felix-PG8NyM_Mcts-unsplash.jpg'),(86,50,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/alesia-kazantceva-VWcPlbHglYc-unsplash.jpg'),(87,51,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/christian-mackie-lDlU1zbjGQA-unsplash.jpg'),(88,51,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/damir-kopezhanov-luseu9GtYzM-unsplash.jpg'),(89,52,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/israel-andrade-YI_9SivVt_s-unsplash.jpg'),(90,52,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/jose-losada-DyFjxmHt3Es-unsplash.jpg'),(91,53,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/kate-sade-2zZp12ChxhU-unsplash.jpg'),(92,53,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/nastuh-abootalebi-eHD8Y1Znfpk-unsplash.jpg'),(93,54,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/mikhail-derecha-q-XTB-YTsho-unsplash.jpg'),(94,54,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/7.%EA%B3%B5%EC%9C%A0%EC%98%A4%ED%94%BC%EC%8A%A4/yibei-geng--UdYbiywGeg-unsplash.jpg'),(95,55,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/abstral-official-fJ5bzeEnH0w-unsplash.jpg'),(96,55,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/abstral-official-bdlMO9z5yco-unsplash.jpg'),(97,56,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/austin-neill-gmuAWJGNHcY-unsplash.jpg'),(98,56,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/gaspi-the-artist-w0IzSwffjbA-unsplash.jpg'),(99,57,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/gaspi-the-artist-w0IzSwffjbA-unsplash.jpg'),(100,57,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/leo-wieling-bG8U3kaZltE-unsplash.jpg'),(101,58,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/sourabh-belekar-2mXYRxhszAk-unsplash.jpg'),(102,58,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/steve-harvey-KndznxUBmOo-unsplash.jpg'),(103,59,'https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/8.%EB%B3%B4%EC%BB%AC%EC%97%B0%EC%8A%B5%EC%8B%A4/will-francis-ZDNyhmgkZlQ-unsplash.jpg'),(104,60,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ce0a31ea-5b46-4827-a164-99eed6eed9c4'),(105,60,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ebe894c5-54d2-407f-ab19-7fed75b80d19'),(106,61,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/7a74a5f3-0dc8-476b-a943-1feff412fcb0'),(107,61,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/6d16040c-fdaa-44ba-a61b-0c5d6ac473a7'),(108,62,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d85d39b2-e377-4a99-bcc8-a7dd5b384947'),(109,62,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/8dfd90da-a594-41ef-87ac-62b944a22b14'),(110,63,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/bb87b83e-d1a7-4337-a963-4f903db44492'),(111,63,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/f0929c27-719b-490f-a50c-129619669a40'),(112,64,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/402655c0-128a-42e6-b0fc-bc50fa7e5510'),(113,64,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/73738bdf-32ee-40c9-899c-d298a9c6fd6b'),(114,65,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/04f750be-b11a-4a2b-b4a6-028977338ae3'),(115,65,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/aab2bbf7-1506-4389-9030-e8019fa2a3a4'),(116,66,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/13c706c0-194f-47c2-afc4-f193b1d246f4'),(117,67,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/e2f6f422-15c6-4bdd-9138-c0646adfe284'),(118,67,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/34bee502-05a3-4628-9464-bf28cb72ef60'),(119,68,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/89c17427-5b65-47a5-a91e-56f6d0dd312c'),(120,68,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/c751fc3f-43f8-4055-83eb-071071e04fec'),(121,69,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/dc216529-3f2e-4953-a063-dc08dc84cf93'),(122,69,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ac531c3a-a71d-4ba4-9528-900d7de1a21d'),(123,70,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/8844abfb-bd32-4c58-938e-caeefa9f26ca'),(124,70,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/8dd2fbe4-7873-4740-9b07-3f8b4f29c99a'),(125,71,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/12976216-6792-4936-82a6-74714be734c6'),(126,71,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/f64e51ea-1d70-480d-872a-184c0e47cd97'),(127,72,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/0867d947-e181-4ff5-b248-7aa879b093ad'),(128,72,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/00a62b24-f361-4941-8361-84b8fa0e98ba'),(129,73,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/0f3299ad-1873-4da1-a687-bde1602f5a2d'),(130,73,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/f9e7a2cf-9522-4b0b-b62a-1d18c3052b33'),(131,74,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d476c4b7-63eb-49a6-94db-36f166c4859c'),(132,74,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ed29ea87-602d-462e-939d-80dd19410c7f'),(133,75,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/c208c902-8a3b-4e8d-b1ba-64be5b5e3d94'),(134,75,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/a2a6e00f-1138-41e0-8440-9dcb5feb3571'),(135,76,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/22f8a89a-0de4-4ab8-9384-0287c264f13a'),(136,76,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/757768bb-c14e-44e5-b61f-0196d2c65f97'),(137,77,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d532037d-52d5-4ffd-ae0e-1e32ccc41e84'),(138,77,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d2f4f36a-1fd8-4f7c-89a5-c8672200daa6'),(139,78,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/bf9011c6-e069-415b-9e3b-17d8a7c4bc0c'),(140,78,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ca6c1620-26fd-4238-81a1-54b53111af2f'),(141,79,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/779a45e0-2710-4d44-bf44-b822280b26f8'),(142,79,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/449668a0-cc71-495c-80d6-90427790179b'),(143,80,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/c998e115-c594-47a3-9b19-b594b9101abc'),(144,80,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ba8c377b-9f67-49a9-8e54-1011e1be66b4'),(145,81,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/3d1c459c-bf74-4cb4-87cf-d17c673eaade'),(146,81,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/6280a574-a7c8-4f6c-9ef6-31efc834d469'),(147,82,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/c65d58c7-c3bf-49ae-a769-815091815fde'),(148,82,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/6ad0d38f-d101-4f03-b131-5824cd04caf6'),(149,83,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/da29c5fe-68ea-4257-b451-3e5ba0b14553'),(150,83,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/8570a451-9c08-4bca-9f89-e1820b0980b4'),(151,84,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d7753702-5741-4c88-8d17-6990b78b6014'),(152,84,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ced56e18-cb3d-45b9-8ff1-018c8473c66d'),(153,85,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/199dc65c-8e06-471c-b549-31e902a23861'),(154,85,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/2766216a-b113-4a1b-a41a-599f05f1e4af'),(155,86,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/3755c437-cdff-4978-af5d-c9b7eb6da103'),(156,86,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/bc91841f-dc33-432d-b936-921c39807ce6'),(157,87,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/a81be652-bd83-4951-932a-5ec201bfed41'),(158,87,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/631017c9-f88e-47bc-aaa4-ba9f72924fe5'),(159,88,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/7f80af5a-0fa6-4a09-849b-03f023c98351'),(160,88,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/92f6ef1f-9236-437d-9899-3737312dfc7a'),(161,89,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/ae6cc83a-5d6d-4dc1-a117-5d81c705ce18'),(162,89,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/7537cdf7-3db2-4027-80b9-76fce3cc087e'),(163,90,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d9fe3137-bcf5-4bd8-baf2-a19667c4e2cc'),(164,90,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/f1de61d5-98c4-475d-a31f-b6bf577340fb'),(165,91,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d65aff56-df43-467b-a263-084b60db8cf2'),(166,91,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/825fc129-3bf3-4e9c-9252-9a84d2a055a0'),(167,92,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/e17943c5-e9c7-4134-a2f0-1e720fb4b275'),(168,92,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/b635c2f2-cf9d-42d0-832d-838bfeb7e4a6'),(169,93,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/7e7cf21c-ac62-4ec7-9868-2366d6ebeb18'),(170,93,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/5c432e38-0130-400d-aac1-bc94ccd5fccb'),(171,94,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/6f36945e-61e5-4b0c-ab73-1785e121218b'),(172,94,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/68ff1737-75f2-46b9-8977-210898b560b0'),(173,95,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/e87099af-8d20-4cf1-8b21-0bcbda3ebe08'),(174,95,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/39af92d8-9e83-4576-810b-5fb7cf88c024'),(175,96,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/6059fcea-7502-4c6a-9ba6-12d2c4c517cc'),(176,96,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/518b3d29-f6fb-4cb8-8737-bbf5db260957'),(177,97,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/93360e2d-4829-4b8b-8201-b914b633ce4f'),(178,97,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/2d58ba09-cad4-4648-a2b3-785a4c0da2b9'),(179,98,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/a549b07a-c331-4fe1-83fb-c8d3042798f0'),(180,98,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/4cc0ac0b-33e1-4d4b-b863-6a37a5bb3465'),(181,99,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/07320156-a356-4189-94e9-5ccea7c1a16a'),(182,99,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/3186f7d1-f9dd-4952-ae8e-4de47b273139'),(183,100,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/d2faf271-0eba-44d8-8d98-ac3859483e43'),(184,100,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/56dbfd8c-6b06-4c25-a1a9-db1f2946ba04'),(185,101,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/3a2374e8-4587-4fd9-bf7e-97af34ed7d45'),(186,102,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/30d940af-3d66-4cd8-af18-7596f9bbf33f'),(187,103,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/18ab541b-ac62-4fd7-b583-54c96c08621a'),(188,104,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/70cafb28-ef77-4026-bbfd-decfa902741a'),(189,105,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/bd6b16c3-4144-4e6d-8b08-433ac6928cb4'),(190,106,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/18ff7c25-28e9-4e2c-9516-57e24b0bae60'),(191,107,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/e25bc7a7-5ddc-40a4-8fe9-da0a2a1c89a7'),(192,108,'https://github.com/wecode-bootcamp-korea/46-2nd-B1A4-frontend/assets/123567359/793b5470-cc65-41af-b42b-c61b7f302e79'),(200,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-9578197f-fd7e-4778-8182-d2c75a53a772'),(201,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-0c611094-d048-4f5f-8c5d-afe93c0ce77b'),(202,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-e7fa13ac-8dc3-4e9c-ba24-e353a005fde2'),(203,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-2fab2d98-10f8-4161-a929-b45ad2b4410e'),(204,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-a74b7da8-0bf9-4ef0-95ed-a80154e47ac2'),(205,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-859bf254-8434-442f-b265-47d3f308d1db'),(206,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-26401770-6743-45ad-ac1e-9588ac6dbb9c'),(207,115,'https://space-around.s3.ap-northeast-2.amazonaws.com/studioImageCollection/studio-044ab228-1f19-4bad-ac05-b176a547a707');
/*!40000 ALTER TABLE `studio_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_types`
--

DROP TABLE IF EXISTS `studio_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studio_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_types`
--

LOCK TABLES `studio_types` WRITE;
/*!40000 ALTER TABLE `studio_types` DISABLE KEYS */;
INSERT INTO `studio_types` VALUES (1,'집 전체'),(2,'대인실'),(3,'방');
/*!40000 ALTER TABLE `studio_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studios`
--

DROP TABLE IF EXISTS `studios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(500) NOT NULL,
  `studio_type_id` int NOT NULL,
  `studio_category_id` int NOT NULL,
  `description` text NOT NULL,
  `address` varchar(500) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rules` text NOT NULL,
  `max_guests` int NOT NULL,
  `location_latitude` decimal(10,8) NOT NULL,
  `location_longitude` decimal(11,8) NOT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_neighborhood` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studio_type_id` (`studio_type_id`),
  KEY `studio_category_id` (`studio_category_id`),
  CONSTRAINT `studios_ibfk_2` FOREIGN KEY (`studio_type_id`) REFERENCES `studio_types` (`id`),
  CONSTRAINT `studios_ibfk_4` FOREIGN KEY (`studio_category_id`) REFERENCES `studio_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studios`
--

LOCK TABLES `studios` WRITE;
/*!40000 ALTER TABLE `studios` DISABLE KEYS */;
INSERT INTO `studios` VALUES (1,'라이트업스페이스',1,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 용산구 이태원로54길 68-6 2층',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.53538330,127.00077200,'서울','한남동'),(2,'하우짓',2,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 수원시 팔달구 고화로 136 1층',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.28138710,127.00675000,'경기','화서동'),(3,'거인의 정원',3,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 대원길 58',30000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.47179110,126.53539000,'제주','아라일동'),(4,'공간투비광안리',1,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 수영구 광안해변로294번길 24 지하1층',18000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.15536680,129.12598500,'부산','민락동'),(5,'더테이블',2,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 유성구 봉명로 27-11 더린빌딩 4층 401호',20000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.34253310,127.34290000,'대전','원신흥동'),(6,'역곡주방',3,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 부천시 지봉로 79 1층',12000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.48742730,126.80815700,'경기','역곡동'),(7,'계단밑테이블',1,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 성남시 분당구 동판교로52번길 25-15 지하 1층',33000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.38519510,127.11382500,'경기','백현동'),(8,'그로어스',2,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 서대문구 연희로27길 52 1,2층',100000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.57225930,126.93332800,'서울','연희동'),(9,'스튜디오 베리언트',3,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 양천구 목동중앙북로14길 24 1층',12000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.54519760,126.87318700,'서울','목동'),(10,'스튜디오MYW',1,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 서대문구 응암로 102-5 지하1층',9000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.58162530,126.91315600,'서울','북가좌동'),(11,'타샤의정원',2,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 수덕5길 85',40000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.48209970,126.47121000,'제주','오라2동'),(12,'스튜디오베이지',3,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 유성구 농대로 27',33000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.36299700,127.35282800,'대전','궁동'),(13,'티즈스튜디오',1,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 중구 대전천서로 475',40000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.33060120,127.42725900,'대전','은행동'),(14,'이엘스튜디오',2,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 해운대구 해운대로767번길 14-25',35000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.16917030,129.17333600,'부산','중동'),(15,'KOTE Lab',3,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 종로구 인사동길 7 KOTE 2층',12000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.57155730,126.98689300,'서울','인사동'),(16,'리걸스페이스',1,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 서초구 서초대로 356 지웰타워 6층 606호',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.49544050,127.02035800,'서울','서초동'),(17,'모락',2,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 관악구 관천로11길 1 대성빌딩 301호',2000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.48455100,126.92464500,'서울','신림동'),(18,'별의순간',3,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 마포구 양화로 133',1500.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.55534900,126.92094000,'서울','서교동'),(19,'오무아무아',1,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 서귀포시 속골로 17',90000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.24183470,126.52790200,'제주','호근동'),(20,'아트케이홀',2,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 동래구 차밭골로50번길 22',100000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.21812290,129.07765700,'부산','온천동'),(21,'강남 선릉 파티룸 [루베르]',3,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 강남구 대치동 897-32 지하1층',30000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.50291910,127.05053300,'서울','대치동'),(22,'수원파티룸 별빛 노래방,바베큐',1,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 수원시 팔달구 권광로175번길 103 3층 301호',20000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.26461630,127.02662400,'경기도(수원)','인계동'),(23,'대전 파티룸 오늘',2,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 유성구 궁동 471-12 B동 301호',35000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.35997380,127.34184000,'대전','궁동'),(24,'부산파티룸 벨라 노래방,포토존',3,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 부산진구 부전동 490-16 4층',50000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.15702570,129.05754700,'부산','부전동'),(25,'서귀동 파티',1,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 서귀포시 서귀동 370-3 2층 서귀동파티',10000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.24757510,126.56402100,'제주도','서귀동'),(26,'하비스트강남1호점 스터디룸 회의실',2,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 서초구 강남대로65길 12 한서그린빌리지 307호',1000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.50048530,127.02478100,'서울','서초동'),(27,'이룸 스터디룸 회의실 잠실',3,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 송파구 올림픽로 336 대우유토피아오피스텔',2500.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.51531570,127.10724400,'서울','방이동'),(28,'라온2 [합정역 10초] 즉시할인',1,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 마포구 양화로 59 화승리버스텔 4층 402호',1000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.55062350,126.91485600,'서울','서교동'),(29,'모임공간 모락 안산점',2,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 안산시 단원구 예술대학로 17 중앙노블레스 6층 611호',1000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.31864720,126.83650100,'경기도(안산)','고잔동'),(30,'분당 일루 1호점-[스터디룸]',3,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 성남시 분당구 장미로 78 1307호(야탑동, 시그마3)',1900.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.31864720,126.83650100,'경기도 (분당)','야탑동'),(31,'두드림스터디카페 서현 (스터디룸)',1,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 성남시 분당구 황새울로312번길 20 태성빌딩 4층 403호 스터디카페두드림',2500.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.38303360,127.12203000,'경기도','서현동'),(32,'대전둔산동 모임공간 윙스터디',2,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 서구 둔산로31번길 28 금정빌딩 8층 윙스터디',3000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.35295370,127.37789400,'대전','둔산동'),(33,'폴리워크 행사 회의실 스터디모임',3,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 부산지구 양지로5번길 8 2층',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.17001640,129.06994700,'부산','양정동'),(34,'제주복합마음공간, 미유크',1,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 노형9길 9-3 2층',12000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.48355060,126.47742000,'제주도','노형동'),(35,'합정 파티룸, 스튜디오, 카페공간',2,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 마포구 토정로4길 25 지층',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.54450570,126.91480700,'서울','합정동'),(36,'광교 록시드 [카페 통대관]',3,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 수원시 영통구 광교중앙로 140 수원컨벤션센터 2층 카페록시드갸토',20000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.28578800,127.05950300,'경기도','하동'),(37,'대전 카페 영화로운',1,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 유성구 궁동로2번길 9-10 카페 영화로운 (1층)',37000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.36198340,127.34811000,'대전','궁동'),(38,'포에트리 인 모션 카페 단독 대관',2,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 남구 대연동 58-6 대정빌딩 2층',11000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.13614890,129.10149400,'부산','대연동'),(39,'스테이위드커피',3,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 해안마을5길 29 스테이위드커피',69000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.45823980,126.45578000,'제주도','해안동'),(40,'[스몰웨딩]연희정원',1,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 서대문구 연희로 11라길 10-8 2층 연희정원',100000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.56847340,126.93034300,'서울','연희동'),(41,'스몰웨딩야외결혼식 공연장',2,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 화성시 장안면 미산길 15',30000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.03073770,126.85226400,'경기도','장안리'),(42,'소프라임 (옐로우라이트) 파티룸',3,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 중구 대흥동 521-13 2층',60000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.32414850,127.41967300,'대전','대흥동'),(43,'오마이프랜드',1,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 수영구 민락동 110-41',20000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.15540870,129.13078100,'부산','민락동'),(44,'스튜디오 피크',2,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 조천읍 조함해안로 586 4층 401호',35000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.54399310,126.67424100,'제주도','함덕리'),(45,'유니하니2호 베이킹 쿠킹 공유주방',3,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 구로구 가마산로26길 19 1층 유니하니',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.49542690,126.89136500,'서울','구로동'),(46,'에르메 베이킹 쿠킹 감성 공유주방',1,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 김포시 김포한강1로 240 라비드퐁네프 블루동 203호',13000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.65281510,126.68424500,'경기도','운양동'),(47,'테이블앤키친',2,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 유성구 상대동로 52 103호 테이블앤키친',11000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.34764440,127.33915700,'대전','상대동'),(48,'공유주방 서동부엌',3,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 금정구 서동로 91번길 7 1층',17000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.21715600,129.09715600,'부산','서동'),(49,'제주 하늘길점',1,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 남성로 127 4층',11000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.50915310,126.51896000,'제주도','삼도일동'),(50,'공유오피스 트그 3인',2,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 관악구 남부순환로 1921-1 ',83600.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.47765000,126.96294400,'서울','봉천동'),(51,'워크샵공유오피스',3,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 화성시 메타폴리스로 42 9층',22000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.20169630,127.07179500,'경기도','반송동'),(52,'스파크플로우',1,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 중구 대전천서로 457 세븐팩토리빌딩 ',35000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.32942380,127.42890100,'대전','은행동'),(53,'폴리워크 행사 회의실',2,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 부산진구 양지로5번길 8 2층',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.17001640,129.06994700,'부산','양정동'),(54,'맨써스페이스플러스',3,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 신대로 145 맨써빌딩',77000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.48430720,126.49678200,'제주도','연동'),(55,'홍대kmc',1,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 마포구 동교동 201-35',5000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.55679090,126.92153800,'서울','동교동'),(56,'브리츠 댄스 연습실',2,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 의정부시 의정부동 581-3 지하1층',2000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.73325720,127.04577300,'경기도','의정부동'),(57,'라온음악, 무용연습실',3,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 유성구 봉산동 234-8',6000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.43462880,127.38832500,'대전','봉산동'),(58,'아츠세레나데',1,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 금정구 장전온천천로 51 테라스파크',9900.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.22960950,129.08883300,'부산','장전동'),(59,'모드보컬스튜디오',2,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 서사로 48',5000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.50832680,126.51978200,'제주도','삼도일동'),(60,'스튜디오 티움',1,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 성동구 마장동 527-6',33000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.56485870,127.03604000,'서울','마장동'),(61,'까네스튜디오',2,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 강남구 테헤란로 518',45000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.50744650,127.06061300,'서울','대치동'),(62,'빈티지플랜트',3,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 마포구 희우정로1길 7',40000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.54902330,126.90779700,'서울','합정동'),(63,'오즈스페이스',1,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 영등포구 63로 50',30000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.51981620,126.94005000,'서울','여의도동'),(64,'크로마키폰테',2,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 서초구 잠원로 117',38000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.51474130,127.00816900,'서울','잠원동'),(65,'블랑스튜디오',3,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 강남구 선릉로86길 5-4',51000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.50345990,127.05021700,'서울','대치동'),(66,'스튜디오 베리언트',1,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울특별시 서초구 방배동 795-5',63000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.49319790,126.98931700,'서울','방배동'),(67,'스튜디오 카이브',2,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 성남시 수정구 청계산로 589-1',22000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.43355710,127.08680200,'경기도','상적동'),(68,'자연광 스튜디오 테테',3,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 남양주시 별내동 2334',19000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.68321910,127.10167800,'경기도','별내동'),(69,'이에스스튜디오',1,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 유성구 죽동로279번길 71-10',15000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.37229870,127.33976500,'대전','죽동'),(70,'에어브릿지 호리존',2,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 유성구 반석동 659-1',21000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.38922630,127.31528400,'대전','반석동'),(71,'디자이너리스튜디오',3,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 동구 초량중로 11',25000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.11319190,129.03627700,'부산','초량동'),(72,'와이즈맨 스튜디오',1,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 중구 중구로40번길 15',29000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.10156170,129.02959500,'부산','신창동'),(73,'그리브 스튜디오',2,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 북성로 59',41000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.51539090,126.51866700,'제주도','삼도이동'),(74,'스튜디오 리안테',3,1,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 연동 291-10',48000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.49047360,126.49446500,'제주도','연동'),(75,'루진 파티룸',1,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 금정구 서동로91번길 7',22000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.21715600,129.09715600,'부산','서동'),(76,'뮤트스페이스',2,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 부산진구 서전로47번길 27',26000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.15913960,129.06465600,'부산','전포동'),(77,'플로앤뉴 파티룸',3,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 하남시 미사대로 456',31000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.56354400,127.19967100,'경기도','망월동'),(78,'필더그린스튜디오',1,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 수원시 팔달구 중동 147-1',19000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.27189830,127.01706600,'경기도','중동'),(79,'시네마파티룸',2,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 중구 대흥동 493-1',22000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.32723540,127.42343200,'대전','대흥동'),(80,'스튜디오 피크',3,2,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 조천읍 조함해안로 586',41000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.54399310,126.67424100,'제주도','삼도이동'),(81,'이룸 스터디룸',1,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 부천시 심곡동 385',29000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.48535120,126.78029200,'경기도','심곡동'),(82,'공간 고즈넉',2,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기 용인시 기흥구 구성로 357',42000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.29138800,127.14803600,'경기도','청덕동'),(83,'더나은 플레이스',3,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산 동래구 충렬대로 250',32000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.20110280,129.08642300,'부산','수안동'),(84,'아브니르 스터디카페',1,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 서구 대덕대로335번길 39',21000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.36276090,127.37709400,'대전','월평동'),(85,'타잔스토리',2,3,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 서귀포시 중정로 123',50000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.24880310,126.56969200,'제주도','서귀동'),(86,'시크릿베이스',3,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 대덕구 비래동 118-4',14000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.35854160,127.44832400,'대전','비래동'),(87,'오덕새',1,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전 유성구 신성동 162-10',38000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.38903580,127.34832000,'대전','신성동'),(88,'유마슈룸',2,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 동구 대영로243번길 56',23000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.11450560,129.03853600,'부산','초량동'),(89,'카페쉘터',3,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 용인시 기흥구 마북동 171-2번지',46000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.30258110,127.12204800,'경기도','마북동'),(90,'카페클라츠',1,4,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 서귀포시 특별자치도, 일주서로 879 ',54000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.25792550,126.41695700,'제주도','색달동'),(91,'해오름웨딩',2,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 유성구 지족동 612',14000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.38870390,127.30826000,'대전','지족동'),(92,'아뜰리에',3,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 서구 서대신동3가 694-1',19000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.11311650,29.01054600,'부산','서대신동'),(93,'어반가든',1,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 사하구 감천동 산99-57',12000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.09206570,129.01431700,'부산','감천동'),(94,'로즈앤라임',2,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 하남시 윗배알미길 223',26000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.51203240,127.27305400,'경기도','배알미동'),(95,'연희정원',3,5,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 서귀포시 대정읍 하모중앙로 22',53000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.22621770,126.25250900,'제주도','연동'),(96,'그린플레이스',1,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','가오동 387-14번지 1층 동구 대전광역시 ',24500.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.30682250,127.45099000,'대전','가오동'),(97,'페어리쿠키',2,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 암남동 622-57 KR 호텔쿼츠',43000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.06483350,129.01369200,'부산','암남동'),(98,'에르메 베이킹',3,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 하남시 상산곡동 391-2',34000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.47714550,127.23973500,'경기도','상산곡동'),(99,'봉주르키친',1,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 성남시 수정구 수정로 460-2',43400.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.46162530,127.15598700,'경기도','단대동'),(100,'역곡주방',2,6,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 제주시 특별자치도, 산천단동3길 26',53000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.45024000,126.55918800,'제주도','아라일동'),(101,'모아 공유오피스',3,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 유성구 봉명동 536-5',23500.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.35581610,127.34301400,'대전','봉명동'),(102,'로컬하이브',1,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 영도구 해양로195번길 180',51000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.08662800,129.07704700,'부산','동삼동'),(103,'코쿤피스',2,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 영도구 영선동4가 650-4',44000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.07813740,129.04479000,'부산','영선동'),(104,'패스트파이브',3,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','경기도 하남시 초광로 187 ',53400.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,37.53676800,127.17591900,'경기도','초이동'),(105,'지구어 오피스',1,7,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','제주특별자치도 서귀포시 1100로 453-95',22000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,33.28578910,126.44528400,'제주도','회수동'),(106,'아트웨이브',2,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','반석동 652-9번지 유성구 대전광역시',52000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.39020190,127.31440800,'대전','반석동'),(107,'에이플연습실',3,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','대전광역시 유성구 관평동 887',34000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,36.42691920,127.38698200,'대전','관평동'),(108,'로제이연습실',1,8,'사전에 캘린더 일정 확인 후 예약부탁드립니다.','부산광역시 남구 백운포로 14',54000.00,'간단한 음료 외 음식물 반입은 불가합니다.',30,35.10676900,129.11148700,'부산','용호동'),(115,'B1A4스튜디오',1,3,'- 촬영장비나 조명이 구비되어 있지 않습니다. 촬영 목적에 맞는 장비를 지참해주세요.\n    - 사전에 캘린더 일정 확인 후 예약부탁드립니다.','서울 강남구 테헤란로 427 (삼성동, 위워크타워)삼성동',14000.00,'- 간단한 음료 외 음식물 반입은 불가합니다.\n    - 각 룸간의 방음이 완벽하지 않아, 영상촬영의 경우 전체대관으로 예약 부탁드립니다.',10,37.50637024,127.05364171,'서울','삼성동');
/*!40000 ALTER TABLE `studios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `id` int NOT NULL,
  `time` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES (0,'00:00:00-01:00:00'),(1,'01:00:00-02:00:00'),(2,'02:00:00-03:00:00'),(3,'03:00:00-04:00:00'),(4,'04:00:00 - 05:00:00'),(5,'05:00:00 - 06:00:00'),(6,'06:00:00 - 07:00:00'),(7,'07:00:00 - 08:00:00'),(8,'08:00:00 - 09:00:00'),(9,'09:00:00 - 10:00:00'),(10,'10:00:00 - 11:00:00'),(11,'11:00:00 - 12:00:00'),(12,'12:00:00 - 13:00:00'),(13,'13:00:00 - 14:00:00'),(14,'14:00:00 - 15:00:00'),(15,'15:00:00 - 16:00:00'),(16,'16:00:00 - 17:00:00'),(17,'17:00:00 - 18:00:00'),(18,'18:00:00 - 19:00:00'),(19,'19:00:00 - 20:00:00'),(20,'20:00:00 - 21:00:00'),(21,'21:00:00 - 22:00:00'),(22,'22:00:00 - 23:00:00'),(23,'23:00:00 - 24:00:00');
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kakao_id` bigint DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `profile_image` varchar(1000) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Eun U Lee','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/andriyko-podilnyk-bdmdX_XMcV4-un.jpg','abc@b1a4.com','eY)Uz6peu$','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(2,NULL,'Seong Min Choe','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/jeison-higuita-w60yHJi67Lo-unsplash.jpg','abc1@b1a4.com','TCeAT(CPY#','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(3,NULL,'Su Hyeon Jung','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/jeremy-bishop-DDwvESmjJFo-unsplash.jpg','abc2@b1a4.com','CNP)UvXfVn','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(4,NULL,'Yong Kang','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/junior-reis-1dfdUeBgQRE-unsplash.jpg','abc3@b1a4.com','r%ghz63hEW','',NULL,'2023-06-29 05:27:49',NULL),(5,NULL,'Hyun Mun','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/kristyna-squared-one-stKj5r2k6ac-unsplash.jpg','abc4@b1a4.com','4rAWa+6!Ms','',NULL,'2023-06-29 05:27:49',NULL),(6,NULL,'Soo Jin Im','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/leticia-pelissari-zNaB7euwErs-unsplash.jpg','abc5@b1a4.com','en(Bb936@v','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(7,NULL,'Eun Woo Cho','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/lukas-hellebrand-E8ohu6S3uis-unsplash.jpg','abc6@b1a4.com','JC3zFy^qRF','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(8,NULL,'Sung Hyun O','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/mailchimp-4ct0iDMOjuc-unsplash.jpg','abc7@b1a4.com','gEXP)nCxeA','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(9,NULL,'Jung Jung','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/megan-ruth-aVFnycBs-yo-unsplash.jpg','abc8@b1a4.com','vV2$6sZyLx','',NULL,'2023-06-29 05:27:49',NULL),(10,NULL,'Eun Han','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/mimi-di-cianni-ECSLvV1FfWM-unsplash.jpg','abc9@b1a4.com','T6hk($@WB8','',NULL,'2023-06-29 05:27:49',NULL),(11,NULL,'Yong Lee','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/parker-coffman-BKI9OSW5qrQ-unsplash.jpg','abc10@b1a4.com','9Nf8B@AX9(','',NULL,'2023-06-29 05:27:49',NULL),(12,NULL,'Eun Woo Choe','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/podpros-7sz_0ZVGHfA-unsplash.jpg','abc12@b1a4.com','7LLgCq2VQr','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(13,NULL,'Hyeon Ju Kim','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/priscilla-du-preez-DZk3WxO-swU-unsplash.jpg','abc13@b1a4.com','zYcdGmtU+L','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(14,NULL,'Hyeon Jeong Kang','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/ravi-sharma-O-mhRmNcfZw-unsplash.jpg','abc14@b1a4.com','IT*e@L*BPq','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(15,NULL,'Sung Min Kim','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/ravi-sharma-iwsIYP0miAs-unsplash.jpg','abc15@b1a4.com','@HY7UN4DT6','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(16,NULL,'Min Jun Gang','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/susan-g-komen-3-day-6RlHij-pwpw-unsplash.jpg','abc16@b1a4.com','e3(H%C%EEj','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(17,NULL,'Seong Hyeon Choe','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/tommao-wang-eqIVuqv6EFc-unsplash.jpg','abc17@b1a4.com','hs&kwfepSa','',NULL,'2023-06-29 05:27:49','2023-06-29 05:47:22'),(18,NULL,'Jung Cho','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/toni-frost-IgeWUwNCF9Y-unsplash.jpg','abc18@b1a4.com','^65h!BTI@h','',NULL,'2023-06-29 05:27:49',NULL),(19,NULL,'Jong Oh','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/toni-frost-xHI1NVjaOZE-unsplash.jpg','abc19@b1a4.com','Lcu3z&84&D','',NULL,'2023-06-29 05:27:49',NULL),(20,NULL,'Sang Moon','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/vincent-chen-xLz2hg8TaT0-unsplash.jpg','abc20@b1a4.com','tvH2W+&rDv','',NULL,'2023-06-29 05:27:49',NULL),(21,NULL,'Iseul Moon','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/yevhenii-dubrovskyi-tJ9Go2fumTw-unsplash.jpg','abc21@b1a4.com','g9AcTMpXth','',NULL,'2023-06-29 05:27:49',NULL),(22,NULL,'Ji-Yeong Gim','https://raw.githubusercontent.com/shfkd123/spaceAroundImg/main/userImg/zhenyu-luo-r4xV8ih1k2g-unsplash.jpg','abc22@b1a4.com',')CEdbW%+&W','',NULL,'2023-06-29 05:27:49',NULL),(24,2873465607,'이재웅','NULL','NULL',NULL,NULL,NULL,'2023-06-29 08:22:26',NULL),(28,2851150755,'자현 Kaylla','http://k.kakaocdn.net/dn/qrdpi/btrjQJ6JmNm/0Q6HqXDzPLkk4x15BLT5j0/img_640x640.jpg','kayllabbh@gmail.com',NULL,'01012342342',NULL,'2023-06-29 12:12:43','2023-06-29 12:28:54');
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

-- Dump completed on 2023-07-04 14:43:55
