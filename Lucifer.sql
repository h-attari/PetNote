-- MySQL dump 10.13  Distrib 8.3.0, for Linux (aarch64)
--
-- Host: localhost    Database: Lucifer
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `user` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` int DEFAULT NULL,
  `flag` int DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  KEY `country` (`country`),
  CONSTRAINT `Admin_ibfk_1` FOREIGN KEY (`country`) REFERENCES `Country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,'admin','demo','admin','admin_pass','987654321','admin@demo.com',111,0);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `animal_name` varchar(100) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `species` int DEFAULT NULL,
  `native` int DEFAULT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `lifespan` varchar(20) NOT NULL,
  `height` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `image` varchar(300) NOT NULL,
  `descr` varchar(300) NOT NULL,
  `availability` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`animal_id`),
  KEY `species` (`species`),
  KEY `native` (`native`),
  KEY `type` (`type`),
  CONSTRAINT `Animal_ibfk_4` FOREIGN KEY (`species`) REFERENCES `Species` (`species_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Animal_ibfk_5` FOREIGN KEY (`type`) REFERENCES `Type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Animal_ibfk_6` FOREIGN KEY (`native`) REFERENCES `Country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES (1,'Affenpinscher',1,1,243,60,1,'12-14 years','9-11 inches','7-9 pounds','images/Dogs/Affenpinscher.jpg','static/descr/Dogs/Affenpinscher.txt',1),(2,'Akita',2,1,121,65,2,'10-12 years','2ft-2.4ft','70-130 pounds','images/Dogs/Akita.jpg','static/descr/Dogs/Akita.txt',1),(3,'Boxer',2,1,90,45,0,'10-12 years','1ft.9in.-2ft.1in.','60-70 pounds','images/Dogs/boxer.jpg','static/descr/Dogs/Boxer.txt',1),(4,'Chihuahua',1,1,154,57,3,'10-18 years','6-9 inches','3-6 pounds','images/Dogs/Chihuahua.jpg','static/descr/Dogs/Chihuahua.txt',1),(5,'German Shepherd',9,1,90,47,1,'10-14 years','1ft.10in.-2ft.2in.','75-95 pounds','images/Dogs/German-Shepherd.jpg','static/descr/Dogs/German-Shepherd.txt',1),(6,'Manchester Terrier',9,1,243,87,3,'14-16 years','1ft,3in-1ft,4in','12-22 pounds','images/Dogs/Manchester-terrier.jpg','static/descr/Dogs/Manchester-Terrier.txt',1),(7,'Ragdoll',21,2,244,90,2,'12-17 years','17-21 inches','10-20 pound','images/Cats/ragdoll.jpeg','static/descr/Cats/Ragdoll.txt',1),(8,'Chartreux',21,2,82,97,1,'11-15 years','9-11 inches','7-16 pounds','images/Cats/Chartreux.jpg','static/descr/Cats/Chartreux.txt',1),(9,'Bengal Cat',20,2,244,85,4,'10-16 years','17-22 inches','8-17 pounds','images/Cats/bengal-kitten.jpg','static/descr/Cats/Bengal-Cat.txt',1),(10,'Arabian Horse',16,3,203,270,5,'25-30 years','1.4-1.6m','800-100 lb','images/Horse/arabian-horse.jpg','static/descr/Horse/Arabian-Horse.txt',1),(11,'American Quarter Horse',12,3,244,180,1,'25 years','57-64 inches','950-1200 pounds','images/Horse/american-quarter.jpg','static/descr/Horse/American-Quarter-Horse.txt',1),(12,'Morgan Horse',12,3,244,150,0,'20-30 years','57-66 inches','1000 pounds','images/Horse/morgan-horse.jpg','static/descr/Horse/Morgan-Horse.txt',1),(13,'Miniature Horse',15,3,243,105,0,'25-30 years','34-38 inches','350 pounds','images/Horse/miniature-horse.jpg','static/descr/Horse/Miniature-Horse.txt',1),(14,'Neon Tetra',10,11,33,8,0,'5 years','1.5 inches','','images/Fish/neon-tetra.jpg','static/descr/Fish/Neon-Tetra.txt',1),(15,'Guppy',10,11,244,5,0,'upto 2 years','0.6-2.4 inches','','images/Fish/guppy fish.png','static/descr/Fish/Guppy.txt',1),(16,'Black Mouth Cur',2,1,244,36,3,'12-18 years','16-25 inches','40-95 pounds','images/Dogs/black-mouth-cur.jpg','static/descr/Dogs/Black-Mouth-Cur.txt',1);
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_item` int DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `r_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_item` (`cart_item`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`cart_item`) REFERENCES `Animal` (`animal_id`),
  CONSTRAINT `Cart_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `Register` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'Afghanistan'),(2,'Akrotiri'),(3,'Albania'),(4,'Algeria'),(5,'American Samoa'),(6,'Andorra'),(7,'Angola'),(8,'Anguilla\n'),(9,'Antarctica'),(10,'Antigua and Barbuda'),(11,'Argentina'),(12,'Armenia'),(13,'Aruba'),(14,'Ashmore and Cartier Islands'),(15,'Australia'),(16,'Austria'),(17,'Azerbaijan'),(18,'Bahamas'),(19,'Bahrain'),(20,'Bangladesh'),(21,'Barbados'),(22,'Bassas da India'),(23,'Belarus'),(24,'Belgium'),(25,'Belize'),(26,'Benin'),(27,'Bermuda'),(28,'Bhutan'),(29,'Bolivia'),(30,'Bosnia and Herzegovina'),(31,'Botswana'),(32,'Bouvet Island'),(33,'Brazil'),(34,'British Indian Ocean Territory'),(35,'British Virgin Islands'),(36,'Brunei'),(37,'Bulgaria'),(38,'Burkina Faso'),(39,'Burma'),(40,'Burundi'),(41,'Cambodia'),(42,'Cameroon'),(43,'Canada'),(44,'Cape Verde'),(45,'Cayman Islands'),(46,'Central African Republic'),(47,'Chad'),(48,'Chile'),(49,'China'),(50,'Christmas Island'),(51,'Clipperton Island'),(52,'Cocos (Keeling) Islands'),(53,'Colombia'),(54,'Comoros'),(55,'Congo, Democratic Republic of the'),(56,'Congo, Republic of the'),(57,'Cook Islands'),(58,'Coral Sea Islands'),(59,'Costa Rica'),(60,'Cote d Ivoire'),(61,'Croatia'),(62,'Cuba'),(63,'Cyprus'),(64,'Czech Republic'),(65,'Denmark'),(66,'Dhekelia'),(67,'Djibouti'),(68,'Dominica'),(69,'Dominican Republic'),(70,'Ecuador'),(71,'Egypt'),(72,'El Salvador'),(73,'Equatorial Guinea'),(74,'Eritrea'),(75,'Estonia'),(76,'Ethiopia'),(77,'Europa Island'),(78,'Falkland Islands (Islas Malvinas)'),(79,'Faroe Islands'),(80,'Fiji'),(81,'Finland'),(82,'France'),(83,'French Guiana'),(84,'French Polynesia'),(85,'French Southern and Antarctic Lands'),(86,'Gabon'),(87,'Gambia'),(88,'Gaza Strip '),(89,'Georgia'),(90,'Germany'),(91,'Ghana'),(92,'Gibraltar'),(93,'Glorioso Islands'),(94,'Greece'),(95,'Greenland'),(96,'Grenada'),(97,'Guadeloupe'),(98,'Guam'),(99,'Guatemala'),(100,'Guernsey'),(101,'Guinea'),(102,'Guinea-Bissau'),(103,'Guyana'),(104,'Haiti'),(105,'Heard Island and McDonald Islands'),(106,'Holy See (Vatican City)'),(107,'Honduras'),(108,'Hong Kong'),(109,'Hungary'),(110,'Iceland'),(111,'India'),(112,'Indonesia'),(113,'Iran'),(114,'Iraq'),(115,'Ireland'),(116,'Isle of Man'),(117,'Israel'),(118,'Italy'),(119,'Jamaica'),(120,'Jan Mayen'),(121,'Japan'),(122,'Jersey'),(123,'Jordan'),(124,'Juan de Nova Island'),(125,'Kazakhstan'),(126,'Kenya'),(127,'Kiribati'),(128,'Korea, North'),(129,'Korea, South'),(130,'Kuwait'),(131,'Kyrgyzstan'),(132,'Laos'),(133,'Latvia'),(134,'Lebanon'),(135,'Lesotho'),(136,'Liberia'),(137,'Libya'),(138,'Liechtenstein'),(139,'Lithuania '),(140,'Luxembourg'),(141,'Macau'),(142,'Macedonia'),(143,'Madagascar'),(144,'Malawi'),(145,'Malaysia'),(146,'Maldives'),(147,'Mali'),(148,'Malta'),(149,'Marshall Islands'),(150,'Martinique'),(151,'Mauritania'),(152,'Mauritius'),(153,'Mayotte'),(154,'Mexico'),(155,'Micronesia, Federated States of'),(156,'Moldova'),(157,'Monaco'),(158,'Mongolia'),(159,'Montserrat'),(160,'Morocco'),(161,'Mozambique'),(162,'Namibia'),(163,'Nauru'),(164,'Navassa Island'),(165,'Nepal'),(166,'Netherlands'),(167,'Netherlands Antilles'),(168,'New Caledonia'),(169,'New Zealand'),(170,'Nicaragua'),(171,'Niger'),(172,'Nigeria'),(173,'Niue'),(174,'Norfolk Island'),(175,'Northern Mariana Islands'),(176,'Norway'),(177,'Oman'),(178,'Pakistan'),(179,'Palau'),(180,'Panama'),(181,'Papua New Guinea'),(182,'Paracel Islands'),(183,'Paraguay'),(184,'Peru'),(185,'Philippines'),(186,'Pitcairn Islands'),(187,'Poland'),(188,'Portugal'),(189,'Puerto Rico'),(190,'Qatar'),(191,'Reunion'),(192,'Romania'),(193,'Russia'),(194,'Rwanda'),(195,'Saint Helena'),(196,'Saint Kitts and Nevis'),(197,'Saint Lucia'),(198,'Saint Pierre and Miquelon'),(199,'Saint Vincent and the Grenadines'),(200,'Samoa'),(201,'San Marino'),(202,'Sao Tome and Principe'),(203,'Saudi Arabia'),(204,'Senegal'),(205,'Serbia and Montenegro'),(206,'Seychelles'),(207,'Sierra Leone'),(208,'Singapore'),(209,'Slovakia'),(210,'Slovenia'),(211,'Solomon Islands'),(212,'Somalia'),(213,'South Africa '),(214,'South Georgia and the South Sandwich Islands'),(215,'Spain'),(216,'Spratly Islands'),(217,'Sri Lanka'),(218,'Sudan'),(219,'Suriname'),(220,'Svalbard'),(221,'Swaziland'),(222,'Sweden'),(223,'Switzerland'),(224,'Syria'),(225,'Taiwan'),(226,'Tajikistan'),(227,'Tanzania'),(228,'Thailand'),(229,'Timor-Leste'),(230,'Togo'),(231,'Tokelau'),(232,'Tonga'),(233,'Trinidad and Tobago'),(234,'Tromelin Island'),(235,'Tunisia'),(236,'Turkey'),(237,'Turkmenistan'),(238,'Turks and Caicos Islands'),(239,'Tuvalu'),(240,'Uganda'),(241,'Ukraine'),(242,'United Arab Emirates'),(243,'United Kingdom'),(244,'United States'),(245,'Uruguay'),(246,'Uzbekistan'),(247,'Vanuatu'),(248,'Venezuela'),(249,'Vietnam'),(250,'Virgin Islands'),(251,'Wake Island'),(252,'Wallis and Futuna'),(253,'West Bank'),(254,'Western Sahara'),(255,'Yemen'),(256,'Zambia'),(257,'Zimbabwe');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `s_no` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) DEFAULT NULL,
  `order_detail` int DEFAULT NULL,
  `r_id` int DEFAULT NULL,
  PRIMARY KEY (`s_no`),
  KEY `order_detail` (`order_detail`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`order_detail`) REFERENCES `Animal` (`animal_id`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `Register` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Query`
--

DROP TABLE IF EXISTS `Query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Query` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `query` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Query`
--

LOCK TABLES `Query` WRITE;
/*!40000 ALTER TABLE `Query` DISABLE KEYS */;
/*!40000 ALTER TABLE `Query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Register`
--

DROP TABLE IF EXISTS `Register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Register` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` int DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `address` varchar(300) NOT NULL,
  `flag` int DEFAULT '0',
  PRIMARY KEY (`r_id`),
  KEY `country` (`country`),
  CONSTRAINT `Register_ibfk_1` FOREIGN KEY (`country`) REFERENCES `Country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Register`
--

LOCK TABLES `Register` WRITE;
/*!40000 ALTER TABLE `Register` DISABLE KEYS */;
INSERT INTO `Register` VALUES (1,'Test','User','demo','demo_pass','user@demo.com',111,'987654321','95, Demo Road, India',0);
/*!40000 ALTER TABLE `Register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rewards`
--

DROP TABLE IF EXISTS `Rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rewards` (
  `reward_id` int NOT NULL AUTO_INCREMENT,
  `coupon` varchar(50) NOT NULL,
  `reward_detail` varchar(30) DEFAULT NULL,
  `min_amount` int NOT NULL,
  `date` date DEFAULT NULL,
  `r_id` int DEFAULT NULL,
  PRIMARY KEY (`reward_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `Rewards_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `Register` (`r_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rewards`
--

LOCK TABLES `Rewards` WRITE;
/*!40000 ALTER TABLE `Rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Species`
--

DROP TABLE IF EXISTS `Species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Species` (
  `species_id` int NOT NULL AUTO_INCREMENT,
  `species_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`species_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Species`
--

LOCK TABLES `Species` WRITE;
/*!40000 ALTER TABLE `Species` DISABLE KEYS */;
INSERT INTO `Species` VALUES (1,'Dog'),(2,'Cat'),(3,'Horse'),(4,'Hen'),(5,'Goat'),(6,'Sheep'),(7,'Cow'),(8,'Bufallo'),(9,'Bull'),(10,'Pig'),(11,'Fish'),(12,'Lobster'),(13,'Crab'),(14,'Rodent'),(15,'Mouse'),(16,'Rabbit'),(17,'Birds'),(18,'Camel'),(19,'Elephant'),(20,'Duck'),(21,'Goose'),(22,'Turtle'),(23,'Tortoise'),(24,'Lizard'),(25,'Snake');
/*!40000 ALTER TABLE `Species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Type`
--

DROP TABLE IF EXISTS `Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `species` int DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `species` (`species`),
  CONSTRAINT `Type_ibfk_1` FOREIGN KEY (`species`) REFERENCES `Species` (`species_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Type`
--

LOCK TABLES `Type` WRITE;
/*!40000 ALTER TABLE `Type` DISABLE KEYS */;
INSERT INTO `Type` VALUES (1,'Companion',1),(2,'Working',1),(3,'Gaurd',1),(4,'Primitive',1),(5,'Pastoral',1),(6,'Hunting',1),(7,'Sled',1),(8,'Turnspit',1),(9,'Miscellaneous',1),(10,'Fresh-Water',11),(11,'Salt-Water',11),(12,'Draft Horse',3),(13,'Light Horse',3),(14,'Pony',3),(15,'Small',3),(16,'Warm-blood',3),(17,'Mediterranean',4),(18,'English',4),(19,'Fighting',4),(20,'Farm-cat',2),(21,'House-cat',2),(22,'Venomous',25),(23,'Non-Venomous',25),(24,'Water-snake',25),(25,'Single-humped',18),(26,'Double-humped',18),(27,'Forest',19),(28,'Borneo',19),(29,'Sumatran',19),(30,'Pygmy',5),(31,'Nigerian Dwarf',5),(32,'Kinder',5),(33,'Nigora',5),(34,'Mole',14),(35,'Dessert',14),(36,'Racing',17);
/*!40000 ALTER TABLE `Type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09 14:14:19
