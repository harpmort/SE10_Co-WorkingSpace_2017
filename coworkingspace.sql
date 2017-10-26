-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_coworkingspace
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `idadmin` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idadmin`),
  UNIQUE KEY `idadmin_UNIQUE` (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (0001,'Ratima','Chinbuasuwan','ratimaa','ratimaa'),(0002,'Vipuwat','Kampalanon','harpmort','harpmort');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_working_space`
--

DROP TABLE IF EXISTS `co_working_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_working_space` (
  `idspace` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `idtype_room` int(11) DEFAULT NULL,
  `idtype_desk` int(11) DEFAULT NULL,
  `amount_desk` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idspace`),
  UNIQUE KEY `idspace_UNIQUE` (`idspace`),
  KEY `idtype_room_idx` (`idtype_room`),
  KEY `idtype_desk_idx` (`idtype_desk`),
  CONSTRAINT `idtype_desk` FOREIGN KEY (`idtype_desk`) REFERENCES `type_desk` (`idtype_desk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idtype_room` FOREIGN KEY (`idtype_room`) REFERENCES `type_room` (`idtype_room`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_working_space`
--

LOCK TABLES `co_working_space` WRITE;
/*!40000 ALTER TABLE `co_working_space` DISABLE KEYS */;
INSERT INTO `co_working_space` VALUES (0001,'muayland','LKB 32 Bangkok',1,2,'1',200,'wifi. parking, air conditioner'),(0002,'boyland','suan siam Bangkok',2,1,'4',500,'wifi. parking, air conditioner, board');
/*!40000 ALTER TABLE `co_working_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `idmember` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `idtype_member` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmember`),
  UNIQUE KEY `idmember_UNIQUE` (`idmember`),
  KEY `idtype_member_idx` (`idtype_member`),
  CONSTRAINT `idtype_member` FOREIGN KEY (`idtype_member`) REFERENCES `type_member` (`idtype_member`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (0001,'vipuwat','kumpalanon','PoloYah','boyjame55','boyjameza04@gmail.com','0943211994',1),(0002,'rujapa','chotisawatraksa','memiine','1234','memiine@hotmail.com','0943211995',2),(0003,'teejuta','kaewtong','iamplaster','1234','iamplaster@hotmail.com','0943211996',1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `idmessage` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idmessage`),
  UNIQUE KEY `idmessage_UNIQUE` (`idmessage`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (0001,'booking','คุณได้ทำการจอง Co-Working Space  กับทางเว็บไซต์แล้ว ขอบคุณค่ะ'),(0002,'cancel_booking','คุณได้ืทำการยกเลิกการจอง Co-Working Space แล้ว'),(0003,'cancel_userbooking','การจอง Co-Working Space ของคุณโดนยกเลิกโดยผู้ประกอบการ ต้องขออภัยมา ณ ที่นี้ด้วยค่ะ');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_desk`
--

DROP TABLE IF EXISTS `type_desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_desk` (
  `idtype_desk` int(11) NOT NULL AUTO_INCREMENT,
  `type_desk` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtype_desk`),
  UNIQUE KEY `idtype_desk_UNIQUE` (`idtype_desk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_desk`
--

LOCK TABLES `type_desk` WRITE;
/*!40000 ALTER TABLE `type_desk` DISABLE KEYS */;
INSERT INTO `type_desk` VALUES (1,'Fix Desk'),(2,'Share Desk');
/*!40000 ALTER TABLE `type_desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_member`
--

DROP TABLE IF EXISTS `type_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_member` (
  `idtype_member` int(11) NOT NULL AUTO_INCREMENT,
  `type_member` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtype_member`),
  UNIQUE KEY `idtype_member_UNIQUE` (`idtype_member`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_member`
--

LOCK TABLES `type_member` WRITE;
/*!40000 ALTER TABLE `type_member` DISABLE KEYS */;
INSERT INTO `type_member` VALUES (1,'Supply'),(2,'User');
/*!40000 ALTER TABLE `type_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_room`
--

DROP TABLE IF EXISTS `type_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_room` (
  `idtype_room` int(11) NOT NULL AUTO_INCREMENT,
  `type_room` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtype_room`),
  UNIQUE KEY `idtype_room_UNIQUE` (`idtype_room`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_room`
--

LOCK TABLES `type_room` WRITE;
/*!40000 ALTER TABLE `type_room` DISABLE KEYS */;
INSERT INTO `type_room` VALUES (1,'Share Room'),(2,'Private Room'),(3,'Meeting Room');
/*!40000 ALTER TABLE `type_room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-26 17:56:31
