-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: office
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Dname` varchar(255) DEFAULT NULL,
  `D_no` int(11) NOT NULL,
  `mgr_ssn` int(255) DEFAULT NULL,
  `mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`D_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Headquarters',1,888665555,'1981-06-19'),('Administration',4,987654321,'1995-01-01'),('Research',5,333445555,'1988-05-22');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `Essn` int(255) DEFAULT NULL,
  `Dependent_name` varchar(255) DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(255) DEFAULT NULL,
  KEY `Essn` (`Essn`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (333445555,'Alice','F','1986-04-05','Daughter'),(333445555,'Theodore','M','1983-10-25','Son'),(123456789,'Alice','F','1988-12-30','Daughter');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_loc`
--

DROP TABLE IF EXISTS `dept_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_loc` (
  `Dnumber` int(11) DEFAULT NULL,
  `Dlocation` varchar(255) DEFAULT NULL,
  KEY `Dnumber` (`Dnumber`),
  CONSTRAINT `dept_loc_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`D_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_loc`
--

LOCK TABLES `dept_loc` WRITE;
/*!40000 ALTER TABLE `dept_loc` DISABLE KEYS */;
INSERT INTO `dept_loc` VALUES (1,'Houston'),(4,'Stafford'),(5,'Belliare'),(5,'Sugarland'),(5,'Houston');
/*!40000 ALTER TABLE `dept_loc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Fname` varchar(255) DEFAULT NULL,
  `Minit` varchar(255) DEFAULT NULL,
  `Lname` varchar(255) DEFAULT NULL,
  `Ssn` int(255) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Super_ssn` int(255) DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','Smith','B',123456789,'1965-01-09','731 Fondren, Houston, TX','M',30000,333445555,5),('Franklin','T','Wong',333445555,'1955-12-08','638 Voss, Houston, TX','M',40000,888665555,5),('James','E','Borg',888665555,'1937-11-10','450 stone, Houston, TX','M',55000,NULL,1),('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring, TX','F',25000,987654321,4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `pname` varchar(255) DEFAULT NULL,
  `pnumber` int(11) NOT NULL,
  `plocation` varchar(255) DEFAULT NULL,
  `dnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES ('ProductX',1,'Belliare',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computarization',10,'Stafford',4),('Reorganisation',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_on` (
  `Essn` int(255) DEFAULT NULL,
  `Pno` int(11) DEFAULT NULL,
  `Hours` float DEFAULT NULL,
  KEY `Essn` (`Essn`),
  KEY `Pno` (`Pno`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `projects` (`pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (123456789,1,32.5),(123456789,2,7.5),(333445555,2,10),(333445555,3,10),(333445555,10,10),(333445555,20,10);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-23  9:58:14
