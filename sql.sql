-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: cross_sell
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sku_list`
--

DROP TABLE IF EXISTS `sku_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(5) DEFAULT NULL,
  `product_desc` varchar(100) DEFAULT NULL,
  `size_in_dozon` int(11) DEFAULT NULL,
  `flavour` varchar(45) DEFAULT NULL,
  `compitable_with` varchar(45) DEFAULT NULL,
  `active` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_list`
--

LOCK TABLES `sku_list` WRITE;
/*!40000 ALTER TABLE `sku_list` DISABLE KEYS */;
INSERT INTO `sku_list` VALUES (1,'CM001','small machine, base model',NULL,NULL,NULL,'1'),(2,'CM002','small machine, premium model ',NULL,NULL,NULL,'1'),(3,'CM003','small machine, deluxe model, water line compatible ',NULL,NULL,NULL,'1'),(4,'CM101','large machine, base model',NULL,NULL,NULL,'1'),(5,'CM102','large machine, premium model, water line compatible ',NULL,NULL,NULL,'1'),(6,'CM103','large machine, deluxe model, water line compatible ',NULL,NULL,NULL,'1'),(7,'EM001','espresso machine, base model ',NULL,NULL,NULL,'1'),(8,'EM002','espresso machine, premium model ',NULL,NULL,NULL,'1'),(9,'EM003','espresso machine, deluxe model, water line compatible ',NULL,NULL,NULL,'1'),(10,'CP001','small coffee pod, 1 dozen, vanilla ',1,'vanila','CM001,CM002,CM003,CP003','1'),(11,'CP003','small coffee pod, 3 dozen, vanilla ',3,'vanila','CM001,CM002,CM003,CP001','1'),(12,'CP011','small coffee pod, 1 dozen, caramel ',1,'caramel','CM001,CM002,CM003,CP013','1'),(13,'CP013','small coffee pod, 3 dozen, caramel ',3,'caramel','CM001,CM002,CM003,CP011','1'),(14,'CP021','small coffee pod, 1 dozen, psl ',1,'psl','CM001,CM002,CM003,CP023','1'),(15,'CP023','small coffee pod, 3 dozen, psl ',3,'psl','CM001,CM002,CM003,CP012','1'),(54,'CP031','small coffee pod, 1 dozen, mocha ',1,'mocha','CM001,CM002,CM003,CP033','1'),(55,'CP033','small coffee pod, 3 dozen, mocha ',3,'mocha','CM001,CM002,CM003,CP031','1'),(56,'CP041','small coffee pod, 1 dozen, hazelnut ',1,'hazelnut','CM001,CM002,CM003,CP043','1'),(57,'CP043','small coffee pod, 3 dozen, hazelnut',3,'hazelnut','CM001,CM002,CM003,CP041','1'),(58,'CP101','large coffee pod, 1 dozen, vanilla ',1,'vanila','CM101,CM102,CM103,CP103','1'),(59,'CP103','large coffee pod, 3 dozen, vanilla ',3,'vanila','CM101,CM102,CM103,CP101','1'),(60,'CP111','large coffee pod, 1 dozen, caramel ',1,'caramel','CM101,CM102,CM103,CP113','1'),(61,'CP113','large coffee pod, 3 dozen, caramel ',3,'caramel','CM101,CM102,CM103,CP111','1'),(62,'CP121','large coffee pod, 1 dozen, psl ',1,'psl','CM101,CM102,CM103,CP123','1'),(63,'CP123','large coffee pod, 3 dozen, psl',3,'psl','CM101,CM102,CM103,CP121','1'),(64,'CP131','large coffee pod, 1 dozen, mocha',1,'mocha','CM101,CM102,CM103,CP133','1'),(65,'CP133','large coffee pod, 3 dozen, mocha',3,'mocha','CM101,CM102,CM103,CP131','1'),(66,'CP141','large coffee pod, 1 dozen, hazelnut',1,'hazelnut','CM101,CM102,CM103,CP143','1'),(67,'CP143','large coffee pod, 3 dozen, hazelnut',3,'hazelnut','CM101,CM102,CM103,CP141','1'),(68,'EP003','espresso pod, 3 dozen, vanilla',3,'vanila','EM001,EM002,EM003,EP005,EP007','1'),(69,'EP005','espresso pod, 5 dozen, vanilla',5,'vanila','EM001,EM002,EM003,EP007,EP003','1'),(70,'EP007','espresso pod, 7 dozen, vanilla',7,'vanila','EM001,EM002,EM003,EP005,EP003','1'),(71,'EP013','espresso pod, 3 dozen, caramel',3,'caramel','EM001,EM002,EM003,EP015,EP017','1'),(72,'EP015','espresso pod, 5 dozen, caramel',5,'caramel','EM001,EM002,EM003,EP013,EP017','1'),(73,'EP017','espresso pod, 7 dozen, caramel',7,'caramel','EM001,EM002,EM003,EP013,EP015','1');
/*!40000 ALTER TABLE `sku_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-20 14:56:40
