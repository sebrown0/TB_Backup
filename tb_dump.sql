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
) ENGINE=InnoDB AUTO_INCREMENT=9019 DEFAULT CHARSET=utf8 COMMENT='	IN id INT UNSIGNED, IN entityTestId INT UNSIGNED, IN entityId INT UNSIGNED, IN entityEntityId INT UNSIGNED, \n	IN entityTestName VARCHAR(200), IN createdByEmployeeId VARCHAR(45), IN entityTestDesc VARCHAR(1000), \n    IN testFunction VARCHAR(1000), IN dataIn VARCHAR(1000), IN dataOut VARCHAR(1000), IN dataExpected VARCHAR(1000), \n    IN failureHaltsTest TINYINT, IN primaryTestCat VARCHAR(1000), IN secondaryTestCat VARCHAR(1000),\n    IN testCreated DATE, IN newVerCat ENUM(''MAJOR'', ''MINOR'', ''BUILD''), \n    IN parentId INT UNSIGNED, IN parentEntityTestId INT UNSIGNED,\n    IN lastRunDate DATE, IN lastRunTime TIME)\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_test_insert`
--

LOCK TABLES `data_entity_test_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_test_insert` DISABLE KEYS */;
INSERT INTO `data_entity_test_insert` VALUES (9000,9000,9000,'Top Level of: JSPanel',9000,9000,'SB_1',1,1,'This is the top level test for JSPanel. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9001,9001,9001,'Top Level of: JSPanel Standard',9001,9001,'SB_1',9000,9000,'Standard JS Panel','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9002,9002,9002,'Top Level of: JSPanel Header',9002,9002,'SB_1',9000,9000,' JS Panel header','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9003,9003,9003,'JS Footer',9003,9003,'SB_1',9000,9000,'Footer of JS Panel','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9004,9004,9004,'Top Level of: JS Content',9004,9004,'SB_1',9000,9000,'This is the top level test for JS Content. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9005,9005,9005,'JSMinBox',9005,9005,'SB_1',9000,9000,'Minimise JS Panel','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9006,9006,9006,'JSResizeit',9006,9006,'SB_1',9000,9000,'Resize JS Panel','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9007,9007,9007,'JSHeaderLogo',9007,9007,'SB_1',9002,9002,'JS Panel logo','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9008,9008,9008,'Top Level of: JSTitlebar',9008,9008,'SB_1',9002,9002,'This is the top level test for JSTitlebar. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9009,9009,9009,'Top Level of: JSControlbar',9009,9009,'SB_1',9002,9002,'This is the top level test for JSControlbar. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9010,9010,9010,'Top Level of: JSHeaderToolbarActive',9010,9010,'SB_1',9002,9002,'This is the top level test for JSHeaderToolbarActive. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9011,9011,9011,'Top Level of: JSDropdown',9011,9011,'SB_1',9000,9000,'This is the top level test for JSDropdown. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-20','N\r'),(9012,9012,9012,'JSDropdownToggle',9012,9012,'SB_1',9011,9011,'JS Panel toggle','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9013,9013,9013,'JSDropdownMenu',9013,9013,'SB_1',9011,9011,'JS Panel dropdown menu','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9014,9014,9014,'JSPanelSwitchRotate',9014,9014,'SB_1',9010,9010,'Rotate thru JS Panels','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9015,9015,9015,'JSPanelBtn',9015,9015,'SB_1',9009,9009,'JS Panel button','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9016,9016,9016,'JSPanelBtnNormalise',9016,9016,'SB_1',9009,9009,'JS Panel button normalise','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9017,9017,9017,'JSPanelBtnExpand',9017,9017,'SB_1',9009,9009,'JS Panel button expand','Element','-','-','-',0,'NA  ','NA','2021-05-20','N\r'),(9018,9018,9018,'Top Level of: DKGrid',9018,9018,'SB_1',1,1,'This is the top level test for DKGrid. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-20','N\r');
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
INSERT INTO `data_test_suite_insert` VALUES (9000,9000,'JSPanel',1,1,'Test JS Panel','JSPanel','N\r'),(9001,9001,'JSPanel Standard',9000,9000,'Test JS Panel standard','JSStandard','N\r'),(9002,9002,'JSPanel Header',9000,9000,'Test JS Panel header','JSHeader','N\r'),(9004,9004,'JS Content',9000,9000,'Test JS Panel content','JSContent','N\r'),(9008,9008,'JSTitlebar',9002,9002,'Test JS Panel title bar','JSTitlebar','N\r'),(9009,9009,'JSControlbar',9002,9002,'Test JS Panel controlbar','JSControlbar','N\r'),(9010,9010,'JSHeaderToolbarActive',9002,9002,'Test JS Panel header toolbar','JSHeaderToolbarActive','N\r'),(9011,9011,'JSDropdown',9000,9000,'Test JS Panel dropdown','JSDropdown','N\r'),(9018,9018,'DKGrid',1,1,'Test Dakar grid','DKGrid','N\r');
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
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_row_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_row_id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_row_id_UNIQUE` (`entity_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,9000,9000),(2,9001,9001),(3,9003,9003),(4,9004,9004),(5,9005,9005),(6,9018,9018),(7,9002,9002),(8,9006,9006),(9,9007,9007),(10,9008,9008),(11,9009,9009),(12,9010,9010),(13,9011,9011),(14,9012,9012),(15,9013,9013),(16,9014,9014),(17,9015,9015),(18,9016,9016),(19,9017,9017),(20,9019,9019),(21,9020,9020),(22,9021,9021),(23,9022,9022),(24,9023,9023),(25,9024,9024),(26,9025,9025),(92,9026,9026),(93,9027,9027),(94,9028,9028),(100,177,177),(101,181,181),(102,185,185);
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

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
  `is_element` tinyint(4) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` VALUES (1,1,'rootER',1,1,'Root',NULL,NULL,1,0),(2,2,'Dakar Web',2,2,'Application',1,1,2,0),(3,3,'Login Screen',3,6,'Form',2,2,0,0),(5,5,'User Name',5,18,'Text In',3,3,5,0),(7,7,'User Password',7,18,'Text In',3,3,0,0),(8,8,'Login Button',8,23,'Button - Redirect',3,3,8,0),(9,9,'Home Page',9,8,'Parent Form',8,8,9,0),(10,10,'Home Page Info Bar',10,11,'Info Bar',9,9,10,0),(11,11,'Dakar Logo',11,13,'Image',10,10,11,0),(12,12,'Current Module Indicator',12,21,'Label',10,10,12,0),(13,13,'Menu Toggle',13,25,'Button - Function',10,10,13,0),(14,14,'Current Company',14,20,'Combo',10,10,14,0),(15,15,'Home Page Top Right Nav Bar',15,10,'Nav Bar',9,9,0,0),(16,16,'Authorisations',16,24,'Button - Display',15,15,16,0),(17,17,'Employee Creation Wizard',17,24,'Button - Display',15,15,17,0),(18,18,'Employee CV',18,24,'Button - Display',15,15,18,0),(19,19,'Employee Grid View',19,24,'Button - Display',15,15,19,0),(20,20,'Visual Reports',20,24,'Button - Display',15,15,20,0),(21,21,'Dakar Intelligence',21,24,'Button - Display',15,15,21,0),(22,22,'Organisation Chart',22,24,'Button - Display',15,15,22,0),(23,23,'My Company / Last Viewed',23,24,'Button - Display',15,15,23,0),(24,24,'All Notifications',24,24,'Button - Display',15,15,24,0),(25,25,'New Employments',25,24,'Button - Display',15,15,25,0),(26,26,'Terminations',26,24,'Button - Display',15,15,26,0),(27,27,'Quick Links',27,24,'Button - Display',15,15,27,0),(28,28,'User Avatar',28,24,'Button - Display',15,15,28,0),(29,29,'Main Menu',29,10,'Nav Bar',9,9,29,0),(30,30,'Main Menu - Payroll',30,10,'Nav Bar',29,29,30,0),(31,31,'Employee List',31,24,'Button - Display',30,30,0,0),(32,32,'Documents',32,24,'Button - Display',30,30,0,0),(33,33,'Employee Others',33,24,'Button - Display',30,30,33,0),(34,34,'Payroll',34,24,'Button - Display',30,30,34,0),(35,35,'Payroll Statistics',35,24,'Button - Display',30,30,35,0),(36,36,'Absence Statistics',36,24,'Button - Display',30,30,36,0),(37,37,'Reports',37,24,'Button - Display',30,30,37,0),(38,38,'Monthly Reports',38,24,'Button - Display',30,30,38,0),(39,39,'Yearly Reports',39,24,'Button - Display',30,30,39,0),(40,40,'Bulk Updates',40,24,'Button - Display',30,30,40,0),(41,41,'Settings',41,24,'Button - Display',30,30,41,0),(42,42,'Authorisations Form',42,6,'Form',16,16,42,0),(43,43,'Company',43,21,'Label',42,42,43,0),(44,44,'Company Combo',44,20,'Combo',42,42,44,0),(45,45,'Grouping View ',45,21,'Label',42,42,45,0),(46,46,'Grouping View Combo',46,20,'Combo',42,42,46,0),(47,47,'Accept Criteria',47,25,'Button - Function',42,42,47,0),(48,48,'Authorisations Grid',48,12,'Grid',42,42,48,0),(49,49,'Employee Creation Wizard - Step 1',49,26,'Function',106,106,49,0),(50,50,'Name',50,18,'Text In',49,49,50,0),(51,51,'Surname',51,18,'Text In',49,49,51,0),(52,52,'Identity Card Number',52,18,'Text In',49,49,52,0),(53,53,'Employee Code',53,18,'Text In',49,49,53,0),(54,54,'Address',54,18,'Text In',49,49,54,0),(55,55,'Street',55,18,'Text In',49,49,55,0),(56,56,'Post Code',56,18,'Text In',49,49,56,0),(57,57,'Select A Town',57,15,'List',49,49,57,0),(58,58,'Select A Country',58,15,'List',49,49,58,0),(59,59,'Back',59,25,'Button - Function',49,49,59,0),(60,60,'Continue',60,25,'Button - Function',49,49,60,0),(61,61,'Employee Creation Wizard - Step 2',61,26,'Function',106,106,61,0),(62,62,'Select A Gender',62,18,'Text In',61,61,62,0),(63,63,'Date Of Birth',63,18,'Text In',61,61,63,0),(64,64,'Date Of Employment',64,18,'Text In',61,61,64,0),(65,65,'Tax Number',65,18,'Text In',61,61,65,0),(66,66,'NI Number',66,18,'Text In',61,61,66,0),(67,67,'Select A Bank',67,15,'List',61,61,67,0),(68,68,'IBAN Number',68,18,'Text In',61,61,68,0),(69,69,'Email Address',69,18,'Text In',61,61,69,0),(70,70,'Mobile Number',70,18,'Text In',61,61,70,0),(71,71,'Back',71,25,'Button - Function',61,61,71,0),(72,72,'Continue',72,25,'Button - Function',61,61,72,0),(73,73,'Employee Creation Wizard - Step 3',73,26,'Function',106,106,73,0),(74,74,'Select A Tax Status',74,15,'List',73,73,74,0),(75,75,'Select An Employment Type',75,15,'List',73,73,75,0),(76,76,'Select Company',76,15,'List',73,73,76,0),(77,77,'Select A Paygroup',77,15,'List',73,73,77,0),(78,78,'Select A Department',78,15,'List',73,73,78,0),(79,79,'Select a Schedule',79,15,'List',73,73,79,0),(80,80,'Full or Part Timer ?',80,15,'List',73,73,80,0),(81,81,'Special Part Timer',81,15,'List',73,73,81,0),(82,82,'Select a Grade',82,15,'List',73,73,82,0),(83,83,'Select a Cost Center',83,15,'List',73,73,83,0),(84,84,'Back',84,25,'Button - Function',73,73,84,0),(85,85,'Continue',85,25,'Button - Function',73,73,85,0),(86,86,'Employee Creation Wizard - Step 4',86,26,'Function',106,106,86,0),(87,87,'Taxable Allowance 1 (Permenant)',87,15,'List',86,86,87,0),(88,88,'Allowance Amount - Permanent',88,18,'Text In',86,86,88,0),(89,89,'Taxable Allowance 2 (Permenant)',89,15,'List',86,86,89,0),(90,90,'Allowance Amount - Permanent',90,18,'Text In',86,86,90,0),(91,91,'Non Taxable Allowance 1 (Permenant)',91,15,'List',86,86,91,0),(92,92,'Allowance Amount - Permanent',92,18,'Text In',86,86,92,0),(93,93,'Non Taxable Allowance 2 (Permenant)',93,15,'List',86,86,93,0),(94,94,'Back',94,25,'Button - Function',86,86,94,0),(95,95,'Continue',95,25,'Button - Function',86,86,95,0),(96,96,'Employee Creation Wizard - Step 5',96,26,'Function',106,106,96,0),(97,97,'Annual Salary',97,18,'Text In',96,96,97,0),(98,98,'Hourly Rate',98,18,'Text In',96,96,98,0),(99,99,'Back',99,25,'Button - Function',96,96,99,0),(100,100,'Create Employee',100,25,'Button - Function',96,96,100,0),(101,101,'Heading ECW Step 1',101,30,'Header 3',49,49,101,0),(102,102,'Heading ECW Step 2',102,30,'Header 3',61,61,102,0),(103,103,'Heading ECW Step 3',103,30,'Header 3',73,73,103,0),(104,104,'Heading ECW Step 4',104,30,'Header 3',86,86,104,0),(105,105,'Heading ECW Step 5',105,30,'Header 3',96,96,105,0),(106,106,'Employee Creation Wizard',106,6,'Form',17,17,106,0),(107,107,'Employee Creation Wizard - Title',107,27,'Titlebar',106,106,107,0),(108,108,'Employee CV',108,6,'Form',18,18,108,0),(109,109,'Employee CV - Title',109,27,'Titlebar',108,108,109,0),(110,110,'Company - Label',110,21,'Label',108,108,110,0),(111,111,'Company - List',111,15,'List',108,108,111,0),(112,112,'Paygroup - Label',112,21,'Label',108,108,112,0),(113,113,'Paygroup - List',113,15,'List',108,108,113,0),(114,114,'Employee - Label',114,21,'Label',108,108,114,0),(115,115,'Employee - List',115,15,'List',108,108,115,0),(116,116,'Accept Criteria',116,25,'Button - Function',108,108,116,0),(117,117,'Accept Criteria - Text',117,33,'Text',116,116,117,0),(118,118,'Bio Info',118,35,'Container',108,108,118,0),(119,119,'Bio Info - Image',119,13,'Image',118,118,119,0),(120,120,'Employee Name',120,31,'Header 4',118,118,120,0),(121,121,'Employee Name With Salutation',121,34,'Paragraph',118,118,121,0),(122,122,'Employee Company',122,34,'Paragraph',118,118,122,0),(123,123,'Employee Birthday',123,34,'Paragraph',118,118,123,0),(124,124,'User FaFa',124,38,'FaFa',118,118,124,0),(125,125,'Company FaFa',125,38,'FaFa',118,118,125,0),(126,126,'Birthday FaFa',126,38,'FaFa',118,118,126,0),(127,127,'Bio Content',127,35,'Container',118,118,127,0),(128,128,'Accordion - CV',128,36,'Accordion',108,108,128,0),(129,129,'Accordion - CV - Career',129,37,'Accordion Key',128,128,129,0),(130,130,'Grid - Career',130,12,'Grid',129,129,130,0),(131,131,'Acc Key - CV - Allowance',131,37,'Accordion Key',128,128,131,0),(132,132,'Grid - Allowance',132,12,'Grid',131,131,132,0),(133,133,'Acc Key - CV - Salary',133,37,'Accordion Key',128,128,133,0),(134,134,'Grid - Salary',134,12,'Grid',133,133,134,0),(135,135,'Acc Key - Emp Schedule',135,37,'Accordion Key',128,128,135,0),(136,136,'Grid - Emp Schedule',136,12,'Grid',135,135,136,0),(137,137,'Acc Key - Working Permit',137,37,'Accordion Key',128,128,137,0),(138,138,'Grid - Work Permit',138,12,'Grid',137,137,138,0),(139,139,'Save',139,25,'Button - Function',108,108,139,0),(140,140,'Form - Save',140,7,'Modal Form',139,139,140,0),(141,141,'Form - Save - Header',141,39,'Modal Header',140,140,141,0),(142,142,'Form - Save - Title',142,40,'Modal Title',141,141,142,0),(143,143,'Form - Save - Body',143,41,'Modal Body',140,140,143,0),(144,144,'Form - Save - Footer',144,42,'Modal Footer',140,140,144,0),(145,145,'Button Ok',145,25,'Button - Function',144,144,145,0),(146,146,'Button Cancel',146,25,'Button - Function',144,144,146,0),(147,147,'Employee Grid View - Grid',147,12,'Grid',148,148,147,0),(148,148,'Employee Grid View - Form',148,6,'Form',19,19,148,0),(149,149,'Visual Reports - Form',168,6,'Form',20,20,168,0),(150,150,'Dakar Intelligence - Form',169,6,'Form',21,21,169,0),(151,151,'Employee Reports',170,62,'Card',150,150,170,0),(157,157,'Employee Reports - Card Group',183,63,'Card Group',151,151,183,0),(158,158,'Employee Reports - Employee Basic Details',184,64,'Card Element',157,157,184,0),(159,159,'Employee Reports - Employee Basic Details Header',185,68,'Element Header',158,158,185,0),(160,160,'Employee Reports - Employee Basic Details Body',186,66,'Card Body',158,158,186,0),(161,161,'Employee Reports - Employee Basic Details Title',187,67,'Card Title',158,158,187,0),(162,162,'Employee Reports - Employee Basic Details (Grid View)',188,64,'Card Element',157,157,188,0),(163,163,'Employee Reports - Employee Basic Details (Grid View) - Card Header',189,68,'Element Header',162,162,189,0),(164,164,'Employee Reports - Employee Basic Details (Grid View) - Card Body',190,66,'Card Body',162,162,190,0),(165,165,'Employee Reports - Employee Basic Details (Grid View) - Card Title',191,67,'Card Title',162,162,191,0),(166,166,'Payroll Reports',197,62,'Card',150,150,192,0),(167,167,'Payroll Reports - Card Group',192,63,'Card Group',166,166,193,0),(168,168,'Payroll Reports - Payroll Statistics - Gross/Tax/NI',196,64,'Card Element',166,166,197,0),(170,170,'Payroll Reports - Payroll Statistics - Gross/Tax/NI Body',194,66,'Card Body',168,168,195,0),(171,171,'Payroll Reports - Payroll Statistics - Gross/Tax/NI Title',195,67,'Card Title',168,168,196,0),(172,172,'Payroll Reports - Payroll Statistics - Extras Breakdown Report',201,64,'Card Element',166,166,201,0),(173,173,'Payroll Statistics - Extras Breakdown Report Header',198,68,'Element Header',172,172,198,0),(174,174,'Payroll Statistics - Extras Breakdown Report Body',199,66,'Card Body',172,172,199,0),(175,175,'Payroll Statistics - Extras Breakdown Report Title',200,67,'Card Title',172,172,200,0),(176,176,'Payroll Reports - Payroll - Extras Breakdown by Cost Center',205,64,'Card Element',166,166,205,0),(177,177,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Header',202,68,'Element Header',176,176,202,0),(178,178,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Body',203,66,'Card Body',176,176,203,0),(179,179,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Title',204,67,'Card Title',176,176,204,0),(180,180,'Payroll Reports - Payroll - Allowances Breakdown',209,64,'Card Element',166,166,209,0),(181,181,'Payroll Reports - Payroll - Allowances Breakdown - Element Header',206,68,'Element Header',180,180,206,0),(182,182,'Payroll Reports - Payroll - Allowances Breakdown - Card Body',207,66,'Card Body',180,180,207,0),(183,183,'Payroll Reports - Payroll - Allowances Breakdown - Card Title',208,67,'Card Title',180,180,208,0),(184,184,'Payroll Reports - Payroll Statistics - Bank Cash Payments',213,64,'Card Element',166,166,213,0),(185,185,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Element Header',210,68,'Element Header',184,184,210,0),(186,186,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Card Body',211,66,'Card Body',184,184,211,0),(187,187,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Card Title',212,67,'Card Title',184,184,212,0),(188,188,'Payroll Reports - Payroll Statistics - Unions',217,64,'Card Element',166,166,217,0),(189,189,'Payroll Reports - Payroll Statistics - Unions - Element Header',214,68,'Element Header',188,188,214,0),(190,190,'Payroll Reports - Payroll Statistics - Unions - Card Body',215,66,'Card Body',188,188,215,0),(191,191,'Payroll Reports - Payroll Statistics - Unions - Card Title',216,67,'Card Title',188,188,216,0),(192,192,'Payroll Changes',223,62,'Card',150,150,223,0),(193,193,'Payroll Changes - Card Group',218,63,'Card Group',192,192,218,0),(194,194,'2020 Payroll Changes - Card Element',219,64,'Card Element',193,193,219,0),(195,195,'2020 Payroll Changes - Element Header',220,68,'Element Header',194,194,220,0),(196,196,'2020 Payroll Changes - Card Body',221,66,'Card Body',194,194,221,0),(197,197,'2020 Payroll Changes - Card Title',222,67,'Card Title',194,194,222,0),(198,198,'2019 Payroll Changes - Card Element',227,64,'Card Element',192,192,227,0),(199,199,'2019 Payroll Changes - Element Header',224,68,'Element Header',198,198,224,0),(200,200,'2019 Payroll Changes - Card Element - Card Body',225,66,'Card Body',198,198,225,0),(201,201,'2019 Payroll Changes - Card Element - Card Title',226,67,'Card Title',198,198,226,0),(202,202,'Absences',233,62,'Card',150,150,233,0),(203,203,'Absences - Card Group',228,63,'Card Group',202,202,228,0),(204,204,'Absences Consumed - Card Element',229,64,'Card Element',203,203,229,0),(205,205,'Absences Consumed - Element Header',230,68,'Element Header',204,204,230,0),(206,206,'Absences Consumed - Card Body',231,66,'Card Body',204,204,231,0),(207,207,'Absences Consumed - Card Title',232,67,'Card Title',204,204,232,0),(208,208,'Absence Entitlements',237,64,'Card Element',203,203,237,0),(209,209,'Absence Entitlements - Element Header',234,68,'Element Header',208,208,234,0),(210,210,'Absence Entitlements - Card Body',235,66,'Card Body',208,208,235,0),(211,211,'Absence Entitlements - Card Title',236,67,'Card Title',208,208,236,0),(212,212,'Absence Entitlements (Grid View)',241,64,'Card Element',203,203,241,0),(213,213,'Absence Entitlements (Grid View) - Element Header',238,68,'Element Header',212,212,238,0),(214,214,'Absence Entitlements (Grid View) - Card Body',239,66,'Card Body',212,212,239,0),(215,215,'Absence Entitlements (Grid View) - Card Title',240,67,'Card Title',212,212,240,0),(216,216,'Employee Reports - Card Header',249,65,'Card Header',151,151,249,0),(220,220,'Employee Reports - Card Header - FaFa',247,38,'FaFa',216,216,247,0),(221,221,'Employee Reports - Card Header - Text Element',248,33,'Text',216,216,248,0),(223,223,'Employee Reports - Employee Basic Details Header - FaFa',250,38,'FaFa',159,159,250,0),(225,225,'Employee Reports - Employee Basic Details (Grid View) - Card Header - FaFa',251,38,'FaFa',163,163,251,0),(226,226,'Payroll Reports - Card Header',254,65,'Card Header',166,166,254,0),(227,227,'Payroll Reports - Card Header - FaFa',252,38,'FaFa',226,226,252,0),(228,228,'Payroll Reports - Card Header - Text Element',253,33,'Text',226,226,253,0),(229,229,'Payroll Reports - Element Header',256,68,'Element Header',168,168,256,0),(230,230,'Payroll Reports - Element Header - FaFa',255,38,'FaFa',229,229,255,0),(233,233,'Payroll Statistics - Extras Breakdown Report Header - FaFa',258,38,'FaFa',173,173,258,0),(235,235,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Header - FaFa',259,38,'FaFa',177,177,259,0),(237,237,'Payroll Reports - Payroll - Allowances Breakdown - Card Header - FaFa',260,38,'FaFa',181,181,260,0),(239,239,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Element Header - FaFa',261,38,'FaFa',185,185,261,0),(241,241,'Payroll Reports - Payroll Statistics - Unions - Element Header - FaFa',262,38,'FaFa',189,189,262,0),(243,243,'2020 Payroll Changes - Element Header - FaFa',263,38,'FaFa',195,195,263,0),(245,245,'2019 Payroll Changes - Element Header - FaFa',264,38,'FaFa',199,199,264,0),(247,247,'Absences Consumed - Element Header - FaFa',265,38,'FaFa',205,205,265,0),(249,249,'Absence Entitlements - Element Header - FaFa',266,38,'FaFa',209,209,266,0),(251,251,'Absence Entitlements (Grid View) - Element Header - FaFa',267,38,'FaFa',213,213,267,0),(9000,9000,'JSPanel',149,43,'JSPanel',1,1,149,1),(9001,9001,'JSPanel Standard',150,44,'JSStandard',9000,9000,150,1),(9002,9002,'JSPanel Header',151,45,'JSHeader',9000,9000,151,1),(9003,9003,'JS Footer',152,48,'JSFtr',9000,9000,152,1),(9004,9004,'JS Content',153,46,'JSContent',9000,9000,153,1),(9005,9005,'JSMinBox',154,47,'JSMinBox',9000,9000,154,1),(9006,9006,'JSResizeit',155,49,'JSResizeit',9000,9000,155,1),(9007,9007,'JSHeaderLogo',156,50,'JSHeaderLogo',9002,9002,156,1),(9008,9008,'JSTitlebar',157,51,'JSTitlebar',9002,9002,157,1),(9009,9009,'JSControlbar',158,52,'JSControlbar',9002,9002,158,1),(9010,9010,'JSHeaderToolbarActive',159,53,'JSHeaderToolbarActive',9002,9002,159,1),(9011,9011,'JSDropdown',160,54,'JSDropdown',9000,9000,160,1),(9012,9012,'JSDropdownToggle',161,55,'JSDropdownToggle',9011,9011,161,1),(9013,9013,'JSDropdownMenu',162,56,'JSDropdownMenu',9011,9011,162,1),(9014,9014,'JSPanelSwitchRotate',163,57,'JSPanelSwitchRotate',9010,9010,163,1),(9015,9015,'JSPanelBtn',164,58,'JSPanelBtn',9009,9009,164,1),(9016,9016,'JSPanelBtnNormalise',165,59,'JSPanelBtnNormalise',9009,9009,165,1),(9017,9017,'JSPanelBtnExpand',166,60,'JSPanelBtnExpand',9009,9009,166,1),(9018,9018,'DKGrid',167,61,'DKGrid',1,1,167,1),(9019,9019,'Container',171,35,'Container',1,1,171,1),(9020,9020,'Card',172,62,'Card',9019,9019,172,1),(9021,9021,'Card Group',173,63,'Card Group',9020,9020,173,1),(9022,9022,'Card Element',174,64,'Card Element',9021,9021,174,1),(9023,9023,'Card Header',175,65,'Card Header',9022,9022,175,1),(9024,9024,'Card Body',176,66,'Card Body',9022,9022,176,1),(9025,9025,'Card Title',177,67,'Card Title',9022,9022,177,1),(9026,9026,'Text Element',242,33,'Text',1,1,242,1),(9027,9027,'FaFa',243,38,'FaFa',1,1,243,1),(9028,9028,'Element Header',244,68,'Element Header',9022,9022,244,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action`
