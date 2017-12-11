-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: db_coworkingspace
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `idbooking` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `begin_time` varchar(45) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `desk_booking` int(11) DEFAULT NULL,
  `fk_idmember` int(4) unsigned zerofill DEFAULT NULL,
  `fk_idspace` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`idbooking`),
  UNIQUE KEY `id_booking_UNIQUE` (`idbooking`),
  KEY `fk_idmember_idx` (`fk_idmember`),
  KEY `booking_ibfk_1` (`fk_idspace`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_idspace`) REFERENCES `co_working_space` (`idspace`),
  CONSTRAINT `fk_idmember` FOREIGN KEY (`fk_idmember`) REFERENCES `member` (`idmember`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (000001,'2017-11-03','09:00','10:00',1,0009,0001),(000002,'2017-11-07','16:00','17:00',4,0003,0002),(000003,'2017-11-07','14:00','15:00',1,0002,0001),(000004,'2017-12-14','10:00','19:00',3,0002,0027),(000005,'2017-12-11','09:00','14:30',1,0002,0027),(000006,'2017-12-11','15:00','18:00',1,0002,0027);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
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
  `total_desk` varchar(45) DEFAULT NULL,
  `amount_desk` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `size_room` varchar(45) DEFAULT NULL,
  `open_time` varchar(45) DEFAULT NULL,
  `close_time` varchar(45) DEFAULT NULL,
  `amount_people` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `rating` int(11) GENERATED ALWAYS AS (0) VIRTUAL,
  `num_of_review` int(11) GENERATED ALWAYS AS (0) VIRTUAL,
  `fk_idmember` int(4) unsigned DEFAULT NULL,
  `img` varchar(1000) DEFAULT 'NO IMAGE',
  PRIMARY KEY (`idspace`),
  UNIQUE KEY `idspace_UNIQUE` (`idspace`),
  KEY `idtype_room_idx` (`idtype_room`),
  KEY `idtype_desk_idx` (`idtype_desk`),
  KEY `fk_idmember_idx` (`fk_idmember`),
  CONSTRAINT `idmember` FOREIGN KEY (`fk_idmember`) REFERENCES `member` (`idmember`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idtype_desk` FOREIGN KEY (`idtype_desk`) REFERENCES `type_desk` (`idtype_desk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idtype_room` FOREIGN KEY (`idtype_room`) REFERENCES `type_room` (`idtype_room`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_working_space`
--

LOCK TABLES `co_working_space` WRITE;
/*!40000 ALTER TABLE `co_working_space` DISABLE KEYS */;
INSERT INTO `co_working_space` (`idspace`, `name`, `location`, `idtype_room`, `idtype_desk`, `total_desk`, `amount_desk`, `description`, `size_room`, `open_time`, `close_time`, `amount_people`, `price`, `fk_idmember`, `img`) VALUES (0001,'Muayland','LKB 32, Bangkok',1,2,'10',10,'wifi, parking, air conditioner','40','09:00','18:00','1',200,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Muayland_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Muayland_1.jpg'),(0002,'Boyland','Suan Siam, Bangkok',2,2,'1',1,'wifi, parking, air conditioner, board','12','09:00','18:00','2',500,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Boyland_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Boyland_2.jpg'),(0003,'ITLAND','IT KMITL, Bangkok',2,1,'2',2,'wifi, parking, air conditioner, board,แม่บ้าน','20','09:00','20:00','8',200,1,'https://coworkingspacebucket.s3.amazonaws.com/space/ITLAND_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/ITLAND_1.jpg'),(0013,'Miineland','Asoke, Bangkok',1,2,'18',18,'wifi, parking, air conditioner','35','10:00','19:00','1',200,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Miineland_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Miineland_1.jpg'),(0014,'Monkey D Lufy','Sathorn, Bangkok',1,1,'15',15,'wifi, parking, air conditioner','40','09:00','18:00','1',250,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Monkey D Lufy_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Monkey D Lufy_1.jpg'),(0015,'Conan Room','Asoke, Bangkok',1,1,'10',10,'wifi, parking, air conditioner','20','09:00','18:00','1',250,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Conan Room_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Conan Room_1.jpg'),(0016,'Mori Room','Asoke, Bangkok',3,2,'10',10,'wifi, parking, air conditioner, board,แม่บ้าน','35','09:00','20:00','10',400,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Mori Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Mori Room_2.jpg'),(0017,'Inn Land','Asoke, Bangkok',3,1,'8',8,'wifi, parking, air conditioner, board,แม่บ้าน','35','09:00','18:00','8',400,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Inn Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Inn Land_2.jpg'),(0018,'Lovely Room','Klong Sansab, Bangkok',1,2,'40',40,'wifi, parking, air conditioner','60','08:00','21:00','1',200,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Lovely Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Lovely Room_2.jpg'),(0019,'Pretty Room','Klong Sansab, Bangkok',3,2,'1',1,'wifi, parking, air conditioner, board,แม่บ้าน','30','08:00','21:00','15',500,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Pretty Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Pretty Room_2.jpg'),(0020,'Ugly Room','Klong Sansab, Bangkok',2,1,'3',3,'wifi, parking, air conditioner, board,แม่บ้าน','20','08:00','21:00','3',350,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Ugly Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Ugly Room_2.jpg'),(0021,'Wow Room','Klong Sansab, Bangkok',1,2,'50',50,'wifi, parking, air conditioner','60','08:00','21:00','1',200,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Wow Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Wow Room_2.jpg'),(0022,'Jubu Land','Prawet, Bangkok',3,2,'1',1,'wifi, parking, air conditioner, board','60','09:00','20:00','14',400,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Jubu Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Jubu Land_2.jpg'),(0023,'Jibi Land','Prawet, Bangkok',2,1,'4',4,'wifi, parking, air conditioner, board','40','09:00','20:00','4',400,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Jibi Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Jibi Land_2.jpg'),(0024,'Maple Land','Nongkham, Bangkok',1,1,'20',20,'wifi, parking, air conditioner, แม่บ้าน','60','08:00','21:00','1',200,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Maple Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Maple Land_2.jpg'),(0025,'Tissue Room','Nongjok, Bangkok',1,2,'20',20,'wifi, parking, air conditioner, แม่บ้าน','50','08:00','20:00','1',200,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Tissue Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Tissue Room_2.jpg'),(0026,'Skyline','Suvanabhumi Airport, Samut Prakan',1,1,'5',5,'wifi, parking, air conditioner, แม่บ้าน','50','08:00','21:00','1',500,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Skyline_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Skyline_2.jpg'),(0027,'ทดสอบแลนด์','สวนสยาม',1,1,'5',5,'WIFI AIR ','30','09:00','20:00','10',5634,1,'https://coworkingspacebucket.s3.amazonaws.com/space/ทดสอบแลนด์_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/ทดสอบแลนด์_2.jpg');
/*!40000 ALTER TABLE `co_working_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `idhistory` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `begin_time` varchar(45) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `desk_booking` int(11) DEFAULT NULL,
  `fk_idmember` int(4) unsigned zerofill DEFAULT NULL,
  `fk_idspace` int(4) unsigned zerofill DEFAULT NULL,
  `state_review` int(4) GENERATED ALWAYS AS (1) STORED,
  PRIMARY KEY (`idhistory`),
  UNIQUE KEY `idhistory_UNIQUE` (`idhistory`),
  KEY `history_ibfk_1` (`fk_idspace`),
  KEY `history_ibfk_2` (`fk_idmember`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`fk_idspace`) REFERENCES `co_working_space` (`idspace`),
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`fk_idmember`) REFERENCES `member` (`idmember`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`idhistory`, `date`, `begin_time`, `end_time`, `desk_booking`, `fk_idmember`, `fk_idspace`) VALUES (0000001,'2017-11-01','18.00','20.00',4,0002,0002),(0000002,'2017-10-29','10.00','20.00',4,0002,0002),(0000003,'2017-12-04','10.00','13.00',4,0009,0013);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
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
  `img_profile` varchar(100) DEFAULT NULL,
  `idcard` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idmember`),
  UNIQUE KEY `idmember_UNIQUE` (`idmember`),
  KEY `idtype_member_idx` (`idtype_member`),
  CONSTRAINT `idtype_member` FOREIGN KEY (`idtype_member`) REFERENCES `type_member` (`idtype_member`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (0001,'Vipuwat','Kumpalanon','PoloYah','boyjame55','boyjameza04@gmail.com','0943211994',1,'https://coworkingspacebucket.s3.amazonaws.com/space/profileimgPoloYah.jpg','https://coworkingspacebucket.s3.amazonaws.com/space/idcardimgPoloYah.jpg'),(0002,'memiine','Chotisawatraksa','memiine','1234','memiinetest@hotmail.com','0943211995',2,'https://coworkingspacebucket.s3.amazonaws.com/space/profileimgmemiine.jpg','https://coworkingspacebucket.s3.amazonaws.com/space/idcardimgmemiine.jpg'),(0003,'teejuta','kaewtong','iamplaster','1234','iamplaster@hotmail.com','0943211996',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified'),(0004,'tester','naja','tester','12345678','abcd@gmail.com','0123456789',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified'),(0008,'trhstrhth','et5t5gw45g45','abcdefg','36985214','bcd@gmail.com','0963258741',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified'),(0009,'thitiphat','manitchalermchai','thiti','1234','thiti@hotmail.com','0999999999',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified'),(0010,'aum','aung','aa','1234','aumaung@hotmail.com','0966666666',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified'),(0011,'pokky','naja','pokky','1234','pokky@hotmail.com','0900011100',1,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified'),(0012,'teter','lolopa','sissterr','12345678','sister@gmail.com','0943211234',2,'https://coworkingspacebucket.s3.amazonaws.com/space/teter_lolopa.jpg','https://coworkingspacebucket.s3.amazonaws.com/space/sissterr_teter_lolopa.');
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

-- Dump completed on 2017-12-11 15:15:26
