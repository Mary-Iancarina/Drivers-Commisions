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
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `crutaspc` varchar(250) NOT NULL default ' ',
  `nid_sucursal` int(4) unsigned NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tacceso_suc`
--

/*!40000 ALTER TABLE `tacceso_suc` DISABLE KEYS */;
INSERT INTO `tacceso_suc` (`cid_usuario`,`crutaspc`,`nid_sucursal`) VALUES 
 ('P','C:/DataSpc/OficinaP/Cobranzas/CobDatos',1),
 ('P','C:/DataSpc/Cocciden/Cobranzas/CobDatos',2);
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
 (11,29);
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
  PRIMARY KEY  (`nid_anticipo`),
  KEY `ix_recibo` (`cnro_recibo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo`
--

/*!40000 ALTER TABLE `tanticipo` DISABLE KEYS */;
INSERT INTO `tanticipo` (`nid_anticipo`,`cnro_recibo`,`nmonto`,`cid_usuario`,`dfecha_act`,`cobservacion`,`dfecha`) VALUES 
 (1,'183939',680,'P','2010-08-02 10:57:30','PRIMER ANTICIPO  680','2010-08-02'),
 (2,'183933',350,'P','2010-08-02 11:09:18','SEG ANTICIPO SAN CRISTOBAL\r\n','2010-08-02'),
 (3,'183934',230,'P','2010-08-02 11:22:08','ANTICIPO 3','2010-08-02'),
 (4,'180932',440,'P','2010-08-02 14:26:39','4anticip\r\n','2010-08-02'),
 (5,'180934',400,'P','2010-08-02 14:58:18','ANTICIPO 5\r\n','2010-08-02'),
 (6,'180926',390,'P','2010-08-02 14:59:54','ANTICIPO 6','2010-08-02'),
 (7,'183962',230,'P','2010-08-03 09:37:17','ant 10\r\n','2010-08-03'),
 (9,'180911',390,'P','2010-08-03 16:33:19','ANT COCC 04','2010-08-03'),
 (10,'180927',410,'P','2010-08-03 16:54:16','5to anticipo cocc3444\r\n','2010-08-03'),
 (11,'183944',880,'P','2010-08-04 15:09:00','op bolivar1','2010-08-04');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

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
 (33,'tviaje','I','P','2010-08-05 19:39:41','29');
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
  `crif_empext` varchar(15) default ' ',
  PRIMARY KEY  USING BTREE (`cid_chofer`,`nid_sucursal`),
  KEY `FK_tchofer_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tchofer`
--

/*!40000 ALTER TABLE `tchofer` DISABLE KEYS */;
INSERT INTO `tchofer` (`cid_chofer`,`cnombre`,`ccontraparte`,`cficha_nom`,`nid_sucursal`,`cid_usuario`,`dfecha_act`,`ncontratado`,`nactivo`,`crif_empext`) VALUES 
 ('10142878','ALVARADO LIMA SAUL J','0101','0101',1,'P','2010-08-02 10:56:07',0,1,' '),
 ('11081499','ROJAS MORILLO, CARLO','0404','0404',2,'P','2010-08-02 14:25:30',0,1,' '),
 ('11547715','PERNALETE G. JOSE G','0202','0202',1,'P','2010-08-02 11:07:34',0,1,' '),
 ('16346069','MENDEZ M. ANDRES ELO','0505','0505',2,'P','2010-08-02 14:33:34',0,1,' '),
 ('16751579','ARNAO ARNOLDO','0808','0808',2,'P','2010-08-03 15:21:07',0,1,' '),
 ('7599282','SUAREZ A. FRANKLIN R','0707','0707',1,'P','2010-08-03 09:33:37',0,1,' '),
 ('8603178','MENDEZ R. EDDYS E .','0303','0303',1,'P','2010-08-02 11:19:49',0,1,' '),
 ('9844698','MENDOZA ESCALONA, JO','0909','0909',1,'P','2010-08-04 11:54:52',0,1,' ');
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
 ('1704','AGUA BLANCA','17','P','2010-08-03 16:44:50'),
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
 ('1','A','ALMACENISTAS'),
 ('10','M','RELACION DE VIAJES'),
 ('11','M','RELACIÓN DE VIAJES EXTERNOS'),
 ('12','M','RUTAS'),
 ('13','A','SERVICIOS'),
 ('14','A','SUCURSALES'),
 ('15','A','TIPOS DE GASTOS'),
 ('16','A','VEHICULOS'),
 ('17','M','VIAJES'),
 ('18','M','VIAJES EXTERNOS'),
 ('2','M','ANTICIPOS DE VIAJES'),
 ('3','A','CHOFERES'),
 ('4','A','CIUDADES'),
 ('5','A','ESTADOS'),
 ('6','M','GASTOS POR SERVICIOS'),
 ('7','A','GRUPOS DE SERVICIOS'),
 ('8','A','ORIGENES / DESTINOS'),
 ('9','A','PERIODOS');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torigen_destino`
