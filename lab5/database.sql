-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: lab3
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
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` int(11) DEFAULT NULL,
  `Mgr_Start_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  KEY `Mgr_ssn` (`Mgr_ssn`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Headquarters',1,888665555,'1981-06-19'),('Administartion',4,987654321,'1995-01-01'),('Research',5,333445555,'1988-05-22');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `Essn` int(11) DEFAULT NULL,
  `Dependent_name` varchar(255) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Bdate` varchar(255) DEFAULT NULL,
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
INSERT INTO `dependent` VALUES (333445555,'Alice','F','1986-04-05','Daughter'),(123456789,'Alice','F','1988-12-30','Daughter'),(333445555,'Theodore','M','1983-10-25','Son'),(123456789,'Michael','M','1988-01-04','Son'),(333445555,'Joy','F','1958-05-03','Spouse'),(987654321,'Abner','M','1942-02-28','Spouse'),(123456789,'Elizabeth','F','1967-05-05','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int(11) DEFAULT NULL,
  `Dlocation` varchar(255) DEFAULT NULL,
  KEY `Dnumber` (`Dnumber`),
  CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Sugarland'),(5,'Houston');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Fname` varchar(255) DEFAULT NULL,
  `Minit` varchar(1) DEFAULT NULL,
  `Lname` varchar(255) DEFAULT NULL,
  `Ssn` int(11) NOT NULL,
  `Bdate` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Superssn` bigint(20) DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `Dno` (`Dno`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','B','Smith',123456789,'1965-1-09','735 Fondren, Houston, TX','M',30000,333445555,5),('Franklin','T','Wong',333445555,'1955-12-08','638 Vose, Houston, TX','M',40000,888665555,5),('joyce','A','english',453453453,'1972-07-31','5631 Rice,Houstan,TX','F',25000,333445555,5),('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble, TX','M',38000,333445555,5),('James','E','Borg',888665555,'1937-11-10','450 Stone, Houstan, TX','M',55000,NULL,1),('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire, TX','F',43000,888665555,4),('Ahmad','V','jabbar',987987987,'1969-03-29','980 Dallas, Houstan, TX','M',25000,987654321,4),('Alicia','J','Zelaya',999887777,'1968-01-19','3821 Castle, Spring, TX','F',25000,987654321,4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `Pname` varchar(255) DEFAULT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(255) DEFAULT NULL,
  `Dnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `Dnum` (`Dnum`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_on` (
  `Essn` int(11) DEFAULT NULL,
  `Pno` int(11) DEFAULT NULL,
  `Hours` float DEFAULT NULL,
  KEY `Pno` (`Pno`),
  KEY `Essn` (`Essn`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (123456789,1,32.5),(123456789,2,7.5),(666884444,3,40),(453453453,1,20),(453453453,2,20),(333445555,2,10),(333445555,3,10),(333445555,10,10),(333445555,20,10),(999887777,30,30),(999887777,10,10),(987987987,10,35),(987987987,30,5),(987654321,30,20),(987654321,20,15),(888665555,20,NULL);
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

-- Dump completed on 2020-02-23 21:31:21
