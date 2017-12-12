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
  `idadmin` int(2) unsigned zerofill NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idadmin`),
  UNIQUE KEY `idadmin_UNIQUE` (`idadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (01,'admin001','1234'),(02,'admin999','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approve`
--

DROP TABLE IF EXISTS `approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approve` (
  `idapprove` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `fk_id_member` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`idapprove`),
  UNIQUE KEY `idapprove_UNIQUE` (`idapprove`),
  KEY `idmember_idx` (`fk_id_member`),
  CONSTRAINT `fk_id_member` FOREIGN KEY (`fk_id_member`) REFERENCES `member` (`idmember`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approve`
--

LOCK TABLES `approve` WRITE;
/*!40000 ALTER TABLE `approve` DISABLE KEYS */;
INSERT INTO `approve` VALUES (0002,11),(0009,13),(0010,14);
/*!40000 ALTER TABLE `approve` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (000001,'2017-11-03','09:00','10:00',1,0009,0001),(000002,'2017-11-07','16:00','17:00',4,0003,0002),(000004,'2017-12-14','10:00','19:00',3,0002,0027),(000005,'2017-12-11','09:00','14:30',1,0002,0027),(000006,'2017-12-11','15:00','18:00',1,0002,0027),(000007,'2017-12-15','10:00','15:00',2,0002,0002);
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
  `description` varchar(1000) DEFAULT NULL,
  `size_room` varchar(45) DEFAULT NULL,
  `open_time` varchar(45) DEFAULT NULL,
  `close_time` varchar(45) DEFAULT NULL,
  `amount_people` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `fk_idmember` int(4) unsigned DEFAULT NULL,
  `img` varchar(1000) DEFAULT 'NO IMAGE',
  `rating` int(100) DEFAULT '0',
  `num_of_review` int(100) DEFAULT '0',
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
INSERT INTO `co_working_space` VALUES (0001,'Hua-Takhe','LKB 32, Bangkok',1,2,'10',10,'ห้องของเรามีบรรยากาศที่เหมาะสำหรับการทำงานร่วมกัน มีสิ่งอำนวยความสะดวก อาทิเช่น wifi, parking, air conditioner สถานที่ใกล้เคียงได้แก่ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง, สนามบินสุวรรณภูมิ, ศูนย์การค้า Pasio ห่างกันเพียง 5 นาทีเท่านั้น','40','09:00','18:00','1',70,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Muayland_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Muayland_1.jpg',0,0),(0002,'WIKING','Suan Siam, Bangkok',2,2,'2',2,'Wiking อยู่บนตึกสูง 35 ชั้น สามารถมองเห็นบรรยากาศได้ทั่วกรุงเทพมหานคร เหมาะแก่การสร้างแรงบันดาลใจในการทำงานอย่างมาก ซึ่งมีสิ่งอำนวยความสะดวกได้แก่ wifi, parking, air conditioner, board จองกับเราสิคะ!','12','09:00','18:00','2',100,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Boyland_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Boyland_2.jpg',4,2),(0003,'Common','IT KMITL, Bangkok',2,1,'2',2,'ห้องทำงานสุดหรูย่านมหาวิทยาลัย มีสิ่งอำนวยความสะดวกครบครัน ไม่ว่าจะเป็น wifi, parking, air conditioner, board และมีแม่บ้านที่พร้อมให้บริการท่านตลอดเวลา เลือกจองกับเราสิคะ!','20','09:00','20:00','8',100,1,'https://coworkingspacebucket.s3.amazonaws.com/space/ITLAND_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/ITLAND_1.jpg',0,0),(0013,'White House','Asoke, Bangkok',1,2,'18',18,'ห้องแชร์พื้นที่ทำงานขนาดกลาง ย่านอโศก ท่านสามารถเดินทางโดยรถไฟฟ้า ARL ลงที่สถานที่มักกะสัน ใช้เวลาเพียง 5 นาทีเท่านั้น! มีสิ่งอำนวยความสะดวกครบครัน (wifi, parking, air conditioner) สะดวกสบายและถูกขนาดนี้ไม่มีอีกแล้ว!','35','10:00','19:00','1',50,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Miineland_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Miineland_1.jpg',5,1),(0014,'Forest @Sathorn','Sathorn, Bangkok',1,1,'15',15,'Co Working Space ย่านใจกลางกรุงเทพฯ บรรยากาศร่มรื่นท่ามกลางธรรมชาติ เหมาะสำหรับท่านที่ต้องการความสงบและธรรมชาติ ที่นี่มี wifi, parking และ air conditioner','40','09:00','18:00','1',80,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Monkey D Lufy_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Monkey D Lufy_1.jpg',0,0),(0015,'Craft','Asoke, Bangkok',1,1,'10',10,'พื้นที่ทำงานขนาดย่อม สไตล์ minimal เหมาะสำหรับนั่งเล่น นั่งทำงานชิลๆ กับสถานที่สุดชิค มี wifi, parking และ air conditioner','20','09:00','18:00','1',60,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Conan Room_2.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Conan Room_1.jpg',0,0),(0016,'Cover 2 Cover','Asoke, Bangkok',3,2,'10',10,'ท่านกำลังมองหาห้องประชุมใจกลางเมืองอยู่ใช่หรือไม่? เราขอแนะนำ Cover 2 Cover ที่มีสิ่งอำนวยความสะดวกเพียบพร้อม ไม่ว่าจะเป็น wifi, parking, air conditioner, board และแม่บ้าน เดินทางสะดวก ใกล้รถไฟฟ้า ARL เพียง 5 นาทีเท่านั้น!','35','09:00','20:00','10',110,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Mori Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Mori Room_2.jpg',0,0),(0017,'Crazy Wisdom','Asoke, Bangkok',3,1,'8',8,'และนี่คือห้องประชุมขนาดเล็ก อยู่บนตึกสูง 15 ชั้นย่านใจกลางเมือง เดินทางง่าย สิ่งอำนวยความสะดวกพร้อม (wifi, parking, air conditioner, board,แม่บ้าน) ติดต่อเราเลย!','35','09:00','18:00','8',110,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Inn Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Inn Land_2.jpg',0,0),(0018,'Magic Cross','Klong Sansab, Bangkok',1,2,'40',40,'Magic Cross เป็น co working space ขนาดใหญ่ที่กำลังเป็นที่นิยมอยู่ในขณะนี้ เนื่องจากเดินทางสะดวก มีบรรยากาศที่ถูกใจวัยรุ่นและวัยทำงาน สิ่งอำนวยความสะดวกครบครัน เช่น wifi, parking, air conditioner','60','08:00','21:00','1',50,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Lovely Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Lovely Room_2.jpg',0,0),(0019,'Made to Inspire','Klong Sansab, Bangkok',3,2,'1',1,'เป็นห้องประชุมสุดหรู ตั้งอยู่บริเวณที่เงียบสงบ ออกแบบให้เหมาะแก่การพบปะและประชุมกับลูกค้า มี wifi, parking, air conditioner, board, แม่บ้าน','30','08:00','21:00','15',170,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Pretty Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Pretty Room_2.jpg',0,0),(0020,'Wacko','Klong Sansab, Bangkok',2,1,'3',3,'ห้องสำหรับทำงานแบบส่วนตั๊วส่วนตัว! ถูกออกแบบให้เรียบง่ายและสงบ มี wifi, parking, air conditioner, board,แม่บ้าน','20','08:00','21:00','3',100,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Ugly Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Ugly Room_2.jpg',0,0),(0021,'Aeora','Klong Sansab, Bangkok',1,2,'50',50,'ถ้าต้องการหาพื้นที่ทำงานราคาถูก Aeora ตอบโจทย์คุณ! เพราะที่นี่มีสิ่งอำนวยความสะดวกครบ wifi, parking, air conditioner อีกทั้งยังเป็นที่ยอดฮิตสำหรับวัยรุ่นที่ต้องการอ่านหนังสืออีกด้วย','60','08:00','21:00','1',50,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Wow Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Wow Room_2.jpg',0,0),(0022,'Handy Mandy','Prawet, Bangkok',3,2,'1',1,'ห้องประชุมของเรา ออกแบบอย่างเรียบง่าย สบายตา เหมาะแก่การประชุมงานในสไตล์สบายๆ มีสิ่งอำนวยความสะดวกเหมือนอยู่บ้านตัวเอง เช่น wifi, parking, air conditioner, board ','60','09:00','20:00','14',120,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Jubu Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Jubu Land_2.jpg',0,0),(0023,'CraftWorks','Prawet, Bangkok',2,1,'4',4,'Private room เหมาะสำหรับ 4 ท่าน ออกแบบสไตล์ modern มีความเรียบง่ายและดูดี พื้นที่กว้างขวาง มี wifi, parking, air conditioner, board เอาไว้บริการท่านด้วย','40','09:00','20:00','4',100,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Jibi Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Jibi Land_2.jpg',0,0),(0024,'ART','Nongkham, Bangkok',1,1,'20',20,'สถานที่ที่เหมาะแก่การอ่านหนังสือ พบปะพูดคุย ทำงานในวันสบายๆ เพราะที่นี่ออกแบบให้เสมือนอยู่ที่บ้าน สิ่งอำนวยความสะดวกพร้อม (wifi, parking, air conditioner, แม่บ้าน)','60','08:00','21:00','1',60,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Maple Land_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Maple Land_2.jpg',0,0),(0025,'Kosirae','Nongjok, Bangkok',1,2,'20',20,'สถานที่กว้างขวาง มีพื้นที่จำนวนมากรองรับผู้ใช้งาน บรรยากาศเป็นกันเอง มี wifi, parking, air conditioner, แม่บ้าน จองกับเราสิ!','50','08:00','20:00','1',50,1,'https://coworkingspacebucket.s3.amazonaws.com/space/Tissue Room_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Tissue Room_2.jpg',0,0),(0026,'LECTURE','Suvanabhumi Airport, Samut Prakan',1,1,'5',5,'co working space ในสนามบินสุวรรณภูมิ เหมาะสำหรับท่านที่ต้องการทำงาน ใช้เวลาว่างกับการอ่านหนังสือ ตั้งอยู่ที่ทางออก 3 มี  wifi, parking, air conditioner, แม่บ้าน','50','08:00','21:00','1',80,11,'https://coworkingspacebucket.s3.amazonaws.com/space/Skyline_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/Skyline_2.jpg',0,0),(0027,'Little Green','Suan Siam, Bangkok',1,1,'5',5,'พื้นที่ทำงานสุดเรียบหรู เงียบสงบ คนไม่พลุกพล่าน มีสิ่งอำนวยความสะดวกที่เพียบพร้อม เดินทางสะดวกจากมอเตอร์เวย์เพียง 15 นาที!','30','09:00','20:00','10',90,1,'https://coworkingspacebucket.s3.amazonaws.com/space/ทดสอบแลนด์_1.jpg,https://coworkingspacebucket.s3.amazonaws.com/space/ทดสอบแลนด์_2.jpg',0,0);
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
  `state_review` int(10) DEFAULT '1',
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
INSERT INTO `history` VALUES (0000001,'2017-11-01','18.00','20.00',4,0002,0002,0),(0000002,'2017-10-29','10.00','20.00',4,0002,0002,0),(0000003,'2017-12-04','10.00','13.00',4,0009,0013,0);
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
  `approve_status` varchar(50) DEFAULT 'No Approve',
  PRIMARY KEY (`idmember`),
  UNIQUE KEY `idmember_UNIQUE` (`idmember`),
  KEY `idtype_member_idx` (`idtype_member`),
  CONSTRAINT `idtype_member` FOREIGN KEY (`idtype_member`) REFERENCES `type_member` (`idtype_member`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (0001,'Vipuwat','Kumpalanon','PoloYah','boyjame55','boyjameza04@gmail.com','0943211994',1,'https://coworkingspacebucket.s3.amazonaws.com/space/profileimgPoloYah.jpg','https://coworkingspacebucket.s3.amazonaws.com/space/idcardimgPoloYah.jpg','Approved'),(0002,'Rujapa','Chotisawatraksa','memiine','1234','memiinetest@hotmail.com','0943211995',2,'https://coworkingspacebucket.s3.amazonaws.com/space/profileimgmemiine.jpg','https://coworkingspacebucket.s3.amazonaws.com/space/idcardimgmemiine.jpg','Approved'),(0003,'teejuta','kaewtong','iamplaster','1234','iamplaster@hotmail.com','0943211996',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','Approved'),(0004,'tester','naja','tester','12345678','abcd@gmail.com','0123456789',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','Approved'),(0008,'trhstrhth','et5t5gw45g45','abcdefg','36985214','bcd@gmail.com','0963258741',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','Approved'),(0009,'thitiphat','manitchalermchai','thiti','1234','thiti@hotmail.com','0999999999',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','Approved'),(0010,'aum','aung','aa','1234','aumaung@hotmail.com','0966666666',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','Approved'),(0011,'pokky','naja','pokky','1234','pokky@hotmail.com','0900011100',1,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','No Approve'),(0012,'teter','lolopa','sissterr','12345678','sister@gmail.com','0943211234',2,'https://coworkingspacebucket.s3.amazonaws.com/space/teter_lolopa.jpg','https://coworkingspacebucket.s3.amazonaws.com/space/sissterr_teter_lolopa.','Approved'),(0013,'apichar','manop','apichar','12345678','apichar@gmail.com','0987654320',1,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','https://coworkingspacebucket.s3.amazonaws.com/space/idcardimgapichar.jpg','No Approve'),(0014,'ptaew','temerak','taew','87654321','teaw@gmail.com','0987654123',1,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','No Approve'),(0015,'Sehun','ohh','sehun','987654321','sehun@gmail.com','0963147852',2,'C:UsersAsusDocumentsNetBeansProjectsCoWorkingSpacewebimguser.png','Not verified','Approved');
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
  `date` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `sender` varchar(45) DEFAULT NULL,
  `receiver` varchar(45) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `status` int(10) DEFAULT '0',
  PRIMARY KEY (`idmessage`),
  UNIQUE KEY `idmessage_UNIQUE` (`idmessage`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (0004,'12/12/2017','20:14','PoloYaH','memiine','Test: tester',1);
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

-- Dump completed on 2017-12-13  4:21:07
