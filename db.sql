CREATE DATABASE  IF NOT EXISTS `sample`;
USE `sample`;
--
-- Table structure for table `role`
--

--
-- Dumping data for table `role`
--


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
  `first_name` varchar(255) DEFAULT NULL,
  `username` varchar(255),
  `password` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `regdate` varchar(255) DEFAULT NULL,
  
  PRIMARY KEY (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
