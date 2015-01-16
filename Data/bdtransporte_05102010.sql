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
 ('ADMIN','C:/DATASPC/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('ADMIN','C:/DATASPC/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('ADMIN','C:/DATASPC/CARACAS/COBRANZAS/COBDATOS/',4),
 ('CARLOS','C:/DATASPC/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('P','C:/DATASPC/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('P','C:/DATASPC/COCCIDEN/COBRANZAS/COBDATOS/',2);
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
INSERT INTO `talmacenista` (`cid_almacenista`,`cnombre`,`cficha_nom`,`nid_sucursal`,`nactivo`,`cid_usuario`,`dfecha_act`,`nmontacarguista`) VALUES 
 ('321','321ASD','321',1,1,'P','2010-10-04 10:49:12',0),
 ('324','65WQ4E','654',1,0,'P','2010-10-04 10:50:44',0);
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
 (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,5),
 (6,6),
 (7,7),
 (9,24),
 (10,25),
 (11,26),
 (11,29),
 (17,31),
 (27,31),
 (21,32),
 (17,33),
 (27,33),
 (22,34),
 (26,34),
 (28,35),
 (29,35),
 (30,37),
 (31,38),
 (32,39),
 (32,40);
/*!40000 ALTER TABLE `tanticip_tviaje` ENABLE KEYS */;


--
-- Definition of table `tanticipo`
--

DROP TABLE IF EXISTS `tanticipo`;
CREATE TABLE `tanticipo` (
  `nid_anticipo` int(10) unsigned NOT NULL auto_increment,
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo`
--

/*!40000 ALTER TABLE `tanticipo` DISABLE KEYS */;
INSERT INTO `tanticipo` (`nid_anticipo`,`cnro_recibo`,`nmonto`,`cid_usuario`,`dfecha_act`,`cobservacion`,`dfecha`,`nstatus`,`nid_relacion`,`nrelacionado`) VALUES 
 (1,'183939',680,'P','2010-09-09 10:11:31','PRIMER ANTICIPO  680','2010-08-02',1,NULL,0),
 (2,'183933',350,'P','2010-09-09 10:11:31','SEG ANTICIPO SAN CRISTOBAL\r\n','2010-08-02',1,NULL,0),
 (3,'183934',230,'P','2010-09-09 10:11:31','ANTICIPO 3','2010-08-02',1,NULL,0),
 (4,'180932',440,'P','2010-09-09 10:11:31','4anticip\r\n','2010-08-02',1,NULL,0),
 (5,'180934',400,'P','2010-09-09 10:11:31','ANTICIPO 5\r\n','2010-08-02',1,NULL,0),
 (6,'180926',390,'P','2010-09-09 10:11:31','ANTICIPO 6','2010-08-02',1,NULL,0),
 (7,'183962',230,'P','2010-09-09 10:11:31','ant 10\r\n','2010-08-03',1,NULL,0),
 (9,'180911',390,'P','2010-09-09 10:11:31','ANT COCC 04','2010-08-03',1,NULL,0),
 (10,'180927',410,'P','2010-09-09 10:11:31','5to anticipo cocc3444\r\n','2010-08-03',1,NULL,0),
 (11,'183944',880,'P','2010-09-09 10:11:31','op bolivar1','2010-08-04',1,NULL,0),
 (17,'184566',500,'P','2010-09-09 10:11:31','ant 12\r\n','2010-08-18',1,NULL,0),
 (21,'184573',160,'P','2010-09-09 10:11:31','ant jose\r\n','2010-08-18',1,NULL,0),
 (22,'186590',230,'P','2010-10-04 17:50:46','ant caracas','2010-09-08',2,1,1),
 (26,'1865901',100,'P','2010-09-09 10:11:31','ant adic al 186590\r\n','2010-09-09',3,NULL,0),
 (27,'9999',200,'P','2010-09-28 08:22:36','ant nuevo','2010-09-28',1,NULL,0),
 (28,'186997',900,'P','2010-10-04 17:50:46','ant 186997 adic araure temblador','2010-10-01',2,2,1),
 (29,'186998',200,'P','2010-10-04 17:50:46','ant 186998 adic araure temblador\r\n','2010-10-01',2,2,1),
 (30,'186967',310,'P','2010-10-04 17:50:46','ant ofic ppal - san felipe 186967\r\n','2010-10-04',2,3,1),
 (31,'186823',360,'P','2010-10-04 18:04:47','ant 186823, ofic ppal - valencia\r\n','2010-10-04',3,NULL,0),
 (32,'187003',680,'P','2010-10-04 16:59:01','ant 187003 op-barcelona\r\n','2010-10-04',1,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;

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
 (223,'tAnticipo','U','P','2010-10-04 18:04:47','31');
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
  `crif_empext` varchar(15) default NULL,
  PRIMARY KEY  USING BTREE (`cid_chofer`,`nid_sucursal`),
  KEY `FK_tchofer_tsucursal` (`nid_sucursal`),
  KEY `FK_tchofer_ttranspext` (`crif_empext`,`nid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tchofer`
--

/*!40000 ALTER TABLE `tchofer` DISABLE KEYS */;
INSERT INTO `tchofer` (`cid_chofer`,`cnombre`,`ccontraparte`,`cficha_nom`,`nid_sucursal`,`cid_usuario`,`dfecha_act`,`ncontratado`,`nactivo`,`crif_empext`) VALUES 
 ('10139779','CABAÑA VICTOR','321','',1,'P','2010-10-01 18:29:56',0,1,''),
 ('10142878','ALVARADO LIMA SAUL J4','0101','0101',1,'P','2010-08-16 16:25:29',0,1,''),
 ('10637589','LUCENA YEPEZ JOSE AL',' ',' ',1,'P','2010-10-04 11:52:48',1,1,NULL),
 ('11081499','ROJAS MORILLO, CARLO','0404','0404',2,'P','2010-08-16 15:55:08',0,1,NULL),
 ('11081888','ROJAS , MATIAS PASTO','0102','0102',1,'P','2010-08-16 15:55:08',0,1,NULL),
 ('11545892','ROGER GRANADO','002','002',1,'P','2010-08-17 11:06:54',0,1,''),
 ('11547715','PERNALETE G. JOSE G','0202','0202',1,'P','2010-08-16 15:55:08',0,1,NULL),
 ('12262801','VIRGÜEZ JORGELIS',' ',' ',1,'P','2010-10-04 11:52:44',1,1,NULL),
 ('15693221','SANCHEZ CARLOS','002','002',1,'P','2010-08-17 17:10:02',0,1,''),
 ('16346069','MENDEZ M. ANDRES ELO','0505','0505',2,'P','2010-08-16 15:55:08',0,1,NULL),
 ('16751579','ARNAO ARNOLDO','0808','0808',2,'P','2010-08-16 15:55:08',0,1,NULL),
 ('7547865','PASTRAN A. FELIPE J','001','002',1,'P','2010-08-16 16:15:11',0,1,''),
 ('7599282','SUAREZ A. FRANKLIN R','0707','0707',1,'P','2010-08-11 14:32:37',0,1,'J-300'),
 ('8603178','MENDEZ R. EDDYS E .','0303','0303',1,'P','2010-08-16 15:55:08',0,1,NULL),
 ('9562700','SANCHEZ M. GUADALUPE','1111','1111',1,'P','2010-10-04 09:33:53',0,1,''),
 ('9566638','ROMERO CAMPINS,PEDRO','1212','2121',1,'P','2010-10-01 14:54:40',0,1,''),
 ('9844698','MENDOZA ESCALONA, JO','0909','0909',1,'P','2010-08-16 15:55:08',0,1,NULL);
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
 ('0101','Puerto Ayacucho','01','P','2010-07-14 10:43:32'),
 ('0201','Barcelona','02','P01','2010-02-04 10:32:58'),
 ('0301','San Fernando de Apure','03','P01','2010-02-04 10:33:14'),
 ('0401','Maracay','04','P01','2010-02-04 10:33:30'),
 ('0501','Barinas','05','P01','2010-02-04 10:33:48'),
 ('0601','Ciudad Bolívar','06','P01','2010-02-04 10:34:14'),
 ('0701','Valencia','07','P','2010-07-14 10:43:45'),
 ('0801','San Carlos','08','P01','2010-02-04 10:34:48'),
 ('0901','Tucupita','09','P01','2010-02-04 10:35:03'),
 ('1001','Coro','10','P01','2010-02-04 10:35:23'),
 ('1101','San Juan de Los Morros','11','P01','2010-02-04 10:35:52'),
 ('1201','Barquisimeto','12','P01','2010-02-04 10:36:16'),
 ('1301','Mérida','13','P01','2010-02-04 10:36:30'),
 ('1401','Los Teques','14','P01','2010-02-04 10:36:44'),
 ('1501','Maturin','15','P01','2010-02-04 10:37:03'),
 ('1502','TEMBLADOR','15','P','2010-10-01 15:12:33'),
 ('1601','La Asunción','16','P01','2010-02-04 10:37:16'),
 ('1701','Guanare','17','P01','2010-02-04 10:37:31'),
 ('1702','Acarigua','17','P','2010-07-14 10:44:04'),
 ('1703','ARAURE','17','P','2010-07-14 10:45:21'),
 ('1704','AGUA BLANCA','17','P','2010-08-03 16:14:50'),
 ('1801','Cumaná','18','P01','2010-02-04 10:38:03'),
 ('1901','San Cristóbal','19','P01','2010-02-04 10:38:53'),
 ('2001','Trujillo','20','P01','2010-02-04 10:39:11'),
 ('2101','La Guaira','21','P01','2010-02-04 10:39:26'),
 ('2201','San Felipe','22','P01','2010-02-04 10:39:39'),
 ('2301','Maracaibo','23','P01','2010-02-04 10:39:52'),
 ('2401','Caracas','24','P01','2010-02-04 10:40:06');
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
 (1,'05',67),
 (1,'06',150),
 (2,'06',250),
 (2,'01',800),
 (2,'05',14),
 (2,'02',35),
 (2,'08',150),
 (3,'06',110),
 (3,'01',100),
 (3,'05',38),
 (3,'08',100);
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
 ('01','Amazonas','P01','2010-02-04 10:10:40'),
 ('02','Anzoátegui','P01','2010-02-04 10:10:57'),
 ('03','APURE','P','2010-05-14 11:21:46'),
 ('04','Aragua','P01','2010-02-04 10:11:21'),
 ('05','Barinas','P01','2010-02-04 10:11:51'),
 ('06','Bolívar','P01','2010-02-04 10:12:05'),
 ('07','Carabobo','P01','2010-02-04 10:12:19'),
 ('08','COJEDES','P','2010-02-05 10:01:42'),
 ('09','Delta Amacuro','P01','2010-02-04 10:12:43'),
 ('10','Falcón','P01','2010-02-04 10:12:56'),
 ('11','Guárico','P01','2010-02-04 10:13:08'),
 ('12','Lara','P01','2010-02-04 10:13:27'),
 ('13','Mérida','P01','2010-02-04 10:13:37'),
 ('14','Miranda','P01','2010-02-04 10:13:48'),
 ('15','Monagas','P01','2010-02-04 10:14:00'),
 ('16','Nueva Esparta','P01','2010-02-04 10:14:11'),
 ('17','Portuguesa','P01','2010-02-04 10:14:25'),
 ('18','Sucre','P01','2010-02-04 10:14:36'),
 ('19','Táchira','P01','2010-02-04 10:14:45'),
 ('20','Trujillo','P01','2010-02-04 10:14:57'),
 ('21','Vargas','P01','2010-02-04 10:15:08'),
 ('22','Yaracuy','P01','2010-02-04 10:15:18'),
 ('23','Zulia','P01','2010-02-04 10:15:28'),
 ('24','Distrito Capital','P01','2010-02-04 10:15:39');
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
  `nid_gasto` int(10) unsigned NOT NULL auto_increment,
  `dfecha` date NOT NULL,
  `cfactura` varchar(10) NOT NULL default ' ',
  `ntotal` double NOT NULL default '0',
  `crif_emp` varchar(12) default ' ',
  `cnombre_emp` varchar(60) default ' ',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cobservacion` text,
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torigen_destino`
--

/*!40000 ALTER TABLE `torigen_destino` DISABLE KEYS */;
INSERT INTO `torigen_destino` (`nid_origdest`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`nactivo`,`norigen`,`nsucursal`) VALUES 
 (1,'OFICINA PRINCIPAL1','1703','P','2010-09-24 14:22:49',1,1,1),
 (2,'CENTRO OCCIDENTE','1702','P','2010-08-02 10:05:19',1,1,1),
 (3,'321','1001','P','2010-08-02 10:07:27',1,1,1),
 (4,'MERIDA','1301','P','2010-08-02 10:21:10',1,0,0),
 (5,'SAN CRISTOBAL','1901','P','2010-08-02 10:31:50',1,0,0),
 (6,'CARACAS','2401','P','2010-08-02 10:47:25',1,1,1),
 (7,'VALERA','2001','P','2010-08-02 10:57:09',1,0,0),
 (8,'BARQUISIMETO','1201','P','2010-08-02 14:04:02',1,0,0),
 (9,'FDGDFG','1001','P','2010-08-02 16:12:45',0,1,1),
 (10,'AGUA BLANCA','1704','P','2010-08-03 16:15:35',1,0,0),
 (11,'CIUDAD BOLIVAR','0601','P','2010-08-04 11:26:10',1,0,0),
 (12,'PUERTO LA CRUZ','0201','P','2010-08-05 18:52:14',1,1,0),
 (13,'BACHAQUERO','2301','P','2010-08-17 17:25:05',1,0,0),
 (14,'VALENCIA','0701','P','2010-08-18 11:22:37',1,1,0),
 (15,'TEMBLADOR','1502','P','2010-10-01 15:17:21',1,0,0),
 (16,'SAN FELIPE','2201','P','2010-10-04 15:30:44',1,0,0),
 (17,'VALENCIA','0701','P','2010-10-04 16:04:16',1,1,1),
 (18,'BARCELONA','0201','P','2010-10-04 16:46:01',1,1,1),
 (19,'MARACAIBO','2301','P','2010-10-04 16:37:15',1,1,1);
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
 ('07100810','2010-07-16','2010-10-15','JULIO 2010 / AGOSTO 2010','P','2010-10-01 09:37:49',0),
 ('16091510','2010-09-16','2010-10-15','SEPTIEMBRE-OCTUBRE 2010','P','2010-10-01 10:58:12',1);
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
  `nid_relacion` int(10) unsigned NOT NULL auto_increment,
  `dfecha` date NOT NULL default '1900-01-01',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cobservacion` text,
  PRIMARY KEY  (`nid_relacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trelacion`
--

/*!40000 ALTER TABLE `trelacion` DISABLE KEYS */;
INSERT INTO `trelacion` (`nid_relacion`,`dfecha`,`cid_usuario`,`dfecha_act`,`cobservacion`) VALUES 
 (1,'2010-09-17','P','2010-09-17 09:28:01','relacion 1 (ant 22)'),
 (2,'2010-10-04','P','2010-10-04 17:16:59','relacion de anticipos 28 y 29. Reponer 149 bs al chofer\r\n\r\n'),
 (3,'2010-10-04','P','2010-10-04 17:19:54','relacion ant 30. Reponer 38 bs al chofer.\r\n');
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
 (1,4,318,'P','2010-08-02 10:22:07','OFIC PPAL - MERIDA',1,100,17.1,29.07,49.58),
 (1,5,466,'P','2010-08-02 10:33:07','OFIC PPAL - SAN CRISTOBAL',1,100,14.45,24.56,41.89),
 (1,6,351,'P','2010-08-02 10:49:05','OFIC PPAL - CARACAS',1,100,29.5,50.14,85.54),
 (1,11,1000,'P','2010-08-04 13:57:22','OFIC PPAL - CIUDAD BOLIVAR',1,100,56.3,56.4,56.5),
 (1,13,337,'P','2010-08-17 17:26:00','OFIC PPAL - BACHAQUERO',1,100,25.6,32.6,52.8),
 (1,14,145,'P','2010-08-18 11:26:52','OFIC PPAL - VALENCIA',1,100,20.3,35.6,65.2),
 (1,15,874,'P','2010-10-01 15:18:34','ARAURE - TEMBLADOR',1,100,0.2,0.01,2),
 (1,16,147,'P','2010-10-04 15:31:05','ARAURE-SAN FELIPE',1,100,20,2,5),
 (1,17,181,'P','2010-10-04 16:40:28','OFIC. PPAL. - VALENCIA',1,100,2,23,2),
 (1,18,619,'P','2010-10-04 16:47:09','OFIC. PPAL. - BARCELONA',1,100,5,6,3),
 (2,7,247,'P','2010-08-02 10:58:35','C OCC - VALERA',1,100,3.56,6.05,10.31),
 (2,8,78,'P','2010-08-02 14:11:43','C OCC - BQTO',1,100,8.61,14.64,24.97),
 (2,10,20,'P','2010-08-03 16:16:31','C. OCC - AGUA BLANCA',1,100,50.27,23.92,17.25),
 (12,1,630,'P','2010-08-05 18:55:10','PTO LA CRUZ - OP',1,100,12.5,23.96,12.3);
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
  PRIMARY KEY  (`cid_servicio`),
  KEY `FK_tservicio_tgrupo_s` (`cid_grupo`),
  CONSTRAINT `FK_tservicio_tgrupo_s` FOREIGN KEY (`cid_grupo`) REFERENCES `tgrupo_servicio` (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tservicio`
--

/*!40000 ALTER TABLE `tservicio` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

/*!40000 ALTER TABLE `tsucursal` DISABLE KEYS */;
INSERT INTO `tsucursal` (`nid_sucursal`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`ncap_carga`,`nid_origdest`,`nactivo`,`nbono_alm`,`nbono_mon`) VALUES 
 (1,'OFICINA PRINCIPAL1','1703','P','2010-09-24 14:22:49',100000000,1,1,0.0000,0.0000),
 (2,'CENTRO OCCIDENTE','1702','P','2010-08-02 10:05:19',500000000,2,1,0.1800,0.0040),
 (4,'CARACAS','2401','P','2010-08-02 10:47:25',600000,6,1,0.1800,0.0040),
 (5,'VALENCIA','0701','P','2010-10-04 16:04:16',500,17,1,0.0000,0.0000),
 (6,'BARCELONA','0201','P','2010-10-04 16:46:01',400,18,1,0.0000,0.0000),
 (7,'MARACAIBO','2301','P','2010-10-04 16:37:15',300,19,1,0.0000,0.0000);
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
 ('01','CALETAS','P','2010-09-16 14:28:57','7202030013','Caletas y Acarreos'),
 ('02','GASOIL','P','2010-09-16 14:29:25','7202030009','Mant/Repara.Vehículos'),
 ('05','PEAJES','P','2010-09-16 14:29:50','7202030009','Mant/Repara.Vehículos'),
 ('06','COMIDA','P','2010-09-16 14:30:07','7202030009','Mant/Repara.Vehículos'),
 ('07','GASTOS DE VIA','P','2010-09-16 14:30:29','7202030013','Caletas y Acarreos'),
 ('08','OTROS','P','2010-09-16 14:30:45','7202030013','Caletas y Acarreos');
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
INSERT INTO `ttransporte_ext` (`crif`,`cnombre`,`nporc_ret`,`nid_sucursal`,`cid_usuario`,`dfecha_act`,`nactivo`) VALUES 
 ('J-300','EMP CONT OP',3,1,'P','2010-08-05 18:37:58',1),
 ('J-300','EMP CONT COCC',3,2,'P','2010-08-05 18:39:10',1),
 ('J-400','EMP CONTRAT COCC2',9,2,'P','2010-08-05 18:39:38',1),
 ('J-500','EMP CONT OP2',3,1,'P','2010-08-05 18:40:21',1);
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
 ('CARLOS','CARLOS PARADA','ÎÍÌËÊÉ',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
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
  `ctipo_vehic` int(1) unsigned default '0' COMMENT '1:Liviano,  2:Mediano,  3:Pesado',
  `ncosto` double default '0',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `npropio` int(1) unsigned NOT NULL default '0',
  `nvolumen` double default '0',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `cemp_transp` varchar(60) default ' ' COMMENT 'Empresa transportista, en caso de que el vehículo sea contratado',
  PRIMARY KEY  (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tvehiculo`
--

/*!40000 ALTER TABLE `tvehiculo` DISABLE KEYS */;
INSERT INTO `tvehiculo` (`cid_vehiculo`,`cdescripcion`,`cmarca`,`cserial_motor`,`cserial_carroc`,`ntara`,`ncapacidad`,`ctipo_vehic`,`ncosto`,`cid_usuario`,`dfecha_act`,`npropio`,`nvolumen`,`nactivo`,`nid_sucursal`,`cemp_transp`) VALUES 
 ('22MDBB','CAMION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-08-03 09:01:40',0,0,1,1,' '),
 ('36RDAR','GANDOLA VISION',' ',' ',' ',0,0,0,0,'P','2010-08-04 11:24:23',0,0,1,1,' '),
 ('39HDAO','GANDOLA MACK',' ',' ',' ',0,0,0,0,'P','2010-08-18 13:52:43',0,0,1,1,' '),
 ('61MDAS','VEH PESADO',' ',' ',' ',0,0,0,0,'P','2010-08-02 10:49:29',0,0,1,1,' '),
 ('66XPAC','CAMION CHUTO 1999',' ',' ',' ',0,0,0,0,'P','2010-08-17 17:09:43',0,0,1,1,' '),
 ('730OAD','VP',' ',' ',' ',0,0,0,0,'P','2010-08-17 11:06:17',0,0,1,1,' '),
 ('A02AF5T','VEHICULO LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-08-03 14:50:33',0,0,1,2,' '),
 ('A05AE7T','CAMION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-09-08 17:03:34',0,0,1,1,' '),
 ('A13AG7E','VEH. LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-10-04 11:52:48',0,0,1,1,' '),
 ('A15AU5D','CAMION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-08-16 15:43:37',0,0,1,1,' '),
 ('A22AB1D','CAMION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-08-02 10:37:17',0,0,1,1,' '),
 ('A22AE2U','CAMION FURGON BLANCO AÑO 2001',' ',' ',' ',0,0,0,0,'P','2010-08-02 11:14:56',0,0,1,1,' '),
 ('A22AE3U','CAMION KODIAK',' ',' ',' ',0,0,0,0,'P','2010-10-04 11:52:44',0,0,1,1,' '),
 ('A62AA9D','CAMION  MACK',' ',' ',' ',0,0,0,0,'P','2010-08-11 10:40:34',0,0,1,1,' '),
 ('A64/AE2E','CAMION KODIAK',' ',' ',' ',0,0,0,0,'P','2010-08-02 10:25:37',0,0,1,1,' '),
 ('A64AE3E','CAMION-CHASIS',' ',' ',' ',0,0,0,0,'P','2010-10-01 14:53:24',0,0,1,1,' '),
 ('A71AE4E','CAMION CHEVROLET CAVA 2001',' ',' ',' ',0,0,0,0,'P','2010-08-02 14:01:23',0,0,1,2,' '),
 ('A86AA/OD','VP',' ',' ',' ',0,0,0,0,'P','2010-10-04 16:55:44',0,0,1,1,' '),
 ('A86AA0D','CAMION MACK',' ',' ',' ',0,0,0,0,'P','2010-10-04 09:32:57',0,0,1,1,' ');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tviaje`
--

/*!40000 ALTER TABLE `tviaje` DISABLE KEYS */;
INSERT INTO `tviaje` (`nid_viaje`,`cid_chofer`,`cid_vehiculo`,`dfecha`,`cobservacion`,`cguia`,`corden_carga`,`dfecha_guia`,`npeso_neto`,`cid_usuario`,`dfecha_act`,`nid_origen`,`nid_destino`,`cid_periodo`,`ntipo_viaje`,`nid_sucursal_guia`,`ndistancia`,`nstatus`,`cfactura_ext`,`ccliente_ext`) VALUES 
 (1,'10142878','A64/AE2E','2010-08-02','PRIMER ANTICIPO  680','14760','15904','2010-07-19',21280,'P','2010-08-02 10:29:37',1,4,'07100810',1,1,318,2,'',' '),
 (2,'11547715','A22AB1D','2010-08-02','SEG ANTICIPO SAN CRISTOBAL\r\n','14750','15912','2010-07-19',31370,'P','2010-08-02 10:45:49',1,5,'07100810',1,1,466,2,'',' '),
 (3,'8603178','61MDAS','2010-08-02','ANTICIPO 3','14751','15917','2010-07-19',34890,'P','2010-08-02 10:52:57',1,6,'07100810',1,1,351,2,'',' '),
 (4,'11081499','A22AE2U','2010-08-02','4anticip\r\n','2830','2976','2010-07-21',12940,'P','2010-08-02 14:32:09',2,7,'07100810',1,2,247,2,'',' '),
 (5,'16346069','A71AE4E','2010-08-02','ANTICIPO 5\r\n','2831','2980','2010-07-21',12490,'P','2010-08-02 14:33:44',2,8,'07100810',1,2,78,2,'',' '),
 (6,'16346069','A71AE4E','2010-08-02','ANTICIPO 6','2823','2971','2010-07-20',12050,'P','2010-08-02 14:34:55',2,8,'07100810',1,2,78,2,'',' '),
 (7,'7599282','22MDBB','2010-08-03','ant 10\r\n','14787','15947','2010-07-20',34880,'P','2010-08-03 09:13:28',1,6,'07100810',1,1,351,2,'',' '),
 (24,'16751579','A02AF5T','2010-08-03','ANT COCC 04','2810','2957','2010-07-16',12400,'P','2010-08-03 17:10:56',2,8,'07100810',1,2,78,2,'',' '),
 (25,'16751579','A02AF5T','2010-08-03','5to anticipo cocc3444\r\n','2822','2969','2010-07-20',12690,'P','2010-08-03 17:11:38',2,10,'07100810',1,2,20,2,'',' '),
 (26,'9844698','36RDAR','2010-08-04','op bolivar1','14763','15926','2010-07-19',34890,'P','2010-08-04 14:39:00',1,11,'07100810',1,1,1000,1,'',' '),
 (29,'9844698','36RDAR','2010-08-05','OBS PTO LA CRUZ - OP',' ',' ','2010-07-22',28290,'P','2010-08-05 19:09:41',12,1,'07100810',2,0,630,1,'286039','CEMENTERA'),
 (31,'15693221','66XPAC','2010-08-18','vj bachaquero\r\n','15149','16332','2010-08-09',30360,'P','2010-08-18 10:33:55',1,13,'07100810',1,1,337,1,'',''),
 (32,'11547715','A22AB1D','2010-08-18','vj valencia\r\n','15157','16344','2010-08-09',33040,'P','2010-08-18 11:37:58',1,14,'07100810',1,1,145,1,'',''),
 (33,'15693221','66XPAC','2010-08-20','vj pto la c - op','','','2010-08-07',28560,'','2010-08-20 15:14:55',12,1,'07100810',2,0,630,1,'CEMEX','1477375'),
 (34,'15693221','A05AE7T','2010-09-08','op - caracas','15579','16783','2010-08-31',34950,'P','2010-09-08 17:05:07',1,6,'07100810',1,1,351,1,'',''),
 (35,'9566638','A64AE3E','2010-10-01','ant araure temblador','15970','17202','2010-09-20',19330,'P','2010-10-01 18:16:17',1,15,'16091510',1,1,874,1,'',''),
 (36,'10637589','A13AG7E','2010-10-04','viaje contratado 1 (c.occidente-valera)','3113','3287','2010-09-21',12820,'P','2010-10-04 11:53:39',2,7,'16091510',1,2,247,1,'',''),
 (37,'9562700','A86AA0D','2010-10-04','vj araure san felipe\r\n','15939','17164','2010-09-18',30250,'P','2010-10-04 15:35:37',1,16,'16091510',1,1,147,1,'',''),
 (38,'9562700','A86AA/OD','2010-10-04','vj op-valencia\r\n','16008','17236','2010-09-21',35000,'P','2010-10-04 16:57:27',1,17,'16091510',1,1,181,1,'',''),
 (39,'9562700','A86AA0D','2010-10-04','vj op-blna\r\n','16045','17271','2010-09-23',33170,'P','2010-10-04 16:59:01',1,18,'16091510',1,1,619,1,'',''),
 (40,'9562700','A86AA0D','2010-10-04','vj retorno pto la cruz -op\r\n','','','2010-09-24',28560,'','2010-10-04 17:01:24',12,1,'16091510',2,0,630,1,'CEMEX','1496731');
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
-- Definition of procedure `sp_insert_tviaje_ext_tanticipo`
--

DROP PROCEDURE IF EXISTS `sp_insert_tviaje_ext_tanticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tviaje_ext_tanticipo`(tcid_chofer varchar(9),tcid_vehiculo varchar(10),tccliente_ext varchar(45),tcfactura_ext varchar(10),tdfecha_guia date,tnpeso_neto double,tcid_usuario varchar(20),tnid_origen int(4),tnid_destino int(4),tcid_periodo varchar(10),tntipo_viaje tinyint(1),tcnro_recibo varchar(10),tnmonto double,tcobservacion text,tndistancia double)
BEGIN
   Declare nError,lnid_anticipo,lnid_viaje Int(10);
   Start Transaction;

      insert into tviaje (cid_chofer,cid_vehiculo,dfecha,ccliente_ext,cfactura_ext,dfecha_guia,npeso_neto,nid_origen,nid_destino,cid_periodo,ntipo_viaje,cid_usuario,ndistancia,cobservacion,nstatus)
         values(tcid_chofer,tcid_vehiculo,now(),tccliente_ext,tcfactura_ext,tdfecha_guia,tnpeso_neto,tnid_origen,tnid_destino,tcid_periodo,tntipo_viaje,tcid_usuario,tndistancia,tcobservacion,1);
      set lnid_anticipo = last_insert_id();
      insert into tanticipo (cnro_recibo,nmonto,dfecha,cobservacion,cid_usuario)
         values (tcnro_recibo,tnmonto,now(),tcobservacion,tcid_usuario);
      set lnid_viaje = last_insert_id();
      insert into tanticip_tviaje (nid_anticipo,nid_viaje) values(lnid_anticipo,lnid_viaje);

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
-- Definition of procedure `sp_insert_tviaje_tanticipo`
--

DROP PROCEDURE IF EXISTS `sp_insert_tviaje_tanticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tviaje_tanticipo`(tcid_chofer varchar(9),tcid_vehiculo varchar(10),tcguia varchar(10),tcorden_carga varchar(10),tdfecha_guia date,tnpeso_neto double,tcid_usuario varchar(20),tnid_origen int(4),tnid_destino int(4),tcid_periodo varchar(10),tntipo_viaje tinyint(1),tnid_sucursal_guia int(4),tcnro_recibo varchar(10),tnmonto double,tcobservacion text,tndistancia double)
BEGIN
   Declare nError int(10);
   Declare lnid_anticipo int(10);
   Declare lnid_viaje Int(10);
   Start Transaction;

      insert into tviaje (cid_chofer,cid_vehiculo,dfecha,cguia,corden_carga,dfecha_guia,npeso_neto,nid_origen,nid_destino,cid_periodo,ntipo_viaje,nid_sucursal_guia,cid_usuario,ndistancia,cobservacion,nstatus)
         values(tcid_chofer,tcid_vehiculo,now(),tcguia,tcorden_carga,tdfecha_guia,tnpeso_neto,tnid_origen,tnid_destino,tcid_periodo,tntipo_viaje,tnid_sucursal_guia,tcid_usuario,tndistancia,tcobservacion,1);
      set lnid_viaje = last_insert_id();
      insert into tanticipo (cnro_recibo,nmonto,dfecha,cobservacion,cid_usuario)
         values (tcnro_recibo,tnmonto,now(),tcobservacion,tcid_usuario);
      set lnid_anticipo = last_insert_id();
      insert into tanticip_tviaje (nid_anticipo,nid_viaje) values(lnid_anticipo,lnid_viaje);

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
-- Definition of procedure `sp_update_tviaje_ext_tanticipo`
--

DROP PROCEDURE IF EXISTS `sp_update_tviaje_ext_tanticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_tviaje_ext_tanticipo`(tcid_usuario varchar(20),tnid_origen int(4),tnid_destino int(4),tcnro_recibo varchar(10),tnmonto double,tcobservacion text,tndistancia double,tnid_viaje int(10),tnid_anticipo int(10))
BEGIN
   Declare nError Int(10);
   Start Transaction;

      update tviaje set nid_origen = tnid_origen,nid_destino = tnid_destino,cid_usuario = tcid_usuario,ndistancia = tndistancia,cobservacion = tcobservacion where nid_viaje = tnid_viaje;
      update tanticipo set cnro_recibo = tcnro_recibo,nmonto = tnmonto,cobservacion = tcobservacion,cid_usuario = tcid_usuario where nid_anticipo = tnid_anticipo;


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
-- Definition of procedure `sp_update_tviaje_tanticipo`
--

DROP PROCEDURE IF EXISTS `sp_update_tviaje_tanticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_tviaje_tanticipo`(tcid_usuario varchar(20),tnid_origen int(4),tnid_destino int(4),tcnro_recibo varchar(10),tnmonto double,tcobservacion text,tndistancia double,tnid_viaje int(10),tnid_anticipo int(10))
BEGIN
   Declare nError Int(10);
   Start Transaction;

      update tviaje set nid_origen = tnid_origen,nid_destino = tnid_destino,cid_usuario = tcid_usuario,ndistancia = tndistancia,cobservacion = tcobservacion where nid_viaje = tnid_viaje;
      update tanticipo set cnro_recibo = tcnro_recibo,nmonto = tnmonto,cobservacion = tcobservacion,cid_usuario = tcid_usuario where nid_anticipo = tnid_anticipo;


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
