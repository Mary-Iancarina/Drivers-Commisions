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
-- Temporary table structure for view `vw_anticipos`
--
DROP TABLE IF EXISTS `vw_anticipos`;
DROP VIEW IF EXISTS `vw_anticipos`;
CREATE TABLE `vw_anticipos` (
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `nmonto` double,
  `cid_usuario` varchar(20),
  `dfecha_act` timestamp,
  `cobservacion` text,
  `dfecha` date,
  `nstatus` tinyint(3) unsigned,
  `nid_relacion` int(10) unsigned,
  `nrelacionado` tinyint(1) unsigned,
  `nid_sucursal` int(4) unsigned,
  `nid_viaje` int(10) unsigned,
  `cid_chofer` varchar(9),
  `nid_sucursal_c` int(4) unsigned,
  `cid_vehiculo` varchar(10),
  `nid_sucursal_v` int(4) unsigned,
  `dfecha_v` date,
  `corden_carga` varchar(10),
  `cguia` varchar(10),
  `dfecha_guia` date,
  `npeso_neto` double,
  `nid_sucursal_guia` int(4) unsigned,
  `cid_periodo` varchar(10),
  `nid_origen` int(4) unsigned,
  `nid_destino` int(4) unsigned,
  `ntipo_viaje` tinyint(1) unsigned,
  `ndistancia` double,
  `cfactura_ext` varchar(10),
  `ccliente_ext` varchar(45),
  `cdescripcion_v` varchar(60),
  `ctipo_vehic` int(1) unsigned,
  `npropio` int(1) unsigned,
  `nactivo_v` tinyint(1) unsigned,
  `cnombre` varchar(60),
  `ccontraparte` varchar(10),
  `cficha_nom` varchar(10),
  `ncontratado` tinyint(1) unsigned,
  `nactivo_c` tinyint(1) unsigned,
  `cdescripcion_s` varchar(60),
  `nactivo_s` tinyint(1) unsigned,
  `cdescripcion_p` varchar(60),
  `dfecha_desde` date,
  `dfecha_hasta` date,
  `nstatus_p` tinyint(1),
  `cdescripcion_r` varchar(60),
  `nactivo_r` tinyint(1) unsigned,
  `cdescripcion_o` varchar(60),
  `nactivo_o` tinyint(1) unsigned,
  `nsucursal` tinyint(1) unsigned,
  `cdescripcion_d` varchar(60),
  `ncount_viaje` bigint(21),
  `ncount_anticipo` bigint(21)
);

--
-- Temporary table structure for view `vw_choferes`
--
DROP TABLE IF EXISTS `vw_choferes`;
DROP VIEW IF EXISTS `vw_choferes`;
CREATE TABLE `vw_choferes` (
  `cid_chofer` varchar(9),
  `cnombre` varchar(60),
  `ccontraparte` varchar(10),
  `cficha_nom` varchar(10),
  `nid_sucursal` int(4) unsigned,
  `cid_usuario` varchar(20),
  `dfecha_act` timestamp,
  `ncontratado` tinyint(1) unsigned,
  `nactivo` tinyint(1) unsigned,
  `cdescripcion_s` varchar(60),
  `ntotal_viajes` bigint(21),
  `ntotal_peso` double,
  `ntotal_km` double
);

--
-- Temporary table structure for view `vw_comision_choferes`
--
DROP TABLE IF EXISTS `vw_comision_choferes`;
DROP VIEW IF EXISTS `vw_comision_choferes`;
CREATE TABLE `vw_comision_choferes` (
  `nid_viaje` int(10) unsigned,
  `cid_periodo` varchar(10),
  `nporc_com` int(2) unsigned,
  `ntabulador` double,
  `cid_chofer` varchar(9),
  `cid_vehiculo` varchar(10),
  `dfecha_v` date,
  `cguia` varchar(10),
  `corden_carga` varchar(10),
  `dfecha_guia` date,
  `npeso_neto` double,
  `nid_origen` int(4) unsigned,
  `nid_destino` int(4) unsigned,
  `cid_periodo_v` varchar(10),
  `ntipo_viaje` tinyint(1) unsigned,
  `nid_sucursal_guia` int(4) unsigned,
  `ndistancia` double,
  `nstatus_v` tinyint(1) unsigned,
  `cfactura_ext` varchar(10),
  `ccliente_ext` varchar(45),
  `cdescripcion_v` varchar(60),
  `ncapacidad` double,
  `ctipo_vehic` int(1) unsigned,
  `npropio` int(1) unsigned,
  `nactivo_v` tinyint(1) unsigned,
  `cnombre` varchar(60),
  `ccontraparte` varchar(10),
  `cficha_nom` varchar(10),
  `nid_sucursal` int(4) unsigned,
  `ncontratado` tinyint(1) unsigned,
  `nactivo_c` tinyint(1) unsigned,
  `cconcepto_com` varchar(4),
  `cdescripcion_s` varchar(60),
  `ncap_carga` double,
  `nactivo_s` tinyint(1) unsigned,
  `nbono_alm` double(7,4),
  `nbono_mon` double(7,4),
  `nporc_com_s` int(3) unsigned,
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `nmonto_a` double,
  `dfecha_a` date,
  `nstatus_a` tinyint(3) unsigned,
  `nid_relacion` int(10) unsigned,
  `dfecha_r` date,
  `nstatus_r` tinyint(1) unsigned,
  `cdescripcion_r` varchar(60),
  `cdescripcion_o` varchar(60),
  `cdescripcion_p` varchar(60),
  `dfecha_desde` date,
  `dfecha_hasta` date,
  `nmonto_com` double,
  `nmonto_r` double,
  `cdescripcion_d` varchar(60),
  `ncount_viaje` bigint(21),
  `ncount_anticipo` bigint(21)
);

--
-- Temporary table structure for view `vw_rutas`
--
DROP TABLE IF EXISTS `vw_rutas`;
DROP VIEW IF EXISTS `vw_rutas`;
CREATE TABLE `vw_rutas` (
  `nid_origen` int(4) unsigned,
  `nid_destino` int(4) unsigned,
  `ndistancia` double,
  `cid_usuario` varchar(20),
  `dfecha_act` timestamp,
  `cdescripcion` varchar(60),
  `nactivo` tinyint(1) unsigned,
  `nporc_com` int(2) unsigned,
  `ncom_pes` double,
  `ncom_med` double,
  `ncom_liv` double,
  `cdescripcion_o` varchar(60),
  `cid_ciudad_o` varchar(4),
  `nactivo_o` tinyint(1) unsigned,
  `nsucursal_o` tinyint(1) unsigned,
  `cdescripcion_co` varchar(60),
  `cid_estado_o` varchar(2),
  `cdescripcion_eo` varchar(60),
  `cdescripcion_d` varchar(60),
  `cid_ciudad_d` varchar(4),
  `nactivo_d` int(4) unsigned,
  `nsucursal_d` int(4) unsigned,
  `cdescripcion_cd` varchar(60),
  `cid_estado_d` varchar(2),
  `cdescripcion_ed` varchar(60)
);

