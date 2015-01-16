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
-- Definition of table `tanticipo`
--

DROP TABLE IF EXISTS `tanticipo`;
CREATE TABLE `tanticipo` (
  `nid_anticipo` int(10) unsigned NOT NULL,
  `cnro_recibo` varchar(10) NOT NULL,
  `nmonto` double NOT NULL,
  `nid_viaje` int(10) unsigned NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`nid_anticipo`),
  KEY `FK_tanticipo_tviaje` (`nid_viaje`),
  CONSTRAINT `FK_tanticipo_tviaje` FOREIGN KEY (`nid_viaje`) REFERENCES `tviaje` (`nid_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo`
--

/*!40000 ALTER TABLE `tanticipo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
 (11,'tAnticipo','D','p','2010-06-09 10:31:33','1');
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
  `lactvo` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`cid_chofer`),
  KEY `FK_tchofer_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tchofer`
--

/*!40000 ALTER TABLE `tchofer` DISABLE KEYS */;
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
 ('0101','Puerto Ayacucho','01','P01','2010-02-04 11:02:40'),
 ('0201','Barcelona','02','P01','2010-02-04 11:02:58'),
 ('0301','San Fernando de Apure','03','P01','2010-02-04 11:03:14'),
 ('0401','Maracay','04','P01','2010-02-04 11:03:30'),
 ('0501','Barinas','05','P01','2010-02-04 11:03:48'),
 ('0601','Ciudad Bolívar','06','P01','2010-02-04 11:04:14'),
 ('0701','Valencia','07','P01','2010-02-04 11:04:34'),
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
 ('1702','Acarigua','17','P01','2010-02-04 11:10:41'),
 ('1703','Araure','17','P01','2010-02-04 11:10:50'),
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
-- Definition of table `tdetalle_orden`
--

DROP TABLE IF EXISTS `tdetalle_orden`;
CREATE TABLE `tdetalle_orden` (
  `nid_orden` int(10) unsigned NOT NULL default '0',
  `cid_vehiculo` varchar(10) NOT NULL,
  `cid_servicio` varchar(3) NOT NULL,
  `ncantidad` int(10) unsigned NOT NULL,
  `nprecio` double NOT NULL,
  `ndescuento` double NOT NULL,
  KEY `FK_tdet_ord_torden` (`nid_orden`),
  KEY `FK_tdet_ord_tservicio` (`cid_servicio`),
  KEY `FK_tdet_ord_tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_orden`
--

/*!40000 ALTER TABLE `tdetalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdetalle_orden` ENABLE KEYS */;


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
-- Definition of table `torden_serv`
--

DROP TABLE IF EXISTS `torden_serv`;
CREATE TABLE `torden_serv` (
  `nid_orden` int(10) unsigned NOT NULL default '0',
  `dfecha` date NOT NULL,
  `cfactura` varchar(10) NOT NULL,
  `ntotal` double NOT NULL,
  `crif_emp` varchar(12) default NULL,
  `cnombre_emp` varchar(60) default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  USING BTREE (`nid_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torden_serv`
--

/*!40000 ALTER TABLE `torden_serv` DISABLE KEYS */;
/*!40000 ALTER TABLE `torden_serv` ENABLE KEYS */;


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
  `norigen` int(1) unsigned NOT NULL default '0' COMMENT 'indica si es origen o no',
  PRIMARY KEY  USING BTREE (`nid_origdest`),
  KEY `FK_torigdest_tciudad` (`cid_ciudad`),
  CONSTRAINT `FK_torigdest_tciudad` FOREIGN KEY (`cid_ciudad`) REFERENCES `tciudad` (`cid_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torigen_destino`
--

/*!40000 ALTER TABLE `torigen_destino` DISABLE KEYS */;
INSERT INTO `torigen_destino` (`nid_origdest`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`norigen`) VALUES 
 (1,'desc','0101','p','2010-06-08 10:50:13',1),
 (2,'RRR','0101','P','2010-06-08 11:00:30',1),
 (3,'222','2001','P','2010-06-08 11:07:32',1),
 (4,'SDF','0601','P','2010-06-08 11:08:41',1),
 (5,'TTT','0501','P','2010-06-08 11:15:09',1),
 (6,'SDFKJSDFJ','0801','P','2010-06-08 15:12:05',1);
/*!40000 ALTER TABLE `torigen_destino` ENABLE KEYS */;


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
  `lstatus` tinyint(1) NOT NULL,
  PRIMARY KEY  (`cid_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tperiodo`
--

/*!40000 ALTER TABLE `tperiodo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tperiodo` ENABLE KEYS */;


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
/*!40000 ALTER TABLE `truta` ENABLE KEYS */;


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
  PRIMARY KEY  (`cid_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tservicio`
--

/*!40000 ALTER TABLE `tservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tservicio` ENABLE KEYS */;


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
  PRIMARY KEY  USING BTREE (`nid_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

/*!40000 ALTER TABLE `tsucursal` DISABLE KEYS */;
INSERT INTO `tsucursal` (`nid_sucursal`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`ncap_carga`,`nid_origdest`) VALUES 
 (1,'desc','0101','p','2010-06-08 10:50:13',20,1),
 (2,'RRR','0101','P','2010-06-08 11:00:30',20,2),
 (3,'222','2001','P','2010-06-08 11:07:32',20,3),
 (4,'SDF','0601','P','2010-06-08 11:08:41',20,4),
 (5,'TTT','0501','P','2010-06-08 11:15:09',69,5),
 (6,'SDFKJSDFJ','0801','P','2010-06-08 15:12:05',40,6);
/*!40000 ALTER TABLE `tsucursal` ENABLE KEYS */;


--
-- Definition of trigger `tgSucursal_Origen`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tgSucursal_Origen`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tgSucursal_Origen` BEFORE INSERT ON `tsucursal` FOR EACH ROW Begin
  Insert Into torigen_destino(cDescripcion,cId_Ciudad,cId_Usuario,nOrigen) Values(New.cDescripcion,New.cId_Ciudad,New.cId_Usuario,1);
  SET New.nid_origdest=LAST_INSERT_ID();
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
/*!40000 ALTER TABLE `ttipo_gasto` ENABLE KEYS */;


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
  `cid_chofer` varchar(9) default NULL,
  `ncosto` double default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `npropio` int(1) unsigned NOT NULL,
  `nid_sucursal` int(4) unsigned NOT NULL,
  `nvolumen` double NOT NULL,
  PRIMARY KEY  (`cid_vehiculo`),
  KEY `FK_tvehiculo_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_tvehiculo_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tvehiculo`
--

/*!40000 ALTER TABLE `tvehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvehiculo` ENABLE KEYS */;


--
-- Definition of table `tviaje`
--

DROP TABLE IF EXISTS `tviaje`;
CREATE TABLE `tviaje` (
  `nid_viaje` int(10) unsigned NOT NULL default '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date NOT NULL,
  `cobservacion` text,
  `cguia` varchar(10) default NULL,
  `corden_carga` varchar(10) NOT NULL,
  `dfecha_guia` date default NULL,
  `npeso_neto` double default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nid_origen` int(4) unsigned NOT NULL default '0',
  `nid_destino` int(4) unsigned NOT NULL default '0',
  `cid_periodo` varchar(10) NOT NULL,
  PRIMARY KEY  USING BTREE (`nid_viaje`),
  KEY `FK_tviaje_tchofer` (`cid_chofer`),
  KEY `FK_tviaje_tvehiculo` (`cid_vehiculo`),
  KEY `FK_tviaje_tperiodo` (`cid_periodo`),
  KEY `FK_tviaje_truta` (`nid_origen`,`nid_destino`),
  CONSTRAINT `FK_tviaje_tchofer` FOREIGN KEY (`cid_chofer`) REFERENCES `tchofer` (`cid_chofer`),
  CONSTRAINT `FK_tviaje_tperiodo` FOREIGN KEY (`cid_periodo`) REFERENCES `tperiodo` (`cid_periodo`),
  CONSTRAINT `FK_tviaje_truta` FOREIGN KEY (`nid_origen`, `nid_destino`) REFERENCES `truta` (`nid_origen`, `nid_destino`),
  CONSTRAINT `FK_tviaje_tvehiculo` FOREIGN KEY (`cid_vehiculo`) REFERENCES `tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tviaje`
--

/*!40000 ALTER TABLE `tviaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tviaje` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
