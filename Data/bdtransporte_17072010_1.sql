-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema bdtransporte
--

CREATE DATABASE IF NOT EXISTS bdtransporte;
USE bdtransporte;

--
-- Definition of table `tacceso`
--

DROP TABLE IF EXISTS `tacceso`;
CREATE TABLE `tacceso` (
  `cid_usuario` varchar(20) NOT NULL,
  `cid_objeto` varchar(3) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tacceso`
--

/*!40000 ALTER TABLE `tacceso` DISABLE KEYS */;
INSERT INTO `tacceso` (`cid_usuario`,`cid_objeto`) VALUES 
 ('P','001'),
 ('P','002'),
 ('P','003'),
 ('P','004'),
 ('P','010'),
 ('P','011'),
 ('ADMIN','001'),
 ('ADMIN','002'),
 ('ADMIN','003'),
 ('ADMIN','004'),
 ('ADMIN','005'),
 ('ADMIN','006'),
 ('ADMIN','007'),
 ('ADMIN','008'),
 ('ADMIN','009'),
 ('ADMIN','010'),
 ('ADMIN','011');
/*!40000 ALTER TABLE `tacceso` ENABLE KEYS */;


--
-- Definition of table `tacceso_suc`
--

DROP TABLE IF EXISTS `tacceso_suc`;
CREATE TABLE `tacceso_suc` (
  `cid_usuario` varchar(20) NOT NULL,
  `cid_sucursal` varchar(2) NOT NULL,
  `crutaspc` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tacceso_suc`
--

/*!40000 ALTER TABLE `tacceso_suc` DISABLE KEYS */;
INSERT INTO `tacceso_suc` (`cid_usuario`,`cid_sucursal`,`crutaspc`) VALUES 
 ('P','01','C:/DataSpc/OficinaP/Cobranzas/CobDatos'),
 ('P','02','C:/DataSpc/Valencia/Cobranzas/CobDatos');
/*!40000 ALTER TABLE `tacceso_suc` ENABLE KEYS */;


--
-- Definition of table `talmacenista`
--

DROP TABLE IF EXISTS `talmacenista`;
CREATE TABLE `talmacenista` (
  `cid_almacenista` varchar(9) NOT NULL,
  `cnombre` varchar(60) NOT NULL,
  `cficha_nom` varchar(10) NOT NULL,
  `nid_sucursal` int(4) unsigned NOT NULL,
  `nactivo` tinyint(1) unsigned NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid_almacenista`),
  KEY `FK_talmacenista_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_talmacenista_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talmacenista`
--

/*!40000 ALTER TABLE `talmacenista` DISABLE KEYS */;
INSERT INTO `talmacenista` (`cid_almacenista`,`cnombre`,`cficha_nom`,`nid_sucursal`,`nactivo`,`cid_usuario`,`dfecha_act`) VALUES 
 ('1','ALMACENISTA 1','1',1,1,'P','2010-07-14 17:12:18'),
 ('2','ALMACENISTA 2','2',2,1,'P','2010-07-14 15:48:27'),
 ('3','ALMACENISTA 3','3',3,1,'P','2010-07-14 15:49:31'),
 ('4','ALMACENISTA 4','4',4,1,'P','2010-07-14 15:50:03'),
 ('5','ALMACENISTA 5','5',5,1,'P','2010-07-14 16:03:15');
/*!40000 ALTER TABLE `talmacenista` ENABLE KEYS */;


--
-- Definition of trigger `tgtalmacenista_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtalmacenista_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtalmacenista_insert` AFTER INSERT ON `talmacenista` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('talmacenista','I',New.cId_Usuario,now(),new.cid_almacenista);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtalmacenista_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtalmacenista_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtalmacenista_update` AFTER UPDATE ON `talmacenista` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('talmacenista','U',New.cId_Usuario,now(),new.cid_almacenista);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtalmacenista_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtalmacenista_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtalmacenista_delete` BEFORE DELETE ON `talmacenista` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('talmacenista','D',OLD.cId_Usuario,now(),OLD.cid_almacenista);
End $$

DELIMITER ;

--
-- Definition of table `tanticipo`
--

DROP TABLE IF EXISTS `tanticipo`;
CREATE TABLE `tanticipo` (
  `nid_anticipo` int(10) unsigned NOT NULL auto_increment,
  `cnro_recibo` varchar(10) NOT NULL,
  `nmonto` double NOT NULL,
  `nid_viaje` int(10) unsigned NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cobservacion` text,
  `dfecha` date NOT NULL,
  PRIMARY KEY  (`nid_anticipo`),
  KEY `FK_tanticipo_tviaje` (`nid_viaje`),
  CONSTRAINT `FK_tanticipo_tviaje` FOREIGN KEY (`nid_viaje`) REFERENCES `tviaje` (`nid_viaje`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo`
--

/*!40000 ALTER TABLE `tanticipo` DISABLE KEYS */;
INSERT INTO `tanticipo` (`nid_anticipo`,`cnro_recibo`,`nmonto`,`nid_viaje`,`cid_usuario`,`dfecha_act`,`cobservacion`,`dfecha`) VALUES 
 (1,'1111',1000,1,'p','2010-07-15 17:11:12',NULL,'2010-07-15'),
 (2,'2222',2000,2,'p','2010-07-15 17:21:32',NULL,'2010-07-15'),
 (3,'R7777',70,4,'','2010-07-16 11:28:14',NULL,'0000-00-00');
/*!40000 ALTER TABLE `tanticipo` ENABLE KEYS */;


--
-- Definition of trigger `tgtanticipo_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtanticipo_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtanticipo_insert` AFTER INSERT ON `tanticipo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tAnticipo','I',New.cId_Usuario,now(),cast(new.nid_anticipo as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtanticipo_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtanticipo_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtanticipo_update` AFTER UPDATE ON `tanticipo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tAnticipo','U',New.cId_Usuario,now(),cast(new.nid_anticipo as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtanticipo_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtanticipo_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtanticipo_delete` BEFORE DELETE ON `tanticipo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tAnticipo','D',Old.cId_Usuario,now(),cast(Old.nid_anticipo as char));
End $$

DELIMITER ;

--
-- Definition of table `tbitacora`
--

DROP TABLE IF EXISTS `tbitacora`;
CREATE TABLE `tbitacora` (
  `nid_bitacora` int(10) unsigned NOT NULL auto_increment,
  `ctabla` varchar(20) NOT NULL,
  `coperacion` varchar(1) NOT NULL default '' COMMENT 'I:Insert   U:Update   D:Delete\r\n',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha` datetime NOT NULL,
  `cregistro` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`nid_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbitacora`
--

/*!40000 ALTER TABLE `tbitacora` DISABLE KEYS */;
INSERT INTO `tbitacora` (`nid_bitacora`,`ctabla`,`coperacion`,`cid_usuario`,`dfecha`,`cregistro`) VALUES 
 (1,'tEstado','I','p','2010-06-09 09:48:54','90'),
 (2,'tEstado','U','p','2010-06-09 09:49:58','90'),
 (3,'tEstado','D','p','2010-06-09 09:52:11','90'),
 (4,'tEstado','U','P','2010-06-09 09:52:55','99'),
 (5,'tEstado','D','P','2010-06-09 09:53:08','99'),
 (6,'tEstado','I','P','2010-06-09 09:53:24','99'),
 (7,'tEstado','D','P','2010-06-09 09:53:34','99'),
 (8,'tEstado','D','P','2010-06-09 09:53:39','91'),
 (9,'tAnticipo','I','p','2010-06-09 10:10:57','1'),
 (10,'tAnticipo','U','p','2010-06-09 10:31:02','1'),
 (11,'tAnticipo','D','p','2010-06-09 10:31:33','1'),
 (12,'tEstado','I','P','2010-06-11 15:35:22','55'),
 (13,'tEstado','U','P','2010-06-11 15:35:34','55'),
 (14,'tEstado','D','P','2010-06-11 15:35:49','55'),
 (15,'tCiudad','I','P','2010-06-11 16:54:42','0105'),
 (16,'tCiudad','U','P','2010-06-11 16:54:49','0105'),
 (17,'tCiudad','D','P','2010-06-11 16:54:56','0105'),
 (18,'torigen_destino','I','P','2010-06-11 16:55:36','7'),
 (19,'tsucursal','I','P','2010-06-11 16:55:36','7'),
 (20,'tsucursal','U','P','2010-06-11 16:59:16','7'),
 (21,'torigen_destino','U','P','2010-06-11 17:14:39','7'),
 (22,'tsucursal','U','P','2010-06-11 17:14:39','7'),
 (23,'ttipo_gasto','I','P','2010-06-11 17:34:51','01'),
 (24,'ttipo_gasto','I','P','2010-06-11 17:35:03','02'),
 (25,'ttipo_gasto','I','P','2010-06-11 17:35:14','03'),
 (26,'ttipo_gasto','I','P','2010-06-11 17:35:20','23'),
 (27,'ttipo_gasto','U','P','2010-06-11 17:35:26','23'),
 (28,'ttipo_gasto','D','P','2010-06-11 17:35:28','23'),
 (29,'tgrupo_servicio','I','P','2010-06-11 17:36:16','01'),
 (30,'tgrupo_servicio','I','P','2010-06-11 17:36:24','02'),
 (31,'tgrupo_servicio','I','P','2010-06-11 17:36:35','03'),
 (32,'tgrupo_servicio','I','P','2010-06-11 17:37:06','98'),
 (33,'tgrupo_servicio','U','P','2010-06-11 17:37:23','98'),
 (34,'tgrupo_servicio','D','P','2010-06-11 17:37:26','98'),
 (35,'tservicio','I','P','2010-06-11 17:40:42','001'),
 (36,'tservicio','I','P','2010-06-11 17:41:19','002'),
 (37,'tservicio','I','P','2010-06-11 17:42:27','003'),
 (38,'tservicio','I','P','2010-06-11 17:42:46','004'),
 (39,'tservicio','D','P','2010-06-11 17:42:54','004'),
 (40,'tChofer','I','P','2010-06-12 10:19:26','17328112'),
 (41,'tChofer','U','P','2010-06-12 10:19:41','17328112'),
 (42,'tChofer','I','P','2010-06-12 10:19:56','321321'),
 (43,'tChofer','U','P','2010-06-12 10:20:02','321321'),
 (44,'tChofer','D','P','2010-06-12 10:20:05','321321'),
 (45,'tChofer','D','P','2010-06-12 10:20:09','17328112'),
 (46,'tChofer','I','P','2010-06-12 10:20:31','11111111'),
 (47,'tChofer','I','P','2010-06-12 10:20:54','22222222'),
 (48,'torigen_destino','U','P','2010-06-14 09:06:29','1'),
 (49,'tsucursal','U','P','2010-06-14 09:06:29','1'),
 (50,'torigen_destino','U','P','2010-06-14 09:06:56','2'),
 (51,'tsucursal','U','P','2010-06-14 09:06:56','2'),
 (52,'torigen_destino','U','P','2010-06-14 09:08:55','3'),
 (53,'tsucursal','U','P','2010-06-14 09:08:55','3'),
 (54,'torigen_destino','U','P','2010-06-14 09:09:09','2'),
 (55,'tsucursal','U','P','2010-06-14 09:09:09','2'),
 (56,'torigen_destino','U','P','2010-06-14 09:09:44','4'),
 (57,'tsucursal','U','P','2010-06-14 09:09:44','4'),
 (58,'torigen_destino','U','P','2010-06-14 09:10:09','5'),
 (59,'tsucursal','U','P','2010-06-14 09:10:09','5'),
 (60,'torigen_destino','U','P','2010-06-14 09:11:00','1'),
 (61,'tsucursal','U','P','2010-06-14 09:11:00','1'),
 (62,'torigen_destino','U','P','2010-06-14 09:12:00','6'),
 (63,'tsucursal','U','P','2010-06-14 09:12:00','6'),
 (64,'tChofer','I','P','2010-06-17 09:24:12','3'),
 (65,'tChofer','U','P','2010-06-17 09:32:24','3'),
 (66,'tChofer','D','P','2010-06-17 09:32:48','3'),
 (67,'tvehiculo','I','P','2010-06-17 11:46:46','1'),
 (68,'tvehiculo','I','P','2010-06-17 11:47:26','2'),
 (69,'tvehiculo','U','P','2010-06-17 11:47:39','2'),
 (70,'tvehiculo','D','P','2010-06-17 11:47:44','2'),
 (71,'tPeriodo','I','P','2010-06-17 11:53:02','15061407'),
 (72,'tperiodo','U','P','2010-06-17 11:53:18','15061407'),
 (73,'truta','I','p','2010-07-12 09:56:00','11'),
 (74,'truta','I','p','2010-07-12 09:57:35','23'),
 (75,'truta','U','p','2010-07-12 09:57:35','11'),
 (76,'truta','I','p','2010-07-12 09:59:29','21'),
 (77,'truta','I','p','2010-07-12 09:59:29','13'),
 (78,'torigen_destino','U','P','2010-07-12 18:06:27','1'),
 (79,'torigen_destino','U','P','2010-07-12 18:06:53','2'),
 (80,'torigen_destino','U','P','2010-07-12 18:07:03','6'),
 (81,'tCiudad','I','P','2010-07-13 09:47:07','80'),
 (82,'tCiudad','U','P','2010-07-13 09:47:18','80'),
 (83,'tCiudad','D','P','2010-07-13 10:04:06','80'),
 (84,'tCiudad','I','P','2010-07-13 10:04:33','666'),
 (85,'tCiudad','U','P','2010-07-13 10:04:41','666'),
 (86,'tCiudad','D','P','2010-07-13 10:04:53','666'),
 (87,'tCiudad','I','P','2010-07-13 10:28:25','999'),
 (88,'tCiudad','D','P','2010-07-13 10:28:35','999'),
 (89,'tCiudad','I','P','2010-07-13 10:31:20','9999'),
 (90,'tCiudad','U','P','2010-07-13 10:31:29','9999'),
 (91,'tCiudad','D','P','2010-07-13 10:31:35','9999'),
 (92,'tCiudad','I','P','2010-07-13 10:54:46','666'),
 (93,'tCiudad','U','P','2010-07-13 10:54:53','666'),
 (94,'tCiudad','D','P','2010-07-13 10:55:01','666'),
 (95,'tChofer','U','P','2010-07-13 11:10:29','22222222'),
 (96,'tChofer','I','P','2010-07-13 11:10:42','321'),
 (97,'tChofer','D','P','2010-07-13 11:10:45','321'),
 (98,'tChofer','D','P','2010-07-13 11:10:59','11111111'),
 (99,'tChofer','D','P','2010-07-13 11:11:01','22222222'),
 (100,'tChofer','I','P','2010-07-13 11:11:23','1'),
 (101,'torigen_destino','U','P','2010-07-13 15:41:54','1'),
 (102,'tsucursal','U','P','2010-07-13 15:41:54','1'),
 (103,'torigen_destino','I','P','2010-07-13 15:43:11','8'),
 (104,'tsucursal','I','P','2010-07-13 15:43:11','8'),
 (105,'torigen_destino','U','P','2010-07-13 15:56:12','8'),
 (106,'tsucursal','U','P','2010-07-13 15:56:12','8'),
 (107,'torigen_destino','D','P','2010-07-13 15:57:09','8'),
 (108,'tsucursal','U','P','2010-07-13 15:57:26','8'),
 (109,'torigen_destino','I','P','2010-07-13 17:36:27','9'),
 (110,'tsucursal','I','P','2010-07-13 17:36:27','9'),
 (111,'torigen_destino','U','P','2010-07-13 17:36:56','9'),
 (112,'tsucursal','U','P','2010-07-13 17:36:56','9'),
 (113,'torigen_destino','I','P','2010-07-13 17:39:15','10'),
 (114,'torigen_destino','I','P','2010-07-13 17:39:36','11'),
 (115,'tsucursal','I','P','2010-07-13 17:39:36','10'),
 (116,'torigen_destino','U','P','2010-07-13 17:40:23','11'),
 (117,'tsucursal','U','P','2010-07-13 17:40:23','10'),
 (118,'tvehiculo','D','P','2010-07-14 09:27:34','1'),
 (119,'tvehiculo','I','P','2010-07-14 09:59:11','A123'),
 (120,'tvehiculo','U','P','2010-07-14 09:59:16','A123'),
 (121,'tvehiculo','U','P','2010-07-14 09:59:24','A123'),
 (122,'tvehiculo','I','P','2010-07-14 09:59:40','3DF21G'),
 (123,'tvehiculo','D','P','2010-07-14 10:00:11','3DF21G'),
 (124,'tvehiculo','D','P','2010-07-14 10:00:21','A123'),
 (125,'tvehiculo','I','P','2010-07-14 10:02:05','V1'),
 (126,'tvehiculo','D','P','2010-07-14 10:03:33','V1'),
 (127,'tCiudad','U','P','2010-07-14 11:13:32','0101'),
 (128,'tCiudad','U','P','2010-07-14 11:13:45','0701'),
 (129,'tCiudad','U','P','2010-07-14 11:14:04','1702'),
 (130,'tCiudad','U','P','2010-07-14 11:14:38','1703'),
 (131,'tCiudad','U','P','2010-07-14 11:14:58','1703'),
 (132,'tCiudad','U','P','2010-07-14 11:15:21','1703'),
 (133,'tvehiculo','I','P','2010-07-14 15:31:43','V1'),
 (134,'tvehiculo','U','P','2010-07-14 15:32:05','V1'),
 (135,'tvehiculo','U','P','2010-07-14 15:32:11','V1'),
 (136,'tvehiculo','I','P','2010-07-14 15:32:40','V2'),
 (137,'tvehiculo','I','P','2010-07-14 15:32:59','S3D21F'),
 (138,'tvehiculo','D','P','2010-07-14 15:33:03','S3D21F'),
 (139,'tvehiculo','I','P','2010-07-14 15:34:16','V3'),
 (140,'tvehiculo','I','P','2010-07-14 15:35:14','V4'),
 (141,'tvehiculo','I','P','2010-07-14 15:36:08','V5'),
 (142,'tvehiculo','I','P','2010-07-14 15:36:35','V6'),
 (143,'talmacenista','U','P','2010-07-14 17:12:15','1'),
 (144,'talmacenista','U','P','2010-07-14 17:12:18','1'),
 (145,'talmacenista','I','P','2010-07-14 17:12:32','321'),
 (146,'talmacenista','D','P','2010-07-14 17:12:39','321'),
 (147,'truta','U','P','2010-07-14 17:21:45','11'),
 (148,'truta','U','P','2010-07-14 17:23:33','13'),
 (149,'truta','U','P','2010-07-14 17:30:19','21'),
 (150,'truta','U','P','2010-07-14 17:30:25','23'),
 (151,'truta','U','P','2010-07-14 17:38:22','23'),
 (152,'truta','U','P','2010-07-14 17:38:31','23'),
 (153,'truta','U','P','2010-07-14 17:41:28','11'),
 (154,'truta','U','P','2010-07-14 17:41:31','11'),
 (155,'truta','U','P','2010-07-14 17:53:11','23'),
 (156,'truta','U','P','2010-07-14 18:07:57','11'),
 (157,'truta','U','P','2010-07-14 18:08:04','11'),
 (158,'truta','I','P','2010-07-14 18:22:46','64'),
 (159,'truta','U','P','2010-07-14 18:22:56','64'),
 (160,'truta','U','P','2010-07-14 18:23:07','64'),
 (161,'truta','U','P','2010-07-14 18:23:16','64'),
 (162,'truta','I','P','2010-07-14 18:23:28','22'),
 (163,'tChofer','I','P','2010-07-15 15:28:21','1'),
 (164,'tChofer','D','P','2010-07-15 15:28:47','1'),
 (165,'truta','U','P','2010-07-15 15:42:34','11'),
 (166,'truta','U','P','2010-07-15 15:42:42','13'),
 (167,'truta','U','P','2010-07-15 15:42:50','21'),
 (168,'truta','I','P','2010-07-15 15:43:07','14'),
 (169,'truta','I','P','2010-07-15 16:51:15','12'),
 (170,'tviaje','I','p','2010-07-15 16:55:19','1'),
 (171,'tAnticipo','I','p','2010-07-15 17:11:12','1'),
 (172,'tChofer','I','P','2010-07-15 17:20:47','2'),
 (173,'tviaje','I','p','2010-07-15 17:21:01','2'),
 (174,'tAnticipo','I','p','2010-07-15 17:21:32','2'),
 (175,'tviaje','I','p','2010-07-16 11:12:43','3'),
 (176,'tChofer','I','P','2010-07-16 11:17:40','3'),
 (177,'tChofer','I','P','2010-07-16 11:17:56','4'),
 (178,'tChofer','I','P','2010-07-16 11:18:33','5'),
 (179,'tvehiculo','U','P','2010-07-16 11:22:33','V1'),
 (180,'tvehiculo','U','P','2010-07-16 11:22:47','V2'),
 (181,'tvehiculo','U','P','2010-07-16 11:23:12','V4'),
 (182,'tvehiculo','U','P','2010-07-16 11:23:24','V5'),
 (183,'tvehiculo','U','P','2010-07-16 11:23:37','V3'),
 (184,'tvehiculo','U','P','2010-07-16 11:23:52','V6'),
 (185,'tviaje','I','p','2010-07-16 11:28:14','4'),
 (186,'tAnticipo','I','','2010-07-16 11:28:14','3'),
 (187,'torigen_destino','U','P','2010-07-16 14:31:32','5'),
 (188,'torigen_destino','U','P','2010-07-16 14:31:42','5');
/*!40000 ALTER TABLE `tbitacora` ENABLE KEYS */;


--
-- Definition of table `tchofer`
--

DROP TABLE IF EXISTS `tchofer`;
CREATE TABLE `tchofer` (
  `cid_chofer` varchar(9) NOT NULL,
  `cnombre` varchar(60) NOT NULL default '',
  `ccontraparte` varchar(10) default NULL,
  `cficha_nom` varchar(10) default NULL,
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `lcontratado` tinyint(1) unsigned NOT NULL,
  `nactvo` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`cid_chofer`,`nid_sucursal`),
  KEY `FK_tchofer_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tchofer`
--

/*!40000 ALTER TABLE `tchofer` DISABLE KEYS */;
INSERT INTO `tchofer` (`cid_chofer`,`cnombre`,`ccontraparte`,`cficha_nom`,`nid_sucursal`,`cid_usuario`,`dfecha_act`,`lcontratado`,`nactvo`) VALUES 
 ('1','CHOFER OP','1','1',1,'P','2010-07-13 11:11:23',0,1),
 ('2','CHOFER C. OCCIDENTE','2','2',6,'P','2010-07-15 17:20:47',0,1),
 ('3','CHOFER VALENCIA','3','3',2,'P','2010-07-16 11:17:40',0,1),
 ('4','CHOFER BARCELONA','4','4',4,'P','2010-07-16 11:17:56',0,1),
 ('5','CHOFER MARACAIBO','5','5',5,'P','2010-07-16 11:18:33',0,1);
/*!40000 ALTER TABLE `tchofer` ENABLE KEYS */;


--
-- Definition of trigger `tgtchofer_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtchofer_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtchofer_insert` AFTER INSERT ON `tchofer` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tChofer','I',New.cId_Usuario,now(),new.cid_chofer);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtchofer_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtchofer_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtchofer_update` AFTER UPDATE ON `tchofer` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tChofer','U',New.cId_Usuario,now(),new.cid_chofer);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtchofer_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtchofer_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtchofer_delete` BEFORE DELETE ON `tchofer` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tChofer','D',OLD.cId_Usuario,now(),OLD.cid_chofer);
End $$

DELIMITER ;

--
-- Definition of table `tciudad`
--

DROP TABLE IF EXISTS `tciudad`;
CREATE TABLE `tciudad` (
  `cid_ciudad` varchar(4) NOT NULL default '',
  `cdescripcion` varchar(60) NOT NULL,
  `cid_estado` varchar(2) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid_ciudad`),
  KEY `FK_tciudad_testado` (`cid_estado`),
  CONSTRAINT `FK_tciudad_testado` FOREIGN KEY (`cid_estado`) REFERENCES `testado` (`cid_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tciudad`
--

/*!40000 ALTER TABLE `tciudad` DISABLE KEYS */;
INSERT INTO `tciudad` (`cid_ciudad`,`cdescripcion`,`cid_estado`,`cid_usuario`,`dfecha_act`) VALUES 
 ('0101','Puerto Ayacucho','01','P','2010-07-14 11:13:32'),
 ('0201','Barcelona','02','P01','2010-02-04 11:02:58'),
 ('0301','San Fernando de Apure','03','P01','2010-02-04 11:03:14'),
 ('0401','Maracay','04','P01','2010-02-04 11:03:30'),
 ('0501','Barinas','05','P01','2010-02-04 11:03:48'),
 ('0601','Ciudad Bolívar','06','P01','2010-02-04 11:04:14'),
 ('0701','Valencia','07','P','2010-07-14 11:13:45'),
 ('0801','San Carlos','08','P01','2010-02-04 11:04:48'),
 ('0901','Tucupita','09','P01','2010-02-04 11:05:03'),
 ('1001','Coro','10','P01','2010-02-04 11:05:23'),
 ('1101','San Juan de Los Morros','11','P01','2010-02-04 11:05:52'),
 ('1201','Barquisimeto','12','P01','2010-02-04 11:06:16'),
 ('1301','Mérida','13','P01','2010-02-04 11:06:30'),
 ('1401','Los Teques','14','P01','2010-02-04 11:06:44'),
 ('1501','Maturin','15','P01','2010-02-04 11:07:03'),
 ('1601','La Asunción','16','P01','2010-02-04 11:07:16'),
 ('1701','Guanare','17','P01','2010-02-04 11:07:31'),
 ('1702','Acarigua','17','P','2010-07-14 11:14:04'),
 ('1703','ARAURE','17','P','2010-07-14 11:15:21'),
 ('1801','Cumaná','18','P01','2010-02-04 11:08:03'),
 ('1901','San Cristóbal','19','P01','2010-02-04 11:08:53'),
 ('2001','Trujillo','20','P01','2010-02-04 11:09:11'),
 ('2101','La Guaira','21','P01','2010-02-04 11:09:26'),
 ('2201','San Felipe','22','P01','2010-02-04 11:09:39'),
 ('2301','Maracaibo','23','P01','2010-02-04 11:09:52'),
 ('2401','Caracas','24','P01','2010-02-04 11:10:06');
/*!40000 ALTER TABLE `tciudad` ENABLE KEYS */;


--
-- Definition of trigger `tgtciudad_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtciudad_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtciudad_insert` AFTER INSERT ON `tciudad` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tCiudad','I',New.cId_Usuario,now(),new.cid_ciudad);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtciudad_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtciudad_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtciudad_update` AFTER UPDATE ON `tciudad` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tCiudad','U',New.cId_Usuario,now(),new.cid_ciudad);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtciudad_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtciudad_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtciudad_delete` BEFORE DELETE ON `tciudad` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tCiudad','D',OLD.cId_Usuario,now(),OLD.cid_ciudad);
End $$

DELIMITER ;

--
-- Definition of table `tdetalle_anticipo`
--

DROP TABLE IF EXISTS `tdetalle_anticipo`;
CREATE TABLE `tdetalle_anticipo` (
  `nid_anticipo` int(10) unsigned NOT NULL,
  `cid_tipogasto` varchar(2) NOT NULL,
  `cnro_factura` varchar(20) NOT NULL,
  `nmonto` double NOT NULL,
  KEY `FK_tdet_ant_ttipogasto` (`cid_tipogasto`),
  KEY `ix_anticipo` (`nid_anticipo`),
  CONSTRAINT `FK_tdet_ant_tanticipo` FOREIGN KEY (`nid_anticipo`) REFERENCES `tanticipo` (`nid_anticipo`),
  CONSTRAINT `FK_tdet_ant_ttipogasto` FOREIGN KEY (`cid_tipogasto`) REFERENCES `ttipo_gasto` (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_anticipo`
--

/*!40000 ALTER TABLE `tdetalle_anticipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdetalle_anticipo` ENABLE KEYS */;


--
-- Definition of table `tdetalle_gasto`
--

DROP TABLE IF EXISTS `tdetalle_gasto`;
CREATE TABLE `tdetalle_gasto` (
  `nid_gasto` int(10) unsigned NOT NULL default '0',
  `cid_vehiculo` varchar(10) NOT NULL,
  `cid_servicio` varchar(3) NOT NULL,
  `ncantidad` int(10) unsigned NOT NULL,
  `nprecio` double NOT NULL,
  `ndescuento` double NOT NULL,
  KEY `FK_tdet_gast_tgasto` (`nid_gasto`),
  KEY `FK_tdet_gast_tvehiculo` (`cid_vehiculo`),
  KEY `FK_tdet_gast_tservicio` (`cid_servicio`),
  CONSTRAINT `FK_tdet_gast_tgasto` FOREIGN KEY (`nid_gasto`) REFERENCES `tgasto_serv` (`nid_gasto`),
  CONSTRAINT `FK_tdet_gast_tservicio` FOREIGN KEY (`cid_servicio`) REFERENCES `tservicio` (`cid_servicio`),
  CONSTRAINT `FK_tdet_gast_tvehiculo` FOREIGN KEY (`cid_vehiculo`) REFERENCES `tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_gasto`
--

/*!40000 ALTER TABLE `tdetalle_gasto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdetalle_gasto` ENABLE KEYS */;


--
-- Definition of table `testado`
--

DROP TABLE IF EXISTS `testado`;
CREATE TABLE `testado` (
  `cid_estado` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL default '',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testado`
--

/*!40000 ALTER TABLE `testado` DISABLE KEYS */;
INSERT INTO `testado` (`cid_estado`,`cdescripcion`,`cid_usuario`,`dfecha_act`) VALUES 
 ('01','Amazonas','P01','2010-02-04 10:40:40'),
 ('02','Anzoátegui','P01','2010-02-04 10:40:57'),
 ('03','APURE','P','2010-05-14 11:51:46'),
 ('04','Aragua','P01','2010-02-04 10:41:21'),
 ('05','Barinas','P01','2010-02-04 10:41:51'),
 ('06','Bolívar','P01','2010-02-04 10:42:05'),
 ('07','Carabobo','P01','2010-02-04 10:42:19'),
 ('08','COJEDES','P','2010-02-05 10:31:42'),
 ('09','Delta Amacuro','P01','2010-02-04 10:42:43'),
 ('10','Falcón','P01','2010-02-04 10:42:56'),
 ('11','Guárico','P01','2010-02-04 10:43:08'),
 ('12','Lara','P01','2010-02-04 10:43:27'),
 ('13','Mérida','P01','2010-02-04 10:43:37'),
 ('14','Miranda','P01','2010-02-04 10:43:48'),
 ('15','Monagas','P01','2010-02-04 10:44:00'),
 ('16','Nueva Esparta','P01','2010-02-04 10:44:11'),
 ('17','Portuguesa','P01','2010-02-04 10:44:25'),
 ('18','Sucre','P01','2010-02-04 10:44:36'),
 ('19','Táchira','P01','2010-02-04 10:44:45'),
 ('20','Trujillo','P01','2010-02-04 10:44:57'),
 ('21','Vargas','P01','2010-02-04 10:45:08'),
 ('22','Yaracuy','P01','2010-02-04 10:45:18'),
 ('23','Zulia','P01','2010-02-04 10:45:28'),
 ('24','Distrito Capital','P01','2010-02-04 10:45:39');
/*!40000 ALTER TABLE `testado` ENABLE KEYS */;


--
-- Definition of trigger `tgtestado_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtestado_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtestado_insert` AFTER INSERT ON `testado` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tEstado','I',New.cId_Usuario,now(),new.cid_estado);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtestado_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtestado_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtestado_update` AFTER UPDATE ON `testado` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tEstado','U',New.cId_Usuario,now(),new.cid_estado);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtestado_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtestado_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtestado_delete` BEFORE DELETE ON `testado` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tEstado','D',OLD.cId_Usuario,now(),OLD.cid_estado);
End $$

DELIMITER ;

--
-- Definition of table `tgasto_serv`
--

DROP TABLE IF EXISTS `tgasto_serv`;
CREATE TABLE `tgasto_serv` (
  `nid_gasto` int(10) unsigned NOT NULL default '0',
  `dfecha` date NOT NULL,
  `cfactura` varchar(10) NOT NULL,
  `ntotal` double NOT NULL,
  `crif_emp` varchar(12) default NULL,
  `cnombre_emp` varchar(60) default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  USING BTREE (`nid_gasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tgasto_serv`
--

/*!40000 ALTER TABLE `tgasto_serv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgasto_serv` ENABLE KEYS */;


--
-- Definition of trigger `tgtgasto_serv_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtgasto_serv_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtgasto_serv_insert` AFTER INSERT ON `tgasto_serv` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgasto_serv','I',New.cId_Usuario,now(),cast(new.nid_gasto as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtgasto_serv_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtgasto_serv_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtgasto_serv_update` AFTER UPDATE ON `tgasto_serv` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgasto_serv','U',New.cId_Usuario,now(),cast(new.nid_gasto as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtgasto_serv_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtgasto_serv_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtgasto_serv_delete` BEFORE DELETE ON `tgasto_serv` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgasto_serv','D',Old.cId_Usuario,now(),cast(Old.nid_gasto as char));
End $$

DELIMITER ;

--
-- Definition of table `tgrupo_servicio`
--

DROP TABLE IF EXISTS `tgrupo_servicio`;
CREATE TABLE `tgrupo_servicio` (
  `cid_grupo` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL,
  PRIMARY KEY  (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tgrupo_servicio`
--

/*!40000 ALTER TABLE `tgrupo_servicio` DISABLE KEYS */;
INSERT INTO `tgrupo_servicio` (`cid_grupo`,`cdescripcion`,`cid_usuario`,`dfecha_act`,`ccta_cont`) VALUES 
 ('01','GRUPO 01','P','2010-06-11 17:36:16',''),
 ('02','GRUPO 02','P','2010-06-11 17:36:24',''),
 ('03','GRUPO 03','P','2010-06-11 17:36:35','');
/*!40000 ALTER TABLE `tgrupo_servicio` ENABLE KEYS */;


--
-- Definition of trigger `tgtgrupo_servicio_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtgrupo_servicio_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtgrupo_servicio_insert` AFTER INSERT ON `tgrupo_servicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgrupo_servicio','I',New.cId_Usuario,now(),new.cid_grupo);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtgrupo_servicio_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtgrupo_servicio_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtgrupo_servicio_update` AFTER UPDATE ON `tgrupo_servicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgrupo_servicio','U',New.cId_Usuario,now(),new.cid_grupo);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtgrupo_servicio_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtgrupo_servicio_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtgrupo_servicio_delete` BEFORE DELETE ON `tgrupo_servicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgrupo_servicio','D',OLD.cId_Usuario,now(),OLD.cid_grupo);
End $$

DELIMITER ;

--
-- Definition of table `tobjeto`
--

DROP TABLE IF EXISTS `tobjeto`;
CREATE TABLE `tobjeto` (
  `cid_objeto` varchar(3) NOT NULL,
  `ctipo` varchar(1) NOT NULL COMMENT 'A: Maestro, M: Movimiento, N: Mantenimiento, R: Reporte',
  `cdescripcion` varchar(45) NOT NULL,
  PRIMARY KEY  (`cid_objeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tobjeto`
--

/*!40000 ALTER TABLE `tobjeto` DISABLE KEYS */;
INSERT INTO `tobjeto` (`cid_objeto`,`ctipo`,`cdescripcion`) VALUES 
 ('001','A','ESTADOS'),
 ('002','A','CIUDADES'),
 ('003','A','SUCURSALES'),
 ('004','A','DESTINOS'),
 ('005','A','TIPO DE GASTOS'),
 ('006','A','GRUPOS DE SERVICIOS'),
 ('007','A','SERVICIOS'),
 ('008','A','CHOFERES'),
 ('009','A','VEHICULOS'),
 ('010','N','USUARIOS'),
 ('011','M','ANTICIPO DE VIAJE');
/*!40000 ALTER TABLE `tobjeto` ENABLE KEYS */;


--
-- Definition of table `torigen_destino`
--

DROP TABLE IF EXISTS `torigen_destino`;
CREATE TABLE `torigen_destino` (
  `nid_origdest` int(4) unsigned NOT NULL auto_increment,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_ciudad` varchar(4) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `norigen` tinyint(1) unsigned NOT NULL,
  `nsucursal` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`nid_origdest`),
  KEY `FK_torigdest_tciudad` (`cid_ciudad`),
  CONSTRAINT `FK_torigdest_tciudad` FOREIGN KEY (`cid_ciudad`) REFERENCES `tciudad` (`cid_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torigen_destino`
--

/*!40000 ALTER TABLE `torigen_destino` DISABLE KEYS */;
INSERT INTO `torigen_destino` (`nid_origdest`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`nactivo`,`norigen`,`nsucursal`) VALUES 
 (1,'OFICINA PRINCIPAL','1703','P','2010-07-13 15:41:54',1,1,0),
 (2,'SUCURSAL VALENCIA','0701','P','2010-07-12 18:06:53',0,1,0),
 (3,'SUCURSAL CARACAS','2401','P','2010-06-14 09:08:55',0,0,0),
 (4,'SUCURSAL BARCELONA','0201','P','2010-06-14 09:09:44',0,0,0),
 (5,'SUCURSAL MARACAIBO','2301','P','2010-07-16 14:31:42',0,1,0),
 (6,'SUCURSAL CENTRO OCCIDENTE','1703','P','2010-07-12 18:07:03',0,1,0),
 (7,'AAAAAAAAAAAAAAAAAAA','2101','P','2010-06-11 17:14:39',0,0,0),
 (9,'S3D1AD3','0101','P','2010-07-13 17:36:56',1,1,1),
 (10,'AS321DASD','0101','P','2010-07-13 17:39:15',1,1,0),
 (11,'BBBBBBBBB22222222222','2001','P','2010-07-13 17:40:23',1,1,1);
/*!40000 ALTER TABLE `torigen_destino` ENABLE KEYS */;


--
-- Definition of trigger `tgtorigen_destino_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtorigen_destino_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtorigen_destino_insert` AFTER INSERT ON `torigen_destino` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('torigen_destino','I',New.cId_Usuario,now(),cast(new.nid_origdest as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtorigen_destino_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtorigen_destino_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtorigen_destino_update` AFTER UPDATE ON `torigen_destino` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('torigen_destino','U',New.cId_Usuario,now(),cast(new.nid_origdest as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtorigen_destino_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtorigen_destino_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtorigen_destino_delete` BEFORE DELETE ON `torigen_destino` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('torigen_destino','D',Old.cId_Usuario,now(),cast(Old.nid_origdest as char));
End $$

DELIMITER ;

--
-- Definition of table `tperiodo`
--

DROP TABLE IF EXISTS `tperiodo`;
CREATE TABLE `tperiodo` (
  `cid_periodo` varchar(10) NOT NULL,
  `dfecha_desde` date NOT NULL,
  `dfecha_hasta` date NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nstatus` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`cid_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tperiodo`
--

/*!40000 ALTER TABLE `tperiodo` DISABLE KEYS */;
INSERT INTO `tperiodo` (`cid_periodo`,`dfecha_desde`,`dfecha_hasta`,`cdescripcion`,`cid_usuario`,`dfecha_act`,`nstatus`) VALUES 
 ('15061407','2010-06-17','2010-07-17','JUNIO - JULIO 2010','P','2010-06-17 11:53:18',1);
/*!40000 ALTER TABLE `tperiodo` ENABLE KEYS */;


--
-- Definition of trigger `tgtperiodo_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtperiodo_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtperiodo_insert` AFTER INSERT ON `tperiodo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tPeriodo','I',New.cId_Usuario,now(),new.cid_periodo);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtperiodo_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtperiodo_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtperiodo_update` AFTER UPDATE ON `tperiodo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tperiodo','U',New.cId_Usuario,now(),new.cid_periodo);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtperiodo_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtperiodo_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtperiodo_delete` BEFORE DELETE ON `tperiodo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tperiodo','D',OLD.cId_Usuario,now(),OLD.cid_periodo);
End $$

DELIMITER ;

--
-- Definition of table `truta`
--

DROP TABLE IF EXISTS `truta`;
CREATE TABLE `truta` (
  `nid_origen` int(4) unsigned NOT NULL default '0',
  `nid_destino` int(4) unsigned NOT NULL default '0',
  `ndistancia` double NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cdescripcion` varchar(60) NOT NULL,
  `nactivo` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`nid_origen`,`nid_destino`),
  KEY `FK_truta_tdestino` (`nid_destino`),
  KEY `FK_truta_torigen` (`nid_origen`),
  CONSTRAINT `FK_truta_tdestino` FOREIGN KEY (`nid_destino`) REFERENCES `torigen_destino` (`nid_origdest`),
  CONSTRAINT `FK_truta_torigen` FOREIGN KEY (`nid_origen`) REFERENCES `torigen_destino` (`nid_origdest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `truta`
--

/*!40000 ALTER TABLE `truta` DISABLE KEYS */;
INSERT INTO `truta` (`nid_origen`,`nid_destino`,`ndistancia`,`cid_usuario`,`dfecha_act`,`cdescripcion`,`nactivo`) VALUES 
 (1,1,1000,'P','2010-07-15 15:42:34','RUTA1_111111111111111111111111111111111111111111111111111111',1),
 (1,2,500,'P','2010-07-15 16:51:15','RUTA OP-SUCVAL',1),
 (1,3,50,'P','2010-07-15 15:42:42','ruta1_3',0),
 (2,1,15000,'P','2010-07-15 15:42:50','ruta2_1',1),
 (2,3,200,'P','2010-07-14 17:53:11','ruta2_3',0),
 (6,4,1000,'P','2010-07-14 18:23:16','RUTA COCC - BAR',1);
/*!40000 ALTER TABLE `truta` ENABLE KEYS */;


--
-- Definition of trigger `tgtruta_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtruta_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtruta_insert` AFTER INSERT ON `truta` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('truta','I',New.cId_Usuario,now(),concat(cast(new.nid_origen as char),cast(new.nid_destino as char)));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtruta_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtruta_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtruta_update` AFTER UPDATE ON `truta` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('truta','U',New.cId_Usuario,now(),concat(cast(new.nid_origen as char),cast(new.nid_destino as char)));
End $$

DELIMITER ;

--
-- Definition of table `tservicio`
--

DROP TABLE IF EXISTS `tservicio`;
CREATE TABLE `tservicio` (
  `cid_servicio` varchar(3) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_grupo` varchar(2) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL,
  PRIMARY KEY  (`cid_servicio`),
  KEY `FK_tservicio_tgrupo_s` (`cid_grupo`),
  CONSTRAINT `FK_tservicio_tgrupo_s` FOREIGN KEY (`cid_grupo`) REFERENCES `tgrupo_servicio` (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tservicio`
--

/*!40000 ALTER TABLE `tservicio` DISABLE KEYS */;
INSERT INTO `tservicio` (`cid_servicio`,`cdescripcion`,`cid_grupo`,`cid_usuario`,`dfecha_act`,`ccta_cont`) VALUES 
 ('001','SERVICIO 001','01','P','2010-06-11 17:40:42',''),
 ('002','SERVICIO 002','02','P','2010-06-11 17:41:19',''),
 ('003','SERVICIO 003','03','P','2010-06-11 17:42:27','');
/*!40000 ALTER TABLE `tservicio` ENABLE KEYS */;


--
-- Definition of trigger `tgtservicio_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtservicio_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtservicio_insert` AFTER INSERT ON `tservicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tservicio','I',New.cId_Usuario,now(),new.cid_servicio);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtservicio_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtservicio_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtservicio_update` AFTER UPDATE ON `tservicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tservicio','U',New.cId_Usuario,now(),new.cid_servicio);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtservicio_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtservicio_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtservicio_delete` BEFORE DELETE ON `tservicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tservicio','D',OLD.cId_Usuario,now(),OLD.cid_servicio);
End $$

DELIMITER ;

--
-- Definition of table `tsucursal`
--

DROP TABLE IF EXISTS `tsucursal`;
CREATE TABLE `tsucursal` (
  `nid_sucursal` int(4) unsigned NOT NULL auto_increment,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_ciudad` varchar(4) NOT NULL default '',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ncap_carga` double NOT NULL,
  `nid_origdest` int(4) default '0',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`nid_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

/*!40000 ALTER TABLE `tsucursal` DISABLE KEYS */;
INSERT INTO `tsucursal` (`nid_sucursal`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`ncap_carga`,`nid_origdest`,`nactivo`) VALUES 
 (1,'OFICINA PRINCIPAL','1703','P','2010-07-13 15:41:54',20,1,1),
 (2,'SUCURSAL VALENCIA','0701','P','2010-06-14 09:09:09',20,2,0),
 (3,'SUCURSAL CARACAS','2401','P','2010-06-14 09:08:55',20,3,0),
 (4,'SUCURSAL BARCELONA','0201','P','2010-06-14 09:09:44',20,4,0),
 (5,'SUCURSAL MARACAIBO','2301','P','2010-06-14 09:10:09',69,5,0),
 (6,'SUCURSAL CENTRO OCCIDENTE','1703','P','2010-06-14 09:12:00',40,6,0),
 (7,'AAAAAAAAAAAAAAAAAAA','2101','P','2010-06-11 17:14:39',22222,7,0),
 (8,'HKKKKKKKKKKKK','0101','P','2010-07-13 15:57:26',40000,8,1),
 (9,'S3D1AD3','0101','P','2010-07-13 17:36:56',5000,9,1),
 (10,'BBBBBBBBB22222222222','2001','P','2010-07-13 17:40:23',200,11,1);
/*!40000 ALTER TABLE `tsucursal` ENABLE KEYS */;


--
-- Definition of trigger `tgtSucursal_tOrigen_Insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtSucursal_tOrigen_Insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtSucursal_tOrigen_Insert` BEFORE INSERT ON `tsucursal` FOR EACH ROW Begin
  Insert Into torigen_destino(cDescripcion,cId_Ciudad,cId_Usuario,nOrigen,nactivo,nsucursal) Values(New.cDescripcion,New.cId_Ciudad,New.cId_Usuario,1,new.nactivo,1);
  SET New.nid_origdest=LAST_INSERT_ID();
End $$

DELIMITER ;

--
-- Definition of trigger `tgtsucursal_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtsucursal_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtsucursal_insert` AFTER INSERT ON `tsucursal` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tsucursal','I',New.cId_Usuario,now(),cast(new.nid_sucursal as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtSucursal_tOrigen_Update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtSucursal_tOrigen_Update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtSucursal_tOrigen_Update` BEFORE UPDATE ON `tsucursal` FOR EACH ROW Begin
  update torigen_destino set cDescripcion = New.cDescripcion,cId_Ciudad = New.cId_Ciudad,cId_Usuario = New.cId_Usuario, nactivo = new.nactivo where nid_origdest = new.nid_origdest;
End $$

DELIMITER ;

--
-- Definition of trigger `tgtsucursal_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtsucursal_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtsucursal_update` AFTER UPDATE ON `tsucursal` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tsucursal','U',New.cId_Usuario,now(),cast(new.nid_sucursal as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtsucursal_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtsucursal_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtsucursal_delete` BEFORE DELETE ON `tsucursal` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tsucursal','D',Old.cId_Usuario,now(),cast(Old.nid_sucursal as char));
End $$

DELIMITER ;

--
-- Definition of table `ttipo_gasto`
--

DROP TABLE IF EXISTS `ttipo_gasto`;
CREATE TABLE `ttipo_gasto` (
  `cid_tipogasto` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL,
  PRIMARY KEY  (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttipo_gasto`
--

/*!40000 ALTER TABLE `ttipo_gasto` DISABLE KEYS */;
INSERT INTO `ttipo_gasto` (`cid_tipogasto`,`cdescripcion`,`cid_usuario`,`dfecha_act`,`ccta_cont`) VALUES 
 ('01','GASTOS 1','P','2010-06-11 17:34:51',''),
 ('02','GASTOS 2','P','2010-06-11 17:35:03',''),
 ('03','GASTOS 3','P','2010-06-11 17:35:14','');
/*!40000 ALTER TABLE `ttipo_gasto` ENABLE KEYS */;


--
-- Definition of trigger `tgttipo_gasto_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgttipo_gasto_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgttipo_gasto_insert` AFTER INSERT ON `ttipo_gasto` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttipo_gasto','I',New.cId_Usuario,now(),new.cid_tipogasto);
End $$

DELIMITER ;

--
-- Definition of trigger `tgttipo_gasto_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgttipo_gasto_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgttipo_gasto_update` AFTER UPDATE ON `ttipo_gasto` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttipo_gasto','U',New.cId_Usuario,now(),new.cid_tipogasto);
End $$

DELIMITER ;

--
-- Definition of trigger `tgttipo_gasto_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgttipo_gasto_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgttipo_gasto_delete` BEFORE DELETE ON `ttipo_gasto` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttipo_gasto','D',OLD.cId_Usuario,now(),OLD.cid_tipogasto);
End $$

DELIMITER ;

--
-- Definition of table `tusuario`
--

DROP TABLE IF EXISTS `tusuario`;
CREATE TABLE `tusuario` (
  `cid_usuario` varchar(20) NOT NULL,
  `cnombre` varchar(45) NOT NULL,
  `cid_sucursal` varchar(20) NOT NULL,
  `csucursales` varchar(250) NOT NULL,
  `cclave` varchar(20) NOT NULL,
  PRIMARY KEY  (`cid_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tusuario`
--

/*!40000 ALTER TABLE `tusuario` DISABLE KEYS */;
INSERT INTO `tusuario` (`cid_usuario`,`cnombre`,`cid_sucursal`,`csucursales`,`cclave`) VALUES 
 ('ADMIN','ADMINISTRADOR','01','01,2,3,04','ËÍÉÍÍÈËÉÍ'),
 ('P','PEDRO','02','01,02','¯');
/*!40000 ALTER TABLE `tusuario` ENABLE KEYS */;


--
-- Definition of table `tvehiculo`
--

DROP TABLE IF EXISTS `tvehiculo`;
CREATE TABLE `tvehiculo` (
  `cid_vehiculo` varchar(10) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cmarca` varchar(30) default NULL,
  `cserial_motor` varchar(30) default NULL,
  `cserial_carroc` varchar(30) default NULL,
  `ntara` double default NULL,
  `ncapacidad` double default NULL,
  `ctipo_vehic` varchar(20) default NULL,
  `ncosto` double default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `npropio` int(1) unsigned NOT NULL,
  `nvolumen` double NOT NULL,
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `nid_sucursal` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tvehiculo`
--

/*!40000 ALTER TABLE `tvehiculo` DISABLE KEYS */;
INSERT INTO `tvehiculo` (`cid_vehiculo`,`cdescripcion`,`cmarca`,`cserial_motor`,`cserial_carroc`,`ntara`,`ncapacidad`,`ctipo_vehic`,`ncosto`,`cid_usuario`,`dfecha_act`,`npropio`,`nvolumen`,`nactivo`,`nid_sucursal`) VALUES 
 ('V1','VEHICULO OP1','M1','SM1','SC1',1000,1000,'\"LIVIANO\"',0,'P','2010-07-16 11:22:33',1,0,1,1),
 ('V2','VEHICULO OP2','M2','SM2','SC2',2000,2999,'MEDIANO\"',0,'P','2010-07-16 11:22:47',1,0,1,1),
 ('V3','VEHICULO VALENCIA1','M3','SM3','SC3',3000,3000,'\"PESADO\"',0,'P','2010-07-16 11:23:37',1,0,1,2),
 ('V4','VEHICULO OP3','M4','SM4','SC4',4000,4000,'MEDIANO\"',0,'P','2010-07-16 11:23:12',0,0,1,1),
 ('V5','VEHICULO CARACAS1','M5','SM5','SC5',5000,5000,'\"PESADO\"',0,'P','2010-07-16 11:23:24',1,0,1,3),
 ('V6','VEHICULO BARCELONA1','M6','SM6','SC6',6000,6000,'MEDIANO\"',0,'P','2010-07-16 11:23:52',0,0,1,4);
/*!40000 ALTER TABLE `tvehiculo` ENABLE KEYS */;


--
-- Definition of trigger `tgtvehiculo_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtvehiculo_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtvehiculo_insert` AFTER INSERT ON `tvehiculo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tvehiculo','I',New.cId_Usuario,now(),new.cid_vehiculo);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtvehiculo_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtvehiculo_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtvehiculo_update` AFTER UPDATE ON `tvehiculo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tvehiculo','U',New.cId_Usuario,now(),new.cid_vehiculo);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtvehiculo_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtvehiculo_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtvehiculo_delete` BEFORE DELETE ON `tvehiculo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tvehiculo','D',OLD.cId_Usuario,now(),OLD.cid_vehiculo);
End $$

DELIMITER ;

--
-- Definition of table `tviaje`
--

DROP TABLE IF EXISTS `tviaje`;
CREATE TABLE `tviaje` (
  `nid_viaje` int(10) unsigned NOT NULL auto_increment,
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date default NULL,
  `cobservacion` text,
  `cguia` varchar(10) default NULL,
  `corden_carga` varchar(10) default NULL,
  `dfecha_guia` date default NULL,
  `npeso_neto` double default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nid_origen` int(4) unsigned NOT NULL default '0',
  `nid_destino` int(4) unsigned NOT NULL default '0',
  `cid_periodo` varchar(10) NOT NULL,
  `ntipo_viaje` tinyint(1) unsigned NOT NULL COMMENT '1: Internos de la empresa. 2: Viajes Externos',
  `nid_sucursal_guia` int(4) unsigned default NULL,
  PRIMARY KEY  USING BTREE (`nid_viaje`),
  KEY `FK_tviaje_tchofer` (`cid_chofer`),
  KEY `FK_tviaje_tvehiculo` (`cid_vehiculo`),
  KEY `FK_tviaje_tperiodo` (`cid_periodo`),
  KEY `FK_tviaje_truta` (`nid_origen`,`nid_destino`),
  CONSTRAINT `FK_tviaje_tchofer` FOREIGN KEY (`cid_chofer`) REFERENCES `tchofer` (`cid_chofer`),
  CONSTRAINT `FK_tviaje_tperiodo` FOREIGN KEY (`cid_periodo`) REFERENCES `tperiodo` (`cid_periodo`),
  CONSTRAINT `FK_tviaje_truta` FOREIGN KEY (`nid_origen`, `nid_destino`) REFERENCES `truta` (`nid_origen`, `nid_destino`),
  CONSTRAINT `FK_tviaje_tvehiculo` FOREIGN KEY (`cid_vehiculo`) REFERENCES `tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tviaje`
--

/*!40000 ALTER TABLE `tviaje` DISABLE KEYS */;
INSERT INTO `tviaje` (`nid_viaje`,`cid_chofer`,`cid_vehiculo`,`dfecha`,`cobservacion`,`cguia`,`corden_carga`,`dfecha_guia`,`npeso_neto`,`cid_usuario`,`dfecha_act`,`nid_origen`,`nid_destino`,`cid_periodo`,`ntipo_viaje`,`nid_sucursal_guia`) VALUES 
 (1,'1','V1','2010-07-15',NULL,NULL,NULL,NULL,NULL,'p','2010-07-15 16:55:19',1,2,'15061407',1,NULL),
 (2,'2','V2','2010-07-15',NULL,NULL,NULL,NULL,NULL,'p','2010-07-15 17:21:01',6,4,'15061407',1,NULL),
 (3,'1','V1','2010-07-16',NULL,'111','111','2010-07-13',1200,'p','2010-07-16 11:12:43',1,3,'15061407',1,1),
 (4,'3','V3','2010-07-16',NULL,'77','77','2010-07-01',7000,'p','2010-07-16 11:28:14',2,1,'15061407',0,NULL);
/*!40000 ALTER TABLE `tviaje` ENABLE KEYS */;


--
-- Definition of trigger `tgtviaje_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtviaje_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtviaje_insert` AFTER INSERT ON `tviaje` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tviaje','I',New.cId_Usuario,now(),cast(new.nid_viaje as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtviaje_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtviaje_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtviaje_update` AFTER UPDATE ON `tviaje` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tviaje','U',New.cId_Usuario,now(),cast(new.nid_viaje as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtviaje_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtviaje_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtviaje_delete` BEFORE DELETE ON `tviaje` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tviaje','D',Old.cId_Usuario,now(),cast(Old.nid_viaje as char));
End $$

DELIMITER ;

--
-- Definition of procedure `sp_insert_tviaje_tanticipo`
--

DROP PROCEDURE IF EXISTS `sp_insert_tviaje_tanticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tviaje_tanticipo`(tcid_chofer varchar(9),tcid_vehiculo varchar(10),tcguia varchar(10),tcorden_carga varchar(10),tdfecha_guia date,tnpeso_neto double,tcid_usuario varchar(20),tnid_origen int(4),tnid_destino int(4),tcid_periodo varchar(10),tntipo_viaje tinyint(1),tnid_sucursal_guia int(4),tcnro_recibo varchar(10),tnmonto double,tcobservacion text)
BEGIN
   Declare nError Int(10);
   Start Transaction;

      insert into tviaje (cid_chofer,cid_vehiculo,dfecha,cguia,corden_carga,dfecha_guia,npeso_neto,nid_origen,nid_destino,cid_periodo,ntipo_viaje,nid_sucursal_guia,cid_usuario)
         values(tcid_chofer,tcid_vehiculo,now(),tcguia,tcorden_carga,tdfecha_guia,tnpeso_neto,tnid_origen,tnid_destino,tcid_periodo,tntipo_viaje,tnid_sucursal_guia,tcid_usuario);
      insert into tanticipo (cnro_recibo,nmonto,nid_viaje,dfecha,cobservacion,cid_usuario)
         values (tcnro_recibo,tnmonto,last_insert_id(),now(),tcobservacion,tcid_usuario);


   Set nError =(Select @Error);
   if(nError>0) then
      ROLLBACK;
   else
      COMMIT;
   end if;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