--
-- Temporary table structure for view `vw_viajes`
--
DROP TABLE IF EXISTS `vw_viajes`;
DROP VIEW IF EXISTS `vw_viajes`;
CREATE TABLE `vw_viajes` (
  `nid_viaje` int(10) unsigned,
  `cid_chofer` varchar(9),
  `cid_vehiculo` varchar(10),
  `dfecha_v` date,
  `cguia` varchar(10),
  `npeso_neto` double,
  `nid_origen` int(4) unsigned,
  `nid_destino` int(4) unsigned,
  `ntipo_viaje` tinyint(1) unsigned,
  `ndistancia` double,
  `nstatus_v` tinyint(1) unsigned,
  `cfactura_ext` varchar(10),
  `ccliente_ext` varchar(45),
  `cnombre` varchar(60),
  `ccontraparte` varchar(10),
  `cficha_nom` varchar(10),
  `nid_sucursal` int(4) unsigned,
  `ncontratado` tinyint(1) unsigned,
  `nactivo_c` tinyint(1) unsigned,
  `cdescripcion_v` varchar(60),
  `ncapacidad` double,
  `ctipo_vehic` int(1) unsigned,
  `npropio` int(1) unsigned,
  `nactivo_v` tinyint(1) unsigned,
  `crif_empext` varchar(15),
  `cdescripcion_s` varchar(60),
  `ncap_carga` double,
  `nactivo_s` tinyint(1) unsigned,
  `nbono_alm` double(7,4),
  `nbono_mon` double(7,4),
  `nporc_com_s` int(3) unsigned,
  `cdescripcion_r` varchar(60),
  `nporc_com_r` int(2) unsigned,
  `ncom_pes` double,
  `ncom_med` double,
  `ncom_liv` double,
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `nmonto` double,
  `dfecha_a` date,
  `nstatus_a` tinyint(3) unsigned,
  `nid_relacion` int(10) unsigned,
  `dfecha_r` date,
  `nstatus_r` tinyint(1) unsigned,
  `count_anticipo` bigint(21),
  `count_viaje` bigint(21)
);

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
 (100000002,100000001),
 (100000003,100000002),
 (100000003,100000003),
 (100000004,100000004),
 (100000004,100000005),
 (100000005,100000006),
 (100000006,100000007),
 (100000007,100000008),
 (100000008,100000009),
 (100000008,100000010),
 (100000009,100000011),
 (100000010,100000012),
 (100000011,100000013),
 (100000012,100000014),
 (100000013,100000015),
 (100000014,100000015),
 (100000013,100000016),
 (200000001,200000001),
 (200000004,200000001),
 (200000002,200000002),
 (200000003,200000003),
 (200000005,200000004),
 (200000006,200000005);
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
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `nid_anticipo_ant` int(10) unsigned default NULL COMMENT 'Guarda el número de anticipo al cual se está reemplazando.',
  PRIMARY KEY  (`nid_anticipo`),
  KEY `ix_recibo` (`cnro_recibo`),
  KEY `FK_tanticipo_trelacion` (`nid_relacion`),
  CONSTRAINT `FK_tanticipo_trelacion` FOREIGN KEY (`nid_relacion`) REFERENCES `trelacion` (`nid_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo`
--

/*!40000 ALTER TABLE `tanticipo` DISABLE KEYS */;
INSERT INTO `tanticipo` (`nid_anticipo`,`cnro_recibo`,`nmonto`,`cid_usuario`,`dfecha_act`,`cobservacion`,`dfecha`,`nstatus`,`nid_relacion`,`nrelacionado`,`nid_sucursal`,`nid_anticipo_ant`) VALUES 
 (100000001,'185421',370,'P','2010-11-24 11:40:19','Ant 185421','2010-11-23',2,100000001,1,1,NULL),
 (100000002,'185475',250,'P','2010-11-24 11:40:19','Ant 185475','2010-11-23',2,100000001,1,1,NULL),
 (100000003,'185488',680,'P','2010-11-24 11:43:32','Ant 185488','2010-11-23',2,100000002,1,1,NULL),
 (100000004,'185559',1300,'P','2010-11-24 11:51:20','Ant. 185559','2010-11-24',2,100000003,1,1,NULL),
 (100000005,'185627',900,'P','2010-11-24 11:58:45','Ant 185627','2010-11-24',2,100000004,1,1,NULL),
 (100000006,'186572',930,'P','2010-11-25 10:16:02','Ant 186572','2010-11-24',2,100000005,1,1,NULL),
 (100000007,'186604',350,'P','2010-11-25 10:22:05','Ant 186604','2010-11-24',2,100000006,1,1,NULL),
 (100000008,'186650',680,'P','2010-11-25 10:25:23','Ant 186650','2010-11-24',2,100000007,1,1,NULL),
 (100000009,'186727',280,'P','2010-11-25 10:27:05','Ant 186727','2010-11-24',2,100000008,1,1,NULL),
 (100000010,'186753',160,'P','2010-11-25 10:29:03','Ant 186753','2010-11-24',2,100000009,1,1,NULL),
 (100000011,'186791',230,'P','2010-11-25 10:29:54','Ant 186791','2010-11-24',2,100000010,1,1,NULL),
 (100000012,'186885',1350,'P','2010-11-25 10:31:33','Ant 186885','2010-11-24',2,100000011,1,1,NULL),
 (100000013,'185398',230,'P','2010-11-25 10:32:48','ant 185398','2010-11-25',1,NULL,0,1,NULL),
 (100000014,'9',170,'P','2010-12-03 09:23:52','adic al ant 100000013','2010-12-03',1,NULL,0,1,NULL),
 (200000001,'181004',520,'P','2010-11-24 11:36:44','ant 181004','2010-11-23',2,200000001,1,2,NULL),
 (200000002,'999999',900,'P','2010-11-23 18:16:08','ant 999999','2010-11-23',3,NULL,0,2,NULL),
 (200000003,'999999',900,'P','2010-11-24 09:10:51','ant 999999','2010-11-24',3,NULL,0,2,NULL),
 (200000004,'185681',1010,'P','2010-11-24 11:36:44','Ant 185681','2010-11-24',2,200000001,1,2,NULL),
 (200000005,'800',800,'P','2010-11-26 17:18:52','prueba','2010-11-26',1,NULL,0,2,NULL),
 (200000006,'999',900,'P','2010-11-26 17:26:39','prueba','2010-11-26',1,NULL,0,2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1761 DEFAULT CHARSET=latin1;

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
 (748,'tservicio','U','P','2010-10-13 15:16:08','01'),
 (749,'tviaje','U','','2010-10-14 15:18:21','100000004'),
 (750,'tviaje','U','','2010-10-14 15:18:21','100000004'),
 (751,'tviaje','U','P','2010-10-14 15:18:21','100000006'),
 (752,'tviaje','U','P','2010-10-14 15:18:21','100000006'),
 (753,'ttipo_gasto','I','P','2010-10-14 15:44:05','08'),
 (754,'tRelacion','I','P','2010-10-14 15:45:33','100000006'),
 (755,'tAnticipo','U','P','2010-10-14 15:45:33','100000006'),
 (756,'tAnticipo','I','P','2010-10-14 15:48:45','100000007'),
 (757,'tviaje','I','P','2010-10-14 15:48:46','100000008'),
 (758,'tAnticipo','U','P','2010-10-14 16:03:10','100000006'),
 (759,'trelacion','D','P','2010-10-14 16:03:10','100000006'),
 (760,'tRelacion','I','P','2010-10-14 16:06:26','100000007'),
 (761,'tAnticipo','U','P','2010-10-14 16:06:26','100000006'),
 (762,'tAnticipo','U','P','2010-10-14 16:52:06','100000006'),
 (763,'trelacion','D','P','2010-10-14 16:52:06','100000007'),
 (764,'tRelacion','I','P','2010-10-14 16:53:01','100000008'),
 (765,'tAnticipo','U','P','2010-10-14 16:53:01','100000006'),
 (766,'tAnticipo','U','P','2010-10-14 16:53:28','100000006'),
 (767,'trelacion','D','P','2010-10-14 16:53:28','100000008'),
 (768,'tRelacion','I','P','2010-10-14 17:04:37','100000009'),
 (769,'tAnticipo','U','P','2010-10-14 17:04:37','100000006'),
 (770,'tAnticipo','U','P','2010-10-15 09:25:37','100000002'),
 (771,'tAnticipo','U','P','2010-10-15 09:25:37','100000003'),
 (772,'trelacion','D','P','2010-10-15 09:25:37','100000004'),
 (773,'tRelacion','I','P','2010-10-15 09:26:49','100000010'),
 (774,'tAnticipo','U','P','2010-10-15 09:26:49','100000002'),
 (775,'tAnticipo','U','P','2010-10-15 17:01:36','100000006'),
 (776,'trelacion','D','P','2010-10-15 17:01:36','100000009'),
 (777,'tAnticipo','U','P','2010-10-15 17:02:14','100000006'),
 (778,'tAnticipo','I','P','2010-10-15 17:06:52','100000008'),
 (779,'tviaje','I','P','2010-10-15 17:06:52','100000009'),
 (780,'tRelacion','I','P','2010-10-15 17:08:39','100000011'),
 (781,'tAnticipo','U','P','2010-10-15 17:08:39','100000008'),
 (782,'tperiodo','U','P','2010-10-18 14:34:27','16091510'),
 (783,'tRelacion','I','P','2010-10-18 14:37:14','100000012'),
 (784,'tAnticipo','U','P','2010-10-18 14:37:14','100000007'),
 (785,'tvehiculo','I','P','2010-10-18 14:39:41','A22AE3U'),
 (786,'tChofer','I','P','2010-10-18 14:39:41','12262801'),
 (787,'tChofer','U','P','2010-10-18 14:40:20','12262801'),
 (788,'tAnticipo','I','P','2010-10-18 14:41:20','200000001'),
 (789,'tviaje','I','P','2010-10-18 14:41:20','200000001'),
 (790,'tAnticipo','I','P','2010-10-18 14:42:25','200000002'),
 (791,'tviaje','I','P','2010-10-18 14:42:25','200000002'),
 (792,'tAnticipo','I','P','2010-10-18 14:43:19','200000003'),
 (793,'tviaje','I','P','2010-10-18 14:43:19','200000003'),
 (794,'tRelacion','I','P','2010-10-18 14:44:36','200000001'),
 (795,'tAnticipo','U','P','2010-10-18 14:44:36','200000001'),
 (796,'tRelacion','I','P','2010-10-18 14:45:52','200000002'),
 (797,'tAnticipo','U','P','2010-10-18 14:45:52','200000002'),
 (798,'tRelacion','I','P','2010-10-18 14:46:45','200000003'),
 (799,'tAnticipo','U','P','2010-10-18 14:46:45','200000003'),
 (800,'tvehiculo','I','P','2010-10-18 14:54:11','A86AA/OD'),
 (801,'tvehiculo','I','P','2010-10-18 14:54:23','A62AA9D'),
 (802,'tChofer','I','P','2010-10-18 14:54:23','11081888'),
 (803,'tvehiculo','I','P','2010-10-18 14:54:38','A15AU8D'),
 (804,'tChofer','I','P','2010-10-18 14:54:38','9841618'),
 (805,'tvehiculo','I','P','2010-10-18 14:54:48','76SDAR'),
 (806,'tChofer','I','P','2010-10-18 14:54:48','7241360'),
 (807,'tvehiculo','I','P','2010-10-18 14:55:00','39HDAO'),
 (808,'tChofer','I','P','2010-10-18 14:55:00','10139779'),
 (809,'tvehiculo','I','P','2010-10-18 14:55:14','48SDAR'),
 (810,'tChofer','I','P','2010-10-18 14:55:14','8657021'),
 (811,'tvehiculo','I','P','2010-10-18 14:55:30','61MDAS'),
 (812,'tChofer','I','P','2010-10-18 14:55:30','8603178'),
 (813,'tChofer','U','P','2010-10-18 14:57:05','7241360'),
 (814,'tChofer','U','P','2010-10-18 14:57:59','8657021'),
 (815,'tChofer','U','P','2010-10-18 14:58:16','10139779'),
 (816,'tChofer','U','P','2010-10-18 14:58:52','9841618'),
 (817,'tChofer','U','P','2010-10-18 14:59:13','11081888'),
 (818,'tAnticipo','I','P','2010-10-18 15:00:45','100000009'),
 (819,'tviaje','I','P','2010-10-18 15:00:45','100000010'),
 (820,'tAnticipo','I','P','2010-10-18 15:04:21','100000010'),
 (821,'tviaje','I','P','2010-10-18 15:04:21','100000011'),
 (822,'tAnticipo','I','P','2010-10-18 15:05:24','100000011'),
 (823,'tviaje','I','P','2010-10-18 15:05:24','100000012'),
 (824,'tAnticipo','I','P','2010-10-18 15:06:18','100000012'),
 (825,'tviaje','I','P','2010-10-18 15:06:18','100000013'),
 (826,'tAnticipo','I','P','2010-10-18 15:07:50','100000013'),
 (827,'tviaje','I','P','2010-10-18 15:07:51','100000014'),
 (828,'tAnticipo','I','P','2010-10-18 15:12:22','100000014'),
 (829,'tviaje','I','P','2010-10-18 15:12:22','100000015'),
 (830,'tChofer','U','P','2010-10-18 15:14:31','13486315'),
 (831,'tChofer','U','P','2010-10-18 15:14:59','13486315'),
 (832,'tAnticipo','I','P','2010-10-18 15:15:55','100000015'),
 (833,'tviaje','I','P','2010-10-18 15:15:55','100000016'),
 (834,'tAnticipo','I','P','2010-10-18 15:16:45','100000016'),
 (835,'tviaje','I','P','2010-10-18 15:16:45','100000017'),
 (836,'tAnticipo','I','P','2010-10-18 15:17:40','100000017'),
 (837,'tviaje','I','P','2010-10-18 15:17:40','100000018'),
 (838,'tAnticipo','I','P','2010-10-18 15:18:42','100000018'),
 (839,'tviaje','I','P','2010-10-18 15:18:42','100000019'),
 (840,'tAnticipo','I','P','2010-10-18 15:19:50','100000019'),
 (841,'tRelacion','I','P','2010-10-18 15:21:12','100000013'),
 (842,'tAnticipo','U','P','2010-10-18 15:21:12','100000009'),
 (843,'tRelacion','I','P','2010-10-18 15:21:55','100000014'),
 (844,'tAnticipo','U','P','2010-10-18 15:21:55','100000010'),
 (845,'tRelacion','I','P','2010-10-18 15:22:46','100000015'),
 (846,'tAnticipo','U','P','2010-10-18 15:22:46','100000011'),
 (847,'tRelacion','I','P','2010-10-18 15:23:38','100000016'),
 (848,'tAnticipo','U','P','2010-10-18 15:23:38','100000012'),
 (849,'tRelacion','I','P','2010-10-18 15:26:32','100000017'),
 (850,'tAnticipo','U','P','2010-10-18 15:26:32','100000013'),
 (851,'tRelacion','I','P','2010-10-18 15:28:00','100000018'),
 (852,'tAnticipo','U','P','2010-10-18 15:28:00','100000014'),
 (853,'tAnticipo','U','P','2010-10-18 15:29:26','100000015'),
 (854,'tAnticipo','I','P','2010-10-18 15:30:50','100000020'),
 (855,'tRelacion','I','P','2010-10-18 15:32:00','100000019'),
 (856,'tAnticipo','U','P','2010-10-18 15:32:00','100000019'),
 (857,'tAnticipo','U','P','2010-10-18 15:32:00','100000020'),
 (858,'tRelacion','I','P','2010-10-18 15:32:55','100000020'),
 (859,'tAnticipo','U','P','2010-10-18 15:32:55','100000016'),
 (860,'tRelacion','I','P','2010-10-18 15:33:50','100000021'),
 (861,'tAnticipo','U','P','2010-10-18 15:33:50','100000017'),
 (862,'tRelacion','I','P','2010-10-18 15:34:40','100000022'),
 (863,'tAnticipo','U','P','2010-10-18 15:34:40','100000018'),
 (864,'tvehiculo','I','P','2010-10-18 15:59:30','A15AU5D'),
 (865,'tChofer','I','P','2010-10-18 15:59:30','7547865'),
 (866,'tvehiculo','I','P','2010-10-18 15:59:43','09JGAK'),
 (867,'tChofer','I','P','2010-10-18 15:59:43','14000037'),
 (868,'tvehiculo','I','P','2010-10-18 16:00:17','67XPAC'),
 (869,'tChofer','I','P','2010-10-18 16:00:17','15107255'),
 (870,'tChofer','U','P','2010-10-18 16:01:28','15107255'),
 (871,'tChofer','U','P','2010-10-18 16:01:48','14000037'),
 (872,'tChofer','U','P','2010-10-18 16:02:07','7547865'),
 (873,'truta','I','P','2010-10-18 16:04:40','123'),
 (874,'tAnticipo','I','P','2010-10-18 16:05:18','100000021'),
 (875,'tviaje','I','P','2010-10-18 16:05:18','100000020'),
 (876,'tAnticipo','U','P','2010-10-18 16:08:44','100000021'),
 (877,'tAnticipo','I','P','2010-10-18 16:09:30','100000022'),
 (878,'tviaje','I','P','2010-10-18 16:09:30','100000021'),
 (879,'tAnticipo','I','P','2010-10-18 16:10:44','100000023'),
 (880,'tviaje','I','P','2010-10-18 16:10:44','100000022'),
 (881,'tAnticipo','I','P','2010-10-18 16:11:49','100000024'),
 (882,'tviaje','I','P','2010-10-18 16:11:49','100000023'),
 (883,'truta','I','P','2010-10-18 16:20:26','63'),
 (884,'tviaje','I','','2010-10-18 16:30:58','100000024'),
 (885,'tviaje','I','','2010-10-18 16:32:25','100000025'),
 (886,'tAnticipo','U','P','2010-10-18 16:41:59','100000019'),
 (887,'tAnticipo','U','P','2010-10-18 16:41:59','100000020'),
 (888,'trelacion','D','P','2010-10-18 16:41:59','100000019'),
 (889,'tRelacion','I','P','2010-10-18 16:43:10','100000023'),
 (890,'tAnticipo','U','P','2010-10-18 16:43:10','100000019'),
 (891,'tperiodo','U','P','2010-10-18 17:52:46','16091510'),
 (892,'tperiodo','U','P','2010-10-18 17:56:34','16091510'),
 (893,'tPeriodo','I','P','2010-10-18 18:07:26','16101511'),
 (894,'tperiodo','U','P','2010-10-18 18:09:11','16101511'),
 (895,'tperiodo','U','P','2010-10-18 18:11:28','16101511'),
 (896,'tRelacion','I','P','2010-10-18 18:16:52','100000024'),
 (897,'tAnticipo','U','P','2010-10-18 18:16:52','100000003'),
 (898,'tperiodo','U','P','2010-10-20 10:36:33','16101511'),
 (899,'tperiodo','U','P','2010-10-20 10:40:43','16101511'),
 (900,'tperiodo','U','P','2010-10-20 10:41:35','16101511'),
 (901,'tvehiculo','U','P','2010-10-20 10:56:19','65XPAC'),
 (902,'tvehiculo','U','P','2010-10-20 11:25:05','65XPAC'),
 (903,'tvehiculo','U','P','2010-10-20 11:31:06','65XPAC'),
 (904,'tvehiculo','U','P','2010-10-20 11:31:15','65XPAC'),
 (905,'tvehiculo','U','P','2010-10-20 11:31:22','65XPAC'),
 (906,'tsucursal','U','P','2010-10-20 11:44:05','1'),
 (907,'tsucursal','U','P','2010-10-20 11:44:05','2'),
 (908,'tsucursal','U','P','2010-10-20 11:44:05','3'),
 (909,'tsucursal','U','P','2010-10-20 11:44:05','4'),
 (910,'tsucursal','U','P','2010-10-20 11:44:05','5'),
 (911,'tsucursal','U','P','2010-10-20 11:44:05','6'),
 (912,'tsucursal','U','P','2010-10-20 12:03:42','1'),
 (913,'torigen_destino','U','P','2010-10-20 12:04:08','1'),
 (914,'tsucursal','U','P','2010-10-20 12:04:08','1'),
 (915,'torigen_destino','U','P','2010-10-20 12:04:16','1'),
 (916,'tsucursal','U','P','2010-10-20 12:04:16','1'),
 (917,'tsucursal','U','P','2010-10-20 12:13:42','1'),
 (918,'tsucursal','U','P','2010-10-20 12:14:20','1'),
 (919,'tvehiculo','U','P','2010-10-20 14:23:05','09JGAK'),
 (920,'tvehiculo','U','P','2010-10-20 14:24:08','39HDAO'),
 (921,'tvehiculo','U','P','2010-10-20 14:24:57','48SDAR'),
 (922,'tvehiculo','D','P','2010-10-20 14:26:44','61MDAS'),
 (923,'tvehiculo','U','P','2010-10-20 14:28:24','65XPAC'),
 (924,'tvehiculo','U','P','2010-10-20 14:29:31','67XPAC'),
 (925,'tvehiculo','U','P','2010-10-20 15:11:44','76SDAR'),
 (926,'tvehiculo','U','P','2010-10-20 15:25:04','A15AU5D'),
 (927,'tvehiculo','U','P','2010-10-20 15:25:39','A15AU8D'),
 (928,'tvehiculo','U','P','2010-10-20 15:26:13','A62AA9D'),
 (929,'tvehiculo','U','P','2010-10-20 15:27:24','A64AE3E'),
 (930,'tvehiculo','U','P','2010-10-20 15:30:23','A75A/D1I'),
 (931,'tvehiculo','U','P','2010-10-20 15:30:55','A75AD1/I'),
 (932,'tvehiculo','U','P','2010-10-20 15:31:25','A86AA/OD'),
 (933,'tvehiculo','U','P','2010-10-20 15:31:51','A86AA0D'),
 (934,'tvehiculo','I','P','2010-10-20 16:38:14','667XGB'),
 (935,'tChofer','I','P','2010-10-20 16:38:19','4605734'),
 (936,'tChofer','U','P','2010-10-20 16:39:02','8603178'),
 (937,'tChofer','U','P','2010-10-20 16:39:13','4605734'),
 (938,'tperiodo','U','P','2010-10-20 17:18:28','16091510'),
 (939,'tperiodo','U','P','2010-10-20 17:23:18','16091510'),
 (940,'tperiodo','U','P','2010-10-20 17:23:42','16091510'),
 (941,'tPeriodo','I','P','2010-10-20 18:05:32','123'),
 (942,'tperiodo','D','P','2010-10-20 18:05:43','123'),
 (943,'tperiodo','U','P','2010-10-21 15:56:07','16091510'),
 (944,'tperiodo','U','P','2010-10-21 15:56:07','16091510'),
 (945,'trelacion','U','P','2010-10-21 15:58:41','100000001'),
 (946,'trelacion','U','P','2010-10-21 15:58:41','100000003'),
 (947,'trelacion','U','P','2010-10-21 15:58:41','100000005'),
 (948,'tperiodo','U','P','2010-10-26 12:04:14','16091510'),
 (949,'tperiodo','U','P','2010-10-26 12:04:14','16091510'),
 (950,'tperiodo','U','P','2010-10-26 12:04:14','16101511'),
 (951,'trelacion','U','P','2010-10-26 16:27:12','100000011'),
 (952,'tperiodo','U','P','2010-10-26 18:59:04','16091510'),
 (953,'tviaje','U','P','2010-10-29 16:09:59','100000006'),
 (954,'tCiudad','I','P','2010-10-29 18:11:00','1705'),
 (955,'tCiudad','I','P','2010-10-29 18:11:35','1706'),
 (956,'tCiudad','I','P','2010-10-29 18:11:46','1707'),
 (957,'tCiudad','I','P','2010-10-29 18:12:14','1708'),
 (958,'tCiudad','I','P','2010-10-29 18:12:27','1709'),
 (959,'tCiudad','I','P','2010-10-29 18:12:43','1710'),
 (960,'tCiudad','I','P','2010-10-29 19:24:12','0502'),
 (961,'tCiudad','I','P','2010-10-29 19:25:01','0503'),
 (962,'tCiudad','I','P','2010-10-29 19:26:04','0504'),
 (963,'tCiudad','I','P','2010-10-29 19:26:54','0505'),
 (964,'tCiudad','I','P','2010-10-29 19:28:22','0506'),
 (965,'tCiudad','I','P','2010-10-29 19:29:10','0507'),
 (966,'tCiudad','I','P','2010-10-29 19:30:47','0508'),
 (967,'tCiudad','I','P','2010-10-29 19:31:44','0509'),
 (968,'tCiudad','I','P','2010-10-29 19:33:02','0510'),
 (969,'tCiudad','I','P','2010-10-29 19:33:30','0511'),
 (970,'tCiudad','I','P','2010-10-29 19:35:28','1711'),
 (976,'tAnticipo','D','P','2010-10-29 20:23:11','100000001'),
 (977,'tAnticipo','D','P','2010-10-29 20:23:11','100000002'),
 (978,'tAnticipo','D','P','2010-10-29 20:23:11','100000003'),
 (979,'tAnticipo','D','P','2010-10-29 20:23:11','100000004'),
 (980,'tAnticipo','D','P','2010-10-29 20:23:11','100000005'),
 (981,'tAnticipo','D','P','2010-10-29 20:23:11','100000006'),
 (982,'tAnticipo','D','P','2010-10-29 20:23:11','100000007'),
 (983,'tAnticipo','D','P','2010-10-29 20:23:11','100000008'),
 (984,'tAnticipo','D','P','2010-10-29 20:23:11','100000009'),
 (985,'tAnticipo','D','P','2010-10-29 20:23:11','100000010'),
 (986,'tAnticipo','D','P','2010-10-29 20:23:11','100000011'),
 (987,'tAnticipo','D','P','2010-10-29 20:23:11','100000012'),
 (988,'tAnticipo','D','P','2010-10-29 20:23:11','100000013'),
 (989,'tAnticipo','D','P','2010-10-29 20:23:11','100000014'),
 (990,'tAnticipo','D','P','2010-10-29 20:23:11','100000015'),
 (991,'tAnticipo','D','P','2010-10-29 20:23:11','100000016'),
 (992,'tAnticipo','D','P','2010-10-29 20:23:11','100000017'),
 (993,'tAnticipo','D','P','2010-10-29 20:23:11','100000018'),
 (994,'tAnticipo','D','P','2010-10-29 20:23:11','100000019'),
 (995,'tAnticipo','D','P','2010-10-29 20:23:11','100000020'),
 (996,'tAnticipo','D','P','2010-10-29 20:23:11','100000021'),
 (997,'tAnticipo','D','P','2010-10-29 20:23:11','100000022'),
 (998,'tAnticipo','D','P','2010-10-29 20:23:11','100000023'),
 (999,'tAnticipo','D','P','2010-10-29 20:23:11','100000024'),
 (1000,'tAnticipo','D','P','2010-10-29 20:23:11','200000001'),
 (1001,'tAnticipo','D','P','2010-10-29 20:23:11','200000002'),
 (1002,'tAnticipo','D','P','2010-10-29 20:23:11','200000003'),
 (1003,'trelacion','D','P','2010-10-29 20:23:13','100000001'),
 (1004,'trelacion','D','P','2010-10-29 20:23:13','100000003'),
 (1005,'trelacion','D','P','2010-10-29 20:23:13','100000005'),
 (1006,'trelacion','D','P','2010-10-29 20:23:13','100000010'),
 (1007,'trelacion','D','P','2010-10-29 20:23:13','100000011'),
 (1008,'trelacion','D','P','2010-10-29 20:23:13','100000012'),
 (1009,'trelacion','D','P','2010-10-29 20:23:13','100000013'),
 (1010,'trelacion','D','P','2010-10-29 20:23:13','100000014'),
 (1011,'trelacion','D','P','2010-10-29 20:23:13','100000015'),
 (1012,'trelacion','D','P','2010-10-29 20:23:13','100000016'),
 (1013,'trelacion','D','P','2010-10-29 20:23:13','100000017'),
 (1014,'trelacion','D','P','2010-10-29 20:23:13','100000018'),
 (1015,'trelacion','D','P','2010-10-29 20:23:13','100000020'),
 (1016,'trelacion','D','P','2010-10-29 20:23:13','100000021'),
 (1017,'trelacion','D','P','2010-10-29 20:23:13','100000022'),
 (1018,'trelacion','D','P','2010-10-29 20:23:13','100000023'),
 (1019,'trelacion','D','P','2010-10-29 20:23:13','100000024'),
 (1020,'trelacion','D','P','2010-10-29 20:23:13','200000001'),
 (1021,'trelacion','D','P','2010-10-29 20:23:13','200000002'),
 (1022,'trelacion','D','P','2010-10-29 20:23:13','200000003'),
 (1024,'tviaje','D','P','2010-10-29 20:24:03','100000001'),
 (1025,'tviaje','D','P','2010-10-29 20:24:03','100000002'),
 (1026,'tviaje','D','P','2010-10-29 20:24:03','100000003'),
 (1027,'tviaje','D','','2010-10-29 20:24:03','100000004'),
 (1028,'tviaje','D','P','2010-10-29 20:24:03','100000005'),
 (1029,'tviaje','D','P','2010-10-29 20:24:03','100000006'),
 (1030,'tviaje','D','P','2010-10-29 20:24:03','100000007'),
 (1031,'tviaje','D','P','2010-10-29 20:24:03','100000008'),
 (1032,'tviaje','D','P','2010-10-29 20:24:03','100000009'),
 (1033,'tviaje','D','P','2010-10-29 20:24:03','100000010'),
 (1034,'tviaje','D','P','2010-10-29 20:24:03','100000011'),
 (1035,'tviaje','D','P','2010-10-29 20:24:03','100000012'),
 (1036,'tviaje','D','P','2010-10-29 20:24:03','100000013'),
 (1037,'tviaje','D','P','2010-10-29 20:24:03','100000014'),
 (1038,'tviaje','D','P','2010-10-29 20:24:03','100000015'),
 (1039,'tviaje','D','P','2010-10-29 20:24:03','100000016'),
 (1040,'tviaje','D','P','2010-10-29 20:24:03','100000017'),
 (1041,'tviaje','D','P','2010-10-29 20:24:03','100000018'),
 (1042,'tviaje','D','P','2010-10-29 20:24:03','100000019'),
 (1043,'tviaje','D','P','2010-10-29 20:24:03','100000020'),
 (1044,'tviaje','D','P','2010-10-29 20:24:03','100000021'),
 (1045,'tviaje','D','P','2010-10-29 20:24:03','100000022'),
 (1046,'tviaje','D','P','2010-10-29 20:24:03','100000023'),
 (1047,'tviaje','D','','2010-10-29 20:24:03','100000024'),
 (1048,'tviaje','D','','2010-10-29 20:24:03','100000025'),
 (1049,'tviaje','D','P','2010-10-29 20:24:03','200000001'),
 (1050,'tviaje','D','P','2010-10-29 20:24:03','200000002'),
 (1051,'tviaje','D','P','2010-10-29 20:24:03','200000003'),
 (1052,'tperiodo','D','P','2010-10-29 20:24:23','16091510'),
 (1053,'tperiodo','D','P','2010-10-29 20:24:23','16101511'),
 (1054,'tPeriodo','I','P','2010-10-29 20:43:23','08100910'),
 (1055,'tperiodo','D','P','2010-10-29 20:43:59','08100910'),
 (1056,'tPeriodo','I','P','2010-10-29 20:44:45','08101110'),
 (1057,'tperiodo','D','P','2010-10-29 20:45:08','08101110'),
 (1058,'tPeriodo','I','P','2010-10-29 20:45:26','08101110'),
 (1059,'truta','I','P','2010-10-29 20:47:24','110'),
 (1060,'truta','I','P','2010-10-29 20:49:26','19'),
 (1061,'tCiudad','I','P','2010-10-29 20:51:45','0602'),
 (1062,'torigen_destino','I','P','2010-10-29 20:53:39','37'),
 (1063,'truta','I','P','2010-10-29 20:54:06','137'),
 (1064,'tperiodo','D','P','2010-10-29 21:02:52','08101110'),
 (1065,'tPeriodo','I','P','2010-10-29 21:03:18','08101110'),
 (1066,'tperiodo','D','P','2010-10-29 21:04:17','08101110'),
 (1067,'tPeriodo','I','P','2010-10-29 21:04:36','08101110'),
 (1068,'tChofer','I','P','2010-10-29 21:12:53','9562700'),
 (1069,'tChofer','U','P','2010-10-29 21:13:31','9562700'),
 (1070,'tAnticipo','I','P','2010-10-29 21:15:28','200000001'),
 (1071,'tviaje','I','P','2010-10-29 21:15:28','200000001'),
 (1072,'tChofer','U','P','2010-10-30 12:12:01','9562700'),
 (1073,'tAnticipo','D','P','2010-10-30 16:46:11','200000001'),
 (1074,'tviaje','D','P','2010-10-30 16:46:16','200000001'),
 (1075,'tAnticipo','I','P','2010-10-30 16:47:44','100000001'),
 (1076,'tviaje','I','P','2010-10-30 16:47:44','100000001'),
 (1077,'tAnticipo','I','P','2010-10-30 16:48:49','100000002'),
 (1078,'tAnticipo','I','P','2010-10-30 16:52:50','100000003'),
 (1079,'tviaje','I','P','2010-10-30 16:52:50','100000002'),
 (1080,'tAnticipo','I','P','2010-10-30 16:53:38','100000004'),
 (1081,'tAnticipo','I','P','2010-10-30 16:57:38','100000005'),
 (1082,'tviaje','I','P','2010-10-30 16:57:38','100000003'),
 (1083,'tviaje','I','P','2010-10-30 16:57:38','100000004'),
 (1084,'tviaje','U','P','2010-10-30 17:00:48','100000004'),
 (1085,'tAnticipo','I','P','2010-10-30 17:03:55','100000006'),
 (1086,'tviaje','I','P','2010-10-30 17:03:55','100000005'),
 (1087,'tviaje','I','P','2010-10-30 17:03:55','100000006'),
 (1088,'tAnticipo','I','P','2010-10-30 17:05:01','100000007'),
 (1089,'tviaje','I','P','2010-10-30 17:05:01','100000007'),
 (1090,'tAnticipo','I','P','2010-10-30 17:06:44','100000008'),
 (1091,'tviaje','I','P','2010-10-30 17:06:44','100000008'),
 (1092,'tAnticipo','I','P','2010-10-30 17:07:38','100000009'),
 (1093,'tviaje','I','P','2010-10-30 17:07:38','100000009'),
 (1094,'tvehiculo','I','P','2010-10-30 17:08:03','66XPAC'),
 (1095,'tChofer','I','P','2010-10-30 17:08:12','19170321'),
 (1096,'tAnticipo','I','P','2010-10-30 17:08:37','100000010'),
 (1097,'tviaje','I','P','2010-10-30 17:08:37','100000010'),
 (1098,'tviaje','I','','2010-10-30 17:10:00','100000011'),
 (1099,'tAnticipo','I','P','2010-10-30 17:10:58','100000011'),
 (1100,'tviaje','I','P','2010-10-30 17:10:58','100000012'),
 (1101,'tAnticipo','I','P','2010-10-30 17:12:01','100000012'),
 (1102,'tviaje','I','P','2010-10-30 17:12:01','100000013'),
 (1103,'tAnticipo','I','P','2010-10-30 17:12:49','100000013'),
 (1104,'tviaje','I','P','2010-10-30 17:12:49','100000014'),
 (1105,'tAnticipo','I','P','2010-10-30 17:13:36','100000014'),
 (1106,'tviaje','I','P','2010-10-30 17:13:37','100000015'),
 (1107,'tRelacion','I','P','2010-10-30 17:15:50','100000001'),
 (1108,'tAnticipo','U','P','2010-10-30 17:15:50','100000001'),
 (1109,'tAnticipo','U','P','2010-10-30 17:15:50','100000002'),
 (1110,'ttipo_gasto','I','P','2010-10-30 17:17:40','07'),
 (1111,'tRelacion','I','P','2010-10-30 17:18:21','100000002'),
 (1112,'tAnticipo','U','P','2010-10-30 17:18:21','100000003'),
 (1113,'tAnticipo','U','P','2010-10-30 17:18:21','100000004'),
 (1114,'tRelacion','I','P','2010-10-30 17:20:17','100000003'),
 (1115,'tAnticipo','U','P','2010-10-30 17:20:17','100000005'),
 (1116,'tRelacion','I','P','2010-10-30 17:21:48','100000004'),
 (1117,'tAnticipo','U','P','2010-10-30 17:21:48','100000006'),
 (1118,'tRelacion','I','P','2010-10-30 17:22:52','100000005'),
 (1119,'tAnticipo','U','P','2010-10-30 17:22:52','100000007'),
 (1120,'tRelacion','I','P','2010-10-30 17:24:16','100000006'),
 (1121,'tAnticipo','U','P','2010-10-30 17:24:16','100000008'),
 (1122,'tRelacion','I','P','2010-10-30 17:25:29','100000007'),
 (1123,'tAnticipo','U','P','2010-10-30 17:25:29','100000009'),
 (1124,'tRelacion','I','P','2010-10-30 17:26:24','100000008'),
 (1125,'tAnticipo','U','P','2010-10-30 17:26:24','100000010'),
 (1126,'tAnticipo','U','P','2010-10-30 17:28:29','100000010'),
 (1127,'trelacion','D','P','2010-10-30 17:28:29','100000008'),
 (1128,'tRelacion','I','P','2010-10-30 17:29:56','100000009'),
 (1129,'tAnticipo','U','P','2010-10-30 17:29:56','100000010'),
 (1130,'tRelacion','I','P','2010-10-30 17:30:52','100000010'),
 (1131,'tAnticipo','U','P','2010-10-30 17:30:52','100000011'),
 (1132,'tRelacion','I','P','2010-10-30 17:31:50','100000011'),
 (1133,'tAnticipo','U','P','2010-10-30 17:31:50','100000012'),
 (1134,'tRelacion','I','P','2010-10-30 17:32:36','100000012'),
 (1135,'tAnticipo','U','P','2010-10-30 17:32:36','100000013'),
 (1136,'tRelacion','I','P','2010-10-30 17:33:28','100000013'),
 (1137,'tAnticipo','U','P','2010-10-30 17:33:28','100000014'),
 (1138,'tperiodo','U','P','2010-10-30 17:33:55','08101110'),
 (1139,'trelacion','U','P','2010-10-30 17:34:06','100000001'),
 (1140,'trelacion','U','P','2010-10-30 17:34:06','100000002'),
 (1141,'trelacion','U','P','2010-10-30 17:34:06','100000003'),
 (1142,'trelacion','U','P','2010-10-30 17:34:06','100000004'),
 (1143,'trelacion','U','P','2010-10-30 17:34:06','100000005'),
 (1144,'trelacion','U','P','2010-10-30 17:34:06','100000006'),
 (1145,'trelacion','U','P','2010-10-30 17:34:06','100000007'),
 (1146,'trelacion','U','P','2010-10-30 17:34:06','100000009'),
 (1147,'trelacion','U','P','2010-10-30 17:34:06','100000010'),
 (1148,'trelacion','U','P','2010-10-30 17:34:06','100000011'),
 (1149,'trelacion','U','P','2010-10-30 17:34:06','100000012'),
 (1150,'trelacion','U','P','2010-10-30 17:34:06','100000013');
INSERT INTO `tbitacora` (`nid_bitacora`,`ctabla`,`coperacion`,`cid_usuario`,`dfecha`,`cregistro`) VALUES 
 (1151,'tviaje','U','P','2010-10-30 17:40:11','100000004'),
 (1152,'tviaje','U','P','2010-10-30 17:40:11','100000003'),
 (1153,'tviaje','U','P','2010-10-30 17:40:11','100000004'),
 (1154,'tviaje','U','P','2010-10-30 17:40:11','100000004'),
 (1155,'tviaje','U','P','2010-10-30 17:40:11','100000003'),
 (1156,'tviaje','U','P','2010-10-30 17:40:11','100000004'),
 (1157,'tviaje','U','P','2010-10-30 17:40:11','100000006'),
 (1158,'tviaje','U','P','2010-10-30 17:40:11','100000006'),
 (1159,'tviaje','U','P','2010-10-30 17:40:11','100000006'),
 (1160,'tPeriodo','I','P','2010-10-30 17:57:15','123'),
 (1161,'tperiodo','D','P','2010-10-30 17:57:20','123'),
 (1162,'tPeriodo','I','P','2010-10-30 18:26:04','01'),
 (1163,'tperiodo','D','P','2010-10-30 18:26:09','01'),
 (1164,'tperiodo','U','P','2010-11-01 10:57:25','08101110'),
 (1165,'tAnticipo','I','P','2010-11-01 11:38:57','100000015'),
 (1166,'tviaje','I','P','2010-11-01 11:38:57','100000016'),
 (1167,'tAnticipo','I','P','2010-11-01 11:40:41','100000016'),
 (1168,'tviaje','I','P','2010-11-01 11:40:41','100000017'),
 (1169,'truta','I','P','2010-11-01 11:47:26','61'),
 (1170,'tviaje','I','','2010-11-01 11:49:16','100000018'),
 (1171,'tAnticipo','I','P','2010-11-01 11:50:04','100000017'),
 (1172,'tAnticipo','I','P','2010-11-01 12:02:40','100000018'),
 (1173,'tviaje','I','P','2010-11-01 12:02:40','100000019'),
 (1174,'truta','I','P','2010-11-01 12:12:10','3616'),
 (1175,'tviaje','I','','2010-11-01 12:13:42','100000020'),
 (1176,'torigen_destino','I','P','2010-11-01 15:26:57','38'),
 (1177,'torigen_destino','U','P','2010-11-01 15:27:08','38'),
 (1178,'torigen_destino','U','P','2010-11-01 15:29:11','38'),
 (1179,'truta','I','P','2010-11-01 15:31:03','138'),
 (1180,'tAnticipo','I','P','2010-11-01 15:31:54','100000019'),
 (1181,'tviaje','I','P','2010-11-01 15:31:54','100000021'),
 (1182,'tAnticipo','I','P','2010-11-02 09:10:38','100000020'),
 (1183,'tviaje','I','P','2010-11-02 09:10:38','100000022'),
 (1184,'tAnticipo','I','P','2010-11-02 09:15:42','100000021'),
 (1185,'tviaje','I','P','2010-11-02 09:15:42','100000023'),
 (1186,'tAnticipo','I','P','2010-11-02 09:22:50','100000022'),
 (1187,'tviaje','I','P','2010-11-02 09:22:50','100000024'),
 (1188,'torigen_destino','I','P','2010-11-02 10:02:47','39'),
 (1189,'torigen_destino','I','P','2010-11-02 10:05:05','40'),
 (1190,'truta','I','P','2010-11-02 10:06:11','3940'),
 (1191,'tviaje','I','','2010-11-02 10:07:22','100000025'),
 (1192,'tAnticipo','I','P','2010-11-02 10:09:35','100000023'),
 (1193,'tviaje','I','P','2010-11-02 10:09:35','100000026'),
 (1194,'tAnticipo','I','P','2010-11-02 10:10:54','100000024'),
 (1195,'tviaje','I','P','2010-11-02 10:10:54','100000027'),
 (1196,'tperiodo','U','P','2010-11-02 10:11:49','08101110'),
 (1197,'tperiodo','U','P','2010-11-02 10:13:05','08101110'),
 (1198,'tRelacion','I','P','2010-11-02 10:17:09','100000014'),
 (1199,'tAnticipo','U','P','2010-11-02 10:17:09','100000015'),
 (1200,'tRelacion','I','P','2010-11-02 10:19:16','100000015'),
 (1201,'tAnticipo','U','P','2010-11-02 10:19:16','100000016'),
 (1202,'tAnticipo','U','P','2010-11-02 10:19:16','100000017'),
 (1203,'tAnticipo','U','P','2010-11-02 10:20:13','100000016'),
 (1204,'tAnticipo','U','P','2010-11-02 10:20:13','100000017'),
 (1205,'trelacion','D','P','2010-11-02 10:20:13','100000015'),
 (1206,'tRelacion','I','P','2010-11-02 10:21:23','100000016'),
 (1207,'tAnticipo','U','P','2010-11-02 10:21:23','100000016'),
 (1208,'tAnticipo','U','P','2010-11-02 10:21:23','100000017'),
 (1209,'tRelacion','I','P','2010-11-02 10:22:36','100000017'),
 (1210,'tAnticipo','U','P','2010-11-02 10:22:36','100000018'),
 (1211,'tAnticipo','U','P','2010-11-02 10:23:07','100000018'),
 (1212,'trelacion','D','P','2010-11-02 10:23:07','100000017'),
 (1213,'tRelacion','I','P','2010-11-02 10:28:13','100000018'),
 (1214,'tAnticipo','U','P','2010-11-02 10:28:13','100000018'),
 (1215,'tRelacion','I','P','2010-11-02 10:30:16','100000019'),
 (1216,'tAnticipo','U','P','2010-11-02 10:30:16','100000019'),
 (1217,'tRelacion','I','P','2010-11-02 10:31:55','100000020'),
 (1218,'tAnticipo','U','P','2010-11-02 10:31:55','100000020'),
 (1219,'tRelacion','I','P','2010-11-02 10:33:34','100000021'),
 (1220,'tAnticipo','U','P','2010-11-02 10:33:34','100000021'),
 (1221,'tRelacion','I','P','2010-11-02 11:24:17','100000022'),
 (1222,'tAnticipo','U','P','2010-11-02 11:24:17','100000022'),
 (1223,'tRelacion','I','P','2010-11-02 11:27:09','100000023'),
 (1224,'tAnticipo','U','P','2010-11-02 11:27:09','100000023'),
 (1225,'tRelacion','I','P','2010-11-02 11:28:33','100000024'),
 (1226,'tAnticipo','U','P','2010-11-02 11:28:33','100000024'),
 (1227,'tperiodo','U','P','2010-11-02 11:28:51','08101110'),
 (1228,'trelacion','U','P','2010-11-02 11:30:16','100000014'),
 (1229,'trelacion','U','P','2010-11-02 11:30:16','100000016'),
 (1230,'trelacion','U','P','2010-11-02 11:30:16','100000018'),
 (1231,'trelacion','U','P','2010-11-02 11:30:16','100000019'),
 (1232,'trelacion','U','P','2010-11-02 11:30:16','100000020'),
 (1233,'trelacion','U','P','2010-11-02 11:30:16','100000021'),
 (1234,'trelacion','U','P','2010-11-02 11:30:16','100000022'),
 (1235,'trelacion','U','P','2010-11-02 11:30:16','100000023'),
 (1236,'trelacion','U','P','2010-11-02 11:30:16','100000024'),
 (1237,'tperiodo','U','P','2010-11-02 15:01:56','08101110'),
 (1238,'tgasto_serv','I','P','2010-11-02 15:20:51','100000001'),
 (1239,'tCiudad','I','P','2010-11-03 10:42:23','1712'),
 (1240,'tCiudad','I','P','2010-11-03 14:55:20','0512'),
 (1241,'torigen_destino','I','P','2010-11-03 15:00:26','41'),
 (1242,'torigen_destino','I','P','2010-11-03 15:00:50','42'),
 (1243,'torigen_destino','I','P','2010-11-03 15:01:11','43'),
 (1244,'torigen_destino','I','P','2010-11-03 15:01:33','44'),
 (1245,'torigen_destino','I','P','2010-11-03 15:01:57','45'),
 (1246,'torigen_destino','I','P','2010-11-03 15:04:01','46'),
 (1247,'torigen_destino','I','P','2010-11-03 15:04:20','47'),
 (1248,'torigen_destino','I','P','2010-11-03 15:05:37','48'),
 (1249,'torigen_destino','I','P','2010-11-03 15:06:40','49'),
 (1250,'torigen_destino','I','P','2010-11-03 15:07:09','50'),
 (1251,'torigen_destino','I','P','2010-11-03 15:08:18','51'),
 (1252,'truta','I','P','2010-11-03 16:15:57','150'),
 (1253,'truta','I','P','2010-11-03 16:18:08','142'),
 (1254,'truta','I','P','2010-11-03 16:20:22','148'),
 (1255,'truta','I','P','2010-11-03 16:22:40','149'),
 (1256,'truta','I','P','2010-11-03 16:26:47','147'),
 (1257,'truta','I','P','2010-11-03 16:28:33','143'),
 (1258,'truta','I','P','2010-11-03 16:30:25','151'),
 (1259,'truta','I','P','2010-11-03 16:33:23','141'),
 (1260,'truta','I','P','2010-11-03 16:34:48','145'),
 (1261,'truta','I','P','2010-11-03 16:36:19','146'),
 (1262,'truta','I','P','2010-11-03 16:37:35','144'),
 (1263,'tCiudad','I','P','2010-11-04 08:16:59','2004'),
 (1264,'tCiudad','I','P','2010-11-04 08:17:31','2005'),
 (1265,'tCiudad','I','P','2010-11-04 08:18:06','2006'),
 (1266,'tCiudad','I','P','2010-11-04 08:19:20','2007'),
 (1267,'tCiudad','I','P','2010-11-04 08:19:40','2008'),
 (1268,'tCiudad','I','P','2010-11-04 08:20:55','2009'),
 (1269,'torigen_destino','I','P','2010-11-04 08:35:13','52'),
 (1270,'torigen_destino','I','P','2010-11-04 08:35:42','53'),
 (1271,'torigen_destino','I','P','2010-11-04 08:36:27','54'),
 (1272,'torigen_destino','I','P','2010-11-04 08:39:26','55'),
 (1273,'torigen_destino','I','P','2010-11-04 08:39:50','56'),
 (1274,'torigen_destino','U','P','2010-11-04 08:39:56','56'),
 (1275,'torigen_destino','I','P','2010-11-04 08:40:22','57'),
 (1276,'torigen_destino','U','P','2010-11-04 08:40:28','57'),
 (1277,'truta','I','P','2010-11-04 08:42:36','152'),
 (1278,'truta','I','P','2010-11-04 08:46:03','153'),
 (1279,'torigen_destino','I','P','2010-11-04 09:03:44','58'),
 (1280,'truta','I','P','2010-11-04 09:05:18','158'),
 (1281,'truta','I','P','2010-11-04 09:09:15','154'),
 (1282,'truta','I','P','2010-11-04 09:11:38','155'),
 (1283,'torigen_destino','U','P','2010-11-04 09:16:36','56'),
 (1284,'truta','I','P','2010-11-04 09:22:48','156'),
 (1285,'torigen_destino','U','P','2010-11-04 09:27:31','57'),
 (1286,'truta','I','P','2010-11-04 09:30:11','157'),
 (1287,'truta','I','P','2010-11-04 09:34:28','124'),
 (1288,'torigen_destino','I','P','2010-11-04 09:44:06','59'),
 (1289,'torigen_destino','I','P','2010-11-04 09:45:21','60'),
 (1290,'tCiudad','I','P','2010-11-04 09:47:23','1713'),
 (1291,'torigen_destino','I','P','2010-11-04 09:47:43','61'),
 (1292,'tCiudad','I','P','2010-11-04 09:48:55','1714'),
 (1293,'torigen_destino','I','P','2010-11-04 09:49:12','62'),
 (1294,'torigen_destino','I','P','2010-11-04 09:49:52','63'),
 (1295,'torigen_destino','I','P','2010-11-04 09:50:31','64'),
 (1296,'torigen_destino','I','P','2010-11-04 09:51:06','65'),
 (1297,'torigen_destino','I','P','2010-11-04 09:51:43','66'),
 (1298,'tCiudad','U','P','2010-11-04 09:52:53','1711'),
 (1299,'torigen_destino','I','P','2010-11-04 09:53:14','67'),
 (1300,'torigen_destino','I','P','2010-11-04 09:53:57','68'),
 (1301,'truta','I','P','2010-11-04 09:57:14','140'),
 (1302,'truta','I','P','2010-11-04 09:59:15','159'),
 (1303,'truta','I','P','2010-11-04 10:00:54','160'),
 (1304,'truta','I','P','2010-11-04 10:02:21','161'),
 (1305,'truta','I','P','2010-11-04 10:04:41','162'),
 (1306,'truta','I','P','2010-11-04 10:06:08','121'),
 (1307,'truta','I','P','2010-11-04 10:07:19','163'),
 (1308,'truta','I','P','2010-11-04 10:08:40','164'),
 (1309,'truta','I','P','2010-11-04 10:09:50','165'),
 (1310,'truta','I','P','2010-11-04 10:11:04','166'),
 (1311,'truta','I','P','2010-11-04 10:12:01','167'),
 (1312,'truta','I','P','2010-11-04 10:13:36','168'),
 (1313,'tCiudad','I','P','2010-11-04 10:28:42','1902'),
 (1314,'torigen_destino','I','P','2010-11-04 10:29:15','69'),
 (1315,'torigen_destino','U','P','2010-11-04 10:29:27','68'),
 (1316,'truta','I','P','2010-11-04 10:30:53','169'),
 (1317,'tCiudad','I','P','2010-11-04 10:45:52','1202'),
 (1318,'tCiudad','I','P','2010-11-04 10:46:11','1203'),
 (1319,'tCiudad','I','P','2010-11-04 10:47:11','1204'),
 (1320,'tCiudad','I','P','2010-11-04 10:47:37','1205'),
 (1321,'tCiudad','I','P','2010-11-04 10:48:58','1206'),
 (1322,'tCiudad','I','P','2010-11-04 10:49:25','1207'),
 (1323,'torigen_destino','I','P','2010-11-04 10:51:12','70'),
 (1324,'torigen_destino','I','P','2010-11-04 10:56:33','71'),
 (1325,'torigen_destino','U','P','2010-11-04 10:56:48','16'),
 (1326,'torigen_destino','I','P','2010-11-04 10:57:15','72'),
 (1327,'torigen_destino','I','P','2010-11-04 10:57:31','73'),
 (1328,'torigen_destino','I','P','2010-11-04 10:57:46','74'),
 (1329,'torigen_destino','I','P','2010-11-04 10:58:07','75'),
 (1330,'tCiudad','I','P','2010-11-04 10:59:12','1302'),
 (1331,'torigen_destino','I','P','2010-11-04 10:59:31','76'),
 (1332,'truta','I','P','2010-11-04 11:01:04','170'),
 (1333,'truta','I','P','2010-11-04 11:02:20','171'),
 (1334,'truta','I','P','2010-11-04 11:04:10','172'),
 (1335,'truta','I','P','2010-11-04 11:05:47','173'),
 (1336,'truta','I','P','2010-11-04 11:07:21','176'),
 (1337,'truta','I','P','2010-11-04 11:10:49','174'),
 (1338,'truta','I','P','2010-11-04 11:12:17','175'),
 (1339,'tCiudad','I','P','2010-11-04 14:30:25','0302'),
 (1340,'tCiudad','I','P','2010-11-04 14:31:27','0303'),
 (1341,'tCiudad','I','P','2010-11-04 14:32:23','0304'),
 (1342,'tCiudad','I','P','2010-11-04 14:36:03','2306'),
 (1343,'tCiudad','I','P','2010-11-04 14:37:45','2205'),
 (1344,'tCiudad','I','P','2010-11-04 14:39:26','2206'),
 (1345,'tCiudad','I','P','2010-11-04 14:41:53','2207'),
 (1346,'torigen_destino','I','P','2010-11-04 14:42:36','77'),
 (1347,'torigen_destino','I','P','2010-11-04 14:43:09','78'),
 (1348,'torigen_destino','I','P','2010-11-04 14:43:34','79'),
 (1349,'torigen_destino','I','P','2010-11-04 14:44:04','80'),
 (1350,'torigen_destino','I','P','2010-11-04 14:45:27','81'),
 (1351,'torigen_destino','I','P','2010-11-04 14:49:12','82'),
 (1352,'torigen_destino','I','P','2010-11-04 14:49:53','83'),
 (1353,'torigen_destino','I','P','2010-11-04 14:50:32','84'),
 (1354,'torigen_destino','I','P','2010-11-04 14:50:43','85'),
 (1355,'truta','I','P','2010-11-04 14:52:58','177'),
 (1356,'truta','I','P','2010-11-04 15:00:30','178'),
 (1357,'truta','I','P','2010-11-04 15:01:44','179'),
 (1358,'truta','I','P','2010-11-04 15:03:18','180'),
 (1359,'truta','I','P','2010-11-04 15:05:27','181'),
 (1360,'truta','I','P','2010-11-04 15:06:50','182'),
 (1361,'truta','I','P','2010-11-04 15:09:31','183'),
 (1362,'truta','I','P','2010-11-04 15:13:12','184'),
 (1363,'truta','I','P','2010-11-04 15:14:07','185'),
 (1364,'torigen_destino','I','P','2010-11-04 17:34:33','86'),
 (1365,'truta','I','P','2010-11-04 17:36:05','186'),
 (1366,'tCiudad','I','P','2010-11-04 18:12:22','0305'),
 (1367,'torigen_destino','I','P','2010-11-04 18:12:48','87'),
 (1368,'truta','I','P','2010-11-04 18:14:17','187'),
 (1369,'tperiodo','U','P','2010-11-05 14:58:36','08101110'),
 (1370,'tChofer','I','P','2010-11-05 15:07:32','1111'),
 (1371,'tChofer','D','P','2010-11-05 15:07:39','1111'),
 (1372,'tChofer','U','P','2010-11-05 15:32:59','10139779'),
 (1373,'tChofer','U','P','2010-11-05 15:45:39','10139779'),
 (1374,'tChofer','U','P','2010-11-05 16:20:27','7241360'),
 (1375,'tChofer','U','P','2010-11-05 16:21:08','9562700'),
 (1376,'tsucursal','U','P','2010-11-05 17:40:41','1'),
 (1377,'tsucursal','U','P','2010-11-05 17:40:53','1'),
 (1378,'tsucursal','U','P','2010-11-05 17:41:09','2'),
 (1379,'tsucursal','U','P','2010-11-05 17:41:21','3'),
 (1380,'tsucursal','U','P','2010-11-05 17:41:31','4'),
 (1381,'tsucursal','U','P','2010-11-05 17:41:42','5'),
 (1382,'tsucursal','U','P','2010-11-05 17:41:49','6'),
 (1383,'tviaje','U','P','2010-11-08 20:12:22','100000001'),
 (1384,'tviaje','U','P','2010-11-08 20:12:22','100000002'),
 (1385,'tviaje','U','P','2010-11-08 20:12:22','100000003'),
 (1386,'tviaje','U','P','2010-11-08 20:12:22','100000004'),
 (1387,'tviaje','U','P','2010-11-08 20:12:22','100000005'),
 (1388,'tviaje','U','P','2010-11-08 20:12:22','100000006'),
 (1389,'tviaje','U','P','2010-11-08 20:12:22','100000007'),
 (1390,'tviaje','U','P','2010-11-08 20:12:22','100000008'),
 (1391,'tviaje','U','P','2010-11-08 20:12:22','100000009'),
 (1392,'tviaje','U','P','2010-11-08 20:12:22','100000010'),
 (1393,'tviaje','U','','2010-11-08 20:12:22','100000011'),
 (1394,'tviaje','U','P','2010-11-08 20:12:22','100000012'),
 (1395,'tviaje','U','P','2010-11-08 20:12:22','100000013'),
 (1396,'tviaje','U','P','2010-11-08 20:12:22','100000014'),
 (1397,'tviaje','U','P','2010-11-08 20:12:22','100000015'),
 (1398,'tviaje','U','P','2010-11-08 20:12:22','100000016'),
 (1399,'tviaje','U','P','2010-11-08 20:12:22','100000017'),
 (1400,'tviaje','U','','2010-11-08 20:12:22','100000018'),
 (1401,'tviaje','U','P','2010-11-08 20:12:22','100000019'),
 (1402,'tviaje','U','','2010-11-08 20:12:22','100000020'),
 (1403,'tviaje','U','P','2010-11-08 20:12:22','100000021'),
 (1404,'tviaje','U','P','2010-11-08 20:12:22','100000022'),
 (1405,'tviaje','U','P','2010-11-08 20:12:22','100000023'),
 (1406,'tviaje','U','P','2010-11-08 20:12:22','100000024'),
 (1407,'tviaje','U','','2010-11-08 20:12:22','100000025'),
 (1408,'tviaje','U','P','2010-11-08 20:12:22','100000026'),
 (1409,'tviaje','U','P','2010-11-08 20:12:22','100000027'),
 (1410,'tperiodo','U','P','2010-11-10 19:06:37','08101110'),
 (1411,'tvehiculo','I','P','2010-11-11 11:08:37','A15AU7D'),
 (1412,'tChofer','I','P','2010-11-11 11:08:46','5426026'),
 (1413,'tChofer','U','P','2010-11-11 11:27:06','5426026'),
 (1414,'tvehiculo','U','P','2010-11-11 11:30:53','A15AU7D'),
 (1415,'tCiudad','I','P','2010-11-11 14:42:53','1303'),
 (1416,'torigen_destino','I','P','2010-11-11 17:18:33','88'),
 (1417,'torigen_destino','U','P','2010-11-11 17:18:41','88'),
 (1418,'truta','I','P','2010-11-11 17:28:06','188'),
 (1419,'tAnticipo','I','P','2010-11-12 10:40:30','100000025'),
 (1420,'tviaje','I','P','2010-11-12 10:40:30','100000028'),
 (1421,'tAnticipo','I','P','2010-11-12 10:52:05','100000026'),
 (1422,'tviaje','I','P','2010-11-12 10:52:05','100000029'),
 (1423,'tviaje','I','P','2010-11-12 10:52:05','100000030'),
 (1424,'tAnticipo','I','P','2010-11-12 11:24:58','100000027'),
 (1425,'tviaje','I','P','2010-11-12 11:24:58','100000031'),
 (1426,'tviaje','I','','2010-11-12 11:27:18','100000032'),
 (1427,'tAnticipo','I','P','2010-11-12 11:28:42','100000028'),
 (1428,'tviaje','I','P','2010-11-12 11:28:42','100000033'),
 (1429,'tAnticipo','I','P','2010-11-12 11:40:08','100000029'),
 (1430,'tviaje','I','P','2010-11-12 11:40:08','100000034'),
 (1431,'tAnticipo','I','P','2010-11-12 11:54:14','100000030'),
 (1432,'tviaje','I','P','2010-11-12 11:54:14','100000035'),
 (1433,'tAnticipo','I','P','2010-11-12 11:56:35','100000031'),
 (1434,'tviaje','I','P','2010-11-12 11:56:35','100000036'),
 (1435,'tvehiculo','I','P','2010-11-12 11:58:01','62XPAC'),
 (1436,'tvehiculo','U','P','2010-11-12 11:58:57','62XPAC'),
 (1437,'tCiudad','I','P','2010-11-12 12:02:57','0702'),
 (1438,'torigen_destino','I','P','2010-11-12 12:03:36','89'),
 (1439,'truta','I','P','2010-11-12 12:05:28','189'),
 (1440,'tAnticipo','I','P','2010-11-12 12:06:36','100000032'),
 (1441,'tviaje','I','P','2010-11-12 12:06:36','100000037'),
 (1442,'tAnticipo','I','P','2010-11-12 12:07:37','100000033'),
 (1443,'tviaje','I','P','2010-11-12 12:07:37','100000038'),
 (1444,'tAnticipo','I','P','2010-11-12 12:08:54','100000034'),
 (1445,'tviaje','I','P','2010-11-12 12:08:55','100000039'),
 (1446,'tAnticipo','I','P','2010-11-12 12:12:26','100000035'),
 (1447,'tviaje','I','P','2010-11-12 12:12:26','100000040'),
 (1448,'tAnticipo','I','P','2010-11-12 12:14:22','100000036'),
 (1449,'tviaje','I','P','2010-11-12 12:14:22','100000041'),
 (1450,'tRelacion','I','P','2010-11-12 14:33:08','100000025'),
 (1451,'tAnticipo','U','P','2010-11-12 14:33:08','100000025'),
 (1452,'tRelacion','I','P','2010-11-12 14:35:49','100000026'),
 (1453,'tAnticipo','U','P','2010-11-12 14:35:49','100000026'),
 (1454,'tRelacion','I','P','2010-11-12 14:48:18','100000027'),
 (1455,'tAnticipo','U','P','2010-11-12 14:48:18','100000027'),
 (1456,'tRelacion','I','P','2010-11-12 14:49:43','100000028'),
 (1457,'tAnticipo','U','P','2010-11-12 14:49:43','100000028'),
 (1458,'tRelacion','I','P','2010-11-12 14:51:02','100000029'),
 (1459,'tAnticipo','U','P','2010-11-12 14:51:02','100000029'),
 (1460,'tRelacion','I','P','2010-11-12 14:53:04','100000030'),
 (1461,'tAnticipo','U','P','2010-11-12 14:53:04','100000030'),
 (1462,'tRelacion','I','P','2010-11-12 14:55:03','100000031'),
 (1463,'tAnticipo','U','P','2010-11-12 14:55:03','100000031'),
 (1464,'tRelacion','I','P','2010-11-12 14:58:25','100000032'),
 (1465,'tAnticipo','U','P','2010-11-12 14:58:25','100000032'),
 (1466,'tRelacion','I','P','2010-11-12 15:00:05','100000033'),
 (1467,'tAnticipo','U','P','2010-11-12 15:00:05','100000033'),
 (1468,'tRelacion','I','P','2010-11-12 15:01:05','100000034'),
 (1469,'tAnticipo','U','P','2010-11-12 15:01:05','100000034'),
 (1470,'tRelacion','I','P','2010-11-12 15:01:56','100000035'),
 (1471,'tAnticipo','U','P','2010-11-12 15:01:56','100000035'),
 (1472,'tRelacion','I','P','2010-11-12 15:02:36','100000036'),
 (1473,'tAnticipo','U','P','2010-11-12 15:02:36','100000036'),
 (1474,'tperiodo','U','P','2010-11-12 15:30:12','08101110'),
 (1475,'trelacion','U','P','2010-11-12 15:30:58','100000025'),
 (1476,'trelacion','U','P','2010-11-12 15:30:58','100000026'),
 (1477,'trelacion','U','P','2010-11-12 15:30:58','100000027'),
 (1478,'trelacion','U','P','2010-11-12 15:30:58','100000028'),
 (1479,'trelacion','U','P','2010-11-12 15:30:58','100000029'),
 (1480,'trelacion','U','P','2010-11-12 15:30:58','100000030'),
 (1481,'trelacion','U','P','2010-11-12 15:30:58','100000031'),
 (1482,'trelacion','U','P','2010-11-12 15:30:58','100000032'),
 (1483,'trelacion','U','P','2010-11-12 15:30:58','100000033'),
 (1484,'trelacion','U','P','2010-11-12 15:30:58','100000034'),
 (1485,'trelacion','U','P','2010-11-12 15:30:58','100000035'),
 (1486,'trelacion','U','P','2010-11-12 15:30:58','100000036'),
 (1487,'tperiodo','U','P','2010-11-12 16:30:03','08101110'),
 (1488,'tvehiculo','I','P','2010-11-12 16:30:26','A22AE9U'),
 (1489,'tChofer','I','P','2010-11-12 16:30:30','16346069'),
 (1490,'tvehiculo','I','P','2010-11-12 16:31:02','A46AG7E'),
 (1491,'tChofer','I','P','2010-11-12 16:31:03','16966899'),
 (1492,'tvehiculo','I','P','2010-11-12 16:31:18','01UDAY'),
 (1493,'tChofer','I','P','2010-11-12 16:31:19','8715289'),
 (1494,'tvehiculo','I','P','2010-11-12 16:37:56','A23AE2U'),
 (1495,'tChofer','I','P','2010-11-12 16:38:00','8103812'),
 (1496,'tvehiculo','I','P','2010-11-12 16:38:10','68IDIBB'),
 (1497,'tChofer','I','P','2010-11-12 16:41:47','15444793'),
 (1498,'tvehiculo','I','P','2010-11-12 16:41:58','69UDAY'),
 (1499,'tChofer','I','P','2010-11-12 16:42:36','11615836'),
 (1500,'tvehiculo','I','P','2010-11-12 16:47:58','A23AE1U'),
 (1501,'tChofer','I','P','2010-11-12 16:48:00','12446697'),
 (1502,'tvehiculo','I','P','2010-11-12 16:48:05','A13AG7E'),
 (1503,'tChofer','I','P','2010-11-12 16:48:06','10637589'),
 (1504,'tvehiculo','I','P','2010-11-12 16:48:20','A22AE2U'),
 (1505,'tChofer','I','P','2010-11-12 16:48:22','11081499'),
 (1506,'tvehiculo','I','P','2010-11-12 16:48:35','A22AE4U'),
 (1507,'tChofer','I','P','2010-11-12 16:48:36','15340627'),
 (1508,'tvehiculo','I','P','2010-11-12 16:48:46','A72AE3E'),
 (1509,'tChofer','I','P','2010-11-12 16:48:47','16751579'),
 (1510,'tvehiculo','I','P','2010-11-12 16:49:14','A02AF5T'),
 (1511,'tChofer','I','P','2010-11-12 16:49:15','9347051'),
 (1512,'tChofer','U','P','2010-11-12 16:50:15','10637589'),
 (1513,'tChofer','U','P','2010-11-12 16:51:14','11081499'),
 (1514,'tChofer','D','P','2010-11-12 16:52:02','11615836'),
 (1515,'tChofer','D','P','2010-11-12 16:52:26','12262801'),
 (1516,'tChofer','U','P','2010-11-12 16:53:10','9347051'),
 (1517,'tChofer','D','P','2010-11-12 16:53:34','8715289'),
 (1518,'tChofer','U','P','2010-11-12 16:54:28','12446697'),
 (1519,'tChofer','U','P','2010-11-12 16:55:21','15340627'),
 (1520,'tChofer','U','P','2010-11-12 17:12:51','16346069'),
 (1521,'tChofer','U','P','2010-11-12 17:13:51','16751579'),
 (1522,'tChofer','U','P','2010-11-12 17:15:20','16966899'),
 (1523,'tChofer','U','P','2010-11-12 17:16:39','8103812'),
 (1524,'tChofer','I','P','2010-11-12 17:20:51','11542453'),
 (1525,'tChofer','D','P','2010-11-12 17:21:28','15444793'),
 (1526,'tusuario','U','P','2010-11-15 15:46:09','P'),
 (1527,'tusuario','U','P','2010-11-15 15:46:29','P'),
 (1528,'tperiodo','U','P','2010-11-23 09:58:58','08101110'),
 (1529,'tperiodo','U','P','2010-11-23 10:05:17','08101110'),
 (1530,'tperiodo','U','P','2010-11-23 10:09:47','08101110'),
 (1531,'tAnticipo','D','P','2010-11-23 10:19:54','100000001'),
 (1532,'tAnticipo','D','P','2010-11-23 10:19:54','100000002'),
 (1533,'tAnticipo','D','P','2010-11-23 10:19:54','100000003'),
 (1534,'tAnticipo','D','P','2010-11-23 10:19:54','100000004'),
 (1535,'tAnticipo','D','P','2010-11-23 10:19:54','100000005'),
 (1536,'tAnticipo','D','P','2010-11-23 10:19:54','100000006'),
 (1537,'tAnticipo','D','P','2010-11-23 10:19:54','100000007'),
 (1538,'tAnticipo','D','P','2010-11-23 10:19:54','100000008'),
 (1539,'tAnticipo','D','P','2010-11-23 10:19:54','100000009'),
 (1540,'tAnticipo','D','P','2010-11-23 10:19:54','100000010'),
 (1541,'tAnticipo','D','P','2010-11-23 10:19:54','100000011'),
 (1542,'tAnticipo','D','P','2010-11-23 10:19:54','100000012'),
 (1543,'tAnticipo','D','P','2010-11-23 10:19:54','100000013'),
 (1544,'tAnticipo','D','P','2010-11-23 10:19:54','100000014'),
 (1545,'tAnticipo','D','P','2010-11-23 10:19:54','100000015'),
 (1546,'tAnticipo','D','P','2010-11-23 10:19:54','100000016'),
 (1547,'tAnticipo','D','P','2010-11-23 10:19:54','100000017'),
 (1548,'tAnticipo','D','P','2010-11-23 10:19:54','100000018'),
 (1549,'tAnticipo','D','P','2010-11-23 10:19:54','100000019'),
 (1550,'tAnticipo','D','P','2010-11-23 10:19:54','100000020'),
 (1551,'tAnticipo','D','P','2010-11-23 10:19:54','100000021'),
 (1552,'tAnticipo','D','P','2010-11-23 10:19:54','100000022'),
 (1553,'tAnticipo','D','P','2010-11-23 10:19:54','100000023'),
 (1554,'tAnticipo','D','P','2010-11-23 10:19:54','100000024'),
 (1555,'tAnticipo','D','P','2010-11-23 10:19:54','100000025'),
 (1556,'tAnticipo','D','P','2010-11-23 10:19:54','100000026'),
 (1557,'tAnticipo','D','P','2010-11-23 10:19:54','100000027'),
 (1558,'tAnticipo','D','P','2010-11-23 10:19:54','100000028'),
 (1559,'tAnticipo','D','P','2010-11-23 10:19:54','100000029'),
 (1560,'tAnticipo','D','P','2010-11-23 10:19:54','100000030'),
 (1561,'tAnticipo','D','P','2010-11-23 10:19:54','100000031'),
 (1562,'tAnticipo','D','P','2010-11-23 10:19:54','100000032'),
 (1563,'tAnticipo','D','P','2010-11-23 10:19:54','100000033'),
 (1564,'tAnticipo','D','P','2010-11-23 10:19:54','100000034'),
 (1565,'tAnticipo','D','P','2010-11-23 10:19:54','100000035'),
 (1566,'tAnticipo','D','P','2010-11-23 10:19:54','100000036'),
 (1567,'trelacion','D','P','2010-11-23 10:19:56','100000001'),
 (1568,'trelacion','D','P','2010-11-23 10:19:56','100000002'),
 (1569,'trelacion','D','P','2010-11-23 10:19:56','100000003'),
 (1570,'trelacion','D','P','2010-11-23 10:19:56','100000004'),
 (1571,'trelacion','D','P','2010-11-23 10:19:56','100000005'),
 (1572,'trelacion','D','P','2010-11-23 10:19:56','100000006'),
 (1573,'trelacion','D','P','2010-11-23 10:19:56','100000007'),
 (1574,'trelacion','D','P','2010-11-23 10:19:56','100000009'),
 (1575,'trelacion','D','P','2010-11-23 10:19:56','100000010'),
 (1576,'trelacion','D','P','2010-11-23 10:19:56','100000011'),
 (1577,'trelacion','D','P','2010-11-23 10:19:56','100000012'),
 (1578,'trelacion','D','P','2010-11-23 10:19:56','100000013'),
 (1579,'trelacion','D','P','2010-11-23 10:19:56','100000014'),
 (1580,'trelacion','D','P','2010-11-23 10:19:56','100000016'),
 (1581,'trelacion','D','P','2010-11-23 10:19:56','100000018'),
 (1582,'trelacion','D','P','2010-11-23 10:19:56','100000019'),
 (1583,'trelacion','D','P','2010-11-23 10:19:56','100000020'),
 (1584,'trelacion','D','P','2010-11-23 10:19:56','100000021'),
 (1585,'trelacion','D','P','2010-11-23 10:19:56','100000022'),
 (1586,'trelacion','D','P','2010-11-23 10:19:56','100000023'),
 (1587,'trelacion','D','P','2010-11-23 10:19:56','100000024'),
 (1588,'trelacion','D','P','2010-11-23 10:19:56','100000025'),
 (1589,'trelacion','D','P','2010-11-23 10:19:56','100000026'),
 (1590,'trelacion','D','P','2010-11-23 10:19:56','100000027'),
 (1591,'trelacion','D','P','2010-11-23 10:19:56','100000028'),
 (1592,'trelacion','D','P','2010-11-23 10:19:56','100000029'),
 (1593,'trelacion','D','P','2010-11-23 10:19:56','100000030'),
 (1594,'trelacion','D','P','2010-11-23 10:19:56','100000031'),
 (1595,'trelacion','D','P','2010-11-23 10:19:56','100000032'),
 (1596,'trelacion','D','P','2010-11-23 10:19:56','100000033'),
 (1597,'trelacion','D','P','2010-11-23 10:19:56','100000034'),
 (1598,'trelacion','D','P','2010-11-23 10:19:56','100000035'),
 (1599,'trelacion','D','P','2010-11-23 10:19:56','100000036'),
 (1600,'tviaje','D','P','2010-11-23 10:19:59','100000001'),
 (1601,'tviaje','D','P','2010-11-23 10:19:59','100000002'),
 (1602,'tviaje','D','P','2010-11-23 10:19:59','100000003'),
 (1603,'tviaje','D','P','2010-11-23 10:19:59','100000004'),
 (1604,'tviaje','D','P','2010-11-23 10:19:59','100000005'),
 (1605,'tviaje','D','P','2010-11-23 10:19:59','100000006'),
 (1606,'tviaje','D','P','2010-11-23 10:19:59','100000007'),
 (1607,'tviaje','D','P','2010-11-23 10:19:59','100000008'),
 (1608,'tviaje','D','P','2010-11-23 10:19:59','100000009'),
 (1609,'tviaje','D','P','2010-11-23 10:19:59','100000010'),
 (1610,'tviaje','D','','2010-11-23 10:19:59','100000011'),
 (1611,'tviaje','D','P','2010-11-23 10:19:59','100000012'),
 (1612,'tviaje','D','P','2010-11-23 10:19:59','100000013'),
 (1613,'tviaje','D','P','2010-11-23 10:19:59','100000014'),
 (1614,'tviaje','D','P','2010-11-23 10:19:59','100000015'),
 (1615,'tviaje','D','P','2010-11-23 10:19:59','100000016'),
 (1616,'tviaje','D','P','2010-11-23 10:19:59','100000017'),
 (1617,'tviaje','D','','2010-11-23 10:19:59','100000018'),
 (1618,'tviaje','D','P','2010-11-23 10:19:59','100000019'),
 (1619,'tviaje','D','','2010-11-23 10:19:59','100000020'),
 (1620,'tviaje','D','P','2010-11-23 10:19:59','100000021'),
 (1621,'tviaje','D','P','2010-11-23 10:19:59','100000022'),
 (1622,'tviaje','D','P','2010-11-23 10:19:59','100000023'),
 (1623,'tviaje','D','P','2010-11-23 10:19:59','100000024'),
 (1624,'tviaje','D','','2010-11-23 10:19:59','100000025'),
 (1625,'tviaje','D','P','2010-11-23 10:19:59','100000026'),
 (1626,'tviaje','D','P','2010-11-23 10:19:59','100000027'),
 (1627,'tviaje','D','P','2010-11-23 10:19:59','100000028'),
 (1628,'tviaje','D','P','2010-11-23 10:19:59','100000029'),
 (1629,'tviaje','D','P','2010-11-23 10:19:59','100000030'),
 (1630,'tviaje','D','P','2010-11-23 10:19:59','100000031'),
 (1631,'tviaje','D','','2010-11-23 10:19:59','100000032'),
 (1632,'tviaje','D','P','2010-11-23 10:19:59','100000033'),
 (1633,'tviaje','D','P','2010-11-23 10:19:59','100000034'),
 (1634,'tviaje','D','P','2010-11-23 10:19:59','100000035'),
 (1635,'tviaje','D','P','2010-11-23 10:19:59','100000036'),
 (1636,'tviaje','D','P','2010-11-23 10:19:59','100000037'),
 (1637,'tviaje','D','P','2010-11-23 10:19:59','100000038'),
 (1638,'tviaje','D','P','2010-11-23 10:19:59','100000039'),
 (1639,'tviaje','D','P','2010-11-23 10:19:59','100000040'),
 (1640,'tviaje','D','P','2010-11-23 10:19:59','100000041'),
 (1641,'tgasto_serv','D','P','2010-11-23 10:20:07','100000001'),
 (1642,'tperiodo','D','P','2010-11-23 10:20:21','08101110'),
 (1643,'tPeriodo','I','ADMIN','2010-11-23 10:23:45','201012'),
 (1644,'tAnticipo','I','P','2010-11-23 10:56:14','200000001'),
 (1645,'tviaje','I','P','2010-11-23 10:56:14','200000001'),
 (1646,'tAnticipo','D','P','2010-11-23 10:57:01','200000001'),
 (1647,'tviaje','D','P','2010-11-23 10:57:05','200000001'),
 (1648,'tChofer','D','P','2010-11-23 10:57:50','9562700'),
 (1649,'tAnticipo','I','P','2010-11-23 11:25:03','200000001'),
 (1650,'tviaje','I','P','2010-11-23 11:25:03','200000001'),
 (1651,'tAnticipo','D','P','2010-11-23 11:26:26','200000001'),
 (1652,'tviaje','D','P','2010-11-23 11:26:32','200000001'),
 (1653,'tAnticipo','I','P','2010-11-23 11:35:05','200000002'),
 (1654,'tviaje','I','P','2010-11-23 11:35:05','200000002'),
 (1655,'tAnticipo','D','P','2010-11-23 11:35:28','200000002'),
 (1656,'tviaje','D','P','2010-11-23 11:35:32','200000002'),
 (1657,'tAnticipo','I','P','2010-11-23 11:47:01','200000003'),
 (1658,'tviaje','I','P','2010-11-23 11:47:01','200000003'),
 (1659,'tAnticipo','D','P','2010-11-23 11:48:16','200000003'),
 (1660,'tviaje','D','P','2010-11-23 11:48:20','200000003'),
 (1661,'tAnticipo','I','P','2010-11-23 14:51:22','200000004'),
 (1662,'tviaje','I','P','2010-11-23 14:51:22','200000004'),
 (1663,'tAnticipo','D','P','2010-11-23 14:51:54','200000004'),
 (1664,'tviaje','D','P','2010-11-23 14:51:57','200000004'),
 (1665,'tAnticipo','I','P','2010-11-23 14:53:20','200000001'),
 (1666,'tviaje','I','P','2010-11-23 14:53:20','200000001'),
 (1667,'tAnticipo','I','P','2010-11-23 15:03:21','100000001'),
 (1668,'tviaje','I','P','2010-11-23 15:03:21','100000001'),
 (1669,'tAnticipo','I','P','2010-11-23 15:04:06','100000002'),
 (1670,'tAnticipo','I','P','2010-11-23 15:05:34','100000003'),
 (1671,'tviaje','I','P','2010-11-23 15:05:34','100000002'),
 (1672,'tviaje','I','','2010-11-23 16:29:07','100000003'),
 (1673,'tviaje','U','P','2010-11-23 18:04:45','100000003'),
 (1674,'tAnticipo','I','P','2010-11-23 18:10:25','200000002'),
 (1675,'tviaje','I','P','2010-11-23 18:10:25','200000002'),
 (1676,'tAnticipo','U','P','2010-11-23 18:16:08','200000002'),
 (1677,'tAnticipo','I','P','2010-11-24 09:06:22','200000003'),
 (1678,'tviaje','I','P','2010-11-24 09:06:22','200000003'),
 (1679,'tAnticipo','U','P','2010-11-24 09:10:51','200000003'),
 (1680,'tAnticipo','I','P','2010-11-24 09:16:10','100000004'),
 (1681,'tviaje','I','P','2010-11-24 09:16:10','100000004'),
 (1682,'tviaje','I','P','2010-11-24 09:33:23','100000005'),
 (1683,'tvehiculo','I','P','2010-11-24 09:36:13','85CDAV'),
 (1684,'tAnticipo','I','P','2010-11-24 09:37:44','100000005'),
 (1685,'tviaje','I','P','2010-11-24 09:37:44','100000006'),
 (1686,'tAnticipo','I','P','2010-11-24 09:40:04','100000006'),
 (1687,'tviaje','I','P','2010-11-24 09:40:04','100000007'),
 (1688,'tAnticipo','I','P','2010-11-24 09:41:29','100000007'),
 (1689,'tviaje','I','P','2010-11-24 09:41:29','100000008'),
 (1690,'tAnticipo','I','P','2010-11-24 09:46:08','100000008'),
 (1691,'tviaje','I','P','2010-11-24 09:46:08','100000009'),
 (1692,'tviaje','I','P','2010-11-24 09:48:06','100000010'),
 (1693,'tAnticipo','I','P','2010-11-24 09:49:57','100000009'),
 (1694,'tviaje','I','P','2010-11-24 09:49:57','100000011'),
 (1695,'tAnticipo','I','P','2010-11-24 09:51:21','100000010'),
 (1696,'tviaje','I','P','2010-11-24 09:51:21','100000012'),
 (1697,'tAnticipo','I','P','2010-11-24 09:53:36','100000011'),
 (1698,'tviaje','I','P','2010-11-24 09:53:36','100000013'),
 (1699,'tAnticipo','I','P','2010-11-24 09:55:01','100000012'),
 (1700,'tviaje','I','P','2010-11-24 09:55:01','100000014'),
 (1701,'tAnticipo','I','P','2010-11-24 11:26:32','200000004'),
 (1702,'tRelacion','I','P','2010-11-24 11:36:44','200000001'),
 (1703,'tAnticipo','U','P','2010-11-24 11:36:44','200000001'),
 (1704,'tAnticipo','U','P','2010-11-24 11:36:44','200000004'),
 (1705,'tRelacion','I','P','2010-11-24 11:40:19','100000001'),
 (1706,'tAnticipo','U','P','2010-11-24 11:40:19','100000001'),
 (1707,'tAnticipo','U','P','2010-11-24 11:40:19','100000002'),
 (1708,'tRelacion','I','P','2010-11-24 11:43:32','100000002'),
 (1709,'tAnticipo','U','P','2010-11-24 11:43:32','100000003'),
 (1710,'tRelacion','I','P','2010-11-24 11:51:20','100000003'),
 (1711,'tAnticipo','U','P','2010-11-24 11:51:20','100000004'),
 (1712,'tRelacion','I','P','2010-11-24 11:58:45','100000004'),
 (1713,'tAnticipo','U','P','2010-11-24 11:58:45','100000005'),
 (1714,'tRelacion','I','P','2010-11-25 10:16:02','100000005'),
 (1715,'tAnticipo','U','P','2010-11-25 10:16:02','100000006'),
 (1716,'tRelacion','I','P','2010-11-25 10:22:05','100000006'),
 (1717,'tAnticipo','U','P','2010-11-25 10:22:05','100000007'),
 (1718,'tRelacion','I','P','2010-11-25 10:25:23','100000007'),
 (1719,'tAnticipo','U','P','2010-11-25 10:25:23','100000008'),
 (1720,'tRelacion','I','P','2010-11-25 10:27:05','100000008'),
 (1721,'tAnticipo','U','P','2010-11-25 10:27:05','100000009'),
 (1722,'tRelacion','I','P','2010-11-25 10:29:03','100000009'),
 (1723,'tAnticipo','U','P','2010-11-25 10:29:03','100000010'),
 (1724,'tRelacion','I','P','2010-11-25 10:29:54','100000010'),
 (1725,'tAnticipo','U','P','2010-11-25 10:29:54','100000011'),
 (1726,'tRelacion','I','P','2010-11-25 10:31:33','100000011'),
 (1727,'tAnticipo','U','P','2010-11-25 10:31:33','100000012'),
 (1728,'tAnticipo','I','P','2010-11-25 10:32:48','100000013'),
 (1729,'tviaje','I','P','2010-11-25 10:32:48','100000015'),
 (1730,'tperiodo','U','ADMIN','2010-11-25 10:33:39','201012'),
 (1731,'trelacion','U','P','2010-11-25 10:33:54','100000001'),
 (1732,'trelacion','U','P','2010-11-25 10:33:54','100000002'),
 (1733,'trelacion','U','P','2010-11-25 10:33:54','100000003'),
 (1734,'trelacion','U','P','2010-11-25 10:33:54','100000004'),
 (1735,'trelacion','U','P','2010-11-25 10:33:54','100000005'),
 (1736,'trelacion','U','P','2010-11-25 10:33:54','100000006'),
 (1737,'trelacion','U','P','2010-11-25 10:33:54','100000007'),
 (1738,'trelacion','U','P','2010-11-25 10:33:54','100000008'),
 (1739,'trelacion','U','P','2010-11-25 10:33:54','100000009'),
 (1740,'trelacion','U','P','2010-11-25 10:33:54','100000010'),
 (1741,'trelacion','U','P','2010-11-25 10:33:54','100000011'),
 (1742,'trelacion','U','P','2010-11-25 10:33:54','200000001'),
 (1743,'tperiodo','U','ADMIN','2010-11-26 15:36:33','201012'),
 (1744,'tvehiculo','I','P','2010-11-26 15:37:24','59XPAC'),
 (1745,'tChofer','I','P','2010-11-26 16:24:19','13485917'),
 (1746,'tChofer','I','P','2010-11-26 16:56:36','12262801'),
 (1747,'tChofer','I','P','2010-11-26 16:57:09','13485917'),
 (1748,'tvehiculo','I','P','2010-11-26 16:57:21','A67AE8E'),
 (1749,'tvehiculo','U','P','2010-11-26 17:06:49','A23AE2U'),
 (1750,'tservicio','I','P','2010-11-26 17:12:19','5'),
 (1751,'tAnticipo','I','P','2010-11-26 17:18:52','200000005'),
 (1752,'tviaje','I','P','2010-11-26 17:18:54','200000004'),
 (1753,'tAnticipo','I','P','2010-11-26 17:26:39','200000006'),
 (1754,'tviaje','I','P','2010-11-26 17:26:47','200000005'),
 (1755,'ttipo_gasto','U','P','2010-11-30 17:44:15','01'),
 (1756,'ttipo_gasto','U','P','2010-11-30 17:44:26','01'),
 (1757,'ttipo_gasto','U','P','2010-11-30 17:50:47','01'),
 (1758,'ttipo_gasto','U','P','2010-11-30 17:50:53','01'),
 (1759,'tAnticipo','I','P','2010-12-03 09:23:52','100000014'),
 (1760,'tviaje','I','P','2010-12-03 09:26:22','100000016');
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
 ('10139779','CABAÑA VICTOR','456','456',1,'P','2010-11-05 15:45:39',0,1),
 ('10637589','LUCENA YEPEZ, JOSE','222','06689',2,'P','2010-11-12 16:50:15',0,1),
 ('11081499','ROJAS MORILLO, CARLOS','222','06628',2,'P','2010-11-12 16:51:14',0,1),
 ('11081888','ROJAS , MATIAS PASTO','456','456',1,'P','2010-10-18 14:59:13',0,1),
 ('11542453','RODRIGUEZ, JOHNNY','222','06686',2,'P','2010-11-12 17:20:51',0,1),
 ('12262801','VIRGÜEZ JORGELIS',' ',' ',2,'P','2010-11-26 16:56:36',1,0),
 ('12446697','SUAREZ RUSA RAMON  A','222','06646',2,'P','2010-11-12 16:54:28',0,1),
 ('12923620','MONTIEL B. EDWAR G.',' ',' ',1,'P','2010-11-24 09:36:24',1,0),
 ('13485917','ALVARADO WALDEMAR',' ',' ',1,'P','2010-11-26 16:24:19',1,0),
 ('13485917','ALVARADO WALDEMAR',' ',' ',2,'P','2010-11-26 16:57:09',1,0),
 ('13486315','LUIS RAMON MORENO MA','123','123',1,'P','2010-10-18 15:14:59',0,1),
 ('14000037','PINEDA PEREZ ALCIDES','456','456',1,'P','2010-10-18 16:01:48',0,1),
 ('15107255','VILLARROEL V. ROMER','456','456',1,'P','2010-10-18 16:01:28',0,1),
 ('15340627','MANROY COLOMBO JOSE','222','06709',2,'P','2010-11-12 16:55:21',0,1),
 ('16346069','MENDEZ M. ANDRES','22','06683',2,'P','2010-11-12 17:12:51',0,1),
 ('16751579','ARNAO ARNOLDO','222','06760',2,'P','2010-11-12 17:13:51',0,1),
 ('16966899','LAMEDA JOHAN JOSE','222','06801',2,'P','2010-11-12 17:15:20',0,1),
 ('19170321','HERNANDEZ DOUGLAS',' ',' ',1,'P','2010-10-30 17:08:12',1,0),
 ('4605734','DOMINGO ARROYO','456','456',1,'P','2010-10-20 16:39:13',0,1),
 ('5426026','SILVA G. JOSE DANIEL','222','04790',1,'P','2010-11-11 11:27:06',0,1),
 ('7241360','SANDOVAL, STALIN JOS','123','6418',1,'P','2010-11-05 16:20:27',0,1),
 ('7547865','PASTRAN A. FELIPE J','456','456',1,'P','2010-10-18 16:02:07',0,1),
 ('8103812','VARELA PINEDA, ABEL','22','06452',2,'P','2010-11-12 17:16:39',0,1),
 ('8603178','MENDEZ R. EDDYS E .','456','456',1,'P','2010-10-20 16:39:02',0,1),
 ('8657021','TORRES MELENDEZ,NEST','123','123',1,'P','2010-10-18 14:57:59',0,1),
 ('9347051','GUERRA  JOSE','222','04206',2,'P','2010-11-12 16:53:10',0,1),
 ('9562700','SANCHEZ M. GUADALUPE','222','5056',1,'P','2010-11-05 16:21:08',0,1),
 ('9562700','SANCHEZ M. GUADALUPE (C.OCC)','999','999',2,'P','2010-10-30 12:12:01',0,0),
 ('9566638','ROMERO CAMPINS,PEDRO','333','333',1,'P','2010-10-13 09:07:37',0,1),
 ('9568641','REA ESQUEA JOSE G.','444','444',1,'P','2010-10-13 09:07:48',0,1),
 ('9841618','MARTINEZ , LUIS','456','456',1,'P','2010-10-18 14:58:52',0,1);
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
 ('0302','BRUZUAL','03','P','2010-11-04 14:30:25'),
 ('0303','EL AMPARO','03','P','2010-11-04 14:31:27'),
 ('0304','GUASDUALITO','03','P','2010-11-04 14:32:23'),
 ('0305','EL CANTON, GUACAS','03','P','2010-11-04 18:12:22'),
 ('0401','MARACAY','04','ADMIN','2010-10-08 15:52:57'),
 ('0402','LA VICTORIA','04','P','2010-10-08 18:03:51'),
 ('0403','TURMERO','04','P','2010-10-08 18:04:12'),
 ('0404','CAGUA','04','P','2010-10-08 18:04:28'),
 ('0501','BARINAS','05','ADMIN','2010-10-08 15:52:57'),
 ('0502','SABANETA','05','P','2010-10-29 19:24:12'),
 ('0503','BARRANCAS','05','P','2010-10-29 19:25:01'),
 ('0504','MIJAGUAL','05','P','2010-10-29 19:26:04'),
 ('0505','SANTA ROSA','05','P','2010-10-29 19:26:54'),
 ('0506','SOCOPO','05','P','2010-10-29 19:28:22'),
 ('0507','SANTA BARBARA','05','P','2010-10-29 19:29:10'),
 ('0508','LIBERTAD','05','P','2010-10-29 19:30:47'),
 ('0509','CAPITANEJO','05','P','2010-10-29 19:31:44'),
 ('0510','DOLORES','05','P','2010-10-29 19:33:02'),
 ('0511','BARINITAS','05','P','2010-10-29 19:33:30'),
 ('0512','PEDRAZA','05','P','2010-11-03 14:55:20'),
 ('0601','CIUDAD BOLÍVAR','06','ADMIN','2010-10-08 15:52:57'),
 ('0602','SAN FELIX','06','P','2010-10-29 20:51:45'),
 ('0701','VALENCIA','07','ADMIN','2010-10-08 15:52:57'),
 ('0702','GUACARA','07','P','2010-11-12 12:02:57'),
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
 ('1202','CARORA','12','P','2010-11-04 10:45:52'),
 ('1203','DUACA','12','P','2010-11-04 10:46:11'),
 ('1204','EL TOCUYO','12','P','2010-11-04 10:47:11'),
 ('1205','LA MIEL','12','P','2010-11-04 10:47:37'),
 ('1206','QUIBOR','12','P','2010-11-04 10:48:58'),
 ('1207','SARARE','12','P','2010-11-04 10:49:25'),
 ('1301','MÉRIDA','13','ADMIN','2010-10-08 15:52:57'),
 ('1302','NUEVA BOLIVIA','13','P','2010-11-04 10:59:12'),
 ('1303','EL VIGIA','13','P','2010-11-11 14:42:53'),
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
 ('1705','GUANARITO','17','P','2010-10-29 18:11:00'),
 ('1706','LA MIEL','17','P','2010-10-29 18:11:35'),
 ('1707','PIRITU','17','P','2010-10-29 18:11:46'),
 ('1708','OSPINO','17','P','2010-10-29 18:12:14'),
 ('1709','SAN RAFAEL DE ONOTO','17','P','2010-10-29 18:12:27'),
 ('1710','TUREN','17','P','2010-10-29 18:12:43'),
 ('1711','PLAYON','17','P','2010-11-04 09:52:53'),
 ('1712','PAYARA','17','P','2010-11-03 10:42:23'),
 ('1713','BISCUCUY','17','P','2010-11-04 09:47:23'),
 ('1714','CHAVASQUEN','17','P','2010-11-04 09:48:55'),
 ('1801','CUMANÁ','18','ADMIN','2010-10-08 15:52:57'),
 ('1901','SAN CRISTÓBAL','19','ADMIN','2010-10-08 15:52:57'),
 ('1902','ABEJALES','19','P','2010-11-04 10:28:42'),
 ('2001','TRUJILLO','20','ADMIN','2010-10-08 15:52:57'),
 ('2002','BOCONO','20','P','2010-10-08 18:08:25'),
 ('2003','VALERA','20','P','2010-10-08 18:08:53'),
 ('2004','BUENA VISTA','20','P','2010-11-04 08:16:59'),
 ('2005','BETIJOQUE','20','P','2010-11-04 08:17:31'),
 ('2006','CARVAJAL','20','P','2010-11-04 08:18:06'),
 ('2007','MONAY','20','P','2010-11-04 08:19:20'),
 ('2008','PAN PAN','20','P','2010-11-04 08:19:40'),
 ('2009','SABANA MENDOZA','20','P','2010-11-04 08:20:55'),
 ('2101','LA GUAIRA','21','ADMIN','2010-10-08 15:52:57'),
 ('2201','SAN FELIPE','22','ADMIN','2010-10-08 15:52:57'),
 ('2202','CHIVACOA','22','P','2010-10-08 17:51:41'),
 ('2203','NIRGUA','22','P','2010-10-08 17:52:03'),
 ('2204','YARITAGUA','22','P','2010-10-08 17:52:17'),
 ('2205','SABANA DE PARRA','22','P','2010-11-04 14:37:45'),
 ('2206','YUMARE','22','P','2010-11-04 14:39:26'),
 ('2207','AROA','22','P','2010-11-04 14:41:53'),
 ('2301','MARACAIBO','23','ADMIN','2010-10-08 15:52:57'),
 ('2302','CABIMAS','23','P','2010-10-08 18:27:53'),
 ('2303','CIUDAD OJEDA','23','P','2010-10-08 18:28:22'),
 ('2304','SAN FRANCISCO','23','P','2010-10-08 18:28:46'),
 ('2305','BACHAQUERO','23','P','2010-10-08 18:29:09'),
 ('2306','CAJA SECA','23','P','2010-11-04 14:36:03'),
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
-- Definition of table `tcomision_choferes`
--

DROP TABLE IF EXISTS `tcomision_choferes`;
CREATE TABLE `tcomision_choferes` (
  `nid_viaje` int(10) unsigned NOT NULL,
  `cid_periodo` varchar(10) NOT NULL,
  `nporc_com` int(2) unsigned NOT NULL default '0' COMMENT '% de comisión de la ruta.',
  `ntabulador` double NOT NULL default '0' COMMENT 'tabulador de viaje para el tipo de vehículo en la ruta.',
  PRIMARY KEY  (`nid_viaje`,`cid_periodo`),
  UNIQUE KEY `Ix_com_chof` (`nid_viaje`,`cid_periodo`),
  CONSTRAINT `FK_tcomchof_tviaje` FOREIGN KEY (`nid_viaje`) REFERENCES `tviaje` (`nid_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcomision_choferes`
--

/*!40000 ALTER TABLE `tcomision_choferes` DISABLE KEYS */;
INSERT INTO `tcomision_choferes` (`nid_viaje`,`cid_periodo`,`nporc_com`,`ntabulador`) VALUES 
 (100000001,'201012',100,14.54),
 (100000002,'201012',100,20),
 (100000003,'201012',100,16.85),
 (100000004,'201012',100,15.29),
 (100000005,'201012',100,16.85),
 (100000006,'201012',100,10.92),
 (100000007,'201012',100,13.45),
 (100000008,'201012',100,17.72),
 (100000009,'201012',100,20),
 (100000010,'201012',100,16.85),
 (100000011,'201012',100,6.96),
 (100000012,'201012',100,9.2),
 (100000013,'201012',100,13.45),
 (100000014,'201012',100,26.24),
 (200000001,'201012',100,9.27);
/*!40000 ALTER TABLE `tcomision_choferes` ENABLE KEYS */;


--
-- Definition of table `tconfig`
--

DROP TABLE IF EXISTS `tconfig`;
CREATE TABLE `tconfig` (
  `ccompania` varchar(60) NOT NULL default ' ' COMMENT 'Código de la compañia en el sistema de nómina (SPI). Actualmente 01',
  `nbono_base` double NOT NULL default '0' COMMENT 'Bono base para efectuar el cálculo de las comisiones de jefe de almacen y montacarguista.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tconfig`
--

/*!40000 ALTER TABLE `tconfig` DISABLE KEYS */;
INSERT INTO `tconfig` (`ccompania`,`nbono_base`) VALUES 
 ('01',200);
/*!40000 ALTER TABLE `tconfig` ENABLE KEYS */;


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
 (0001,0100000014,0100000016,0100000011,0100000000),
 (0002,0200000006,0200000005,0200000001,0200000000),
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
 (200000001,'06',110),
 (200000001,'01',1200),
 (200000001,'08',220),
 (100000001,'01',100),
 (100000001,'06',230),
 (100000001,'05',72),
 (100000001,'07',100),
 (100000001,'08',200),
 (100000002,'06',450),
 (100000002,'01',100),
 (100000002,'05',56),
 (100000002,'02',15),
 (100000003,'06',400),
 (100000003,'01',800),
 (100000003,'05',84),
 (100000003,'02',10),
 (100000004,'06',150),
 (100000004,'01',700),
 (100000004,'05',51),
 (100000005,'06',150),
 (100000005,'01',700),
 (100000005,'05',43),
 (100000006,'06',200),
 (100000006,'01',100),
 (100000006,'08',100),
 (100000007,'06',450),
 (100000007,'01',100),
 (100000007,'02',15),
 (100000007,'05',56),
 (100000008,'06',110),
 (100000008,'01',100),
 (100000008,'05',28),
 (100000008,'08',100),
 (100000009,'06',110),
 (100000009,'05',28),
 (100000009,'02',10),
 (100000010,'06',150),
 (100000010,'05',36),
 (100000011,'06',250),
 (100000011,'01',1000),
 (100000011,'05',57),
 (100000011,'02',20);
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
  `ccta_cont` varchar(10) NOT NULL default '',
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torigen_destino`
--

/*!40000 ALTER TABLE `torigen_destino` DISABLE KEYS */;
INSERT INTO `torigen_destino` (`nid_origdest`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`nactivo`,`norigen`,`nsucursal`) VALUES 
 (1,'OFICINA PRINCIPAL','1703','P','2010-10-20 12:04:16',1,1,1),
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
 (16,'BARQUISIMETO','1201','P','2010-11-04 10:56:48',1,1,0),
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
 (36,'CALABOZO','1102','P','2010-10-11 08:32:48',1,1,0),
 (37,'SAN FELIX','0602','P','2010-10-29 20:53:39',1,0,0),
 (38,'PUNTO FIJO','1002','P','2010-11-01 15:29:11',1,0,0),
 (39,'PERTIGALETE','0201','P','2010-11-02 10:02:47',1,1,0),
 (40,'ACARIGUA','1702','P','2010-11-02 10:05:05',1,0,0),
 (41,'SABANETA','0502','P','2010-11-03 15:00:26',1,0,0),
 (42,'BARRANCAS','0503','P','2010-11-03 15:00:50',1,0,0),
 (43,'MIJAGUAL','0504','P','2010-11-03 15:01:11',1,0,0),
 (44,'SANTA ROSA','0505','P','2010-11-03 15:01:33',1,0,0),
 (45,'SOCOPO','0506','P','2010-11-03 15:01:57',1,0,0),
 (46,'SANTA BARBARA','0507','P','2010-11-03 15:04:01',1,0,0),
 (47,'LIBERTAD','0508','P','2010-11-03 15:04:20',1,0,0),
 (48,'CAPITANEJO','0509','P','2010-11-03 15:05:37',1,0,0),
 (49,'DOLORES','0510','P','2010-11-03 15:06:40',1,0,0),
 (50,'BARINITAS','0511','P','2010-11-03 15:07:09',1,0,0),
 (51,'PEDRAZA','0512','P','2010-11-03 15:08:18',1,0,0),
 (52,'BUENA VISTA','2004','P','2010-11-04 08:35:13',1,0,0),
 (53,'BETIJOQUE','2005','P','2010-11-04 08:35:42',1,0,0),
 (54,'CARVAJAL','2006','P','2010-11-04 08:36:27',1,0,0),
 (55,'MONAY','2007','P','2010-11-04 08:39:26',1,0,0),
 (56,'PAM PAM','2008','P','2010-11-04 09:16:36',1,0,0),
 (57,'SABANA MENDOZA','2009','P','2010-11-04 09:27:31',1,0,0),
 (58,'BOCONO','2002','P','2010-11-04 09:03:44',1,0,0),
 (59,'AGUA BLANCA','1704','P','2010-11-04 09:44:06',1,0,0),
 (60,'ARAURE','1703','P','2010-11-04 09:45:21',1,0,0),
 (61,'BISCUCUY','1713','P','2010-11-04 09:47:43',1,0,0),
 (62,'CHAVASQUEN','1714','P','2010-11-04 09:49:12',1,0,0),
 (63,'GUANARITO','1705','P','2010-11-04 09:49:52',1,0,0),
 (64,'OSPINO','1708','P','2010-11-04 09:50:31',1,0,0),
 (65,'PAYARA','1712','P','2010-11-04 09:51:06',1,0,0),
 (66,'PIRITU','1707','P','2010-11-04 09:51:43',1,0,0),
 (67,'PLAYON','1711','P','2010-11-04 09:53:14',1,0,0),
 (68,'TUREN','1710','P','2010-11-04 10:29:27',1,1,0),
 (69,'ABEJALES','1902','P','2010-11-04 10:29:15',1,0,0),
 (70,'CARORA','1202','P','2010-11-04 10:51:12',1,0,0),
 (71,'DUACA','1203','P','2010-11-04 10:56:33',1,0,0),
 (72,'EL TOCUYO','1204','P','2010-11-04 10:57:15',1,0,0),
 (73,'LA MIEL','1205','P','2010-11-04 10:57:31',1,0,0),
 (74,'QUIBOR','1206','P','2010-11-04 10:57:46',1,0,0),
 (75,'SARARE','1207','P','2010-11-04 10:58:07',1,0,0),
 (76,'NUEVA BOLIVIA','1302','P','2010-11-04 10:59:31',1,0,0),
 (77,'AROA','2207','P','2010-11-04 14:42:36',1,0,0),
 (78,'BRUZUAL','0302','P','2010-11-04 14:43:09',1,0,0),
 (79,'CAJA SECA','2306','P','2010-11-04 14:43:34',1,0,0),
 (80,'CHIVACOA','2202','P','2010-11-04 14:44:04',1,0,0),
 (81,'EL AMPARO','0303','P','2010-11-04 14:45:27',1,0,0),
 (82,'GUASDUALITO','0304','P','2010-11-04 14:49:12',1,0,0),
 (83,'SABANA DE PARRA','2205','P','2010-11-04 14:49:53',1,0,0),
 (84,'YARITAGUA','2204','P','2010-11-04 14:50:32',1,0,0),
 (85,'YUMARE','2206','P','2010-11-04 14:50:43',1,0,0),
 (86,'SAN RAFAEL DE ONOTO','1709','P','2010-11-04 17:34:33',1,0,0),
 (87,'EL CANTON, GUACAS','0305','P','2010-11-04 18:12:48',1,0,0),
 (88,'EL VIGIA','1303','P','2010-11-11 17:18:41',1,1,0),
 (89,'GUACARA','0702','P','2010-11-12 12:03:36',1,0,0);
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
 ('201012','2010-08-11','2010-12-31','DICIEMBRE 2010','ADMIN','2010-11-26 15:36:33',1);
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
 (100000001,'2010-11-24','P','2010-11-25 10:33:54','Rel 100000001 y 100000002',2),
 (100000002,'2010-11-24','P','2010-11-25 10:33:54','Rel 100000003',2),
 (100000003,'2010-11-24','P','2010-11-25 10:33:54','Rel  100000004',2),
 (100000004,'2010-11-24','P','2010-11-25 10:33:54','Rel 100000005',2),
 (100000005,'2010-11-25','P','2010-11-25 10:33:54','Rel 100000006',2),
 (100000006,'2010-11-25','P','2010-11-25 10:33:54','Rel 100000007',2),
 (100000007,'2010-11-25','P','2010-11-25 10:33:54','Rel 100000008',2),
 (100000008,'2010-11-25','P','2010-11-25 10:33:54','Rel 100000009',2),
 (100000009,'2010-11-25','P','2010-11-25 10:33:54','Rel 100000010',2),
 (100000010,'2010-11-25','P','2010-11-25 10:33:54','Rel 100000011',2),
 (100000011,'2010-11-25','P','2010-11-25 10:33:54','Rel  100000012',2),
 (200000001,'2010-11-24','P','2010-11-25 10:33:54','Rel  200000001 y  200000004',2);
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
 (1,3,343,'P','2010-11-19 11:11:15','OP - CARACAS SUC.',1,100,13.45,22.86,39),
 (1,4,185,'P','2010-11-19 11:11:15','OP - VALENCIA SUC.',1,100,9.2,15.65,26.69),
 (1,5,628,'P','2010-11-19 11:11:15','OP - BARCELONA SUC.',1,100,20,34,58),
 (1,6,440,'P','2010-11-19 11:12:57','OP - MARACAIBO SUC.',1,100,16.14,27.44,46.81),
 (1,9,234,'P','2010-11-19 11:11:15','OP - MARACAY',1,100,10.92,18.56,31.67),
 (1,10,172,'P','2010-11-19 11:11:15','OP - BARINAS',1,100,9.27,15.75,26.87),
 (1,14,371,'P','2010-11-19 11:11:15','OP - CORO',1,100,14.54,24.72,42.17),
 (1,16,86,'P','2010-11-19 11:11:15','OP - BARQUISIMETO',1,100,6.96,11.83,20.18),
 (1,21,82,'P','2010-11-19 11:11:15','OP - GUANARE',1,100,6.81,11.57,19.74),
 (1,23,473,'P','2010-11-19 11:11:15','OP - SAN CRISTOBAL',1,100,17.72,30.13,51.39),
 (1,24,300,'P','2010-11-19 11:11:15','OP - TRUJILLO',1,100,12.7,21.59,36.83),
 (1,26,157,'P','2010-11-19 11:11:15','OP - SAN FELIPE',1,100,8.83,15.01,25.61),
 (1,28,921,'P','2010-11-19 11:11:15','OP - TEMBLADOR',1,100,28.43,48.32,82.44),
 (1,31,400,'P','2010-11-19 11:11:15','OP - GUATIRE',1,100,15.29,25.99,44.34),
 (1,32,301,'P','2010-11-19 11:11:15','OP - CAGUA',1,100,12.73,21.64,36.92),
 (1,33,320,'P','2010-11-19 11:11:15','OP - VALERA',1,100,13.27,22.56,38.48),
 (1,34,47,'P','2010-11-19 11:11:15','OP - APARTADERO',1,100,5.8,9.87,16.83),
 (1,35,339,'P','2010-11-19 11:11:15','OP - CHARALLAVE',1,100,13.79,23.44,39.99),
 (1,36,326,'P','2010-11-19 11:11:15','OP - CALABOZO',1,100,13.42,22.81,38.91),
 (1,37,916,'P','2010-11-19 11:11:15','OP -  SAN FELIX',1,100,26.24,44.61,76.1),
 (1,38,586,'P','2010-11-19 11:11:15','OP - PUNTO FIJO',1,100,19.41,32.99,56.28),
 (1,40,1,'P','2010-11-19 11:11:15','OP - ACARIGUA',1,100,3.56,6.05,10.31),
 (1,41,148,'P','2010-11-19 11:11:15','OP - SABANETA',1,100,8.61,14.64,24.97),
 (1,42,138,'P','2010-11-19 11:11:15','OP - BARRANCAS',1,100,8.33,14.16,24.16),
 (1,43,175,'P','2010-11-19 11:11:15','OP - MIJAGUAL',1,100,9.3,15.82,26.98),
 (1,44,204,'P','2010-11-19 11:11:15','OP - SANTA ROSA',1,100,10.11,17.18,29.32),
 (1,45,279,'P','2010-11-19 11:11:15','OP - SOCOPO',1,100,12.14,20.63,35.2),
 (1,46,332,'P','2010-11-19 11:11:15','OP - SANTA BARBARA',1,100,13.6,23.13,39.45),
 (1,47,230,'P','2010-11-19 11:11:15','OP - LIBERTAD',1,100,10.83,18.4,31.4),
 (1,48,315,'P','2010-11-19 11:11:15','OP - CAPITANEJO',1,100,13.14,22.33,38.09),
 (1,49,380,'P','2010-11-19 11:11:15','OP - DOLORES',1,100,14.73,25.03,42.71),
 (1,50,206,'P','2010-11-19 11:11:15','OP - BARINITAS',1,100,10.17,17.29,29.5),
 (1,51,247,'P','2010-11-19 11:11:15','OP - PEDRAZA',1,100,11.29,19.2,32.75),
 (1,52,325,'P','2010-11-19 11:11:15','OP - BUENA VISTA',1,100,13.38,22.75,38.82),
 (1,53,392,'P','2010-11-19 11:11:15','OP - BETIJOQUE',1,100,15.04,25.56,43.6),
 (1,54,320,'P','2010-11-19 11:11:15','OP - CARVAJAL',1,100,13.26,22.54,38.45),
 (1,55,220,'P','2010-11-19 11:11:15','OP - MONAY',1,100,10.55,17.93,30.58),
 (1,56,250,'P','2010-11-19 11:11:15','OP - PAM PAM',1,100,11.36,19.31,32.93),
 (1,57,300,'P','2010-11-19 11:11:15','OP - SABANA MENDOZA',1,100,12.7,21.59,36.83),
 (1,58,400,'P','2010-11-19 11:11:15','OP - BOCONO',1,100,15.29,25.99,44.34),
 (1,59,20,'P','2010-11-19 11:11:15','OP - AGUA BLANCA',1,100,4.27,7.27,12.4),
 (1,60,1,'P','2010-11-19 11:11:15','OP - ARAURE',1,100,3.56,6.05,10.31),
 (1,61,129,'P','2010-11-19 11:11:15','OP - BISCUCUY',1,100,8.08,13.74,23.43),
 (1,62,166,'P','2010-11-19 11:11:15','OP - CHAVASQUEN',1,100,9.08,15.43,26.33),
 (1,63,185,'P','2010-11-19 11:11:15','OP - GUANARITO',1,100,9.61,16.34,27.87),
 (1,64,47,'P','2010-11-19 11:11:15','OP - OSPINO',1,100,5.8,9.87,16.83),
 (1,65,11,'P','2010-11-19 11:11:15','OP - PAYARA',1,100,3.68,6.26,10.68),
 (1,66,30,'P','2010-11-19 11:11:15','OP - PIRITU',1,100,5.34,9.07,15.47),
 (1,67,81,'P','2010-11-19 11:11:15','OP - PLAYON',1,100,6.77,11.51,19.63),
 (1,68,47,'P','2010-11-19 11:11:15','OP - TUREN',1,100,5.8,9.87,16.83),
 (1,69,367,'P','2010-11-19 11:11:15','OP - ABEJALES',1,100,14.45,24.56,41.89),
 (1,70,188,'P','2010-11-19 11:11:15','OP - CARORA',1,100,9.67,16.44,28.05),
 (1,71,136,'P','2010-11-19 11:11:15','OP - DUACA',1,100,8.27,14.06,23.98),
 (1,72,226,'P','2010-11-19 11:11:15','OP - EL TOCUYO',1,100,10.7,18.19,31.03),
 (1,73,20,'P','2010-11-19 11:11:15','OP - LA MIEL',1,100,4.27,7.27,12.4),
 (1,74,127,'P','2010-11-19 11:11:15','OP - QUIBOR',1,100,8.03,13.65,23.28),
 (1,75,33,'P','2010-11-19 11:11:15','OP - SARARE',1,100,5.46,9.28,15.83),
 (1,76,481,'P','2010-11-19 11:11:15','OP - NUEVA BOLIVIA',1,100,17.85,30.34,51.75),
 (1,77,206,'P','2010-11-19 11:11:15','OP - AROA',1,100,10.17,17.29,29.5),
 (1,78,294,'P','2010-11-19 11:11:15','OP - BRUZUAL',1,100,12.64,21.49,36.66),
 (1,79,480,'P','2010-11-19 11:11:15','OP - CAJA SECA',1,100,17.85,30.34,51.75),
 (1,80,130,'P','2010-11-19 11:11:15','OP - CHIVACOA',1,100,8.11,13.79,23.52),
 (1,81,527,'P','2010-11-19 11:11:15','OP - EL AMPARO',1,100,18.53,31.51,53.75),
 (1,82,507,'P','2010-11-19 11:11:15','OP - GUASDUALITO',1,100,18.22,30.98,52.84),
 (1,83,115,'P','2010-11-19 11:11:15','OP - SABANA DE PARRA',1,100,7.71,13.1,22.35),
 (1,84,110,'P','2010-11-19 11:11:15','OP - YARITAGUA',1,100,7.55,12.84,21.9),
 (1,85,212,'P','2010-11-19 11:11:15','OP - YUMARE',1,100,10.33,17.56,29.95),
 (1,86,36,'P','2010-11-19 11:11:15','OP - SAN RAFAEL DE ONOTO',1,100,5.52,9.39,16.01),
 (1,87,432,'P','2010-11-19 11:11:15','OP - EL CANTON, GUACAS',1,100,15.94,27.1,46.24),
 (1,88,440,'P','2010-11-19 11:11:15','OP - EL VIGIA',1,100,16.14,27.44,46.81),
 (1,89,193,'P','2010-11-19 11:11:15','OP - GUACARA',1,100,9.8,16.65,28.41),
 (6,1,440,'P','2010-11-19 11:12:57','MARACAIBO - OP',1,100,16.14,27.44,46.81),
 (6,3,786,'P','2010-11-19 11:12:57','MARACAIBO - CARACAS',1,100,22.99,39.08,66.67),
 (6,4,522,'P','2010-10-11 10:37:29','SAN FRANCISCO - VALENCIA',1,100,0.01,0.01,0.01),
 (27,1,633,'P','2010-11-19 11:11:15','PTO LA CRUZ - OP',1,100,20.09,34.16,58.27),
 (36,16,411,'P','2010-11-01 12:12:10','CALABOZO - BARQUISIMETO',1,100,15.48,26.31,44.88),
 (39,40,628,'P','2010-11-02 10:06:11','PERTIGALETE - ACARIGUA (CEMENTO)',1,100,16.85,28.64,48.86);
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
-- Definition of trigger `tgtruta_delete`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgtruta_delete`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgtruta_delete` BEFORE DELETE ON `truta` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('truta','D',Old.cId_Usuario,now(),concat(cast(old.nid_origen as char),cast(old.nid_destino as char)));
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
 ('01','SERVICIO 1','01','P','2010-10-13 15:16:08','7202030009','Mant/Repara.Vehículos',1),
 ('5','32DF1G','01','P','2010-11-26 17:12:19','7202030009','Mant/Repara.Vehículos',1);
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
  `ncap_carga` double NOT NULL default '0',
  `nid_origdest` int(4) default '0',
  `nactivo` tinyint(1) unsigned default '0',
  `nbono_alm` double(7,4) default '0.0000' COMMENT 'Incentivo por carga total despachada en el mes para el jefe de almacen',
  `nbono_mon` double(7,4) default '0.0000' COMMENT 'Incentivo por carga total despachada en el mes para el montacarguista',
  `nporc_com` int(3) unsigned default '0' COMMENT 'Porcentaje de capacidad de carga a partir del cual se paga comisión al jefe de almacen y montacarguista',
  `cconcepto_com` varchar(4) default '' COMMENT 'Código del concepto de las comisiones para los choferes.\r\n',
  PRIMARY KEY  USING BTREE (`nid_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

/*!40000 ALTER TABLE `tsucursal` DISABLE KEYS */;
INSERT INTO `tsucursal` (`nid_sucursal`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`ncap_carga`,`nid_origdest`,`nactivo`,`nbono_alm`,`nbono_mon`,`nporc_com`,`cconcepto_com`) VALUES 
 (1,'OFICINA PRINCIPAL','1703','P','2010-11-05 17:40:53',10000000,1,1,0.0000,0.0000,80,'1102'),
 (2,'CENTRO OCCIDENTE','1703','P','2010-11-05 17:41:09',10000000,2,1,0.0000,0.0000,0,'1104'),
 (3,'CARACAS','2401','P','2010-11-05 17:41:21',1600000,3,1,0.1800,0.0040,0,'1104'),
 (4,'VALENCIA','0701','P','2010-11-05 17:41:31',700000,4,1,0.1800,0.0040,0,'1104'),
 (5,'BARCELONA','0201','P','2010-11-05 17:41:42',700000,5,1,0.1800,0.0040,0,'1104'),
 (6,'MARACAIBO','2301','P','2010-11-05 17:41:49',10,6,1,0.1800,0.0040,0,'1104');
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
 ('01','CALETAS','P','2010-11-30 17:50:53','7202030013','CALETAS Y ACARREOS'),
 ('02','GASOIL','P','2010-10-13 10:02:43','7202030009','Mant/Repara.Vehículos'),
 ('05','PEAJES','P','2010-10-13 10:07:47','7202030009','Mant/Repara.Vehículos'),
 ('06','VIATICOS (COMIDA)','P','2010-10-13 10:03:25','7202030013','Caletas y Acarreos'),
 ('07','GASTOS DE VÍA','P','2010-10-30 17:17:40','7202030009','Mant/Repara.Vehículos'),
 ('08','OTROS','P','2010-10-14 15:44:05','7202030009','Mant/Repara.Vehículos');
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
  `nanular` tinyint(1) unsigned NOT NULL default '0' COMMENT 'Anular documentos (Anticipos, Relaciones, Gastos por Servicio)',
  `nrep_com` tinyint(1) unsigned NOT NULL default '0' COMMENT 'Reportes de comisiones',
  `ncalc_com` tinyint(1) unsigned NOT NULL default '0' COMMENT 'Calcular comisiones',
  `nconfig` tinyint(1) unsigned NOT NULL default '0' COMMENT 'Configuracion del sistema',
  `codbc_oracle` varchar(45) default '',
  PRIMARY KEY  (`cid_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tusuario`
--

/*!40000 ALTER TABLE `tusuario` DISABLE KEYS */;
INSERT INTO `tusuario` (`cid_usuario`,`cnombre`,`cclave`,`nactivo`,`nfrmalmacenistas`,`nfrmanticipo_viaje`,`nfrmcargar_anticipo`,`nfrmcargar_viaje`,`nfrmcargar_viaje_ext`,`nfrmchoferes`,`nfrmciudades`,`nfrmestados`,`nfrmgasto_servicio`,`nfrmgrupos_serv`,`nfrmmontacarguistas`,`nfrmorigendestinos`,`nfrmperiodos`,`nfrmrelacion`,`nfrmrutas`,`nfrmservicios`,`nfrmsucursales`,`nfrmtipo_gastos`,`nfrmtransp_ext`,`nfrmusuarios`,`nfrmvehiculos`,`nfrmviajes`,`ncerrar_periodos`,`nmov_fperiodo`,`nanular`,`nrep_com`,`ncalc_com`,`nconfig`,`codbc_oracle`) VALUES 
 ('ADMIN','ADMINISTRADOR','ËÍÉÍÍÈËÉÍ',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,''),
 ('P','PEDRO PAPIC','È',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'ORACLE EN ORADB10G_HOME1');
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
  `ntara` double default '0' COMMENT 'Peso del vehículo vacio',
  `ncapacidad` double default '0' COMMENT 'Capacidad de carga del vehículo. (Peso neto de la carga)',
  `ctipo_vehic` int(1) unsigned default '0' COMMENT '1:Liviano (<13Ton),  2:Mediano (13Ton<=X<=25Ton),  3:Pesado(>25Ton)',
  `ncosto` double default '0',
  `cid_usuario` varchar(20) NOT NULL default ' ',
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `npropio` int(1) unsigned NOT NULL default '0',
  `nactivo` tinyint(1) unsigned NOT NULL default '0',
  `nid_sucursal` int(4) unsigned NOT NULL default '0',
  `crif_empext` varchar(15) default ' ' COMMENT 'Empresa transportista, en caso de que el vehículo sea contratado',
  PRIMARY KEY  (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tvehiculo`
--

/*!40000 ALTER TABLE `tvehiculo` DISABLE KEYS */;
INSERT INTO `tvehiculo` (`cid_vehiculo`,`cdescripcion`,`cmarca`,`cserial_motor`,`cserial_carroc`,`ntara`,`ncapacidad`,`ctipo_vehic`,`ncosto`,`cid_usuario`,`dfecha_act`,`npropio`,`nactivo`,`nid_sucursal`,`crif_empext`) VALUES 
 ('01UDAY','DEMETRIO DUARTE',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:31:18',0,1,2,' '),
 ('09JGAK','CAMION CHUTO 1998','MV','SM','SC',20000,31000,3,0,'P','2010-10-20 14:23:05',1,1,1,''),
 ('39HDAO','GANDOLA MACK','MV','SM','SC',20000,31000,3,0,'P','2010-10-20 14:24:08',1,1,1,''),
 ('48SDAR','CHUTO  NUEVO','MV','SM','SC',20000,30000,3,0,'P','2010-10-20 14:24:57',1,1,1,''),
 ('59XPAC','CHUTO-613-99T',' ',' ',' ',0,0,0,0,'P','2010-11-26 15:37:24',0,1,1,' '),
 ('62XPAC','CHUTO 1999','MC','SM','SC',13000,31000,3,0,'P','2010-11-12 11:58:57',1,1,1,''),
 ('65XPAC','MACK  CH613','M','SM','',20000,31000,3,0,'P','2010-10-20 14:28:24',1,1,1,''),
 ('667XGB','VP',' ',' ',' ',0,0,0,0,'P','2010-10-20 16:38:14',0,1,1,' '),
 ('66XPAC','CAMION CHUTO 1999',' ',' ',' ',0,0,0,0,'P','2010-10-30 17:08:03',0,1,1,' '),
 ('67XPAC','GANDOLA MACK','MV','SM','SC',20000,31000,3,0,'P','2010-10-20 14:29:31',1,1,1,''),
 ('68IDIBB','JOSMAN ESCALONA',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:38:10',0,1,2,' '),
 ('69UDAY','GERMAN CASTILLO',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:41:58',0,1,2,' '),
 ('76SDAR','GANDOLA MACK','MV','SM','SC',20000,30000,3,0,'P','2010-10-20 15:11:44',1,1,1,''),
 ('85CDAV','VEH.PESADO',' ',' ',' ',0,0,0,0,'P','2010-11-24 09:36:13',0,1,1,' '),
 ('A02AF5T','VEHICULO LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:49:14',0,1,2,' '),
 ('A13AG7E','VEH. LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:48:05',0,1,2,' '),
 ('A15AU5D','CAMION CHUTO','MV','SM','SC',13000,30000,3,0,'P','2010-10-20 15:25:04',1,1,1,''),
 ('A15AU7D','CAMION CHUTO','MV','SM','SC',17000,31000,3,0,'P','2010-11-11 11:30:53',1,1,1,''),
 ('A15AU8D','CAMION CHUTO','MV','SM','SC',13000,30000,3,0,'P','2010-10-20 15:25:39',1,1,1,''),
 ('A22AE2U','CAMION FURGON BLANCO AÑO 2001',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:48:20',0,1,2,' '),
 ('A22AE3U','CAMION KODIAK',' ',' ',' ',0,0,0,0,'P','2010-10-18 14:39:41',0,1,2,' '),
 ('A22AE4U','CAMION FURGON',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:48:35',0,1,2,' '),
 ('A22AE9U','VEHICULO LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:30:26',0,1,2,' '),
 ('A23AE1U','VEICULO LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:47:58',0,1,2,' '),
 ('A23AE2U','VEHICULO LIVIANO','MV','SM','SC',7000,13000,1,0,'P','2010-11-26 17:06:49',1,1,2,''),
 ('A46AG7E','KODIAK',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:31:02',0,1,2,' '),
 ('A62AA9D','CAMION  MACK','MV','SM','SC',13000,30000,3,0,'P','2010-10-20 15:26:13',1,1,1,''),
 ('A64AE3E','CAMION-CHASIS','MV','SM','SC',15000,30000,3,0,'P','2010-10-20 15:27:24',1,1,1,''),
 ('A67AE8E','KODIAK.VEH.MEDIANO',' ',' ',' ',0,0,0,0,'P','2010-11-26 16:57:21',0,1,2,' '),
 ('A72AE3E','VEH LIVIANO',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:48:46',0,1,2,' '),
 ('A75A/D1I','CAMIION CHUTO','MV','SM','SC',15000,30000,3,0,'P','2010-10-20 15:30:23',1,1,1,''),
 ('A75AD1/I','CAMIION CHUTO','MV','SM','SC',15000,30000,3,0,'P','2010-10-20 15:30:55',1,1,1,''),
 ('A86AA/OD','VP','MV','SM','SC',15000,30000,3,0,'P','2010-10-20 15:31:25',1,1,1,''),
 ('A86AA0D','CAMION MACK','MV','SM','SC',15000,30000,3,0,'P','2010-10-20 15:31:51',1,1,1,'');
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
  `nid_viaje` int(10) unsigned NOT NULL default '0',
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
  `ntipo_viaje` tinyint(1) unsigned NOT NULL default '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned default '0',
  `ndistancia` double default '0',
  `nstatus` tinyint(1) unsigned NOT NULL default '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) default '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) default ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL default '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL default '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  PRIMARY KEY  USING BTREE (`nid_viaje`),
  KEY `FK_tviaje_tperiodo` (`cid_periodo`),
  KEY `FK_tviaje_truta` (`nid_origen`,`nid_destino`),
  KEY `ix_orden_c` (`corden_carga`),
  KEY `ix_fact_ext` (`cfactura_ext`),
  KEY `FK_tviaje_tchofer` (`cid_chofer`,`nid_sucursal_c`),
  KEY `FK_tviaje_tvehiculo` (`cid_vehiculo`),
  CONSTRAINT `FK_tviaje_tchofer` FOREIGN KEY (`cid_chofer`, `nid_sucursal_c`) REFERENCES `tchofer` (`cid_chofer`, `nid_sucursal`),
  CONSTRAINT `FK_tviaje_tperiodo` FOREIGN KEY (`cid_periodo`) REFERENCES `tperiodo` (`cid_periodo`),
  CONSTRAINT `FK_tviaje_truta` FOREIGN KEY (`nid_origen`, `nid_destino`) REFERENCES `truta` (`nid_origen`, `nid_destino`),
  CONSTRAINT `FK_tviaje_tvehiculo` FOREIGN KEY (`cid_vehiculo`) REFERENCES `tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tviaje`
--

/*!40000 ALTER TABLE `tviaje` DISABLE KEYS */;
INSERT INTO `tviaje` (`nid_viaje`,`cid_chofer`,`cid_vehiculo`,`dfecha`,`cobservacion`,`cguia`,`corden_carga`,`dfecha_guia`,`npeso_neto`,`cid_usuario`,`dfecha_act`,`nid_origen`,`nid_destino`,`cid_periodo`,`ntipo_viaje`,`nid_sucursal_guia`,`ndistancia`,`nstatus`,`cfactura_ext`,`ccliente_ext`,`nid_sucursal_c`,`nid_sucursal_v`) VALUES 
 (100000001,'9562700','A86AA0D','2010-11-23','vj 16466','15280','16466','2010-08-14',30150,'P','2010-11-23 15:03:21',1,14,'201012',1,1,371,1,'','',1,1),
 (100000002,'9562700','A86AA0D','2010-11-23','vj 16531','15341','16531','2010-08-18',31430,'P','2010-11-23 15:05:34',1,5,'201012',1,1,628,1,'','',1,1),
 (100000003,'9562700','A86AA0D','2010-11-23','vj 304216','','','2010-08-19',28560,'P','2010-11-23 18:04:45',39,40,'201012',2,0,628,1,'304216','CEMEX',1,1),
 (100000004,'9562700','A86AA0D','2010-11-24','Vj 16617','15424','16617','2010-08-23',31350,'P','2010-11-24 09:16:10',1,31,'201012',1,1,400,1,'','',1,1),
 (100000005,'9562700','A86AA0D','2010-11-24','Vj 306637','','','2010-08-24',28560,'P','2010-11-24 09:33:23',39,40,'201012',2,0,628,1,'306637','CEMEX',1,1),
 (100000006,'9562700','A86AA0D','2010-11-24','Vj 16686','15500','16686','2010-08-26',31370,'P','2010-11-24 09:37:44',1,9,'201012',1,1,234,1,'','',1,1),
 (100000007,'9562700','A86AA0D','2010-11-24','Vj 16754','15552','16754','2010-08-30',31490,'P','2010-11-24 09:40:04',1,3,'201012',1,1,343,1,'','',1,1),
 (100000008,'9562700','A86AA0D','2010-11-24','Vj 16798','15597','16798','2010-09-01',30270,'P','2010-11-24 09:41:29',1,23,'201012',1,1,473,1,'','',1,1),
 (100000009,'9562700','A86AA0D','2010-11-24','vj 16859\r\n','15645','16859','2010-09-03',33070,'P','2010-11-24 09:46:08',1,5,'201012',1,1,628,1,'','',1,1),
 (100000010,'9562700','A86AA0D','2010-11-24','Vj 314785','','','2010-09-05',28560,'P','2010-11-24 09:48:06',39,40,'201012',2,0,628,1,'314785','CEMEX',1,1),
 (100000011,'9562700','A86AA0D','2010-11-24','Vj 16941\r\n','15721','16941','2010-09-08',30230,'P','2010-11-24 09:49:57',1,16,'201012',1,1,86,1,'','',1,1),
 (100000012,'9562700','A86AA0D','2010-11-24','Vj 16969','15755','16969','2010-09-09',31200,'P','2010-11-24 09:51:21',1,4,'201012',1,1,185,1,'','',1,1),
 (100000013,'9562700','A86AA0D','2010-11-24','Vj 17006','15799','17006','2010-09-10',32810,'P','2010-11-24 09:53:36',1,3,'201012',1,1,343,1,'','',1,1),
 (100000014,'9562700','A86AA0D','2010-11-24','Vj 17068','15847','17068','2010-09-14',33110,'P','2010-11-24 09:55:01',1,37,'201012',1,1,916,1,'','',1,1),
 (100000015,'7241360','76SDAR','2010-11-25','vj 16447\r\n','15254','16447','2010-08-13',34750,'P','2010-11-25 10:32:48',1,3,'201012',1,1,343,1,'','',1,1),
 (100000016,'7241360','09JGAK','2010-12-03','aaa','','','2010-12-03',28560,'P','2010-12-03 09:26:22',1,3,'201012',2,0,343,1,'999','PEDRO',1,1),
 (200000001,'9562700','A86AA0D','2010-11-23','vj 3080\r\n','2920','3080','2010-08-11',35580,'P','2010-11-23 14:53:20',1,10,'201012',1,2,172,1,'','',1,1),
 (200000002,'9562700','A86AA0D','2010-11-23','vj 9999999999','','','2010-08-19',29000,'P','2010-11-23 18:10:25',39,40,'201012',2,0,628,1,'9999999999','CEMEX',2,2),
 (200000003,'9562700','A86AA0D','2010-11-24','vj 999999','','','2010-09-18',29000,'P','2010-11-24 09:06:22',39,40,'201012',2,0,628,1,'999999','CEMEX',1,1),
 (200000004,'8103812','A23AE2U','2010-11-26','prueba','3449','3630','2010-11-25',13000,'P','2010-11-26 17:18:54',1,14,'201012',1,2,371,1,'','',2,2),
 (200000005,'8103812','A23AE2U','2010-11-26','prueba\r\n','0','3648','2010-11-26',0,'P','2010-11-26 17:26:47',1,10,'201012',1,2,172,1,'','',2,2);
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
-- Definition of function `Fn_Corr_Nid_Anticipo`
--

DROP FUNCTION IF EXISTS `Fn_Corr_Nid_Anticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Corr_Nid_Anticipo`(tNid_Sucursal int(4)) RETURNS int(10)
BEGIN
   -- Retorna y guarda el siguiente número correlativo de tanticipo.nid_anticipo (Sólo para ser usado en el Sp_Reemplazar_Anticipo)

   Declare lnReturn integer;

   Set lnReturn = (select nid_anticipo+1 from tcorrelativo where nid_sucursal = tNid_Sucursal);
   update tcorrelativo set nid_anticipo = lnReturn where nid_sucursal = tNid_Sucursal;

   Return lnReturn;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `Fn_Corr_Nid_Viaje`
--

DROP FUNCTION IF EXISTS `Fn_Corr_Nid_Viaje`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Corr_Nid_Viaje`(tNid_Sucursal int(4)) RETURNS int(10)
BEGIN
   -- Retorna y guarda el siguiente número correlativo de tviaje.nid_viaje (Sólo para ser usado en el Sp_Reemplazar_Anticipo)

   Declare lnReturn integer;

   Set lnReturn = (select nid_viaje+1 from tcorrelativo where nid_sucursal = tNid_Sucursal);
   update tcorrelativo set nid_viaje = lnReturn where nid_sucursal = tNid_Sucursal;

   Return lnReturn;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Sp_Calc_Com_Chof`
--

DROP PROCEDURE IF EXISTS `Sp_Calc_Com_Chof`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Calc_Com_Chof`(tcid_periodo varchar(10),tnid_sucursal int(4))
Cancel: BEGIN
   Declare nError Int(10);
   Declare ldfecha_desde,ldfecha_hasta date;
   Declare lcid_periodo VARCHAR(10);
   DECLARE finished INTEGER DEFAULT 0;
   DECLARE ttperiodo CURSOR FOR SELECT cid_periodo,dfecha_desde,dfecha_hasta FROM tperiodo where cid_periodo = tcid_periodo and nstatus = 0;
   OPEN ttperiodo;
   FETCH ttperiodo INTO lcid_periodo,ldfecha_desde,ldfecha_hasta;
   close ttperiodo;
   Create Temporary Table ttRelac (nid_relacion Int(10));

   Start Transaction;

      if not exists(select * from tconfig where ifnull(ccompania,'')<>'') then
         ROLLBACK;
         LEAVE Cancel;
      end if;

      if not exists(select cid_periodo,dfecha_desde,dfecha_hasta from tperiodo where cid_periodo = tcid_periodo and nstatus = 0) then
         ROLLBACK;
         LEAVE Cancel;
      end if;

      
      insert into tcomision_choferes (nid_viaje,nporc_com,ntabulador,cid_periodo)
         select nid_viaje,nporc_com_r,CASE ctipo_vehic WHEN '1' THEN ncom_liv WHEN '2' THEN ncom_med WHEN '3' THEN ncom_pes END as ntabulador,(select tcid_periodo) as cid_periodo_r
            from vw_viajes
            where ((nstatus_r = 1 and (dfecha_r between ldfecha_desde and ldfecha_hasta)))
            AND ncontratado = 0 AND nactivo_c = 1
            AND npropio = 1 AND nactivo_v = 1 and nactivo_s = 1
            AND nid_sucursal = tnid_sucursal
            group by nid_viaje
            having count(nid_relacion)=min(count_viaje)
            order by nid_viaje;

      insert into ttRelac
         select distinct nid_relacion
            from vw_viajes
            where ((nstatus_r = 1 and (dfecha_r between ldfecha_desde and ldfecha_hasta)))
            AND ncontratado = 0 AND nactivo_c = 1
            AND npropio = 1 AND nactivo_v = 1 and nactivo_s = 1
            AND nid_sucursal = tnid_sucursal
            group by nid_viaje
            having count(nid_relacion)=min(count_viaje)
            order by nid_relacion;

      update trelacion set nstatus = 2 where nid_relacion in (select nid_relacion from ttRelac);


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
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Sp_Reemplazar_Anticipo`
--

DROP PROCEDURE IF EXISTS `Sp_Reemplazar_Anticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Reemplazar_Anticipo`(tnid_anticipo Integer,tnid_sucursal int(4),tcid_vehiculo varchar(10),tnid_sucursal_v int(4),tcid_chofer varchar(9),tnid_sucursal_c int(4),tcobservacion text,tcid_usuario varchar(20),tcid_periodo varchar(10))
BEGIN
   -- Crea una copia de todos los anticipos y viajes relacionados al tnid_anticipo, reemplazando el chofer y el vehículo por el recibido

   Declare nError,lNid_Anticipo,lNid_Viaje integer;
   Set lNid_Anticipo = 0;
   Set lNid_Viaje = 0;

   Start Transaction;
      Create Temporary Table ttAnticipo (nid_anticipo Integer,index using btree (nid_anticipo),cnro_recibo varchar(10),nmonto double,cobservacion text,
         dfecha date,nstatus tinyint(1),nid_relacion int(10),nrelacionado tinyint(1),nid_sucursal int(4),nid_anticipo_ant int(10));
      Create Temporary Table ttViaje (nid_viaje Integer,index using btree (nid_viaje),cid_chofer varchar(9),cid_vehiculo varchar(10),dfecha date,cobservacion text,cguia varchar(10),
         corden_carga varchar(10),dfecha_guia date,npeso_neto double,nid_origen int(4),nid_destino int(4),cid_periodo varchar(10),ntipo_viaje  tinyint(1),
         nid_sucursal_guia int(4),ndistancia double,nstatus tinyint(1),cfactura_ext varchar(10),ccliente_ext varchar(45),nid_sucursal_c int(4),nid_sucursal_v int(4));
      Create Temporary Table ttAnticip_tViaje (nid_anticipo Integer,index using btree (nid_anticipo),nid_anticipo_nvo integer,
         nid_viaje Integer,index using btree (nid_viaje),nid_viaje integer);
      Create Temporary Table ttNid_Anticipo (nid_anticipo integer,index using btree (nid_anticipo));
      Create Temporary Table ttNid_Viaje (nid_viaje integer,index using btree (nid_viaje));

      insert into ttNid_Viaje select distinct tav.nid_viaje from tanticip_tviaje tav where tav.nid_anticipo = tnid_anticipo;
      insert into ttNid_Anticipo select distinct tav.nid_anticipo from tanticip_tviaje tav where nid_viaje in (select nid_viaje from ttNid_Viaje);

      insert into ttAnticipo
         select distinct nid_anticipo,cnro_recibo,nmonto,cobservacion,dfecha,nstatus,nid_relacion,nrelacionado,nid_sucursal,nid_anticipo_ant from tanticipo
            where nid_anticipo in (select * from ttNid_Anticipo);

      insert into ttViaje
         select distinct nid_viaje,cid_chofer,cid_vehiculo,dfecha,cobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,nid_origen,nid_destino,cid_periodo,ntipo_viaje,
            nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,nid_sucursal_c,nid_sucursal_v from tviaje where nid_viaje in (select * from ttNid_Viaje);

      insert into ttAnticip_tViaje (nid_anticipo,nid_viaje)
         select nid_anticipo,nid_viaje from tanticip_tviaje where nid_anticipo in (select * from ttNid_Anticipo);
/*
      select * from ttAnticipo;
      select * from ttviaje;
      select * from ttAnticip_tViaje;
*/
      While Exists(Select * From ttAnticipo) Do
         Set lNid_Anticipo = (Select Nid_Anticipo From ttAnticipo Order By Nid_Anticipo Limit 1);
         insert into tanticipo (nid_anticipo,cnro_recibo,nmonto,nstatus,nid_anticipo_ant,dfecha,nid_sucursal,cid_usuario,cobservacion)
            select Fn_Corr_Nid_Anticipo(tnid_sucursal),cnro_recibo,nmonto,nstatus,nid_anticipo,now(),tnid_sucursal,tcid_usuario,tcobservacion
            from tanticipo where nid_anticipo = lNid_Anticipo;
         update ttAnticip_tViaje set nid_anticipo_nvo = last_insert_id() where nid_anticipo = lNid_Anticipo;
         update tanticipo set nstatus = 3 where nid_anticipo = lNid_Anticipo;
         Delete From ttAnticipo Where Nid_Anticipo = lNid_Anticipo;
      End While;

      While Exists(Select * From ttViaje) Do
         Set lNid_Viaje = (Select Nid_Viaje From ttViaje Order By Nid_Viaje Limit 1);
         insert into tviaje (nid_viaje,cid_chofer,cid_vehiculo,dfecha,cobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,cid_usuario,nid_origen,nid_destino,
            cid_periodo,ntipo_viaje,nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,nid_sucursal_c,nid_sucursal_v)
            select Fn_Corr_Nid_Viaje(tnid_sucursal),tcid_chofer,tcid_vehiculo,now(),tcobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,tcid_usuario,nid_origen,nid_destino,
               tcid_periodo,ntipo_viaje,nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,tnid_sucursal_c,tnid_sucursal_v
               from tviaje where nid_viaje = lNid_Viaje;
         update ttAnticip_tViaje set nid_viaje_nvo = last_insert_id() where nid_viaje = lNid_Viaje;
         update tviaje set nstatus = 3 where nid_viaje = lNid_Viaje;
         Delete From ttViaje Where Nid_Viaje = lNid_Viaje;
      End While;

      While Exists(Select * From ttAnticip_tViaje) Do
         Set lNid_Anticipo = (Select Nid_Anticipo_nvo From ttAnticip_tViaje Limit 1);
         Set lNid_Viaje = (Select Nid_Viaje_nvo From ttAnticip_tViaje Limit 1);
         insert into tAnticip_tViaje (nid_anticipo,nid_viaje) values(lNid_Anticipo,lNid_Viaje);
         Delete From ttAnticip_tViaje Where Nid_Anticipo_nvo = lNid_Anticipo and Nid_Viaje_nvo = lNid_Viaje;
      End While;

      Drop Temporary Table ttAnticipo;
      Drop Temporary Table ttViaje;
      Drop Temporary Table ttAnticip_tViaje;
      Drop Temporary Table ttNid_Anticipo;
      Drop Temporary Table ttNid_Viaje;

   Set nError =(Select @Error);
   if(nError>0) then
      ROLLBACK;
   else
      COMMIT;
   end if;

--   select ', tcCampo ,' from tcorrelativo where nid_sucursal = ',tNid_Sucursal


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `vw_anticipos`
--

DROP TABLE IF EXISTS `vw_anticipos`;
DROP VIEW IF EXISTS `vw_anticipos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vw_anticipos` AS select `tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto`,`tan`.`cid_usuario` AS `cid_usuario`,`tan`.`dfecha_act` AS `dfecha_act`,`tan`.`cobservacion` AS `cobservacion`,`tan`.`dfecha` AS `dfecha`,`tan`.`nstatus` AS `nstatus`,`tan`.`nid_relacion` AS `nid_relacion`,`tan`.`nrelacionado` AS `nrelacionado`,`tan`.`nid_sucursal` AS `nid_sucursal`,`tvj`.`nid_viaje` AS `nid_viaje`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`nid_sucursal_c` AS `nid_sucursal_c`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`nid_sucursal_v` AS `nid_sucursal_v`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`corden_carga` AS `corden_carga`,`tvj`.`cguia` AS `cguia`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_neto` AS `npeso_neto`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`cid_periodo` AS `cid_periodo`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`nactivo` AS `nactivo_s`,`tp`.`cdescripcion` AS `cdescripcion_p`,`tp`.`dfecha_desde` AS `dfecha_desde`,`tp`.`dfecha_hasta` AS `dfecha_hasta`,`tp`.`nstatus` AS `nstatus_p`,`tr`.`cdescripcion` AS `cdescripcion_r`,`tr`.`nactivo` AS `nactivo_r`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal`,(select `torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d`,(select count(`tanticip_tviaje`.`nid_anticipo`) AS `count(nid_anticipo)` from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_anticipo` = `tan`.`nid_anticipo`)) AS `ncount_viaje`,(select count(`tanticip_tviaje`.`nid_viaje`) AS `count(nid_viaje)` from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_viaje` = `tvj`.`nid_viaje`)) AS `ncount_anticipo` from ((((((((`tanticipo` `tan` join `tanticip_tviaje` `tav` on((`tav`.`nid_anticipo` = `tan`.`nid_anticipo`))) join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tav`.`nid_viaje`))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tan`.`nid_sucursal`))) join `tperiodo` `tp` on((`tp`.`cid_periodo` = `tvj`.`cid_periodo`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `truta` `tr` on(((`tr`.`nid_origen` = `tvj`.`nid_origen`) and (`tr`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`)));

--
-- Definition of view `vw_choferes`
--

DROP TABLE IF EXISTS `vw_choferes`;
DROP VIEW IF EXISTS `vw_choferes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_choferes` AS select `tch`.`cid_chofer` AS `cid_chofer`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`cid_usuario` AS `cid_usuario`,`tch`.`dfecha_act` AS `dfecha_act`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo`,`ts`.`cdescripcion` AS `cdescripcion_s`,count(`tvj`.`cid_chofer`) AS `ntotal_viajes`,(sum(`tvj`.`npeso_neto`) / 1000) AS `ntotal_peso`,sum(`tvj`.`ndistancia`) AS `ntotal_km` from ((`tchofer` `tch` join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tviaje` `tvj` on(((`tvj`.`cid_chofer` = `tch`.`cid_chofer`) and (`tvj`.`nid_sucursal_c` = `tch`.`nid_sucursal`)))) group by `tch`.`cid_chofer` order by cast(`tch`.`cid_chofer` as unsigned);

