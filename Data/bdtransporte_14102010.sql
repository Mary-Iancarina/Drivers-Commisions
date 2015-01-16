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
  `frmalmacenistas` tinyint(1) unsigned default '0',
  `frmanticipo_viaje` tinyint(1) unsigned default '0',
  `frmcargar_anticipo` tinyint(1) unsigned default '0',
  `frmcargar_viaje` tinyint(1) unsigned default '0',
  `frmcargar_viaje_ext` tinyint(1) unsigned default '0',
  `frmchoferes` tinyint(1) unsigned default '0',
  `frmciudades` tinyint(1) unsigned default '0',
  `frmestados` tinyint(1) unsigned default '0',
  `frmgasto_servicio` tinyint(1) unsigned default '0',
  `frmgrupos_serv` tinyint(1) unsigned default '0',
  `frmmontacarguistas` tinyint(1) unsigned default '0',
  `frmorigendestinos` tinyint(1) unsigned default '0',
  `frmperiodos` tinyint(1) unsigned default '0',
  `frmrelacion` tinyint(1) unsigned default '0',
  `frmrutas` tinyint(1) unsigned default '0',
  `frmservicios` tinyint(1) unsigned default '0',
  `frmsucursales` tinyint(1) unsigned default '0',
  `frmtipo_gastos` tinyint(1) unsigned default '0',
  `frmtransp_ext` tinyint(1) unsigned default '0',
  `frmusuarios` tinyint(1) unsigned default '0',
  `frmvehiculos` tinyint(1) unsigned default '0',
  `frmviajes` tinyint(1) unsigned default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tacceso`
--

/*!40000 ALTER TABLE `tacceso` DISABLE KEYS */;
INSERT INTO `tacceso` (`cid_usuario`,`frmalmacenistas`,`frmanticipo_viaje`,`frmcargar_anticipo`,`frmcargar_viaje`,`frmcargar_viaje_ext`,`frmchoferes`,`frmciudades`,`frmestados`,`frmgasto_servicio`,`frmgrupos_serv`,`frmmontacarguistas`,`frmorigendestinos`,`frmperiodos`,`frmrelacion`,`frmrutas`,`frmservicios`,`frmsucursales`,`frmtipo_gastos`,`frmtransp_ext`,`frmusuarios`,`frmvehiculos`,`frmviajes`) VALUES 
 ('ADMIN',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
 ('P',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `tacceso` ENABLE KEYS */;


--
-- Definition of table `tacceso_suc`
--

DROP TABLE IF EXISTS `tacceso_suc`;
CREATE TABLE `tacceso_suc` (
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `crutaspc` varchar(250) NOT NULL default ' ',
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cid_usuario`,`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tacceso_suc`
--