--

LOCK TABLES `entity_action` WRITE;
/*!40000 ALTER TABLE `entity_action` DISABLE KEYS */;
INSERT INTO `entity_action` VALUES (2,5,'Enter the user name','Enter data','steveb','-','-',2),(4,7,'User password entry','Enter data','1234','-','-',2),(5,8,'Redirect the user to the Dakar Web homepage','Redirect to different page','-','-','-',1),(6,11,'Image: Dakar Logo','-','-','-','logo.png',3),(7,12,'Label: Current Module Indicator label text','-','-','-','Payroll',3),(8,13,'Button Function: Menu Toggle - Should toggle the view of the main menu show/hide.','Perform function','-','-','-',1),(9,14,'Combo: Current Company - Displays current company and list of all available companies. User can select the current company from here.','Peform function based on value','-','-','Mars~Mars Incorporated Ltd',5),(10,16,'Button Display: Authorisations - Display form','Display child','-','-','-',3),(11,17,'Button Display: Employee Creation Wizard ','Display child','-','-','-',1),(12,18,'Button Display: Employee CV','Display child','-','-','-',1),(13,19,'Button Display: Employee Grid View','Display child','-','-','-',1),(14,20,'Button Display: Visual Reports','Display child','-','-','-',1),(15,21,'Button Display: Dakar Intelligence','Display child','-','-','-',1),(16,22,'Button Display: Organisation Chart','Display child','-','-','-',1),(17,23,'Button Display: My Company / Last Viewed','Display child','-','-','-',1),(18,24,'Button Display: All Notifications','Display child','-','-','-',1),(19,25,'Button Display: New Employments','Display child','-','-','-',1),(20,26,'Button Display: Terminations','Display child','-','-','-',1),(21,27,'Button Display: Quick Links','Display child','-','-','-',1),(22,28,'Button Display: User Avatar','Display child','-','-','-',1),(23,31,'Button Display: Employee List','Display child','-','-','-',1),(24,32,'Button Display: Documents','Display child','-','-','-',1),(25,33,'Button Display: Employee Others','Display child','-','-','-',1),(26,34,'Button Display: Payroll','Display child','-','-','-',1),(27,35,'Button Display: Payroll Statistics','Display child','-','-','-',1),(28,36,'Button Display: Absence Statistics','Display child','-','-','-',1),(29,37,'Button Display: Reports','Display child','-','-','-',1),(30,38,'Button Display: Monthly Reports','Display child','-','-','-',1),(31,39,'Button Display: Yearly Reports','Display child','-','-','-',1),(32,40,'Button Display: Bulk Updates','Display child','-','-','-',1),(33,41,'Button Display: Settings','Display child','-','-','-',1),(34,43,'Label: Company label text','-','-','-','Company',3),(35,44,'Combo: Company Combo','Peform function based on value','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',5),(36,45,'Label: Grouping View  label text','-','-','-','Grouping View ',3),(37,46,'Combo: Grouping View Combo - ENTER ENTITY DESCRIPTION','Peform function based on value','-','-','Authorisation Group A~GROUP B~General Group~View All Groups',5),(38,47,'Button Function: Accept Criteria - Should apply the criteria and load matching records.','Perform function','-','-','-',1),(39,50,'Text Box Enter Data: Name','Enter data','TODO - Enter text that should be entered.','-','-',2),(40,51,'Text Box Enter Data: Surname','Enter data','TODO - Enter text that should be entered.','-','-',2),(41,52,'Text Box Enter Data: Identity Card Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(42,53,'Text Box Enter Data: Employee Code','Enter data','TODO - Enter text that should be entered.','-','-',2),(43,54,'Text Box Enter Data: Address','Enter data','TODO - Enter text that should be entered.','-','-',2),(44,55,'Text Box Enter Data: Street','Enter data','TODO - Enter text that should be entered.','-','-',2),(45,56,'Text Box Enter Data: Post Code','Enter data','TODO - Enter text that should be entered.','-','-',2),(46,57,'List: Select A Town. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(47,58,'List: Select A Country. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(48,59,'Button Function: Back - Should do nothing as this is the first step.','Perform function','-','-','-',1),(49,60,'Button Function: Continue - Should validate the data in step 1 and move to step 2.','Perform function','-','-','-',1),(50,62,'Text Box Enter Data: Select A Gender','Enter data','TODO - Enter text that should be entered.','-','-',2),(51,63,'Text Box Enter Data: Date Of Birth','Enter data','TODO - Enter text that should be entered.','-','-',2),(52,64,'Text Box Enter Data: Date Of Employment','Enter data','TODO - Enter text that should be entered.','-','-',2),(53,65,'Text Box Enter Data: Tax Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(54,66,'Text Box Enter Data: NI Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(55,67,'List: Select A Bank. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(56,68,'Text Box Enter Data: IBAN Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(57,69,'Text Box Enter Data: Email Address','Enter data','TODO - Enter text that should be entered.','-','-',2),(58,70,'Text Box Enter Data: Mobile Number','Enter data','TODO - Enter text that should be entered.','-','-',2),(59,71,'Button Function: Back - Take the user back to step 1','Perform function','-','-','-',1),(60,72,'Button Function: Continue - Should validate the data in step 2 and move to step 3.','Perform function','-','-','-',1),(61,74,'List: Select A Tax Status. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(62,75,'List: Select An Employment Type. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(63,76,'List: Select Company. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(64,77,'List: Select A Paygroup. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(65,78,'List: Select A Department. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(66,79,'List: Select a Schedule. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(67,80,'List: Full or Part Timer ?. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(68,81,'List: Special Part Timer. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(69,82,'List: Select a Grade. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(70,83,'List: Select a Cost Center. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(71,84,'Button Function: Back - Take the user back to step 2','Perform function','-','-','-',1),(72,85,'Button Function: Continue - Should validate the data in step 3 and move to step 4.','Perform function','-','-','-',1),(73,87,'List: Taxable Allowance 1 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(74,88,'Text Box Enter Data: Allowance Amount - Permanent','Enter data','TODO - Enter text that should be entered.','-','-',2),(75,89,'List: Taxable Allowance 2 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(76,90,'Text Box Enter Data: Allowance Amount - Permanent','Enter data','TODO - Enter text that should be entered.','-','-',2),(77,91,'List: Non Taxable Allowance 1 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(78,92,'Text Box Enter Data: Allowance Amount - Permanent','Enter data','TODO - Enter text that should be entered.','-','-',2),(79,93,'List: Non Taxable Allowance 2 (Permenant). Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~',6),(80,94,'Button Function: Back - Take the user back to step 3','Perform function','-','-','-',1),(81,95,'Button Function: Continue - Should validate the data in step 4 and move to step 5.','Perform function','-','-','-',1),(82,97,'Text Box Enter Data: Annual Salary','Enter data','TODO - Enter text that should be entered.','-','-',2),(83,98,'Text Box Enter Data: Hourly Rate','Enter data','TODO - Enter text that should be entered.','-','-',2),(84,99,'Button Function: Back - Take the user back to step 4','Perform function','-','-','-',1),(85,100,'Button Function: Create Employee - Should create the employee if data is valid. Else the user should be shown the invalid data.','Perform function','-','-','-',1),(86,101,'Header3: Heading ECW Step 1','-','-','-','Basic Details',7),(87,102,'Header3: Heading ECW Step 2','-','-','-','Basic Details',7),(88,103,'Header3: Heading ECW Step 3','-','-','-','Payroll Related Details',7),(89,104,'Header3: Heading ECW Step 4','-','-','-','Permanent Allowances',7),(90,105,'Header3: Heading ECW Step 5','-','-','-','Salary Details',7),(91,49,'Employee Creation Wizard - Step 1 performs function: enter employee basic details','Perform function','-','-','-',5),(92,61,'Employee Creation Wizard - Step 2 performs function: enter employee basic details','Perform function','-','-','-',5),(93,73,'Employee Creation Wizard - Step 3 performs function: enter employee payroll details','Perform function','-','-','-',5),(94,107,'Titlebar: Employee Creation Wizard - Title','-','-','-','Employee Creation Wizard',7),(95,86,'Employee Creation Wizard - Step 4 performs function: enter permanent allowances','Perform function','-','-','-',5),(96,96,'Employee Creation Wizard - Step 5 performs function: enter salary details and create the employee','Perform function','-','-','-',5),(97,109,'Titlebar: Employee CV - Title','-','-','-','Employee Payroll CV',7),(98,110,'Label: Company','-','-','-','Company',7),(99,111,'List: Company List. Select from the available list','Display data','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',6),(100,112,'Label: Paygroup - Label','-','-','-','Paygroup',7),(101,113,'List: Paygroup - List. Select from the available list','Display data','-','-','Monthly Paygroup',6),(102,114,'Label: Employee - Label','-','-','-','Employees',7),(103,115,'List: Employee - List. Select from the available list','Display data','-','-','#INF#',6),(104,116,'Button Function: Accept Criteria - Load the employees CV','Perform function','-','-','-',1),(105,117,'Text: Accept Criteria - Text','-','-','-','Accept Criteria',3),(106,118,'Container: Bio Info','Container','-','-','-',8),(107,119,'Image: Bio Info - Image','-','-','-','TODO - Enter image filename and extension',3),(108,120,'Header4: Employee Name','-','-','-','TODO - Enter header text',7),(109,121,'Paragraph: Employee Name With Salutation','Paragraph','-','-','TODO - Enter paragraph data',3),(110,122,'Paragraph: Employee Company','Paragraph','-','-','TODO - Enter paragraph data',3),(111,123,'Paragraph: Employee Birthday','Paragraph','-','-','TODO - Enter paragraph data',3),(112,124,'FaFa: User FaFa','-','-','-','fa fa-fw fa fa-user',3),(113,125,'FaFa: Company FaFa','-','-','-','fa fa-fw fa fa-bank',3),(114,126,'FaFa: Birthday FaFa','-','-','-','fa fa-fw fa fa-birthday-cake',3),(115,127,'Container: Bio Content','Container','-','-','-',8),(116,128,'Container: Accordion - CV','Container for accordion keys','-','-','-',8),(117,129,'Acc Key: Accordion - CV - Career','Expand or collapse accordion key','-','-','-',1),(118,131,'Acc Key: Acc Key - CV - Allowance','Expand or collapse accordion key','-','-','-',1),(119,133,'Acc Key: Acc Key - CV - Salary','Expand or collapse accordion key','-','-','-',1),(120,135,'Acc Key: Acc Key - Emp Schedule','Expand or collapse accordion key','-','-','-',1),(121,137,'Acc Key: Acc Key - Working Permit','Expand or collapse accordion key','-','-','-',1),(122,139,'Button Function: Save - Save changes to the CV based on the user response','Perform function','-','-','-',1),(123,141,'Modal Header: Form - Save - Header','Container','-','-','-',8),(124,142,'Modal Title: Form - Save - Title','-','-','-','Save Changes',3),(125,143,'Modal Body: Form - Save - Body','Container','-','-','Are you sure you want to save all changes?',8),(126,144,'Modal Footer: Form - Save - Footer','Container','-','-','-',8),(127,145,'Button Function: Button Ok - Save the changes in the employee CV','Perform function','-','-','-',1),(128,146,'Button Function: Button Cancel - Cancel the save and return to the parent form','Perform function','-','-','-',1),(129,9000,'JSPanel','Element','-','-','-',9),(130,9001,'JSStandard','Element','-','-','-',9),(131,9002,'JSHeader','Element','-','-','-',9),(132,9003,'JSFtr','Element','-','-','-',9),(133,9004,'JSContent','Element','-','-','-',9),(134,9005,'JSMinBox','Element','-','-','-',9),(135,9006,'JSResizeit','Element','-','-','-',9),(136,9007,'JSHeaderLogo','Element','-','-','-',9),(137,9008,'JSTitlebar','Element','-','-','-',9),(138,9009,'JSControlbar','Element','-','-','-',9),(139,9010,'JSHeaderToolbarActive','Element','-','-','-',9),(140,9011,'JSDropdown','Element','-','-','-',9),(141,9012,'JSDropdownToggle','Element','-','-','-',9),(142,9013,'JSDropdownMenu','Element','-','-','-',9),(143,9014,'JSPanelSwitchRotate','Element','-','-','-',9),(144,9015,'JSPanelBtn','Element','-','-','-',9),(145,9016,'JSPanelBtnNormalise','Element','-','-','-',9),(146,9017,'JSPanelBtnExpand','Element','-','-','-',9),(147,9018,'DKGrid','Element','-','-','-',9),(149,9019,'Container: Container','Container','-','-','-',8),(150,9020,'Card','Container','-','-','-',8),(151,9021,'Card Group','Container','-','-','-',8),(152,9022,'Card Element','Element','-','-','-',5),(153,9023,'Card Header','Function','-','-','-',5),(154,9024,'Card Body','Function','-','-','-',5),(155,9025,'Card Title','Data Out','-','-','-',3),(156,151,'Card','Container','-','-','-',8),(162,157,'Card Group','Container','-','-','-',8),(163,158,'Card Element','Element','-','-','-',5),(164,159,'Element Header','Function','-','-','-',5),(165,160,'Card Body','Function','-','-','-',5),(166,161,'Card Title','Data Out','-','-','-',3),(167,162,'Card Element','Element','-','-','-',5),(168,163,'Element Header','Function','-','-','-',5),(169,164,'Card Body','Function','-','-','-',5),(170,165,'Card Title','Data Out','-','-','-',3),(171,167,'Card Group','Container','-','-','-',8),(173,170,'Card Body','Function','-','-','-',5),(174,171,'Card Title','Data Out','-','-','Payroll Statistics - (Gross/Tax/NI Title etc)',3),(175,168,'Card Element','Element','-','-','-',5),(176,166,'Card','Container','-','-','-',8),(177,173,'Element Header','Function','-','-','-',5),(178,174,'Card Body','Function','-','-','-',5),(179,175,'Card Title','Data Out','-','-','Payroll Statistics - Extras Breakdown Report',3),(180,172,'Card Element','Element','-','-','-',5),(181,177,'Element Header','Function','-','-','-',5),(182,178,'Card Body','Function','-','-','-',5),(183,179,'Card Title','Data Out','-','-','Payroll Statistics - Extras Breakdown by Cost Center Report',3),(184,176,'Card Element','Element','-','-','-',5),(185,181,'Element Header','Function','-','-','-',5),(186,182,'Card Body','Function','-','-','-',5),(187,183,'Card Title','Data Out','-','-','Payroll Statistics - Allowance Breakdown Report',3),(188,180,'Card Element','Element','-','-','-',5),(189,185,'Element Header','Function','-','-','-',5),(190,186,'Card Body','Function','-','-','-',5),(191,187,'Card Title','Data Out','-','-','-',3),(192,184,'Card Element','Element','-','-','-',5),(193,189,'Card Header','Function','-','-','-',5),(194,190,'Card Body','Function','-','-','-',5),(195,191,'Card Title','Data Out','-','-','Payroll Statistics - Unions',3),(196,188,'Card Element','Element','-','-','-',5),(197,193,'Card Group','Container','-','-','-',8),(198,194,'Card Element','Element','-','-','-',5),(199,195,'Card Header','Function','-','-','-',5),(200,196,'Card Body','Function','-','-','-',5),(201,197,'Card Title','Data Out','-','-','2020 Payroll Changes',3),(202,192,'Card','Container','-','-','-',8),(203,199,'Card Header','Function','-','-','-',5),(204,200,'Card Body','Function','-','-','-',5),(205,201,'Card Title','Data Out','-','-','2019 Payroll Changes',3),(206,198,'Card Element','Element','-','-','-',5),(207,203,'Card Group','Container','-','-','-',8),(208,204,'Card Element','Element','-','-','-',5),(209,205,'Card Header','Function','-','-','-',5),(210,206,'Card Body','Function','-','-','-',5),(211,207,'Card Title','Data Out','-','-','Absences Consumed',3),(212,202,'Card','Container','-','-','-',8),(213,209,'Card Header','Function','-','-','-',5),(214,210,'Card Body','Function','-','-','-',5),(215,211,'Card Title','Data Out','-','-','Absence Entitlements',3),(216,208,'Card Element','Element','-','-','-',5),(217,213,'Card Header','Function','-','-','',5),(218,214,'Card Body','Function','-','-','-',5),(219,215,'Card Title','Data Out','-','-','Absence Entitlements (Grid View)',3),(220,212,'Card Element','Element','-','-','-',5),(221,9026,'Text Element','Data Out','-','-','TODO - Enter text',3),(222,9027,'Awsome Font Element','-','-','-','TODO - Enter FaFa name',3),(223,9028,'Element Header','Function','-','-','-',5),(226,220,'FaFa: Employee Reports - Card Header - FaFa','-','-','-','fa-fa-male',3),(227,221,'Text: Employee Reports - Card Header - Text Element','-','-','-','Employee Reports',3),(228,216,'Card Header','Function','-','-','-',5),(229,223,'FaFa: Employee Reports - Employee Basic Details Header - FaFa','-','-','-','fa-fa-star',3),(230,225,'FaFa: Employee Reports - Employee Basic Details (Grid View) - Card Header - FaFa','-','-','-','fa-fa-star',3),(231,227,'FaFa: Payroll Reports - Card Header - FaFa','-','-','-','fa-fa-money',3),(232,228,'Text: Payroll Reports - Card Header - Text Element','-','-','-','Payroll Reports',3),(233,226,'Card Header','Function','-','-','-',5),(234,230,'FaFa: Payroll Reports - Element Header - FaFa','-','-','-','fa-fa-star',3),(235,229,'Element Header','Function','-','-','-',5),(237,233,'FaFa: Payroll Statistics - Extras Breakdown Report Header - FaFa','-','-','-','fa-fa-star',3),(238,235,'FaFa: Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Header - FaFa','-','-','-','fa-fa-star',3),(239,237,'FaFa: Payroll Reports - Payroll - Allowances Breakdown - Card Header - FaFa','-','-','-','fa-fa-star',3),(240,239,'FaFa: Payroll Reports - Payroll Statistics - Bank Cash Payments - Card Header - FaFa','-','-','-','fa-fa-star',3),(241,241,'FaFa: Payroll Reports - Payroll Statistics - Unions - Card Header - FaFa','-','-','-','fa-fa-star',3),(242,243,'FaFa: 2020 Payroll Changes - Element Header - FaFa','-','-','-','fa-fa-star',3),(243,245,'FaFa: 2019 Payroll Changes - Element Header - FaFa','-','-','-','fa-fa-star',3),(244,247,'FaFa: Absences Consumed - Element Header - FaFa','-','-','-','fa-fa-plus',3),(245,249,'FaFa: Absence Entitlements - Element Header - FaFa','-','-','-','fa-fa-ban',3),(246,251,'FaFa: Absence Entitlements (Grid View) - Element Header - FaFa','-','-','-','fa-fa-tablet',3);
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
INSERT INTO `entity_action_type` VALUES (1,1,'Click\r'),(2,2,'Data In\r'),(3,3,'Data Out\r'),(4,4,'Data InOut\r'),(5,5,'Function\r'),(6,6,'Select'),(7,7,'Info'),(8,8,'Container'),(9,9,'Element');
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
INSERT INTO `entity_can_have_action` VALUES (2,5,5),(4,7,7),(5,8,8),(6,11,11),(7,12,12),(8,13,13),(9,14,14),(10,16,16),(11,17,17),(12,18,18),(13,19,19),(14,20,20),(15,21,21),(16,22,22),(17,23,23),(18,24,24),(19,25,25),(20,26,26),(21,27,27),(22,28,28),(23,31,31),(24,32,32),(25,33,33),(26,34,34),(27,35,35),(28,36,36),(29,37,37),(30,38,38),(31,39,39),(32,40,40),(33,41,41),(34,43,43),(35,44,44),(36,45,45),(37,46,46),(38,47,47),(39,50,50),(40,51,51),(41,52,52),(42,53,53),(43,54,54),(44,55,55),(45,56,56),(46,57,57),(47,58,58),(48,59,59),(49,60,60),(50,62,62),(51,63,63),(52,64,64),(53,65,65),(54,66,66),(55,67,67),(56,68,68),(57,69,69),(58,70,70),(59,71,71),(60,72,72),(61,74,74),(62,75,75),(63,76,76),(64,77,77),(65,78,78),(66,79,79),(67,80,80),(68,81,81),(69,82,82),(70,83,83),(71,84,84),(72,85,85),(73,87,87),(74,88,88),(75,89,89),(76,90,90),(77,91,91),(78,92,92),(79,93,93),(80,94,94),(81,95,95),(82,97,97),(83,98,98),(84,99,99),(85,100,100),(86,101,101),(87,102,102),(88,103,103),(89,104,104),(90,105,105),(91,49,49),(92,61,61),(93,73,73),(94,107,107),(95,86,86),(96,96,96),(97,109,109),(98,110,110),(99,111,111),(100,112,112),(101,113,113),(102,114,114),(103,115,115),(104,116,116),(105,117,117),(106,118,118),(107,119,119),(108,120,120),(109,121,121),(110,122,122),(111,123,123),(112,124,124),(113,125,125),(114,126,126),(115,127,127),(116,128,128),(117,129,129),(118,131,131),(119,133,133),(120,135,135),(121,137,137),(122,139,139),(123,141,141),(124,142,142),(125,143,143),(126,144,144),(127,145,145),(128,146,146),(129,9000,9000),(130,9001,9001),(131,9002,9002),(132,9003,9003),(133,9004,9004),(134,9005,9005),(135,9006,9006),(136,9007,9007),(137,9008,9008),(138,9009,9009),(139,9010,9010),(140,9011,9011),(141,9012,9012),(142,9013,9013),(143,9014,9014),(144,9015,9015),(145,9016,9016),(146,9017,9017),(147,9018,9018),(149,9019,9019),(150,9020,9020),(151,9021,9021),(153,9023,9023),(154,9024,9024),(155,9025,9025),(156,151,151),(162,157,157),(163,158,158),(164,159,159),(165,160,160),(166,161,161),(167,162,162),(168,163,163),(169,164,164),(170,165,165),(171,167,167),(173,170,170),(174,171,171),(175,168,168),(176,166,166),(177,173,173),(178,174,174),(179,175,175),(180,172,172),(181,177,177),(182,178,178),(183,179,179),(184,176,176),(185,181,181),(186,182,182),(187,183,183),(188,180,180),(189,185,185),(190,186,186),(191,187,187),(192,184,184),(193,189,189),(194,190,190),(195,191,191),(196,188,188),(197,193,193),(198,194,194),(199,195,195),(200,196,196),(201,197,197),(202,192,192),(203,199,199),(204,200,200),(205,201,201),(206,198,198),(207,203,203),(208,204,204),(209,205,205),(210,206,206),(211,207,207),(212,202,202),(213,209,209),(214,210,210),(215,211,211),(216,208,208),(217,213,213),(218,214,214),(219,215,215),(220,212,212),(221,9026,9026),(222,9027,9027),(223,9028,9028),(226,220,220),(227,221,221),(228,216,216),(229,223,223),(230,225,225),(231,227,227),(232,228,228),(233,226,226),(234,230,230),(235,229,229),(237,233,233),(238,235,235),(239,237,237),(240,239,239),(241,241,241),(242,243,243),(243,245,245),(244,247,247),(245,249,249),(246,251,251);
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
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_details`
--

LOCK TABLES `entity_details` WRITE;
/*!40000 ALTER TABLE `entity_details` DISABLE KEYS */;
INSERT INTO `entity_details` VALUES (1,1,'desc dets','2021-05-16','MAN','1900-01-01','00:00:00'),(2,2,'The Dakar Web App','2021-05-16','MAN','1900-01-01','00:00:00'),(3,3,'The login screen that a user first encounters','2021-05-16','MAN','2021-05-17','16:24:46'),(5,5,'Text box entry for user name','2021-05-16','MAN','2021-05-17','16:24:37'),(7,7,'Text box entry for user password','2021-05-16','MAN','2021-05-17','16:24:40'),(8,8,'Click to login with user name & password','2021-05-16','MAN','2021-05-17','16:24:42'),(9,9,'Homepage of Dakar Web App','2021-05-16','MAN','2021-05-17','16:48:19'),(10,10,'Top left info bar. Displays - 1: Logo 2: Current module 3:Full Screen Icon 4: TCL Icon 5: Current Company','2021-05-16','MAN','2021-05-17','16:28:49'),(11,11,'Dakar logo image','2021-05-16','MAN','1900-01-01','00:00:00'),(12,12,'Displays the currentlt selected module','2021-05-16','MAN','2021-05-17','16:27:38'),(13,13,'Toggles the view of the main menu','2021-05-16','MAN','2021-05-17','16:27:46'),(14,14,'Displays current company and list of all available companies','2021-05-16','MAN','2021-05-17','16:28:37'),(15,15,'Provides shortcuts to app elements. Also is the only way to swap between modules.','2021-05-16','MAN','2021-05-17','16:32:30'),(16,16,'Displays the authorisations form','2021-05-16','MAN','2021-05-17','16:29:00'),(17,17,'Displays the employee creation wizard form','2021-05-16','MAN','2021-05-17','16:29:05'),(18,18,'Displays the employee CV form','2021-05-16','MAN','2021-05-17','16:29:09'),(19,19,'Displays the employee grid view form','2021-05-16','MAN','2021-05-17','16:29:14'),(20,20,'Displays the summary graphs form','2021-05-16','MAN','2021-05-17','16:29:19'),(21,21,'Displays the DI form','2021-05-16','MAN','2021-05-17','16:29:22'),(22,22,'Displays the organisation chart form','2021-05-16','MAN','2021-05-17','16:29:31'),(23,23,'Displays the last  viewed popup form','2021-05-16','MAN','2021-05-17','16:31:20'),(24,24,'Displays the last  all notifications popup form. Displays total notifications (if there are any)','2021-05-16','MAN','2021-05-17','16:31:26'),(25,25,'Displays the new employments popup form.','2021-05-16','MAN','2021-05-17','16:31:32'),(26,26,'Displays the terminations popup form.','2021-05-16','MAN','2021-05-17','16:31:34'),(27,27,'Displays the quick links popup form.','2021-05-16','MAN','2021-05-17','16:31:43'),(28,28,'Displays the user config/action popup form. Displays the user image if setup.','2021-05-16','MAN','2021-05-17','16:32:09'),(29,29,'Main navigation bar for the currently selected module in the app.','2021-05-16','MAN','2021-05-17','16:34:06'),(30,30,'Main navigation bar for the payroll module.','2021-05-16','MAN','2021-05-17','16:33:26'),(31,31,'Display the Employee List form.','2021-05-16','MAN','2021-05-17','16:33:29'),(32,32,'Display the Employee Document form.','2021-05-16','MAN','2021-05-17','16:33:31'),(33,33,'Display the Employee Others sub menu.','2021-05-16','MAN','2021-05-17','16:33:33'),(34,34,'Display the Payroll sub menu.','2021-05-16','MAN','2021-05-17','16:33:35'),(35,35,'Display the Employee Statistics sub menu.','2021-05-16','MAN','2021-05-17','16:33:40'),(36,36,'Display the Absence Statistics sub menu.','2021-05-16','MAN','2021-05-17','16:33:43'),(37,37,'Display the Reports sub menu.','2021-05-16','MAN','2021-05-17','16:33:46'),(38,38,'Display the Monthly Payroll Reports form.','2021-05-16','MAN','2021-05-17','16:33:48'),(39,39,'Display the Yearly Payroll Reports form.','2021-05-16','MAN','2021-05-17','16:33:53'),(40,40,'Display the Bulk Updates sub menu.','2021-05-16','MAN','2021-05-17','16:33:55'),(41,41,'Display the Settings form.','2021-05-16','MAN','2021-05-17','16:34:02'),(42,42,'Has a grid view of the authorisations for the selected company','2021-05-17','MAN','1900-01-01','00:00:00'),(43,43,'Describes the company combo box','2021-05-17','MAN','1900-01-01','00:00:00'),(44,44,'Select & set the current company in authorisations','2021-05-17','MAN','1900-01-01','00:00:00'),(45,45,'Describes the Grouping View combo','2021-05-17','MAN','1900-01-01','00:00:00'),(46,46,'Select & set the grouping view','2021-05-17','MAN','1900-01-01','00:00:00'),(47,47,'Sets the chosen criteria','2021-05-17','MAN','1900-01-01','00:00:00'),(48,48,'Displays the authorisations for the selected criteria','2021-05-17','MAN','1900-01-01','00:00:00'),(49,49,'Step 1 of the employee creation wizard','2021-05-17','MAN','1900-01-01','00:00:00'),(50,50,'Enter employee name','2021-05-17','MAN','1900-01-01','00:00:00'),(51,51,'Enter employee surname','2021-05-17','MAN','1900-01-01','00:00:00'),(52,52,'Enter employee ID card number','2021-05-17','MAN','1900-01-01','00:00:00'),(53,53,'Enter employee code','2021-05-17','MAN','1900-01-01','00:00:00'),(54,54,'Enter employee address','2021-05-17','MAN','1900-01-01','00:00:00'),(55,55,'Enter employee street','2021-05-17','MAN','1900-01-01','00:00:00'),(56,56,'Enter employee post code','2021-05-17','MAN','1900-01-01','00:00:00'),(57,57,'Select employee town','2021-05-17','MAN','1900-01-01','00:00:00'),(58,58,'Select employee country','2021-05-17','MAN','1900-01-01','00:00:00'),(59,59,'Take the user to the previous step','2021-05-17','MAN','1900-01-01','00:00:00'),(60,60,'Take the user to the next step','2021-05-17','MAN','1900-01-01','00:00:00'),(61,61,'Step 2 of the employee creation wizard','2021-05-17','MAN','1900-01-01','00:00:00'),(62,62,'Enter the employee gender','2021-05-17','MAN','1900-01-01','00:00:00'),(63,63,'Enter the employee DOB','2021-05-17','MAN','1900-01-01','00:00:00'),(64,64,'Enter the employee date of employment','2021-05-17','MAN','1900-01-01','00:00:00'),(65,65,'Enter the employee tax number','2021-05-17','MAN','1900-01-01','00:00:00'),(66,66,'Enter the employee NI number','2021-05-17','MAN','1900-01-01','00:00:00'),(67,67,'Select a bank from the list','2021-05-17','MAN','1900-01-01','00:00:00'),(68,68,'Enter the employee IBAN number','2021-05-17','MAN','1900-01-01','00:00:00'),(69,69,'Enter the employee email address','2021-05-17','MAN','1900-01-01','00:00:00'),(70,70,'Enter the employee mobile number','2021-05-17','MAN','1900-01-01','00:00:00'),(71,71,'Take the user to the previous step','2021-05-17','MAN','1900-01-01','00:00:00'),(72,72,'Take the user to the next step','2021-05-17','MAN','1900-01-01','00:00:00'),(73,73,'Step 3 of the employee creation wizard','2021-05-18','MAN','1900-01-01','00:00:00'),(74,74,'Select tax status from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(75,75,'Select employment type from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(76,76,'Select company from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(77,77,'Select paygroup from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(78,78,'Select department from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(79,79,'Select schedule from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(80,80,'Select employment type from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(81,81,'Select if the employee is a special part timer or not','2021-05-18','MAN','1900-01-01','00:00:00'),(82,82,'Select a grade from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(83,83,'Select a cost center from the list','2021-05-18','MAN','1900-01-01','00:00:00'),(84,84,'Take the user to the previous step','2021-05-18','MAN','1900-01-01','00:00:00'),(85,85,'Take the user to the next step','2021-05-18','MAN','1900-01-01','00:00:00'),(86,86,'Step 4 of the employee creation wizard','2021-05-18','MAN','1900-01-01','00:00:00'),(87,87,'Select a taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(88,88,'Enter the allowance amount','2021-05-18','MAN','1900-01-01','00:00:00'),(89,89,'Select a taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(90,90,'Enter the allowance amount','2021-05-18','MAN','1900-01-01','00:00:00'),(91,91,'Select a non taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(92,92,'Enter the allowance amount','2021-05-18','MAN','1900-01-01','00:00:00'),(93,93,'Select a non taxable allowance','2021-05-18','MAN','1900-01-01','00:00:00'),(94,94,'Take the user to the previous step','2021-05-18','MAN','1900-01-01','00:00:00'),(95,95,'Take the user to the next step','2021-05-18','MAN','1900-01-01','00:00:00'),(96,96,'Step 5 of the employee creation wizard','2021-05-18','MAN','1900-01-01','00:00:00'),(97,97,'Enter the employee annual salary','2021-05-18','MAN','1900-01-01','00:00:00'),(98,98,'Enter the employee hourly rate','2021-05-18','MAN','1900-01-01','00:00:00'),(99,99,'Take the user to the previous step','2021-05-18','MAN','1900-01-01','00:00:00'),(100,100,'Create the employee','2021-05-18','MAN','1900-01-01','00:00:00'),(101,101,'Heading of step 1','2021-05-18','MAN','1900-01-01','00:00:00'),(102,102,'Heading of step 2','2021-05-18','MAN','1900-01-01','00:00:00'),(103,103,'Heading of step 3','2021-05-18','MAN','1900-01-01','00:00:00'),(104,104,'Heading of step 4','2021-05-18','MAN','1900-01-01','00:00:00'),(105,105,'Heading of step 5','2021-05-18','MAN','1900-01-01','00:00:00'),(106,106,'A wizard that guides the user through the process of creating a new employee','2021-05-18','MAN','1900-01-01','00:00:00'),(107,107,'Title of form','2021-05-18','MAN','1900-01-01','00:00:00'),(108,108,'Display and employees history in categories','2021-05-19','MAN','1900-01-01','00:00:00'),(109,109,'Title of form','2021-05-19','MAN','1900-01-01','00:00:00'),(110,110,'Label for the company list box','2021-05-19','MAN','1900-01-01','00:00:00'),(111,111,'List box of available companies','2021-05-19','MAN','1900-01-01','00:00:00'),(112,112,'Label for the paygroup list box','2021-05-19','MAN','1900-01-01','00:00:00'),(113,113,'List box of available paygroups','2021-05-19','MAN','1900-01-01','00:00:00'),(114,114,'Label for the employee list box','2021-05-19','MAN','1900-01-01','00:00:00'),(115,115,'List box of available employees','2021-05-19','MAN','1900-01-01','00:00:00'),(116,116,'Load CV based on the criteria supplied','2021-05-19','MAN','1900-01-01','00:00:00'),(117,117,'Button text','2021-05-19','MAN','1900-01-01','00:00:00'),(118,118,'Container for Employee CV Bio Info','2021-05-19','MAN','1900-01-01','00:00:00'),(119,119,'Image of employee if available','2021-05-19','MAN','1900-01-01','00:00:00'),(120,120,'Employee Name','2021-05-19','MAN','1900-01-01','00:00:00'),(121,121,'Employee Name With Salutation','2021-05-19','MAN','1900-01-01','00:00:00'),(122,122,'Employee Company','2021-05-19','MAN','1900-01-01','00:00:00'),(123,123,'Employee Birthday','2021-05-19','MAN','1900-01-01','00:00:00'),(124,124,'User FaFa','2021-05-19','MAN','1900-01-01','00:00:00'),(125,125,'Company FaFa','2021-05-19','MAN','1900-01-01','00:00:00'),(126,126,'Birthday FaFa','2021-05-19','MAN','1900-01-01','00:00:00'),(127,127,'Bio Content','2021-05-19','MAN','1900-01-01','00:00:00'),(128,128,'Accordion for payroll CV','2021-05-19','MAN','1900-01-01','00:00:00'),(129,129,'Acc Key Career','2021-05-19','MAN','1900-01-01','00:00:00'),(130,130,'Grid - Career','2021-05-19','MAN','1900-01-01','00:00:00'),(131,131,'Acc key for CV allowance','2021-05-19','MAN','1900-01-01','00:00:00'),(132,132,'Grid - Allowance','2021-05-19','MAN','1900-01-01','00:00:00'),(133,133,'Acc key for CV salary','2021-05-19','MAN','1900-01-01','00:00:00'),(134,134,'Grid - Salary','2021-05-19','MAN','1900-01-01','00:00:00'),(135,135,'Acc key for emp schedule','2021-05-19','MAN','1900-01-01','00:00:00'),(136,136,'Grid - Emp Schedule','2021-05-19','MAN','1900-01-01','00:00:00'),(137,137,'Acc key for work permit','2021-05-19','MAN','1900-01-01','00:00:00'),(138,138,'Grid - Work Permit','2021-05-19','MAN','1900-01-01','00:00:00'),(139,139,'Employee CV Save button','2021-05-19','MAN','1900-01-01','00:00:00'),(140,140,'Save from for employee CV','2021-05-19','MAN','1900-01-01','00:00:00'),(141,141,'Save form header','2021-05-19','MAN','1900-01-01','00:00:00'),(142,142,'Save form title','2021-05-19','MAN','1900-01-01','00:00:00'),(143,143,'Save form body','2021-05-19','MAN','1900-01-01','00:00:00'),(144,144,'Save form footer','2021-05-19','MAN','1900-01-01','00:00:00'),(145,145,'Save OK button','2021-05-19','MAN','1900-01-01','00:00:00'),(146,146,'Save Cancel Button','2021-05-19','MAN','1900-01-01','00:00:00'),(147,147,'Employee Grid View - Grid','2021-05-19','MAN','1900-01-01','00:00:00'),(148,148,'Employee Grid View - Form','2021-05-19','MAN','1900-01-01','00:00:00'),(149,9000,'','2021-05-19','MAN','1900-01-01','00:00:00'),(150,9001,'','2021-05-20','MAN','1900-01-01','00:00:00'),(151,9002,'','2021-05-20','MAN','1900-01-01','00:00:00'),(152,9003,'','2021-05-20','MAN','1900-01-01','00:00:00'),(153,9004,'','2021-05-20','MAN','1900-01-01','00:00:00'),(154,9005,'','2021-05-20','MAN','1900-01-01','00:00:00'),(155,9006,'','2021-05-20','MAN','1900-01-01','00:00:00'),(156,9007,'','2021-05-20','MAN','1900-01-01','00:00:00'),(157,9008,'','2021-05-20','MAN','1900-01-01','00:00:00'),(158,9009,'','2021-05-20','MAN','1900-01-01','00:00:00'),(159,9010,'','2021-05-20','MAN','1900-01-01','00:00:00'),(160,9011,'','2021-05-20','MAN','1900-01-01','00:00:00'),(161,9012,'','2021-05-20','MAN','1900-01-01','00:00:00'),(162,9013,'','2021-05-20','MAN','1900-01-01','00:00:00'),(163,9014,'','2021-05-20','MAN','1900-01-01','00:00:00'),(164,9015,'','2021-05-20','MAN','1900-01-01','00:00:00'),(165,9016,'','2021-05-20','MAN','1900-01-01','00:00:00'),(166,9017,'','2021-05-20','MAN','1900-01-01','00:00:00'),(167,9018,'','2021-05-20','MAN','1900-01-01','00:00:00'),(168,149,'Visual reports form','2021-05-20','MAN','1900-01-01','00:00:00'),(169,150,'Dakar Intelligence - Form','2021-05-20','MAN','1900-01-01','00:00:00'),(170,151,'Employee Reports - Card','2021-05-20','MAN','1900-01-01','00:00:00'),(171,9019,'','2021-05-20','MAN','1900-01-01','00:00:00'),(172,9020,'','2021-05-20','MAN','1900-01-01','00:00:00'),(173,9021,'','2021-05-20','MAN','1900-01-01','00:00:00'),(174,9022,'','2021-05-20','MAN','1900-01-01','00:00:00'),(175,9023,'','2021-05-20','MAN','1900-01-01','00:00:00'),(176,9024,'','2021-05-20','MAN','1900-01-01','00:00:00'),(177,9025,'','2021-05-20','MAN','1900-01-01','00:00:00'),(183,157,'Employee Reports - Card Group','2021-05-21','AUTO','1900-01-01','00:00:00'),(184,158,'Employee Reports - Card Element','2021-05-21','AUTO','1900-01-01','00:00:00'),(185,159,'Employee Reports - Card Header','2021-05-21','AUTO','1900-01-01','00:00:00'),(186,160,'Employee Reports - Card Body','2021-05-21','AUTO','1900-01-01','00:00:00'),(187,161,'Employee Reports - Card Title','2021-05-21','AUTO','1900-01-01','00:00:00'),(188,162,'Employee Reports - Employee Basic Details (Grid View)','2021-05-21','MAN','1900-01-01','00:00:00'),(189,163,'Employee Reports - Employee Basic Details (Grid View) - Card Header','2021-05-21','AUTO','1900-01-01','00:00:00'),(190,164,'Employee Reports - Employee Basic Details (Grid View) - Card Body','2021-05-21','AUTO','1900-01-01','00:00:00'),(191,165,'Employee Reports - Employee Basic Details (Grid View) - Card Title','2021-05-21','AUTO','1900-01-01','00:00:00'),(192,167,'Payroll Reports - Card Group','2021-05-22','AUTO','1900-01-01','00:00:00'),(194,170,'Payroll Reports - Card Body','2021-05-22','AUTO','1900-01-01','00:00:00'),(195,171,'Payroll Reports - Card Title','2021-05-22','AUTO','1900-01-01','00:00:00'),(196,168,'Payroll Reports - Card Element','2021-05-22','AUTO','1900-01-01','00:00:00'),(197,166,'Payroll Reports Card','2021-05-22','MAN','1900-01-01','00:00:00'),(198,173,'Payroll Reports - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(199,174,'Payroll Statistics - Extras Breakdown Report - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(200,175,'Payroll Statistics - Extras Breakdown Report - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(201,172,'Payroll Reports - Card Element','2021-05-23','MAN','1900-01-01','00:00:00'),(202,177,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(203,178,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(204,179,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(205,176,'Payroll Reports - Card Element','2021-05-23','MAN','1900-01-01','00:00:00'),(206,181,'Payroll Reports - Payroll - Allowances Breakdown - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(207,182,'Payroll Reports - Payroll - Allowances Breakdown - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(208,183,'Payroll Reports - Payroll - Allowances Breakdown - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(209,180,'Payroll Reports - Card Element','2021-05-23','MAN','1900-01-01','00:00:00'),(210,185,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(211,186,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(212,187,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(213,184,'Payroll Reports - Card Element','2021-05-23','MAN','1900-01-01','00:00:00'),(214,189,'Payroll Reports - Payroll Statistics - Unions - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(215,190,'Payroll Reports - Payroll Statistics - Unions - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(216,191,'Payroll Reports - Payroll Statistics - Unions - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(217,188,'Payroll Reports - Card Element','2021-05-23','MAN','1900-01-01','00:00:00'),(218,193,'Payroll Changes - Card Group','2021-05-23','AUTO','1900-01-01','00:00:00'),(219,194,'Payroll Changes - Card Element','2021-05-23','AUTO','1900-01-01','00:00:00'),(220,195,'2020 Payroll Changes - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(221,196,'2020 Payroll Changes - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(222,197,'2020 Payroll Changes - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(223,192,'Payroll Changes - Card','2021-05-23','MAN','1900-01-01','00:00:00'),(224,199,'2019 Payroll Changes - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(225,200,'2019 Payroll Changes - Card Element - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(226,201,'2019 Payroll Changes - Card Element - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(227,198,'Payroll Changes - Card Element','2021-05-23','MAN','1900-01-01','00:00:00'),(228,203,'Absences - Card Group','2021-05-23','AUTO','1900-01-01','00:00:00'),(229,204,'Absences - Card Element','2021-05-23','AUTO','1900-01-01','00:00:00'),(230,205,'Absences Consumed - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(231,206,'Absences Consumed - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(232,207,'Absences Consumed - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(233,202,'Absences - Card','2021-05-23','MAN','1900-01-01','00:00:00'),(234,209,'Absence Entitlements - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(235,210,'Absence Entitlements - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(236,211,'Absence Entitlements - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(237,208,'Absences - Card Element','2021-05-23','MAN','1900-01-01','00:00:00'),(238,213,'Absence Entitlements (Grid View) - Element Header','2021-05-23','AUTO','1900-01-01','00:00:00'),(239,214,'Absence Entitlements (Grid View) - Card Body','2021-05-23','AUTO','1900-01-01','00:00:00'),(240,215,'Absence Entitlements (Grid View) - Card Title','2021-05-23','AUTO','1900-01-01','00:00:00'),(241,212,'Absence Entitlements (Grid View)','2021-05-23','MAN','1900-01-01','00:00:00'),(242,9026,'','2021-05-23','MAN','1900-01-01','00:00:00'),(243,9027,'','2021-05-23','MAN','1900-01-01','00:00:00'),(244,9028,'','2021-05-23','MAN','1900-01-01','00:00:00'),(247,220,'Employee Reports - Card Header - FaFa','2021-05-23','AUTO','1900-01-01','00:00:00'),(248,221,'Employee Reports - Card Header - Text Element','2021-05-23','AUTO','1900-01-01','00:00:00'),(249,216,'Employee Reports - Card Header','2021-05-23','MAN','1900-01-01','00:00:00'),(250,223,'Employee Reports - Employee Basic Details Header - FaFa','2021-05-23','AUTO','1900-01-01','00:00:00'),(251,225,'Employee Reports - Employee Basic Details (Grid View) - Card Header - FaFa','2021-05-23','AUTO','1900-01-01','00:00:00'),(252,227,'Payroll Reports - Card Header - FaFa','2021-05-23','AUTO','1900-01-01','00:00:00'),(253,228,'Payroll Reports - Card Header - Text Element','2021-05-23','AUTO','1900-01-01','00:00:00'),(254,226,'Payroll Reports - Card Header','2021-05-23','MAN','1900-01-01','00:00:00'),(255,230,'Payroll Reports - Element Header - FaFa','2021-05-23','AUTO','1900-01-01','00:00:00'),(256,229,'Payroll Reports - Element Header','2021-05-23','MAN','1900-01-01','00:00:00'),(258,233,'Payroll Statistics - Extras Breakdown Report Header - FaFa','2021-05-23','AUTO','1900-01-01','00:00:00'),(259,235,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(260,237,'Payroll Reports - Payroll - Allowances Breakdown - Card Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(261,239,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Element Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(262,241,'Payroll Reports - Payroll Statistics - Unions - Element Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(263,243,'2020 Payroll Changes - Element Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(264,245,'2019 Payroll Changes - Element Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(265,247,'Absences Consumed - Element Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(266,249,'Absence Entitlements - Element Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00'),(267,251,'Absence Entitlements (Grid View) - Element Header - FaFa','2021-05-24','AUTO','1900-01-01','00:00:00');
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
-- Table structure for table `entity_has_element`
--

DROP TABLE IF EXISTS `entity_has_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_has_element` (
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `element_entity_row_id` int(10) unsigned NOT NULL,
  `element_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`entity_entity_id`,`element_id`,`element_entity_row_id`,`element_entity_id`),
  KEY `fk_entity_has_element_element1_idx` (`element_id`,`element_entity_row_id`,`element_entity_id`),
  KEY `fk_entity_has_element_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_has_element_element1` FOREIGN KEY (`element_id`, `element_entity_row_id`, `element_entity_id`) REFERENCES `element` (`id`, `entity_row_id`, `entity_id`),
  CONSTRAINT `fk_entity_has_element_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_has_element`
--

LOCK TABLES `entity_has_element` WRITE;
/*!40000 ALTER TABLE `entity_has_element` DISABLE KEYS */;
INSERT INTO `entity_has_element` VALUES (108,108,1,9000,9000),(130,130,6,9018,9018),(132,132,6,9018,9018),(134,134,6,9018,9018),(136,136,6,9018,9018),(138,138,6,9018,9018),(147,147,6,9018,9018),(148,148,1,9000,9000),(149,149,1,9000,9000),(150,150,1,9000,9000);
/*!40000 ALTER TABLE `entity_has_element` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `entity_has_version` VALUES (1,1,1),(2,2,2),(3,3,3),(5,5,5),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(116,42,42),(117,43,43),(118,44,44),(119,45,45),(120,46,46),(121,47,47),(122,48,48),(133,49,49),(134,50,50),(135,51,51),(136,52,52),(137,53,53),(138,54,54),(139,55,55),(140,56,56),(141,57,57),(142,58,58),(143,59,59),(144,60,60),(145,61,61),(146,62,62),(147,63,63),(148,64,64),(149,65,65),(150,66,66),(151,67,67),(152,68,68),(153,69,69),(154,70,70),(155,71,71),(156,72,72),(157,73,73),(158,74,74),(159,75,75),(160,76,76),(161,77,77),(162,78,78),(163,79,79),(164,80,80),(165,81,81),(166,82,82),(167,83,83),(168,84,84),(169,85,85),(170,86,86),(171,87,87),(172,88,88),(173,89,89),(174,90,90),(175,91,91),(176,92,92),(177,93,93),(178,94,94),(179,95,95),(180,96,96),(181,97,97),(182,98,98),(183,99,99),(184,100,100),(185,101,101),(186,102,102),(187,103,103),(188,104,104),(189,105,105),(190,106,106),(191,107,107),(267,108,108),(268,109,109),(269,110,110),(270,111,111),(271,112,112),(272,113,113),(273,114,114),(274,115,115),(275,116,116),(276,117,117),(277,118,118),(278,119,119),(279,120,120),(280,121,121),(281,122,122),(282,123,123),(283,124,124),(284,125,125),(285,126,126),(286,127,127),(287,128,128),(288,129,129),(289,130,130),(290,131,131),(291,132,132),(292,133,133),(293,134,134),(294,135,135),(297,136,136),(298,137,137),(299,138,138),(300,139,139),(301,140,140),(302,141,141),(303,142,142),(304,143,143),(305,144,144),(306,145,145),(307,146,146),(368,147,147),(369,148,148),(370,9000,9000),(371,9001,9001),(372,9002,9002),(373,9003,9003),(374,9004,9004),(375,9005,9005),(376,9006,9006),(377,9007,9007),(378,9008,9008),(379,9009,9009),(380,9010,9010),(381,9011,9011),(382,9012,9012),(383,9013,9013),(384,9014,9014),(385,9015,9015),(386,9016,9016),(387,9017,9017),(388,9018,9018),(437,9019,9019),(438,9020,9020),(439,9021,9021),(440,9022,9022),(441,9023,9023),(442,9024,9024),(443,9025,9025),(444,149,149),(445,150,150),(446,151,151),(452,157,157),(453,158,158),(454,159,159),(455,160,160),(456,161,161),(457,162,162),(458,163,163),(459,164,164),(460,165,165),(461,167,167),(463,170,170),(464,171,171),(465,168,168),(466,166,166),(467,173,173),(468,174,174),(469,175,175),(470,172,172),(471,177,177),(472,178,178),(473,179,179),(474,176,176),(475,181,181),(476,182,182),(477,183,183),(478,180,180),(479,185,185),(480,186,186),(481,187,187),(482,184,184),(483,189,189),(484,190,190),(485,191,191),(486,188,188),(487,193,193),(488,194,194),(489,195,195),(490,196,196),(491,197,197),(492,192,192),(493,199,199),(494,200,200),(495,201,201),(496,198,198),(497,203,203),(498,204,204),(499,205,205),(500,206,206),(501,207,207),(502,202,202),(503,209,209),(504,210,210),(505,211,211),(506,208,208),(507,213,213),(508,214,214),(509,215,215),(510,212,212),(511,9026,9026),(512,9027,9027),(513,9028,9028),(516,220,220),(517,221,221),(518,216,216),(519,223,223),(520,225,225),(521,227,227),(522,228,228),(523,226,226),(524,230,230),(525,229,229),(527,233,233),(528,235,235),(529,237,237),(530,239,239),(531,241,241),(532,243,243),(533,245,245),(534,247,247),(535,249,249),(536,251,251);
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
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_help`
--

LOCK TABLES `entity_help` WRITE;
/*!40000 ALTER TABLE `entity_help` DISABLE KEYS */;
INSERT INTO `entity_help` VALUES (1,1,'TRUE','DONE - ADD TOOL TIP TEXT',NULL,NULL),(2,2,'False','-','',''),(3,3,'False','-','',''),(5,5,'False','-','',''),(7,7,'False','-','',''),(8,8,'True','Click to login','',''),(9,9,'','','',''),(10,10,'False','-','',''),(11,11,'False','-','',''),(12,12,'False','-','',''),(13,13,'True','Hide / Show Main Menu','',''),(14,14,'False','-','',''),(15,15,'False','-','',''),(16,16,'True','Authorisations','',''),(17,17,'True','Employee Creation','',''),(18,18,'True','Employee CV','',''),(19,19,'True','Employee Grid View','',''),(20,20,'True','Visual Reports','',''),(21,21,'True','Dakar Intelligence','',''),(22,22,'False','-','',''),(23,23,'True','My Company / Last Viewed','',''),(24,24,'True','Notifications','',''),(25,25,'True','New Employments','',''),(26,26,'True','Terminations','',''),(27,27,'True','Quick Links','',''),(28,28,'True','User','',''),(29,29,'False','-','',''),(30,30,'False','-','',''),(31,31,'False','-','',''),(32,32,'False','-','',''),(33,33,'False','-','',''),(34,34,'False','-','',''),(35,35,'False','-','',''),(36,36,'False','-','',''),(37,37,'False','-','',''),(38,38,'False','-','',''),(39,39,'False','-','',''),(40,40,'False','-','',''),(41,41,'False','-','',''),(42,42,'False','-','',''),(43,43,'False','-','',''),(44,44,'False','-','',''),(45,45,'False','-','',''),(46,46,'False','-','',''),(47,47,'False','-','',''),(48,48,'False','-','',''),(49,49,'False','-','',''),(50,50,'False','-','',''),(51,51,'False','-','',''),(52,52,'False','-','',''),(53,53,'False','-','',''),(54,54,'False','-','',''),(55,55,'False','-','',''),(56,56,'False','-','',''),(57,57,'False','-','',''),(58,58,'False','-','',''),(59,59,'False','-','',''),(60,60,'False','-','',''),(61,61,'False','-','',''),(62,62,'False','-','',''),(63,63,'False','-','',''),(64,64,'False','-','',''),(65,65,'False','-','',''),(66,66,'False','-','',''),(67,67,'False','-','',''),(68,68,'False','-','',''),(69,69,'False','-','',''),(70,70,'False','-','',''),(71,71,'False','-','',''),(72,72,'False','-','',''),(73,73,'False','-','',''),(74,74,'False','-','',''),(75,75,'False','-','',''),(76,76,'False','-','',''),(77,77,'False','-','',''),(78,78,'False','-','',''),(79,79,'False','-','',''),(80,80,'False','-','',''),(81,81,'False','-','',''),(82,82,'False','-','',''),(83,83,'False','-','',''),(84,84,'False','-','',''),(85,85,'False','-','',''),(86,86,'False','-','',''),(87,87,'False','-','',''),(88,88,'False','-','',''),(89,89,'False','-','',''),(90,90,'False','-','',''),(91,91,'False','-','',''),(92,92,'False','-','',''),(93,93,'False','-','',''),(94,94,'False','-','',''),(95,95,'False','-','',''),(96,96,'False','-','',''),(97,97,'False','-','',''),(98,98,'False','-','',''),(99,99,'False','-','',''),(100,100,'False','-','',''),(101,101,'False','-','',''),(102,102,'False','-','',''),(103,103,'False','-','',''),(104,104,'False','-','',''),(105,105,'False','-','',''),(106,106,'False','-','',''),(107,107,'False','-','',''),(108,108,'False','-','',''),(109,109,'False','-','',''),(110,110,'False','-','',''),(111,111,'False','-','',''),(112,112,'False','-','',''),(113,113,'False','-','',''),(114,114,'False','-','',''),(115,115,'False','-','',''),(116,116,'False','-','',''),(117,117,'False','-','',''),(118,118,'False','-','',''),(119,119,'False','-','',''),(120,120,'False','-','',''),(121,121,'False','-','',''),(122,122,'False','-','',''),(123,123,'False','-','',''),(124,124,'False','-','',''),(125,125,'False','-','',''),(126,126,'False','-','',''),(127,127,'False','-','',''),(128,128,'False','-','',''),(129,129,'False','-','',''),(130,130,'False','-','',''),(131,131,'False','-','',''),(132,132,'False','-','',''),(133,133,'False','-','',''),(134,134,'False','-','',''),(135,135,'False','-','',''),(136,136,'False','-','',''),(137,137,'False','-','',''),(138,138,'False','-','',''),(139,139,'False','-','',''),(140,140,'False','-','',''),(141,141,'False','-','',''),(142,142,'False','-','',''),(143,143,'False','-','',''),(144,144,'False','-','',''),(145,145,'False','-','',''),(146,146,'False','-','',''),(147,147,'False','-','',''),(148,148,'False','-','',''),(149,9000,'False','-','',''),(150,9001,'False','-','',''),(151,9002,'False','-','',''),(152,9003,'False','-','',''),(153,9004,'False','-','',''),(154,9005,'False','-','',''),(155,9006,'False','-','',''),(156,9007,'False','-','',''),(157,9008,'False','-','',''),(158,9009,'False','-','',''),(159,9010,'False','-','',''),(160,9011,'False','-','',''),(161,9012,'False','-','',''),(162,9013,'False','-','',''),(163,9014,'False','-','',''),(164,9015,'False','-','',''),(165,9016,'False','-','',''),(166,9017,'False','-','',''),(167,9018,'False','-','',''),(168,149,'False','-','',''),(169,150,'False','-','',''),(170,151,'False','-','',''),(171,9019,'False','-','',''),(172,9020,'False','-','',''),(173,9021,'False','-','',''),(174,9022,'False','-','',''),(175,9023,'False','-','',''),(176,9024,'False','-','',''),(177,9025,'False','-','',''),(183,157,'False','-','',''),(184,158,'False','-','',''),(185,159,'False','-','',''),(186,160,'False','-','',''),(187,161,'False','-','',''),(188,162,'False','-','',''),(189,163,'False','-','',''),(190,164,'False','-','',''),(191,165,'False','-','',''),(192,166,'False','-','',''),(193,167,'False','-','',''),(195,170,'False','-','',''),(196,171,'False','-','',''),(197,168,'False','-','',''),(198,173,'False','-','',''),(199,174,'False','-','',''),(200,175,'False','-','',''),(201,172,'False','-','',''),(202,177,'False','-','',''),(203,178,'False','-','',''),(204,179,'False','-','',''),(205,176,'False','-','',''),(206,181,'False','-','',''),(207,182,'False','-','',''),(208,183,'False','-','',''),(209,180,'False','-','',''),(210,185,'False','-','',''),(211,186,'False','-','',''),(212,187,'False','-','',''),(213,184,'False','-','',''),(214,189,'False','-','',''),(215,190,'False','-','',''),(216,191,'False','-','',''),(217,188,'False','-','',''),(218,193,'False','-','',''),(219,194,'False','-','',''),(220,195,'False','-','',''),(221,196,'False','-','',''),(222,197,'False','-','',''),(223,192,'False','-','',''),(224,199,'False','-','',''),(225,200,'False','-','',''),(226,201,'False','-','',''),(227,198,'False','-','',''),(228,203,'False','-','',''),(229,204,'False','-','',''),(230,205,'False','-','',''),(231,206,'False','-','',''),(232,207,'False','-','',''),(233,202,'False','-','',''),(234,209,'False','-','',''),(235,210,'False','-','',''),(236,211,'False','-','',''),(237,208,'False','-','',''),(238,213,'False','-','',''),(239,214,'False','-','',''),(240,215,'False','-','',''),(241,212,'False','-','',''),(242,9026,'False','-','',''),(243,9027,'False','-','',''),(244,9028,'False','-','',''),(247,220,'False','-','',''),(248,221,'False','-','',''),(249,216,'False','-','',''),(250,223,'False','-','',''),(251,225,'False','-','',''),(252,227,'False','-','',''),(253,228,'False','-','',''),(254,226,'False','-','',''),(255,230,'False','-','',''),(256,229,'False','-','',''),(258,233,'False','-','',''),(259,235,'False','-','',''),(260,237,'False','-','',''),(261,239,'False','-','',''),(262,241,'False','-','',''),(263,243,'False','-','',''),(264,245,'False','-','',''),(265,247,'False','-','',''),(266,249,'False','-','',''),(267,251,'False','-','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=9019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test`
--

LOCK TABLES `entity_test` WRITE;
/*!40000 ALTER TABLE `entity_test` DISABLE KEYS */;
INSERT INTO `entity_test` VALUES (1,1,1,1,'Top Level of: Root','This is the top level test for Root. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,0,0),(2,2,2,2,'Top Level of: Dakar Web','This is the top level test for Dakar Web. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,1,1),(3,3,3,3,'Top Level of: Login Screen','This is the top level test for Login Screen. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:24:46',2,2),(5,5,5,5,'User Name','Enter user name','2021-05-16','Enter data','steveb','-','-',0,'SB_1','2021-05-17','16:24:37',3,3),(7,7,7,7,'User Password','Enter password','2021-05-16','Enter data','1234','-','-',0,'SB_1','2021-05-17','16:24:40',3,3),(8,8,8,8,'Top Level of: Login Button','This is the top level test for Login Button. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:24:42',8,8),(9,9,9,9,'Top Level of: Home Page','This is the top level test for Home Page. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:48:19',2,2),(10,10,10,10,'Top Level of: Home Page Info Bar','This is the top level test for Home Page Info Bar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:28:49',9,9),(12,12,12,12,'Current Module Indicator','Shows the currently selected module','2021-05-16','-','-','-','Payroll',0,'SB_1','2021-05-17','16:27:38',10,10),(13,13,13,13,'Top Level of: Menu Toggle','This is the top level test for Menu Toggle. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:27:46',10,10),(14,14,14,14,'Current Company','Shows the currently selected company','2021-05-16','Peform function based on value','-','-','Mars~Mars Incorporated Ltd',0,'SB_1','2021-05-17','16:28:37',10,10),(15,15,15,15,'Top Level of: Home Page Top Right Nav Bar','This is the top level test for Home Page Top Right Nav Bar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:32:30',9,9),(16,16,16,16,'Top Level of: Authorisations','This is the top level test for Authorisations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:00',15,15),(17,17,17,17,'Top Level of: Employee Creation Wizard','This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:05',15,15),(18,18,18,18,'Top Level of: Employee CV','This is the top level test for Employee CV. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:09',15,15),(19,19,19,19,'Top Level of: Employee Grid View','This is the top level test for Employee Grid View. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:14',15,15),(20,20,20,20,'Top Level of: Visual Reports','This is the top level test for Visual Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:19',15,15),(21,21,21,21,'Top Level of: Dakar Intelligence','This is the top level test for Dakar Intelligence. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:22',15,15),(22,22,22,22,'Top Level of: Organisation Chart','This is the top level test for Organisation Chart. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:31',15,15),(23,23,23,23,'Top Level of: My Company / Last Viewed','This is the top level test for My Company / Last Viewed. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:20',15,15),(24,24,24,24,'Top Level of: All Notifications','This is the top level test for All Notifications. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:26',15,15),(25,25,25,25,'Top Level of: New Employments','This is the top level test for New Employments. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:32',15,15),(26,26,26,26,'Top Level of: Terminations','This is the top level test for Terminations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:34',15,15),(27,27,27,27,'Top Level of: Quick Links','This is the top level test for Quick Links. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:43',15,15),(28,28,28,28,'Top Level of: User Avatar','This is the top level test for User Avatar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:32:09',15,15),(29,29,29,29,'Top Level of: Main Menu','This is the top level test for Main Menu. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:34:06',9,9),(30,30,30,30,'Top Level of: Main Menu - Payroll','This is the top level test for Main Menu - Payroll. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:26',29,29),(31,31,31,31,'Top Level of: Employee List','This is the top level test for Employee List. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:29',30,30),(32,32,32,32,'Top Level of: Documents','This is the top level test for Documents. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:31',30,30),(33,33,33,33,'Top Level of: Employee Others','This is the top level test for Employee Others. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:33',30,30),(34,34,34,34,'Top Level of: Payroll','This is the top level test for Payroll. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:35',30,30),(35,35,35,35,'Top Level of: Payroll Statistics','This is the top level test for Payroll Statistics. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:40',30,30),(36,36,36,36,'Top Level of: Absence Statistics','This is the top level test for Absence Statistics. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:43',30,30),(37,37,37,37,'Top Level of: Reports','This is the top level test for Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:46',30,30),(38,38,38,38,'Top Level of: Monthly Reports','This is the top level test for Monthly Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:48',30,30),(39,39,39,39,'Top Level of: Yearly Reports','This is the top level test for Yearly Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:53',30,30),(40,40,40,40,'Top Level of: Bulk Updates','This is the top level test for Bulk Updates. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:33:55',30,30),(41,41,41,41,'Top Level of: Settings','This is the top level test for Settings. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:34:02',30,30),(42,42,42,42,'Top Level of: Authorisations Form','This is the top level test for Authorisations Form. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,16,16),(43,43,43,43,'Company','TODO - Enter Description','2021-05-17','-','-','-','Company',0,'SB_1',NULL,NULL,42,42),(44,44,44,44,'Company Combo','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',0,'SB_1',NULL,NULL,42,42),(45,45,45,45,'Grouping View ','TODO - Enter Description','2021-05-17','-','-','-','Grouping View ',0,'SB_1',NULL,NULL,42,42),(46,46,46,46,'Grouping View Combo','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Authorisation Group A~GROUP B~General Group~View All Groups',0,'SB_1',NULL,NULL,42,42),(47,47,47,47,'Top Level of: Accept Criteria','This is the top level test for Accept Criteria. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42),(48,48,48,48,'Top Level of: Authorisations Grid','This is the top level test for Authorisations Grid. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42),(49,49,49,49,'Top Level of: Employee Creation Wizard - Step 1','This is the top level test for Employee Creation Wizard - Step 1. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106),(50,50,50,50,'Name','Should be able to enter the employee name','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49),(51,51,51,51,'Surname','Should be able to enter the employee surname','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49),(52,52,52,52,'Identity Card Number','Should be able to enter the employee id card num. Should error if not valid.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49),(53,53,53,53,'Employee Code','Should be able to enter the employee code. Should error if not valid code.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49),(54,54,54,54,'Address','Should be able to enter the employee address - number','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49),(55,55,55,55,'Street','Should be able to enter the employee address - street','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49),(56,56,56,56,'Post Code','Should be able to enter the employee post code','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49),(57,57,57,57,'Select A Town','Should be able to select a town from a populated list','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,49,49),(58,58,58,58,'Select A Country','Should be able to select a country','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,49,49),(59,59,59,59,'Top Level of: Back','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,49,49),(60,60,60,60,'Top Level of: Continue','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,49,49),(61,61,61,61,'Top Level of: Employee Creation Wizard - Step 2','This is the top level test for Employee Creation Wizard - Step 2. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106),(62,62,62,62,'Select A Gender','Should be able to select a gender','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(63,63,63,63,'Date Of Birth','Should be able to enter a DOB. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(64,64,64,64,'Date Of Employment','Should be able to enter a DOE. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(65,65,65,65,'Tax Number','Should be able to enter a tax number. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(66,66,66,66,'NI Number','Should be able to enter a NI number. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(67,67,67,67,'Select A Bank','Should be able to select a bank from the list','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,61,61),(68,68,68,68,'IBAN Number','Should be able to enter an IBAN','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(69,69,69,69,'Email Address','Should be able to enter an email address. Should error if not valid.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(70,70,70,70,'Mobile Number','Should be able to enter a mobile number. Should error if not valid.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61),(71,71,71,71,'Top Level of: Back','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,61,61),(72,72,72,72,'Top Level of: Continue','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,61,61),(73,73,73,73,'Top Level of: Employee Creation Wizard - Step 3','This is the top level test for Employee Creation Wizard - Step 3. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106),(74,74,74,74,'Select A Tax Status','Should be able to select a tax status from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(75,75,75,75,'Select An Employment Type','Should be able to select an employement type from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(76,76,76,76,'Select Company','Should be able to select a company from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(77,77,77,77,'Select A Paygroup','Should be able to select a paygroup from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(78,78,78,78,'Select A Department','Should be able to select a department from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(79,79,79,79,'Select a Schedule','Should be able to select a schedule from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(80,80,80,80,'Full or Part Timer ?','Should be able to select if the emp is full or part time from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(81,81,81,81,'Special Part Timer','Should be able to select if the emp is a special part timer from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(82,82,82,82,'Select a Grade','Should be able to select a grade from a populated list (IF SETUP).','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(83,83,83,83,'Select a Cost Center','Should be able to select a cost center from a populated list (IF SETUP).','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73),(84,84,84,84,'Top Level of: Back','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,73,73),(85,85,85,85,'Top Level of: Continue','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,73,73),(86,86,86,86,'Top Level of: Employee Creation Wizard - Step 4','This is the top level test for Employee Creation Wizard - Step 4. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106),(87,87,87,87,'Taxable Allowance 1 (Permenant)','Should be able to choose a taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86),(88,88,88,88,'Allowance Amount - Permanent','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,86,86),(89,89,89,89,'Taxable Allowance 2 (Permenant)','Should be able to choose a taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86),(90,90,90,90,'Allowance Amount - Permanent','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,86,86),(91,91,91,91,'Non Taxable Allowance 1 (Permenant)','Should be able to choose a non taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86),(92,92,92,92,'Allowance Amount - Permanent','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,86,86),(93,93,93,93,'Non Taxable Allowance 2 (Permenant)','Should be able to choose a non taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86),(94,94,94,94,'Top Level of: Back','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,86,86),(95,95,95,95,'Top Level of: Continue','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,86,86),(96,96,96,96,'Top Level of: Employee Creation Wizard - Step 5','This is the top level test for Employee Creation Wizard - Step 5. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106),(97,97,97,97,'Annual Salary','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,96,96),(98,98,98,98,'Hourly Rate','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,96,96),(99,99,99,99,'Top Level of: Back','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,96,96),(100,100,100,100,'Top Level of: Create Employee','This is the top level test for Create Employee. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,96,96),(101,101,101,101,'Heading ECW Step 1','Is the heading correct','2021-05-18','-','-','-','Basic Details',0,'SB_1',NULL,NULL,49,49),(102,102,102,102,'Heading ECW Step 2','Is the heading correct','2021-05-18','-','-','-','Basic Details',0,'SB_1',NULL,NULL,61,61),(103,103,103,103,'Heading ECW Step 3','Is the heading correct','2021-05-18','-','-','-','Payroll Related Details',0,'SB_1',NULL,NULL,73,73),(104,104,104,104,'Heading ECW Step 4','Is the heading correct','2021-05-18','-','-','-','Permanent Allowances',0,'SB_1',NULL,NULL,86,86),(105,105,105,105,'Heading ECW Step 5','Is the heading correct','2021-05-18','-','-','-','Salary Details',0,'SB_1',NULL,NULL,96,96),(106,106,106,106,'Top Level of: Employee Creation Wizard','This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,17,17),(107,107,107,107,'Employee Creation Wizard - Title','Is the title correct','2021-05-18','-','-','-','Employee Creation Wizard',0,'SB_1',NULL,NULL,106,106),(108,108,108,108,'Top Level of: Employee CV','This is the top level test for Employee CV. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,18,18),(109,109,109,109,'Employee CV - Title','Should display title','2021-05-19','-','-','-','Employee Payroll CV',0,'SB_1',NULL,NULL,108,108),(110,110,110,110,'Company - Label','Should display label value','2021-05-19','-','-','-','Company',0,'SB_1',NULL,NULL,108,108),(111,111,111,111,'Company - List','Should be able to choose from a populated list','2021-05-19','Display data','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',0,'SB_1',NULL,NULL,108,108),(112,112,112,112,'Paygroup - Label','Should display label value','2021-05-19','-','-','-','Paygroup',0,'SB_1',NULL,NULL,108,108),(113,113,113,113,'Paygroup - List','Should be able to choose from a populated list','2021-05-19','Display data','-','-','Monthly Paygroup',0,'SB_1',NULL,NULL,108,108),(114,114,114,114,'Employee - Label','Should display label value','2021-05-19','-','-','-','Employees',0,'SB_1',NULL,NULL,108,108),(115,115,115,115,'Employee - List','Should be able to choose from a populated list','2021-05-19','Display data','-','-','#INF#',0,'SB_1',NULL,NULL,108,108),(116,116,116,116,'Top Level of: Accept Criteria','This is the top level test for Accept Criteria. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,108,108),(117,117,117,117,'Accept Criteria - Text','TODO - Enter Description','2021-05-19','-','-','-','Accept Criteria',0,'SB_1',NULL,NULL,116,116),(118,118,118,118,'Top Level of: Bio Info','This is the top level test for Bio Info. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,108,108),(120,120,120,120,'Employee Name','Should display employee name','2021-05-19','-','-','-','TODO - Enter header text',0,'SB_1',NULL,NULL,118,118),(121,121,121,121,'Employee Name With Salutation','Should display employee name with salutation','2021-05-19','Paragraph','-','-','TODO - Enter paragraph data',0,'SB_1',NULL,NULL,118,118),(122,122,122,122,'Employee Company','Should display employee company','2021-05-19','Paragraph','-','-','TODO - Enter paragraph data',0,'SB_1',NULL,NULL,118,118),(123,123,123,123,'Employee Birthday','Should display the employees birthday','2021-05-19','Paragraph','-','-','TODO - Enter paragraph data',0,'SB_1',NULL,NULL,118,118),(124,124,124,124,'User FaFa','Should display user fa fa','2021-05-19','-','-','-','fa fa-fw fa fa-user',0,'SB_1',NULL,NULL,118,118),(125,125,125,125,'Company FaFa','Should display bank (company) fa fa','2021-05-19','-','-','-','fa fa-fw fa fa-bank',0,'SB_1',NULL,NULL,118,118),(126,126,126,126,'Birthday FaFa','Should display birthday-cake fa fa','2021-05-19','-','-','-','fa fa-fw fa fa-birthday-cake',0,'SB_1',NULL,NULL,118,118),(127,127,127,127,'Top Level of: Bio Content','This is the top level test for Bio Content. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,118,118),(128,128,128,128,'Top Level of: Accordion - CV','This is the top level test for Accordion - CV. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,108,108),(129,129,129,129,'Top Level of: Accordion - CV - Career','This is the top level test for Accordion - CV - Career. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,128,128),(130,130,130,130,'Top Level of: Grid - Career','This is the top level test for Grid - Career. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,129,129),(131,131,131,131,'Top Level of: Acc Key - CV - Allowance','This is the top level test for Acc Key - CV - Allowance. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,128,128),(132,132,132,132,'Top Level of: Grid - Allowance','This is the top level test for Grid - Allowance. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,131,131),(133,133,133,133,'Top Level of: Acc Key - CV - Salary','This is the top level test for Acc Key - CV - Salary. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,128,128),(134,134,134,134,'Top Level of: Grid - Salary','This is the top level test for Grid - Salary. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,133,133),(135,135,135,135,'Top Level of: Acc Key - Emp Schedule','This is the top level test for Acc Key - Emp Schedule. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,128,128),(136,136,136,136,'Top Level of: Grid - Emp Schedule','This is the top level test for Grid - Emp Schedule. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,135,135),(137,137,137,137,'Top Level of: Acc Key - Working Permit','This is the top level test for Acc Key - Working Permit. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,128,128),(138,138,138,138,'Top Level of: Grid - Work Permit','This is the top level test for Grid - Work Permit. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,137,137),(139,139,139,139,'Top Level of: Save','This is the top level test for Save. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,108,108),(140,140,140,140,'Top Level of: Form - Save','This is the top level test for Form - Save. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,139,139),(141,141,141,141,'Top Level of: Form - Save - Header','This is the top level test for Form - Save - Header. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,140,140),(142,142,142,142,'Form - Save - Title','Should display the title of the save form','2021-05-19','-','-','-','Save Changes',0,'SB_1',NULL,NULL,141,141),(143,143,143,143,'Top Level of: Form - Save - Body','This is the top level test for Form - Save - Body. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,140,140),(144,144,144,144,'Top Level of: Form - Save - Footer','This is the top level test for Form - Save - Footer. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,140,140),(145,145,145,145,'Top Level of: Button Ok','This is the top level test for Button Ok. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,144,144),(146,146,146,146,'Top Level of: Button Cancel','This is the top level test for Button Cancel. For this to pass all its children must pass.','2021-05-19','','','','',0,'SB_1',NULL,NULL,144,144),(147,147,147,147,'Top Level of: Employee Grid View - Grid','This is the top level test for Employee Grid View - Grid. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,148,148),(148,148,148,148,'Top Level of: Employee Grid View - Form','This is the top level test for Employee Grid View - Form. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,19,19),(9000,9000,9000,9000,'Top Level of: JSPanel','This is the top level test for JSPanel. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,1,1),(9001,9001,9001,9001,'Top Level of: JSPanel Standard','Standard JS Panel','2021-05-20','','','','',0,'SB_1',NULL,NULL,9000,9000),(9002,9002,9002,9002,'Top Level of: JSPanel Header',' JS Panel header','2021-05-20','','','','',0,'SB_1',NULL,NULL,9000,9000),(9003,9003,9003,9003,'JS Footer','Footer of JS Panel','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9000,9000),(9004,9004,9004,9004,'Top Level of: JS Content','This is the top level test for JS Content. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,9000,9000),(9005,9005,9005,9005,'JSMinBox','Minimise JS Panel','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9000,9000),(9006,9006,9006,9006,'JSResizeit','Resize JS Panel','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9000,9000),(9007,9007,9007,9007,'JSHeaderLogo','JS Panel logo','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9002,9002),(9008,9008,9008,9008,'Top Level of: JSTitlebar','This is the top level test for JSTitlebar. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,9002,9002),(9009,9009,9009,9009,'Top Level of: JSControlbar','This is the top level test for JSControlbar. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,9002,9002),(9010,9010,9010,9010,'Top Level of: JSHeaderToolbarActive','This is the top level test for JSHeaderToolbarActive. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,9002,9002),(9011,9011,9011,9011,'Top Level of: JSDropdown','This is the top level test for JSDropdown. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,9000,9000),(9012,9012,9012,9012,'JSDropdownToggle','JS Panel toggle','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9011,9011),(9013,9013,9013,9013,'JSDropdownMenu','JS Panel dropdown menu','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9011,9011),(9014,9014,9014,9014,'JSPanelSwitchRotate','Rotate thru JS Panels','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9010,9010),(9015,9015,9015,9015,'JSPanelBtn','JS Panel button','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9009,9009),(9016,9016,9016,9016,'JSPanelBtnNormalise','JS Panel button normalise','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9009,9009),(9017,9017,9017,9017,'JSPanelBtnExpand','JS Panel button expand','2021-05-20','Element','-','-','-',0,'SB_1',NULL,NULL,9009,9009),(9018,9018,9018,9018,'Top Level of: DKGrid','This is the top level test for DKGrid. For this to pass all its children must pass.','2021-05-20','','','','',0,'SB_1',NULL,NULL,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_category`
--

LOCK TABLES `entity_test_category` WRITE;
/*!40000 ALTER TABLE `entity_test_category` DISABLE KEYS */;
INSERT INTO `entity_test_category` VALUES (1,'None','No test category\r'),(2,'App','Overall test for the app\r'),(3,'Group App Functions','A group of app functions eg a module\r'),(4,'Group Module Functions','A group of functions for a module\r'),(5,'Group Data','An entity that groups related data\r'),(6,'Group Controls','An entity that groups controls\r'),(7,'Redirect','An entity that redirects the user eg button\r'),(8,'Info','An entity that supplies information eg info bar\r'),(9,'Display Image','Displays an image\r'),(10,'Data In/Out','Has data in and out eg text box\r'),(11,'Data In','Has data in eg text box\r'),(12,'Data Out','Has data out eg label\r'),(13,'Display Child','Displays a child form/pop up form etc\r'),(14,'Perform Function','The entity performs a function');
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
INSERT INTO `entity_test_has_one_or_more_test_categories` VALUES (2,1,2,2),(5,2,3,3),(5,2,9,9),(5,2,42,42),(5,2,106,106),(5,2,108,108),(5,2,140,140),(5,2,148,148),(6,1,3,3),(6,1,9,9),(6,1,42,42),(6,1,106,106),(6,1,108,108),(6,1,140,140),(6,1,148,148),(7,1,8,8),(7,2,10,10),(7,1,15,15),(7,1,29,29),(7,1,30,30),(11,1,5,5),(11,1,7,7),(11,2,48,48),(11,1,50,50),(11,1,51,51),(11,1,52,52),(11,1,53,53),(11,1,54,54),(11,1,55,55),(11,1,56,56),(11,2,57,57),(11,2,58,58),(11,1,62,62),(11,1,63,63),(11,1,64,64),(11,1,65,65),(11,1,66,66),(11,2,67,67),(11,1,68,68),(11,1,69,69),(11,1,70,70),(11,2,74,74),(11,2,75,75),(11,2,76,76),(11,2,77,77),(11,2,78,78),(11,2,79,79),(11,2,80,80),(11,2,81,81),(11,2,82,82),(11,2,83,83),(11,2,87,87),(11,1,88,88),(11,2,89,89),(11,1,90,90),(11,2,91,91),(11,1,92,92),(11,2,93,93),(11,1,97,97),(11,1,98,98),(11,2,111,111),(11,2,113,113),(11,2,115,115),(11,2,130,130),(11,2,132,132),(11,2,134,134),(11,2,136,136),(11,2,138,138),(11,2,147,147),(12,1,10,10),(12,1,12,12),(12,2,15,15),(12,2,29,29),(12,2,30,30),(12,1,43,43),(12,1,45,45),(12,1,48,48),(12,1,57,57),(12,1,58,58),(12,1,67,67),(12,1,74,74),(12,1,75,75),(12,1,76,76),(12,1,77,77),(12,1,78,78),(12,1,79,79),(12,1,80,80),(12,1,81,81),(12,1,82,82),(12,1,83,83),(12,1,87,87),(12,1,89,89),(12,1,91,91),(12,1,93,93),(12,1,110,110),(12,1,111,111),(12,1,112,112),(12,1,113,113),(12,1,114,114),(12,1,115,115),(12,1,130,130),(12,1,132,132),(12,1,134,134),(12,1,136,136),(12,1,138,138),(12,1,147,147),(13,1,16,16),(13,1,17,17),(13,1,18,18),(13,1,19,19),(13,1,20,20),(13,1,21,21),(13,1,22,22),(13,1,23,23),(13,1,24,24),(13,1,25,25),(13,1,26,26),(13,1,27,27),(13,1,28,28),(13,1,31,31),(13,1,32,32),(13,1,33,33),(13,1,34,34),(13,1,35,35),(13,1,36,36),(13,1,37,37),(13,1,38,38),(13,1,39,39),(13,1,40,40),(13,1,41,41),(14,1,59,59),(14,1,60,60),(14,1,71,71),(14,1,72,72),(14,1,84,84),(14,1,85,85),(14,1,94,94),(14,1,95,95),(14,1,99,99),(14,1,100,100),(14,1,116,116),(14,1,139,139),(14,1,145,145),(14,1,146,146);
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
INSERT INTO `entity_test_has_version` VALUES (76,1,1),(77,2,2),(78,3,3),(80,5,5),(82,7,7),(83,8,8),(84,9,9),(85,10,10),(86,12,12),(87,14,14),(88,13,13),(89,15,15),(90,16,16),(91,17,17),(92,18,18),(93,19,19),(94,20,20),(95,21,21),(96,22,22),(97,23,23),(98,24,24),(99,25,25),(100,26,26),(101,27,27),(102,28,28),(103,29,29),(104,30,30),(105,31,31),(106,32,32),(107,33,33),(108,34,34),(109,35,35),(110,36,36),(111,37,37),(112,38,38),(113,39,39),(114,40,40),(115,41,41),(126,42,42),(127,43,43),(128,44,44),(129,45,45),(130,46,46),(131,47,47),(132,48,48),(208,106,106),(209,107,107),(210,49,49),(211,101,101),(212,50,50),(213,51,51),(214,52,52),(215,53,53),(216,54,54),(217,55,55),(218,56,56),(219,57,57),(220,58,58),(221,59,59),(222,60,60),(223,61,61),(224,102,102),(225,62,62),(226,63,63),(227,64,64),(228,65,65),(229,66,66),(230,67,67),(231,68,68),(232,69,69),(233,70,70),(234,71,71),(235,72,72),(236,73,73),(237,103,103),(238,74,74),(239,75,75),(240,76,76),(241,77,77),(242,78,78),(243,79,79),(244,80,80),(245,81,81),(246,82,82),(247,83,83),(248,84,84),(249,85,85),(250,86,86),(251,104,104),(252,87,87),(253,88,88),(254,89,89),(255,90,90),(256,91,91),(257,92,92),(258,93,93),(259,94,94),(260,95,95),(261,96,96),(262,105,105),(263,97,97),(264,98,98),(265,99,99),(266,100,100),(330,108,108),(331,109,109),(332,110,110),(333,111,111),(334,112,112),(335,113,113),(336,114,114),(337,115,115),(338,116,116),(339,117,117),(340,118,118),(341,120,120),(342,121,121),(343,122,122),(344,123,123),(345,124,124),(346,125,125),(347,126,126),(348,127,127),(349,128,128),(350,129,129),(351,130,130),(352,131,131),(353,132,132),(354,133,133),(355,134,134),(356,135,135),(357,136,136),(358,137,137),(359,138,138),(360,139,139),(361,140,140),(362,141,141),(363,142,142),(364,143,143),(365,144,144),(366,145,145),(367,146,146),(391,147,147),(392,148,148),(402,9000,9000),(403,9003,9003),(404,9005,9005),(405,9006,9006),(406,9001,9001),(407,9002,9002),(408,9007,9007),(409,9004,9004),(410,9008,9008),(411,9009,9009),(412,9015,9015),(413,9016,9016),(414,9017,9017),(415,9010,9010),(416,9014,9014),(417,9011,9011),(418,9012,9012),(419,9013,9013),(420,9018,9018);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_todo`
--

LOCK TABLES `entity_todo` WRITE;
/*!40000 ALTER TABLE `entity_todo` DISABLE KEYS */;
INSERT INTO `entity_todo` VALUES (1,3,3,'2021-05-16','Google & Active dir.',0,'1900-01-01'),(2,106,106,'2021-05-19','Add step images and buttons found at the top of the form',0,'1900-01-01'),(3,49,49,'2021-05-19','Add data to children for this step',0,'1900-01-01'),(4,61,61,'2021-05-19','Add data to children for this step',0,'1900-01-01'),(5,73,73,'2021-05-19','Add data to children for this step',0,'1900-01-01'),(6,86,86,'2021-05-19','Add data to children for this step',0,'1900-01-01'),(7,96,96,'2021-05-19','Add data to children for this step',0,'1900-01-01'),(8,113,113,'2021-05-19','Check why only Monthly Paygroup is available',0,'1900-01-01'),(9,130,130,'2021-05-19','Add grid details',0,'1900-01-01'),(10,132,132,'2021-05-19','Add grid details',0,'1900-01-01'),(11,134,134,'2021-05-19','Add grid details',0,'1900-01-01'),(12,136,136,'2021-05-19','Add grid details',0,'1900-01-01'),(13,138,138,'2021-05-19','Add grid details',0,'1900-01-01'),(14,147,147,'2021-05-19','Add grid details',0,'1900-01-01'),(15,149,149,'2021-05-20','All of visual reports',0,'1900-01-01');
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
INSERT INTO `entity_type` VALUES (1,'Root',1),(2,'Application',1),(26,'Function',1),(33,'Text',1),(35,'Container',1),(38,'FaFa',1),(43,'JSPanel',1),(61,'DKGrid',1),(3,'Module',2),(6,'Form',2),(4,'Module Category',3),(5,'Module Sub-Category',4),(7,'Modal Form',6),(8,'Parent Form',6),(9,'Child Form',6),(10,'Nav Bar',6),(11,'Info Bar',6),(12,'Grid',6),(13,'Image',6),(14,'Control',6),(27,'Titlebar',6),(28,'Header 1',6),(29,'Header 2',6),(30,'Header 3',6),(31,'Header 4',6),(32,'Header 5',6),(34,'Paragraph',6),(36,'Accordion',6),(39,'Modal Header',7),(41,'Modal Body',7),(42,'Modal Footer',7),(15,'List',14),(16,'Tab',14),(17,'Text Out',14),(18,'Text In',14),(19,'Text In/Out',14),(20,'Combo',14),(21,'Label',14),(22,'Button',14),(23,'Button - Redirect',21),(24,'Button - Display',21),(25,'Button - Function',21),(62,'Card',35),(37,'Accordion Key',36),(40,'Modal Title',39),(44,'JSStandard',43),(45,'JSHeader',43),(46,'JSContent',43),(47,'JSMinBox',43),(48,'JSFtr',43),(49,'JSResizeit',43),(54,'JSDropdown',43),(50,'JSHeaderLogo',45),(51,'JSTitlebar',45),(52,'JSControlbar',45),(53,'JSHeaderToolbarActive',45),(58,'JSPanelBtn',52),(59,'JSPanelBtnNormalise',52),(60,'JSPanelBtnExpand',52),(57,'JSPanelSwitchRotate',53),(55,'JSDropdownToggle',54),(56,'JSDropdownMenu',54),(63,'Card Group',62),(65,'Card Header',62),(64,'Card Element',63),(66,'Card Body',64),(67,'Card Title',64),(68,'Element Header',64);
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
INSERT INTO `temp_test_in_test_run` VALUES ('Home Page Top Right Nav Bar',15,15,16,16,16,16,16,16,'Top Level of: Authorisations','1.0.0','This is the top level test for Authorisations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:00',15,15,'Button - Display','Authorisations','2021-05-17','16:29:00','True','Authorisations'),('Home Page Top Right Nav Bar',15,15,17,17,17,17,17,17,'Top Level of: Employee Creation Wizard','1.0.0','This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:05',15,15,'Button - Display','Employee Creation Wizard','2021-05-17','16:29:05','True','Employee Creation'),('Home Page Top Right Nav Bar',15,15,18,18,18,18,18,18,'Top Level of: Employee CV','1.0.0','This is the top level test for Employee CV. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:09',15,15,'Button - Display','Employee CV','2021-05-17','16:29:09','True','Employee CV'),('Home Page Top Right Nav Bar',15,15,19,19,19,19,19,19,'Top Level of: Employee Grid View','1.0.0','This is the top level test for Employee Grid View. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:14',15,15,'Button - Display','Employee Grid View','2021-05-17','16:29:14','True','Employee Grid View'),('Home Page Top Right Nav Bar',15,15,20,20,20,20,20,20,'Top Level of: Visual Reports','1.0.0','This is the top level test for Visual Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:19',15,15,'Button - Display','Visual Reports','2021-05-17','16:29:19','True','Visual Reports'),('Home Page Top Right Nav Bar',15,15,21,21,21,21,21,21,'Top Level of: Dakar Intelligence','1.0.0','This is the top level test for Dakar Intelligence. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:22',15,15,'Button - Display','Dakar Intelligence','2021-05-17','16:29:22','True','Dakar Intelligence'),('Home Page Top Right Nav Bar',15,15,22,22,22,22,22,22,'Top Level of: Organisation Chart','1.0.0','This is the top level test for Organisation Chart. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:29:31',15,15,'Button - Display','Organisation Chart','2021-05-17','16:29:31','False','-'),('Home Page Top Right Nav Bar',15,15,23,23,23,23,23,23,'Top Level of: My Company / Last Viewed','1.0.0','This is the top level test for My Company / Last Viewed. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:20',15,15,'Button - Display','My Company / Last Viewed','2021-05-17','16:31:20','True','My Company / Last Viewed'),('Home Page Top Right Nav Bar',15,15,24,24,24,24,24,24,'Top Level of: All Notifications','1.0.0','This is the top level test for All Notifications. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:26',15,15,'Button - Display','All Notifications','2021-05-17','16:31:26','True','Notifications'),('Home Page Top Right Nav Bar',15,15,25,25,25,25,25,25,'Top Level of: New Employments','1.0.0','This is the top level test for New Employments. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:32',15,15,'Button - Display','New Employments','2021-05-17','16:31:32','True','New Employments'),('Home Page Top Right Nav Bar',15,15,26,26,26,26,26,26,'Top Level of: Terminations','1.0.0','This is the top level test for Terminations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:34',15,15,'Button - Display','Terminations','2021-05-17','16:31:34','True','Terminations'),('Home Page Top Right Nav Bar',15,15,27,27,27,27,27,27,'Top Level of: Quick Links','1.0.0','This is the top level test for Quick Links. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:31:43',15,15,'Button - Display','Quick Links','2021-05-17','16:31:43','True','Quick Links'),('Home Page Top Right Nav Bar',15,15,28,28,28,28,28,28,'Top Level of: User Avatar','1.0.0','This is the top level test for User Avatar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1','2021-05-17','16:32:09',15,15,'Button - Display','User Avatar','2021-05-17','16:32:09','True','User'),('Authorisations',16,16,42,42,42,42,42,42,'Top Level of: Authorisations Form','1.0.0','This is the top level test for Authorisations Form. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,16,16,'Form','Authorisations Form','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard',17,17,106,106,106,106,106,106,'Top Level of: Employee Creation Wizard','1.0.0','This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,17,17,'Form','Employee Creation Wizard','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,43,43,43,43,43,43,'Company','1.0.0','TODO - Enter Description','2021-05-17','-','-','-','Company',0,'SB_1',NULL,NULL,42,42,'Label','Company','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,44,44,44,44,44,44,'Company Combo','1.0.0','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Mars Northern Products Ltd~Mars Incorporated Ltd',0,'SB_1',NULL,NULL,42,42,'Combo','Company Combo','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,45,45,45,45,45,45,'Grouping View ','1.0.0','TODO - Enter Description','2021-05-17','-','-','-','Grouping View ',0,'SB_1',NULL,NULL,42,42,'Label','Grouping View ','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,46,46,46,46,46,46,'Grouping View Combo','1.0.0','TODO - Enter Description','2021-05-17','Peform function based on value','-','-','Authorisation Group A~GROUP B~General Group~View All Groups',0,'SB_1',NULL,NULL,42,42,'Combo','Grouping View Combo','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,47,47,47,47,47,47,'Top Level of: Accept Criteria','1.0.0','This is the top level test for Accept Criteria. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42,'Button - Function','Accept Criteria','1900-01-01','00:00:00','False','-'),('Authorisations Form',42,42,48,48,48,48,48,48,'Top Level of: Authorisations Grid','1.0.0','This is the top level test for Authorisations Grid. For this to pass all its children must pass.','2021-05-17','','','','',0,'SB_1',NULL,NULL,42,42,'Grid','Authorisations Grid','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard',106,106,107,107,107,107,107,107,'Employee Creation Wizard - Title','1.0.0','Is the title correct','2021-05-18','-','-','-','Employee Creation Wizard',0,'SB_1',NULL,NULL,106,106,'Titlebar','Employee Creation Wizard - Title','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard',106,106,49,49,49,49,49,49,'Top Level of: Employee Creation Wizard - Step 1','1.0.0','This is the top level test for Employee Creation Wizard - Step 1. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106,'Function','Employee Creation Wizard - Step 1','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard',106,106,61,61,61,61,61,61,'Top Level of: Employee Creation Wizard - Step 2','1.0.0','This is the top level test for Employee Creation Wizard - Step 2. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106,'Function','Employee Creation Wizard - Step 2','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard',106,106,73,73,73,73,73,73,'Top Level of: Employee Creation Wizard - Step 3','1.0.0','This is the top level test for Employee Creation Wizard - Step 3. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106,'Function','Employee Creation Wizard - Step 3','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard',106,106,86,86,86,86,86,86,'Top Level of: Employee Creation Wizard - Step 4','1.0.0','This is the top level test for Employee Creation Wizard - Step 4. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106,'Function','Employee Creation Wizard - Step 4','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard',106,106,96,96,96,96,96,96,'Top Level of: Employee Creation Wizard - Step 5','1.0.0','This is the top level test for Employee Creation Wizard - Step 5. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,106,106,'Function','Employee Creation Wizard - Step 5','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,101,101,101,101,101,101,'Heading ECW Step 1','1.0.0','Is the heading correct','2021-05-18','-','-','-','Basic Details',0,'SB_1',NULL,NULL,49,49,'Header 3','Heading ECW Step 1','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,50,50,50,50,50,50,'Name','1.0.0','Should be able to enter the employee name','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49,'Text In','Name','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,51,51,51,51,51,51,'Surname','1.0.0','Should be able to enter the employee surname','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49,'Text In','Surname','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,52,52,52,52,52,52,'Identity Card Number','1.0.0','Should be able to enter the employee id card num. Should error if not valid.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49,'Text In','Identity Card Number','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,53,53,53,53,53,53,'Employee Code','1.0.0','Should be able to enter the employee code. Should error if not valid code.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49,'Text In','Employee Code','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,54,54,54,54,54,54,'Address','1.0.0','Should be able to enter the employee address - number','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49,'Text In','Address','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,55,55,55,55,55,55,'Street','1.0.0','Should be able to enter the employee address - street','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49,'Text In','Street','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,56,56,56,56,56,56,'Post Code','1.0.0','Should be able to enter the employee post code','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,49,49,'Text In','Post Code','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,57,57,57,57,57,57,'Select A Town','1.0.0','Should be able to select a town from a populated list','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,49,49,'List','Select A Town','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,58,58,58,58,58,58,'Select A Country','1.0.0','Should be able to select a country','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,49,49,'List','Select A Country','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,59,59,59,59,59,59,'Top Level of: Back','1.0.0','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,49,49,'Button - Function','Back','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 1',49,49,60,60,60,60,60,60,'Top Level of: Continue','1.0.0','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,49,49,'Button - Function','Continue','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,102,102,102,102,102,102,'Heading ECW Step 2','1.0.0','Is the heading correct','2021-05-18','-','-','-','Basic Details',0,'SB_1',NULL,NULL,61,61,'Header 3','Heading ECW Step 2','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,62,62,62,62,62,62,'Select A Gender','1.0.0','Should be able to select a gender','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','Select A Gender','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,63,63,63,63,63,63,'Date Of Birth','1.0.0','Should be able to enter a DOB. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','Date Of Birth','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,64,64,64,64,64,64,'Date Of Employment','1.0.0','Should be able to enter a DOE. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','Date Of Employment','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,65,65,65,65,65,65,'Tax Number','1.0.0','Should be able to enter a tax number. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','Tax Number','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,66,66,66,66,66,66,'NI Number','1.0.0','Should be able to enter a NI number. Should error if does not make sense','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','NI Number','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,67,67,67,67,67,67,'Select A Bank','1.0.0','Should be able to select a bank from the list','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,61,61,'List','Select A Bank','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,68,68,68,68,68,68,'IBAN Number','1.0.0','Should be able to enter an IBAN','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','IBAN Number','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,69,69,69,69,69,69,'Email Address','1.0.0','Should be able to enter an email address. Should error if not valid.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','Email Address','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,70,70,70,70,70,70,'Mobile Number','1.0.0','Should be able to enter a mobile number. Should error if not valid.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,61,61,'Text In','Mobile Number','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,71,71,71,71,71,71,'Top Level of: Back','1.0.0','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,61,61,'Button - Function','Back','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 2',61,61,72,72,72,72,72,72,'Top Level of: Continue','1.0.0','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,61,61,'Button - Function','Continue','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,103,103,103,103,103,103,'Heading ECW Step 3','1.0.0','Is the heading correct','2021-05-18','-','-','-','Payroll Related Details',0,'SB_1',NULL,NULL,73,73,'Header 3','Heading ECW Step 3','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,74,74,74,74,74,74,'Select A Tax Status','1.0.0','Should be able to select a tax status from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select A Tax Status','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,75,75,75,75,75,75,'Select An Employment Type','1.0.0','Should be able to select an employement type from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select An Employment Type','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,76,76,76,76,76,76,'Select Company','1.0.0','Should be able to select a company from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select Company','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,77,77,77,77,77,77,'Select A Paygroup','1.0.0','Should be able to select a paygroup from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select A Paygroup','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,78,78,78,78,78,78,'Select A Department','1.0.0','Should be able to select a department from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select A Department','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,79,79,79,79,79,79,'Select a Schedule','1.0.0','Should be able to select a schedule from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select a Schedule','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,80,80,80,80,80,80,'Full or Part Timer ?','1.0.0','Should be able to select if the emp is full or part time from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Full or Part Timer ?','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,81,81,81,81,81,81,'Special Part Timer','1.0.0','Should be able to select if the emp is a special part timer from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Special Part Timer','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,82,82,82,82,82,82,'Select a Grade','1.0.0','Should be able to select a grade from a populated list (IF SETUP).','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select a Grade','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,83,83,83,83,83,83,'Select a Cost Center','1.0.0','Should be able to select a cost center from a populated list (IF SETUP).','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,73,73,'List','Select a Cost Center','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,84,84,84,84,84,84,'Top Level of: Back','1.0.0','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,73,73,'Button - Function','Back','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 3',73,73,85,85,85,85,85,85,'Top Level of: Continue','1.0.0','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,73,73,'Button - Function','Continue','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,104,104,104,104,104,104,'Heading ECW Step 4','1.0.0','Is the heading correct','2021-05-18','-','-','-','Permanent Allowances',0,'SB_1',NULL,NULL,86,86,'Header 3','Heading ECW Step 4','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,87,87,87,87,87,87,'Taxable Allowance 1 (Permenant)','1.0.0','Should be able to choose a taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86,'List','Taxable Allowance 1 (Permenant)','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,88,88,88,88,88,88,'Allowance Amount - Permanent','1.0.0','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,86,86,'Text In','Allowance Amount - Permanent','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,89,89,89,89,89,89,'Taxable Allowance 2 (Permenant)','1.0.0','Should be able to choose a taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86,'List','Taxable Allowance 2 (Permenant)','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,90,90,90,90,90,90,'Allowance Amount - Permanent','1.0.0','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,86,86,'Text In','Allowance Amount - Permanent','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,91,91,91,91,91,91,'Non Taxable Allowance 1 (Permenant)','1.0.0','Should be able to choose a non taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86,'List','Non Taxable Allowance 1 (Permenant)','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,92,92,92,92,92,92,'Allowance Amount - Permanent','1.0.0','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,86,86,'Text In','Allowance Amount - Permanent','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,93,93,93,93,93,93,'Non Taxable Allowance 2 (Permenant)','1.0.0','Should be able to choose a non taxable allowance from a populated list.','2021-05-18','Display data','-','-','TODO - Enter list of data separated by a ~',0,'SB_1',NULL,NULL,86,86,'List','Non Taxable Allowance 2 (Permenant)','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,94,94,94,94,94,94,'Top Level of: Back','1.0.0','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,86,86,'Button - Function','Back','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 4',86,86,95,95,95,95,95,95,'Top Level of: Continue','1.0.0','This is the top level test for Continue. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,86,86,'Button - Function','Continue','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 5',96,96,105,105,105,105,105,105,'Heading ECW Step 5','1.0.0','Is the heading correct','2021-05-18','-','-','-','Salary Details',0,'SB_1',NULL,NULL,96,96,'Header 3','Heading ECW Step 5','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 5',96,96,97,97,97,97,97,97,'Annual Salary','1.0.0','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,96,96,'Text In','Annual Salary','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 5',96,96,98,98,98,98,98,98,'Hourly Rate','1.0.0','Should be able to enter the amount. Should error if not reasonable value.','2021-05-18','Enter data','TODO - Enter text that should be entered.','-','-',0,'SB_1',NULL,NULL,96,96,'Text In','Hourly Rate','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 5',96,96,99,99,99,99,99,99,'Top Level of: Back','1.0.0','This is the top level test for Back. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,96,96,'Button - Function','Back','1900-01-01','00:00:00','False','-'),('Employee Creation Wizard - Step 5',96,96,100,100,100,100,100,100,'Top Level of: Create Employee','1.0.0','This is the top level test for Create Employee. For this to pass all its children must pass.','2021-05-18','','','','',0,'SB_1',NULL,NULL,96,96,'Button - Function','Create Employee','1900-01-01','00:00:00','False','-');
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
) ENGINE=InnoDB AUTO_INCREMENT=9019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite`
--

LOCK TABLES `test_suite` WRITE;
/*!40000 ALTER TABLE `test_suite` DISABLE KEYS */;
INSERT INTO `test_suite` VALUES (1,1,'Root','ADD TEST SUITE NOTES',0,0),(2,2,'Dakar Web','ADD TEST SUITE NOTES',1,1),(3,3,'Login Screen','ADD TEST SUITE NOTES',2,2),(8,8,'Login Button','ADD TEST SUITE NOTES',3,3),(9,9,'Home Page','ADD TEST SUITE NOTES',2,2),(10,10,'Home Page Info Bar','ADD TEST SUITE NOTES',9,9),(13,13,'Menu Toggle','ADD TEST SUITE NOTES',10,10),(15,15,'Home Page Top Right Nav Bar','ADD TEST SUITE NOTES',9,9),(16,16,'Authorisations','ADD TEST SUITE NOTES',15,15),(17,17,'Employee Creation Wizard','ADD TEST SUITE NOTES',15,15),(18,18,'Employee CV','ADD TEST SUITE NOTES',15,15),(19,19,'Employee Grid View','ADD TEST SUITE NOTES',15,15),(20,20,'Visual Reports','ADD TEST SUITE NOTES',15,15),(21,21,'Dakar Intelligence','ADD TEST SUITE NOTES',15,15),(22,22,'Organisation Chart','ADD TEST SUITE NOTES',15,15),(23,23,'My Company / Last Viewed','ADD TEST SUITE NOTES',15,15),(24,24,'All Notifications','ADD TEST SUITE NOTES',15,15),(25,25,'New Employments','ADD TEST SUITE NOTES',15,15),(26,26,'Terminations','ADD TEST SUITE NOTES',15,15),(27,27,'Quick Links','ADD TEST SUITE NOTES',15,15),(28,28,'User Avatar','ADD TEST SUITE NOTES',15,15),(29,29,'Main Menu','ADD TEST SUITE NOTES',9,9),(30,30,'Main Menu - Payroll','ADD TEST SUITE NOTES',29,29),(31,31,'Employee List','ADD TEST SUITE NOTES',30,30),(32,32,'Documents','ADD TEST SUITE NOTES',30,30),(33,33,'Employee Others','ADD TEST SUITE NOTES',30,30),(34,34,'Payroll','ADD TEST SUITE NOTES',30,30),(35,35,'Payroll Statistics','ADD TEST SUITE NOTES',30,30),(36,36,'Absence Statistics','ADD TEST SUITE NOTES',30,30),(37,37,'Reports','ADD TEST SUITE NOTES',30,30),(38,38,'Monthly Reports','ADD TEST SUITE NOTES',30,30),(39,39,'Yearly Reports','ADD TEST SUITE NOTES',30,30),(40,40,'Bulk Updates','ADD TEST SUITE NOTES',30,30),(41,41,'Settings','ADD TEST SUITE NOTES',30,30),(42,42,'Authorisations Form','ADD TEST SUITE NOTES',16,16),(47,47,'Accept Criteria','ADD TEST SUITE NOTES',42,42),(48,48,'Authorisations Grid','ADD TEST SUITE NOTES',42,42),(49,49,'Employee Creation Wizard - Step 1','Step 1 of ECW',106,106),(59,59,'Back','Go back a step',49,49),(60,60,'Continue','Go forward a step',49,49),(61,61,'Employee Creation Wizard - Step 2','Step 2 of ECW',106,106),(71,71,'Back','Go back a step',61,61),(72,72,'Continue','Go forward a step',61,61),(73,73,'Employee Creation Wizard - Step 3','Step 3 of ECW',106,106),(84,84,'Back','Go back a step',73,73),(85,85,'Continue','Go forward a step',73,73),(86,86,'Employee Creation Wizard - Step 4','Step 4 of ECW',106,106),(94,94,'Back','Go back a step',86,86),(95,95,'Continue','Go forward a step',86,86),(96,96,'Employee Creation Wizard - Step 5','Step 5 of ECW',106,106),(99,99,'Back','Go back a step',96,96),(100,100,'Create Employee','Create the employee if all the data is valid',96,96),(106,106,'Employee Creation Wizard','Top level of ECW',17,17),(108,108,'Employee CV','Overall test for the employee CV form',18,18),(116,116,'Accept Criteria','Test the function of the accept criteria button',108,108),(118,118,'Bio Info','Test all the bio info',108,108),(127,127,'Bio Content','Test all the bio content',118,118),(128,128,'Accordion - CV','Test accordion CV',108,108),(129,129,'Accordion - CV - Career','Test accordion key: career',128,128),(130,130,'Grid - Career','Top level of grid',129,129),(131,131,'Acc Key - CV - Allowance','Test accordion key: allowance',128,128),(132,132,'Grid - Allowance','Top level of grid',131,131),(133,133,'Acc Key - CV - Salary','Test accordion key: salary',128,128),(134,134,'Grid - Salary','Top level of grid',133,133),(135,135,'Acc Key - Emp Schedule','Test accordion key: schedule',128,128),(136,136,'Grid - Emp Schedule','Top level of grid',135,135),(137,137,'Acc Key - Working Permit','Test accordion key: work permit',128,128),(138,138,'Grid - Work Permit','Top level of grid',137,136),(139,139,'Save','Test save button and modal form after',108,108),(140,140,'Form - Save','Save form',139,139),(141,141,'Form - Save - Header','Test the modal form header',140,140),(143,143,'Form - Save - Body','Test the modal form body',140,140),(144,144,'Form - Save - Footer','Test the modal form footer',140,140),(145,145,'Button Ok','Test the function of the Ok button',144,144),(146,146,'Button Cancel','Test the function of the save button',144,144),(147,147,'Employee Grid View - Grid','Test the grid.',148,148),(148,148,'Employee Grid View - Form','Test the form.',19,19),(9000,9000,'JSPanel','Test JS Panel',1,1),(9001,9001,'JSPanel Standard','Test JS Panel standard',9000,9000),(9002,9002,'JSPanel Header','Test JS Panel header',9000,9000),(9004,9004,'JS Content','Test JS Panel content',9000,9000),(9008,9008,'JSTitlebar','Test JS Panel title bar',9002,9002),(9009,9009,'JSControlbar','Test JS Panel controlbar',9002,9002),(9010,9010,'JSHeaderToolbarActive','Test JS Panel header toolbar',9002,9002),(9011,9011,'JSDropdown','Test JS Panel dropdown',9000,9000),(9018,9018,'DKGrid','Test Dakar grid',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_entity_test`
--

LOCK TABLES `test_suite_has_entity_test` WRITE;
/*!40000 ALTER TABLE `test_suite_has_entity_test` DISABLE KEYS */;
INSERT INTO `test_suite_has_entity_test` VALUES (1,1,1,2,2,2,2),(2,2,2,3,3,3,3),(4,3,3,5,5,5,5),(6,3,3,7,7,7,7),(7,3,3,8,8,8,8),(8,2,2,9,9,9,9),(9,9,9,10,10,10,10),(10,10,10,12,12,12,12),(11,10,10,14,14,14,14),(12,10,10,13,13,13,13),(13,9,9,15,15,15,15),(14,15,15,16,16,16,16),(15,15,15,17,17,17,17),(16,15,15,18,18,18,18),(17,15,15,19,19,19,19),(18,15,15,20,20,20,20),(19,15,15,21,21,21,21),(20,15,15,22,22,22,22),(21,15,15,23,23,23,23),(22,15,15,24,24,24,24),(23,15,15,25,25,25,25),(24,15,15,26,26,26,26),(25,15,15,27,27,27,27),(26,15,15,28,28,28,28),(27,9,9,29,29,29,29),(28,29,29,30,30,30,30),(29,30,30,31,31,31,31),(30,30,30,32,32,32,32),(31,30,30,33,33,33,33),(32,30,30,34,34,34,34),(33,30,30,35,35,35,35),(34,30,30,36,36,36,36),(35,30,30,37,37,37,37),(36,30,30,38,38,38,38),(37,30,30,39,39,39,39),(38,30,30,40,40,40,40),(39,30,30,41,41,41,41),(47,16,16,42,42,42,42),(48,42,42,43,43,43,43),(49,42,42,44,44,44,44),(50,42,42,45,45,45,45),(51,42,42,46,46,46,46),(52,42,42,47,47,47,47),(53,42,42,48,48,48,48),(113,17,17,106,106,106,106),(114,106,106,107,107,107,107),(115,106,106,49,49,49,49),(116,49,49,101,101,101,101),(117,49,49,50,50,50,50),(118,49,49,51,51,51,51),(119,49,49,52,52,52,52),(120,49,49,53,53,53,53),(121,49,49,54,54,54,54),(122,49,49,55,55,55,55),(123,49,49,56,56,56,56),(124,49,49,57,57,57,57),(125,49,49,58,58,58,58),(126,49,49,59,59,59,59),(127,49,49,60,60,60,60),(128,106,106,61,61,61,61),(129,61,61,102,102,102,102),(130,61,61,62,62,62,62),(131,61,61,63,63,63,63),(132,61,61,64,64,64,64),(133,61,61,65,65,65,65),(134,61,61,66,66,66,66),(135,61,61,67,67,67,67),(136,61,61,68,68,68,68),(137,61,61,69,69,69,69),(138,61,61,70,70,70,70),(139,61,61,71,71,71,71),(140,61,61,72,72,72,72),(141,106,106,73,73,73,73),(142,73,73,103,103,103,103),(143,73,73,74,74,74,74),(144,73,73,75,75,75,75),(145,73,73,76,76,76,76),(146,73,73,77,77,77,77),(147,73,73,78,78,78,78),(148,73,73,79,79,79,79),(149,73,73,80,80,80,80),(150,73,73,81,81,81,81),(151,73,73,82,82,82,82),(152,73,73,83,83,83,83),(153,73,73,84,84,84,84),(154,73,73,85,85,85,85),(155,106,106,86,86,86,86),(156,86,86,104,104,104,104),(157,86,86,87,87,87,87),(158,86,86,88,88,88,88),(159,86,86,89,89,89,89),(160,86,86,90,90,90,90),(161,86,86,91,91,91,91),(162,86,86,92,92,92,92),(163,86,86,93,93,93,93),(164,86,86,94,94,94,94),(165,86,86,95,95,95,95),(166,106,106,96,96,96,96),(167,96,96,105,105,105,105),(168,96,96,97,97,97,97),(169,96,96,98,98,98,98),(170,96,96,99,99,99,99),(171,96,96,100,100,100,100),(232,18,18,108,108,108,108),(233,108,108,109,109,109,109),(234,108,108,110,110,110,110),(235,108,108,111,111,111,111),(236,108,108,112,112,112,112),(237,108,108,113,113,113,113),(238,108,108,114,114,114,114),(239,108,108,115,115,115,115),(240,108,108,116,116,116,116),(241,116,116,117,117,117,117),(242,108,108,118,118,118,118),(243,118,118,120,120,120,120),(244,118,118,121,121,121,121),(245,118,118,122,122,122,122),(246,118,118,123,123,123,123),(247,118,118,124,124,124,124),(248,118,118,125,125,125,125),(249,118,118,126,126,126,126),(250,118,118,127,127,127,127),(251,108,108,128,128,128,128),(252,128,128,129,129,129,129),(253,129,129,130,130,130,130),(254,128,128,131,131,131,131),(255,131,131,132,132,132,132),(256,128,128,133,133,133,133),(257,133,133,134,134,134,134),(262,128,128,135,135,135,135),(263,135,135,136,136,136,136),(264,128,128,137,137,137,137),(265,137,137,138,138,138,138),(266,108,108,139,139,139,139),(267,139,139,140,140,140,140),(268,140,140,141,141,141,141),(269,141,141,142,142,142,142),(270,140,140,143,143,143,143),(271,140,140,144,144,144,144),(272,144,144,145,145,145,145),(273,144,144,146,146,146,146),(276,148,148,147,147,147,147),(277,19,19,148,148,148,148),(335,1,1,9000,9000,9000,9000),(336,9000,9000,9003,9003,9003,9003),(337,9000,9000,9005,9005,9005,9005),(338,9000,9000,9006,9006,9006,9006),(339,9000,9000,9001,9001,9001,9001),(340,9000,9000,9002,9002,9002,9002),(341,9002,9002,9007,9007,9007,9007),(342,9000,9000,9004,9004,9004,9004),(343,9002,9002,9008,9008,9008,9008),(344,9002,9002,9009,9009,9009,9009),(345,9009,9009,9015,9015,9015,9015),(346,9009,9009,9016,9016,9016,9016),(347,9009,9009,9017,9017,9017,9017),(348,9002,9002,9010,9010,9010,9010),(349,9010,9010,9014,9014,9014,9014),(350,9000,9000,9011,9011,9011,9011),(351,9011,9011,9012,9012,9012,9012),(352,9011,9011,9013,9013,9013,9013),(353,1,1,9018,9018,9018,9018);
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
INSERT INTO `test_suite_has_version` VALUES (42,1,1),(43,2,2),(44,3,3),(45,8,8),(46,9,9),(47,10,10),(48,13,13),(49,15,15),(50,16,16),(51,17,17),(52,18,18),(53,19,19),(54,20,20),(55,21,21),(56,22,22),(57,23,23),(58,24,24),(59,25,25),(60,26,26),(61,27,27),(62,28,28),(63,29,29),(64,30,30),(65,31,31),(66,32,32),(67,33,33),(68,34,34),(69,35,35),(70,36,36),(71,37,37),(72,38,38),(73,39,39),(74,40,40),(75,41,41),(123,42,42),(124,47,47),(125,48,48),(192,106,106),(193,49,49),(194,59,59),(195,60,60),(196,61,61),(197,71,71),(198,72,72),(199,73,73),(200,84,84),(201,85,85),(202,86,86),(203,94,94),(204,95,95),(205,96,96),(206,99,99),(207,100,100),(308,108,108),(309,116,116),(310,118,118),(311,127,127),(312,128,128),(313,129,129),(314,130,130),(315,131,131),(316,132,132),(317,133,133),(318,134,134),(319,135,135),(320,136,136),(321,137,137),(322,138,138),(323,139,139),(324,140,140),(325,141,141),(326,143,143),(327,144,144),(328,145,145),(329,146,146),(389,147,147),(390,148,148),(393,9000,9000),(394,9001,9001),(395,9002,9002),(396,9004,9004),(397,9008,9008),(398,9009,9009),(399,9010,9010),(400,9011,9011),(401,9018,9018);
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
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'Absence Entitlements (Grid View) - Card Title','','ENTITY',1,0,0),(2,'Dakar Web','','ENTITY',1,0,0),(3,'Login Screen','','ENTITY',1,0,0),(5,'User Name','','ENTITY',1,0,0),(7,'User Password','','ENTITY',1,0,0),(8,'Login Button','','ENTITY',1,0,0),(9,'Home Page','','ENTITY',1,0,0),(10,'Home Page Info Bar','','ENTITY',1,0,0),(11,'Dakar Logo','','ENTITY',1,0,0),(12,'Current Module Indicator','','ENTITY',1,0,0),(13,'Menu Toggle','','ENTITY',1,0,0),(14,'Current Company','','ENTITY',1,0,0),(15,'Home Page Top Right Nav Bar','','ENTITY',1,0,0),(16,'Authorisations','','ENTITY',1,0,0),(17,'Employee Creation Wizard','','ENTITY',1,0,0),(18,'Employee CV','','ENTITY',1,0,0),(19,'Employee Grid View','','ENTITY',1,0,0),(20,'Visual Reports','','ENTITY',1,0,0),(21,'Dakar Intelligence','','ENTITY',1,0,0),(22,'Organisation Chart','','ENTITY',1,0,0),(23,'My Company / Last Viewed','','ENTITY',1,0,0),(24,'All Notifications','','ENTITY',1,0,0),(25,'New Employments','','ENTITY',1,0,0),(26,'Terminations','','ENTITY',1,0,0),(27,'Quick Links','','ENTITY',1,0,0),(28,'User Avatar','','ENTITY',1,0,0),(29,'Main Menu','','ENTITY',1,0,0),(30,'Main Menu - Payroll','','ENTITY',1,0,0),(31,'Employee List','','ENTITY',1,0,0),(32,'Documents','','ENTITY',1,0,0),(33,'Employee Others','','ENTITY',1,0,0),(34,'Payroll','','ENTITY',1,0,0),(35,'Payroll Statistics','','ENTITY',1,0,0),(36,'Absence Statistics','','ENTITY',1,0,0),(37,'Reports','','ENTITY',1,0,0),(38,'Monthly Reports','','ENTITY',1,0,0),(39,'Yearly Reports','','ENTITY',1,0,0),(40,'Bulk Updates','','ENTITY',1,0,0),(41,'Settings','','ENTITY',1,0,0),(42,'Root','No existing version. New major version of Root','TEST_SUITE',1,0,0),(43,'Dakar Web','No existing version. New major version of Dakar Web','TEST_SUITE',1,0,0),(44,'Login Screen','No existing version. New major version of Login Screen','TEST_SUITE',1,0,0),(45,'Login Button','No existing version. New major version of Login Button','TEST_SUITE',1,0,0),(46,'Home Page','No existing version. New major version of Home Page','TEST_SUITE',1,0,0),(47,'Home Page Info Bar','No existing version. New major version of Home Page Info Bar','TEST_SUITE',1,0,0),(48,'Menu Toggle','No existing version. New major version of Menu Toggle','TEST_SUITE',1,0,0),(49,'Home Page Top Right Nav Bar','No existing version. New major version of Home Page Top Right Nav Bar','TEST_SUITE',1,0,0),(50,'Authorisations','No existing version. New major version of Authorisations','TEST_SUITE',1,0,0),(51,'Employee Creation Wizard','No existing version. New major version of Employee Creation Wizard','TEST_SUITE',1,0,0),(52,'Employee CV','No existing version. New major version of Employee CV','TEST_SUITE',1,0,0),(53,'Employee Grid View','No existing version. New major version of Employee Grid View','TEST_SUITE',1,0,0),(54,'Visual Reports','No existing version. New major version of Visual Reports','TEST_SUITE',1,0,0),(55,'Dakar Intelligence','No existing version. New major version of Dakar Intelligence','TEST_SUITE',1,0,0),(56,'Organisation Chart','No existing version. New major version of Organisation Chart','TEST_SUITE',1,0,0),(57,'My Company / Last Viewed','No existing version. New major version of My Company / Last Viewed','TEST_SUITE',1,0,0),(58,'All Notifications','No existing version. New major version of All Notifications','TEST_SUITE',1,0,0),(59,'New Employments','No existing version. New major version of New Employments','TEST_SUITE',1,0,0),(60,'Terminations','No existing version. New major version of Terminations','TEST_SUITE',1,0,0),(61,'Quick Links','No existing version. New major version of Quick Links','TEST_SUITE',1,0,0),(62,'User Avatar','No existing version. New major version of User Avatar','TEST_SUITE',1,0,0),(63,'Main Menu','No existing version. New major version of Main Menu','TEST_SUITE',1,0,0),(64,'Main Menu - Payroll','No existing version. New major version of Main Menu - Payroll','TEST_SUITE',1,0,0),(65,'Employee List','No existing version. New major version of Employee List','TEST_SUITE',1,0,0),(66,'Documents','No existing version. New major version of Documents','TEST_SUITE',1,0,0),(67,'Employee Others','No existing version. New major version of Employee Others','TEST_SUITE',1,0,0),(68,'Payroll','No existing version. New major version of Payroll','TEST_SUITE',1,0,0),(69,'Payroll Statistics','No existing version. New major version of Payroll Statistics','TEST_SUITE',1,0,0),(70,'Absence Statistics','No existing version. New major version of Absence Statistics','TEST_SUITE',1,0,0),(71,'Reports','No existing version. New major version of Reports','TEST_SUITE',1,0,0),(72,'Monthly Reports','No existing version. New major version of Monthly Reports','TEST_SUITE',1,0,0),(73,'Yearly Reports','No existing version. New major version of Yearly Reports','TEST_SUITE',1,0,0),(74,'Bulk Updates','No existing version. New major version of Bulk Updates','TEST_SUITE',1,0,0),(75,'Settings','No existing version. New major version of Settings','TEST_SUITE',1,0,0),(76,'Top Level of: Root','No existing version. New major version of Top Level of: Root','TEST',1,0,0),(77,'Top Level of: Dakar Web','No existing version. New major version of Top Level of: Dakar Web','TEST',1,0,0),(78,'Top Level of: Login Screen','No existing version. New major version of Top Level of: Login Screen','TEST',1,0,0),(80,'User Name','No existing version. New major version of User Name','TEST',1,0,0),(82,'User Password','No existing version. New major version of User Password','TEST',1,0,0),(83,'Top Level of: Login Button','No existing version. New major version of Top Level of: Login Button','TEST',1,0,0),(84,'Top Level of: Home Page','No existing version. New major version of Top Level of: Home Page','TEST',1,0,0),(85,'Top Level of: Home Page Info Bar','No existing version. New major version of Top Level of: Home Page Info Bar','TEST',1,0,0),(86,'Current Module Indicator','No existing version. New major version of Current Module Indicator','TEST',1,0,0),(87,'Current Company','No existing version. New major version of Current Company','TEST',1,0,0),(88,'Top Level of: Menu Toggle','No existing version. New major version of Top Level of: Menu Toggle','TEST',1,0,0),(89,'Top Level of: Home Page Top Right Nav Bar','No existing version. New major version of Top Level of: Home Page Top Right Nav Bar','TEST',1,0,0),(90,'Top Level of: Authorisations','No existing version. New major version of Top Level of: Authorisations','TEST',1,0,0),(91,'Top Level of: Employee Creation Wizard','No existing version. New major version of Top Level of: Employee Creation Wizard','TEST',1,0,0),(92,'Top Level of: Employee CV','No existing version. New major version of Top Level of: Employee CV','TEST',1,0,0),(93,'Top Level of: Employee Grid View','No existing version. New major version of Top Level of: Employee Grid View','TEST',1,0,0),(94,'Top Level of: Visual Reports','No existing version. New major version of Top Level of: Visual Reports','TEST',1,0,0),(95,'Top Level of: Dakar Intelligence','No existing version. New major version of Top Level of: Dakar Intelligence','TEST',1,0,0),(96,'Top Level of: Organisation Chart','No existing version. New major version of Top Level of: Organisation Chart','TEST',1,0,0),(97,'Top Level of: My Company / Last Viewed','No existing version. New major version of Top Level of: My Company / Last Viewed','TEST',1,0,0),(98,'Top Level of: All Notifications','No existing version. New major version of Top Level of: All Notifications','TEST',1,0,0),(99,'Top Level of: New Employments','No existing version. New major version of Top Level of: New Employments','TEST',1,0,0),(100,'Top Level of: Terminations','No existing version. New major version of Top Level of: Terminations','TEST',1,0,0),(101,'Top Level of: Quick Links','No existing version. New major version of Top Level of: Quick Links','TEST',1,0,0),(102,'Top Level of: User Avatar','No existing version. New major version of Top Level of: User Avatar','TEST',1,0,0),(103,'Top Level of: Main Menu','No existing version. New major version of Top Level of: Main Menu','TEST',1,0,0),(104,'Top Level of: Main Menu - Payroll','No existing version. New major version of Top Level of: Main Menu - Payroll','TEST',1,0,0),(105,'Top Level of: Employee List','No existing version. New major version of Top Level of: Employee List','TEST',1,0,0),(106,'Top Level of: Documents','No existing version. New major version of Top Level of: Documents','TEST',1,0,0),(107,'Top Level of: Employee Others','No existing version. New major version of Top Level of: Employee Others','TEST',1,0,0),(108,'Top Level of: Payroll','No existing version. New major version of Top Level of: Payroll','TEST',1,0,0),(109,'Top Level of: Payroll Statistics','No existing version. New major version of Top Level of: Payroll Statistics','TEST',1,0,0),(110,'Top Level of: Absence Statistics','No existing version. New major version of Top Level of: Absence Statistics','TEST',1,0,0),(111,'Top Level of: Reports','No existing version. New major version of Top Level of: Reports','TEST',1,0,0),(112,'Top Level of: Monthly Reports','No existing version. New major version of Top Level of: Monthly Reports','TEST',1,0,0),(113,'Top Level of: Yearly Reports','No existing version. New major version of Top Level of: Yearly Reports','TEST',1,0,0),(114,'Top Level of: Bulk Updates','No existing version. New major version of Top Level of: Bulk Updates','TEST',1,0,0),(115,'Top Level of: Settings','No existing version. New major version of Top Level of: Settings','TEST',1,0,0),(116,'Authorisations Form','','ENTITY',1,0,0),(117,'Company','','ENTITY',1,0,0),(118,'Company Combo','','ENTITY',1,0,0),(119,'Grouping View ','','ENTITY',1,0,0),(120,'Grouping View Combo','','ENTITY',1,0,0),(121,'Accept Criteria','','ENTITY',1,0,0),(122,'Authorisations Grid','','ENTITY',1,0,0),(123,'Authorisations Form','No existing version. New major version of Authorisations Form','TEST_SUITE',1,0,0),(124,'Accept Criteria','No existing version. New major version of Accept Criteria','TEST_SUITE',1,0,0),(125,'Authorisations Grid','No existing version. New major version of Authorisations Grid','TEST_SUITE',1,0,0),(126,'Top Level of: Authorisations Form','No existing version. New major version of Top Level of: Authorisations Form','TEST',1,0,0),(127,'Company','No existing version. New major version of Company','TEST',1,0,0),(128,'Company Combo','No existing version. New major version of Company Combo','TEST',1,0,0),(129,'Grouping View ','No existing version. New major version of Grouping View ','TEST',1,0,0),(130,'Grouping View Combo','No existing version. New major version of Grouping View Combo','TEST',1,0,0),(131,'Top Level of: Accept Criteria','No existing version. New major version of Top Level of: Accept Criteria','TEST',1,0,0),(132,'Top Level of: Authorisations Grid','No existing version. New major version of Top Level of: Authorisations Grid','TEST',1,0,0),(133,'Employee Creation Wizard - Step 1','','ENTITY',1,0,0),(134,'Name','','ENTITY',1,0,0),(135,'Surname','','ENTITY',1,0,0),(136,'Identity Card Number','','ENTITY',1,0,0),(137,'Employee Code','','ENTITY',1,0,0),(138,'Address','','ENTITY',1,0,0),(139,'Street','','ENTITY',1,0,0),(140,'Post Code','','ENTITY',1,0,0),(141,'Select A Town','','ENTITY',1,0,0),(142,'Select A Country','','ENTITY',1,0,0),(143,'Back','','ENTITY',1,0,0),(144,'Continue','','ENTITY',1,0,0),(145,'Employee Creation Wizard - Step 2','','ENTITY',1,0,0),(146,'Select A Gender','','ENTITY',1,0,0),(147,'Date Of Birth','','ENTITY',1,0,0),(148,'Date Of Employment','','ENTITY',1,0,0),(149,'Tax Number','','ENTITY',1,0,0),(150,'NI Number','','ENTITY',1,0,0),(151,'Select A Bank','','ENTITY',1,0,0),(152,'IBAN Number','','ENTITY',1,0,0),(153,'Email Address','','ENTITY',1,0,0),(154,'Mobile Number','','ENTITY',1,0,0),(155,'Back','','ENTITY',1,0,0),(156,'Continue','','ENTITY',1,0,0),(157,'Employee Creation Wizard - Step 3','','ENTITY',1,0,0),(158,'Select A Tax Status','','ENTITY',1,0,0),(159,'Select An Employment Type','','ENTITY',1,0,0),(160,'Select Company','','ENTITY',1,0,0),(161,'Select A Paygroup','','ENTITY',1,0,0),(162,'Select A Department','','ENTITY',1,0,0),(163,'Select a Schedule','','ENTITY',1,0,0),(164,'Full or Part Timer ?','','ENTITY',1,0,0),(165,'Special Part Timer','','ENTITY',1,0,0),(166,'Select a Grade','','ENTITY',1,0,0),(167,'Select a Cost Center','','ENTITY',1,0,0),(168,'Back','','ENTITY',1,0,0),(169,'Continue','','ENTITY',1,0,0),(170,'Employee Creation Wizard - Step 4','','ENTITY',1,0,0),(171,'Taxable Allowance (Permenant)','','ENTITY',1,0,0),(172,'Allowance Amount - Permanent','','ENTITY',1,0,0),(173,'Taxable Allowance 2 (Permenant)','','ENTITY',1,0,0),(174,'Allowance Amount - Permanent','','ENTITY',1,0,0),(175,'Non Taxable Allowance 1 (Permenant)','','ENTITY',1,0,0),(176,'Allowance Amount - Permanent','','ENTITY',1,0,0),(177,'Non Taxable Allowance 2 (Permenant)','','ENTITY',1,0,0),(178,'Back','','ENTITY',1,0,0),(179,'Continue','','ENTITY',1,0,0),(180,'Employee Creation Wizard - Step 5','','ENTITY',1,0,0),(181,'Annual Salary','','ENTITY',1,0,0),(182,'Hourly Rate','','ENTITY',1,0,0),(183,'Back','','ENTITY',1,0,0),(184,'Create Employee','','ENTITY',1,0,0),(185,'Heading ECW Step 1','','ENTITY',1,0,0),(186,'Heading ECW Step 2','','ENTITY',1,0,0),(187,'Heading ECW Step 3','','ENTITY',1,0,0),(188,'Heading ECW Step 4','','ENTITY',1,0,0),(189,'Heading ECW Step 5','','ENTITY',1,0,0),(190,'Employee Creation Wizard','','ENTITY',1,0,0),(191,'Employee Creation Wizard - Title','','ENTITY',1,0,0),(192,'Employee Creation Wizard','No existing version. New major version of Employee Creation Wizard','TEST_SUITE',1,0,0),(193,'Employee Creation Wizard - Step 1','No existing version. New major version of Employee Creation Wizard - Step 1','TEST_SUITE',1,0,0),(194,'Back','No existing version. New major version of Back','TEST_SUITE',1,0,0),(195,'Continue','No existing version. New major version of Continue','TEST_SUITE',1,0,0),(196,'Employee Creation Wizard - Step 2','No existing version. New major version of Employee Creation Wizard - Step 2','TEST_SUITE',1,0,0),(197,'Back','No existing version. New major version of Back','TEST_SUITE',1,0,0),(198,'Continue','No existing version. New major version of Continue','TEST_SUITE',1,0,0),(199,'Employee Creation Wizard - Step 3','No existing version. New major version of Employee Creation Wizard - Step 3','TEST_SUITE',1,0,0),(200,'Back','No existing version. New major version of Back','TEST_SUITE',1,0,0),(201,'Continue','No existing version. New major version of Continue','TEST_SUITE',1,0,0),(202,'Employee Creation Wizard - Step 4','No existing version. New major version of Employee Creation Wizard - Step 4','TEST_SUITE',1,0,0),(203,'Back','No existing version. New major version of Back','TEST_SUITE',1,0,0),(204,'Continue','No existing version. New major version of Continue','TEST_SUITE',1,0,0),(205,'Employee Creation Wizard - Step 5','No existing version. New major version of Employee Creation Wizard - Step 5','TEST_SUITE',1,0,0),(206,'Back','No existing version. New major version of Back','TEST_SUITE',1,0,0),(207,'Create Employee','No existing version. New major version of Create Employee','TEST_SUITE',1,0,0),(208,'Top Level of: Employee Creation Wizard','No existing version. New major version of Top Level of: Employee Creation Wizard','TEST',1,0,0),(209,'Employee Creation Wizard - Title','No existing version. New major version of Employee Creation Wizard - Title','TEST',1,0,0),(210,'Top Level of: Employee Creation Wizard - Step 1','No existing version. New major version of Top Level of: Employee Creation Wizard - Step 1','TEST',1,0,0),(211,'Heading ECW Step 1','No existing version. New major version of Heading ECW Step 1','TEST',1,0,0),(212,'Name','No existing version. New major version of Name','TEST',1,0,0),(213,'Surname','No existing version. New major version of Surname','TEST',1,0,0),(214,'Identity Card Number','No existing version. New major version of Identity Card Number','TEST',1,0,0),(215,'Employee Code','No existing version. New major version of Employee Code','TEST',1,0,0),(216,'Address','No existing version. New major version of Address','TEST',1,0,0),(217,'Street','No existing version. New major version of Street','TEST',1,0,0),(218,'Post Code','No existing version. New major version of Post Code','TEST',1,0,0),(219,'Select A Town','No existing version. New major version of Select A Town','TEST',1,0,0),(220,'Select A Country','No existing version. New major version of Select A Country','TEST',1,0,0),(221,'Top Level of: Back','No existing version. New major version of Top Level of: Back','TEST',1,0,0),(222,'Top Level of: Continue','No existing version. New major version of Top Level of: Continue','TEST',1,0,0),(223,'Top Level of: Employee Creation Wizard - Step 2','No existing version. New major version of Top Level of: Employee Creation Wizard - Step 2','TEST',1,0,0),(224,'Heading ECW Step 2','No existing version. New major version of Heading ECW Step 2','TEST',1,0,0),(225,'Select A Gender','No existing version. New major version of Select A Gender','TEST',1,0,0),(226,'Date Of Birth','No existing version. New major version of Date Of Birth','TEST',1,0,0),(227,'Date Of Employment','No existing version. New major version of Date Of Employment','TEST',1,0,0),(228,'Tax Number','No existing version. New major version of Tax Number','TEST',1,0,0),(229,'NI Number','No existing version. New major version of NI Number','TEST',1,0,0),(230,'Select A Bank','No existing version. New major version of Select A Bank','TEST',1,0,0),(231,'IBAN Number','No existing version. New major version of IBAN Number','TEST',1,0,0),(232,'Email Address','No existing version. New major version of Email Address','TEST',1,0,0),(233,'Mobile Number','No existing version. New major version of Mobile Number','TEST',1,0,0),(234,'Top Level of: Back','No existing version. New major version of Top Level of: Back','TEST',1,0,0),(235,'Top Level of: Continue','No existing version. New major version of Top Level of: Continue','TEST',1,0,0),(236,'Top Level of: Employee Creation Wizard - Step 3','No existing version. New major version of Top Level of: Employee Creation Wizard - Step 3','TEST',1,0,0),(237,'Heading ECW Step 3','No existing version. New major version of Heading ECW Step 3','TEST',1,0,0),(238,'Select A Tax Status','No existing version. New major version of Select A Tax Status','TEST',1,0,0),(239,'Select An Employment Type','No existing version. New major version of Select An Employment Type','TEST',1,0,0),(240,'Select Company','No existing version. New major version of Select Company','TEST',1,0,0),(241,'Select A Paygroup','No existing version. New major version of Select A Paygroup','TEST',1,0,0),(242,'Select A Department','No existing version. New major version of Select A Department','TEST',1,0,0),(243,'Select a Schedule','No existing version. New major version of Select a Schedule','TEST',1,0,0),(244,'Full or Part Timer ?','No existing version. New major version of Full or Part Timer ?','TEST',1,0,0),(245,'Special Part Timer','No existing version. New major version of Special Part Timer','TEST',1,0,0),(246,'Select a Grade','No existing version. New major version of Select a Grade','TEST',1,0,0),(247,'Select a Cost Center','No existing version. New major version of Select a Cost Center','TEST',1,0,0),(248,'Top Level of: Back','No existing version. New major version of Top Level of: Back','TEST',1,0,0),(249,'Top Level of: Continue','No existing version. New major version of Top Level of: Continue','TEST',1,0,0),(250,'Top Level of: Employee Creation Wizard - Step 4','No existing version. New major version of Top Level of: Employee Creation Wizard - Step 4','TEST',1,0,0),(251,'Heading ECW Step 4','No existing version. New major version of Heading ECW Step 4','TEST',1,0,0),(252,'Taxable Allowance 1 (Permenant)','No existing version. New major version of Taxable Allowance 1 (Permenant)','TEST',1,0,0),(253,'Allowance Amount - Permanent','No existing version. New major version of Allowance Amount - Permanent','TEST',1,0,0),(254,'Taxable Allowance 2 (Permenant)','No existing version. New major version of Taxable Allowance 2 (Permenant)','TEST',1,0,0),(255,'Allowance Amount - Permanent','No existing version. New major version of Allowance Amount - Permanent','TEST',1,0,0),(256,'Non Taxable Allowance 1 (Permenant)','No existing version. New major version of Non Taxable Allowance 1 (Permenant)','TEST',1,0,0),(257,'Allowance Amount - Permanent','No existing version. New major version of Allowance Amount - Permanent','TEST',1,0,0),(258,'Non Taxable Allowance 2 (Permenant)','No existing version. New major version of Non Taxable Allowance 2 (Permenant)','TEST',1,0,0),(259,'Top Level of: Back','No existing version. New major version of Top Level of: Back','TEST',1,0,0),(260,'Top Level of: Continue','No existing version. New major version of Top Level of: Continue','TEST',1,0,0),(261,'Top Level of: Employee Creation Wizard - Step 5','No existing version. New major version of Top Level of: Employee Creation Wizard - Step 5','TEST',1,0,0),(262,'Heading ECW Step 5','No existing version. New major version of Heading ECW Step 5','TEST',1,0,0),(263,'Annual Salary','No existing version. New major version of Annual Salary','TEST',1,0,0),(264,'Hourly Rate','No existing version. New major version of Hourly Rate','TEST',1,0,0),(265,'Top Level of: Back','No existing version. New major version of Top Level of: Back','TEST',1,0,0),(266,'Top Level of: Create Employee','No existing version. New major version of Top Level of: Create Employee','TEST',1,0,0),(267,'Employee CV','','ENTITY',1,0,0),(268,'Employee CV - Title','','ENTITY',1,0,0),(269,'Company','','ENTITY',1,0,0),(270,'Company List','','ENTITY',1,0,0),(271,'Paygroup - Label','','ENTITY',1,0,0),(272,'Paygroup - List','','ENTITY',1,0,0),(273,'Employee - Label','','ENTITY',1,0,0),(274,'Employee - List','','ENTITY',1,0,0),(275,'Accept Criteria','','ENTITY',1,0,0),(276,'Accept Criteria - Text','','ENTITY',1,0,0),(277,'Bio Info','','ENTITY',1,0,0),(278,'Bio Info - Image','','ENTITY',1,0,0),(279,'Employee Name','','ENTITY',1,0,0),(280,'Employee Name With Salutation','','ENTITY',1,0,0),(281,'Employee Company','','ENTITY',1,0,0),(282,'Employee Birthday','','ENTITY',1,0,0),(283,'User FaFa','','ENTITY',1,0,0),(284,'Company FaFa','','ENTITY',1,0,0),(285,'Birthday FaFa','','ENTITY',1,0,0),(286,'Bio Content','','ENTITY',1,0,0),(287,'Accordion - CV','','ENTITY',1,0,0),(288,'Accordion - CV - Career','','ENTITY',1,0,0),(289,'Grid - Career','','ENTITY',1,0,0),(290,'Acc Key - CV - Allowance','','ENTITY',1,0,0),(291,'Grid - Allowance','','ENTITY',1,0,0),(292,'Acc Key - CV - Salary','','ENTITY',1,0,0),(293,'Grid - Salary','','ENTITY',1,0,0),(294,'Acc Key - Emp Schedule','','ENTITY',1,0,0),(296,'Grid - Emp Schedule','','ENTITY',1,0,0),(297,'Grid - Emp Schedule','','ENTITY',1,0,0),(298,'Acc Key - Working Permit','','ENTITY',1,0,0),(299,'Grid - Work Permit','','ENTITY',1,0,0),(300,'Save','','ENTITY',1,0,0),(301,'Form - Save','','ENTITY',1,0,0),(302,'Form - Save - Header','','ENTITY',1,0,0),(303,'Form - Save - Title','','ENTITY',1,0,0),(304,'Form - Save - Body','','ENTITY',1,0,0),(305,'Form - Save - Footer','','ENTITY',1,0,0),(306,'Button Ok','','ENTITY',1,0,0),(307,'Button Cancel','','ENTITY',1,0,0),(308,'Employee CV','No existing version. New major version of Employee CV','TEST_SUITE',1,0,0),(309,'Accept Criteria','No existing version. New major version of Accept Criteria','TEST_SUITE',1,0,0),(310,'Bio Info','No existing version. New major version of Bio Info','TEST_SUITE',1,0,0),(311,'Bio Content','No existing version. New major version of Bio Content','TEST_SUITE',1,0,0),(312,'Accordion - CV','No existing version. New major version of Accordion - CV','TEST_SUITE',1,0,0),(313,'Accordion - CV - Career','No existing version. New major version of Accordion - CV - Career','TEST_SUITE',1,0,0),(314,'Grid - Career','No existing version. New major version of Grid - Career','TEST_SUITE',1,0,0),(315,'Acc Key - CV - Allowance','No existing version. New major version of Acc Key - CV - Allowance','TEST_SUITE',1,0,0),(316,'Grid - Allowance','No existing version. New major version of Grid - Allowance','TEST_SUITE',1,0,0),(317,'Acc Key - CV - Salary','No existing version. New major version of Acc Key - CV - Salary','TEST_SUITE',1,0,0),(318,'Grid - Salary','No existing version. New major version of Grid - Salary','TEST_SUITE',1,0,0),(319,'Acc Key - Emp Schedule','No existing version. New major version of Acc Key - Emp Schedule','TEST_SUITE',1,0,0),(320,'Grid - Emp Schedule','No existing version. New major version of Grid - Emp Schedule','TEST_SUITE',1,0,0),(321,'Acc Key - Working Permit','No existing version. New major version of Acc Key - Working Permit','TEST_SUITE',1,0,0),(322,'Grid - Work Permit','No existing version. New major version of Grid - Work Permit','TEST_SUITE',1,0,0),(323,'Save','No existing version. New major version of Save','TEST_SUITE',1,0,0),(324,'Form - Save','No existing version. New major version of Form - Save','TEST_SUITE',1,0,0),(325,'Form - Save - Header','No existing version. New major version of Form - Save - Header','TEST_SUITE',1,0,0),(326,'Form - Save - Body','No existing version. New major version of Form - Save - Body','TEST_SUITE',1,0,0),(327,'Form - Save - Footer','No existing version. New major version of Form - Save - Footer','TEST_SUITE',1,0,0),(328,'Button Ok','No existing version. New major version of Button Ok','TEST_SUITE',1,0,0),(329,'Button Cancel','No existing version. New major version of Button Cancel','TEST_SUITE',1,0,0),(330,'Top Level of: Employee CV','No existing version. New major version of Top Level of: Employee CV','TEST',1,0,0),(331,'Employee CV - Title','No existing version. New major version of Employee CV - Title','TEST',1,0,0),(332,'Company - Label','No existing version. New major version of Company - Label','TEST',1,0,0),(333,'Company - List','No existing version. New major version of Company - List','TEST',1,0,0),(334,'Paygroup - Label','No existing version. New major version of Paygroup - Label','TEST',1,0,0),(335,'Paygroup - List','No existing version. New major version of Paygroup - List','TEST',1,0,0),(336,'Employee - Label','No existing version. New major version of Employee - Label','TEST',1,0,0),(337,'Employee - List','No existing version. New major version of Employee - List','TEST',1,0,0),(338,'Top Level of: Accept Criteria','No existing version. New major version of Top Level of: Accept Criteria','TEST',1,0,0),(339,'Accept Criteria - Text','No existing version. New major version of Accept Criteria - Text','TEST',1,0,0),(340,'Top Level of: Bio Info','No existing version. New major version of Top Level of: Bio Info','TEST',1,0,0),(341,'Employee Name','No existing version. New major version of Employee Name','TEST',1,0,0),(342,'Employee Name With Salutation','No existing version. New major version of Employee Name With Salutation','TEST',1,0,0),(343,'Employee Company','No existing version. New major version of Employee Company','TEST',1,0,0),(344,'Employee Birthday','No existing version. New major version of Employee Birthday','TEST',1,0,0),(345,'User FaFa','No existing version. New major version of User FaFa','TEST',1,0,0),(346,'Company FaFa','No existing version. New major version of Company FaFa','TEST',1,0,0),(347,'Birthday FaFa','No existing version. New major version of Birthday FaFa','TEST',1,0,0),(348,'Top Level of: Bio Content','No existing version. New major version of Top Level of: Bio Content','TEST',1,0,0),(349,'Top Level of: Accordion - CV','No existing version. New major version of Top Level of: Accordion - CV','TEST',1,0,0),(350,'Top Level of: Accordion - CV - Career','No existing version. New major version of Top Level of: Accordion - CV - Career','TEST',1,0,0),(351,'Top Level of: Grid - Career','No existing version. New major version of Top Level of: Grid - Career','TEST',1,0,0),(352,'Top Level of: Acc Key - CV - Allowance','No existing version. New major version of Top Level of: Acc Key - CV - Allowance','TEST',1,0,0),(353,'Top Level of: Grid - Allowance','No existing version. New major version of Top Level of: Grid - Allowance','TEST',1,0,0),(354,'Top Level of: Acc Key - CV - Salary','No existing version. New major version of Top Level of: Acc Key - CV - Salary','TEST',1,0,0),(355,'Top Level of: Grid - Salary','No existing version. New major version of Top Level of: Grid - Salary','TEST',1,0,0),(356,'Top Level of: Acc Key - Emp Schedule','No existing version. New major version of Top Level of: Acc Key - Emp Schedule','TEST',1,0,0),(357,'Top Level of: Grid - Emp Schedule','No existing version. New major version of Top Level of: Grid - Emp Schedule','TEST',1,0,0),(358,'Top Level of: Acc Key - Working Permit','No existing version. New major version of Top Level of: Acc Key - Working Permit','TEST',1,0,0),(359,'Top Level of: Grid - Work Permit','No existing version. New major version of Top Level of: Grid - Work Permit','TEST',1,0,0),(360,'Top Level of: Save','No existing version. New major version of Top Level of: Save','TEST',1,0,0),(361,'Top Level of: Form - Save','No existing version. New major version of Top Level of: Form - Save','TEST',1,0,0),(362,'Top Level of: Form - Save - Header','No existing version. New major version of Top Level of: Form - Save - Header','TEST',1,0,0),(363,'Form - Save - Title','No existing version. New major version of Form - Save - Title','TEST',1,0,0),(364,'Top Level of: Form - Save - Body','No existing version. New major version of Top Level of: Form - Save - Body','TEST',1,0,0),(365,'Top Level of: Form - Save - Footer','No existing version. New major version of Top Level of: Form - Save - Footer','TEST',1,0,0),(366,'Top Level of: Button Ok','No existing version. New major version of Top Level of: Button Ok','TEST',1,0,0),(367,'Top Level of: Button Cancel','No existing version. New major version of Top Level of: Button Cancel','TEST',1,0,0),(368,'Employee Grid View - Grid','','ENTITY',1,0,0),(369,'Employee Grid View - Form','','ENTITY',1,0,0),(370,'JSPanel','','ENTITY',1,0,0),(371,'JSPanel Standard','','ENTITY',1,0,0),(372,'JSPanel Header','','ENTITY',1,0,0),(373,'JS Footer','','ENTITY',1,0,0),(374,'JS Content','','ENTITY',1,0,0),(375,'JSMinBox','','ENTITY',1,0,0),(376,'JSResizeit','','ENTITY',1,0,0),(377,'JSHeaderLogo','','ENTITY',1,0,0),(378,'JSTitlebar','','ENTITY',1,0,0),(379,'JSControlbar','','ENTITY',1,0,0),(380,'JSHeaderToolbarActive','','ENTITY',1,0,0),(381,'JSDropdown','','ENTITY',1,0,0),(382,'JSDropdownToggle','','ENTITY',1,0,0),(383,'JSDropdownMenu','','ENTITY',1,0,0),(384,'JSPanelSwitchRotate','','ENTITY',1,0,0),(385,'JSPanelBtn','','ENTITY',1,0,0),(386,'JSPanelBtnNormalise','','ENTITY',1,0,0),(387,'JSPanelBtnExpand','','ENTITY',1,0,0),(388,'DKGrid','','ENTITY',1,0,0),(389,'Employee Grid View - Grid','No existing version. New major version of Employee Grid View - Grid','TEST_SUITE',1,0,0),(390,'Employee Grid View - Form','No existing version. New major version of Employee Grid View - Form','TEST_SUITE',1,0,0),(391,'Top Level of: Employee Grid View - Grid','No existing version. New major version of Top Level of: Employee Grid View - Grid','TEST',1,0,0),(392,'Top Level of: Employee Grid View - Form','No existing version. New major version of Top Level of: Employee Grid View - Form','TEST',1,0,0),(393,'JSPanel','No existing version. New major version of JSPanel','TEST_SUITE',1,0,0),(394,'JSPanel Standard','No existing version. New major version of JSPanel Standard','TEST_SUITE',1,0,0),(395,'JSPanel Header','No existing version. New major version of JSPanel Header','TEST_SUITE',1,0,0),(396,'JS Content','No existing version. New major version of JS Content','TEST_SUITE',1,0,0),(397,'JSTitlebar','No existing version. New major version of JSTitlebar','TEST_SUITE',1,0,0),(398,'JSControlbar','No existing version. New major version of JSControlbar','TEST_SUITE',1,0,0),(399,'JSHeaderToolbarActive','No existing version. New major version of JSHeaderToolbarActive','TEST_SUITE',1,0,0),(400,'JSDropdown','No existing version. New major version of JSDropdown','TEST_SUITE',1,0,0),(401,'DKGrid','No existing version. New major version of DKGrid','TEST_SUITE',1,0,0),(402,'Top Level of: JSPanel','No existing version. New major version of Top Level of: JSPanel','TEST',1,0,0),(403,'JS Footer','No existing version. New major version of JS Footer','TEST',1,0,0),(404,'JSMinBox','No existing version. New major version of JSMinBox','TEST',1,0,0),(405,'JSResizeit','No existing version. New major version of JSResizeit','TEST',1,0,0),(406,'Top Level of: JSPanel Standard','No existing version. New major version of Top Level of: JSPanel Standard','TEST',1,0,0),(407,'Top Level of: JSPanel Header','No existing version. New major version of Top Level of: JSPanel Header','TEST',1,0,0),(408,'JSHeaderLogo','No existing version. New major version of JSHeaderLogo','TEST',1,0,0),(409,'Top Level of: JS Content','No existing version. New major version of Top Level of: JS Content','TEST',1,0,0),(410,'Top Level of: JSTitlebar','No existing version. New major version of Top Level of: JSTitlebar','TEST',1,0,0),(411,'Top Level of: JSControlbar','No existing version. New major version of Top Level of: JSControlbar','TEST',1,0,0),(412,'JSPanelBtn','No existing version. New major version of JSPanelBtn','TEST',1,0,0),(413,'JSPanelBtnNormalise','No existing version. New major version of JSPanelBtnNormalise','TEST',1,0,0),(414,'JSPanelBtnExpand','No existing version. New major version of JSPanelBtnExpand','TEST',1,0,0),(415,'Top Level of: JSHeaderToolbarActive','No existing version. New major version of Top Level of: JSHeaderToolbarActive','TEST',1,0,0),(416,'JSPanelSwitchRotate','No existing version. New major version of JSPanelSwitchRotate','TEST',1,0,0),(417,'Top Level of: JSDropdown','No existing version. New major version of Top Level of: JSDropdown','TEST',1,0,0),(418,'JSDropdownToggle','No existing version. New major version of JSDropdownToggle','TEST',1,0,0),(419,'JSDropdownMenu','No existing version. New major version of JSDropdownMenu','TEST',1,0,0),(420,'Top Level of: DKGrid','No existing version. New major version of Top Level of: DKGrid','TEST',1,0,0),(421,'Visual Reports - Form','','ENTITY',1,0,0),(422,'Visual Reports - Form','','ENTITY',1,0,0),(423,'Visual Reports - Form','','ENTITY',1,0,0),(424,'Dakar Intelligence - Form','','ENTITY',1,0,0),(425,'Employee Reports','','ENTITY',1,0,0),(433,'Employee Reports','','ENTITY',1,0,0),(437,'Container','','ENTITY',1,0,0),(438,'Card','','ENTITY',1,0,0),(439,'Card Group','','ENTITY',1,0,0),(440,'Card Element','','ENTITY',1,0,0),(441,'Card Header','','ENTITY',1,0,0),(442,'Card Body','','ENTITY',1,0,0),(443,'Card Title','','ENTITY',1,0,0),(444,'Form','','ENTITY',1,0,0),(445,'Form','','ENTITY',1,0,0),(446,'Employee Reports','','ENTITY',1,0,0),(452,'Employee Reports - Card Group','','ENTITY',1,0,0),(453,'Employee Reports - Employee Basic Details','','ENTITY',1,0,0),(454,'Employee Reports - Employee Basic Details Header','','ENTITY',1,0,0),(455,'Employee Reports - Employee Basic Details Body','','ENTITY',1,0,0),(456,'Employee Reports - Employee Basic Details Title','','ENTITY',1,0,0),(457,'Employee Reports - Employee Basic Details (Grid View)','','ENTITY',1,0,0),(458,'Employee Reports - Employee Basic Details (Grid View) - Card Header TODO','','ENTITY',1,0,0),(459,'Employee Reports - Employee Basic Details (Grid View) - Card Body TODO','','ENTITY',1,0,0),(460,'Employee Reports - Employee Basic Details (Grid View) - Card Title TODO','','ENTITY',1,0,0),(461,'Payroll Reports - Card Group TODO','','ENTITY',1,0,0),(463,'Payroll Reports - Card Element TODO - Card Body TODO','','ENTITY',1,0,0),(464,'Payroll Reports - Card Element TODO - Card Title TODO','','ENTITY',1,0,0),(465,'Payroll Reports - Card Element TODO','','ENTITY',1,0,0),(466,'Payroll Reports','','ENTITY',1,0,0),(467,'ENTER ENTITY NAME - Card Header TODO','','ENTITY',1,0,0),(468,'ENTER ENTITY NAME - Card Body TODO','','ENTITY',1,0,0),(469,'ENTER ENTITY NAME - Card Title TODO','','ENTITY',1,0,0),(470,'Payroll Reports - Payroll Statistics - Extras Breakdown Report','','ENTITY',1,0,0),(471,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Header TODO','','ENTITY',1,0,0),(472,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Body TODO','','ENTITY',1,0,0),(473,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Title TODO','','ENTITY',1,0,0),(474,'Payroll Reports - Payroll - Extras Breakdown by Cost Center','','ENTITY',1,0,0),(475,'Payroll Reports - Payroll - Allowances Breakdown - Card Header','','ENTITY',1,0,0),(476,'Payroll Reports - Payroll - Allowances Breakdown - Card Body','','ENTITY',1,0,0),(477,'Payroll Reports - Payroll - Allowances Breakdown - Card Title','','ENTITY',1,0,0),(478,'Payroll Reports - Payroll - Allowances Breakdown','','ENTITY',1,0,0),(479,'Payroll Reports - Payroll - Bank Breakdown Report - Card Header','','ENTITY',1,0,0),(480,'Payroll Reports - Payroll - Bank Breakdown Report - Card Body','','ENTITY',1,0,0),(481,'Payroll Reports - Payroll - Bank Breakdown Report - Card Title','','ENTITY',1,0,0),(482,'Payroll Reports - Payroll - Bank Breakdown Report','','ENTITY',1,0,0),(483,'Payroll Reports - Payroll - Bank Breakdown Report - Card Header','','ENTITY',1,0,0),(484,'Payroll Reports - Payroll - Bank Breakdown Report - Card Body','','ENTITY',1,0,0),(485,'Payroll Reports - Payroll - Bank Breakdown Report - Card Title','','ENTITY',1,0,0),(486,'Payroll Reports - Payroll - Bank Breakdown Report','','ENTITY',1,0,0),(487,'Payroll Changes - Card Group','','ENTITY',1,0,0),(488,'Payroll Changes - Card Element','','ENTITY',1,0,0),(489,'Payroll Changes - Card Header','','ENTITY',1,0,0),(490,'Payroll Changes - Card Body','','ENTITY',1,0,0),(491,'Payroll Changes - Card Title','','ENTITY',1,0,0),(492,'Payroll Changes','','ENTITY',1,0,0),(493,'2019 Payroll Changes - Card Element - Card Header','','ENTITY',1,0,0),(494,'2019 Payroll Changes - Card Element - Card Body','','ENTITY',1,0,0),(495,'2019 Payroll Changes - Card Element - Card Title','','ENTITY',1,0,0),(496,'2019 Payroll Changes - Card Element','','ENTITY',1,0,0),(497,'Absences - Card Group','','ENTITY',1,0,0),(498,'Absences - Card Element','','ENTITY',1,0,0),(499,'Absences - Card Header','','ENTITY',1,0,0),(500,'Absences - Card Body','','ENTITY',1,0,0),(501,'Absences - Card Title','','ENTITY',1,0,0),(502,'Absences','','ENTITY',1,0,0),(503,'Absence Entitlements - Card Header','','ENTITY',1,0,0),(504,'Absence Entitlements - Card Body','','ENTITY',1,0,0),(505,'Absence Entitlements - Card Title','','ENTITY',1,0,0),(506,'Absence Entitlements','','ENTITY',1,0,0),(507,'Absence Entitlements (Grid View) - Card Header','','ENTITY',1,0,0),(508,'Absence Entitlements (Grid View) - Card Body','','ENTITY',1,0,0),(509,'Absence Entitlements (Grid View) - Card Title','','ENTITY',1,0,0),(510,'Absence Entitlements (Grid View)','','ENTITY',1,0,0),(511,'ENTER ENTITY NAME','','ENTITY',1,0,0),(512,'FaFa','','ENTITY',1,0,0),(513,'Element Header','','ENTITY',1,0,0),(516,'Employee Reports - Card Header - FaFa','','ENTITY',1,0,0),(517,'Employee Reports - Card Header - Text Element','','ENTITY',1,0,0),(518,'Employee Reports - Card Header','','ENTITY',1,0,0),(519,'Employee Reports - Employee Basic Details Header - FaFa','','ENTITY',1,0,0),(520,'Employee Reports - Employee Basic Details (Grid View) - Card Header - FaFa','','ENTITY',1,0,0),(521,'Payroll Reports - Card Header - FaFa','','ENTITY',1,0,0),(522,'Payroll Reports - Card Header - Text Element','','ENTITY',1,0,0),(523,'Payroll Reports - Card Header','','ENTITY',1,0,0),(524,'Payroll Reports - Element Header - FaFa','','ENTITY',1,0,0),(525,'Payroll Reports - Element Header','','ENTITY',1,0,0),(527,'Payroll Statistics - Extras Breakdown Report Header - FaFa','','ENTITY',1,0,0),(528,'Payroll Reports - Payroll - Extras Breakdown by Cost Center - Card Header - FaFa','','ENTITY',1,0,0),(529,'Payroll Reports - Payroll - Allowances Breakdown - Card Header - FaFa','','ENTITY',1,0,0),(530,'Payroll Reports - Payroll Statistics - Bank Cash Payments - Card Header - FaFa','','ENTITY',1,0,0),(531,'Payroll Reports - Payroll Statistics - Unions - Card Header - FaFa','','ENTITY',1,0,0),(532,'2020 Payroll Changes - Element Header - FaFa','','ENTITY',1,0,0),(533,'2019 Payroll Changes - Element Header - FaFa','','ENTITY',1,0,0),(534,'Absences Consumed - Element Header - FaFa','','ENTITY',1,0,0),(535,'Absence Entitlements - Element Header - FaFa','','ENTITY',1,0,0),(536,'Absence Entitlements (Grid View) - Element Header - FaFa','','ENTITY',1,0,0);
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

-- Dump completed on 2021-05-24  8:18:54
