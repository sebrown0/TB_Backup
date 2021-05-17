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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='	IN id INT UNSIGNED, IN entityTestId INT UNSIGNED, IN entityId INT UNSIGNED, IN entityEntityId INT UNSIGNED, \n	IN entityTestName VARCHAR(200), IN createdByEmployeeId VARCHAR(45), IN entityTestDesc VARCHAR(1000), \n    IN testFunction VARCHAR(1000), IN dataIn VARCHAR(1000), IN dataOut VARCHAR(1000), IN dataExpected VARCHAR(1000), \n    IN failureHaltsTest TINYINT, IN primaryTestCat VARCHAR(1000), IN secondaryTestCat VARCHAR(1000),\n    IN testCreated DATE, IN newVerCat ENUM(''MAJOR'', ''MINOR'', ''BUILD''), \n    IN parentId INT UNSIGNED, IN parentEntityTestId INT UNSIGNED,\n    IN lastRunDate DATE, IN lastRunTime TIME)\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_test_insert`
--

LOCK TABLES `data_entity_test_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_test_insert` DISABLE KEYS */;
INSERT INTO `data_entity_test_insert` VALUES (1,1,1,'Top Level of: Root',1,1,'SB_1',0,0,'This is the top level test for Root. For this to pass all its children must pass.','','','','',0,'NA  ','NA','2021-05-16','N\r'),(2,2,2,'Top Level of: Dakar Web',2,2,'SB_1',1,1,'This is the top level test for Dakar Web. For this to pass all its children must pass.','','','','',0,'App','NA','2021-05-16','N\r'),(3,3,3,'Top Level of: Login Screen',3,3,'SB_1',2,2,'This is the top level test for Login Screen. For this to pass all its children must pass.','','','','',0,'Group Controls','Group Data','2021-05-16','N\r'),(4,4,4,'User Name',4,4,'SB_1',3,3,'Label for user name on the login screen','-','-','-','User Name',0,'Data Out','NA','2021-05-16','N\r'),(5,5,5,'User Name',5,5,'SB_1',3,3,'Enter user name','Enter data','steveb','-','-',0,'Data In','NA','2021-05-16','N\r'),(6,6,6,'User Password',6,6,'SB_1',3,3,'Label for user password on the login screen','-','-','-','Password',0,'Data Out','NA','2021-05-16','N\r'),(7,7,7,'User Password',7,7,'SB_1',3,3,'Enter password','Enter data','1234','-','-',0,'Data In','NA','2021-05-16','N\r'),(8,8,8,'Top Level of: Login Button',8,8,'SB_1',3,3,'This is the top level test for Login Button. For this to pass all its children must pass.','','','','',0,'Redirect','NA','2021-05-16','N\r'),(9,9,9,'Top Level of: Home Page',9,9,'SB_1',2,2,'This is the top level test for Home Page. For this to pass all its children must pass.','','','','',0,'Group Controls','Group Data','2021-05-16','N\r'),(10,10,10,'Top Level of: Home Page Info Bar',10,10,'SB_1',9,9,'This is the top level test for Home Page Info Bar. For this to pass all its children must pass.','','','','',0,'Data Out','Redirect','2021-05-16','N\r'),(11,12,12,'Current Module Indicator',12,12,'SB_1',10,10,'Shows the currently selected module','-','-','-','Payroll',0,'Data Out','NA','2021-05-16','N\r'),(12,14,14,'Current Company',14,14,'SB_1',10,10,'Shows the currently selected company','Peform function based on value','-','-','Mars~Mars Incorporated Ltd',0,'NA  ','NA','2021-05-16','N\r'),(13,13,13,'Top Level of: Menu Toggle',13,13,'SB_1',10,10,'This is the top level test for Menu Toggle. For this to pass all its children must pass.','','','','',0,'Perform Function','NA','2021-05-16','N\r'),(14,15,15,'Top Level of: Home Page Top Right Nav Bar',15,15,'SB_1',9,9,'This is the top level test for Home Page Top Right Nav Bar. For this to pass all its children must pass.','','','','',0,'Redirect','Data Out','2021-05-16','N\r'),(15,16,16,'Top Level of: Authorisations',16,16,'SB_1',15,15,'This is the top level test for Authorisations. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(16,17,17,'Top Level of: Employee Creation Wizard',17,17,'SB_1',15,15,'This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(17,18,18,'Top Level of: Employee CV',18,18,'SB_1',15,15,'This is the top level test for Employee CV. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(18,19,19,'Top Level of: Employee Grid View',19,19,'SB_1',15,15,'This is the top level test for Employee Grid View. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(19,20,20,'Top Level of: Visual Reports',20,20,'SB_1',15,15,'This is the top level test for Visual Reports. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(20,21,21,'Top Level of: Dakar Intelligence',21,21,'SB_1',15,15,'This is the top level test for Dakar Intelligence. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(21,22,22,'Top Level of: Organisation Chart',22,22,'SB_1',15,15,'This is the top level test for Organisation Chart. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(22,23,23,'Top Level of: My Company / Last Viewed',23,23,'SB_1',15,15,'This is the top level test for My Company / Last Viewed. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(23,24,24,'Top Level of: All Notifications',24,24,'SB_1',15,15,'This is the top level test for All Notifications. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(24,25,25,'Top Level of: New Employments',25,25,'SB_1',15,15,'This is the top level test for New Employments. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(25,26,26,'Top Level of: Terminations',26,26,'SB_1',15,15,'This is the top level test for Terminations. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(26,27,27,'Top Level of: Quick Links',27,27,'SB_1',15,15,'This is the top level test for Quick Links. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(27,28,28,'Top Level of: User Avatar',28,28,'SB_1',15,15,'This is the top level test for User Avatar. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(28,29,29,'Top Level of: Main Menu',29,29,'SB_1',9,9,'This is the top level test for Main Menu. For this to pass all its children must pass.','','','','',0,'Redirect','Data Out','2021-05-16','N\r'),(29,30,30,'Top Level of: Main Menu - Payroll',30,30,'SB_1',29,29,'This is the top level test for Main Menu - Payroll. For this to pass all its children must pass.','','','','',0,'Redirect','Data Out','2021-05-16','N\r'),(30,31,31,'Top Level of: Employee List',31,31,'SB_1',30,30,'This is the top level test for Employee List. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(31,32,32,'Top Level of: Documents',32,32,'SB_1',30,30,'This is the top level test for Documents. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(32,33,33,'Top Level of: Employee Others',33,33,'SB_1',30,30,'This is the top level test for Employee Others. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(33,34,34,'Top Level of: Payroll',34,34,'SB_1',30,30,'This is the top level test for Payroll. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(34,35,35,'Top Level of: Payroll Statistics',35,35,'SB_1',30,30,'This is the top level test for Payroll Statistics. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(35,36,36,'Top Level of: Absence Statistics',36,36,'SB_1',30,30,'This is the top level test for Absence Statistics. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(36,37,37,'Top Level of: Reports',37,37,'SB_1',30,30,'This is the top level test for Reports. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(37,38,38,'Top Level of: Monthly Reports',38,38,'SB_1',30,30,'This is the top level test for Monthly Reports. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(38,39,39,'Top Level of: Yearly Reports',39,39,'SB_1',30,30,'This is the top level test for Yearly Reports. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(39,40,40,'Top Level of: Bulk Updates',40,40,'SB_1',30,30,'This is the top level test for Bulk Updates. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r'),(40,41,41,'Top Level of: Settings',41,41,'SB_1',30,30,'This is the top level test for Settings. For this to pass all its children must pass.','','','','',0,'Display Child','NA','2021-05-16','N\r');
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
INSERT INTO `data_test_suite_insert` VALUES (1,1,'Root',0,0,'ADD TEST SUITE NOTES','Root','N\r'),(2,2,'Dakar Web',1,1,'ADD TEST SUITE NOTES','Application','N\r'),(3,3,'Login Screen',2,2,'ADD TEST SUITE NOTES','Form','N\r'),(8,8,'Login Button',3,3,'ADD TEST SUITE NOTES','Button - Redirect','N\r'),(9,9,'Home Page',2,2,'ADD TEST SUITE NOTES','Parent Form','N\r'),(10,10,'Home Page Info Bar',9,9,'ADD TEST SUITE NOTES','Info Bar','N\r'),(13,13,'Menu Toggle',10,10,'ADD TEST SUITE NOTES','Button - Function','N\r'),(15,15,'Home Page Top Right Nav Bar',9,9,'ADD TEST SUITE NOTES','Nav Bar','N\r'),(16,16,'Authorisations',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(17,17,'Employee Creation Wizard',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(18,18,'Employee CV',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(19,19,'Employee Grid View',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(20,20,'Visual Reports',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(21,21,'Dakar Intelligence',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(22,22,'Organisation Chart',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(23,23,'My Company / Last Viewed',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(24,24,'All Notifications',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(25,25,'New Employments',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(26,26,'Terminations',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(27,27,'Quick Links',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(28,28,'User Avatar',15,15,'ADD TEST SUITE NOTES','Button - Display','N\r'),(29,29,'Main Menu',9,9,'ADD TEST SUITE NOTES','Nav Bar','N\r'),(30,30,'Main Menu - Payroll',29,29,'ADD TEST SUITE NOTES','Nav Bar','N\r'),(31,31,'Employee List',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(32,32,'Documents',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(33,33,'Employee Others',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(34,34,'Payroll',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(35,35,'Payroll Statistics',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(36,36,'Absence Statistics',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(37,37,'Reports',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(38,38,'Monthly Reports',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(39,39,'Yearly Reports',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(40,40,'Bulk Updates',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r'),(41,41,'Settings',30,30,'ADD TEST SUITE NOTES','Button - Display','N\r');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` VALUES (1,1,'Root',1,1,'Root',0,0,1),(2,2,'Dakar Web',2,2,'Application',1,1,2),(3,3,'Login Screen',3,6,'Form',2,2,0),(4,4,'User Name',4,21,'Label',3,3,4),(5,5,'User Name',5,18,'Text In',3,3,5),(6,6,'User Password',6,21,'Label',3,3,0),(7,7,'User Password',7,18,'Text In',3,3,0),(8,8,'Login Button',8,23,'Button - Redirect',3,3,8),(9,9,'Home Page',9,8,'Parent Form',8,8,9),(10,10,'Home Page Info Bar',10,11,'Info Bar',9,9,10),(11,11,'Dakar Logo',11,13,'Image',10,10,11),(12,12,'Current Module Indicator',12,21,'Label',10,10,12),(13,13,'Menu Toggle',13,25,'Button - Function',10,10,0),(14,14,'Current Company',14,20,'Combo',10,10,14),(15,15,'Home Page Top Right Nav Bar',15,10,'Nav Bar',9,9,0),(16,16,'Authorisations',16,24,'Button - Display',15,15,16),(17,17,'Employee Creation Wizard',17,24,'Button - Display',15,15,17),(18,18,'Employee CV',18,24,'Button - Display',15,15,18),(19,19,'Employee Grid View',19,24,'Button - Display',15,15,19),(20,20,'Visual Reports',20,24,'Button - Display',15,15,20),(21,21,'Dakar Intelligence',21,24,'Button - Display',15,15,21),(22,22,'Organisation Chart',22,24,'Button - Display',15,15,22),(23,23,'My Company / Last Viewed',23,24,'Button - Display',15,15,23),(24,24,'All Notifications',24,24,'Button - Display',15,15,24),(25,25,'New Employments',25,24,'Button - Display',15,15,25),(26,26,'Terminations',26,24,'Button - Display',15,15,26),(27,27,'Quick Links',27,24,'Button - Display',15,15,27),(28,28,'User Avatar',28,24,'Button - Display',15,15,28),(29,29,'Main Menu',29,10,'Nav Bar',9,9,29),(30,30,'Main Menu - Payroll',30,10,'Nav Bar',29,29,30),(31,31,'Employee List',31,24,'Button - Display',30,30,0),(32,32,'Documents',32,24,'Button - Display',30,30,0),(33,33,'Employee Others',33,24,'Button - Display',30,30,33),(34,34,'Payroll',34,24,'Button - Display',30,30,34),(35,35,'Payroll Statistics',35,24,'Button - Display',30,30,35),(36,36,'Absence Statistics',36,24,'Button - Display',30,30,36),(37,37,'Reports',37,24,'Button - Display',30,30,37),(38,38,'Monthly Reports',38,24,'Button - Display',30,30,38),(39,39,'Yearly Reports',39,24,'Button - Display',30,30,39),(40,40,'Bulk Updates',40,24,'Button - Display',30,30,40),(41,41,'Settings',41,24,'Button - Display',30,30,41);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action`
--

LOCK TABLES `entity_action` WRITE;
/*!40000 ALTER TABLE `entity_action` DISABLE KEYS */;
INSERT INTO `entity_action` VALUES (1,4,'Label: User Name label text','-','-','-','User Name',3),(2,5,'Enter the user name','Enter data','steveb','-','-',2),(3,6,'Label: User Password label text','-','-','-','Password',3),(4,7,'User password entry','Enter data','1234','-','-',2),(5,8,'Redirect the user to the Dakar Web homepage','Redirect to different page','-','-','-',1),(6,11,'Image: Dakar Logo','-','-','-','logo.png',3),(7,12,'Label: Current Module Indicator label text','-','-','-','Payroll',3),(8,13,'Button Function: Menu Toggle - Should toggle the view of the main menu show/hide.','Perform function','-','-','-',1),(9,14,'Combo: Current Company - Displays current company and list of all available companies. User can select the current company from here.','Peform function based on value','-','-','Mars~Mars Incorporated Ltd',5),(10,16,'Button Display: Authorisations - Display form','Display child','-','-','-',3),(11,17,'Button Display: Employee Creation Wizard ','Display child','-','-','-',1),(12,18,'Button Display: Employee CV','Display child','-','-','-',1),(13,19,'Button Display: Employee Grid View','Display child','-','-','-',1),(14,20,'Button Display: Visual Reports','Display child','-','-','-',1),(15,21,'Button Display: Dakar Intelligence','Display child','-','-','-',1),(16,22,'Button Display: Organisation Chart','Display child','-','-','-',1),(17,23,'Button Display: My Company / Last Viewed','Display child','-','-','-',1),(18,24,'Button Display: All Notifications','Display child','-','-','-',1),(19,25,'Button Display: New Employments','Display child','-','-','-',1),(20,26,'Button Display: Terminations','Display child','-','-','-',1),(21,27,'Button Display: Quick Links','Display child','-','-','-',1),(22,28,'Button Display: User Avatar','Display child','-','-','-',1),(23,31,'Button Display: Employee List','Display child','-','-','-',1),(24,32,'Button Display: Documents','Display child','-','-','-',1),(25,33,'Button Display: Employee Others','Display child','-','-','-',1),(26,34,'Button Display: Payroll','Display child','-','-','-',1),(27,35,'Button Display: Payroll Statistics','Display child','-','-','-',1),(28,36,'Button Display: Absence Statistics','Display child','-','-','-',1),(29,37,'Button Display: Reports','Display child','-','-','-',1),(30,38,'Button Display: Monthly Reports','Display child','-','-','-',1),(31,39,'Button Display: Yearly Reports','Display child','-','-','-',1),(32,40,'Button Display: Bulk Updates','Display child','-','-','-',1),(33,41,'Button Display: Settings','Display child','-','-','-',1);
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
INSERT INTO `entity_action_type` VALUES (1,1,'Click\r'),(2,2,'Data In\r'),(3,3,'Data Out\r'),(4,4,'Data InOut\r'),(5,5,'Function\r');
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
INSERT INTO `entity_can_have_action` VALUES (1,4,4),(2,5,5),(3,6,6),(4,7,7),(5,8,8),(6,11,11),(7,12,12),(8,13,13),(9,14,14),(10,16,16),(11,17,17),(12,18,18),(13,19,19),(14,20,20),(15,21,21),(16,22,22),(17,23,23),(18,24,24),(19,25,25),(20,26,26),(21,27,27),(22,28,28),(23,31,31),(24,32,32),(25,33,33),(26,34,34),(27,35,35),(28,36,36),(29,37,37),(30,38,38),(31,39,39),(32,40,40),(33,41,41);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_details`
--

LOCK TABLES `entity_details` WRITE;
/*!40000 ALTER TABLE `entity_details` DISABLE KEYS */;
INSERT INTO `entity_details` VALUES (1,1,'The root entity has no purpose except be the parent of all other entities.','2021-05-16','MAN','1900-01-01','00:00:00'),(2,2,'The Dakar Web App','2021-05-16','MAN','1900-01-01','00:00:00'),(3,3,'The login screen that a user first encounters','2021-05-16','MAN','1900-01-01','00:00:00'),(4,4,'Label for user name login','2021-05-16','MAN','1900-01-01','00:00:00'),(5,5,'Text box entry for user name','2021-05-16','MAN','1900-01-01','00:00:00'),(6,6,'Label for user password','2021-05-16','MAN','1900-01-01','00:00:00'),(7,7,'Text box entry for user password','2021-05-16','MAN','1900-01-01','00:00:00'),(8,8,'Click to login with user name & password','2021-05-16','MAN','1900-01-01','00:00:00'),(9,9,'Homepage of Dakar Web App','2021-05-16','MAN','1900-01-01','00:00:00'),(10,10,'Top left info bar. Displays - 1: Logo 2: Current module 3:Full Screen Icon 4: TCL Icon 5: Current Company','2021-05-16','MAN','1900-01-01','00:00:00'),(11,11,'Dakar logo image','2021-05-16','MAN','1900-01-01','00:00:00'),(12,12,'Displays the currentlt selected module','2021-05-16','MAN','1900-01-01','00:00:00'),(13,13,'Toggles the view of the main menu','2021-05-16','MAN','1900-01-01','00:00:00'),(14,14,'Displays current company and list of all available companies','2021-05-16','MAN','1900-01-01','00:00:00'),(15,15,'Provides shortcuts to app elements. Also is the only way to swap between modules.','2021-05-16','MAN','1900-01-01','00:00:00'),(16,16,'Displays the authorisations form','2021-05-16','MAN','1900-01-01','00:00:00'),(17,17,'Displays the employee creation wizard form','2021-05-16','MAN','1900-01-01','00:00:00'),(18,18,'Displays the employee CV form','2021-05-16','MAN','1900-01-01','00:00:00'),(19,19,'Displays the employee grid view form','2021-05-16','MAN','1900-01-01','00:00:00'),(20,20,'Displays the summary graphs form','2021-05-16','MAN','1900-01-01','00:00:00'),(21,21,'Displays the DI form','2021-05-16','MAN','1900-01-01','00:00:00'),(22,22,'Displays the organisation chart form','2021-05-16','MAN','1900-01-01','00:00:00'),(23,23,'Displays the last  viewed popup form','2021-05-16','MAN','1900-01-01','00:00:00'),(24,24,'Displays the last  all notifications popup form. Displays total notifications (if there are any)','2021-05-16','MAN','1900-01-01','00:00:00'),(25,25,'Displays the new employments popup form.','2021-05-16','MAN','1900-01-01','00:00:00'),(26,26,'Displays the terminations popup form.','2021-05-16','MAN','1900-01-01','00:00:00'),(27,27,'Displays the quick links popup form.','2021-05-16','MAN','1900-01-01','00:00:00'),(28,28,'Displays the user config/action popup form. Displays the user image if setup.','2021-05-16','MAN','1900-01-01','00:00:00'),(29,29,'Main navigation bar for the currently selected module in the app.','2021-05-16','MAN','1900-01-01','00:00:00'),(30,30,'Main navigation bar for the payroll module.','2021-05-16','MAN','1900-01-01','00:00:00'),(31,31,'Display the Employee List form.','2021-05-16','MAN','1900-01-01','00:00:00'),(32,32,'Display the Employee Document form.','2021-05-16','MAN','1900-01-01','00:00:00'),(33,33,'Display the Employee Others sub menu.','2021-05-16','MAN','1900-01-01','00:00:00'),(34,34,'Display the Payroll sub menu.','2021-05-16','MAN','1900-01-01','00:00:00'),(35,35,'Display the Employee Statistics sub menu.','2021-05-16','MAN','1900-01-01','00:00:00'),(36,36,'Display the Absence Statistics sub menu.','2021-05-16','MAN','1900-01-01','00:00:00'),(37,37,'Display the Reports sub menu.','2021-05-16','MAN','1900-01-01','00:00:00'),(38,38,'Display the Monthly Payroll Reports form.','2021-05-16','MAN','1900-01-01','00:00:00'),(39,39,'Display the Yearly Payroll Reports form.','2021-05-16','MAN','1900-01-01','00:00:00'),(40,40,'Display the Bulk Updates sub menu.','2021-05-16','MAN','1900-01-01','00:00:00'),(41,41,'Display the Settings form.','2021-05-16','MAN','1900-01-01','00:00:00');
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
INSERT INTO `entity_has_version` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_help`
--

LOCK TABLES `entity_help` WRITE;
/*!40000 ALTER TABLE `entity_help` DISABLE KEYS */;
INSERT INTO `entity_help` VALUES (1,1,'False','-','',''),(2,2,'False','-','',''),(3,3,'False','-','',''),(4,4,'False','-','',''),(5,5,'False','-','',''),(6,6,'False','-','',''),(7,7,'False','-','',''),(8,8,'True','Click to login','',''),(9,9,'','','',''),(10,10,'False','-','',''),(11,11,'False','-','',''),(12,12,'False','-','',''),(13,13,'True','Hide or Show Main Menu','',''),(14,14,'False','-','',''),(15,15,'False','-','',''),(16,16,'True','Authorisations','',''),(17,17,'True','Employee Creation','',''),(18,18,'True','Employee CV','',''),(19,19,'True','Employee Grid View','',''),(20,20,'True','Visual Reports','',''),(21,21,'True','Dakar Intelligence','',''),(22,22,'False','-','',''),(23,23,'True','My Company / Last Viewed','',''),(24,24,'True','Notifications','',''),(25,25,'True','New Employments','',''),(26,26,'True','Terminations','',''),(27,27,'True','Quick Links','',''),(28,28,'True','User','',''),(29,29,'False','-','',''),(30,30,'False','-','',''),(31,31,'False','-','',''),(32,32,'False','-','',''),(33,33,'False','-','',''),(34,34,'False','-','',''),(35,35,'False','-','',''),(36,36,'False','-','',''),(37,37,'False','-','',''),(38,38,'False','-','',''),(39,39,'False','-','',''),(40,40,'False','-','',''),(41,41,'False','-','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test`
--

LOCK TABLES `entity_test` WRITE;
/*!40000 ALTER TABLE `entity_test` DISABLE KEYS */;
INSERT INTO `entity_test` VALUES (1,1,1,1,'Top Level of: Root','This is the top level test for Root. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,0,0),(2,2,2,2,'Top Level of: Dakar Web','This is the top level test for Dakar Web. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,1,1),(3,3,3,3,'Top Level of: Login Screen','This is the top level test for Login Screen. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,2,2),(4,4,4,4,'User Name','Label for user name on the login screen','2021-05-16','-','-','-','User Name',0,'SB_1',NULL,NULL,3,3),(5,5,5,5,'User Name','Enter user name','2021-05-16','Enter data','steveb','-','-',0,'SB_1',NULL,NULL,3,3),(6,6,6,6,'User Password','Label for user password on the login screen','2021-05-16','-','-','-','Password',0,'SB_1',NULL,NULL,3,3),(7,7,7,7,'User Password','Enter password','2021-05-16','Enter data','1234','-','-',0,'SB_1',NULL,NULL,3,3),(8,8,8,8,'Top Level of: Login Button','This is the top level test for Login Button. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,3,3),(9,9,9,9,'Top Level of: Home Page','This is the top level test for Home Page. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,2,2),(10,10,10,10,'Top Level of: Home Page Info Bar','This is the top level test for Home Page Info Bar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,9,9),(12,12,12,12,'Current Module Indicator','Shows the currently selected module','2021-05-16','-','-','-','Payroll',0,'SB_1',NULL,NULL,10,10),(13,13,13,13,'Top Level of: Menu Toggle','This is the top level test for Menu Toggle. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,10,10),(14,14,14,14,'Current Company','Shows the currently selected company','2021-05-16','Peform function based on value','-','-','Mars~Mars Incorporated Ltd',0,'SB_1',NULL,NULL,10,10),(15,15,15,15,'Top Level of: Home Page Top Right Nav Bar','This is the top level test for Home Page Top Right Nav Bar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,9,9),(16,16,16,16,'Top Level of: Authorisations','This is the top level test for Authorisations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(17,17,17,17,'Top Level of: Employee Creation Wizard','This is the top level test for Employee Creation Wizard. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(18,18,18,18,'Top Level of: Employee CV','This is the top level test for Employee CV. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(19,19,19,19,'Top Level of: Employee Grid View','This is the top level test for Employee Grid View. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(20,20,20,20,'Top Level of: Visual Reports','This is the top level test for Visual Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(21,21,21,21,'Top Level of: Dakar Intelligence','This is the top level test for Dakar Intelligence. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(22,22,22,22,'Top Level of: Organisation Chart','This is the top level test for Organisation Chart. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(23,23,23,23,'Top Level of: My Company / Last Viewed','This is the top level test for My Company / Last Viewed. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(24,24,24,24,'Top Level of: All Notifications','This is the top level test for All Notifications. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(25,25,25,25,'Top Level of: New Employments','This is the top level test for New Employments. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(26,26,26,26,'Top Level of: Terminations','This is the top level test for Terminations. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(27,27,27,27,'Top Level of: Quick Links','This is the top level test for Quick Links. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(28,28,28,28,'Top Level of: User Avatar','This is the top level test for User Avatar. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,15,15),(29,29,29,29,'Top Level of: Main Menu','This is the top level test for Main Menu. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,9,9),(30,30,30,30,'Top Level of: Main Menu - Payroll','This is the top level test for Main Menu - Payroll. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,29,29),(31,31,31,31,'Top Level of: Employee List','This is the top level test for Employee List. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(32,32,32,32,'Top Level of: Documents','This is the top level test for Documents. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(33,33,33,33,'Top Level of: Employee Others','This is the top level test for Employee Others. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(34,34,34,34,'Top Level of: Payroll','This is the top level test for Payroll. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(35,35,35,35,'Top Level of: Payroll Statistics','This is the top level test for Payroll Statistics. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(36,36,36,36,'Top Level of: Absence Statistics','This is the top level test for Absence Statistics. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(37,37,37,37,'Top Level of: Reports','This is the top level test for Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(38,38,38,38,'Top Level of: Monthly Reports','This is the top level test for Monthly Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(39,39,39,39,'Top Level of: Yearly Reports','This is the top level test for Yearly Reports. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(40,40,40,40,'Top Level of: Bulk Updates','This is the top level test for Bulk Updates. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30),(41,41,41,41,'Top Level of: Settings','This is the top level test for Settings. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,30,30);
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
INSERT INTO `entity_test_has_one_or_more_test_categories` VALUES (2,1,2,2),(5,2,3,3),(5,2,9,9),(6,1,3,3),(6,1,9,9),(7,1,8,8),(7,2,10,10),(7,1,15,15),(7,1,29,29),(7,1,30,30),(11,1,5,5),(11,1,7,7),(12,1,4,4),(12,1,6,6),(12,1,10,10),(12,1,12,12),(12,2,15,15),(12,2,29,29),(12,2,30,30),(13,1,16,16),(13,1,17,17),(13,1,18,18),(13,1,19,19),(13,1,20,20),(13,1,21,21),(13,1,22,22),(13,1,23,23),(13,1,24,24),(13,1,25,25),(13,1,26,26),(13,1,27,27),(13,1,28,28),(13,1,31,31),(13,1,32,32),(13,1,33,33),(13,1,34,34),(13,1,35,35),(13,1,36,36),(13,1,37,37),(13,1,38,38),(13,1,39,39),(13,1,40,40),(13,1,41,41);
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
INSERT INTO `entity_test_has_version` VALUES (76,1,1),(77,2,2),(78,3,3),(79,4,4),(80,5,5),(81,6,6),(82,7,7),(83,8,8),(84,9,9),(85,10,10),(86,12,12),(87,14,14),(88,13,13),(89,15,15),(90,16,16),(91,17,17),(92,18,18),(93,19,19),(94,20,20),(95,21,21),(96,22,22),(97,23,23),(98,24,24),(99,25,25),(100,26,26),(101,27,27),(102,28,28),(103,29,29),(104,30,30),(105,31,31),(106,32,32),(107,33,33),(108,34,34),(109,35,35),(110,36,36),(111,37,37),(112,38,38),(113,39,39),(114,40,40),(115,41,41);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_result`
--

LOCK TABLES `entity_test_result` WRITE;
/*!40000 ALTER TABLE `entity_test_result` DISABLE KEYS */;
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
  `test_suite_row_id` int(10) unsigned DEFAULT NULL,
  `test_suite_id` int(10) unsigned DEFAULT NULL,
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
INSERT INTO `temp_test_in_test_run` VALUES (NULL,NULL,3,3,3,3,'Top Level of: Login Screen','1.0.0','This is the top level test for Login Screen. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,2,2,'Form','Login Screen','1900-01-01','00:00:00',NULL,NULL),(3,3,4,4,4,4,'User Name','1.0.0','Label for user name on the login screen','2021-05-16','-','-','-','User Name',0,'SB_1',NULL,NULL,3,3,'Label','User Name','1900-01-01','00:00:00','False','-'),(3,3,5,5,5,5,'User Name','1.0.0','Enter user name','2021-05-16','Enter data','steveb','-','-',0,'SB_1',NULL,NULL,3,3,'Text In','User Name','1900-01-01','00:00:00','False','-'),(3,3,6,6,6,6,'User Password','1.0.0','Label for user password on the login screen','2021-05-16','-','-','-','Password',0,'SB_1',NULL,NULL,3,3,'Label','User Password','1900-01-01','00:00:00',NULL,NULL),(3,3,7,7,7,7,'User Password','1.0.0','Enter password','2021-05-16','Enter data','1234','-','-',0,'SB_1',NULL,NULL,3,3,'Text In','User Password','1900-01-01','00:00:00',NULL,NULL),(3,3,8,8,8,8,'Top Level of: Login Button','1.0.0','This is the top level test for Login Button. For this to pass all its children must pass.','2021-05-16','','','','',0,'SB_1',NULL,NULL,3,3,'Button - Redirect','Login Button','1900-01-01','00:00:00','True','Click to login');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run`
--

LOCK TABLES `test_run` WRITE;
/*!40000 ALTER TABLE `test_run` DISABLE KEYS */;
INSERT INTO `test_run` VALUES (1,'Login','Login form');
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
INSERT INTO `test_run_has_test_suite` VALUES (3,3,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run_result`
--

LOCK TABLES `test_run_result` WRITE;
/*!40000 ALTER TABLE `test_run_result` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite`
--

LOCK TABLES `test_suite` WRITE;
/*!40000 ALTER TABLE `test_suite` DISABLE KEYS */;
INSERT INTO `test_suite` VALUES (1,1,'Root','ADD TEST SUITE NOTES',0,0),(2,2,'Dakar Web','ADD TEST SUITE NOTES',1,1),(3,3,'Login Screen','ADD TEST SUITE NOTES',2,2),(8,8,'Login Button','ADD TEST SUITE NOTES',3,3),(9,9,'Home Page','ADD TEST SUITE NOTES',2,2),(10,10,'Home Page Info Bar','ADD TEST SUITE NOTES',9,9),(13,13,'Menu Toggle','ADD TEST SUITE NOTES',10,10),(15,15,'Home Page Top Right Nav Bar','ADD TEST SUITE NOTES',9,9),(16,16,'Authorisations','ADD TEST SUITE NOTES',15,15),(17,17,'Employee Creation Wizard','ADD TEST SUITE NOTES',15,15),(18,18,'Employee CV','ADD TEST SUITE NOTES',15,15),(19,19,'Employee Grid View','ADD TEST SUITE NOTES',15,15),(20,20,'Visual Reports','ADD TEST SUITE NOTES',15,15),(21,21,'Dakar Intelligence','ADD TEST SUITE NOTES',15,15),(22,22,'Organisation Chart','ADD TEST SUITE NOTES',15,15),(23,23,'My Company / Last Viewed','ADD TEST SUITE NOTES',15,15),(24,24,'All Notifications','ADD TEST SUITE NOTES',15,15),(25,25,'New Employments','ADD TEST SUITE NOTES',15,15),(26,26,'Terminations','ADD TEST SUITE NOTES',15,15),(27,27,'Quick Links','ADD TEST SUITE NOTES',15,15),(28,28,'User Avatar','ADD TEST SUITE NOTES',15,15),(29,29,'Main Menu','ADD TEST SUITE NOTES',9,9),(30,30,'Main Menu - Payroll','ADD TEST SUITE NOTES',29,29),(31,31,'Employee List','ADD TEST SUITE NOTES',30,30),(32,32,'Documents','ADD TEST SUITE NOTES',30,30),(33,33,'Employee Others','ADD TEST SUITE NOTES',30,30),(34,34,'Payroll','ADD TEST SUITE NOTES',30,30),(35,35,'Payroll Statistics','ADD TEST SUITE NOTES',30,30),(36,36,'Absence Statistics','ADD TEST SUITE NOTES',30,30),(37,37,'Reports','ADD TEST SUITE NOTES',30,30),(38,38,'Monthly Reports','ADD TEST SUITE NOTES',30,30),(39,39,'Yearly Reports','ADD TEST SUITE NOTES',30,30),(40,40,'Bulk Updates','ADD TEST SUITE NOTES',30,30),(41,41,'Settings','ADD TEST SUITE NOTES',30,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_entity_test`
--

LOCK TABLES `test_suite_has_entity_test` WRITE;
/*!40000 ALTER TABLE `test_suite_has_entity_test` DISABLE KEYS */;
INSERT INTO `test_suite_has_entity_test` VALUES (1,1,1,2,2,2,2),(2,2,2,3,3,3,3),(3,3,3,4,4,4,4),(4,3,3,5,5,5,5),(5,3,3,6,6,6,6),(6,3,3,7,7,7,7),(7,3,3,8,8,8,8),(8,2,2,9,9,9,9),(9,9,9,10,10,10,10),(10,10,10,12,12,12,12),(11,10,10,14,14,14,14),(12,10,10,13,13,13,13),(13,9,9,15,15,15,15),(14,15,15,16,16,16,16),(15,15,15,17,17,17,17),(16,15,15,18,18,18,18),(17,15,15,19,19,19,19),(18,15,15,20,20,20,20),(19,15,15,21,21,21,21),(20,15,15,22,22,22,22),(21,15,15,23,23,23,23),(22,15,15,24,24,24,24),(23,15,15,25,25,25,25),(24,15,15,26,26,26,26),(25,15,15,27,27,27,27),(26,15,15,28,28,28,28),(27,9,9,29,29,29,29),(28,29,29,30,30,30,30),(29,30,30,31,31,31,31),(30,30,30,32,32,32,32),(31,30,30,33,33,33,33),(32,30,30,34,34,34,34),(33,30,30,35,35,35,35),(34,30,30,36,36,36,36),(35,30,30,37,37,37,37),(36,30,30,38,38,38,38),(37,30,30,39,39,39,39),(38,30,30,40,40,40,40),(39,30,30,41,41,41,41);
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
INSERT INTO `test_suite_has_version` VALUES (42,1,1),(43,2,2),(44,3,3),(45,8,8),(46,9,9),(47,10,10),(48,13,13),(49,15,15),(50,16,16),(51,17,17),(52,18,18),(53,19,19),(54,20,20),(55,21,21),(56,22,22),(57,23,23),(58,24,24),(59,25,25),(60,26,26),(61,27,27),(62,28,28),(63,29,29),(64,30,30),(65,31,31),(66,32,32),(67,33,33),(68,34,34),(69,35,35),(70,36,36),(71,37,37),(72,38,38),(73,39,39),(74,40,40),(75,41,41);
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'Root','','ENTITY',1,0,0),(2,'Dakar Web','','ENTITY',1,0,0),(3,'Login Screen','','ENTITY',1,0,0),(4,'User Name','','ENTITY',1,0,0),(5,'User Name','','ENTITY',1,0,0),(6,'User Password','','ENTITY',1,0,0),(7,'User Password','','ENTITY',1,0,0),(8,'Login Button','','ENTITY',1,0,0),(9,'Home Page','','ENTITY',1,0,0),(10,'Home Page Info Bar','','ENTITY',1,0,0),(11,'Dakar Logo','','ENTITY',1,0,0),(12,'Current Module Indicator','','ENTITY',1,0,0),(13,'Menu Toggle','','ENTITY',1,0,0),(14,'Current Company','','ENTITY',1,0,0),(15,'Home Page Top Right Nav Bar','','ENTITY',1,0,0),(16,'Authorisations','','ENTITY',1,0,0),(17,'Employee Creation Wizard','','ENTITY',1,0,0),(18,'Employee CV','','ENTITY',1,0,0),(19,'Employee Grid View','','ENTITY',1,0,0),(20,'Visual Reports','','ENTITY',1,0,0),(21,'Dakar Intelligence','','ENTITY',1,0,0),(22,'Organisation Chart','','ENTITY',1,0,0),(23,'My Company / Last Viewed','','ENTITY',1,0,0),(24,'All Notifications','','ENTITY',1,0,0),(25,'New Employments','','ENTITY',1,0,0),(26,'Terminations','','ENTITY',1,0,0),(27,'Quick Links','','ENTITY',1,0,0),(28,'User Avatar','','ENTITY',1,0,0),(29,'Main Menu','','ENTITY',1,0,0),(30,'Main Menu - Payroll','','ENTITY',1,0,0),(31,'Employee List','','ENTITY',1,0,0),(32,'Documents','','ENTITY',1,0,0),(33,'Employee Others','','ENTITY',1,0,0),(34,'Payroll','','ENTITY',1,0,0),(35,'Payroll Statistics','','ENTITY',1,0,0),(36,'Absence Statistics','','ENTITY',1,0,0),(37,'Reports','','ENTITY',1,0,0),(38,'Monthly Reports','','ENTITY',1,0,0),(39,'Yearly Reports','','ENTITY',1,0,0),(40,'Bulk Updates','','ENTITY',1,0,0),(41,'Settings','','ENTITY',1,0,0),(42,'Root','No existing version. New major version of Root','TEST_SUITE',1,0,0),(43,'Dakar Web','No existing version. New major version of Dakar Web','TEST_SUITE',1,0,0),(44,'Login Screen','No existing version. New major version of Login Screen','TEST_SUITE',1,0,0),(45,'Login Button','No existing version. New major version of Login Button','TEST_SUITE',1,0,0),(46,'Home Page','No existing version. New major version of Home Page','TEST_SUITE',1,0,0),(47,'Home Page Info Bar','No existing version. New major version of Home Page Info Bar','TEST_SUITE',1,0,0),(48,'Menu Toggle','No existing version. New major version of Menu Toggle','TEST_SUITE',1,0,0),(49,'Home Page Top Right Nav Bar','No existing version. New major version of Home Page Top Right Nav Bar','TEST_SUITE',1,0,0),(50,'Authorisations','No existing version. New major version of Authorisations','TEST_SUITE',1,0,0),(51,'Employee Creation Wizard','No existing version. New major version of Employee Creation Wizard','TEST_SUITE',1,0,0),(52,'Employee CV','No existing version. New major version of Employee CV','TEST_SUITE',1,0,0),(53,'Employee Grid View','No existing version. New major version of Employee Grid View','TEST_SUITE',1,0,0),(54,'Visual Reports','No existing version. New major version of Visual Reports','TEST_SUITE',1,0,0),(55,'Dakar Intelligence','No existing version. New major version of Dakar Intelligence','TEST_SUITE',1,0,0),(56,'Organisation Chart','No existing version. New major version of Organisation Chart','TEST_SUITE',1,0,0),(57,'My Company / Last Viewed','No existing version. New major version of My Company / Last Viewed','TEST_SUITE',1,0,0),(58,'All Notifications','No existing version. New major version of All Notifications','TEST_SUITE',1,0,0),(59,'New Employments','No existing version. New major version of New Employments','TEST_SUITE',1,0,0),(60,'Terminations','No existing version. New major version of Terminations','TEST_SUITE',1,0,0),(61,'Quick Links','No existing version. New major version of Quick Links','TEST_SUITE',1,0,0),(62,'User Avatar','No existing version. New major version of User Avatar','TEST_SUITE',1,0,0),(63,'Main Menu','No existing version. New major version of Main Menu','TEST_SUITE',1,0,0),(64,'Main Menu - Payroll','No existing version. New major version of Main Menu - Payroll','TEST_SUITE',1,0,0),(65,'Employee List','No existing version. New major version of Employee List','TEST_SUITE',1,0,0),(66,'Documents','No existing version. New major version of Documents','TEST_SUITE',1,0,0),(67,'Employee Others','No existing version. New major version of Employee Others','TEST_SUITE',1,0,0),(68,'Payroll','No existing version. New major version of Payroll','TEST_SUITE',1,0,0),(69,'Payroll Statistics','No existing version. New major version of Payroll Statistics','TEST_SUITE',1,0,0),(70,'Absence Statistics','No existing version. New major version of Absence Statistics','TEST_SUITE',1,0,0),(71,'Reports','No existing version. New major version of Reports','TEST_SUITE',1,0,0),(72,'Monthly Reports','No existing version. New major version of Monthly Reports','TEST_SUITE',1,0,0),(73,'Yearly Reports','No existing version. New major version of Yearly Reports','TEST_SUITE',1,0,0),(74,'Bulk Updates','No existing version. New major version of Bulk Updates','TEST_SUITE',1,0,0),(75,'Settings','No existing version. New major version of Settings','TEST_SUITE',1,0,0),(76,'Top Level of: Root','No existing version. New major version of Top Level of: Root','TEST',1,0,0),(77,'Top Level of: Dakar Web','No existing version. New major version of Top Level of: Dakar Web','TEST',1,0,0),(78,'Top Level of: Login Screen','No existing version. New major version of Top Level of: Login Screen','TEST',1,0,0),(79,'User Name','No existing version. New major version of User Name','TEST',1,0,0),(80,'User Name','No existing version. New major version of User Name','TEST',1,0,0),(81,'User Password','No existing version. New major version of User Password','TEST',1,0,0),(82,'User Password','No existing version. New major version of User Password','TEST',1,0,0),(83,'Top Level of: Login Button','No existing version. New major version of Top Level of: Login Button','TEST',1,0,0),(84,'Top Level of: Home Page','No existing version. New major version of Top Level of: Home Page','TEST',1,0,0),(85,'Top Level of: Home Page Info Bar','No existing version. New major version of Top Level of: Home Page Info Bar','TEST',1,0,0),(86,'Current Module Indicator','No existing version. New major version of Current Module Indicator','TEST',1,0,0),(87,'Current Company','No existing version. New major version of Current Company','TEST',1,0,0),(88,'Top Level of: Menu Toggle','No existing version. New major version of Top Level of: Menu Toggle','TEST',1,0,0),(89,'Top Level of: Home Page Top Right Nav Bar','No existing version. New major version of Top Level of: Home Page Top Right Nav Bar','TEST',1,0,0),(90,'Top Level of: Authorisations','No existing version. New major version of Top Level of: Authorisations','TEST',1,0,0),(91,'Top Level of: Employee Creation Wizard','No existing version. New major version of Top Level of: Employee Creation Wizard','TEST',1,0,0),(92,'Top Level of: Employee CV','No existing version. New major version of Top Level of: Employee CV','TEST',1,0,0),(93,'Top Level of: Employee Grid View','No existing version. New major version of Top Level of: Employee Grid View','TEST',1,0,0),(94,'Top Level of: Visual Reports','No existing version. New major version of Top Level of: Visual Reports','TEST',1,0,0),(95,'Top Level of: Dakar Intelligence','No existing version. New major version of Top Level of: Dakar Intelligence','TEST',1,0,0),(96,'Top Level of: Organisation Chart','No existing version. New major version of Top Level of: Organisation Chart','TEST',1,0,0),(97,'Top Level of: My Company / Last Viewed','No existing version. New major version of Top Level of: My Company / Last Viewed','TEST',1,0,0),(98,'Top Level of: All Notifications','No existing version. New major version of Top Level of: All Notifications','TEST',1,0,0),(99,'Top Level of: New Employments','No existing version. New major version of Top Level of: New Employments','TEST',1,0,0),(100,'Top Level of: Terminations','No existing version. New major version of Top Level of: Terminations','TEST',1,0,0),(101,'Top Level of: Quick Links','No existing version. New major version of Top Level of: Quick Links','TEST',1,0,0),(102,'Top Level of: User Avatar','No existing version. New major version of Top Level of: User Avatar','TEST',1,0,0),(103,'Top Level of: Main Menu','No existing version. New major version of Top Level of: Main Menu','TEST',1,0,0),(104,'Top Level of: Main Menu - Payroll','No existing version. New major version of Top Level of: Main Menu - Payroll','TEST',1,0,0),(105,'Top Level of: Employee List','No existing version. New major version of Top Level of: Employee List','TEST',1,0,0),(106,'Top Level of: Documents','No existing version. New major version of Top Level of: Documents','TEST',1,0,0),(107,'Top Level of: Employee Others','No existing version. New major version of Top Level of: Employee Others','TEST',1,0,0),(108,'Top Level of: Payroll','No existing version. New major version of Top Level of: Payroll','TEST',1,0,0),(109,'Top Level of: Payroll Statistics','No existing version. New major version of Top Level of: Payroll Statistics','TEST',1,0,0),(110,'Top Level of: Absence Statistics','No existing version. New major version of Top Level of: Absence Statistics','TEST',1,0,0),(111,'Top Level of: Reports','No existing version. New major version of Top Level of: Reports','TEST',1,0,0),(112,'Top Level of: Monthly Reports','No existing version. New major version of Top Level of: Monthly Reports','TEST',1,0,0),(113,'Top Level of: Yearly Reports','No existing version. New major version of Top Level of: Yearly Reports','TEST',1,0,0),(114,'Top Level of: Bulk Updates','No existing version. New major version of Top Level of: Bulk Updates','TEST',1,0,0),(115,'Top Level of: Settings','No existing version. New major version of Top Level of: Settings','TEST',1,0,0);
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

-- Dump completed on 2021-05-17 14:54:29