/*!40000 ALTER TABLE `tacceso_suc` DISABLE KEYS */;
INSERT INTO `tacceso_suc` (`cid_usuario`,`crutaspc`,`nid_sucursal`) VALUES 
 ('P','L:/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('P','L:/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('P','L:/CARACAS/COBRANZAS/COBDATOS/',3),
 ('P','L:/VALENCIA/COBRANZAS/COBDATOS/',4);
/*!40000 ALTER TABLE `tacceso_suc` ENABLE KEYS */;


--
-- Definition of table `talmacenista`
--

DROP TABLE IF EXISTS `talmacenista`;
CREATE TABLE `talmacenista` (
  `cid_almacenista` varchar(9) NOT NULL,
  `cnombre` varchar(60) NOT NULL default ' ',
  `cficha_nom` varchar(10) NOT NULL default '0',
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nmontacarguista` tinyint(1) unsigned default '0',
  PRIMARY KEY  (`cid_almacenista`),
  KEY `FK_talmacenista_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_talmacenista_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talmacenista`
--

/*!40000 ALTER TABLE `talmacenista` DISABLE KEYS */;
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
-- Definition of table `tanticip_tviaje`
--

DROP TABLE IF EXISTS `tanticip_tviaje`;
CREATE TABLE `tanticip_tviaje` (
  `nid_anticipo` int(10) unsigned NOT NULL default '0',
  `nid_viaje` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid_anticipo`,`nid_viaje`),
  KEY `FK_tanttvj_tviaje` (`nid_viaje`),
  KEY `ix_anticipo` (`nid_anticipo`),
  CONSTRAINT `FK_tanttvj_tanticipo` FOREIGN KEY (`nid_anticipo`) REFERENCES `tanticipo` (`nid_anticipo`),
  CONSTRAINT `FK_tanttvj_tviaje` FOREIGN KEY (`nid_viaje`) REFERENCES `tviaje` (`nid_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticip_tviaje`
--

/*!40000 ALTER TABLE `tanticip_tviaje` DISABLE KEYS */;
INSERT INTO `tanticip_tviaje` (`nid_anticipo`,`nid_viaje`) VALUES 
 (100000001,100000001),
 (100000002,100000002),
 (100000003,100000002),
 (100000004,100000003),
 (100000004,100000004),
 (100000005,100000005),
 (100000005,100000006),
 (100000006,100000007);
/*!40000 ALTER TABLE `tanticip_tviaje` ENABLE KEYS */;


--
-- Definition of table `tanticipo`
--

DROP TABLE IF EXISTS `tanticipo`;
CREATE TABLE `tanticipo` (
  `nid_anticipo` int(10) unsigned NOT NULL default '0',
  `cnro_recibo` varchar(10) NOT NULL default ' ',
  `nmonto` double NOT NULL default '0',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cobservacion` text,
  `dfecha` date NOT NULL default '1900-01-01',
  `nstatus` tinyint(3) unsigned NOT NULL default '1' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `nid_relacion` int(10) unsigned default NULL,
  `nrelacionado` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid_anticipo`),
  KEY `ix_recibo` (`cnro_recibo`),
  KEY `FK_tanticipo_trelacion` (`nid_relacion`),
  CONSTRAINT `FK_tanticipo_trelacion` FOREIGN KEY (`nid_relacion`) REFERENCES `trelacion` (`nid_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo`
--

/*!40000 ALTER TABLE `tanticipo` DISABLE KEYS */;
INSERT INTO `tanticipo` (`nid_anticipo`,`cnro_recibo`,`nmonto`,`cid_usuario`,`dfecha_act`,`cobservacion`,`dfecha`,`nstatus`,`nid_relacion`,`nrelacionado`) VALUES 
 (100000001,'186960',160,'P','2010-10-13 10:15:04','ant val\r\n','2010-10-13',2,100000003,1),
 (100000002,'186997',900,'P','2010-10-13 10:20:48','ant 186997 a temblador\r\n','2010-10-13',2,100000004,1),
 (100000003,'186998',200,'P','2010-10-13 10:20:48','ant2 186998 a temblador\r\n','2010-10-13',2,100000004,1),
 (100000004,'186957',680,'P','2010-10-13 14:36:51','ant barc','2010-10-13',2,100000005,1),
 (100000005,'187003',680,'P','2010-10-13 10:08:19','ant viaje barc','2010-10-13',2,100000001,1),
 (100000006,'187041',310,'P','2010-10-13 14:45:07','ant 187041 a coro.','2010-10-13',1,NULL,0);
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
  `cregistro` varchar(20) NOT NULL,
  PRIMARY KEY  (`nid_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbitacora`
--

/*!40000 ALTER TABLE `tbitacora` DISABLE KEYS */;
INSERT INTO `tbitacora` (`nid_bitacora`,`ctabla`,`coperacion`,`cid_usuario`,`dfecha`,`cregistro`) VALUES 
 (4,'ttransporte_ext','I','P','2010-08-05 16:19:08','1'),
 (5,'ttransporte_ext','U','P','2010-08-05 16:19:50','1'),
 (6,'ttransporte_ext','I','P','2010-08-05 16:50:18','2'),
 (7,'ttransporte_ext','D','P','2010-08-05 17:08:10','2'),
 (8,'ttransporte_ext','I','P','2010-08-05 17:08:50','3'),
 (9,'ttransporte_ext','D','P','2010-08-05 17:08:58','3'),
 (10,'ttransporte_ext','I','P','2010-08-05 17:10:01','4'),
 (11,'ttransporte_ext','D','P','2010-08-05 17:10:10','4'),
 (12,'ttransporte_ext','I','P','2010-08-05 17:11:04','5'),
 (13,'ttransporte_ext','D','P','2010-08-05 17:11:11','5'),
 (14,'ttransporte_ext','I','P','2010-08-05 18:49:27','J88'),
 (15,'ttransporte_ext','I','P','2010-08-05 18:49:55','J888'),
 (16,'ttransporte_ext','U','P','2010-08-05 18:50:01','J888'),
 (17,'ttransporte_ext','D','P','2010-08-05 19:07:18','J888'),
 (18,'ttransporte_ext','U','P','2010-08-05 19:07:26','J88'),
 (19,'ttransporte_ext','U','P','2010-08-05 19:07:34','J88'),
 (20,'ttransporte_ext','U','P','2010-08-05 19:07:38','J88'),
 (21,'ttransporte_ext','U','P','2010-08-05 19:07:58','J-300'),
 (22,'ttransporte_ext','D','P','2010-08-05 19:08:08','J88'),
 (23,'ttransporte_ext','I','P','2010-08-05 19:08:31','J-400'),
 (24,'ttransporte_ext','D','P','2010-08-05 19:08:38','J-400'),
 (25,'ttransporte_ext','I','P','2010-08-05 19:09:10','J-300'),
 (26,'ttransporte_ext','I','P','2010-08-05 19:09:38','J-400'),
 (27,'ttransporte_ext','I','P','2010-08-05 19:10:21','J-500'),
 (28,'torigen_destino','I','P','2010-08-05 19:22:14','12'),
 (29,'truta','I','P','2010-08-05 19:25:10','121'),
 (33,'tviaje','I','P','2010-08-05 19:39:41','29'),
 (34,'tvehiculo','I','P','2010-08-11 11:10:34','A62AA9D'),
 (35,'tChofer','I','P','2010-08-11 11:10:34','11081888'),
 (36,'tChofer','U','P','2010-08-11 11:24:48','11081888'),
 (37,'tChofer','U','P','2010-08-11 15:02:37','7599282'),
 (38,'tChofer','U','P','2010-08-11 16:06:38','10142878'),
 (39,'tperiodo','U','P','2010-08-16 15:43:45','07100810'),
 (40,'tvehiculo','I','P','2010-08-16 16:13:37','A15AU5D'),
 (41,'tChofer','I','P','2010-08-16 16:13:37','7547865'),
 (42,'tChofer','U','P','2010-08-16 16:25:08','10142878'),
 (43,'tChofer','U','P','2010-08-16 16:25:08','11081499'),
 (44,'tChofer','U','P','2010-08-16 16:25:08','11081888'),
 (45,'tChofer','U','P','2010-08-16 16:25:08','11547715'),
 (46,'tChofer','U','P','2010-08-16 16:25:08','16346069'),
 (47,'tChofer','U','P','2010-08-16 16:25:08','16751579'),
 (48,'tChofer','U','P','2010-08-16 16:25:08','7547865'),
 (49,'tChofer','U','P','2010-08-16 16:25:08','8603178'),
 (50,'tChofer','U','P','2010-08-16 16:25:08','9844698'),
 (51,'tChofer','I','P','2010-08-16 16:36:27','321'),
 (52,'tChofer','U','P','2010-08-16 16:36:44','321'),
 (53,'tChofer','D','P','2010-08-16 16:36:47','321'),
 (54,'tChofer','U','P','2010-08-16 16:45:11','7547865'),
 (55,'tChofer','U','P','2010-08-16 16:53:22','10142878'),
 (56,'tChofer','U','P','2010-08-16 16:55:29','10142878'),
 (57,'tvehiculo','I','P','2010-08-17 11:36:17','730OAD'),
 (58,'tChofer','I','P','2010-08-17 11:36:17','11545892'),
 (59,'tChofer','U','P','2010-08-17 11:36:54','11545892'),
 (60,'tvehiculo','I','P','2010-08-17 17:39:43','66XPAC'),
 (61,'tChofer','I','P','2010-08-17 17:39:44','15693221'),
 (62,'tChofer','U','P','2010-08-17 17:40:02','15693221'),
 (63,'torigen_destino','I','P','2010-08-17 17:55:05','13'),
 (64,'truta','I','P','2010-08-17 17:56:00','113'),
 (71,'tAnticipo','I','P','2010-08-18 11:03:51','17'),
 (72,'tviaje','I','P','2010-08-18 11:03:55','31'),
 (73,'torigen_destino','I','P','2010-08-18 11:52:37','14'),
 (74,'truta','I','P','2010-08-18 11:56:52','114'),
 (78,'tAnticipo','I','P','2010-08-18 12:07:57','21'),
 (79,'tviaje','I','P','2010-08-18 12:07:58','32'),
 (80,'tvehiculo','I','P','2010-08-18 14:22:43','39HDAO'),
 (81,'tChofer','I','P','2010-08-18 14:22:43','10139779'),
 (82,'tviaje','I','','2010-08-20 15:44:55','33'),
 (83,'tviaje','I','','2010-08-20 15:45:09','34'),
 (84,'tviaje','I','','2010-08-20 15:45:11','35'),
 (85,'tviaje','I','','2010-08-20 15:45:31','36'),
 (86,'tviaje','I','','2010-08-20 15:45:33','37'),
 (89,'tviaje','D','','2010-08-24 10:56:43','34'),
 (90,'tviaje','D','','2010-08-24 10:56:43','35'),
 (91,'tviaje','D','','2010-08-24 10:56:43','36'),
 (92,'tviaje','D','','2010-08-24 10:56:43','37'),
 (93,'tperiodo','U','P','2010-09-08 17:21:52','07100810'),
 (94,'tvehiculo','I','P','2010-09-08 17:33:34','A05AE7T'),
 (95,'tAnticipo','I','P','2010-09-08 17:35:07','22'),
 (96,'tviaje','I','P','2010-09-08 17:35:07','34'),
 (100,'tAnticipo','I','P','2010-09-09 09:25:09','26'),
 (101,'tAnticipo','U','P','2010-09-09 10:04:12','26'),
 (102,'tAnticipo','U','P','2010-09-09 10:41:31','1'),
 (103,'tAnticipo','U','P','2010-09-09 10:41:31','2'),
 (104,'tAnticipo','U','P','2010-09-09 10:41:31','3'),
 (105,'tAnticipo','U','P','2010-09-09 10:41:31','4'),
 (106,'tAnticipo','U','P','2010-09-09 10:41:31','5'),
 (107,'tAnticipo','U','P','2010-09-09 10:41:31','6'),
 (108,'tAnticipo','U','P','2010-09-09 10:41:31','7'),
 (109,'tAnticipo','U','P','2010-09-09 10:41:31','9'),
 (110,'tAnticipo','U','P','2010-09-09 10:41:31','10'),
 (111,'tAnticipo','U','P','2010-09-09 10:41:31','11'),
 (112,'tAnticipo','U','P','2010-09-09 10:41:31','17'),
 (113,'tAnticipo','U','P','2010-09-09 10:41:31','21'),
 (114,'tAnticipo','U','P','2010-09-09 10:41:31','22'),
 (115,'tAnticipo','U','P','2010-09-09 10:41:31','26'),
 (116,'ttipo_gasto','I','P','2010-09-16 14:58:57','01'),
 (117,'ttipo_gasto','I','P','2010-09-16 14:59:25','02'),
 (118,'ttipo_gasto','I','P','2010-09-16 14:59:50','05'),
 (119,'ttipo_gasto','I','P','2010-09-16 15:00:07','06'),
 (120,'ttipo_gasto','I','P','2010-09-16 15:00:29','07'),
 (121,'ttipo_gasto','I','P','2010-09-16 15:00:45','08'),
 (122,'tRelacion','I','P','2010-09-17 09:58:01','1'),
 (123,'tAnticipo','U','P','2010-09-17 09:58:01','22'),
 (124,'tusuario','U','ADMIN','2010-09-21 14:21:33','ADMIN'),
 (125,'tusuario','U','P','2010-09-21 14:21:33','P'),
 (126,'tusuario','I','PP','2010-09-21 16:59:56','PP'),
 (127,'tusuario','U','P','2010-09-21 17:00:05','P'),
 (128,'tusuario','U','P','2010-09-22 15:13:57','P'),
 (129,'tusuario','U','P','2010-09-22 18:20:05','P'),
 (130,'tusuario','U','P','2010-09-22 18:20:20','P'),
 (131,'tusuario','U','P','2010-09-22 18:20:49','P'),
 (132,'tusuario','U','P','2010-09-22 18:21:12','P'),
 (133,'tusuario','U','P','2010-09-23 18:10:10','P'),
 (134,'tusuario','U','ADMIN','2010-09-24 09:04:45','ADMIN'),
 (135,'tusuario','U','P','2010-09-24 09:06:07','P'),
 (136,'tusuario','D','PP','2010-09-24 09:12:00','PP'),
 (137,'tusuario','I','CARLOS','2010-09-24 10:14:20','CARLOS'),
 (138,'tusuario','I','PPPPPPPP','2010-09-24 10:23:31','PPPPPPPP'),
 (139,'tusuario','D','PPPPPPPP','2010-09-24 10:24:33','PPPPPPPP'),
 (140,'tusuario','I','PPPPPPPP','2010-09-24 10:27:35','PPPPPPPP'),
 (141,'tusuario','D','PPPPPPPP','2010-09-24 10:27:51','PPPPPPPP'),
 (142,'tusuario','I','PPPPPPPPPPPPPPP','2010-09-24 10:28:09','PPPPPPPPPPPPPPP'),
 (143,'tusuario','D','PPPPPPPPPPPPPPP','2010-09-24 10:33:22','PPPPPPPPPPPPPPP'),
 (144,'tusuario','I','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:35:13','PPPPPPPPPPPPPPPPPPPP'),
 (145,'tusuario','D','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:40:21','PPPPPPPPPPPPPPPPPPPP'),
 (146,'tusuario','I','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:42:07','PPPPPPPPPPPPPPPPPPPP'),
 (147,'tusuario','D','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:42:33','PPPPPPPPPPPPPPPPPPPP'),
 (148,'tusuario','I','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:46:36','PPPPPPPPPPPPPPPPPPPP'),
 (149,'tusuario','D','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:47:15','PPPPPPPPPPPPPPPPPPPP'),
 (150,'tusuario','I','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:57:10','PPPPPPPPPPPPPPPPPPPP'),
 (151,'tusuario','D','PPPPPPPPPPPPPPPPPPPP','2010-09-24 10:58:11','PPPPPPPPPPPPPPPPPPPP'),
 (152,'torigen_destino','U','P','2010-09-24 14:52:36','1'),
 (153,'tsucursal','U','P','2010-09-24 14:52:36','1'),
 (154,'torigen_destino','U','P','2010-09-24 14:52:49','1'),
 (155,'tsucursal','U','P','2010-09-24 14:52:49','1'),
 (156,'tusuario','U','P','2010-09-24 17:18:09','P'),
 (157,'tusuario','U','P','2010-09-24 17:38:03','P'),
 (158,'tusuario','U','P','2010-09-24 17:45:55','P'),
 (159,'tusuario','U','ADMIN','2010-09-24 17:47:06','ADMIN'),
 (160,'tAnticipo','I','P','2010-09-28 08:52:36','27'),
 (161,'tperiodo','U','P','2010-10-01 10:07:49','07100810'),
 (162,'tusuario','U','ADMIN','2010-10-01 10:45:41','ADMIN'),
 (163,'tusuario','U','P','2010-10-01 10:46:00','P'),
 (164,'tusuario','U','P','2010-10-01 10:49:18','P'),
 (165,'tPeriodo','I','P','2010-10-01 11:28:12','16091510'),
 (166,'tvehiculo','I','P','2010-10-01 15:23:24','A64AE3E'),
 (167,'tChofer','I','P','2010-10-01 15:23:24','9566638'),
 (168,'tChofer','U','P','2010-10-01 15:24:40','9566638'),
 (169,'tCiudad','I','P','2010-10-01 15:42:33','1502'),
 (170,'torigen_destino','I','P','2010-10-01 15:47:21','15'),
 (171,'truta','I','P','2010-10-01 15:48:34','115'),
 (172,'tAnticipo','I','P','2010-10-01 18:46:16','28'),
 (173,'tviaje','I','P','2010-10-01 18:46:17','35'),
 (174,'tAnticipo','I','P','2010-10-01 18:47:27','29'),
 (179,'tChofer','U','P','2010-10-01 18:59:56','10139779'),
 (180,'tAnticipo','U','P','2010-10-04 09:07:31','28'),
 (181,'tvehiculo','I','P','2010-10-04 09:32:57','A86AA0D'),
 (182,'tChofer','I','P','2010-10-04 09:32:57','9562700'),
 (183,'tChofer','U','P','2010-10-04 09:33:53','9562700'),
 (184,'talmacenista','I','P','2010-10-04 10:49:12','321'),
 (185,'talmacenista','I','P','2010-10-04 10:49:47','123'),
 (186,'talmacenista','U','P','2010-10-04 10:50:17','123'),
 (187,'talmacenista','D','P','2010-10-04 10:50:36','123'),
 (188,'talmacenista','I','P','2010-10-04 10:50:44','324'),
 (189,'tvehiculo','I','P','2010-10-04 11:52:44','A22AE3U'),
 (190,'tChofer','I','P','2010-10-04 11:52:44','12262801'),
 (191,'tvehiculo','I','P','2010-10-04 11:52:48','A13AG7E'),
 (192,'tChofer','I','P','2010-10-04 11:52:48','10637589'),
 (193,'tviaje','I','P','2010-10-04 11:53:39','36'),
 (194,'torigen_destino','I','P','2010-10-04 15:30:44','16'),
 (195,'truta','I','P','2010-10-04 15:31:05','116'),
 (196,'tAnticipo','I','P','2010-10-04 15:35:37','30'),
 (197,'tviaje','I','P','2010-10-04 15:35:37','37'),
 (198,'torigen_destino','I','P','2010-10-04 16:04:16','17'),
 (199,'tsucursal','I','P','2010-10-04 16:04:16','5'),
 (200,'torigen_destino','I','P','2010-10-04 16:04:57','18'),
 (201,'tsucursal','I','P','2010-10-04 16:04:57','6'),
 (202,'torigen_destino','I','P','2010-10-04 16:37:15','19'),
 (203,'tsucursal','I','P','2010-10-04 16:37:15','7'),
 (204,'truta','I','P','2010-10-04 16:40:28','117'),
 (205,'torigen_destino','U','P','2010-10-04 16:46:01','18'),
 (206,'tsucursal','U','P','2010-10-04 16:46:01','6'),
 (207,'truta','I','P','2010-10-04 16:47:09','118'),
 (208,'tvehiculo','I','P','2010-10-04 16:55:44','A86AA/OD'),
 (209,'tAnticipo','I','P','2010-10-04 16:57:27','31'),
 (210,'tviaje','I','P','2010-10-04 16:57:27','38'),
 (211,'tAnticipo','I','P','2010-10-04 16:59:01','32'),
 (212,'tviaje','I','P','2010-10-04 16:59:01','39'),
 (213,'tviaje','I','','2010-10-04 17:01:24','40'),
 (214,'tRelacion','I','P','2010-10-04 17:16:59','2'),
 (215,'tAnticipo','U','P','2010-10-04 17:16:59','28'),
 (216,'tAnticipo','U','P','2010-10-04 17:16:59','29'),
 (217,'tRelacion','I','P','2010-10-04 17:19:54','3'),
 (218,'tAnticipo','U','P','2010-10-04 17:19:54','30'),
 (219,'tAnticipo','U','P','2010-10-04 17:50:46','22'),
 (220,'tAnticipo','U','P','2010-10-04 17:50:46','28'),
 (221,'tAnticipo','U','P','2010-10-04 17:50:46','29'),
 (222,'tAnticipo','U','P','2010-10-04 17:50:46','30'),
 (223,'tAnticipo','U','P','2010-10-04 18:04:47','31'),
 (224,'tAnticipo','I','P','2010-10-05 09:08:58','33'),
 (225,'tviaje','I','P','2010-10-05 09:08:58','41'),
 (226,'tRelacion','I','P','2010-10-05 09:11:07','4'),
 (227,'tAnticipo','U','P','2010-10-05 09:11:07','33'),
 (228,'tAnticipo','U','P','2010-10-05 09:12:06','33'),
 (229,'tRelacion','I','P','2010-10-05 09:18:29','5'),
 (230,'tAnticipo','U','P','2010-10-05 09:18:29','32'),
 (231,'tChofer','U','P','2010-10-05 18:10:55','10139779'),
 (232,'tChofer','U','P','2010-10-05 18:11:03','10139779'),
 (233,'tChofer','I','P','2010-10-05 18:11:25','2314123'),
 (234,'tChofer','D','P','2010-10-05 18:11:29','2314123'),
 (235,'tvehiculo','U','P','2010-10-05 18:12:17','22MDBB'),
 (236,'tvehiculo','U','P','2010-10-05 18:12:38','22MDBB'),
 (237,'tvehiculo','U','P','2010-10-05 18:12:47','22MDBB'),
 (238,'tgrupo_servicio','I','P','2010-10-06 08:38:23','01'),
 (239,'tgrupo_servicio','I','P','2010-10-06 08:38:38','02'),
 (240,'tservicio','I','P','2010-10-06 08:39:15','01'),
 (241,'tservicio','I','P','2010-10-06 08:39:41','02'),
 (242,'tgasto_serv','I','P','2010-10-06 08:42:20','1'),
 (243,'tgasto_serv','U','P','2010-10-06 08:49:47','1'),
 (244,'tgasto_serv','U','P','2010-10-06 08:58:40','1'),
 (245,'tgasto_serv','I','P','2010-10-06 09:11:15','2'),
 (246,'tgasto_serv','U','P','2010-10-06 09:11:31','2'),
 (247,'tAnticipo','I','P','2010-10-06 19:02:27','1000000001'),
 (248,'tAnticipo','D','P','2010-10-06 19:03:01','1000000001'),
 (259,'tAnticipo','I','P','2010-10-06 20:36:17','1000000001'),
 (260,'tviaje','I','P','2010-10-06 20:36:28','1000000001'),
 (261,'tviaje','I','','2010-10-06 20:54:29','1000000002'),
 (262,'tvehiculo','I','P','2010-10-06 21:14:55','A75A/D1I'),
 (263,'tChofer','I','P','2010-10-06 21:14:55','9568641'),
 (264,'tvehiculo','I','P','2010-10-06 21:15:56','76SDAR'),
 (265,'tChofer','I','P','2010-10-06 21:15:56','7241360'),
 (266,'tvehiculo','I','P','2010-10-06 21:27:52','36R/DAR'),
 (267,'tRelacion','I','P','2010-10-06 21:39:28','1000000001'),
 (268,'tAnticipo','U','P','2010-10-06 21:39:28','1000000001'),
 (269,'torigen_destino','I','P','2010-10-07 10:32:09','20'),
 (270,'tsucursal','I','P','2010-10-07 10:32:09','8'),
 (271,'torigen_destino','I','P','2010-10-07 10:32:13','21'),
 (272,'tsucursal','I','P','2010-10-07 10:32:13','9'),
 (273,'torigen_destino','I','P','2010-10-07 10:34:04','22'),
 (274,'tsucursal','I','P','2010-10-07 10:34:04','10'),
 (275,'torigen_destino','I','P','2010-10-07 12:02:07','23'),
 (276,'tsucursal','I','P','2010-10-07 12:02:07','11'),
 (277,'torigen_destino','I','P','2010-10-07 12:02:15','24'),
 (278,'tsucursal','I','P','2010-10-07 12:02:15','12'),
 (283,'torigen_destino','I','P','2010-10-07 14:47:34','27'),
 (284,'tsucursal','I','P','2010-10-07 14:47:34','15'),
 (285,'tgasto_serv','I','P','2010-10-07 16:06:03','100000001'),
 (286,'tgasto_serv','I','P','2010-10-07 16:07:05','100000002'),
 (287,'tvehiculo','U','P','2010-10-07 16:20:05','A02AF5T'),
 (288,'tgasto_serv','I','P','2010-10-07 16:20:35','200000001'),
 (289,'tgasto_serv','I','P','2010-10-07 16:21:07','200000002'),
 (290,'tgasto_serv','I','P','2010-10-07 16:24:21','200000003'),
 (291,'tAnticipo','I','P','2010-10-07 16:43:54','100000001'),
 (292,'tviaje','I','P','2010-10-07 16:43:54','100000001'),
 (293,'tvehiculo','I','P','2010-10-07 16:45:07','81XPAC'),
 (294,'tChofer','I','P','2010-10-07 16:45:07','11273120'),
 (295,'tAnticipo','I','P','2010-10-07 16:45:25','100000002'),
 (296,'tviaje','I','P','2010-10-07 16:45:25','100000002'),
 (297,'tvehiculo','I','P','2010-10-07 17:05:12','48SDAR'),
 (298,'tChofer','I','P','2010-10-07 17:05:12','8657021'),
 (299,'tvehiculo','I','P','2010-10-07 17:05:45','06NDAS'),
 (300,'tChofer','I','P','2010-10-07 17:05:45','11849935'),
 (301,'tChofer','U','P','2010-10-07 17:06:10','11849935'),
 (302,'tAnticipo','I','P','2010-10-07 17:06:51','100000003'),
 (303,'tviaje','I','P','2010-10-07 17:07:12','100000003'),
 (304,'talmacenista','D','P','2010-10-07 17:08:51','321'),
 (305,'talmacenista','D','P','2010-10-07 17:08:51','324'),
 (308,'tgasto_serv','D','P','2010-10-07 17:09:03','1'),
 (309,'tgasto_serv','D','P','2010-10-07 17:09:03','2'),
 (310,'tgasto_serv','D','P','2010-10-07 17:09:03','100000001'),
 (311,'tgasto_serv','D','P','2010-10-07 17:09:03','100000002'),
 (312,'tgasto_serv','D','P','2010-10-07 17:09:03','200000001'),
 (313,'tgasto_serv','D','P','2010-10-07 17:09:03','200000002'),
 (314,'tgasto_serv','D','P','2010-10-07 17:09:03','200000003'),
 (319,'tservicio','D','P','2010-10-07 17:09:33','01'),
 (320,'tservicio','D','P','2010-10-07 17:09:33','02'),
 (323,'ttipo_gasto','D','P','2010-10-07 17:09:48','01'),
 (324,'ttipo_gasto','D','P','2010-10-07 17:09:48','02'),
 (325,'ttipo_gasto','D','P','2010-10-07 17:09:48','05'),
 (326,'ttipo_gasto','D','P','2010-10-07 17:09:48','06'),
 (327,'ttipo_gasto','D','P','2010-10-07 17:09:48','07'),
 (328,'ttipo_gasto','D','P','2010-10-07 17:09:48','08'),
 (329,'ttransporte_ext','D','P','2010-10-07 17:09:50','J-300'),
 (330,'ttransporte_ext','D','P','2010-10-07 17:09:50','J-300'),
 (331,'ttransporte_ext','D','P','2010-10-07 17:09:50','J-400'),
 (332,'ttransporte_ext','D','P','2010-10-07 17:09:50','J-500'),
 (335,'tviaje','D','P','2010-10-07 17:09:53','1'),
 (336,'tviaje','D','P','2010-10-07 17:09:53','2'),
 (337,'tviaje','D','P','2010-10-07 17:09:53','3'),
 (338,'tviaje','D','P','2010-10-07 17:09:53','4'),
 (339,'tviaje','D','P','2010-10-07 17:09:53','5'),
 (340,'tviaje','D','P','2010-10-07 17:09:53','6'),
 (341,'tviaje','D','P','2010-10-07 17:09:53','7'),
 (342,'tviaje','D','P','2010-10-07 17:09:53','24'),
 (343,'tviaje','D','P','2010-10-07 17:09:53','25'),
 (344,'tviaje','D','P','2010-10-07 17:09:53','26'),
 (345,'tviaje','D','P','2010-10-07 17:09:53','29'),
 (346,'tviaje','D','P','2010-10-07 17:09:53','31'),
 (347,'tviaje','D','P','2010-10-07 17:09:53','32'),
 (348,'tviaje','D','','2010-10-07 17:09:53','33'),
 (349,'tviaje','D','P','2010-10-07 17:09:53','34'),
 (350,'tviaje','D','P','2010-10-07 17:09:53','35'),
 (351,'tviaje','D','P','2010-10-07 17:09:53','36'),
 (352,'tviaje','D','P','2010-10-07 17:09:53','37'),
 (353,'tviaje','D','P','2010-10-07 17:09:53','38'),
 (354,'tviaje','D','P','2010-10-07 17:09:53','39'),
 (355,'tviaje','D','','2010-10-07 17:09:53','40'),
 (356,'tviaje','D','P','2010-10-07 17:09:53','41'),
 (357,'tviaje','D','P','2010-10-07 17:09:53','100000001'),
 (358,'tviaje','D','P','2010-10-07 17:09:53','100000002'),
 (359,'tviaje','D','P','2010-10-07 17:09:53','100000003'),
 (360,'tviaje','D','P','2010-10-07 17:09:53','1000000001'),
 (361,'tviaje','D','','2010-10-07 17:09:53','1000000002'),
 (363,'tAnticipo','D','P','2010-10-07 18:31:12','1'),
 (364,'tAnticipo','D','P','2010-10-07 18:31:12','2'),
 (365,'tAnticipo','D','P','2010-10-07 18:31:12','3'),
 (366,'tAnticipo','D','P','2010-10-07 18:31:12','4'),
 (367,'tAnticipo','D','P','2010-10-07 18:31:12','5'),
 (368,'tAnticipo','D','P','2010-10-07 18:31:12','6'),
 (369,'tAnticipo','D','P','2010-10-07 18:31:12','7'),
 (370,'tAnticipo','D','P','2010-10-07 18:31:12','9'),
 (371,'tAnticipo','D','P','2010-10-07 18:31:12','10'),
 (372,'tAnticipo','D','P','2010-10-07 18:31:12','11'),
 (373,'tAnticipo','D','P','2010-10-07 18:31:12','17'),
 (374,'tAnticipo','D','P','2010-10-07 18:31:12','21'),
 (375,'tAnticipo','D','P','2010-10-07 18:31:12','22'),
 (376,'tAnticipo','D','P','2010-10-07 18:31:12','26'),
 (377,'tAnticipo','D','P','2010-10-07 18:31:12','27'),
 (378,'tAnticipo','D','P','2010-10-07 18:31:12','28'),
 (379,'tAnticipo','D','P','2010-10-07 18:31:12','29'),
 (380,'tAnticipo','D','P','2010-10-07 18:31:12','30'),
 (381,'tAnticipo','D','P','2010-10-07 18:31:12','31'),
 (382,'tAnticipo','D','P','2010-10-07 18:31:12','32'),
 (383,'tAnticipo','D','P','2010-10-07 18:31:12','33'),
 (384,'tAnticipo','D','P','2010-10-07 18:31:12','100000001'),
 (385,'tAnticipo','D','P','2010-10-07 18:31:12','100000002'),
 (386,'tAnticipo','D','P','2010-10-07 18:31:12','100000003'),
 (387,'tAnticipo','D','P','2010-10-07 18:31:12','1000000001'),
 (388,'tChofer','D','P','2010-10-07 18:31:19','10139779'),
 (389,'tChofer','D','P','2010-10-07 18:31:19','10142878'),
 (390,'tChofer','D','P','2010-10-07 18:31:19','10637589'),
 (391,'tChofer','D','P','2010-10-07 18:31:19','11081499'),
 (392,'tChofer','D','P','2010-10-07 18:31:19','11081888'),
 (393,'tChofer','D','P','2010-10-07 18:31:19','11273120'),
 (394,'tChofer','D','P','2010-10-07 18:31:19','11545892'),
 (395,'tChofer','D','P','2010-10-07 18:31:19','11547715'),
 (396,'tChofer','D','P','2010-10-07 18:31:19','11849935'),
 (397,'tChofer','D','P','2010-10-07 18:31:19','12262801'),
 (398,'tChofer','D','P','2010-10-07 18:31:19','15693221'),
 (399,'tChofer','D','P','2010-10-07 18:31:19','16346069'),
 (400,'tChofer','D','P','2010-10-07 18:31:19','16751579'),
 (401,'tChofer','D','P','2010-10-07 18:31:19','7241360'),
 (402,'tChofer','D','P','2010-10-07 18:31:19','7547865'),
 (403,'tChofer','D','P','2010-10-07 18:31:19','7599282'),
 (404,'tChofer','D','P','2010-10-07 18:31:19','8603178'),
 (405,'tChofer','D','P','2010-10-07 18:31:19','8657021'),
 (406,'tChofer','D','P','2010-10-07 18:31:19','9562700'),
 (407,'tChofer','D','P','2010-10-07 18:31:19','9566638'),
 (408,'tChofer','D','P','2010-10-07 18:31:19','9568641'),
 (409,'tChofer','D','P','2010-10-07 18:31:19','9844698'),
 (410,'tgrupo_servicio','D','P','2010-10-07 18:31:21','01'),
 (411,'tgrupo_servicio','D','P','2010-10-07 18:31:21','02'),
 (412,'torigen_destino','D','P','2010-10-07 18:31:22','1'),
 (413,'torigen_destino','D','P','2010-10-07 18:31:22','2'),
 (414,'torigen_destino','D','P','2010-10-07 18:31:22','3'),
 (415,'torigen_destino','D','P','2010-10-07 18:31:22','4'),
 (416,'torigen_destino','D','P','2010-10-07 18:31:22','5'),
 (417,'torigen_destino','D','P','2010-10-07 18:31:22','6'),
 (418,'torigen_destino','D','P','2010-10-07 18:31:22','7'),
 (419,'torigen_destino','D','P','2010-10-07 18:31:22','8'),
 (420,'torigen_destino','D','P','2010-10-07 18:31:22','9'),
 (421,'torigen_destino','D','P','2010-10-07 18:31:22','10'),
 (422,'torigen_destino','D','P','2010-10-07 18:31:22','11'),
 (423,'torigen_destino','D','P','2010-10-07 18:31:22','12'),
 (424,'torigen_destino','D','P','2010-10-07 18:31:22','13'),
 (425,'torigen_destino','D','P','2010-10-07 18:31:22','14'),
 (426,'torigen_destino','D','P','2010-10-07 18:31:22','15'),
 (427,'torigen_destino','D','P','2010-10-07 18:31:22','16'),
 (428,'torigen_destino','D','P','2010-10-07 18:31:22','17'),
 (429,'torigen_destino','D','P','2010-10-07 18:31:22','18'),
 (430,'torigen_destino','D','P','2010-10-07 18:31:22','19'),
 (431,'torigen_destino','D','P','2010-10-07 18:31:22','20'),
 (432,'torigen_destino','D','P','2010-10-07 18:31:22','21'),
 (433,'torigen_destino','D','P','2010-10-07 18:31:22','22'),
 (434,'torigen_destino','D','P','2010-10-07 18:31:22','23'),
 (435,'torigen_destino','D','P','2010-10-07 18:31:22','24'),
 (436,'torigen_destino','D','P','2010-10-07 18:31:22','27'),
 (437,'tperiodo','D','P','2010-10-07 18:31:23','07100810'),
 (438,'tperiodo','D','P','2010-10-07 18:31:23','16091510'),
 (439,'tsucursal','D','P','2010-10-07 18:31:25','1'),
 (440,'tsucursal','D','P','2010-10-07 18:31:25','2'),
 (441,'tsucursal','D','P','2010-10-07 18:31:25','4'),
 (442,'tsucursal','D','P','2010-10-07 18:31:25','5'),
 (443,'tsucursal','D','P','2010-10-07 18:31:25','6'),
 (444,'tsucursal','D','P','2010-10-07 18:31:25','7'),
 (445,'tsucursal','D','P','2010-10-07 18:31:25','8'),
 (446,'tsucursal','D','P','2010-10-07 18:31:25','9'),
 (447,'tsucursal','D','P','2010-10-07 18:31:25','10'),
 (448,'tsucursal','D','P','2010-10-07 18:31:25','11'),
 (449,'tsucursal','D','P','2010-10-07 18:31:25','12'),
 (450,'tsucursal','D','P','2010-10-07 18:31:25','15'),
 (451,'tvehiculo','D','P','2010-10-07 18:31:29','06NDAS'),
 (452,'tvehiculo','D','P','2010-10-07 18:31:29','22MDBB'),
 (453,'tvehiculo','D','P','2010-10-07 18:31:29','36R/DAR'),
 (454,'tvehiculo','D','P','2010-10-07 18:31:29','36RDAR'),
 (455,'tvehiculo','D','P','2010-10-07 18:31:29','39HDAO'),
 (456,'tvehiculo','D','P','2010-10-07 18:31:29','48SDAR'),
 (457,'tvehiculo','D','P','2010-10-07 18:31:29','61MDAS'),
 (458,'tvehiculo','D','P','2010-10-07 18:31:29','66XPAC'),
 (459,'tvehiculo','D','P','2010-10-07 18:31:29','730OAD'),
 (460,'tvehiculo','D','P','2010-10-07 18:31:29','76SDAR'),
 (461,'tvehiculo','D','P','2010-10-07 18:31:29','81XPAC'),
 (462,'tvehiculo','D','P','2010-10-07 18:31:29','A02AF5T'),
 (463,'tvehiculo','D','P','2010-10-07 18:31:29','A05AE7T'),
 (464,'tvehiculo','D','P','2010-10-07 18:31:29','A13AG7E'),
 (465,'tvehiculo','D','P','2010-10-07 18:31:29','A15AU5D'),
 (466,'tvehiculo','D','P','2010-10-07 18:31:29','A22AB1D'),
 (467,'tvehiculo','D','P','2010-10-07 18:31:29','A22AE2U'),
 (468,'tvehiculo','D','P','2010-10-07 18:31:29','A22AE3U'),
 (469,'tvehiculo','D','P','2010-10-07 18:31:29','A62AA9D'),
 (470,'tvehiculo','D','P','2010-10-07 18:31:29','A64/AE2E'),
 (471,'tvehiculo','D','P','2010-10-07 18:31:29','A64AE3E'),
 (472,'tvehiculo','D','P','2010-10-07 18:31:29','A71AE4E'),
 (473,'tvehiculo','D','P','2010-10-07 18:31:29','A75A/D1I'),
 (474,'tvehiculo','D','P','2010-10-07 18:31:29','A86AA/OD'),
 (475,'tvehiculo','D','P','2010-10-07 18:31:29','A86AA0D'),
 (476,'trelacion','D','P','2010-10-08 08:04:00','1'),
 (477,'trelacion','D','P','2010-10-08 08:04:00','2'),
 (478,'trelacion','D','P','2010-10-08 08:04:00','3'),
 (479,'trelacion','D','P','2010-10-08 08:04:00','4'),
 (480,'trelacion','D','P','2010-10-08 08:04:00','5'),
 (481,'trelacion','D','P','2010-10-08 08:04:00','1000000001'),
 (482,'torigen_destino','I','P','2010-10-08 15:15:07','1'),
 (483,'tsucursal','I','P','2010-10-08 15:15:07','1'),
 (484,'torigen_destino','I','P','2010-10-08 15:18:00','2'),
 (485,'tsucursal','I','P','2010-10-08 15:18:00','2'),
 (486,'torigen_destino','I','P','2010-10-08 15:18:42','3'),
 (487,'tsucursal','I','P','2010-10-08 15:18:42','3'),
 (488,'torigen_destino','I','P','2010-10-08 15:20:20','4'),
 (489,'tsucursal','I','P','2010-10-08 15:20:20','4'),
 (490,'torigen_destino','I','P','2010-10-08 15:22:13','5'),
 (491,'tsucursal','I','P','2010-10-08 15:22:13','5'),
 (492,'torigen_destino','I','P','2010-10-08 15:22:37','6'),
 (493,'tsucursal','I','P','2010-10-08 15:22:37','6'),
 (494,'tsucursal','U','P','2010-10-08 15:24:29','5'),
 (495,'tsucursal','U','P','2010-10-08 15:25:06','3'),
 (496,'tsucursal','U','P','2010-10-08 15:25:37','4'),
 (497,'tsucursal','U','P','2010-10-08 15:26:49','4'),
 (498,'tsucursal','U','P','2010-10-08 15:27:26','5'),
 (499,'tsucursal','U','P','2010-10-08 15:27:47','6'),
 (500,'tsucursal','U','P','2010-10-08 15:28:15','3'),
 (501,'tCiudad','U','P','2010-10-08 15:51:38','0101'),
 (502,'tCiudad','U','P01','2010-10-08 15:51:38','0201'),
 (503,'tCiudad','U','P01','2010-10-08 15:51:38','0301'),
 (504,'tCiudad','U','P01','2010-10-08 15:51:38','0401'),
 (505,'tCiudad','U','P01','2010-10-08 15:51:38','0501'),
 (506,'tCiudad','U','P01','2010-10-08 15:51:38','0601'),
 (507,'tCiudad','U','P','2010-10-08 15:51:38','0701'),
 (508,'tCiudad','U','P01','2010-10-08 15:51:38','0801'),
 (509,'tCiudad','U','P01','2010-10-08 15:51:38','0901'),
 (510,'tCiudad','U','P01','2010-10-08 15:51:38','1001'),
 (511,'tCiudad','U','P01','2010-10-08 15:51:38','1101'),
 (512,'tCiudad','U','P01','2010-10-08 15:51:38','1201'),
 (513,'tCiudad','U','P01','2010-10-08 15:51:38','1301'),
 (514,'tCiudad','U','P01','2010-10-08 15:51:38','1401'),
 (515,'tCiudad','U','P01','2010-10-08 15:51:38','1501'),
 (516,'tCiudad','U','P01','2010-10-08 15:51:38','1601'),
 (517,'tCiudad','U','P01','2010-10-08 15:51:38','1701'),
 (518,'tCiudad','U','P','2010-10-08 15:51:38','1702'),
 (519,'tCiudad','U','P01','2010-10-08 15:51:38','1801'),
 (520,'tCiudad','U','P01','2010-10-08 15:51:38','1901'),
 (521,'tCiudad','U','P01','2010-10-08 15:51:38','2001'),
 (522,'tCiudad','U','P01','2010-10-08 15:51:38','2101'),
 (523,'tCiudad','U','P01','2010-10-08 15:51:38','2201'),
 (524,'tCiudad','U','P01','2010-10-08 15:51:38','2301'),
 (525,'tCiudad','U','P01','2010-10-08 15:51:38','2401'),
 (526,'tEstado','U','P01','2010-10-08 15:51:55','01'),
 (527,'tEstado','U','P01','2010-10-08 15:51:55','02'),
 (528,'tEstado','U','P01','2010-10-08 15:51:55','04'),
 (529,'tEstado','U','P01','2010-10-08 15:51:55','05'),
 (530,'tEstado','U','P01','2010-10-08 15:51:55','06'),
 (531,'tEstado','U','P01','2010-10-08 15:51:55','07'),
 (532,'tEstado','U','P01','2010-10-08 15:51:55','09'),
 (533,'tEstado','U','P01','2010-10-08 15:51:55','10'),
 (534,'tEstado','U','P01','2010-10-08 15:51:55','11'),
 (535,'tEstado','U','P01','2010-10-08 15:51:55','12'),
 (536,'tEstado','U','P01','2010-10-08 15:51:55','13'),
 (537,'tEstado','U','P01','2010-10-08 15:51:55','14'),
 (538,'tEstado','U','P01','2010-10-08 15:51:55','15'),
 (539,'tEstado','U','P01','2010-10-08 15:51:55','16'),
 (540,'tEstado','U','P01','2010-10-08 15:51:55','17'),
 (541,'tEstado','U','P01','2010-10-08 15:51:55','18'),
 (542,'tEstado','U','P01','2010-10-08 15:51:55','19'),
 (543,'tEstado','U','P01','2010-10-08 15:51:55','20'),
 (544,'tEstado','U','P01','2010-10-08 15:51:55','21'),
 (545,'tEstado','U','P01','2010-10-08 15:51:55','22'),
 (546,'tEstado','U','P01','2010-10-08 15:51:55','23'),
 (547,'tEstado','U','P01','2010-10-08 15:51:55','24'),
 (548,'tEstado','U','ADMIN','2010-10-08 15:52:41','01'),
 (549,'tEstado','U','ADMIN','2010-10-08 15:52:41','02'),
 (550,'tEstado','U','ADMIN','2010-10-08 15:52:41','03'),
 (551,'tEstado','U','ADMIN','2010-10-08 15:52:41','04'),
 (552,'tEstado','U','ADMIN','2010-10-08 15:52:41','05'),
 (553,'tEstado','U','ADMIN','2010-10-08 15:52:41','06'),
 (554,'tEstado','U','ADMIN','2010-10-08 15:52:41','07'),
 (555,'tEstado','U','ADMIN','2010-10-08 15:52:41','08'),
 (556,'tEstado','U','ADMIN','2010-10-08 15:52:41','09'),
 (557,'tEstado','U','ADMIN','2010-10-08 15:52:41','10'),
 (558,'tEstado','U','ADMIN','2010-10-08 15:52:41','11'),
 (559,'tEstado','U','ADMIN','2010-10-08 15:52:41','12'),
 (560,'tEstado','U','ADMIN','2010-10-08 15:52:41','13'),
 (561,'tEstado','U','ADMIN','2010-10-08 15:52:41','14'),
 (562,'tEstado','U','ADMIN','2010-10-08 15:52:41','15'),
 (563,'tEstado','U','ADMIN','2010-10-08 15:52:41','16'),
 (564,'tEstado','U','ADMIN','2010-10-08 15:52:41','17'),
 (565,'tEstado','U','ADMIN','2010-10-08 15:52:41','18'),
 (566,'tEstado','U','ADMIN','2010-10-08 15:52:41','19'),
 (567,'tEstado','U','ADMIN','2010-10-08 15:52:41','20'),
 (568,'tEstado','U','ADMIN','2010-10-08 15:52:41','21'),
 (569,'tEstado','U','ADMIN','2010-10-08 15:52:41','22'),
 (570,'tEstado','U','ADMIN','2010-10-08 15:52:41','23'),
 (571,'tEstado','U','ADMIN','2010-10-08 15:52:41','24'),
 (572,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0101'),
 (573,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0201'),
 (574,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0301'),
 (575,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0401'),
 (576,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0501'),
 (577,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0601'),
 (578,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0701'),
 (579,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0801'),
 (580,'tCiudad','U','ADMIN','2010-10-08 15:52:57','0901'),
 (581,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1001'),
 (582,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1101'),
 (583,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1201'),
 (584,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1301'),
 (585,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1401'),
 (586,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1501'),
 (587,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1502'),
 (588,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1601'),
 (589,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1701'),
 (590,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1702'),
 (591,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1703'),
 (592,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1704'),
 (593,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1801'),
 (594,'tCiudad','U','ADMIN','2010-10-08 15:52:57','1901'),
 (595,'tCiudad','U','ADMIN','2010-10-08 15:52:57','2001'),
 (596,'tCiudad','U','ADMIN','2010-10-08 15:52:57','2101'),
 (597,'tCiudad','U','ADMIN','2010-10-08 15:52:57','2201'),
 (598,'tCiudad','U','ADMIN','2010-10-08 15:52:57','2301'),
 (599,'tCiudad','U','ADMIN','2010-10-08 15:52:57','2401'),
 (600,'tsucursal','U','P','2010-10-08 15:53:49','1'),
 (601,'tsucursal','U','P','2010-10-08 15:53:58','2'),
 (602,'tusuario','D','CARLOS','2010-10-08 15:59:07','CARLOS'),
 (603,'truta','I','P','2010-10-08 17:32:51','13'),
 (604,'truta','I','P','2010-10-08 17:34:16','14'),
 (605,'truta','I','P','2010-10-08 17:36:11','15'),
 (606,'truta','I','P','2010-10-08 17:37:50','16'),
 (607,'tCiudad','I','P','2010-10-08 17:41:12','0202'),
 (608,'tCiudad','D','P','2010-10-08 17:41:49','0202'),
 (609,'tCiudad','I','P','2010-10-08 17:42:04','0202'),
 (610,'tCiudad','I','P','2010-10-08 17:42:18','0203'),
 (611,'tCiudad','D','P','2010-10-08 17:42:33','0203'),
 (612,'tCiudad','I','P','2010-10-08 17:43:05','0203'),
 (613,'tCiudad','I','P','2010-10-08 17:43:18','0204'),
 (614,'tCiudad','I','P','2010-10-08 17:43:33','0205'),
 (615,'tCiudad','I','P','2010-10-08 17:43:59','0206'),
 (616,'tCiudad','I','P','2010-10-08 17:44:28','0207'),
 (617,'tCiudad','I','P','2010-10-08 17:48:23','1503'),
 (618,'tCiudad','U','P','2010-10-08 17:48:36','1503'),
 (619,'tCiudad','I','P','2010-10-08 17:48:56','1504'),
 (620,'tCiudad','I','P','2010-10-08 17:49:25','1505'),
 (621,'tCiudad','I','P','2010-10-08 17:51:41','2202'),
 (622,'tCiudad','I','P','2010-10-08 17:52:03','2203'),
 (623,'tCiudad','I','P','2010-10-08 17:52:17','2204'),
 (624,'tCiudad','I','P','2010-10-08 17:57:47','1402'),
 (625,'tCiudad','I','P','2010-10-08 17:58:07','1403'),
 (626,'tCiudad','U','P','2010-10-08 17:58:26','1403'),
 (627,'tCiudad','I','P','2010-10-08 17:58:46','1404'),
 (628,'tCiudad','I','P','2010-10-08 17:59:06','1405'),
 (629,'tCiudad','I','P','2010-10-08 17:59:30','1406'),
 (630,'tCiudad','I','P','2010-10-08 17:59:49','1407'),
 (631,'tCiudad','I','P','2010-10-08 18:01:15','1002'),
 (632,'tCiudad','I','P','2010-10-08 18:03:51','0402'),
 (633,'tCiudad','I','P','2010-10-08 18:04:12','0403'),
 (634,'tCiudad','I','P','2010-10-08 18:04:28','0404'),
 (635,'tCiudad','I','P','2010-10-08 18:06:32','0802'),
 (636,'tCiudad','I','P','2010-10-08 18:06:42','0803'),
 (637,'tCiudad','I','P','2010-10-08 18:07:08','0804'),
 (638,'tCiudad','I','P','2010-10-08 18:08:25','2002'),
 (639,'tCiudad','I','P','2010-10-08 18:08:53','2003'),
 (640,'torigen_destino','I','P','2010-10-08 18:11:04','7'),
 (641,'torigen_destino','I','P','2010-10-08 18:11:41','8'),
 (642,'torigen_destino','I','P','2010-10-08 18:12:01','9'),
 (643,'torigen_destino','I','P','2010-10-08 18:12:30','10'),
 (644,'torigen_destino','I','P','2010-10-08 18:13:00','11'),
 (645,'torigen_destino','I','P','2010-10-08 18:13:21','12'),
 (646,'torigen_destino','I','P','2010-10-08 18:13:43','13'),
 (647,'torigen_destino','I','P','2010-10-08 18:13:59','14'),
 (648,'torigen_destino','I','P','2010-10-08 18:14:20','15'),
 (649,'torigen_destino','I','P','2010-10-08 18:15:05','16'),
 (650,'torigen_destino','I','P','2010-10-08 18:15:25','17'),
 (651,'torigen_destino','I','P','2010-10-08 18:15:45','18'),
 (652,'torigen_destino','I','P','2010-10-08 18:16:15','19'),
 (653,'torigen_destino','I','P','2010-10-08 18:16:37','20'),
 (654,'torigen_destino','I','P','2010-10-08 18:16:54','21'),
 (655,'torigen_destino','I','P','2010-10-08 18:19:55','22'),
 (656,'torigen_destino','I','P','2010-10-08 18:21:02','23'),
 (657,'torigen_destino','I','P','2010-10-08 18:21:17','24'),
 (658,'torigen_destino','I','P','2010-10-08 18:21:43','25'),
 (659,'torigen_destino','I','P','2010-10-08 18:22:04','26'),
 (660,'torigen_destino','I','P','2010-10-08 18:26:19','27'),
 (661,'tCiudad','I','P','2010-10-08 18:27:53','2302'),
 (662,'tCiudad','I','P','2010-10-08 18:28:22','2303'),
 (663,'tCiudad','I','P','2010-10-08 18:28:46','2304'),
 (664,'tCiudad','I','P','2010-10-08 18:29:09','2305'),
 (665,'torigen_destino','I','P','2010-10-08 18:30:46','28'),
 (666,'torigen_destino','I','P','2010-10-08 18:31:09','29'),
 (667,'torigen_destino','I','P','2010-10-08 18:32:02','30'),
 (668,'torigen_destino','I','P','2010-10-08 18:33:01','31'),
 (669,'torigen_destino','I','P','2010-10-08 18:33:35','32'),
 (670,'torigen_destino','I','P','2010-10-08 18:33:50','33'),
 (671,'torigen_destino','I','P','2010-10-08 18:34:07','34'),
 (672,'torigen_destino','I','P','2010-10-08 18:34:58','35'),
 (673,'tCiudad','I','P','2010-10-11 08:32:10','1102'),
 (674,'torigen_destino','I','P','2010-10-11 08:32:48','36'),
 (675,'truta','I','P','2010-10-11 08:35:09','136'),
 (676,'truta','I','P','2010-10-11 08:37:24','135'),
 (677,'truta','I','P','2010-10-11 08:39:55','114'),
 (678,'truta','I','P','2010-10-11 10:09:28','132'),
 (679,'truta','I','P','2010-10-11 10:10:26','134'),
 (680,'truta','I','P','2010-10-11 10:11:51','131'),
 (681,'truta','I','P','2010-10-11 10:14:53','133'),
 (682,'truta','I','P','2010-10-11 10:37:29','64'),
 (683,'truta','I','P','2010-10-11 10:40:01','126'),
 (684,'torigen_destino','D','P','2010-10-11 10:41:21','29'),
 (685,'truta','I','P','2010-10-13 08:21:48','128'),
 (686,'truta','I','P','2010-10-13 08:23:18','271'),
 (687,'truta','I','P','2010-10-13 08:31:32','116'),
 (688,'tPeriodo','I','P','2010-10-13 09:02:16','16091510'),
 (689,'tvehiculo','I','P','2010-10-13 09:03:09','65XPAC'),
 (690,'tChofer','I','P','2010-10-13 09:03:09','13486315'),
 (691,'tChofer','U','P','2010-10-13 09:03:53','13486315'),
 (692,'tvehiculo','I','P','2010-10-13 09:06:23','A75AD1/I'),
 (693,'tChofer','I','P','2010-10-13 09:06:23','9568641'),
 (694,'tvehiculo','I','P','2010-10-13 09:06:36','A86AA0D'),
 (695,'tChofer','I','P','2010-10-13 09:06:36','9562700'),
 (696,'tvehiculo','I','P','2010-10-13 09:06:44','A64AE3E'),
 (697,'tChofer','I','P','2010-10-13 09:06:44','9566638'),
 (698,'tChofer','U','P','2010-10-13 09:07:03','9562700'),
 (699,'tChofer','U','P','2010-10-13 09:07:37','9566638'),
 (700,'tChofer','U','P','2010-10-13 09:07:48','9568641'),
 (701,'tAnticipo','I','P','2010-10-13 09:10:19','100000001'),
 (702,'tviaje','I','P','2010-10-13 09:10:19','100000001'),
 (703,'tAnticipo','I','P','2010-10-13 09:16:51','100000002'),
 (704,'tviaje','I','P','2010-10-13 09:16:51','100000002'),
 (705,'tAnticipo','I','P','2010-10-13 09:18:46','0'),
 (707,'tAnticipo','D','P','2010-10-13 09:25:55','0'),
 (708,'tAnticipo','I','P','2010-10-13 09:27:44','100000003'),
 (709,'tAnticipo','I','P','2010-10-13 09:54:09','100000004'),
 (710,'tviaje','I','P','2010-10-13 09:54:09','100000003'),
 (711,'tviaje','I','','2010-10-13 09:56:00','100000004'),
 (712,'tAnticipo','I','P','2010-10-13 09:58:52','100000005'),
 (713,'tviaje','I','P','2010-10-13 09:58:53','100000005'),
 (714,'tviaje','I','P','2010-10-13 09:58:53','100000006'),
 (715,'ttipo_gasto','I','P','2010-10-13 10:02:17','01'),
 (716,'ttipo_gasto','I','P','2010-10-13 10:02:43','02'),
 (717,'ttipo_gasto','I','P','2010-10-13 10:03:25','06'),
 (718,'ttipo_gasto','I','P','2010-10-13 10:07:47','05'),
 (719,'tRelacion','I','P','2010-10-13 10:08:19','100000001'),
 (720,'tAnticipo','U','P','2010-10-13 10:08:19','100000005'),
 (721,'tRelacion','I','P','2010-10-13 10:09:45','100000002'),
 (722,'tAnticipo','U','P','2010-10-13 10:09:45','100000004'),
 (723,'tRelacion','I','P','2010-10-13 10:15:04','100000003'),
 (724,'tAnticipo','U','P','2010-10-13 10:15:04','100000001'),
 (725,'tRelacion','I','P','2010-10-13 10:20:48','100000004'),
 (726,'tAnticipo','U','P','2010-10-13 10:20:48','100000002'),
 (727,'tAnticipo','U','P','2010-10-13 10:20:48','100000003'),
 (728,'tperiodo','U','P','2010-10-13 10:27:32','16091510'),
 (729,'tperiodo','U','P','2010-10-13 12:08:52','16091510'),
 (735,'tAnticipo','U','P','2010-10-13 14:26:24','100000004'),
 (736,'trelacion','D','P','2010-10-13 14:26:24','100000002'),
 (737,'tRelacion','I','P','2010-10-13 14:36:51','100000005'),
 (738,'tAnticipo','U','P','2010-10-13 14:36:51','100000004'),
 (739,'tperiodo','U','P','2010-10-13 14:38:52','16091510'),
 (740,'tperiodo','U','P','2010-10-13 14:40:36','16091510'),
 (741,'tperiodo','U','P','2010-10-13 14:40:50','16091510'),
 (742,'tvehiculo','I','P','2010-10-13 14:43:41','A75A/D1I'),
 (743,'tAnticipo','I','P','2010-10-13 14:45:07','100000006'),
 (744,'tviaje','I','P','2010-10-13 14:45:07','100000007'),
 (745,'tgrupo_servicio','I','P','2010-10-13 15:14:43','01'),
 (746,'tservicio','I','P','2010-10-13 15:15:45','01'),
 (747,'tservicio','U','P','2010-10-13 15:15:58','01'),
 (748,'tservicio','U','P','2010-10-13 15:16:08','01');
/*!40000 ALTER TABLE `tbitacora` ENABLE KEYS */;


--
-- Definition of table `tchofer`
--

DROP TABLE IF EXISTS `tchofer`;
CREATE TABLE `tchofer` (
  `cid_chofer` varchar(9) NOT NULL,
  `cnombre` varchar(60) NOT NULL default '',
  `ccontraparte` varchar(10) default ' ',
  `cficha_nom` varchar(10) default ' ',
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ncontratado` tinyint(1) unsigned NOT NULL default '0',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`cid_chofer`,`nid_sucursal`),
  KEY `FK_tchofer_tsucursal` (`nid_sucursal`),
  KEY `FK_tchofer_ttranspext` USING BTREE (`nid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tchofer`
--

/*!40000 ALTER TABLE `tchofer` DISABLE KEYS */;
INSERT INTO `tchofer` (`cid_chofer`,`cnombre`,`ccontraparte`,`cficha_nom`,`nid_sucursal`,`cid_usuario`,`dfecha_act`,`ncontratado`,`nactivo`) VALUES 
 ('13486315','LUIS RAMON MORENO MA','111','123',1,'P','2010-10-13 09:03:53',0,1),
 ('9562700','SANCHEZ M. GUADALUPE','222','222',1,'P','2010-10-13 09:07:03',0,1),
 ('9566638','ROMERO CAMPINS,PEDRO','333','333',1,'P','2010-10-13 09:07:37',0,1),
 ('9568641','REA ESQUEA JOSE G.','444','444',1,'P','2010-10-13 09:07:48',0,1);
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
 ('0101','PUERTO AYACUCHO','01','ADMIN','2010-10-08 15:52:57'),
 ('0201','BARCELONA','02','ADMIN','2010-10-08 15:52:57'),
 ('0202','ANACO','02','P','2010-10-08 17:42:04'),
 ('0203','ARAGUA DE BARCELONA','02','P','2010-10-08 17:43:05'),
 ('0204','LECHERÍA','02','P','2010-10-08 17:43:18'),
 ('0205','PUERTO PÍRITU','02','P','2010-10-08 17:43:33'),
 ('0206','PUERTO LA CRUZ','02','P','2010-10-08 17:43:59'),
 ('0207','EL TIGRE','02','P','2010-10-08 17:44:28'),
 ('0301','SAN FERNANDO DE APURE','03','ADMIN','2010-10-08 15:52:57'),
 ('0401','MARACAY','04','ADMIN','2010-10-08 15:52:57'),
 ('0402','LA VICTORIA','04','P','2010-10-08 18:03:51'),
 ('0403','TURMERO','04','P','2010-10-08 18:04:12'),
 ('0404','CAGUA','04','P','2010-10-08 18:04:28'),
 ('0501','BARINAS','05','ADMIN','2010-10-08 15:52:57'),
 ('0601','CIUDAD BOLÍVAR','06','ADMIN','2010-10-08 15:52:57'),
 ('0701','VALENCIA','07','ADMIN','2010-10-08 15:52:57'),
 ('0801','SAN CARLOS','08','ADMIN','2010-10-08 15:52:57'),
 ('0802','TINAQUILLO','08','P','2010-10-08 18:06:32'),
 ('0803','TINACO','08','P','2010-10-08 18:06:42'),
 ('0804','APARTADERO','08','P','2010-10-08 18:07:08'),
 ('0901','TUCUPITA','09','ADMIN','2010-10-08 15:52:57'),
 ('1001','CORO','10','ADMIN','2010-10-08 15:52:57'),
 ('1002','PUNTO FIJO','10','P','2010-10-08 18:01:15'),
 ('1101','SAN JUAN DE LOS MORROS','11','ADMIN','2010-10-08 15:52:57'),
 ('1102','CALABOZO','11','P','2010-10-11 08:32:10'),
 ('1201','BARQUISIMETO','12','ADMIN','2010-10-08 15:52:57'),
 ('1301','MÉRIDA','13','ADMIN','2010-10-08 15:52:57'),
 ('1401','LOS TEQUES','14','ADMIN','2010-10-08 15:52:57'),
 ('1402','CHARALLAVE','14','P','2010-10-08 17:57:47'),
 ('1403','SANTA TERESA DEL TUY','14','P','2010-10-08 17:58:26'),
 ('1404','OCUMARE DEL TUY','14','P','2010-10-08 17:58:46'),
 ('1405','SAN ANTONIO DE LOS ALTOS','14','P','2010-10-08 17:59:06'),
 ('1406','CÚA','14','P','2010-10-08 17:59:30'),
 ('1407','GUATIRE','14','P','2010-10-08 17:59:49'),
 ('1501','MATURIN','15','ADMIN','2010-10-08 15:52:57'),
 ('1502','TEMBLADOR','15','ADMIN','2010-10-08 15:52:57'),
 ('1503','CARIPE','15','P','2010-10-08 17:48:36'),
 ('1504','PUNTA DE MATA','15','P','2010-10-08 17:48:56'),
 ('1505','BARRANCAS','15','P','2010-10-08 17:49:25'),
 ('1601','LA ASUNCIÓN','16','ADMIN','2010-10-08 15:52:57'),
 ('1701','GUANARE','17','ADMIN','2010-10-08 15:52:57'),
 ('1702','ACARIGUA','17','ADMIN','2010-10-08 15:52:57'),
 ('1703','ARAURE','17','ADMIN','2010-10-08 15:52:57'),
 ('1704','AGUA BLANCA','17','ADMIN','2010-10-08 15:52:57'),
 ('1801','CUMANÁ','18','ADMIN','2010-10-08 15:52:57'),
 ('1901','SAN CRISTÓBAL','19','ADMIN','2010-10-08 15:52:57'),
 ('2001','TRUJILLO','20','ADMIN','2010-10-08 15:52:57'),
 ('2002','BOCONO','20','P','2010-10-08 18:08:25'),
 ('2003','VALERA','20','P','2010-10-08 18:08:53'),
 ('2101','LA GUAIRA','21','ADMIN','2010-10-08 15:52:57'),
 ('2201','SAN FELIPE','22','ADMIN','2010-10-08 15:52:57'),
 ('2202','CHIVACOA','22','P','2010-10-08 17:51:41'),
 ('2203','NIRGUA','22','P','2010-10-08 17:52:03'),
 ('2204','YARITAGUA','22','P','2010-10-08 17:52:17'),
 ('2301','MARACAIBO','23','ADMIN','2010-10-08 15:52:57'),
 ('2302','CABIMAS','23','P','2010-10-08 18:27:53'),
 ('2303','CIUDAD OJEDA','23','P','2010-10-08 18:28:22'),
 ('2304','SAN FRANCISCO','23','P','2010-10-08 18:28:46'),
 ('2305','BACHAQUERO','23','P','2010-10-08 18:29:09'),
 ('2401','CARACAS','24','ADMIN','2010-10-08 15:52:57');
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
-- Definition of table `tcorrelativo`
--

DROP TABLE IF EXISTS `tcorrelativo`;
CREATE TABLE `tcorrelativo` (
  `nid_sucursal` int(4) unsigned zerofill NOT NULL default '0000',
  `nid_anticipo` int(10) unsigned zerofill NOT NULL default '0000000000',
  `nid_viaje` int(10) unsigned zerofill NOT NULL default '0000000000',
  `nid_relacion` int(10) unsigned zerofill NOT NULL default '0000000000',
  `nid_gasto` int(10) unsigned zerofill NOT NULL default '0000000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcorrelativo`
--

/*!40000 ALTER TABLE `tcorrelativo` DISABLE KEYS */;
INSERT INTO `tcorrelativo` (`nid_sucursal`,`nid_anticipo`,`nid_viaje`,`nid_relacion`,`nid_gasto`) VALUES 
 (0001,0100000006,0100000007,0100000005,0100000000),
 (0002,0200000000,0200000000,0200000000,0200000000),
 (0003,0300000000,0300000000,0300000000,0300000000),
 (0004,0400000000,0400000000,0400000000,0400000000),
 (0005,0500000000,0500000000,0500000000,0500000000),
 (0006,0600000000,0600000000,0600000000,0600000000);
/*!40000 ALTER TABLE `tcorrelativo` ENABLE KEYS */;


--
-- Definition of table `tdetalle_gasto`
--

DROP TABLE IF EXISTS `tdetalle_gasto`;
CREATE TABLE `tdetalle_gasto` (
  `nid_gasto` int(10) unsigned NOT NULL default '0',
  `cid_vehiculo` varchar(10) NOT NULL,
  `cid_servicio` varchar(3) NOT NULL,
  `ntotal` double NOT NULL default '0',
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
-- Definition of table `tdetalle_relacion`
--

DROP TABLE IF EXISTS `tdetalle_relacion`;
CREATE TABLE `tdetalle_relacion` (
  `nid_relacion` int(10) unsigned NOT NULL,
  `cid_tipogasto` varchar(2) NOT NULL,
  `nmonto` double NOT NULL,
  KEY `ix_relacion` (`nid_relacion`),
  KEY `FK_tdet_rel_ttipogasto` (`cid_tipogasto`),
  CONSTRAINT `FK_tdet_rel_trelacion` FOREIGN KEY (`nid_relacion`) REFERENCES `trelacion` (`nid_relacion`),
  CONSTRAINT `FK_tdet_rel_ttipogasto` FOREIGN KEY (`cid_tipogasto`) REFERENCES `ttipo_gasto` (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_relacion`
--

/*!40000 ALTER TABLE `tdetalle_relacion` DISABLE KEYS */;
INSERT INTO `tdetalle_relacion` (`nid_relacion`,`cid_tipogasto`,`nmonto`) VALUES 
 (100000001,'06',450),
 (100000001,'01',100),
 (100000001,'02',10),
 (100000001,'05',56),
 (100000003,'06',110),
 (100000003,'05',52),
 (100000004,'06',250),
 (100000004,'01',800),
 (100000004,'05',14),
 (100000004,'02',35),
 (100000005,'06',450),
 (100000005,'01',120),
 (100000005,'05',56),
 (100000005,'02',20);
/*!40000 ALTER TABLE `tdetalle_relacion` ENABLE KEYS */;


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
 ('01','AMAZONAS','ADMIN','2010-10-08 15:52:41'),
 ('02','ANZOÁTEGUI','ADMIN','2010-10-08 15:52:41'),
 ('03','APURE','ADMIN','2010-10-08 15:52:41'),
 ('04','ARAGUA','ADMIN','2010-10-08 15:52:41'),
 ('05','BARINAS','ADMIN','2010-10-08 15:52:41'),
 ('06','BOLÍVAR','ADMIN','2010-10-08 15:52:41'),
 ('07','CARABOBO','ADMIN','2010-10-08 15:52:41'),
 ('08','COJEDES','ADMIN','2010-10-08 15:52:41'),
 ('09','DELTA AMACURO','ADMIN','2010-10-08 15:52:41'),
 ('10','FALCÓN','ADMIN','2010-10-08 15:52:41'),
 ('11','GUÁRICO','ADMIN','2010-10-08 15:52:41'),
 ('12','LARA','ADMIN','2010-10-08 15:52:41'),
 ('13','MÉRIDA','ADMIN','2010-10-08 15:52:41'),
 ('14','MIRANDA','ADMIN','2010-10-08 15:52:41'),
 ('15','MONAGAS','ADMIN','2010-10-08 15:52:41'),
 ('16','NUEVA ESPARTA','ADMIN','2010-10-08 15:52:41'),
 ('17','PORTUGUESA','ADMIN','2010-10-08 15:52:41'),
 ('18','SUCRE','ADMIN','2010-10-08 15:52:41'),
 ('19','TÁCHIRA','ADMIN','2010-10-08 15:52:41'),
 ('20','TRUJILLO','ADMIN','2010-10-08 15:52:41'),
 ('21','VARGAS','ADMIN','2010-10-08 15:52:41'),
 ('22','YARACUY','ADMIN','2010-10-08 15:52:41'),
 ('23','ZULIA','ADMIN','2010-10-08 15:52:41'),
 ('24','DISTRITO CAPITAL','ADMIN','2010-10-08 15:52:41');
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
  `cfactura` varchar(10) NOT NULL default ' ',
  `ntotal` double NOT NULL default '0',
  `crif_emp` varchar(12) default ' ',
  `cnombre_emp` varchar(60) default ' ',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cobservacion` text,
  `nstatus` tinyint(1) unsigned NOT NULL default '0' COMMENT '1:Normal, 2:Contabilizado',
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
 ('01','GRUPO 1','P','2010-10-13 15:14:43','');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torigen_destino`
--

/*!40000 ALTER TABLE `torigen_destino` DISABLE KEYS */;
INSERT INTO `torigen_destino` (`nid_origdest`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`nactivo`,`norigen`,`nsucursal`) VALUES 
 (1,'OFICINA PRINCIPAL','1703','P','2010-10-08 15:15:07',1,1,1),
 (2,'CENTRO OCCIDENTE','1703','P','2010-10-08 15:18:00',1,1,1),
 (3,'CARACAS','2401','P','2010-10-08 15:18:42',1,1,1),
 (4,'VALENCIA','0701','P','2010-10-08 15:20:20',1,1,1),
 (5,'BARCELONA','0201','P','2010-10-08 15:22:13',1,1,1),
 (6,'MARACAIBO','2301','P','2010-10-08 15:22:37',1,1,1),
 (7,'PUERTO AYACUCHO','0101','P','2010-10-08 18:11:04',1,0,0),
 (8,'SAN FERNANDO DE APURE','0301','P','2010-10-08 18:11:41',1,0,0),
 (9,'MARACAY','0401','P','2010-10-08 18:12:01',1,0,0),
 (10,'BARINAS','0501','P','2010-10-08 18:12:30',1,0,0),
 (11,'CIUDAD BOLÍVAR','0601','P','2010-10-08 18:13:00',1,0,0),
 (12,'SAN CARLOS','0801','P','2010-10-08 18:13:21',1,0,0),
 (13,'TUCUPITA','0901','P','2010-10-08 18:13:43',1,0,0),
 (14,'CORO','1001','P','2010-10-08 18:13:59',1,0,0),
 (15,'SAN JUAN DE LOS MORROS','1101','P','2010-10-08 18:14:20',1,0,0),
 (16,'BARQUISIMETO','1201','P','2010-10-08 18:15:05',1,0,0),
 (17,'MÉRIDA','1301','P','2010-10-08 18:15:25',1,0,0),
 (18,'LOS TEQUES','1401','P','2010-10-08 18:15:45',1,0,0),
 (19,'MATURIN','1501','P','2010-10-08 18:16:15',1,0,0),
 (20,'LA ASUNCIÓN','1601','P','2010-10-08 18:16:37',1,0,0),
 (21,'GUANARE','1701','P','2010-10-08 18:16:54',1,0,0),
 (22,'CUMANÁ','1801','P','2010-10-08 18:19:55',1,0,0),
 (23,'SAN CRISTÓBAL','1901','P','2010-10-08 18:21:02',1,0,0),
 (24,'TRUJILLO','2001','P','2010-10-08 18:21:17',1,0,0),
 (25,'LA GUAIRA','2101','P','2010-10-08 18:21:43',1,0,0),
 (26,'SAN FELIPE','2201','P','2010-10-08 18:22:04',1,0,0),
 (27,'PUERTO LA CRUZ','0201','P','2010-10-08 18:26:19',1,1,0),
 (28,'TEMBLADOR','1502','P','2010-10-08 18:30:46',1,0,0),
 (30,'SAN FRANCISCO','2304','P','2010-10-08 18:32:02',1,1,0),
 (31,'GUATIRE','1407','P','2010-10-08 18:33:01',1,0,0),
 (32,'CAGUA','0404','P','2010-10-08 18:33:35',1,0,0),
 (33,'VALERA','2003','P','2010-10-08 18:33:50',1,0,0),
 (34,'APARTADERO','0804','P','2010-10-08 18:34:07',1,0,0),
 (35,'CHARALLAVE','1402','P','2010-10-08 18:34:58',1,0,0),
 (36,'CALABOZO','1102','P','2010-10-11 08:32:48',1,1,0);
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
 ('16091510','2010-09-16','2010-10-15','SEPT 2010 - OCT 2010','P','2010-10-13 14:40:50',1);
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
-- Definition of table `trelacion`
--

DROP TABLE IF EXISTS `trelacion`;
CREATE TABLE `trelacion` (
  `nid_relacion` int(10) unsigned NOT NULL default '0',
  `dfecha` date NOT NULL default '1900-01-01',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cobservacion` text,
  `nstatus` tinyint(1) unsigned NOT NULL default '0' COMMENT '1: Normal, 2: Contabilizado',
  PRIMARY KEY  (`nid_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trelacion`
--

/*!40000 ALTER TABLE `trelacion` DISABLE KEYS */;
INSERT INTO `trelacion` (`nid_relacion`,`dfecha`,`cid_usuario`,`dfecha_act`,`cobservacion`,`nstatus`) VALUES 
 (100000001,'2010-10-13','P','2010-10-13 10:08:19','relacion ant 100000005',1),
 (100000003,'2010-10-13','P','2010-10-13 10:15:04','rel ant 100000001',1),
 (100000004,'2010-10-13','P','2010-10-13 10:20:48','relacion anticipos 100000002 y 100000003',1),
 (100000005,'2010-10-13','P','2010-10-13 14:36:51','relacion del ant 100000004.',1);
/*!40000 ALTER TABLE `trelacion` ENABLE KEYS */;


--
-- Definition of trigger `tgtrelacion_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtrelacion_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtrelacion_insert` AFTER INSERT ON `trelacion` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tRelacion','I',New.cId_Usuario,now(),cast(new.nid_relacion as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtrelacion_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtrelacion_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtrelacion_update` AFTER UPDATE ON `trelacion` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('trelacion','U',New.cId_Usuario,now(),cast(new.nid_relacion as char));
End $$

DELIMITER ;

--
-- Definition of trigger `tgtrelacion_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtrelacion_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtrelacion_delete` BEFORE DELETE ON `trelacion` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('trelacion','D',Old.cId_Usuario,now(),cast(Old.nid_relacion as char));
End $$

DELIMITER ;

--
-- Definition of table `truta`
--

DROP TABLE IF EXISTS `truta`;
CREATE TABLE `truta` (
  `nid_origen` int(4) unsigned NOT NULL default '0',
  `nid_destino` int(4) unsigned NOT NULL default '0',
  `ndistancia` double NOT NULL default '0',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cdescripcion` varchar(60) NOT NULL default ' ',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `nporc_com` int(2) unsigned NOT NULL default '0',
  `ncom_pes` double NOT NULL default '0',
  `ncom_med` double NOT NULL default '0',
  `ncom_liv` double NOT NULL default '0',
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
INSERT INTO `truta` (`nid_origen`,`nid_destino`,`ndistancia`,`cid_usuario`,`dfecha_act`,`cdescripcion`,`nactivo`,`nporc_com`,`ncom_pes`,`ncom_med`,`ncom_liv`) VALUES 
 (1,3,343,'P','2010-10-08 17:32:51','OFIC. PPAL. - CARACAS SUC.',1,100,13.45,22.86,39),
 (1,4,185,'P','2010-10-08 17:34:16','OFIC. PPAL. - VALENCIA SUC.',1,100,9.2,15.65,26.69),
 (1,5,628,'P','2010-10-08 17:36:11','OFIC. PPAL. - BARCELONA SUC.',1,100,20,34,58),
 (1,6,440,'P','2010-10-08 17:37:50','OFIC. PPAL. - MARACAIBO SUC.',1,100,16.14,27.44,46.81),
 (1,14,371,'P','2010-10-11 08:39:55','OFIC. PPAL. - CORO',1,100,14.54,24.72,42.17),
 (1,16,86,'P','2010-10-13 08:31:32','OFIC. PPAL. - BARQUISIMETO',1,100,6.96,11.83,20.18),
 (1,26,157,'P','2010-10-11 10:40:01','OFIC. PPAL. - SAN FELIPE',1,100,8.83,15.01,25.61),
 (1,28,921,'P','2010-10-13 08:21:48','OFIC. PPAL. - TEMBLADOR',1,100,28.43,48.32,82.44),
 (1,31,400,'P','2010-10-11 10:11:51','OFIC. PPAL. - GUATIRE',1,100,15.29,25.99,44.34),
 (1,32,301,'P','2010-10-11 10:09:28','OFIC. PPAL. - CAGUA',1,100,12.73,21.64,36.92),
 (1,33,320,'P','2010-10-11 10:14:53','OFIC. PPAL. - VALERA',1,100,13.27,22.56,38.48),
 (1,34,47,'P','2010-10-11 10:10:26','OFIC. PPAL. - APARTADERO',1,100,5.8,9.87,16.83),
 (1,35,339,'P','2010-10-11 08:37:24','OFIC. PPAL. - CHARALLAVE',1,100,13.79,23.44,39.99),
 (1,36,326,'P','2010-10-11 08:35:09','OFIC. PPAL. - CALABOZO',1,100,13.42,22.81,38.91),
 (6,4,522,'P','2010-10-11 10:37:29','SAN FRANCISCO - VALENCIA',1,100,0.01,0.01,0.01),
 (27,1,633,'P','2010-10-13 08:23:18','PTO LA CRUZ - OFIC. PPAL.',1,100,20.09,34.16,58.27);
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
  `ccta_cont` varchar(10) NOT NULL default ' ',
  `cdescrip_cta` varchar(60) NOT NULL default ' ',
  `ncontabiliza` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`cid_servicio`),
  KEY `FK_tservicio_tgrupo_s` (`cid_grupo`),
  CONSTRAINT `FK_tservicio_tgrupo_s` FOREIGN KEY (`cid_grupo`) REFERENCES `tgrupo_servicio` (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tservicio`
--

/*!40000 ALTER TABLE `tservicio` DISABLE KEYS */;
INSERT INTO `tservicio` (`cid_servicio`,`cdescripcion`,`cid_grupo`,`cid_usuario`,`dfecha_act`,`ccta_cont`,`cdescrip_cta`,`ncontabiliza`) VALUES 
 ('01','SERVICIO 1','01','P','2010-10-13 15:16:08','7202030009','Mant/Repara.Vehículos',1);
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
  `nactivo` tinyint(1) unsigned default '0',
  `nbono_alm` double(7,4) default '0.0000' COMMENT 'Incentivo por carga total despachada en el mes para el jefe de almacen',
  `nbono_mon` double(7,4) default '0.0000' COMMENT 'Incentivo por carga total despachada en el mes para el montacarguista',
  PRIMARY KEY  USING BTREE (`nid_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

/*!40000 ALTER TABLE `tsucursal` DISABLE KEYS */;
INSERT INTO `tsucursal` (`nid_sucursal`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`ncap_carga`,`nid_origdest`,`nactivo`,`nbono_alm`,`nbono_mon`) VALUES 
 (1,'OFICINA PRINCIPAL','1703','P','2010-10-08 15:53:49',10000000,1,1,0.0000,0.0000),
 (2,'CENTRO OCCIDENTE','1703','P','2010-10-08 15:53:58',10000000,2,1,0.0000,0.0000),
 (3,'CARACAS','2401','P','2010-10-08 15:28:15',1600000,3,1,0.1800,0.0040),
 (4,'VALENCIA','0701','P','2010-10-08 15:26:49',700000,4,1,0.1800,0.0040),
 (5,'BARCELONA','0201','P','2010-10-08 15:27:26',700000,5,1,0.1800,0.0040),
 (6,'MARACAIBO','2301','P','2010-10-08 15:27:47',10,6,1,0.1800,0.0040);
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
  update torigen_destino set cId_Usuario = old.cId_Usuario, nactivo = 0 where nid_origdest = old.nid_origdest;
End $$

DELIMITER ;

--
-- Definition of table `ttipo_gasto`
--

DROP TABLE IF EXISTS `ttipo_gasto`;
CREATE TABLE `ttipo_gasto` (
  `cid_tipogasto` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL default ' ',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL default ' ',
  `cdescrip_cta` varchar(60) NOT NULL,
  PRIMARY KEY  (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttipo_gasto`
--

/*!40000 ALTER TABLE `ttipo_gasto` DISABLE KEYS */;
INSERT INTO `ttipo_gasto` (`cid_tipogasto`,`cdescripcion`,`cid_usuario`,`dfecha_act`,`ccta_cont`,`cdescrip_cta`) VALUES 
 ('01','CALETAS','P','2010-10-13 10:02:17','7202030013','Caletas y Acarreos'),
 ('02','GASOIL','P','2010-10-13 10:02:43','7202030009','Mant/Repara.Vehículos'),
 ('05','PEAJES','P','2010-10-13 10:07:47','7202030009','Mant/Repara.Vehículos'),
 ('06','VIATICOS (COMIDA)','P','2010-10-13 10:03:25','7202030013','Caletas y Acarreos');
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
-- Definition of table `ttransporte_ext`
--

DROP TABLE IF EXISTS `ttransporte_ext`;
CREATE TABLE `ttransporte_ext` (
  `crif` varchar(15) NOT NULL default ' ',
  `cnombre` varchar(60) NOT NULL default ' ',
  `nporc_ret` double default '0' COMMENT 'Porcentaje de retencion de iva',
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nactivo` tinyint(1) unsigned default '0',
  PRIMARY KEY  USING BTREE (`crif`,`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttransporte_ext`
--

/*!40000 ALTER TABLE `ttransporte_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttransporte_ext` ENABLE KEYS */;


--
-- Definition of trigger `tgttransporte_ext_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgttransporte_ext_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgttransporte_ext_insert` AFTER INSERT ON `ttransporte_ext` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttransporte_ext','I',New.cId_Usuario,now(),new.crif);
End $$

DELIMITER ;

--
-- Definition of trigger `tgttransporte_ext_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgttransporte_ext_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgttransporte_ext_update` AFTER UPDATE ON `ttransporte_ext` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttransporte_ext','U',New.cId_Usuario,now(),new.crif);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtttransporte_ext_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtttransporte_ext_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtttransporte_ext_delete` BEFORE DELETE ON `ttransporte_ext` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttransporte_ext','D',OLD.cId_Usuario,now(),OLD.crif);
End $$

DELIMITER ;

--
-- Definition of table `tusuario`
--

DROP TABLE IF EXISTS `tusuario`;
CREATE TABLE `tusuario` (
  `cid_usuario` varchar(20) NOT NULL,
  `cnombre` varchar(45) NOT NULL,
  `cclave` varchar(10) NOT NULL default '0',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `nfrmalmacenistas` tinyint(1) unsigned NOT NULL default '0',
  `nfrmanticipo_viaje` tinyint(1) unsigned NOT NULL default '0',
  `nfrmcargar_anticipo` tinyint(1) unsigned NOT NULL default '0',
  `nfrmcargar_viaje` tinyint(1) unsigned NOT NULL default '0',
  `nfrmcargar_viaje_ext` tinyint(1) unsigned NOT NULL default '0',
  `nfrmchoferes` tinyint(1) unsigned NOT NULL default '0',
  `nfrmciudades` tinyint(1) unsigned NOT NULL default '0',
  `nfrmestados` tinyint(1) unsigned NOT NULL default '0',
  `nfrmgasto_servicio` tinyint(1) unsigned NOT NULL default '0',
  `nfrmgrupos_serv` tinyint(1) unsigned NOT NULL default '0',
  `nfrmmontacarguistas` tinyint(1) unsigned NOT NULL default '0',
  `nfrmorigendestinos` tinyint(1) unsigned NOT NULL default '0',
  `nfrmperiodos` tinyint(1) unsigned NOT NULL default '0',
  `nfrmrelacion` tinyint(1) unsigned NOT NULL default '0',
  `nfrmrutas` tinyint(1) unsigned NOT NULL default '0',
  `nfrmservicios` tinyint(1) unsigned NOT NULL default '0',
  `nfrmsucursales` tinyint(1) unsigned NOT NULL default '0',
  `nfrmtipo_gastos` tinyint(1) unsigned NOT NULL default '0',
  `nfrmtransp_ext` tinyint(1) unsigned NOT NULL default '0',
  `nfrmusuarios` tinyint(1) unsigned NOT NULL default '0',
  `nfrmvehiculos` tinyint(1) unsigned NOT NULL default '0',
  `nfrmviajes` tinyint(1) unsigned NOT NULL default '0',
  `ncerrar_periodos` tinyint(1) unsigned NOT NULL default '0',
  `nmov_fperiodo` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cid_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tusuario`
--

/*!40000 ALTER TABLE `tusuario` DISABLE KEYS */;
INSERT INTO `tusuario` (`cid_usuario`,`cnombre`,`cclave`,`nactivo`,`nfrmalmacenistas`,`nfrmanticipo_viaje`,`nfrmcargar_anticipo`,`nfrmcargar_viaje`,`nfrmcargar_viaje_ext`,`nfrmchoferes`,`nfrmciudades`,`nfrmestados`,`nfrmgasto_servicio`,`nfrmgrupos_serv`,`nfrmmontacarguistas`,`nfrmorigendestinos`,`nfrmperiodos`,`nfrmrelacion`,`nfrmrutas`,`nfrmservicios`,`nfrmsucursales`,`nfrmtipo_gastos`,`nfrmtransp_ext`,`nfrmusuarios`,`nfrmvehiculos`,`nfrmviajes`,`ncerrar_periodos`,`nmov_fperiodo`) VALUES 
 ('ADMIN','ADMINISTRADOR','ËÍÉÍÍÈËÉÍ',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0),
 ('P','PEDRO PAPIC','',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0);
/*!40000 ALTER TABLE `tusuario` ENABLE KEYS */;


--
-- Definition of trigger `tgtusuario_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtusuario_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtusuario_insert` AFTER INSERT ON `tusuario` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tusuario','I',New.cId_Usuario,now(),new.cid_usuario);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtusuario_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtusuario_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtusuario_update` AFTER UPDATE ON `tusuario` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tusuario','U',New.cId_Usuario,now(),new.cid_usuario);
End $$

DELIMITER ;

--
-- Definition of trigger `tgtusuario_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtusuario_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtusuario_delete` BEFORE DELETE ON `tusuario` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tusuario','D',OLD.cId_Usuario,now(),OLD.cid_usuario);
End $$

DELIMITER ;

--
-- Definition of table `tvehiculo`
--

DROP TABLE IF EXISTS `tvehiculo`;
CREATE TABLE `tvehiculo` (
  `cid_vehiculo` varchar(10) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL default ' ',
  `cmarca` varchar(30) default ' ',
  `cserial_motor` varchar(30) default ' ',
  `cserial_carroc` varchar(30) default ' ',
  `ntara` double default '0',
  `ncapacidad` double default '0',
  `ctipo_vehic` int(1) unsigned default '0' COMMENT '1:Liviano (<13Ton),  2:Mediano (13Ton<=X<=25Ton),  3:Pesado(>25Ton)',
  `ncosto` double default '0',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `npropio` int(1) unsigned NOT NULL default '0',
  `nvolumen` double default '0',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `crif_empext` varchar(15) default ' ' COMMENT 'Empresa transportista, en caso de que el vehículo sea contratado',
  PRIMARY KEY  (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tvehiculo`
--

/*!40000 ALTER TABLE `tvehiculo` DISABLE KEYS */;
INSERT INTO `tvehiculo` (`cid_vehiculo`,`cdescripcion`,`cmarca`,`cserial_motor`,`cserial_carroc`,`ntara`,`ncapacidad`,`ctipo_vehic`,`ncosto`,`cid_usuario`,`dfecha_act`,`npropio`,`nvolumen`,`nactivo`,`nid_sucursal`,`crif_empext`) VALUES 
 ('65XPAC','MACK  CH613',' ',' ',' ',0,0,0,0,'P','2010-10-13 09:03:09',0,0,1,1,' '),
 ('A64AE3E','CAMION-CHASIS',' ',' ',' ',0,0,0,0,'P','2010-10-13 09:06:44',0,0,1,1,' '),
 ('A75A/D1I','CAMIION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-10-13 14:43:41',0,0,1,1,' '),
 ('A75AD1/I','CAMIION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-10-13 09:06:23',0,0,1,1,' '),
 ('A86AA0D','CAMION MACK',' ',' ',' ',0,0,0,0,'P','2010-10-13 09:06:36',0,0,1,1,' ');
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
  `nid_viaje` int(14) unsigned NOT NULL default '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date default NULL,
  `cobservacion` text,
  `cguia` varchar(10) default ' ',
  `corden_carga` varchar(10) default ' ',
  `dfecha_guia` date default '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double default '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nid_origen` int(4) unsigned NOT NULL default '0',
  `nid_destino` int(4) unsigned NOT NULL default '0',
  `cid_periodo` varchar(10) NOT NULL default ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL default '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos',
  `nid_sucursal_guia` int(4) unsigned default '0',
  `ndistancia` double default '0',
  `nstatus` tinyint(1) unsigned NOT NULL default '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) default '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) default ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  PRIMARY KEY  USING BTREE (`nid_viaje`),
  KEY `FK_tviaje_tchofer` (`cid_chofer`),
  KEY `FK_tviaje_tvehiculo` (`cid_vehiculo`),
  KEY `FK_tviaje_tperiodo` (`cid_periodo`),
  KEY `FK_tviaje_truta` (`nid_origen`,`nid_destino`),
  KEY `ix_orden_c` (`corden_carga`),
  KEY `ix_fact_ext` (`cfactura_ext`),
  CONSTRAINT `FK_tviaje_tchofer` FOREIGN KEY (`cid_chofer`) REFERENCES `tchofer` (`cid_chofer`),
  CONSTRAINT `FK_tviaje_tperiodo` FOREIGN KEY (`cid_periodo`) REFERENCES `tperiodo` (`cid_periodo`),
  CONSTRAINT `FK_tviaje_truta` FOREIGN KEY (`nid_origen`, `nid_destino`) REFERENCES `truta` (`nid_origen`, `nid_destino`),
  CONSTRAINT `FK_tviaje_tvehiculo` FOREIGN KEY (`cid_vehiculo`) REFERENCES `tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tviaje`
--

/*!40000 ALTER TABLE `tviaje` DISABLE KEYS */;
INSERT INTO `tviaje` (`nid_viaje`,`cid_chofer`,`cid_vehiculo`,`dfecha`,`cobservacion`,`cguia`,`corden_carga`,`dfecha_guia`,`npeso_neto`,`cid_usuario`,`dfecha_act`,`nid_origen`,`nid_destino`,`cid_periodo`,`ntipo_viaje`,`nid_sucursal_guia`,`ndistancia`,`nstatus`,`cfactura_ext`,`ccliente_ext`) VALUES 
 (100000001,'13486315','65XPAC','2010-10-13','viaje val','15933','17154','2010-09-17',34970,'P','2010-10-13 09:10:19',1,4,'16091510',1,1,185,1,'',''),
 (100000002,'9566638','A64AE3E','2010-10-13','viaje temblador','15970','17202','2010-09-20',19330,'P','2010-10-13 09:16:51',1,28,'16091510',1,1,921,1,'',''),
 (100000003,'9568641','A75AD1/I','2010-10-13','viaje barc\r\n','15930','17156','2010-09-17',33120,'P','2010-10-13 09:54:09',1,5,'16091510',1,1,628,1,'',''),
 (100000004,'9568641','A75AD1/I','2010-10-13','viaje ext pto a op','','','2010-09-20',28560,'','2010-10-13 09:56:00',27,1,'16091510',2,0,633,1,'CEMEX','323985'),
 (100000005,'9562700','A86AA0D','2010-10-13','viaje a barc','16045','17271','2010-09-23',33170,'P','2010-10-13 09:58:53',1,5,'16091510',1,1,628,1,'',''),
 (100000006,'9562700','A86AA0D','2010-10-13','viaje pto la c - op','','','2010-09-24',28560,'P','2010-10-13 09:58:53',27,1,'16091510',1,0,633,1,'CEMEX','334591'),
 (100000007,'9568641','A75A/D1I','2010-10-13','viaje a coro','16079','17317','2010-09-24',30180,'P','2010-10-13 14:45:07',1,14,'16091510',1,1,371,1,'','');
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
-- Definition of procedure `Sp_Correlativo`
--

DROP PROCEDURE IF EXISTS `Sp_Correlativo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Correlativo`(tNid_Sucursal int(4),tcCampo varchar(20))
BEGIN
        Create Temporary Table ttCorr (nid_movimiento Integer);
        Set @lcCmd = concat('insert into ttCorr(nid_movimiento) ','select ', tcCampo ,' from tcorrelativo where nid_sucursal = ',tNid_Sucursal);
        PREPARE lcCorr FROM @lcCmd;
        EXECUTE lcCorr;
        Set @lNid_Movimiento = ((Select nid_movimiento From ttCorr)+1);
--        set @lcReturn = concat(cast(tNid_Sucursal as char),cast(lpad((@lNid_Movimiento+1),6,0) as char));
        Drop Temporary Table ttCorr;
        Select @lNid_Movimiento As nid_correlativo;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_delete_tgasto_tdetalle_gasto`
--

DROP PROCEDURE IF EXISTS `sp_delete_tgasto_tdetalle_gasto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tgasto_tdetalle_gasto`(tnid_gasto int(10))
BEGIN
   Declare nError Int(10);
   Start Transaction;

      delete from tgasto_serv where nid_gasto = tnid_gasto;
      delete from tdetalle_gasto where nid_gasto = tnid_gasto;

   Set nError =(Select @Error);
   if(nError>0) then
      ROLLBACK;
   else
      COMMIT;
   end if;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Sp_Eliminar_Relacion`
--

DROP PROCEDURE IF EXISTS `Sp_Eliminar_Relacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Eliminar_Relacion`(tnid_relacion integer)
BEGIN
   Declare nError Int(10);
   Start Transaction;

   update tanticipo set nstatus = 1,nid_relacion = NULL where nid_relacion = tnid_relacion;
   delete from tdetalle_relacion where nid_relacion = tnid_relacion;
   delete from trelacion where nid_relacion = tnid_relacion;

   Set nError =(Select @Error);
   if(nError>0) then
      ROLLBACK;
   else
      COMMIT;
   end if;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Sp_Insert_tCorrelativo`
--

DROP PROCEDURE IF EXISTS `Sp_Insert_tCorrelativo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Insert_tCorrelativo`(tNid_Sucursal Int(4))
BEGIN
        Set @lcCmd = concat('insert into tCorrelativo values (',tNid_Sucursal,',',rpad(tNid_Sucursal,9,0),',',rpad(tNid_Sucursal,9,0),',',rpad(tNid_Sucursal,9,0),',',rpad(tNid_Sucursal,9,0),')');
        PREPARE lcCorr FROM @lcCmd;
        EXECUTE lcCorr;
--        select @lccMd;




     /*
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Correlativo`(tNid_Sucursal int(4),tcCampo varchar(20))
BEGIN
        Create Temporary Table ttCorr (nid_movimiento Integer);
        Set @lcCmd = concat('insert into ttCorr(nid_movimiento) ','select ', tcCampo ,' from tcorrelativo where nid_sucursal = ',tNid_Sucursal);
        PREPARE lcCorr FROM @lcCmd;
        EXECUTE lcCorr;
        Set @lNid_Movimiento = ((Select nid_movimiento From ttCorr)+1);
--        set @lcReturn = concat(cast(tNid_Sucursal as char),cast(lpad((@lNid_Movimiento+1),6,0) as char));
        Drop Temporary Table ttCorr;
        Select @lNid_Movimiento As nid_correlativo;
END*/
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