--
-- Definition of view `vw_comision_choferes`
--

DROP TABLE IF EXISTS `vw_comision_choferes`;
DROP VIEW IF EXISTS `vw_comision_choferes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_comision_choferes` AS select `tcc`.`nid_viaje` AS `nid_viaje`,`tcc`.`cid_periodo` AS `cid_periodo`,`tcc`.`nporc_com` AS `nporc_com`,`tcc`.`ntabulador` AS `ntabulador`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`corden_carga` AS `corden_carga`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_neto` AS `npeso_neto`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`cid_periodo` AS `cid_periodo_v`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`nstatus` AS `nstatus_v`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ncapacidad` AS `ncapacidad`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cconcepto_com` AS `cconcepto_com`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`ncap_carga` AS `ncap_carga`,`ts`.`nactivo` AS `nactivo_s`,`ts`.`nbono_alm` AS `nbono_alm`,`ts`.`nbono_mon` AS `nbono_mon`,`ts`.`nporc_com` AS `nporc_com_s`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto_a`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nstatus` AS `nstatus_a`,`tan`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha_r`,`trl`.`nstatus` AS `nstatus_r`,`trt`.`cdescripcion` AS `cdescripcion_r`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tp`.`cdescripcion` AS `cdescripcion_p`,`tp`.`dfecha_desde` AS `dfecha_desde`,`tp`.`dfecha_hasta` AS `dfecha_hasta`,((((`tvj`.`npeso_neto` * `tcc`.`ntabulador`) / 1000) * `tcc`.`nporc_com`) / 100) AS `nmonto_com`,sum(`tdr`.`nmonto`) AS `nmonto_r`,(select `torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tvj`.`nid_destino`)) AS `cdescripcion_d`,(select count(`tanticip_tviaje`.`nid_anticipo`) AS `count(nid_anticipo)` from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_anticipo` = `tan`.`nid_anticipo`)) AS `ncount_viaje`,(select count(`tanticip_tviaje`.`nid_viaje`) AS `count(nid_viaje)` from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_viaje` = `tvj`.`nid_viaje`)) AS `ncount_anticipo` from (((((((((((`tcomision_choferes` `tcc` join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tcc`.`nid_viaje`))) join `tvehiculo` `tvh` on((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tanticip_tviaje` `tav` on((`tav`.`nid_viaje` = `tvj`.`nid_viaje`))) join `tanticipo` `tan` on((`tan`.`nid_anticipo` = `tav`.`nid_anticipo`))) join `trelacion` `trl` on((`trl`.`nid_relacion` = `tan`.`nid_relacion`))) join `tdetalle_relacion` `tdr` on((`tdr`.`nid_relacion` = `trl`.`nid_relacion`))) join `truta` `trt` on(((`trt`.`nid_origen` = `tvj`.`nid_origen`) and (`trt`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `trt`.`nid_origen`))) join `tperiodo` `tp` on((`tp`.`cid_periodo` = `tcc`.`cid_periodo`))) group by `tcc`.`nid_viaje`,`tcc`.`cid_periodo`,`tcc`.`nporc_com`,`tcc`.`ntabulador`,`tvj`.`cid_chofer`,`tvj`.`cid_vehiculo`,`tvj`.`dfecha`,`tvj`.`cguia`,`tvj`.`corden_carga`,`tvj`.`dfecha_guia`,`tvj`.`npeso_neto`,`tvj`.`nid_origen`,`tvj`.`nid_destino`,`tvj`.`cid_periodo`,`tvj`.`ntipo_viaje`,`tvj`.`nid_sucursal_guia`,`tvj`.`ndistancia`,`tvj`.`nstatus`,`tvj`.`cfactura_ext`,`tvj`.`ccliente_ext`,`tvh`.`cdescripcion`,`tvh`.`ncapacidad`,`tvh`.`ctipo_vehic`,`tvh`.`npropio`,`tvh`.`nactivo`,`tch`.`cnombre`,`tch`.`ccontraparte`,`tch`.`cficha_nom`,`tch`.`nid_sucursal`,`tch`.`ncontratado`,`tch`.`nactivo`,`ts`.`cdescripcion`,`ts`.`ncap_carga`,`ts`.`nactivo`,`ts`.`nbono_alm`,`ts`.`nbono_mon`,`ts`.`nporc_com`,`tan`.`nid_anticipo`,`tan`.`cnro_recibo`,`tan`.`nmonto`,`tan`.`dfecha`,`tan`.`nstatus`,`tan`.`nid_relacion`,`trl`.`dfecha`,`trl`.`nstatus`,`trt`.`cdescripcion`,`tod`.`cdescripcion`,`tp`.`cdescripcion`,`tp`.`dfecha_desde`,`tp`.`dfecha_hasta`;

--
-- Definition of view `vw_rutas`
--

DROP TABLE IF EXISTS `vw_rutas`;
DROP VIEW IF EXISTS `vw_rutas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vw_rutas` AS select `tr`.`nid_origen` AS `nid_origen`,`tr`.`nid_destino` AS `nid_destino`,`tr`.`ndistancia` AS `ndistancia`,`tr`.`cid_usuario` AS `cid_usuario`,`tr`.`dfecha_act` AS `dfecha_act`,`tr`.`cdescripcion` AS `cdescripcion`,`tr`.`nactivo` AS `nactivo`,`tr`.`nporc_com` AS `nporc_com`,`tr`.`ncom_pes` AS `ncom_pes`,`tr`.`ncom_med` AS `ncom_med`,`tr`.`ncom_liv` AS `ncom_liv`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`cid_ciudad` AS `cid_ciudad_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal_o`,`tc`.`cdescripcion` AS `cdescripcion_co`,`tc`.`cid_estado` AS `cid_estado_o`,`te`.`cdescripcion` AS `cdescripcion_eo`,(select `torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d`,(select `torigen_destino`.`cid_ciudad` AS `cid_ciudad` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cid_ciudad_d`,(select `torigen_destino`.`nactivo` AS `nactivo` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nactivo_d`,(select `torigen_destino`.`nsucursal` AS `nsucursal` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nsucursal_d`,(select `tciudad`.`cdescripcion` AS `cdescripcion` from `tciudad` where (`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cdescripcion_cd`,(select `tciudad`.`cid_estado` AS `cid_estado` from `tciudad` where (`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cid_estado_d`,(select `testado`.`cdescripcion` AS `cdescripcion` from `testado` where (`testado`.`cid_estado` = `cid_estado_d`)) AS `cdescripcion_ed` from (((`truta` `tr` join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`))) join `tciudad` `tc` on((`tc`.`cid_ciudad` = `tod`.`cid_ciudad`))) join `testado` `te` on((`te`.`cid_estado` = `tc`.`cid_estado`)));

--
-- Definition of view `vw_viajes`
--

DROP TABLE IF EXISTS `vw_viajes`;
DROP VIEW IF EXISTS `vw_viajes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_viajes` AS select `tvj`.`nid_viaje` AS `nid_viaje`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`npeso_neto` AS `npeso_neto`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`nstatus` AS `nstatus_v`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ncapacidad` AS `ncapacidad`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tvh`.`crif_empext` AS `crif_empext`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`ncap_carga` AS `ncap_carga`,`ts`.`nactivo` AS `nactivo_s`,`ts`.`nbono_alm` AS `nbono_alm`,`ts`.`nbono_mon` AS `nbono_mon`,`ts`.`nporc_com` AS `nporc_com_s`,`tr`.`cdescripcion` AS `cdescripcion_r`,`tr`.`nporc_com` AS `nporc_com_r`,`tr`.`ncom_pes` AS `ncom_pes`,`tr`.`ncom_med` AS `ncom_med`,`tr`.`ncom_liv` AS `ncom_liv`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nstatus` AS `nstatus_a`,`tan`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha_r`,`trl`.`nstatus` AS `nstatus_r`,(select count(`tanticip_tviaje`.`nid_anticipo`) AS `count(nid_anticipo)` from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_anticipo` = `tan`.`nid_anticipo`)) AS `count_anticipo`,(select count(`tanticip_tviaje`.`nid_viaje`) AS `count(nid_viaje)` from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_viaje` = `tvj`.`nid_viaje`)) AS `count_viaje` from (((((((`tviaje` `tvj` join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `truta` `tr` on(((`tr`.`nid_origen` = `tvj`.`nid_origen`) and (`tr`.`nid_destino` = `tvj`.`nid_destino`)))) join `tanticip_tviaje` `tav` on((`tav`.`nid_viaje` = `tvj`.`nid_viaje`))) join `tanticipo` `tan` on((`tan`.`nid_anticipo` = `tav`.`nid_anticipo`))) left join `trelacion` `trl` on((`trl`.`nid_relacion` = `tan`.`nid_relacion`)));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