--

/*!40000 ALTER TABLE `torigen_destino` DISABLE KEYS */;
INSERT INTO `torigen_destino` (`nid_origdest`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`nactivo`,`norigen`,`nsucursal`) VALUES 
 (1,'OFICINA PRINCIPAL1','1703','P','2010-08-03 09:23:11',1,1,1),
 (2,'CENTRO OCCIDENTE','1702','P','2010-08-02 10:35:19',1,1,1),
 (3,'321','1001','P','2010-08-02 10:37:27',1,1,1),
 (4,'MERIDA','1301','P','2010-08-02 10:51:10',1,0,0),
 (5,'SAN CRISTOBAL','1901','P','2010-08-02 11:01:50',1,0,0),
 (6,'CARACAS','2401','P','2010-08-02 11:17:25',1,1,1),
 (7,'VALERA','2001','P','2010-08-02 11:27:09',1,0,0),
 (8,'BARQUISIMETO','1201','P','2010-08-02 14:34:02',1,0,0),
 (9,'FDGDFG','1001','P','2010-08-02 16:42:45',0,1,1),
 (10,'AGUA BLANCA','1704','P','2010-08-03 16:45:35',1,0,0),
 (11,'CIUDAD BOLIVAR','0601','P','2010-08-04 11:56:10',1,0,0),
 (12,'PUERTO LA CRUZ','0201','P','2010-08-05 19:22:14',1,1,0);
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
 ('07100810','2010-07-16','2010-08-15','JULIO 2010 / AGOSTO 2010','P','2010-08-02 10:39:49',1);
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
 (1,4,318,'P','2010-08-02 10:52:07','OFIC PPAL - MERIDA',1,100,17.1,29.07,49.58),
 (1,5,466,'P','2010-08-02 11:03:07','OFIC PPAL - SAN CRISTOBAL',1,100,14.45,24.56,41.89),
 (1,6,351,'P','2010-08-02 11:19:05','OFIC PPAL - CARACAS',1,100,29.5,50.14,85.54),
 (1,11,1000,'P','2010-08-04 14:27:22','OFIC PPAL - CIUDAD BOLIVAR',1,100,56.3,56.4,56.5),
 (2,7,247,'P','2010-08-02 11:28:35','C OCC - VALERA',1,100,3.56,6.05,10.31),
 (2,8,78,'P','2010-08-02 14:41:43','C OCC - BQTO',1,100,8.61,14.64,24.97),
 (2,10,20,'P','2010-08-03 16:46:31','C. OCC - AGUA BLANCA',1,100,50.27,23.92,17.25),
 (12,1,630,'P','2010-08-05 19:25:10','PTO LA CRUZ - OP',1,100,12.5,23.96,12.3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

/*!40000 ALTER TABLE `tsucursal` DISABLE KEYS */;
INSERT INTO `tsucursal` (`nid_sucursal`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`ncap_carga`,`nid_origdest`,`nactivo`,`nbono_alm`,`nbono_mon`) VALUES 
 (1,'OFICINA PRINCIPAL1','1703','P','2010-08-03 09:23:11',100000000,1,1,0.0000,0.0000),
 (2,'CENTRO OCCIDENTE','1702','P','2010-08-02 10:35:19',500000000,2,1,0.1800,0.0040),
 (4,'CARACAS','2401','P','2010-08-02 11:17:25',600000,6,1,0.1800,0.0040);
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
 ('J-300','EMP CONT OP',3,1,'P','2010-08-05 19:07:58',1),
 ('J-300','EMP CONT COCC',3,2,'P','2010-08-05 19:09:10',1),
 ('J-400','EMP CONTRAT COCC2',9,2,'P','2010-08-05 19:09:38',1),
 ('J-500','EMP CONT OP2',3,1,'P','2010-08-05 19:10:21',1);
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
 ('22MDBB','CAMION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-08-03 09:31:40',0,0,1,1,' '),
 ('36RDAR','GANDOLA VISION',' ',' ',' ',0,0,0,0,'P','2010-08-04 11:54:23',0,0,1,1,' '),
 ('61MDAS','VEH PESADO',' ',' ',' ',0,0,0,0,'P','2010-08-02 11:19:29',0,0,1,1,' '),
 ('A02AF5T','VEHICULO LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-08-03 15:20:33',0,0,1,2,' '),
 ('A22AB1D','CAMION CHUTO',' ',' ',' ',0,0,0,0,'P','2010-08-02 11:07:17',0,0,1,1,' '),
 ('A22AE2U','CAMION FURGON BLANCO AÑO 2001',' ',' ',' ',0,0,0,0,'P','2010-08-02 11:44:56',0,0,1,1,' '),
 ('A64/AE2E','CAMION KODIAK',' ',' ',' ',0,0,0,0,'P','2010-08-02 10:55:37',0,0,1,1,' '),
 ('A71AE4E','CAMION CHEVROLET CAVA 2001',' ',' ',' ',0,0,0,0,'P','2010-08-02 14:31:23',0,0,1,2,' ');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tviaje`
--

/*!40000 ALTER TABLE `tviaje` DISABLE KEYS */;
INSERT INTO `tviaje` (`nid_viaje`,`cid_chofer`,`cid_vehiculo`,`dfecha`,`cobservacion`,`cguia`,`corden_carga`,`dfecha_guia`,`npeso_neto`,`cid_usuario`,`dfecha_act`,`nid_origen`,`nid_destino`,`cid_periodo`,`ntipo_viaje`,`nid_sucursal_guia`,`ndistancia`,`nstatus`,`cfactura_ext`,`ccliente_ext`) VALUES 
 (1,'10142878','A64/AE2E','2010-08-02','PRIMER ANTICIPO  680','14760','15904','2010-07-19',21280,'P','2010-08-02 10:59:37',1,4,'07100810',1,1,318,2,'',' '),
 (2,'11547715','A22AB1D','2010-08-02','SEG ANTICIPO SAN CRISTOBAL\r\n','14750','15912','2010-07-19',31370,'P','2010-08-02 11:15:49',1,5,'07100810',1,1,466,2,'',' '),
 (3,'8603178','61MDAS','2010-08-02','ANTICIPO 3','14751','15917','2010-07-19',34890,'P','2010-08-02 11:22:57',1,6,'07100810',1,1,351,2,'',' '),
 (4,'11081499','A22AE2U','2010-08-02','4anticip\r\n','2830','2976','2010-07-21',12940,'P','2010-08-02 15:02:09',2,7,'07100810',1,2,247,2,'',' '),
 (5,'16346069','A71AE4E','2010-08-02','ANTICIPO 5\r\n','2831','2980','2010-07-21',12490,'P','2010-08-02 15:03:44',2,8,'07100810',1,2,78,2,'',' '),
 (6,'16346069','A71AE4E','2010-08-02','ANTICIPO 6','2823','2971','2010-07-20',12050,'P','2010-08-02 15:04:55',2,8,'07100810',1,2,78,2,'',' '),
 (7,'7599282','22MDBB','2010-08-03','ant 10\r\n','14787','15947','2010-07-20',34880,'P','2010-08-03 09:43:28',1,6,'07100810',1,1,351,2,'',' '),
 (24,'16751579','A02AF5T','2010-08-03','ANT COCC 04','2810','2957','2010-07-16',12400,'P','2010-08-03 17:40:56',2,8,'07100810',1,2,78,2,'',' '),
 (25,'16751579','A02AF5T','2010-08-03','5to anticipo cocc3444\r\n','2822','2969','2010-07-20',12690,'P','2010-08-03 17:41:38',2,10,'07100810',1,2,20,2,'',' '),
 (26,'9844698','36RDAR','2010-08-04','op bolivar1','14763','15926','2010-07-19',34890,'P','2010-08-04 15:09:00',1,11,'07100810',1,1,1000,1,'',' '),
 (29,'9844698','36RDAR','2010-08-05','OBS PTO LA CRUZ - OP',' ',' ','2010-07-22',28290,'P','2010-08-05 19:39:41',12,1,'07100810',2,0,630,1,'286039','CEMENTERA');
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
