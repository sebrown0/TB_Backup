-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: test_bench
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_entity_action_insert`
--

DROP TABLE IF EXISTS `data_entity_action_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_action_insert` (
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `entity_action_type_id` int(10) unsigned NOT NULL,
  `entity_action_desc` varchar(1000) NOT NULL,
  `entity_action_data` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`entity_entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_action_insert`
--

LOCK TABLES `data_entity_action_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_action_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_entity_action_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_action_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_action_insert` FOR EACH ROW BEGIN
	 CALL create_entity_action(
		NEW.entity_id, 
        NEW.entity_entity_id, 
		NEW.entity_action_type_id,
		NEW.entity_action_desc, 
		NEW.entity_action_data);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_entity_insert`
--

DROP TABLE IF EXISTS `data_entity_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_insert` (
  `id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_desc` text,
  `creation_type` enum('AUTO','MAN') NOT NULL,
  `should_have_tool_tip` varchar(5) NOT NULL,
  `tool_tip_text` varchar(250) DEFAULT NULL,
  `new_version_category` enum('MAJOR','MINOR','BUILD') NOT NULL,
  `entity_parent_id` int(10) unsigned NOT NULL COMMENT 'id	entity_test_id	entity_test_name	entity_id	created_by_employee_id	entity_test_parent	description	initial_value	expected_value	received_value	insert_value	failure_halts_test	test_category_primary	test_category_secondary	test_created\n',
  `entity_parent_entity_id` int(10) unsigned NOT NULL COMMENT 'id	entity_test_id	entity_test_name	entity_id	created_by_employee_id	entity_test_parent	description	initial_value	expected_value	received_value	insert_value	failure_halts_test	test_category_primary	test_category_secondary	test_created\n',
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`,`entity_name`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entityParentId INT UNSIGNED,\n    IN entityParentEntityId INT UNSIGNED,\n    ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_insert`
--

LOCK TABLES `data_entity_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_entity_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_insert` FOR EACH ROW BEGIN
	CALL create_new_entity(
		NEW.id,
		NEW.entity_id, 
        NEW.entity_name, 
        NEW.entity_type_name, 
        NEW.entity_desc, 
        NEW.creation_type, 
        NEW.entity_parent_id, 
        NEW.entity_parent_entity_id, 
        NEW.should_have_tool_tip,
        NEW.tool_tip_text,
        NEW.new_version_category);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_entity_test_insert`
--

DROP TABLE IF EXISTS `data_entity_test_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_test_insert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_row_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_name` varchar(200) NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `created_by_employee_id` varchar(45) NOT NULL,
  `entity_test_parent_row_id` int(10) unsigned DEFAULT NULL,
  `entity_test_parent_id` int(10) unsigned DEFAULT NULL,
  `description` text,
  `test_function` varchar(250) NOT NULL COMMENT 'Value at the start of the test',
  `data_in` text COMMENT 'Expected value at the end of the test',
  `data_out` text COMMENT 'Value from another source',
  `data_expected` text COMMENT 'Value at the start of the test',
  `failure_halts_test` tinyint(4) NOT NULL DEFAULT '0',
  `test_category_primary` varchar(45) NOT NULL,
  `test_category_secondary` varchar(45) DEFAULT NULL,
  `test_created` date NOT NULL,
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_test_row_id`,`entity_test_id`,`entity_test_name`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`),
  UNIQUE KEY `entity_test_id_UNIQUE` (`entity_test_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_test_row_id_UNIQUE` (`entity_test_row_id`),
  KEY `fk_entity_test_employee1_idx` (`created_by_employee_id`),
  CONSTRAINT `fk_entity_test_employee10` FOREIGN KEY (`created_by_employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='	IN id INT UNSIGNED, IN entityTestId INT UNSIGNED, IN entityId INT UNSIGNED, IN entityEntityId INT UNSIGNED, \n	IN entityTestName VARCHAR(200), IN createdByEmployeeId VARCHAR(45), IN entityTestDesc VARCHAR(1000), \n    IN testFunction VARCHAR(1000), IN dataIn VARCHAR(1000), IN dataOut VARCHAR(1000), IN dataExpected VARCHAR(1000), \n    IN failureHaltsTest TINYINT, IN primaryTestCat VARCHAR(1000), IN secondaryTestCat VARCHAR(1000),\n    IN testCreated DATE, IN newVerCat ENUM(''MAJOR'', ''MINOR'', ''BUILD''), \n    IN parentId INT UNSIGNED, IN parentEntityTestId INT UNSIGNED,\n    IN lastRunDate DATE, IN lastRunTime TIME)\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_test_insert`
--

LOCK TABLES `data_entity_test_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_test_insert` DISABLE KEYS */;
INSERT INTO `data_entity_test_insert` VALUES (1,42,42,'Top Level of: Authorisations Form',42,42,'SB_1',16,16,'This is the top level test for Authorisations Form. For this to pass all its children must pass.','','','','',0,'Group Controls','Group Data','2021-05-17','N\r'),(2,43,43,'Company',43,43,'SB_1',42,42,'TODO - Enter Description','-','-','-','Company',0,'Data Out','NA','2021-05-17','N\r'),(3,44,44,'Company Combo',44,44,'SB_1',42,42,'TODO - Enter Description','Peform function based on value','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',0,'NA  ','NA','2021-05-17','N\r'),(4,45,45,'Grouping View ',45,45,'SB_1',42,42,'TODO - Enter Description','-','-','-','Grouping View ',0,'Data Out','NA','2021-05-17','N\r'),(5,46,46,'Grouping View Combo',46,46,'SB_1',42,42,'TODO - Enter Description','Peform function based on value','-','-','Authorisation Group A~GROUP B~General Group~View All Groups',0,'NA  ','NA','2021-05-17','N\r'),(6,47,47,'Top Level of: Accept Criteria',47,47,'SB_1',42,42,'This is the top level test for Accept Criteria. For this to pass all its children must pass.','','','','',0,'Perform Function','NA','2021-05-17','N\r'),(7,48,48,'Top Level of: Authorisations Grid',48,48,'SB_1',42,42,'This is the top level test for Authorisations Grid. For this to pass all its children must pass.','','','','',0,'Data Out','Data In','2021-05-17','N\r');
/*!40000 ALTER TABLE `data_entity_test_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_test_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_test_insert` FOR EACH ROW BEGIN
	CALL `create_new_entity_test_case`(		
		NEW.entity_test_row_id, 
		NEW.entity_test_id, 
        NEW.entity_id, 
        NEW.entity_entity_id,
        NEW.entity_test_name,
		NEW.created_by_employee_id, 
        NEW.`description`, 
        NEW.test_function, 
        NEW.data_in, 
        NEW.data_out, 
        NEW.data_expected, 
		NEW.failure_halts_test,          
        NEW.test_category_primary, 
        NEW.test_category_secondary,
        NEW.test_created, 
        'MAJOR',
        NEW.entity_test_parent_row_id,
        NEW.entity_test_parent_id,
        NULL, NULL);        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_test_suite_insert`
--

DROP TABLE IF EXISTS `data_test_suite_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_test_suite_insert` (
  `row_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL COMMENT 'row_id	test_suite_id	test_suite_name	test_suite_parent_row_id	test_suite_parent_id	category_type_name	endl\n\n',
  `test_suite_name` varchar(45) NOT NULL,
  `test_suite_parent_row_id` int(10) unsigned DEFAULT NULL,
  `test_suite_parent_id` int(10) unsigned DEFAULT NULL,
  `test_suite_notes` text,
  `category_type_name` varchar(500) NOT NULL,
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_test_suite_insert`
--

LOCK TABLES `data_test_suite_insert` WRITE;
/*!40000 ALTER TABLE `data_test_suite_insert` DISABLE KEYS */;
INSERT INTO `data_test_suite_insert` VALUES (42,42,'Authorisations Form',16,16,'ADD TEST SUITE NOTES','Form','N\r'),(47,47,'Accept Criteria',42,42,'ADD TEST SUITE NOTES','Button - Function','N\r'),(48,48,'Authorisations Grid',42,42,'ADD TEST SUITE NOTES','Grid','N\r');
/*!40000 ALTER TABLE `data_test_suite_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_test_suite_insert_AFTER_INSERT` AFTER INSERT ON `data_test_suite_insert` FOR EACH ROW BEGIN
	CALL create_new_test_suite(
			NEW.row_id, 
            NEW.test_suite_id, 
			NEW.test_suite_name, 
            NEW.test_suite_notes, 
			NEW.test_suite_parent_row_id, 
            NEW.test_suite_parent_id, 
			'MAJOR');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_version_to_do`
--

DROP TABLE IF EXISTS `data_version_to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_version_to_do` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `todo_desc` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_version_to_do`
--

LOCK TABLES `data_version_to_do` WRITE;
/*!40000 ALTER TABLE `data_version_to_do` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_version_to_do` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_version_to_do_AFTER_INSERT` AFTER INSERT ON `data_version_to_do` FOR EACH ROW BEGIN
	CALL create_entity_todo(NEW.entity_id, NEW.todo_desc);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `employee_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`employee_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_email_employee_idx` (`employee_id`),
  CONSTRAINT `fk_email_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'sbrown@dakarsoftware.com','','SB_1\r');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `employee_type_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_employee_employee_type1_idx` (`employee_type_id`),
  CONSTRAINT `fk_employee_employee_type1` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('SB_1','Steve','Brown','1\r');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_type` (
  `id` varchar(10) NOT NULL,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_type`
--

LOCK TABLES `employee_type` WRITE;
/*!40000 ALTER TABLE `employee_type` DISABLE KEYS */;
INSERT INTO `employee_type` VALUES ('1','QA\r'),('2','Developer\r');
/*!40000 ALTER TABLE `employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(100) NOT NULL,
  `entity_details_id` int(10) unsigned DEFAULT NULL,
  `entity_type_id` int(10) unsigned NOT NULL,
  `entity_type_entity_type_name` varchar(45) NOT NULL COMMENT 'The entiry''s parent.\nZero = no parent',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `parent_entity_id` int(10) unsigned DEFAULT NULL,
  `entity_help_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_entity_type_details1_idx` (`entity_details_id`,`id`),
  KEY `fk_entity_entity_type1_idx` (`entity_type_id`,`entity_type_entity_type_name`),
  KEY `fk_entity_entity3_idx` (`entity_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_entity4_idx` (`entity_id`),
  KEY `fk_entity_entity1_idx` (`parent_id`,`parent_entity_id`),
  KEY `fk_entity_entity_help1_idx` (`entity_help_id`,`id`),
  CONSTRAINT `fk_entity_entity1` FOREIGN KEY (`parent_id`, `parent_entity_id`) REFERENCES `entity` (`id`, `entity_id`),
  CONSTRAINT `fk_entity_entity_help1` FOREIGN KEY (`entity_help_id`, `id`) REFERENCES `entity_help` (`id`, `entity_id`),
  CONSTRAINT `fk_entity_entity_type1` FOREIGN KEY (`entity_type_id`, `entity_type_entity_type_name`) REFERENCES `entity_type` (`id`, `entity_type_name`),
  CONSTRAINT `fk_entity_entity_type_details1` FOREIGN KEY (`entity_details_id`, `id`) REFERENCES `entity_details` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` VALUES (1,1,'Root',1,1,'Root',0,0,1),(2,2,'Dakar Web',2,2,'Application',1,1,2),(3,3,'Login Screen',3,6,'Form',2,2,0),(5,5,'User Name',5,18,'Text In',3,3,5),(7,7,'User Password',7,18,'Text In',3,3,0),(8,8,'Login Button',8,23,'Button - Redirect',3,3,8),(9,9,'Home Page',9,8,'Parent Form',8,8,9),(10,10,'Home Page Info Bar',10,11,'Info Bar',9,9,10),(11,11,'Dakar Logo',11,13,'Image',10,10,11),(12,12,'Current Module Indicator',12,21,'Label',10,10,12),(13,13,'Menu Toggle',13,25,'Button - Function',10,10,13),(14,14,'Current Company',14,20,'Combo',10,10,14),(15,15,'Home Page Top Right Nav Bar',15,10,'Nav Bar',9,9,0),(16,16,'Authorisations',16,24,'Button - Display',15,15,16),(17,17,'Employee Creation Wizard',17,24,'Button - Display',15,15,17),(18,18,'Employee CV',18,24,'Button - Display',15,15,18),(19,19,'Employee Grid View',19,24,'Button - Display',15,15,19),(20,20,'Visual Reports',20,24,'Button - Display',15,15,20),(21,21,'Dakar Intelligence',21,24,'Button - Display',15,15,21),(22,22,'Organisation Chart',22,24,'Button - Display',15,15,22),(23,23,'My Company / Last Viewed',23,24,'Button - Display',15,15,23),(24,24,'All Notifications',24,24,'Button - Display',15,15,24),(25,25,'New Employments',25,24,'Button - Display',15,15,25),(26,26,'Terminations',26,24,'Button - Display',15,15,26),(27,27,'Quick Links',27,24,'Button - Display',15,15,27),(28,28,'User Avatar',28,24,'Button - Display',15,15,28),(29,29,'Main Menu',29,10,'Nav Bar',9,9,29),(30,30,'Main Menu - Payroll',30,10,'Nav Bar',29,29,30),(31,31,'Employee List',31,24,'Button - Display',30,30,0),(32,32,'Documents',32,24,'Button - Display',30,30,0),(33,33,'Employee Others',33,24,'Button - Display',30,30,33),(34,34,'Payroll',34,24,'Button - Display',30,30,34),(35,35,'Payroll Statistics',35,24,'Button - Display',30,30,35),(36,36,'Absence Statistics',36,24,'Button - Display',30,30,36),(37,37,'Reports',37,24,'Button - Display',30,30,37),(38,38,'Monthly Reports',38,24,'Button - Display',30,30,38),(39,39,'Yearly Reports',39,24,'Button - Display',30,30,39),(40,40,'Bulk Updates',40,24,'Button - Display',30,30,40),(41,41,'Settings',41,24,'Button - Display',30,30,41),(42,42,'Authorisations Form',42,6,'Form',16,16,42),(43,43,'Company',43,21,'Label',42,42,43),(44,44,'Company Combo',44,20,'Combo',42,42,44),(45,45,'Grouping View ',45,21,'Label',42,42,45),(46,46,'Grouping View Combo',46,20,'Combo',42,42,46),(47,47,'Accept Criteria',47,25,'Button - Function',42,42,47),(48,48,'Authorisations Grid',48,12,'Grid',42,42,48),(49,49,'Employee Creation Wizard - Step 1',49,6,'Form',17,17,49),(50,50,'Name',50,18,'Text In',49,49,50),(51,51,'Surname',51,18,'Text In',49,49,51),(52,52,'Identity Card Number',52,18,'Text In',49,49,52),(53,53,'Employee Code',53,18,'Text In',49,49,53),(54,54,'Address',54,18,'Text In',49,49,54),(55,55,'Street',55,18,'Text In',49,49,55),(56,56,'Post Code',56,18,'Text In',49,49,56),(57,57,'Select A Town',57,15,'List',49,49,57),(58,58,'Select A Country',58,15,'List',49,49,58),(59,59,'Back',59,25,'Button - Function',49,49,59),(60,60,'Continue',60,25,'Button - Function',49,49,60),(61,61,'Employee Creation Wizard - Step 2',61,6,'Form',17,17,61),(62,62,'Select A Gender',62,18,'Text In',61,61,62),(63,63,'Date Of Birth',63,18,'Text In',61,61,63),(64,64,'Date Of Employment',64,18,'Text In',61,61,64),(65,65,'Tax Number',65,18,'Text In',61,61,65),(66,66,'NI Number',66,18,'Text In',61,61,66),(67,67,'Select A Bank',67,15,'List',61,61,67),(68,68,'IBAN Number',68,18,'Text In',61,61,68),(69,69,'Email Address',69,18,'Text In',61,61,69),(70,70,'Mobile Number',70,18,'Text In',61,61,70),(71,71,'Back',71,25,'Button - Function',61,61,71),(72,72,'Continue',72,25,'Button - Function',61,61,72),(73,73,'Employee Creation Wizard - Step 3',73,6,'Form',17,17,73),(74,74,'Select A Tax Status',74,15,'List',73,73,74),(75,75,'Select An Employment Type',75,15,'List',73,73,75),(76,76,'Select Company',76,15,'List',73,73,76),(77,77,'Select A Paygroup',77,15,'List',73,73,77),(78,78,'Select A Department',78,15,'List',73,73,78),(79,79,'Select a Schedule',79,15,'List',73,73,79),(80,80,'Full or Part Timer ?',80,15,'List',73,73,80),(81,81,'Special Part Timer',81,15,'List',73,73,81),(82,82,'Select a Grade',82,15,'List',73,73,82),(83,83,'Select a Cost Center',83,15,'List',73,73,83),(84,84,'Back',84,25,'Button - Function',73,73,84),(85,85,'Continue',85,25,'Button - Function',73,73,85),(86,86,'Employee Creation Wizard - Step 4',86,6,'Form',17,17,86),(87,87,'Taxable Allowance 1 (Permenant)',87,15,'List',86,86,87),(88,88,'Allowance Amount - Permanent',88,18,'Text In',86,86,88),(89,89,'Taxable Allowance 2 (Permenant)',89,15,'List',86,86,89),(90,90,'Allowance Amount - Permanent',90,18,'Text In',86,86,90),(91,91,'Non Taxable Allowance 1 (Permenant)',91,15,'List',86,86,91),(92,92,'Allowance Amount - Permanent',92,18,'Text In',86,86,92),(93,93,'Non Taxable Allowance 2 (Permenant)',93,15,'List',86,86,93),(94,94,'Back',94,25,'Button - Function',86,86,94),(95,95,'Continue',95,25,'Button - Function',86,86,95),(96,96,'Employee Creation Wizard - Step 5',96,6,'Form',17,17,96),(97,97,'Annual Salary',97,18,'Text In',96,96,97),(98,98,'Hourly Rate',98,18,'Text In',96,96,98),(99,99,'Back',99,25,'Button - Function',96,96,99),(100,100,'Create Employee',100,25,'Button - Function',96,96,100),(101,101,'Heading ECW Step 1',101,21,'Label',49,49,101),(102,102,'Heading ECW Step 2',102,21,'Label',61,61,102),(103,103,'Heading ECW Step 3',103,21,'Label',73,73,103),(104,104,'Heading ECW Step 4',104,21,'Label',86,86,104),(105,105,'Heading ECW Step 5',105,21,'Label',96,96,105),(106,106,'Employee Creation Wizard',106,6,'Form',17,17,106),(107,107,'Employee Creation Wizard - Title',107,6,'Form',106106,0,107);
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_action`
--

DROP TABLE IF EXISTS `entity_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_action_desc` varchar(1000) NOT NULL,
  `entity_action_function` varchar(250) NOT NULL,
  `entity_action_data_in` text COMMENT 'Any data the entity might need, i.e. user name.',
  `entity_action_data_out` text COMMENT 'Any data the entity might need, i.e. user name.',
  `entity_action_data_expected` text COMMENT 'Any data the entity might need, i.e. user name.',
  `entity_action_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`),
  KEY `fk_entity_action_entity_action_type1_idx` (`entity_action_type_id`),
  CONSTRAINT `fk_entity_action_entity_action_type1` FOREIGN KEY (`entity_action_type_id`) REFERENCES `entity_action_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action`
--

LOCK TABLES `entity_action` WRITE;
/*!40000 ALTER TABLE `entity_action` DISABLE KEYS */;
INSERT INTO `entity_action` VALUES (2,5,'Enter the user name','Enter data','steveb','-','-',2),(4,7,'User password entry','Enter data','1234','-','-',2),(5,8,'Redirect the user to the Dakar Web homepage','Redirect to different page','-','-','-',1),(6,11,'Image: Dakar Logo','-','-','-','logo.png',3),(7,12,'Label: Current Module Indicator label text','-','-','-','Payroll',3),(8,13,'Button Function: Menu Toggle - Should toggle the view of the main menu show/hide.','Perform function','-','-','-',1),(9,14,'Combo: Current Company - Displays current company and list of all available companies. User can select the current company from here.','Peform function based on value','-','-','Mars~Mars Incorporated Ltd',5),(10,16,'Button Display: Authorisations - Display form','Display child','-','-','-',3),(11,17,'Button Display: Employee Creation Wizard ','Display child','-','-','-',1),(12,18,'Button Display: Employee CV','Display child','-','-','-',1),(13,19,'Button Display: Employee Grid View','Display child','-','-','-',1),(14,20,'Button Display: Visual Reports','Display child','-','-','-',1),(15,21,'Button Display: Dakar Intelligence','Display child','-','-','-',1),(16,22,'Button Display: Organisation Chart','Display child','-','-','-',1),(17,23,'Button Display: My Company / Last Viewed','Display child','-','-','-',1),(18,24,'Button Display: All Notifications','Display child','-','-','-',1),(19,25,'Button Display: New Employments','Display child','-','-','-',1),(20,26,'Button Display: Terminations','Display child','-','-','-',1),(21,27,'Button Display: Quick Links','Display child','-','-','-',1),(22,28,'Button Display: User Avatar','Display child','-','-','-',1),(23,31,'Button Display: Employee List','Display child','-','-','-',1),(24,32,'Button Display: Documents','Display child','-','-','-',1),(25,33,'Button Display: Employee Others','Display child','-','-','-',1),(26,34,'Button Display: Payroll','Display child','-','-','-',1),(27,35,'Button Display: Payroll Statistics','Display child','-','-','-',1),(28,36,'Button Display: Absence Statistics','Display child','-','-','-',1),(29,37,'Button Display: Reports','Display child','-','-','-',1),(30,38,'Button Display: Monthly Reports','Display child','-','-','-',1),(31,39,'Button Display: Yearly Reports','Display child','-','-','-',1),(32,40,'Button Display: Bulk Updates','Display child','-','-','-',1),(33,41,'Button Display: Settings','Display child','-','-','-',1),(34,43,'Label: Company label text','-','-','-','Company',3),(35,44,'Combo: Company Combo','Peform function based on value','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',5),(36,45,'Label: Grouping View  label text','-','-','-','Grouping View ',3),(37,46,'Combo: Grouping View Combo - ENTER ENTITY DESCRIPTION','Peform function based on value','-','-','Authorisation Group A~GROUP B~General Group~View All Groups',5),(38,47,'Button Function: Accept Criteria - Should apply the criteria and load matching records.','Perform function','-','-','-',1),(39,50,'Text Box Enter Data: Name','Enter data','TODO - Enter text that should be entered.','-','-',2),(40,51,'Text Box Enter Data: Surname','Enter data','TODO - Enter text that should be entered.','-','-',2),(41,52,'Text Box Enter Data: Identity Card Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(42,53,'Text Box Enter Data: Employee Code','Enter data','TODO - Enter text that should be entered.','-','-',2),(43,54,'Text Box Enter Data: Address','Enter data','TODO - Enter text that should be entered.','-','-',2),(44,55,'Text Box Enter Data: Street','Enter data','TODO - Enter text that should be entered.','-','-',2),(45,56,'Text Box Enter Data: Post Code','Enter data','TODO - Enter text that should be entered.','-','-',2),(46,57,'List: Select A Town. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(47,58,'List: Select A Country. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(48,59,'Button Function: Back - Should do nothing as this is the first step.','Perform function','-','-','-',1),(49,60,'Button Function: Continue - Should validate the data in step 1 and move to step 2.','Perform function','-','-','-',1),(50,62,'Text Box Enter Data: Select A Gender','Enter data','TODO - Enter text that should be entered.','-','-',2),(51,63,'Text Box Enter Data: Date Of Birth','Enter data','TODO - Enter text that should be entered.','-','-',2),(52,64,'Text Box Enter Data: Date Of Employment','Enter data','TODO - Enter text that should be entered.','-','-',2),(53,65,'Text Box Enter Data: Tax Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(54,66,'Text Box Enter Data: NI Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(55,67,'List: Select A Bank. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(56,68,'Text Box Enter Data: IBAN Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(57,69,'Text Box Enter Data: Email Address','Enter data','TODO - Enter text that should be entered.','-','-',2),(58,70,'Text Box Enter Data: Mobile Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(59,71,'Button Function: Back - Take the user back to step 1','Perform function','-','-','-',1),(60,72,'Button Function: Continue - Should validate the data in step 2 and move to step 3.','Perform function','-','-','-',1),(61,74,'List: Select A Tax Status. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(62,75,'List: Select An Employment Type. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(63,76,'List: Select Company. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(64,77,'List: Select A Paygroup. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(65,78,'List: Select A Department. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(66,79,'List: Select a Schedule. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(67,80,'List: Full or Part Timer ?. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(68,81,'List: Special Part Timer. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(69,82,'List: Select a Grade. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(70,83,'List: Select a Cost Center. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(71,84,'Button Function: Back - Take the user back to step 2','Perform function','-','-','-',1),(72,85,'Button Function: Continue - Should validate the data in step 3 and move to step 4.','Perform function','-','-','-',1),(73,87,'List: Taxable Allowance 1 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(74,88,'Text Box Enter Data: Allowance Amount - Permanent','Enter data','TODO - Enter text that should be entered.','-','-',2),(75,89,'List: Taxable Allowance 2 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(76,90,'Text Box Enter Data: Allowance Amount - Permanent','Enter data','TODO - Enter text that should be entered.','-','-',2),(77,91,'List: Non Taxable Allowance 1 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(78,92,'Text Box Enter Data: Allowance Amount - Permanent','Enter data','TODO - Enter text that should be entered.','-','-',2),(79,93,'List: Non Taxable Allowance 2 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(80,94,'Button Function: Back - Take the user back to step 3','Perform function','-','-','-',1),(81,95,'Button Function: Continue - Should validate the data in step 4 and move to step 5.','Perform function','-','-','-',1),(82,97,'Text Box Enter Data: Annual Salary','Enter data','TODO - Enter text that should be entered.','-','-',2),(83,98,'Text Box Enter Data: Hourly Rate','Enter data','TODO - Enter text that should be entered.','-','-',2),(84,99,'Button Function: Back - Take the user back to step 4','Perform function','-','-','-',1),(85,100,'Button Function: Create Employee - Should create the employee if data is valid. Else the user should be shown the invalid data.','Perform function','-','-','-',1),(86,101,'Label: Heading ECW Step 1','-','-','-','Basic Details',3),(87,102,'Label: Heading ECW Step 2','-','-','-','Basic Details',3),(88,103,'Label: Heading ECW Step 3','-','-','-','Payroll Related Details',3),(89,104,'Label: Heading ECW Step 4','-','-','-','Permanent Allowances',3),(90,105,'Label: Heading ECW Step 5','-','-','-','Salary Details',3);
/*!40000 ALTER TABLE `entity_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_action_type`
--

DROP TABLE IF EXISTS `entity_action_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_action_type` (
  `id` int(10) unsigned NOT NULL,
  `entity_action_type_parent_id` int(10) unsigned NOT NULL,
  `entity_action_type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`entity_action_type_parent_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_action_type_entity_action_type1_idx` (`entity_action_type_parent_id`),
  CONSTRAINT `fk_entity_action_type_entity_action_type1` FOREIGN KEY (`entity_action_type_parent_id`) REFERENCES `entity_action_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action_type`
--

LOCK TABLES `entity_action_type` WRITE;
/*!40000 ALTER TABLE `entity_action_type` DISABLE KEYS */;
INSERT INTO `entity_action_type` VALUES (1,1,'Click\r'),(2,2,'Data In\r'),(3,3,'Data Out\r'),(4,4,'Data InOut\r'),(5,5,'Function\r'),(6,6,'Select');
/*!40000 ALTER TABLE `entity_action_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_can_have_action`
--

DROP TABLE IF EXISTS `entity_can_have_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_can_have_action` (
  `entity_action_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_action_id`,`entity_id`,`entity_entity_id`),
  UNIQUE KEY `entity_id_version_action_id` (`entity_action_id`),
  KEY `fk_entity_can_have_action_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_can_have_action_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_has_entity_action_entity_action1` FOREIGN KEY (`entity_action_id`, `entity_id`) REFERENCES `entity_action` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_can_have_action`
--

LOCK TABLES `entity_can_have_action` WRITE;
/*!40000 ALTER TABLE `entity_can_have_action` DISABLE KEYS */;
INSERT INTO `entity_can_have_action` VALUES (2,5,5),(4,7,7),(5,8,8),(6,11,11),(7,12,12),(8,13,13),(9,14,14),(10,16,16),(11,17,17),(12,18,18),(13,19,19),(14,20,20),(15,21,21),(16,22,22),(17,23,23),(18,24,24),(19,25,25),(20,26,26),(21,27,27),(22,28,28),(23,31,31),(24,32,32),(25,33,33),(26,34,34),(27,35,35),(28,36,36),(29,37,37),(30,38,38),(31,39,39),(32,40,40),(33,41,41),(34,43,43),(35,44,44),(36,45,45),(37,46,46),(38,47,47),(39,50,50),(40,51,51),(41,52,52),(42,53,53),(43,54,54),(44,55,55),(45,56,56),(46,57,57),(47,58,58),(48,59,59),(49,60,60),(50,62,62),(51,63,63),(52,64,64),(53,65,65),(54,66,66),(55,67,67),(56,68,68),(57,69,69),(58,70,70),(59,71,71),(60,72,72),(61,74,74),(62,75,75),(63,76,76),(64,77,77),(65,78,78),(66,79,79),(67,80,80),(68,81,81),(69,82,82),(70,83,83),(71,84,84),(72,85,85),(73,87,87),(74,88,88),(75,89,89),(76,90,90),(77,91,91),(78,92,92),(79,93,93),(80,94,94),(81,95,95),(82,97,97),(83,98,98),(84,99,99),(85,100,100),(86,101,101),(87,102,102),(88,103,103),(89,104,104),(90,105,105);
/*!40000 ALTER TABLE `entity_can_have_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_details`
--

DROP TABLE IF EXISTS `entity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `description` text,
  `date_added` date NOT NULL,
  `creation_type` enum('AUTO','MAN') NOT NULL DEFAULT 'MAN' COMMENT 'AUTO: The test was not in the DB when run from the TestBench (TB) so the TB added it to this DB.\nMAN: The test was added to this DB before it was run in the TB.\n\nNote: the name of the test case should match that in the TB or another TC will be added.',
  `last_tested_date` date DEFAULT NULL,
  `last_tested_time` time DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_details`
--

LOCK TABLES `entity_details` WRITE;
/*!40000 ALTER TABLE `entity_details` DISABLE KEYS */;
INSERT INTO `entity_details` VALUES (1,1,'The root entity has no purpose except be the parent of all other entities.','2021-05-16','MAN','1900-01-01','00:00:00'),(2,2,'The Dakar Web App','2021-05-16','MAN','1900-01-01','00:00:00'),(3,3,'The login screen that a user first encounters','2021-05-16','MAN','2021-05-17','16:24:46'),(5,5,'Text box entry for user name','2021-05-16','MAN','2021-05-17','16:24:37'),(7,7,'Text box entry for user password','2021-05-16','MAN','2021-05-17','16:24:40'),(8,8,'Click to login with user name & password','2021-05-16','MAN','2021-05-17','16:24:42'),(9,9,'Homepage of Dakar Web App','2021-05-16','MAN','2021-05-17','16:48:19'),(10,10,'Top left info bar. Displays - 1: Logo 2: Current module 3:Full Screen Icon 4: TCL Icon 5: Current Company','2021-05-16','MAN','2021-05-17','16:28:49'),(11,11,'Dakar logo image','2021-05-16','MAN','1900-01-01','00:00:00'),(12,12,'Displays the currentlt selected module','2021-05-16','MAN','2021-05-17','16:27:38'),(13,13,'Toggles the view of the main menu','2021-05-16','MAN','2021-05-17','16:27:46'),(14,14,'Displays current company and list of all available companies','2021-05-16','MAN','2021-05-17','16:28:37'),(15,15,'Provides shortcuts to app elements. Also is the only way to swap between modules.','2021-05-16','MAN','2021-05-17','16:32:30'),(16,16,'Displays the authorisations form','2021-05-16','MAN','2021-05-17','16:29:00'),(17,17,'Displays the employee creation wizard form','2021-05-16','MAN','2021-05-17','16:29:05'),(18,18,'Displays the employee CV form','2021-05-16','MAN','2021-05-17','16:29:09'),(19,19,'Displays the employee grid view form','2021-05-16','MAN','2021-05-17','16:29:14'),(20,20,'Displays the summary graphs form','2021-05-16','MAN','2021-05-17','16:29:19'),(21,21,'Displays the DI form','2021-05-16','MAN','2021-05-17','16:29:22'),(22,22,'Displays the organisation chart form','2021-05-16','MAN','2021-05-17','16:29:31'),(23,23,'Displays the last  viewed popup form','2021-05-16','MAN','2021-05-17','16:31:20'),(24,24,'Displays the last  all notifications popup form. Displays total notifications (if there are any)','2021-05-16','MAN','2021-05-17','16:31:26'),(25,25,'Displays the new employments popup form.','2021-05-16','MAN','2021-05-17','16:31:32'),(26,26,'Displays the terminations popup form.','2021-05-16','MAN','2021-05-17','16:31:34'),(27,27,'Displays the quick links popup form.','2021-05-16','MAN','2021-05-17','16:31:43'),(28,28,'Displays the user config/action popup form. Displays the user image if setup.','2021-05-16','MAN','2021-05-17','16:32:09'),(29,29,'Main navigation bar for the currently selected module in the app.','2021-05-16','MAN','2021-05-17','16:34:06'),(30,30,'Main navigation bar for the payroll module.','2021-05-16','MAN','2021-05-17','16:33:26'),(31,31,'Display the Employee List form.','2021-05-16','MAN','2021-05-17','16:33:29'),(32,32,'Display the Employee Document form.','2021-05-16','MAN','2021-05-17','16:33:31'),(33,33,'Display the Employee Others sub menu.','2021-05-16','MAN','2021-05-17','16:33:33'),(34,34,'Display the Payroll sub menu.','2021-05-16','MAN','2021-05-17','16:33:35'),(35,35,'Display the Employee Statistics sub menu.','2021-05-16','MAN','2021-05-17','16:33:40'),(36,36,'Display the Absence Statistics sub menu.','2021-05-16','MAN','2021-05-17','16:33:43'),(37,37,'Display the Reports sub menu.','2021-05-16','MAN','2021-05-17','16:33:46'),(38,38,'Display the Monthly Payroll Reports form.','2021-05-16','MAN','2021-05-17','16:33:48'),(39,39,'Display the Yearly Payroll Reports form.','2021-05-16','MAN','2021-05-17','16:33:53'),(40,40,'Display the Bulk Updates sub menu.','2021-05-16','MAN','2021-05-17','16:33:55'),(41,41,'Display the Settings form.','2021-05-16','MAN','2021-05-17','16:34:02'),(42,42,'Has a grid view of the authorisations for the selected company','2021-05-17','MAN','1900-01-01','00:00:00'),(43,43,'Describes the company combo box','2021-05-17','MAN','1900-01-01','00:00:00'),(44,44,'Select & set the current company in authorisations','2021-05-17','MAN','1900-01-01','00:00:00'),(45,45,'Describes the Grouping View combo','2021-05-17','MAN','1900-01-01','00:00:00'),(46,46,'Select & set the grouping view','2021-05-17','MAN','1900-01-01','00:00:00'),(47,47,'Sets the chosen criteria','2021-05-17','MAN','1900-01-01','00:00:00'),(48,48,'Displays the authorisations for the selected criteria','2021-05-17','MAN','1900-01-01','00:00:00'),(49,49,'Step 1 of the employee creation wizard','2021-05-17','MAN','1900-01-01','00:00:00'),(50,50,'Enter employee name','2021-05-17','MAN','1900-01-01','00:00:00'),(51,51,'Enter employee surname','2021-05-17','MAN','1900-01-01','00:00:00'),(52,52,'Enter employee ID card number','2021-05-17','MAN','1900-01-01','00:00:00'),(53,53,'Enter employee code','2021-05-17','MAN','1900-01-01','00:00:00'),(54,54,'Enter employee address','2021-05-17','MAN','1900-01-01','00:00:00'),(55,55,'Enter employee street','2021-05-17','MAN','1900-01-01','00:00:00'),(56,56,'Enter employee post code','2021-05-17','MAN','1900-01-01','00:00:00'),(57,57,'Select employee town','2021-05-17','MAN','1900-01-01','00:00:00'),(58,58,'Select employee country','2021-05-17','MAN','1900-01-01','00:00:00'),(59,59,'Take the user to the previous step','2021-05-17','MAN','1900-01-01','00:00:00'),(60,60,'Take the user to the next step','2021-05-17','MAN','1900-01-01','00:00:00'),(61,61,'Step 2 of the employee creation wizard','2021-05-17','MAN','1900-01-01','00:00:00'),(62,62,'Enter the employee gender','2021-05-17','MAN','1900-01-01','00:00:00'),(63,63,'Enter the employee DOB','2021-05-17','MAN','1900-01-01','00:00:00'),(64,64,'Enter the employee date of employment','2021-05-17','MAN','1900-01-01','00:00:00'),(65,65,'Enter the employee tax number','2021-05-17','MAN','1900-01-01','00:00:00'),(66,66,'Enter the employee NI number','2021-05-17','MAN','1900-01-01','00:00:00'),(67,67,'Select a bank from the list','2021-05-17','MAN','1900-01-01','00:00:00'),(68,68,'Enter the employee IBAN number','2021-05-17','MAN','1900-01-01','00:00:00'),(69,69,'Enter the employee email address','2021-05-17','MAN','1900-01-01','00:00:00'),(70,70,'Enter the employee mobile number','2021-05-17','MAN','1900-01-01','00:00:00'),(71,71,'Take the user to the previous step','2021-05-17','MAN','1900-01-01','00:00:00'),(72,72,'Take the user to the next step','2021-05-17','MAN','1900-01-01','00:00:00'),(73,73,'Step 3 of the employee creation wizard','2021-05-18','MAN','1900-01-01','00:00:00'),(74,74,'Select tax status from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(75,75,'Select employment type from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(76,76,'Select company from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(77,77,'Select paygroup from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(78,78,'Select department from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(79,79,'Select schedule from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(80,80,'Select employment type from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(81,81,'Select if the employee is a special part timer or not','2021-05-18','MAN','1900-01-01','00:00:00'),(82,82,'Select a grade from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(83,83,'Select a cost center from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(84,84,'Take the user to the previous step','2021-05-18','MAN','1900-01-01','00:00:00'),(85,85,'Take the user to the next step','2021-05-18','MAN','1900-01-01','00:00:00'),(86,86,'Step 4 of the employee creation wizard','2021-05-18','MAN','1900-01-01','00:00:00'),(87,87,'Select a taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(88,88,'Enter the allowance amount','2021-05-18','MAN','1900-01-01','00:00:00'),(89,89,'Select a taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(90,90,'Enter the allowance amount','2021-05-18','MAN','1900-01-01','00:00:00'),(91,91,'Select a non taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(92,92,'Enter the allowance amount','2021-05-18','MAN','1900-01-01','00:00:00'),(93,93,'Select a non taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(94,94,'Take the user to the previous step','2021-05-18','MAN','1900-01-01','00:00:00'),(95,95,'Take the user to the next step','2021-05-18','MAN','1900-01-01','00:00:00'),(96,96,'Step 5 of the employee creation wizard','2021-05-18','MAN','1900-01-01','00:00:00'),(97,97,'Enter the employee annual salary','2021-05-18','MAN','1900-01-01','00:00:00'),(98,98,'Enter the employee hourly rate','2021-05-18','MAN','1900-01-01','00:00:00'),(99,99,'Take the user to the previous step','2021-05-18','MAN','1900-01-01','00:00:00'),(100,100,'Create the employee','2021-05-18','MAN','1900-01-01','00:00:00'),(101,101,'Heading of step 1','2021-05-18','MAN','1900-01-01','00:00:00'),(102,102,'Heading of step 2','2021-05-18','MAN','1900-01-01','00:00:00'),(103,103,'Heading of step 3','2021-05-18','MAN','1900-01-01','00:00:00'),(104,104,'Heading of step 4','2021-05-18','MAN','1900-01-01','00:00:00'),(105,105,'Heading of step 5','2021-05-18','MAN','1900-01-01','00:00:00'),(106,106,'A wizard that guides the user through the process of creating a new employee','2021-05-18','MAN','1900-01-01','00:00:00'),(107,107,'','2021-05-18','MAN','1900-01-01','00:00:00');
/*!40000 ALTER TABLE `entity_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entity_details_BEFORE_INSERT` BEFORE INSERT ON `entity_details` FOR EACH ROW BEGIN
	SET NEW.date_added = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entity_has_version`
--

DROP TABLE IF EXISTS `entity_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`entity_id`,`entity_entity_id`),
  KEY `fk_entity_has_version_version1_idx` (`version_id`),
  KEY `fk_entity_has_version_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_has_version_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`),
  CONSTRAINT `fk_entity_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_has_version`
--

LOCK TABLES `entity_has_version` WRITE;
/*!40000 ALTER TABLE `entity_has_version` DISABLE KEYS */;
INSERT INTO `entity_has_version` VALUES (1,1,1),(2,2,2),(3,3,3),(5,5,5),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(116,42,42),(117,43,43),(118,44,44),(119,45,45),(120,46,46),(121,47,47),(122,48,48),(133,49,49),(134,50,50),(135,51,51),(136,52,52),(137,53,53),(138,54,54),(139,55,55),(140,56,56),(141,57,57),(142,58,58),(143,59,59),(144,60,60),(145,61,61),(146,62,62),(147,63,63),(148,64,64),(149,65,65),(150,66,66),(151,67,67),(152,68,68),(153,69,69),(154,70,70),(155,71,71),(156,72,72),(157,73,73),(158,74,74),(159,75,75),(160,76,76),(161,77,77),(162,78,78),(163,79,79),(164,80,80),(165,81,81),(166,82,82),(167,83,83),(168,84,84),(169,85,85),(170,86,86),(171,87,87),(172,88,88),(173,89,89),(174,90,90),(175,91,91),(176,92,92),(177,93,93),(178,94,94),(179,95,95),(180,96,96),(181,97,97),(182,98,98),(183,99,99),(184,100,100),(185,101,101),(186,102,102),(187,103,103),(188,104,104),(189,105,105),(190,106,106),(191,107,107);
/*!40000 ALTER TABLE `entity_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_help`
--

DROP TABLE IF EXISTS `entity_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `has_tool_tip` varchar(5) NOT NULL DEFAULT 'FALSE',
  `tool_tip_text` varchar(500) DEFAULT NULL,
  `help_file_name` varchar(250) DEFAULT NULL,
  `help_text` text,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_help`
--

LOCK TABLES `entity_help` WRITE;
/*!40000 ALTER TABLE `entity_help` DISABLE KEYS */;
INSERT INTO `entity_help` VALUES (1,1,'False','-','',''),(2,2,'False','-','',''),(3,3,'False','-','',''),(5,5,'False','-','',''),(7,7,'False','-','',''),(8,8,'True','Click to login','',''),(9,9,'','','',''),(10,10,'False','-','',''),(11,11,'False','-','',''),(12,12,'False','-','',''),(13,13,'True','Hide / Show Main Menu','',''),(14,14,'False','-','',''),(15,15,'False','-','',''),(16,16,'True','Authorisations','',''),(17,17,'True','Employee Creation','',''),(18,18,'True','Employee CV','',''),(19,19,'True','Employee Grid View','',''),(20,20,'True','Visual Reports','',''),(21,21,'True','Dakar Intelligence','',''),(22,22,'False','-','',''),(23,23,'True','My Company / Last Viewed','',''),(24,24,'True','Notifications','',''),(25,25,'True','New Employments','',''),(26,26,'True','Terminations','',''),(27,27,'True','Quick Links','',''),(28,28,'True','User','',''),(29,29,'False','-','',''),(30,30,'False','-','',''),(31,31,'False','-','',''),(32,32,'False','-','',''),(33,33,'False','-','',''),(34,34,'False','-','',''),(35,35,'False','-','',''),(36,36,'False','-','',''),(37,37,'False','-','',''),(38,38,'False','-','',''),(39,39,'False','-','',''),(40,40,'False','-','',''),(41,41,'False','-','',''),(42,42,'False','-','',''),(43,43,'False','-','',''),(44,44,'False','-','',''),(45,45,'False','-','',''),(46,46,'False','-','',''),(47,47,'False','-','',''),(48,48,'False','-','',''),(49,49,'False','-','',''),(50,50,'False','-','',''),(51,51,'False','-','',''),(52,52,'False','-','',''),(53,53,'False','-','',''),(54,54,'False','-','',''),(55,55,'False','-','',''),(56,56,'False','-','',''),(57,57,'False','-','',''),(58,58,'False','-','',''),(59,59,'False','-','',''),(60,60,'False','-','',''),(61,61,'False','-','',''),(62,62,'False','-','',''),(63,63,'False','-','',''),(64,64,'False','-','',''),(65,65,'False','-','',''),(66,66,'False','-','',''),(67,67,'False','-','',''),(68,68,'False','-','',''),(69,69,'False','-','',''),(70,70,'False','-','',''),(71,71,'False','-','',''),(72,72,'False','-','',''),(73,73,'False','-','',''),(74,74,'False','-','',''),(75,75,'False','-','',''),(76,76,'False','-','',''),(77,77,'False','-','',''),(78,78,'False','-','',''),(79,79,'False','-','',''),(80,80,'False','-','',''),(81,81,'False','-','',''),(82,82,'False','-','',''),(83,83,'False','-','',''),(84,84,'False','-','',''),(85,85,'False','-','',''),(86,86,'False','-','',''),(87,87,'False','-','',''),(88,88,'False','-','',''),(89,89,'False','-','',''),(90,90,'False','-','',''),(91,91,'False','-','',''),(92,92,'False','-','',''),(93,93,'False','-','',''),(94,94,'False','-','',''),(95,95,'False','-','',''),(96,96,'False','-','',''),(97,97,'False','-','',''),(98,98,'False','-','',''),(99,99,'False','-','',''),(100,100,'False','-','',''),(101,101,'False','-','',''),(102,102,'False','-','',''),(103,103,'False','-','',''),(104,104,'False','-','',''),(105,105,'False','-','',''),(106,106,'False','-','',''),(107,107,'False','-','','');
/*!40000 ALTER TABLE `entity_help` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entity_help_AFTER_INSERT` AFTER INSERT ON `entity_help` FOR EACH ROW BEGIN
	UPDATE entity SET entity_help_id = NEW.id WHERE id = NEW.entity_Id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entity_test`
--

DROP TABLE IF EXISTS `entity_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `entity_test_name` varchar(200) NOT NULL,
  `description` text,
  `created_on` date NOT NULL,
  `test_function` varchar(250) NOT NULL COMMENT 'Value at the start of the test',
  `data_in` varchar(1000) DEFAULT NULL COMMENT 'Expected value at the end of the test',
  `data_out` varchar(1000) DEFAULT NULL COMMENT 'Value from another source',
  `data_expected` varchar(1000) DEFAULT NULL,
  `failure_halts_test` tinyint(4) NOT NULL DEFAULT '0',
  `created_by_employee_id` varchar(45) NOT NULL,
  `last_run_date` date DEFAULT NULL,
  `last_run_time` time DEFAULT NULL,
  `parent_test_row_id` int(10) unsigned DEFAULT NULL,
  `parent_test_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_test_id`,`entity_id`,`entity_entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_test_employee1_idx` (`created_by_employee_id`),
  KEY `fk_entity_test_entity_test2_idx` (`entity_test_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_test_result_entity_test1_idx` (`entity_test_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_test_has_one_or_more_categories1_idx` (`entity_test_id`),
  KEY `fk_test_suite_has_entity_test1_idx` (`entity_test_id`),
  KEY `fk_entity_test_has_version_entity_test1_idx` (`entity_test_id`),
  KEY `fk_entity_test_entity1_idx` (`entity_id`,`entity_entity_id`),
  KEY `fk_entity_test_entity_test1_idx` (`parent_test_row_id`,`parent_test_id`),
  CONSTRAINT `fk_entity_test_employee1` FOREIGN KEY (`created_by_employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_test_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_test_entity_test1` FOREIGN KEY (`parent_test_row_id`, `parent_test_id`) REFERENCES `entity_test` (`id`, `entity_test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test`
--

LOCK TABLES `entity_test` WRITE;
/*!40000 ALTER TABLE `entity_test` DISABLE KEYS */;
INSERT INTO `entity_test` VALUES (1,1,1,1,'Top Level of: Root','This is the top level test for Root. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,0,0),(2,2,2,2,'Top Level of: Dakar Web','This is the top level test for Dakar Web. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,1,1),(3,3,3,3,'Top Level of: Login Screen','This is the top level test for Login Screen. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:24:46',2,2),(5,5,5,5,'User Name','Enter user name','2021-05-16','Enter data','steveb','-','-',0,'SB_1','2021-05-17','16:24:37',3,3),(7,7,7,7,'User Password','Enter password','2021-05-16','Enter data','1234','-','-',0,'SB_1','2021-05-17','16:24:40',3,3),(8,8,8,8,'Top Level of: Login Button','This is the top level test for Login Button. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:24:42',8,8),(9,9,9,9,'Top Level of: Home Page','This is the top level test for Home Page. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:48:19',2,2),(10,10,10,10,'Top Level of: Home Page Info Bar','This is the top level test for Home Page Info Bar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:28:49',9,9),(12,12,12,12,'Current Module Indicator','Shows the currently selected module','2021-05-16','-','-','-','Payroll',0,'SB_1','2021-05-17','16:27:38',10,10),(13,13,13,13,'Top Level of: Menu Toggle','This is the top level test for Menu Toggle. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:27:46',10,10),(14,14,14,14,'Current Company','Shows the currently selected company','2021-05-16','Peform function based on value','-','-','Mars~Mars Incorporated Ltd',0,'SB_1','2021-05-17','16:28:37',10,10),(15,15,15,15,'Top Level of: Home Page Top Right Nav Bar','This is the top level test for Home Page Top Right Nav Bar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:32:30',9,9),(16,16,16,16,'Top Level of: Authorisations','This is the top level test for Authorisations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:00',15,15),(17,17,17,17,'Top Level of: Employee Creation Wizard','This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:05',15,15),(18,18,18,18,'Top Level of: Employee CV','This is the top level test for Employee CV. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:09',15,15),(19,19,19,19,'Top Level of: Employee Grid View','This is the top level test for Employee Grid View. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:14',15,15),(20,20,20,20,'Top Level of: Visual Reports','This is the top level test for Visual Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:19',15,15),(21,21,21,21,'Top Level of: Dakar Intelligence','This is the top level test for Dakar Intelligence. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:22',15,15),(22,22,22,22,'Top Level of: Organisation Chart','This is the top level test for Organisation Chart. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:31',15,15),(23,23,23,23,'Top Level of: My Company / Last Viewed','This is the top level test for My Company / Last Viewed. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:20',15,15),(24,24,24,24,'Top Level of: All Notifications','This is the top level test for All Notifications. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:26',15,15),(25,25,25,25,'Top Level of: New Employments','This is the top level test for New Employments. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:32',15,15),(26,26,26,26,'Top Level of: Terminations','This is the top level test for Terminations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:34',15,15),(27,27,27,27,'Top Level of: Quick Links','This is the top level test for Quick Links. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:43',15,15),(28,28,28,28,'Top Level of: User Avatar','This is the top level test for User Avatar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:32:09',15,15),(29,29,29,29,'Top Level of: Main Menu','This is the top level test for Main Menu. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:34:06',9,9),(30,30,30,30,'Top Level of: Main Menu - Payroll','This is the top level test for Main Menu - Payroll. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:26',29,29),(31,31,31,31,'Top Level of: Employee List','This is the top level test for Employee List. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:29',30,30),(32,32,32,32,'Top Level of: Documents','This is the top level test for Documents. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:31',30,30),(33,33,33,33,'Top Level of: Employee Others','This is the top level test for Employee Others. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:33',30,30),(34,34,34,34,'Top Level of: Payroll','This is the top level test for Payroll. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:35',30,30),(35,35,35,35,'Top Level of: Payroll Statistics','This is the top level test for Payroll Statistics. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:40',30,30),(36,36,36,36,'Top Level of: Absence Statistics','This is the top level test for Absence Statistics. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:43',30,30),(37,37,37,37,'Top Level of: Reports','This is the top level test for Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:46',30,30),(38,38,38,38,'Top Level of: Monthly Reports','This is the top level test for Monthly Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:48',30,30),(39,39,39,39,'Top Level of: Yearly Reports','This is the top level test for Yearly Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:53',30,30),(40,40,40,40,'Top Level of: Bulk Updates','This is the top level test for Bulk Updates. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:55',30,30),(41,41,41,41,'Top Level of: Settings','This is the top level test for Settings. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:34:02',30,30),(42,42,42,42,'Top Level of: Authorisations Form','This is the top level test for Authorisations Form. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,16,16),(43,43,43,43,'Company','TODO - Enter Description','2021-05-17','-','-','-','Company',0,'SB_1',NULL,NULL,42,42),(44,44,44,44,'Company Combo','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',0,'SB_1',NULL,NULL,42,42),(45,45,45,45,'Grouping View ','TODO - Enter Description','2021-05-17','-','-','-','Grouping View ',0,'SB_1',NULL,NULL,42,42),(46,46,46,46,'Grouping View Combo','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Authorisation Group A~GROUP B~General Group~View All Groups',0,'SB_1',NULL,NULL,42,42),(47,47,47,47,'Top Level of: Accept Criteria','This is the top level test for Accept Criteria. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42),(48,48,48,48,'Top Level of: Authorisations Grid','This is the top level test for Authorisations Grid. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42);
/*!40000 ALTER TABLE `entity_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_category`
--

DROP TABLE IF EXISTS `entity_test_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_category_name` varchar(45) NOT NULL,
  `entity_test_category_description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_category`
--

LOCK TABLES `entity_test_category` WRITE;
/*!40000 ALTER TABLE `entity_test_category` DISABLE KEYS */;
INSERT INTO `entity_test_category` VALUES (1,'None','No test category\r'),(2,'App','Overall test for the app\r'),(3,'Group App Functions','A group of app functions eg a module\r'),(4,'Group Module Functions','A group of functions for a module\r'),(5,'Group Data','An entity that groups related data\r'),(6,'Group Controls','An entity that groups controls\r'),(7,'Redirect','An entity that redirects the user eg button\r'),(8,'Info','An entity that supplies information eg info bar\r'),(9,'Display Image','Displays an image\r'),(10,'Data In/Out','Has data in and out eg text box\r'),(11,'Data In','Has data in eg text box\r'),(12,'Data Out','Has data out eg label\r'),(13,'Display Child','Displays a child form/pop up form etc\r');
/*!40000 ALTER TABLE `entity_test_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_has_one_or_more_test_categories`
--

DROP TABLE IF EXISTS `entity_test_has_one_or_more_test_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_has_one_or_more_test_categories` (
  `entity_test_category_id` int(10) unsigned NOT NULL,
  `category_level` tinyint(4) NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_test_category_id`,`entity_test_id`,`entity_test_entity_test_id`),
  KEY `fk_entity_test_has_entity_test_category_entity_test_categor_idx` (`entity_test_category_id`),
  KEY `fk_entity_test_has_one_or_more_test_categories_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`),
  CONSTRAINT `fk_entity_test_has_entity_test_category_entity_test_category1` FOREIGN KEY (`entity_test_category_id`) REFERENCES `entity_test_category` (`id`),
  CONSTRAINT `fk_entity_test_has_one_or_more_test_categories_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`) REFERENCES `entity_test` (`id`, `entity_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_has_one_or_more_test_categories`
--

LOCK TABLES `entity_test_has_one_or_more_test_categories` WRITE;
/*!40000 ALTER TABLE `entity_test_has_one_or_more_test_categories` DISABLE KEYS */;
INSERT INTO `entity_test_has_one_or_more_test_categories` VALUES (2,1,2,2),(5,2,3,3),(5,2,9,9),(5,2,42,42),(6,1,3,3),(6,1,9,9),(6,1,42,42),(7,1,8,8),(7,2,10,10),(7,1,15,15),(7,1,29,29),(7,1,30,30),(11,1,5,5),(11,1,7,7),(11,2,48,48),(12,1,10,10),(12,1,12,12),(12,2,15,15),(12,2,29,29),(12,2,30,30),(12,1,43,43),(12,1,45,45),(12,1,48,48),(13,1,16,16),(13,1,17,17),(13,1,18,18),(13,1,19,19),(13,1,20,20),(13,1,21,21),(13,1,22,22),(13,1,23,23),(13,1,24,24),(13,1,25,25),(13,1,26,26),(13,1,27,27),(13,1,28,28),(13,1,31,31),(13,1,32,32),(13,1,33,33),(13,1,34,34),(13,1,35,35),(13,1,36,36),(13,1,37,37),(13,1,38,38),(13,1,39,39),(13,1,40,40),(13,1,41,41);
/*!40000 ALTER TABLE `entity_test_has_one_or_more_test_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_has_version`
--

DROP TABLE IF EXISTS `entity_test_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`entity_test_id`,`entity_test_entity_test_id`),
  KEY `fk_entity_test_has_version_version1_idx` (`version_id`),
  KEY `fk_entity_test_has_version_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`),
  CONSTRAINT `fk_entity_test_has_version_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`) REFERENCES `entity_test` (`id`, `entity_test_id`),
  CONSTRAINT `fk_entity_test_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_has_version`
--

LOCK TABLES `entity_test_has_version` WRITE;
/*!40000 ALTER TABLE `entity_test_has_version` DISABLE KEYS */;
INSERT INTO `entity_test_has_version` VALUES (76,1,1),(77,2,2),(78,3,3),(80,5,5),(82,7,7),(83,8,8),(84,9,9),(85,10,10),(86,12,12),(87,14,14),(88,13,13),(89,15,15),(90,16,16),(91,17,17),(92,18,18),(93,19,19),(94,20,20),(95,21,21),(96,22,22),(97,23,23),(98,24,24),(99,25,25),(100,26,26),(101,27,27),(102,28,28),(103,29,29),(104,30,30),(105,31,31),(106,32,32),(107,33,33),(108,34,34),(109,35,35),(110,36,36),(111,37,37),(112,38,38),(113,39,39),(114,40,40),(115,41,41),(126,42,42),(127,43,43),(128,44,44),(129,45,45),(130,46,46),(131,47,47),(132,48,48);
/*!40000 ALTER TABLE `entity_test_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_result`
--

DROP TABLE IF EXISTS `entity_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `result_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_passed` enum('Pass','Fail','NR') DEFAULT NULL,
  `test_ignored` enum('TRUE','FALSE') NOT NULL,
  `comments` text,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_id` int(10) unsigned NOT NULL,
  `entity_test_entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_test_id`,`entity_test_entity_test_id`,`entity_test_entity_id`,`entity_test_entity_entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_test_result_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`,`entity_test_entity_id`,`entity_test_entity_entity_id`),
  CONSTRAINT `fk_entity_test_result_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) REFERENCES `entity_test` (`id`, `entity_test_id`, `entity_id`, `entity_entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_result`
--

LOCK TABLES `entity_test_result` WRITE;
/*!40000 ALTER TABLE `entity_test_result` DISABLE KEYS */;
INSERT INTO `entity_test_result` VALUES (1,'2021-05-17 13:45:51','Pass','FALSE','None',3,3,3,3),(3,'2021-05-17 13:45:51','Pass','FALSE','None',5,5,5,5),(5,'2021-05-17 13:45:51','Pass','FALSE','None',7,7,7,7),(6,'2021-05-17 13:45:51','Pass','FALSE','None',8,8,8,8),(7,'2021-05-17 14:24:48','Pass','FALSE','Test Complete Notes',3,3,3,3),(8,'2021-05-17 14:24:48','Pass','FALSE','Test Complete Notes',5,5,5,5),(9,'2021-05-17 14:24:48','Pass','FALSE','Test Complete Notes',7,7,7,7),(10,'2021-05-17 14:24:48','Pass','FALSE','Test Complete Notes',8,8,8,8),(11,'2021-05-17 14:34:47','NR','FALSE','None',9,9,9,9),(12,'2021-05-17 14:34:47','Fail','FALSE','None',10,10,10,10),(13,'2021-05-17 14:34:47','Pass','FALSE','None',12,12,12,12),(14,'2021-05-17 14:34:47','Fail','FALSE','Test failed on no tool tip',13,13,13,13),(15,'2021-05-17 14:34:47','Pass','FALSE','None',14,14,14,14),(16,'2021-05-17 14:34:47','Fail','FALSE','Has several child failures. Mainly for tool tips.',15,15,15,15),(17,'2021-05-17 14:34:47','Pass','FALSE','None',16,16,16,16),(18,'2021-05-17 14:34:47','Pass','FALSE','None',17,17,17,17),(19,'2021-05-17 14:34:47','Pass','FALSE','None',18,18,18,18),(20,'2021-05-17 14:34:47','Pass','FALSE','None',19,19,19,19),(21,'2021-05-17 14:34:47','Pass','FALSE','None',20,20,20,20),(22,'2021-05-17 14:34:47','Pass','FALSE','None',21,21,21,21),(23,'2021-05-17 14:49:37','Fail','FALSE','Info bar and top right nav bar had failures',9,9,9,9),(24,'2021-05-17 14:49:37','Fail','FALSE','None',10,10,10,10),(25,'2021-05-17 14:49:37','Pass','FALSE','None',12,12,12,12),(26,'2021-05-17 14:49:37','Fail','FALSE','Test failed on no tool tip',13,13,13,13),(27,'2021-05-17 14:49:37','Pass','FALSE','None',14,14,14,14),(28,'2021-05-17 14:49:37','Fail','FALSE','Has several child failures. Mainly for tool tips.',15,15,15,15),(29,'2021-05-17 14:49:37','Pass','FALSE','None',16,16,16,16),(30,'2021-05-17 14:49:37','Pass','FALSE','None',17,17,17,17),(31,'2021-05-17 14:49:37','Pass','FALSE','None',18,18,18,18),(32,'2021-05-17 14:49:37','Pass','FALSE','None',19,19,19,19),(33,'2021-05-17 14:49:37','Pass','FALSE','None',20,20,20,20),(34,'2021-05-17 14:49:37','Pass','FALSE','None',21,21,21,21),(35,'2021-05-17 14:49:37','Fail','FALSE','When the entity and test was created this OC link was there. Now missing.',22,22,22,22),(36,'2021-05-17 14:49:37','Pass','FALSE','None',23,23,23,23),(37,'2021-05-17 14:49:37','Pass','FALSE','None',24,24,24,24),(38,'2021-05-17 14:49:37','Pass','FALSE','None',25,25,25,25),(39,'2021-05-17 14:49:37','Pass','FALSE','None',26,26,26,26),(40,'2021-05-17 14:49:37','Fail','FALSE','Test failed on no tool tip',27,27,27,27),(41,'2021-05-17 14:49:37','Fail','FALSE','Test failed on no tool tip',28,28,28,28),(42,'2021-05-17 14:49:37','Pass','FALSE','None',29,29,29,29),(43,'2021-05-17 14:49:37','Pass','FALSE','None',30,30,30,30),(44,'2021-05-17 14:49:37','Pass','FALSE','None',31,31,31,31),(45,'2021-05-17 14:49:37','Pass','FALSE','None',32,32,32,32),(46,'2021-05-17 14:49:37','Pass','FALSE','None',33,33,33,33),(47,'2021-05-17 14:49:37','Pass','FALSE','None',34,34,34,34),(48,'2021-05-17 14:49:37','Pass','FALSE','None',35,35,35,35),(49,'2021-05-17 14:49:37','Pass','FALSE','None',36,36,36,36),(50,'2021-05-17 14:49:37','Pass','FALSE','None',37,37,37,37),(51,'2021-05-17 14:49:37','Pass','FALSE','None',38,38,38,38),(52,'2021-05-17 14:49:37','Pass','FALSE','None',39,39,39,39),(53,'2021-05-17 14:49:37','Pass','FALSE','None',40,40,40,40),(54,'2021-05-17 14:49:37','Pass','FALSE','None',41,41,41,41);
/*!40000 ALTER TABLE `entity_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_todo`
--

DROP TABLE IF EXISTS `entity_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_todo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `when_was_todo_added` date NOT NULL,
  `todo_desc` varchar(1000) NOT NULL,
  `is_todo_done` tinyint(4) DEFAULT '0',
  `when_was_todo_done` date DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`,`entity_entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_todo_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_todo_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_todo`
--

LOCK TABLES `entity_todo` WRITE;
/*!40000 ALTER TABLE `entity_todo` DISABLE KEYS */;
INSERT INTO `entity_todo` VALUES (1,3,3,'2021-05-16','Google & Active dir.',0,'1900-01-01');
/*!40000 ALTER TABLE `entity_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_type`
--

DROP TABLE IF EXISTS `entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_type` (
  `id` int(10) unsigned NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_type_parent_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_type_name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_name_UNIQUE` (`entity_type_name`),
  KEY `fk_entity_type_entity_type1_idx` (`entity_type_parent_id`),
  CONSTRAINT `fk_entity_type_entity_type1` FOREIGN KEY (`entity_type_parent_id`) REFERENCES `entity_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_type`
--

LOCK TABLES `entity_type` WRITE;
/*!40000 ALTER TABLE `entity_type` DISABLE KEYS */;
INSERT INTO `entity_type` VALUES (1,'Root',1),(2,'Application',1),(26,'Function',1),(3,'Module',2),(6,'Form',2),(4,'Module Category',3),(5,'Module Sub-Category',4),(7,'Popup Form',6),(8,'Parent Form',6),(9,'Child Form',6),(10,'Nav Bar',6),(11,'Info Bar',6),(12,'Grid',6),(13,'Image',6),(14,'Control',6),(15,'List',14),(16,'Tab',14),(17,'Text Out',14),(18,'Text In',14),(19,'Text In/Out',14),(20,'Combo',14),(21,'Label',14),(22,'Button',14),(23,'Button - Redirect',21),(24,'Button - Display',21),(25,'Button - Function',21);
/*!40000 ALTER TABLE `entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_test_result`
--

DROP TABLE IF EXISTS `import_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `import_test_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '	has_tool_tip	tool_tip_text	initial_value	expected_value	received_value	insert_value	failure_halts_test	run_by	pass_fail_or_not_run	fail_severity	fail_reason	test_complete_notes\n',
  `test_run_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_parent` int(10) unsigned NOT NULL,
  `entity_test_version_id` int(10) unsigned NOT NULL,
  `entity_test_version_num` varchar(11) DEFAULT NULL,
  `entity_test_name` varchar(100) NOT NULL,
  `entity_test_description` text,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(100) NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_description` text,
  `entity_last_tested_date` date DEFAULT NULL,
  `entity_last_tested_time` time DEFAULT NULL,
  `has_tool_tip` enum('TRUE','FALSE') NOT NULL,
  `tool_tip_text` varchar(500) DEFAULT NULL,
  `initial_value` varchar(1000) DEFAULT NULL,
  `expected_value` varchar(1000) DEFAULT NULL,
  `received_value` varchar(1000) DEFAULT NULL,
  `insert_value` varchar(1000) DEFAULT NULL,
  `failure_halts_test` tinyint(4) DEFAULT NULL,
  `run_by` varchar(45) NOT NULL,
  `pass_fail_or_not_run` enum('Pass','Fail','NR') NOT NULL DEFAULT 'NR',
  `fail_severity` enum('1','2','3','4','5') DEFAULT NULL,
  `fail_reason` varchar(45) DEFAULT NULL,
  `test_complete_notes` text,
  `endl` varchar(4) NOT NULL,
  PRIMARY KEY (`id`,`test_run_id`,`test_suite_id`,`entity_test_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_test_result`
--

LOCK TABLES `import_test_result` WRITE;
/*!40000 ALTER TABLE `import_test_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_test_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `import_test_result_AFTER_INSERT` AFTER INSERT ON `import_test_result` FOR EACH ROW BEGIN
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_test_suite_has_child_suites_for_test_run`
--

DROP TABLE IF EXISTS `tbl_test_suite_has_child_suites_for_test_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_test_suite_has_child_suites_for_test_run` (
  `test_suite_row_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_test_suite_has_child_suites_for_test_run`
--

LOCK TABLES `tbl_test_suite_has_child_suites_for_test_run` WRITE;
/*!40000 ALTER TABLE `tbl_test_suite_has_child_suites_for_test_run` DISABLE KEYS */;
INSERT INTO `tbl_test_suite_has_child_suites_for_test_run` VALUES (3,3,4,4),(3,3,5,5),(3,3,6,6),(3,3,7,7),(3,3,8,8);
/*!40000 ALTER TABLE `tbl_test_suite_has_child_suites_for_test_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_test_in_test_run`
--

DROP TABLE IF EXISTS `temp_test_in_test_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `temp_test_in_test_run` (
  `test_suite_name` varchar(100) DEFAULT NULL,
  `test_suite_row_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `ts_entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `entity_test_name` varchar(200) NOT NULL,
  `version_number` varchar(11) DEFAULT NULL,
  `description` text,
  `created_on` date NOT NULL,
  `test_function` varchar(250) NOT NULL COMMENT 'Value at the start of the test',
  `data_in` varchar(1000) DEFAULT NULL COMMENT 'Expected value at the end of the test',
  `data_out` varchar(1000) DEFAULT NULL COMMENT 'Value from another source',
  `data_expected` varchar(1000) DEFAULT NULL,
  `failure_halts_test` tinyint(4) NOT NULL DEFAULT '0',
  `created_by_employee_id` varchar(45) NOT NULL,
  `last_run_date` date DEFAULT NULL,
  `last_run_time` time DEFAULT NULL,
  `parent_test_row_id` int(10) unsigned DEFAULT NULL,
  `parent_test_id` int(10) unsigned DEFAULT NULL,
  `entity_type_entity_type_name` varchar(45) NOT NULL COMMENT 'The entiry''s parent.\nZero = no parent',
  `entity_name` varchar(100) NOT NULL,
  `last_tested_date` date DEFAULT NULL,
  `last_tested_time` time DEFAULT NULL,
  `has_tool_tip` varchar(5) DEFAULT 'FALSE',
  `tool_tip_text` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_test_in_test_run`
--

LOCK TABLES `temp_test_in_test_run` WRITE;
/*!40000 ALTER TABLE `temp_test_in_test_run` DISABLE KEYS */;
INSERT INTO `temp_test_in_test_run` VALUES ('Home Page Top Right Nav Bar',15,15,16,16,16,16,16,16,'Top Level of: Authorisations','1.0.0','This is the top level test for Authorisations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:00',15,15,'Button - Display','Authorisations','2021-05-17','16:29:00','True','Authorisations'),('Home Page Top Right Nav Bar',15,15,17,17,17,17,17,17,'Top Level of: Employee Creation Wizard','1.0.0','This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:05',15,15,'Button - Display','Employee Creation Wizard','2021-05-17','16:29:05','True','Employee Creation'),('Home Page Top Right Nav Bar',15,15,18,18,18,18,18,18,'Top Level of: Employee CV','1.0.0','This is the top level test for Employee CV. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:09',15,15,'Button - Display','Employee CV','2021-05-17','16:29:09','True','Employee CV'),('Home Page Top Right Nav Bar',15,15,19,19,19,19,19,19,'Top Level of: Employee Grid View','1.0.0','This is the top level test for Employee Grid View. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:14',15,15,'Button - Display','Employee Grid View','2021-05-17','16:29:14','True','Employee Grid View'),('Home Page Top Right Nav Bar',15,15,20,20,20,20,20,20,'Top Level of: Visual Reports','1.0.0','This is the top level test for Visual Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:19',15,15,'Button - Display','Visual Reports','2021-05-17','16:29:19','True','Visual Reports'),('Home Page Top Right Nav Bar',15,15,21,21,21,21,21,21,'Top Level of: Dakar Intelligence','1.0.0','This is the top level test for Dakar Intelligence. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:22',15,15,'Button - Display','Dakar Intelligence','2021-05-17','16:29:22','True','Dakar Intelligence'),('Home Page Top Right Nav Bar',15,15,22,22,22,22,22,22,'Top Level of: Organisation Chart','1.0.0','This is the top level test for Organisation Chart. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:31',15,15,'Button - Display','Organisation Chart','2021-05-17','16:29:31','False','-'),('Home Page Top Right Nav Bar',15,15,23,23,23,23,23,23,'Top Level of: My Company / Last Viewed','1.0.0','This is the top level test for My Company / Last Viewed. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:20',15,15,'Button - Display','My Company / Last Viewed','2021-05-17','16:31:20','True','My Company / Last Viewed'),('Home Page Top Right Nav Bar',15,15,24,24,24,24,24,24,'Top Level of: All Notifications','1.0.0','This is the top level test for All Notifications. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:26',15,15,'Button - Display','All Notifications','2021-05-17','16:31:26','True','Notifications'),('Home Page Top Right Nav Bar',15,15,25,25,25,25,25,25,'Top Level of: New Employments','1.0.0','This is the top level test for New Employments. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:32',15,15,'Button - Display','New Employments','2021-05-17','16:31:32','True','New Employments'),('Home Page Top Right Nav Bar',15,15,26,26,26,26,26,26,'Top Level of: Terminations','1.0.0','This is the top level test for Terminations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:34',15,15,'Button - Display','Terminations','2021-05-17','16:31:34','True','Terminations'),('Home Page Top Right Nav Bar',15,15,27,27,27,27,27,27,'Top Level of: Quick Links','1.0.0','This is the top level test for Quick Links. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:43',15,15,'Button - Display','Quick Links','2021-05-17','16:31:43','True','Quick Links'),('Home Page Top Right Nav Bar',15,15,28,28,28,28,28,28,'Top Level of: User Avatar','1.0.0','This is the top level test for User Avatar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:32:09',15,15,'Button - Display','User Avatar','2021-05-17','16:32:09','True','User'),('Authorisations',16,16,42,42,42,42,42,42,'Top Level of: Authorisations Form','1.0.0','This is the top level test for Authorisations Form. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,16,16,'Form','Authorisations Form','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,43,43,43,43,43,43,'Company','1.0.0','TODO - Enter Description','2021-05-17','-','-','-','Company',0,'SB_1',NULL,NULL,42,42,'Label','Company','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,44,44,44,44,44,44,'Company Combo','1.0.0','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',0,'SB_1',NULL,NULL,42,42,'Combo','Company Combo','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,45,45,45,45,45,45,'Grouping View ','1.0.0','TODO - Enter Description','2021-05-17','-','-','-','Grouping View ',0,'SB_1',NULL,NULL,42,42,'Label','Grouping View ','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,46,46,46,46,46,46,'Grouping View Combo','1.0.0','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Authorisation Group A~GROUP B~General Group~View All Groups',0,'SB_1',NULL,NULL,42,42,'Combo','Grouping View Combo','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,47,47,47,47,47,47,'Top Level of: Accept Criteria','1.0.0','This is the top level test for Accept Criteria. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42,'Button - Function','Accept Criteria','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,48,48,48,48,48,48,'Top Level of: Authorisations Grid','1.0.0','This is the top level test for Authorisations Grid. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42,'Grid','Authorisations Grid','1900-01-01','00:00:00','False','-');
/*!40000 ALTER TABLE `temp_test_in_test_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_insert_has_parent`
--

DROP TABLE IF EXISTS `test_insert_has_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_insert_has_parent` (
  `entity_test_id` int(10) unsigned NOT NULL,
  `parent_test_id` int(10) unsigned NOT NULL,
  `parent_test_version_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_test_id`,`parent_test_id`),
  UNIQUE KEY `entity_test_id_UNIQUE` (`entity_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_insert_has_parent`
--

LOCK TABLES `test_insert_has_parent` WRITE;
/*!40000 ALTER TABLE `test_insert_has_parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_insert_has_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run`
--

DROP TABLE IF EXISTS `test_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_run_name` varchar(100) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run`
--

LOCK TABLES `test_run` WRITE;
/*!40000 ALTER TABLE `test_run` DISABLE KEYS */;
INSERT INTO `test_run` VALUES (1,'Login','Login form'),(2,'Homepage - Initial','Homepage with intial status after logging in.'),(3,'Top Right Nav Bar','Test the children of the top right nav bar');
/*!40000 ALTER TABLE `test_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run_has_test_suite`
--

DROP TABLE IF EXISTS `test_run_has_test_suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run_has_test_suite` (
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_row_id` int(10) unsigned NOT NULL,
  `test_run_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`test_suite_id`,`test_suite_row_id`,`test_run_id`),
  UNIQUE KEY `test_run_id_suite_id_ver_num_UNIQUE` (`test_run_id`,`test_suite_id`,`test_suite_row_id`),
  KEY `fk_test_run_has_test_suite_test_run1_idx` (`test_run_id`),
  KEY `fk_test_run_has_test_suite_test_suite1` (`test_suite_row_id`,`test_suite_id`),
  CONSTRAINT `fk_test_run_has_test_suite_test_run1` FOREIGN KEY (`test_run_id`) REFERENCES `test_run` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_test_run_has_test_suite_test_suite1` FOREIGN KEY (`test_suite_row_id`, `test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run_has_test_suite`
--

LOCK TABLES `test_run_has_test_suite` WRITE;
/*!40000 ALTER TABLE `test_run_has_test_suite` DISABLE KEYS */;
INSERT INTO `test_run_has_test_suite` VALUES (3,3,1),(9,9,2),(15,15,3);
/*!40000 ALTER TABLE `test_run_has_test_suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run_result`
--

DROP TABLE IF EXISTS `test_run_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_run_id` int(10) unsigned NOT NULL,
  `test_run_run_by_employee_id` varchar(45) NOT NULL,
  `result_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `number_test_cases_run` mediumint(9) NOT NULL,
  `number_failures` mediumint(9) NOT NULL,
  `number_passed` mediumint(9) NOT NULL,
  `number_ignored` mediumint(9) NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`,`test_run_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_run_result_test_run1_idx` (`test_run_id`),
  KEY `fk_test_run_result_employee1_idx` (`test_run_run_by_employee_id`),
  CONSTRAINT `fk_test_run_result_employee1` FOREIGN KEY (`test_run_run_by_employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_test_run_result_test_run1` FOREIGN KEY (`test_run_id`) REFERENCES `test_run` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run_result`
--

LOCK TABLES `test_run_result` WRITE;
/*!40000 ALTER TABLE `test_run_result` DISABLE KEYS */;
INSERT INTO `test_run_result` VALUES (1,1,'SB_1','2021-05-17 13:45:51',6,0,6,0,'None'),(2,1,'SB_1','2021-05-17 14:24:48',4,0,4,0,'Run without labels'),(3,2,'SB_1','2021-05-17 14:49:37',32,7,25,0,'Info bar and top right nav bar had failures');
/*!40000 ALTER TABLE `test_run_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite`
--

DROP TABLE IF EXISTS `test_suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_name` varchar(100) DEFAULT NULL,
  `test_suite_notes` text,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `parent_test_suite_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`test_suite_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_suite_test_suite2_idx` (`test_suite_id`) /*!80000 INVISIBLE */,
  KEY `fk_test_suite_test_suite3_idx` (`test_suite_id`),
  KEY `fk_test_suite_test_suite1_idx` (`parent_id`,`parent_test_suite_id`),
  CONSTRAINT `fk_test_suite_test_suite1` FOREIGN KEY (`parent_id`, `parent_test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite`
--

LOCK TABLES `test_suite` WRITE;
/*!40000 ALTER TABLE `test_suite` DISABLE KEYS */;
INSERT INTO `test_suite` VALUES (1,1,'Root','ADD TEST SUITE NOTES',0,0),(2,2,'Dakar Web','ADD TEST SUITE NOTES',1,1),(3,3,'Login Screen','ADD TEST SUITE NOTES',2,2),(8,8,'Login Button','ADD TEST SUITE NOTES',3,3),(9,9,'Home Page','ADD TEST SUITE NOTES',2,2),(10,10,'Home Page Info Bar','ADD TEST SUITE NOTES',9,9),(13,13,'Menu Toggle','ADD TEST SUITE NOTES',10,10),(15,15,'Home Page Top Right Nav Bar','ADD TEST SUITE NOTES',9,9),(16,16,'Authorisations','ADD TEST SUITE NOTES',15,15),(17,17,'Employee Creation Wizard','ADD TEST SUITE NOTES',15,15),(18,18,'Employee CV','ADD TEST SUITE NOTES',15,15),(19,19,'Employee Grid View','ADD TEST SUITE NOTES',15,15),(20,20,'Visual Reports','ADD TEST SUITE NOTES',15,15),(21,21,'Dakar Intelligence','ADD TEST SUITE NOTES',15,15),(22,22,'Organisation Chart','ADD TEST SUITE NOTES',15,15),(23,23,'My Company / Last Viewed','ADD TEST SUITE NOTES',15,15),(24,24,'All Notifications','ADD TEST SUITE NOTES',15,15),(25,25,'New Employments','ADD TEST SUITE NOTES',15,15),(26,26,'Terminations','ADD TEST SUITE NOTES',15,15),(27,27,'Quick Links','ADD TEST SUITE NOTES',15,15),(28,28,'User Avatar','ADD TEST SUITE NOTES',15,15),(29,29,'Main Menu','ADD TEST SUITE NOTES',9,9),(30,30,'Main Menu - Payroll','ADD TEST SUITE NOTES',29,29),(31,31,'Employee List','ADD TEST SUITE NOTES',30,30),(32,32,'Documents','ADD TEST SUITE NOTES',30,30),(33,33,'Employee Others','ADD TEST SUITE NOTES',30,30),(34,34,'Payroll','ADD TEST SUITE NOTES',30,30),(35,35,'Payroll Statistics','ADD TEST SUITE NOTES',30,30),(36,36,'Absence Statistics','ADD TEST SUITE NOTES',30,30),(37,37,'Reports','ADD TEST SUITE NOTES',30,30),(38,38,'Monthly Reports','ADD TEST SUITE NOTES',30,30),(39,39,'Yearly Reports','ADD TEST SUITE NOTES',30,30),(40,40,'Bulk Updates','ADD TEST SUITE NOTES',30,30),(41,41,'Settings','ADD TEST SUITE NOTES',30,30),(42,42,'Authorisations Form','ADD TEST SUITE NOTES',16,16),(47,47,'Accept Criteria','ADD TEST SUITE NOTES',42,42),(48,48,'Authorisations Grid','ADD TEST SUITE NOTES',42,42);
/*!40000 ALTER TABLE `test_suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite_has_entity_test`
--

DROP TABLE IF EXISTS `test_suite_has_entity_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite_has_entity_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_suite_row_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_id` int(10) unsigned NOT NULL,
  `entity_test_entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_suite_has_entity_test_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`,`entity_test_entity_id`,`entity_test_entity_entity_id`),
  KEY `fk_test_suite_has_entity_test_test_suite1` (`test_suite_row_id`,`test_suite_id`),
  CONSTRAINT `fk_test_suite_has_entity_test_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) REFERENCES `entity_test` (`id`, `entity_test_id`, `entity_id`, `entity_entity_id`),
  CONSTRAINT `fk_test_suite_has_entity_test_test_suite1` FOREIGN KEY (`test_suite_row_id`, `test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_entity_test`
--

LOCK TABLES `test_suite_has_entity_test` WRITE;
/*!40000 ALTER TABLE `test_suite_has_entity_test` DISABLE KEYS */;
INSERT INTO `test_suite_has_entity_test` VALUES (1,1,1,2,2,2,2),(2,2,2,3,3,3,3),(4,3,3,5,5,5,5),(6,3,3,7,7,7,7),(7,3,3,8,8,8,8),(8,2,2,9,9,9,9),(9,9,9,10,10,10,10),(10,10,10,12,12,12,12),(11,10,10,14,14,14,14),(12,10,10,13,13,13,13),(13,9,9,15,15,15,15),(14,15,15,16,16,16,16),(15,15,15,17,17,17,17),(16,15,15,18,18,18,18),(17,15,15,19,19,19,19),(18,15,15,20,20,20,20),(19,15,15,21,21,21,21),(20,15,15,22,22,22,22),(21,15,15,23,23,23,23),(22,15,15,24,24,24,24),(23,15,15,25,25,25,25),(24,15,15,26,26,26,26),(25,15,15,27,27,27,27),(26,15,15,28,28,28,28),(27,9,9,29,29,29,29),(28,29,29,30,30,30,30),(29,30,30,31,31,31,31),(30,30,30,32,32,32,32),(31,30,30,33,33,33,33),(32,30,30,34,34,34,34),(33,30,30,35,35,35,35),(34,30,30,36,36,36,36),(35,30,30,37,37,37,37),(36,30,30,38,38,38,38),(37,30,30,39,39,39,39),(38,30,30,40,40,40,40),(39,30,30,41,41,41,41),(47,16,16,42,42,42,42),(48,42,42,43,43,43,43),(49,42,42,44,44,44,44),(50,42,42,45,45,45,45),(51,42,42,46,46,46,46),(52,42,42,47,47,47,47),(53,42,42,48,48,48,48);
/*!40000 ALTER TABLE `test_suite_has_entity_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite_has_version`
--

DROP TABLE IF EXISTS `test_suite_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_test_suite_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`test_suite_id`,`test_suite_test_suite_id`),
  KEY `fk_test_suite_has_version_version1_idx` (`version_id`),
  KEY `fk_test_suite_has_version_test_suite1_idx` (`test_suite_id`,`test_suite_test_suite_id`),
  CONSTRAINT `fk_test_suite_has_version_test_suite1` FOREIGN KEY (`test_suite_id`, `test_suite_test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`),
  CONSTRAINT `fk_test_suite_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_version`
--

LOCK TABLES `test_suite_has_version` WRITE;
/*!40000 ALTER TABLE `test_suite_has_version` DISABLE KEYS */;
INSERT INTO `test_suite_has_version` VALUES (42,1,1),(43,2,2),(44,3,3),(45,8,8),(46,9,9),(47,10,10),(48,13,13),(49,15,15),(50,16,16),(51,17,17),(52,18,18),(53,19,19),(54,20,20),(55,21,21),(56,22,22),(57,23,23),(58,24,24),(59,25,25),(60,26,26),(61,27,27),(62,28,28),(63,29,29),(64,30,30),(65,31,31),(66,32,32),(67,33,33),(68,34,34),(69,35,35),(70,36,36),(71,37,37),(72,38,38),(73,39,39),(74,40,40),(75,41,41),(123,42,42),(124,47,47),(125,48,48);
/*!40000 ALTER TABLE `test_suite_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(200) NOT NULL COMMENT 'Either the test name of the entity name',
  `version_note` text NOT NULL,
  `version_type` enum('ENTITY','TEST','TEST_SUITE') NOT NULL,
  `major` smallint(6) NOT NULL DEFAULT '1',
  `minor` smallint(6) NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'Root','','ENTITY',1,0,0),(2,'Dakar Web','','ENTITY',1,0,0),(3,'Login Screen','','ENTITY',1,0,0),(5,'User Name','','ENTITY',1,0,0),(7,'User Password','','ENTITY',1,0,0),(8,'Login Button','','ENTITY',1,0,0),(9,'Home Page','','ENTITY',1,0,0),(10,'Home Page Info Bar','','ENTITY',1,0,0),(11,'Dakar Logo','','ENTITY',1,0,0),(12,'Current Module Indicator','','ENTITY',1,0,0),(13,'Menu Toggle','','ENTITY',1,0,0),(14,'Current Company','','ENTITY',1,0,0),(15,'Home Page Top Right Nav Bar','','ENTITY',1,0,0),(16,'Authorisations','','ENTITY',1,0,0),(17,'Employee Creation Wizard','','ENTITY',1,0,0),(18,'Employee CV','','ENTITY',1,0,0),(19,'Employee Grid View','','ENTITY',1,0,0),(20,'Visual Reports','','ENTITY',1,0,0),(21,'Dakar Intelligence','','ENTITY',1,0,0),(22,'Organisation Chart','','ENTITY',1,0,0),(23,'My Company / Last Viewed','','ENTITY',1,0,0),(24,'All Notifications','','ENTITY',1,0,0),(25,'New Employments','','ENTITY',1,0,0),(26,'Terminations','','ENTITY',1,0,0),(27,'Quick Links','','ENTITY',1,0,0),(28,'User Avatar','','ENTITY',1,0,0),(29,'Main Menu','','ENTITY',1,0,0),(30,'Main Menu - Payroll','','ENTITY',1,0,0),(31,'Employee List','','ENTITY',1,0,0),(32,'Documents','','ENTITY',1,0,0),(33,'Employee Others','','ENTITY',1,0,0),(34,'Payroll','','ENTITY',1,0,0),(35,'Payroll Statistics','','ENTITY',1,0,0),(36,'Absence Statistics','','ENTITY',1,0,0),(37,'Reports','','ENTITY',1,0,0),(38,'Monthly Reports','','ENTITY',1,0,0),(39,'Yearly Reports','','ENTITY',1,0,0),(40,'Bulk Updates','','ENTITY',1,0,0),(41,'Settings','','ENTITY',1,0,0),(42,'Root','No existing version. New major version of Root','TEST_SUITE',1,0,0),(43,'Dakar Web','No existing version. New major version of Dakar Web','TEST_SUITE',1,0,0),(44,'Login Screen','No existing version. New major version of Login Screen','TEST_SUITE',1,0,0),(45,'Login Button','No existing version. New major version of Login Button','TEST_SUITE',1,0,0),(46,'Home Page','No existing version. New major version of Home Page','TEST_SUITE',1,0,0),(47,'Home Page Info Bar','No existing version. New major version of Home Page Info Bar','TEST_SUITE',1,0,0),(48,'Menu Toggle','No existing version. New major version of Menu Toggle','TEST_SUITE',1,0,0),(49,'Home Page Top Right Nav Bar','No existing version. New major version of Home Page Top Right Nav Bar','TEST_SUITE',1,0,0),(50,'Authorisations','No existing version. New major version of Authorisations','TEST_SUITE',1,0,0),(51,'Employee Creation Wizard','No existing version. New major version of Employee Creation Wizard','TEST_SUITE',1,0,0),(52,'Employee CV','No existing version. New major version of Employee CV','TEST_SUITE',1,0,0),(53,'Employee Grid View','No existing version. New major version of Employee Grid View','TEST_SUITE',1,0,0),(54,'Visual Reports','No existing version. New major version of Visual Reports','TEST_SUITE',1,0,0),(55,'Dakar Intelligence','No existing version. New major version of Dakar Intelligence','TEST_SUITE',1,0,0),(56,'Organisation Chart','No existing version. New major version of Organisation Chart','TEST_SUITE',1,0,0),(57,'My Company / Last Viewed','No existing version. New major version of My Company / Last Viewed','TEST_SUITE',1,0,0),(58,'All Notifications','No existing version. New major version of All Notifications','TEST_SUITE',1,0,0),(59,'New Employments','No existing version. New major version of New Employments','TEST_SUITE',1,0,0),(60,'Terminations','No existing version. New major version of Terminations','TEST_SUITE',1,0,0),(61,'Quick Links','No existing version. New major version of Quick Links','TEST_SUITE',1,0,0),(62,'User Avatar','No existing version. New major version of User Avatar','TEST_SUITE',1,0,0),(63,'Main Menu','No existing version. New major version of Main Menu','TEST_SUITE',1,0,0),(64,'Main Menu - Payroll','No existing version. New major version of Main Menu - Payroll','TEST_SUITE',1,0,0),(65,'Employee List','No existing version. New major version of Employee List','TEST_SUITE',1,0,0),(66,'Documents','No existing version. New major version of Documents','TEST_SUITE',1,0,0),(67,'Employee Others','No existing version. New major version of Employee Others','TEST_SUITE',1,0,0),(68,'Payroll','No existing version. New major version of Payroll','TEST_SUITE',1,0,0),(69,'Payroll Statistics','No existing version. New major version of Payroll Statistics','TEST_SUITE',1,0,0),(70,'Absence Statistics','No existing version. New major version of Absence Statistics','TEST_SUITE',1,0,0),(71,'Reports','No existing version. New major version of Reports','TEST_SUITE',1,0,0),(72,'Monthly Reports','No existing version. New major version of Monthly Reports','TEST_SUITE',1,0,0),(73,'Yearly Reports','No existing version. New major version of Yearly Reports','TEST_SUITE',1,0,0),(74,'Bulk Updates','No existing version. New major version of Bulk Updates','TEST_SUITE',1,0,0),(75,'Settings','No existing version. New major version of Settings','TEST_SUITE',1,0,0),(76,'Top Level of: Root','No existing version. New major version of Top Level of: Root','TEST',1,0,0),(77,'Top Level of: Dakar Web','No existing version. New major version of Top Level of: Dakar Web','TEST',1,0,0),(78,'Top Level of: Login Screen','No existing version. New major version of Top Level of: Login Screen','TEST',1,0,0),(80,'User Name','No existing version. New major version of User Name','TEST',1,0,0),(82,'User Password','No existing version. New major version of User Password','TEST',1,0,0),(83,'Top Level of: Login Button','No existing version. New major version of Top Level of: Login Button','TEST',1,0,0),(84,'Top Level of: Home Page','No existing version. New major version of Top Level of: Home Page','TEST',1,0,0),(85,'Top Level of: Home Page Info Bar','No existing version. New major version of Top Level of: Home Page Info Bar','TEST',1,0,0),(86,'Current Module Indicator','No existing version. New major version of Current Module Indicator','TEST',1,0,0),(87,'Current Company','No existing version. New major version of Current Company','TEST',1,0,0),(88,'Top Level of: Menu Toggle','No existing version. New major version of Top Level of: Menu Toggle','TEST',1,0,0),(89,'Top Level of: Home Page Top Right Nav Bar','No existing version. New major version of Top Level of: Home Page Top Right Nav Bar','TEST',1,0,0),(90,'Top Level of: Authorisations','No existing version. New major version of Top Level of: Authorisations','TEST',1,0,0),(91,'Top Level of: Employee Creation Wizard','No existing version. New major version of Top Level of: Employee Creation Wizard','TEST',1,0,0),(92,'Top Level of: Employee CV','No existing version. New major version of Top Level of: Employee CV','TEST',1,0,0),(93,'Top Level of: Employee Grid View','No existing version. New major version of Top Level of: Employee Grid View','TEST',1,0,0),(94,'Top Level of: Visual Reports','No existing version. New major version of Top Level of: Visual Reports','TEST',1,0,0),(95,'Top Level of: Dakar Intelligence','No existing version. New major version of Top Level of: Dakar Intelligence','TEST',1,0,0),(96,'Top Level of: Organisation Chart','No existing version. New major version of Top Level of: Organisation Chart','TEST',1,0,0),(97,'Top Level of: My Company / Last Viewed','No existing version. New major version of Top Level of: My Company / Last Viewed','TEST',1,0,0),(98,'Top Level of: All Notifications','No existing version. New major version of Top Level of: All Notifications','TEST',1,0,0),(99,'Top Level of: New Employments','No existing version. New major version of Top Level of: New Employments','TEST',1,0,0),(100,'Top Level of: Terminations','No existing version. New major version of Top Level of: Terminations','TEST',1,0,0),(101,'Top Level of: Quick Links','No existing version. New major version of Top Level of: Quick Links','TEST',1,0,0),(102,'Top Level of: User Avatar','No existing version. New major version of Top Level of: User Avatar','TEST',1,0,0),(103,'Top Level of: Main Menu','No existing version. New major version of Top Level of: Main Menu','TEST',1,0,0),(104,'Top Level of: Main Menu - Payroll','No existing version. New major version of Top Level of: Main Menu - Payroll','TEST',1,0,0),(105,'Top Level of: Employee List','No existing version. New major version of Top Level of: Employee List','TEST',1,0,0),(106,'Top Level of: Documents','No existing version. New major version of Top Level of: Documents','TEST',1,0,0),(107,'Top Level of: Employee Others','No existing version. New major version of Top Level of: Employee Others','TEST',1,0,0),(108,'Top Level of: Payroll','No existing version. New major version of Top Level of: Payroll','TEST',1,0,0),(109,'Top Level of: Payroll Statistics','No existing version. New major version of Top Level of: Payroll Statistics','TEST',1,0,0),(110,'Top Level of: Absence Statistics','No existing version. New major version of Top Level of: Absence Statistics','TEST',1,0,0),(111,'Top Level of: Reports','No existing version. New major version of Top Level of: Reports','TEST',1,0,0),(112,'Top Level of: Monthly Reports','No existing version. New major version of Top Level of: Monthly Reports','TEST',1,0,0),(113,'Top Level of: Yearly Reports','No existing version. New major version of Top Level of: Yearly Reports','TEST',1,0,0),(114,'Top Level of: Bulk Updates','No existing version. New major version of Top Level of: Bulk Updates','TEST',1,0,0),(115,'Top Level of: Settings','No existing version. New major version of Top Level of: Settings','TEST',1,0,0),(116,'Authorisations Form','','ENTITY',1,0,0),(117,'Company','','ENTITY',1,0,0),(118,'Company Combo','','ENTITY',1,0,0),(119,'Grouping View ','','ENTITY',1,0,0),(120,'Grouping View Combo','','ENTITY',1,0,0),(121,'Accept Criteria','','ENTITY',1,0,0),(122,'Authorisations Grid','','ENTITY',1,0,0),(123,'Authorisations Form','No existing version. New major version of Authorisations Form','TEST_SUITE',1,0,0),(124,'Accept Criteria','No existing version. New major version of Accept Criteria','TEST_SUITE',1,0,0),(125,'Authorisations Grid','No existing version. New major version of Authorisations Grid','TEST_SUITE',1,0,0),(126,'Top Level of: Authorisations Form','No existing version. New major version of Top Level of: Authorisations Form','TEST',1,0,0),(127,'Company','No existing version. New major version of Company','TEST',1,0,0),(128,'Company Combo','No existing version. New major version of Company Combo','TEST',1,0,0),(129,'Grouping View ','No existing version. New major version of Grouping View ','TEST',1,0,0),(130,'Grouping View Combo','No existing version. New major version of Grouping View Combo','TEST',1,0,0),(131,'Top Level of: Accept Criteria','No existing version. New major version of Top Level of: Accept Criteria','TEST',1,0,0),(132,'Top Level of: Authorisations Grid','No existing version. New major version of Top Level of: Authorisations Grid','TEST',1,0,0),(133,'Employee Creation Wizard - Step 1','','ENTITY',1,0,0),(134,'Name','','ENTITY',1,0,0),(135,'Surname','','ENTITY',1,0,0),(136,'Identity Card Number','','ENTITY',1,0,0),(137,'Employee Code','','ENTITY',1,0,0),(138,'Address','','ENTITY',1,0,0),(139,'Street','','ENTITY',1,0,0),(140,'Post Code','','ENTITY',1,0,0),(141,'Select A Town','','ENTITY',1,0,0),(142,'Select A Country','','ENTITY',1,0,0),(143,'Back','','ENTITY',1,0,0),(144,'Continue','','ENTITY',1,0,0),(145,'Employee Creation Wizard - Step 2','','ENTITY',1,0,0),(146,'Select A Gender','','ENTITY',1,0,0),(147,'Date Of Birth','','ENTITY',1,0,0),(148,'Date Of Employment','','ENTITY',1,0,0),(149,'Tax Number','','ENTITY',1,0,0),(150,'NI Number','','ENTITY',1,0,0),(151,'Select A Bank','','ENTITY',1,0,0),(152,'IBAN Number','','ENTITY',1,0,0),(153,'Email Address','','ENTITY',1,0,0),(154,'Mobile Number','','ENTITY',1,0,0),(155,'Back','','ENTITY',1,0,0),(156,'Continue','','ENTITY',1,0,0),(157,'Employee Creation Wizard - Step 3','','ENTITY',1,0,0),(158,'Select A Tax Status','','ENTITY',1,0,0),(159,'Select An Employment Type','','ENTITY',1,0,0),(160,'Select Company','','ENTITY',1,0,0),(161,'Select A Paygroup','','ENTITY',1,0,0),(162,'Select A Department','','ENTITY',1,0,0),(163,'Select a Schedule','','ENTITY',1,0,0),(164,'Full or Part Timer ?','','ENTITY',1,0,0),(165,'Special Part Timer','','ENTITY',1,0,0),(166,'Select a Grade','','ENTITY',1,0,0),(167,'Select a Cost Center','','ENTITY',1,0,0),(168,'Back','','ENTITY',1,0,0),(169,'Continue','','ENTITY',1,0,0),(170,'Employee Creation Wizard - Step 4','','ENTITY',1,0,0),(171,'Taxable Allowance (Permenant)','','ENTITY',1,0,0),(172,'Allowance Amount - Permanent','','ENTITY',1,0,0),(173,'Taxable Allowance 2 (Permenant)','','ENTITY',1,0,0),(174,'Allowance Amount - Permanent','','ENTITY',1,0,0),(175,'Non Taxable Allowance 1 (Permenant)','','ENTITY',1,0,0),(176,'Allowance Amount - Permanent','','ENTITY',1,0,0),(177,'Non Taxable Allowance 2 (Permenant)','','ENTITY',1,0,0),(178,'Back','','ENTITY',1,0,0),(179,'Continue','','ENTITY',1,0,0),(180,'Employee Creation Wizard - Step 5','','ENTITY',1,0,0),(181,'Annual Salary','','ENTITY',1,0,0),(182,'Hourly Rate','','ENTITY',1,0,0),(183,'Back','','ENTITY',1,0,0),(184,'Create Employee','','ENTITY',1,0,0),(185,'Heading ECW Step 1','','ENTITY',1,0,0),(186,'Heading ECW Step 2','','ENTITY',1,0,0),(187,'Heading ECW Step 3','','ENTITY',1,0,0),(188,'Heading ECW Step 4','','ENTITY',1,0,0),(189,'Heading ECW Step 5','','ENTITY',1,0,0),(190,'Employee Creation Wizard','','ENTITY',1,0,0),(191,'Employee Creation Wizard - Title','','ENTITY',1,0,0);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-18 10:09:03
