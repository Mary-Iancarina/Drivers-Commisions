-- MySQL dump 10.13  Distrib 5.1.39-ndb-7.0.9, for Win32 (ia32)
--
-- Host: canaima    Database: transportedb
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `fta_driver`
--

DROP TABLE IF EXISTS `fta_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fta_driver` (
  `fta_driver_id` int(11) DEFAULT NULL,
  `value` varchar(30) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fta_vehicle`
--

DROP TABLE IF EXISTS `fta_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fta_vehicle` (
  `fta_vehicle_id` int(11) DEFAULT NULL,
  `value` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `loadcapacity` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tacceso_suc`
--

DROP TABLE IF EXISTS `tacceso_suc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tacceso_suc` (
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `crutaspc` varchar(250) NOT NULL DEFAULT ' ',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid_usuario`,`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tad_org`
--

DROP TABLE IF EXISTS `tad_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tad_org` (
  `ad_org_id` int(11) DEFAULT NULL,
  `value` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `talmacenista`
--

DROP TABLE IF EXISTS `talmacenista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talmacenista` (
  `cid_almacenista` varchar(9) NOT NULL,
  `cnombre` varchar(60) NOT NULL DEFAULT ' ',
  `cficha_nom` varchar(10) NOT NULL DEFAULT '0',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nmontacarguista` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cid_almacenista`),
  KEY `FK_talmacenista_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_talmacenista_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtalmacenista_insert` AFTER INSERT ON `talmacenista` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('talmacenista','I',New.cId_Usuario,now(),new.cid_almacenista);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtalmacenista_update` AFTER UPDATE ON `talmacenista` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('talmacenista','U',New.cId_Usuario,now(),new.cid_almacenista);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtalmacenista_delete` BEFORE DELETE ON `talmacenista` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('talmacenista','D',OLD.cId_Usuario,now(),OLD.cid_almacenista);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tanticip_tviaje`
--

DROP TABLE IF EXISTS `tanticip_tviaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tanticip_tviaje` (
  `nid_anticipo` int(10) unsigned NOT NULL DEFAULT '0',
  `nid_viaje` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid_anticipo`,`nid_viaje`),
  KEY `FK_tanttvj_tviaje` (`nid_viaje`),
  KEY `ix_anticipo` (`nid_anticipo`),
  CONSTRAINT `FK_tanttvj_tanticipo` FOREIGN KEY (`nid_anticipo`) REFERENCES `tanticipo` (`nid_anticipo`),
  CONSTRAINT `FK_tanttvj_tviaje` FOREIGN KEY (`nid_viaje`) REFERENCES `tviaje` (`nid_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tanticipo`
--

DROP TABLE IF EXISTS `tanticipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tanticipo` (
  `nid_anticipo` int(10) unsigned NOT NULL DEFAULT '0',
  `cnro_recibo` varchar(10) DEFAULT ' ',
  `nmonto` double NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cobservacion` text,
  `dfecha` date NOT NULL DEFAULT '1900-01-01',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `nid_relacion` int(10) unsigned DEFAULT NULL,
  `nrelacionado` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_anticipo_ant` int(10) unsigned DEFAULT NULL COMMENT 'Guarda el número de anticipo al cual se está reemplazando.',
  `ncomplemento` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que el anticipo es un complemento, 0: No lo es.',
  `ncajachica` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: No ha pasado a caja chica;  1: Paso a caja chica',
  PRIMARY KEY (`nid_anticipo`),
  KEY `ix_recibo` (`cnro_recibo`),
  KEY `FK_tanticipo_trelacion` (`nid_relacion`),
  CONSTRAINT `FK_tanticipo_trelacion` FOREIGN KEY (`nid_relacion`) REFERENCES `trelacion` (`nid_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtanticipo_insert` AFTER INSERT ON `tanticipo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tAnticipo','I',New.cId_Usuario,now(),cast(new.nid_anticipo as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtanticipo_update` AFTER UPDATE ON `tanticipo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tAnticipo','U',New.cId_Usuario,now(),cast(new.nid_anticipo as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtanticipo_delete` BEFORE DELETE ON `tanticipo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tAnticipo','D',Old.cId_Usuario,now(),cast(Old.nid_anticipo as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbitacora`
--

DROP TABLE IF EXISTS `tbitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbitacora` (
  `nid_bitacora` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctabla` varchar(20) NOT NULL,
  `coperacion` varchar(1) NOT NULL DEFAULT '' COMMENT 'I:Insert   U:Update   D:Delete\r\n',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha` datetime NOT NULL,
  `cregistro` varchar(20) NOT NULL,
  PRIMARY KEY (`nid_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=1138854 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcarga_viaje`
--

DROP TABLE IF EXISTS `tcarga_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcarga_viaje` (
  `ad_org_id` int(11) DEFAULT NULL,
  `cid_sucursal` int(4) DEFAULT NULL,
  `dfecha_carga` date DEFAULT NULL,
  `fta_vehicle_id` int(11) DEFAULT NULL,
  `cid_vehiculo` varchar(10) DEFAULT NULL,
  `fta_driver_id` int(11) DEFAULT NULL,
  `cid_chofer` varchar(12) DEFAULT NULL,
  `isprocessed` tinyint(1) DEFAULT NULL,
  `fta_recordweight_id` int(11) DEFAULT NULL,
  `npeso_neto` double DEFAULT NULL,
  `nid_guia` char(25) DEFAULT NULL,
  KEY `idx_nid_guia` (`nid_guia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tchofer`
--

DROP TABLE IF EXISTS `tchofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tchofer` (
  `cid_chofer` varchar(12) NOT NULL,
  `cnombre` varchar(60) NOT NULL DEFAULT '',
  `ccontraparte` varchar(10) DEFAULT ' ',
  `cficha_nom` varchar(10) DEFAULT ' ',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ncontratado` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fta_driver_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid_chofer`,`nid_sucursal`) USING BTREE,
  KEY `FK_tchofer_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtchofer_insert` AFTER INSERT ON `tchofer` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tChofer','I',New.cId_Usuario,now(),new.cid_chofer);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtchofer_update` AFTER UPDATE ON `tchofer` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tChofer','U',New.cId_Usuario,now(),new.cid_chofer);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtchofer_delete` BEFORE DELETE ON `tchofer` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tChofer','D',OLD.cId_Usuario,now(),OLD.cid_chofer);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tciudad`
--

DROP TABLE IF EXISTS `tciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tciudad` (
  `cid_ciudad` varchar(4) NOT NULL DEFAULT '',
  `cdescripcion` varchar(60) NOT NULL,
  `cid_estado` varchar(2) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid_ciudad`),
  KEY `FK_tciudad_testado` (`cid_estado`),
  CONSTRAINT `FK_tciudad_testado` FOREIGN KEY (`cid_estado`) REFERENCES `testado` (`cid_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtciudad_insert` AFTER INSERT ON `tciudad` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tCiudad','I',New.cId_Usuario,now(),new.cid_ciudad);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtciudad_update` AFTER UPDATE ON `tciudad` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tCiudad','U',New.cId_Usuario,now(),new.cid_ciudad);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtciudad_delete` BEFORE DELETE ON `tciudad` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tCiudad','D',OLD.cId_Usuario,now(),OLD.cid_ciudad);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tcliente`
--

DROP TABLE IF EXISTS `tcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcliente` (
  `crif` varchar(12) NOT NULL,
  `cnombre` varchar(45) NOT NULL,
  `cdireccion` varchar(200) DEFAULT '',
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`crif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcomision_choferes`
--

DROP TABLE IF EXISTS `tcomision_choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcomision_choferes` (
  `nid_viaje` int(10) unsigned NOT NULL,
  `cid_periodo` varchar(10) NOT NULL,
  `nporc_com` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '% de comisión de la ruta.',
  `ntabulador` double NOT NULL DEFAULT '0' COMMENT 'tabulador de viaje para el tipo de vehículo en la ruta.',
  PRIMARY KEY (`nid_viaje`,`cid_periodo`),
  UNIQUE KEY `Ix_com_chof` (`nid_viaje`,`cid_periodo`),
  CONSTRAINT `FK_tcomchof_tviaje` FOREIGN KEY (`nid_viaje`) REFERENCES `tviaje` (`nid_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tconfig`
--

DROP TABLE IF EXISTS `tconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tconfig` (
  `ccompania` varchar(60) NOT NULL DEFAULT ' ' COMMENT 'Código de la compañia en el sistema de nómina (SPI). Actualmente 01',
  `nbono_base` double NOT NULL DEFAULT '0' COMMENT 'Bono base para efectuar el cálculo de las comisiones de jefe de almacen y montacarguista.',
  `ndias` int(2) unsigned NOT NULL DEFAULT '0',
  `npeso_min_liv1` double NOT NULL DEFAULT '0' COMMENT 'Peso minimo que se reconoce a ls vehiculos livianos para efectos del calculo de comisiones del chofer.',
  `npeso_min_med1` double NOT NULL DEFAULT '0' COMMENT 'Peso minimo que se reconoce a ls vehiculos medianos para efectos del calculo de comisiones del chofer.',
  `npeso_min_pes1` double NOT NULL DEFAULT '0' COMMENT 'Peso minimo que se reconoce a ls vehiculos pesados para efectos del calculo de comisiones del chofer.',
  `ncentro` int(10) DEFAULT NULL,
  `ccaja` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcorrelativo`
--

DROP TABLE IF EXISTS `tcorrelativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcorrelativo` (
  `nid_sucursal` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `nid_anticipo` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `nid_viaje` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `nid_relacion` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `nid_gasto` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdetalle_carga`
--

DROP TABLE IF EXISTS `tdetalle_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdetalle_carga` (
  `nid_viaje` int(14) NOT NULL,
  `corden_carga` char(25) NOT NULL,
  `cguia` char(25) NOT NULL,
  `dfecha_guia` date NOT NULL,
  `npeso_neto` double NOT NULL,
  `blogico` tinyint(1) DEFAULT '0',
  KEY `idx_corden_carga` (`corden_carga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdetalle_carga_20150423`
--

DROP TABLE IF EXISTS `tdetalle_carga_20150423`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdetalle_carga_20150423` (
  `nid_viaje` int(14) NOT NULL,
  `corden_carga` varchar(64) NOT NULL,
  `cguia` varchar(64) NOT NULL,
  `dfecha_guia` date NOT NULL,
  `npeso_neto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdetalle_gasto`
--

DROP TABLE IF EXISTS `tdetalle_gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdetalle_gasto` (
  `nid_gasto` int(10) unsigned NOT NULL DEFAULT '0',
  `cid_vehiculo` varchar(10) NOT NULL,
  `cid_servicio` varchar(3) NOT NULL,
  `ntotal` double NOT NULL DEFAULT '0',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0',
  KEY `FK_tdet_gast_tgasto` (`nid_gasto`),
  KEY `FK_tdet_gast_tservicio` (`cid_servicio`),
  KEY `FK_tdet_gast_tvehic` (`cid_vehiculo`,`nid_sucursal_v`),
  CONSTRAINT `FK_tdet_gast_tgasto` FOREIGN KEY (`nid_gasto`) REFERENCES `tgasto_serv` (`nid_gasto`),
  CONSTRAINT `FK_tdet_gast_tservicio` FOREIGN KEY (`cid_servicio`) REFERENCES `tservicio` (`cid_servicio`),
  CONSTRAINT `FK_tdet_gast_tvehic` FOREIGN KEY (`cid_vehiculo`, `nid_sucursal_v`) REFERENCES `tvehiculo` (`cid_vehiculo`, `nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdetalle_relacion`
--

DROP TABLE IF EXISTS `tdetalle_relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdetalle_relacion` (
  `nid_relacion` int(10) unsigned NOT NULL,
  `cid_tipogasto` varchar(2) NOT NULL,
  `nmonto` double NOT NULL,
  KEY `ix_relacion` (`nid_relacion`),
  KEY `FK_tdet_rel_ttipogasto` (`cid_tipogasto`),
  CONSTRAINT `FK_tdet_rel_trelacion` FOREIGN KEY (`nid_relacion`) REFERENCES `trelacion` (`nid_relacion`),
  CONSTRAINT `FK_tdet_rel_ttipogasto` FOREIGN KEY (`cid_tipogasto`) REFERENCES `ttipo_gasto` (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testado`
--

DROP TABLE IF EXISTS `testado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testado` (
  `cid_estado` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL DEFAULT '',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtestado_insert` AFTER INSERT ON `testado` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tEstado','I',New.cId_Usuario,now(),new.cid_estado);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtestado_update` AFTER UPDATE ON `testado` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tEstado','U',New.cId_Usuario,now(),new.cid_estado);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtestado_delete` BEFORE DELETE ON `testado` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tEstado','D',OLD.cId_Usuario,now(),OLD.cid_estado);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tgasto_serv`
--

DROP TABLE IF EXISTS `tgasto_serv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgasto_serv` (
  `nid_gasto` int(10) unsigned NOT NULL DEFAULT '0',
  `dfecha` date NOT NULL,
  `cfactura` varchar(10) NOT NULL DEFAULT ' ',
  `ntotal` double NOT NULL DEFAULT '0',
  `crif_emp` varchar(12) DEFAULT ' ',
  `cnombre_emp` varchar(60) DEFAULT ' ',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cobservacion` text,
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:Normal, 2:Contabilizado',
  `dfecha_fact` date DEFAULT NULL,
  `corigen` varchar(45) DEFAULT NULL,
  `ncontrol` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`nid_gasto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtgasto_serv_insert` AFTER INSERT ON `tgasto_serv` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgasto_serv','I',New.cId_Usuario,now(),cast(new.nid_gasto as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtgasto_serv_update` AFTER UPDATE ON `tgasto_serv` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgasto_serv','U',New.cId_Usuario,now(),cast(new.nid_gasto as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtgasto_serv_delete` BEFORE DELETE ON `tgasto_serv` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgasto_serv','D',Old.cId_Usuario,now(),cast(Old.nid_gasto as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tgrupo_servicio`
--

DROP TABLE IF EXISTS `tgrupo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgrupo_servicio` (
  `cid_grupo` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL,
  PRIMARY KEY (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtgrupo_servicio_insert` AFTER INSERT ON `tgrupo_servicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgrupo_servicio','I',New.cId_Usuario,now(),new.cid_grupo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtgrupo_servicio_update` AFTER UPDATE ON `tgrupo_servicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgrupo_servicio','U',New.cId_Usuario,now(),new.cid_grupo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtgrupo_servicio_delete` BEFORE DELETE ON `tgrupo_servicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tgrupo_servicio','D',OLD.cId_Usuario,now(),OLD.cid_grupo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `torigen_destino`
--

DROP TABLE IF EXISTS `torigen_destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torigen_destino` (
  `nid_origdest` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_ciudad` varchar(4) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `norigen` tinyint(1) unsigned NOT NULL,
  `nsucursal` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`nid_origdest`) USING BTREE,
  KEY `FK_torigdest_tciudad` (`cid_ciudad`),
  CONSTRAINT `FK_torigdest_tciudad` FOREIGN KEY (`cid_ciudad`) REFERENCES `tciudad` (`cid_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtorigen_destino_insert` AFTER INSERT ON `torigen_destino` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('torigen_destino','I',New.cId_Usuario,now(),cast(new.nid_origdest as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtorigen_destino_update` AFTER UPDATE ON `torigen_destino` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('torigen_destino','U',New.cId_Usuario,now(),cast(new.nid_origdest as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtorigen_destino_delete` BEFORE DELETE ON `torigen_destino` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('torigen_destino','D',Old.cId_Usuario,now(),cast(Old.nid_origdest as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tperiodo`
--

DROP TABLE IF EXISTS `tperiodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tperiodo` (
  `cid_periodo` varchar(10) NOT NULL,
  `dfecha_desde` date NOT NULL,
  `dfecha_hasta` date NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nstatus` tinyint(1) NOT NULL DEFAULT '0',
  `nticket_cesta` double NOT NULL DEFAULT '0',
  `ndias_feriados` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtperiodo_insert` AFTER INSERT ON `tperiodo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tPeriodo','I',New.cId_Usuario,now(),new.cid_periodo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtperiodo_update` AFTER UPDATE ON `tperiodo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tperiodo','U',New.cId_Usuario,now(),new.cid_periodo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtperiodo_delete` BEFORE DELETE ON `tperiodo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tperiodo','D',OLD.cId_Usuario,now(),OLD.cid_periodo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tproveedor`
--

DROP TABLE IF EXISTS `tproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tproveedor` (
  `cid_proveedor` varchar(12) DEFAULT NULL,
  `cnombre` varchar(60) DEFAULT NULL,
  `crif` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trelacion`
--

DROP TABLE IF EXISTS `trelacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trelacion` (
  `nid_relacion` int(10) unsigned NOT NULL DEFAULT '0',
  `dfecha` date NOT NULL DEFAULT '1900-01-01',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cobservacion` text,
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal, 2: Contabilizado',
  PRIMARY KEY (`nid_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtrelacion_insert` AFTER INSERT ON `trelacion` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tRelacion','I',New.cId_Usuario,now(),cast(new.nid_relacion as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtrelacion_update` AFTER UPDATE ON `trelacion` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('trelacion','U',New.cId_Usuario,now(),cast(new.nid_relacion as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtrelacion_delete` BEFORE DELETE ON `trelacion` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('trelacion','D',Old.cId_Usuario,now(),cast(Old.nid_relacion as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `truta`
--

DROP TABLE IF EXISTS `truta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truta` (
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `ndistancia` double NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdescripcion` varchar(60) NOT NULL DEFAULT ' ',
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nporc_com` int(3) unsigned NOT NULL DEFAULT '0',
  `ncom_pes` double NOT NULL DEFAULT '0',
  `ncom_med` double NOT NULL DEFAULT '0',
  `ncom_liv` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid_origen`,`nid_destino`),
  KEY `FK_truta_tdestino` (`nid_destino`),
  KEY `FK_truta_torigen` (`nid_origen`),
  CONSTRAINT `FK_truta_tdestino` FOREIGN KEY (`nid_destino`) REFERENCES `torigen_destino` (`nid_origdest`),
  CONSTRAINT `FK_truta_torigen` FOREIGN KEY (`nid_origen`) REFERENCES `torigen_destino` (`nid_origdest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtruta_insert` AFTER INSERT ON `truta` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('truta','I',New.cId_Usuario,now(),concat(cast(new.nid_origen as char),cast(new.nid_destino as char)));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtruta_update` AFTER UPDATE ON `truta` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('truta','U',New.cId_Usuario,now(),concat(cast(new.nid_origen as char),cast(new.nid_destino as char)));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tservicio`
--

DROP TABLE IF EXISTS `tservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tservicio` (
  `cid_servicio` varchar(3) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_grupo` varchar(2) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL DEFAULT ' ',
  `cdescrip_cta` varchar(60) NOT NULL DEFAULT ' ',
  `ncontabiliza` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid_servicio`),
  KEY `FK_tservicio_tgrupo_s` (`cid_grupo`),
  CONSTRAINT `FK_tservicio_tgrupo_s` FOREIGN KEY (`cid_grupo`) REFERENCES `tgrupo_servicio` (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtservicio_insert` AFTER INSERT ON `tservicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tservicio','I',New.cId_Usuario,now(),new.cid_servicio);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtservicio_update` AFTER UPDATE ON `tservicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tservicio','U',New.cId_Usuario,now(),new.cid_servicio);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtservicio_delete` BEFORE DELETE ON `tservicio` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tservicio','D',OLD.cId_Usuario,now(),OLD.cid_servicio);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tsucursal`
--

DROP TABLE IF EXISTS `tsucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsucursal` (
  `nid_sucursal` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_ciudad` varchar(4) NOT NULL DEFAULT '',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ncap_carga` double NOT NULL DEFAULT '0',
  `nid_origdest` int(4) DEFAULT '0',
  `nactivo` tinyint(1) unsigned DEFAULT '0',
  `nbono_alm` double(7,4) DEFAULT '0.0000' COMMENT 'Incentivo por carga total despachada en el mes para el jefe de almacen',
  `nbono_mon` double(7,4) DEFAULT '0.0000' COMMENT 'Incentivo por carga total despachada en el mes para el montacarguista',
  `nporc_com` int(3) unsigned DEFAULT '0' COMMENT 'Porcentaje de capacidad de carga a partir del cual se paga comisión al jefe de almacen y montacarguista',
  `cconcepto_com` varchar(4) DEFAULT '' COMMENT 'Código del concepto de las comisiones para los choferes.\r\n',
  `casignacion_com` varchar(4) DEFAULT NULL COMMENT 'Código del concepto de las asignaciones para los choferes.',
  `cdeduccion_com` varchar(4) DEFAULT NULL COMMENT 'Código del concepto de las deducciones para los choferes.',
  `npeso_min_liv` double DEFAULT '0' COMMENT 'Peso minimo que se reconoce a ls vehiculos livianos para efectos del calculo de comisiones del chofer.',
  `npeso_min_med` double DEFAULT '0' COMMENT 'Peso minimo que se reconoce a ls vehiculos medianos para efectos del calculo de comisiones del chofer.',
  `npeso_min_pes` double DEFAULT '0' COMMENT 'Peso minimo que se reconoce a ls vehiculos pesados para efectos del calculo de comisiones del chofer.',
  `ad_org_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtSucursal_tOrigen_Insert` BEFORE INSERT ON `tsucursal` FOR EACH ROW Begin
  Insert Into torigen_destino(cDescripcion,cId_Ciudad,cId_Usuario,nOrigen,nactivo,nsucursal) Values(New.cDescripcion,New.cId_Ciudad,New.cId_Usuario,1,new.nactivo,1);
  SET New.nid_origdest=LAST_INSERT_ID();
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtsucursal_insert` AFTER INSERT ON `tsucursal` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tsucursal','I',New.cId_Usuario,now(),cast(new.nid_sucursal as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtSucursal_tOrigen_Update` BEFORE UPDATE ON `tsucursal` FOR EACH ROW Begin
  update torigen_destino set cDescripcion = New.cDescripcion,cId_Ciudad = New.cId_Ciudad,cId_Usuario = New.cId_Usuario, nactivo = new.nactivo where nid_origdest = new.nid_origdest;
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtsucursal_update` AFTER UPDATE ON `tsucursal` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tsucursal','U',New.cId_Usuario,now(),cast(new.nid_sucursal as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtsucursal_delete` BEFORE DELETE ON `tsucursal` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tsucursal','D',Old.cId_Usuario,now(),cast(Old.nid_sucursal as char));
  update torigen_destino set cId_Usuario = old.cId_Usuario, nactivo = 0 where nid_origdest = old.nid_origdest;
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tsucursal_org`
--

DROP TABLE IF EXISTS `tsucursal_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsucursal_org` (
  `nid_sucursal` int(11) NOT NULL,
  `ad_org_id` int(11) NOT NULL,
  PRIMARY KEY (`nid_sucursal`,`ad_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttipo_gasto`
--

DROP TABLE IF EXISTS `ttipo_gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttipo_gasto` (
  `cid_tipogasto` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL DEFAULT ' ',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL DEFAULT ' ',
  `cdescrip_cta` varchar(60) NOT NULL,
  PRIMARY KEY (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgttipo_gasto_insert` AFTER INSERT ON `ttipo_gasto` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttipo_gasto','I',New.cId_Usuario,now(),new.cid_tipogasto);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgttipo_gasto_update` AFTER UPDATE ON `ttipo_gasto` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttipo_gasto','U',New.cId_Usuario,now(),new.cid_tipogasto);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgttipo_gasto_delete` BEFORE DELETE ON `ttipo_gasto` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttipo_gasto','D',OLD.cId_Usuario,now(),OLD.cid_tipogasto);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ttransporte_ext`
--

DROP TABLE IF EXISTS `ttransporte_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttransporte_ext` (
  `crif` varchar(15) NOT NULL DEFAULT ' ',
  `cnombre` varchar(60) NOT NULL DEFAULT ' ',
  `nporc_ret` double DEFAULT '0' COMMENT 'Porcentaje de retencion de iva',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nactivo` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`crif`,`nid_sucursal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgttransporte_ext_insert` AFTER INSERT ON `ttransporte_ext` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttransporte_ext','I',New.cId_Usuario,now(),new.crif);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgttransporte_ext_update` AFTER UPDATE ON `ttransporte_ext` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttransporte_ext','U',New.cId_Usuario,now(),new.crif);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtttransporte_ext_delete` BEFORE DELETE ON `ttransporte_ext` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('ttransporte_ext','D',OLD.cId_Usuario,now(),OLD.crif);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tusuario`
--

DROP TABLE IF EXISTS `tusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusuario` (
  `cid_usuario` varchar(20) NOT NULL,
  `cnombre` varchar(45) NOT NULL,
  `cclave` varchar(10) NOT NULL DEFAULT '0',
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmalmacenistas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmanticipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmcargar_anticipo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmcargar_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmcargar_viaje_ext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmchoferes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmciudades` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmestados` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmgasto_servicio` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmgrupos_serv` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmmontacarguistas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmorigendestinos` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmperiodos` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmrelacion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmrutas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmservicios` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmsucursales` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmtipo_gastos` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmtransp_ext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmusuarios` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmvehiculos` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nfrmviajes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ncerrar_periodos` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nmov_fperiodo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nanular` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Anular documentos (Anticipos, Relaciones, Gastos por Servicio)',
  `nrep_com` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Reportes de comisiones',
  `ncalc_com` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Calcular comisiones',
  `nconfig` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Configuración del sistema',
  `codbc_oracle` varchar(45) DEFAULT '',
  PRIMARY KEY (`cid_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtusuario_insert` AFTER INSERT ON `tusuario` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tusuario','I',New.cId_Usuario,now(),new.cid_usuario);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtusuario_update` AFTER UPDATE ON `tusuario` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tusuario','U',New.cId_Usuario,now(),new.cid_usuario);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtusuario_delete` BEFORE DELETE ON `tusuario` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tusuario','D',OLD.cId_Usuario,now(),OLD.cid_usuario);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tvehiculo`
--

DROP TABLE IF EXISTS `tvehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvehiculo` (
  `cid_vehiculo` varchar(10) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL DEFAULT ' ',
  `cmarca` varchar(30) DEFAULT ' ',
  `cserial_motor` varchar(30) DEFAULT ' ',
  `cserial_carroc` varchar(30) DEFAULT ' ',
  `ntara` double DEFAULT '0' COMMENT 'Peso del vehículo vacio',
  `ncapacidad` double DEFAULT '0' COMMENT 'Capacidad de carga del vehículo. (Peso neto de la carga)',
  `ctipo_vehic` int(1) unsigned DEFAULT '0' COMMENT '1:Liviano (<13Ton),  2:Mediano (13Ton<=X<=25Ton),  3:Pesado(>25Ton)',
  `ncosto` double DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `npropio` int(1) unsigned NOT NULL DEFAULT '0',
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  `crif_empext` varchar(15) DEFAULT ' ' COMMENT 'Empresa transportista, en caso de que el vehículo sea contratado',
  `fta_vehicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid_vehiculo`,`nid_sucursal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtvehiculo_insert` AFTER INSERT ON `tvehiculo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tvehiculo','I',New.cId_Usuario,now(),new.cid_vehiculo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtvehiculo_update` AFTER UPDATE ON `tvehiculo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tvehiculo','U',New.cId_Usuario,now(),new.cid_vehiculo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtvehiculo_delete` BEFORE DELETE ON `tvehiculo` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tvehiculo','D',OLD.cId_Usuario,now(),OLD.cid_vehiculo);
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tviaje`
--

DROP TABLE IF EXISTS `tviaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tviaje` (
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(30) DEFAULT ' ',
  `corden_carga` varchar(30) DEFAULT ' ',
  `dfecha_guia` date DEFAULT '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double DEFAULT '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_periodo` varchar(10) NOT NULL DEFAULT ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned DEFAULT '0',
  `ndistancia` double DEFAULT '0',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) DEFAULT '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) DEFAULT ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  `npeso_com` double DEFAULT '0' COMMENT 'Peso a comisionar',
  `crif_cliente` varchar(12) DEFAULT NULL COMMENT 'Rif del cliente Externo',
  `nprincipal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que es el primer viaje;  0: Viaje secundario o retornos',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el viaje',
  PRIMARY KEY (`nid_viaje`) USING BTREE,
  KEY `FK_tviaje_tperiodo` (`cid_periodo`),
  KEY `FK_tviaje_truta` (`nid_origen`,`nid_destino`),
  KEY `ix_orden_c` (`corden_carga`),
  KEY `ix_fact_ext` (`cfactura_ext`),
  KEY `FK_tviaje_tchofer` (`cid_chofer`,`nid_sucursal_c`),
  KEY `FK_tviaje_tvehiculo` (`cid_vehiculo`,`nid_sucursal_v`),
  CONSTRAINT `FK_tviaje_tchofer` FOREIGN KEY (`cid_chofer`, `nid_sucursal_c`) REFERENCES `tchofer` (`cid_chofer`, `nid_sucursal`),
  CONSTRAINT `FK_tviaje_tperiodo` FOREIGN KEY (`cid_periodo`) REFERENCES `tperiodo` (`cid_periodo`),
  CONSTRAINT `FK_tviaje_truta` FOREIGN KEY (`nid_origen`, `nid_destino`) REFERENCES `truta` (`nid_origen`, `nid_destino`),
  CONSTRAINT `FK_tviaje_tvehiculo` FOREIGN KEY (`cid_vehiculo`, `nid_sucursal_v`) REFERENCES `tvehiculo` (`cid_vehiculo`, `nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtviaje_insert` AFTER INSERT ON `tviaje` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tviaje','I',New.cId_Usuario,now(),cast(new.nid_viaje as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtviaje_update` AFTER UPDATE ON `tviaje` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tviaje','U',New.cId_Usuario,now(),cast(new.nid_viaje as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgtviaje_delete` BEFORE DELETE ON `tviaje` FOR EACH ROW Begin
  Insert Into tbitacora(ctabla,coperacion,cid_usuario,dfecha,cregistro) Values('tviaje','D',Old.cId_Usuario,now(),cast(Old.nid_viaje as char));
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tviaje_20150423`
--

DROP TABLE IF EXISTS `tviaje_20150423`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tviaje_20150423` (
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(30) DEFAULT ' ',
  `corden_carga` varchar(30) DEFAULT ' ',
  `dfecha_guia` date DEFAULT '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double DEFAULT '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_periodo` varchar(10) NOT NULL DEFAULT ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned DEFAULT '0',
  `ndistancia` double DEFAULT '0',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) DEFAULT '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) DEFAULT ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  `npeso_com` double DEFAULT '0' COMMENT 'Peso a comisionar',
  `crif_cliente` varchar(12) DEFAULT NULL COMMENT 'Rif del cliente Externo',
  `nprincipal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que es el primer viaje;  0: Viaje secundario o retornos',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el viaje'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tviaje_201504231546`
--

DROP TABLE IF EXISTS `tviaje_201504231546`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tviaje_201504231546` (
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(30) DEFAULT ' ',
  `corden_carga` varchar(30) DEFAULT ' ',
  `dfecha_guia` date DEFAULT '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double DEFAULT '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_periodo` varchar(10) NOT NULL DEFAULT ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned DEFAULT '0',
  `ndistancia` double DEFAULT '0',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) DEFAULT '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) DEFAULT ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  `npeso_com` double DEFAULT '0' COMMENT 'Peso a comisionar',
  `crif_cliente` varchar(12) DEFAULT NULL COMMENT 'Rif del cliente Externo',
  `nprincipal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que es el primer viaje;  0: Viaje secundario o retornos',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el viaje'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tviaje_201504231832`
--

DROP TABLE IF EXISTS `tviaje_201504231832`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tviaje_201504231832` (
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(30) DEFAULT ' ',
  `corden_carga` varchar(30) DEFAULT ' ',
  `dfecha_guia` date DEFAULT '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double DEFAULT '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_periodo` varchar(10) NOT NULL DEFAULT ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned DEFAULT '0',
  `ndistancia` double DEFAULT '0',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) DEFAULT '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) DEFAULT ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  `npeso_com` double DEFAULT '0' COMMENT 'Peso a comisionar',
  `crif_cliente` varchar(12) DEFAULT NULL COMMENT 'Rif del cliente Externo',
  `nprincipal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que es el primer viaje;  0: Viaje secundario o retornos',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el viaje'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tviaje_201504241451`
--

DROP TABLE IF EXISTS `tviaje_201504241451`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tviaje_201504241451` (
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(30) DEFAULT ' ',
  `corden_carga` varchar(30) DEFAULT ' ',
  `dfecha_guia` date DEFAULT '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double DEFAULT '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_periodo` varchar(10) NOT NULL DEFAULT ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned DEFAULT '0',
  `ndistancia` double DEFAULT '0',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) DEFAULT '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) DEFAULT ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  `npeso_com` double DEFAULT '0' COMMENT 'Peso a comisionar',
  `crif_cliente` varchar(12) DEFAULT NULL COMMENT 'Rif del cliente Externo',
  `nprincipal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que es el primer viaje;  0: Viaje secundario o retornos',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el viaje'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tviaje_backup`
--

DROP TABLE IF EXISTS `tviaje_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tviaje_backup` (
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(30) DEFAULT ' ',
  `corden_carga` varchar(30) DEFAULT ' ',
  `dfecha_guia` date DEFAULT '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double DEFAULT '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_periodo` varchar(10) NOT NULL DEFAULT ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned DEFAULT '0',
  `ndistancia` double DEFAULT '0',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) DEFAULT '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) DEFAULT ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  `npeso_com` double DEFAULT '0' COMMENT 'Peso a comisionar',
  `crif_cliente` varchar(12) DEFAULT NULL COMMENT 'Rif del cliente Externo',
  `nprincipal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que es el primer viaje;  0: Viaje secundario o retornos',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el viaje'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tviaje_backup_23042015`
--

DROP TABLE IF EXISTS `tviaje_backup_23042015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tviaje_backup_23042015` (
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(30) DEFAULT ' ',
  `corden_carga` varchar(30) DEFAULT ' ',
  `dfecha_guia` date DEFAULT '1900-01-01' COMMENT 'si el tipo de viaje es 1:interno, se guarda la fecha de la guia, si el tipo de viaje es 2:externo, se guarda la fecha de la factura.',
  `npeso_neto` double DEFAULT '0' COMMENT 'si el tipo de viaje es 1:interno, se guarda el peso neto de la guia, si el tipo de viaje es 2:externo, se guarda el peso neto de la factura.',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nid_origen` int(4) unsigned NOT NULL DEFAULT '0',
  `nid_destino` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_periodo` varchar(10) NOT NULL DEFAULT ' ',
  `ntipo_viaje` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Internos de la empresa. 2: Viajes Externos, 3: Viajes Contratados\r\n',
  `nid_sucursal_guia` int(4) unsigned DEFAULT '0',
  `ndistancia` double DEFAULT '0',
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal,  2:Procesado,  3:Anulado',
  `cfactura_ext` varchar(10) DEFAULT '' COMMENT 'Si el tipo de viaje es externo se guarda el numero de la factura de la mercancia transportada en el viaje externo',
  `ccliente_ext` varchar(45) DEFAULT ' ' COMMENT 'Si el tipo de viaje es externo se guarda el nombre del cliente de la factura correspondiente al viaje externo',
  `nid_sucursal_c` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el chofer',
  `nid_sucursal_v` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el vehiculo',
  `npeso_com` double DEFAULT '0' COMMENT 'Peso a comisionar',
  `crif_cliente` varchar(12) DEFAULT NULL COMMENT 'Rif del cliente Externo',
  `nprincipal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Indica que es el primer viaje;  0: Viaje secundario o retornos',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Sucursal a la que pertenece el viaje'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `vw_anticipos`
--

DROP TABLE IF EXISTS `vw_anticipos`;
/*!50001 DROP VIEW IF EXISTS `vw_anticipos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_anticipos` (
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `nmonto` double,
  `cid_usuario` varchar(20),
  `dfecha_act` timestamp,
  `cobservacion` text,
  `dfecha` date,
  `nstatus` tinyint(1) unsigned,
  `nid_relacion` int(10) unsigned,
  `nrelacionado` tinyint(1) unsigned,
  `nid_sucursal` int(4) unsigned,
  `nid_anticipo_ant` int(10) unsigned,
  `nid_viaje` int(14) unsigned,
  `cid_chofer` varchar(9),
  `nid_sucursal_c` int(4) unsigned,
  `cid_vehiculo` varchar(10),
  `nid_sucursal_v` int(4) unsigned,
  `dfecha_v` date,
  `corden_carga` varchar(30),
  `cguia` varchar(30),
  `dfecha_guia` date,
  `npeso_com` double,
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
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_choferes`
--

DROP TABLE IF EXISTS `vw_choferes`;
/*!50001 DROP VIEW IF EXISTS `vw_choferes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_choferes` (
  `cid_chofer` varchar(12),
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
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_comision_choferes`
--

DROP TABLE IF EXISTS `vw_comision_choferes`;
/*!50001 DROP VIEW IF EXISTS `vw_comision_choferes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_comision_choferes` (
  `nid_viaje` int(10) unsigned,
  `cid_periodo` varchar(10),
  `nporc_com` int(3) unsigned,
  `ntabulador` double,
  `cid_chofer` varchar(9),
  `cid_vehiculo` varchar(10),
  `dfecha_v` date,
  `cguia` varchar(30),
  `corden_carga` varchar(30),
  `dfecha_guia` date,
  `npeso_com` double,
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
  `cdescripcion_s` varchar(60),
  `cconcepto_com` varchar(4),
  `casignacion_com` varchar(4),
  `cdeduccion_com` varchar(4),
  `ncap_carga` double,
  `nactivo_s` tinyint(1) unsigned,
  `nbono_alm` double(7,4),
  `nbono_mon` double(7,4),
  `nporc_com_s` int(3) unsigned,
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `nmonto_a` double,
  `dfecha_a` date,
  `nstatus_a` tinyint(1) unsigned,
  `nid_relacion` int(10) unsigned,
  `dfecha_r` date,
  `nstatus_r` tinyint(1) unsigned,
  `cdescripcion_r` varchar(60),
  `cdescripcion_o` varchar(60),
  `cdescripcion_p` varchar(60),
  `dfecha_desde` date,
  `dfecha_hasta` date,
  `nticket_cesta` double,
  `ndias_feriados` int(2) unsigned,
  `nmonto_com` double,
  `nmonto_r` double,
  `cdescripcion_d` varchar(60),
  `nmonto_ta` double,
  `ncount_viaje` bigint(21),
  `ncount_anticipo` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_enc_relaciones`
--

DROP TABLE IF EXISTS `vw_enc_relaciones`;
/*!50001 DROP VIEW IF EXISTS `vw_enc_relaciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_enc_relaciones` (
  `nid_relacion` int(10) unsigned,
  `dfecha` date,
  `cid_usuario` varchar(20),
  `dfecha_act` timestamp,
  `cobservacion` text,
  `nstatus` tinyint(1) unsigned,
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `dfecha_a` date,
  `nmonto_a` double,
  `nid_sucursal` int(4) unsigned,
  `nid_anticipo_ant` int(10) unsigned,
  `nstatus_a` tinyint(1) unsigned,
  `nid_viaje` int(14) unsigned,
  `dfecha_v` date,
  `cid_chofer` varchar(9),
  `nid_sucursal_c` int(4) unsigned,
  `cid_vehiculo` varchar(10),
  `nid_sucursal_v` int(4) unsigned,
  `cguia` varchar(30),
  `dfecha_guia` date,
  `npeso_com` double,
  `nid_sucursal_guia` int(4) unsigned,
  `nid_origen` int(4) unsigned,
  `nid_destino` int(4) unsigned,
  `ndistancia` double,
  `cid_periodo` varchar(10),
  `ntipo_viaje` tinyint(1) unsigned,
  `cfactura_ext` varchar(10),
  `ccliente_ext` varchar(45),
  `cdescripcion_v` varchar(60),
  `nactivo_v` tinyint(1) unsigned,
  `cnombre` varchar(60),
  `nactivo_c` tinyint(1) unsigned,
  `cdescripcion_s` varchar(60),
  `cdescripcion_o` varchar(60),
  `cdescripcion_d` varchar(60),
  `nmonto_tr` double,
  `nmonto_ta` double,
  `ncount_viaje` bigint(21),
  `ncount_anticipo` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_gasto_serv`
--

DROP TABLE IF EXISTS `vw_gasto_serv`;
/*!50001 DROP VIEW IF EXISTS `vw_gasto_serv`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_gasto_serv` (
  `cid_vehiculo` varchar(10),
  `nid_sucursal` int(4) unsigned,
  `cdescripcion` varchar(60),
  `cmarca` varchar(30),
  `cserial_motor` varchar(30),
  `cserial_carroc` varchar(30),
  `ntara` double,
  `ncapacidad` double,
  `ctipo_vehic` int(1) unsigned,
  `npropio` int(1) unsigned,
  `nactivo` tinyint(1) unsigned,
  `nid_gasto` int(10) unsigned,
  `dfecha` date,
  `crif_emp` varchar(12),
  `cfactura` varchar(10),
  `ntotal_gs` double,
  `nstatus_gs` tinyint(1) unsigned,
  `cid_servicio` varchar(3),
  `ntotal_dg` double,
  `cdescripcion_sv` varchar(60),
  `ccta_cont` varchar(10),
  `cdescrip_cta` varchar(60),
  `ncontabiliza` tinyint(1) unsigned,
  `cid_grupo` varchar(2),
  `cdescripcion_g` varchar(60),
  `cdescripcion_s` varchar(60)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_relaciones`
--

DROP TABLE IF EXISTS `vw_relaciones`;
/*!50001 DROP VIEW IF EXISTS `vw_relaciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_relaciones` (
  `nid_relacion` int(10) unsigned,
  `dfecha` date,
  `cid_usuario` varchar(20),
  `dfecha_act` timestamp,
  `cobservacion` text,
  `nstatus` tinyint(1) unsigned,
  `cid_tipogasto` varchar(2),
  `nmonto` double,
  `cdescripcion_g` varchar(60),
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `dfecha_a` date,
  `nmonto_a` double,
  `nid_sucursal` int(4) unsigned,
  `nid_anticipo_ant` int(10) unsigned,
  `nstatus_a` tinyint(1) unsigned,
  `nid_viaje` int(14) unsigned,
  `dfecha_v` date,
  `cid_chofer` varchar(9),
  `nid_sucursal_c` int(4) unsigned,
  `cid_vehiculo` varchar(10),
  `nid_sucursal_v` int(4) unsigned,
  `cguia` varchar(30),
  `dfecha_guia` date,
  `npeso_com` double,
  `nid_sucursal_guia` int(4) unsigned,
  `nid_origen` int(4) unsigned,
  `nid_destino` int(4) unsigned,
  `ndistancia` double,
  `cid_periodo` varchar(10),
  `ntipo_viaje` tinyint(1) unsigned,
  `cfactura_ext` varchar(10),
  `ccliente_ext` varchar(45),
  `cdescripcion_v` varchar(60),
  `nactivo_v` tinyint(1) unsigned,
  `cnombre` varchar(60),
  `nactivo_c` tinyint(1) unsigned,
  `cdescripcion_s` varchar(60),
  `cdescripcion_o` varchar(60),
  `cdescripcion_d` varchar(60),
  `nmonto_tr` double,
  `nmonto_ta` double,
  `ncount_viaje` bigint(21),
  `ncount_anticipo` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rutas`
--

DROP TABLE IF EXISTS `vw_rutas`;
/*!50001 DROP VIEW IF EXISTS `vw_rutas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rutas` (
  `nid_origen` int(4) unsigned,
  `nid_destino` int(4) unsigned,
  `ndistancia` double,
  `cid_usuario` varchar(20),
  `dfecha_act` timestamp,
  `cdescripcion` varchar(60),
  `nactivo` tinyint(1) unsigned,
  `nporc_com` int(3) unsigned,
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
  `nactivo_d` int(3) unsigned,
  `nsucursal_d` int(3) unsigned,
  `cdescripcion_cd` varchar(60),
  `cid_estado_d` varchar(2),
  `cdescripcion_ed` varchar(60)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_viajes`
--

DROP TABLE IF EXISTS `vw_viajes`;
/*!50001 DROP VIEW IF EXISTS `vw_viajes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_viajes` (
  `nid_viaje` int(14) unsigned,
  `cid_chofer` varchar(9),
  `cid_vehiculo` varchar(10),
  `dfecha_v` date,
  `cguia` varchar(30),
  `npeso_com` double,
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
  `nporc_com_r` int(3) unsigned,
  `ncom_pes` double,
  `ncom_med` double,
  `ncom_liv` double,
  `nid_anticipo` int(10) unsigned,
  `cnro_recibo` varchar(10),
  `nmonto` double,
  `dfecha_a` date,
  `nstatus_a` tinyint(1) unsigned,
  `nid_relacion` int(10) unsigned,
  `dfecha_r` date,
  `nstatus_r` tinyint(1) unsigned,
  `count_anticipo` bigint(21),
  `count_viaje` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'transportedb'
--
/*!50003 DROP FUNCTION IF EXISTS `Fn_Corr_Nid_Anticipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 FUNCTION `Fn_Corr_Nid_Anticipo`(tNid_Sucursal int(4)) RETURNS int(10)
BEGIN
   

   Declare lnReturn integer;

   Set lnReturn = (select nid_anticipo+1 from tcorrelativo where nid_sucursal = tNid_Sucursal);
   update tcorrelativo set nid_anticipo = lnReturn where nid_sucursal = tNid_Sucursal;

   Return lnReturn;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Fn_Corr_Nid_Viaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 FUNCTION `Fn_Corr_Nid_Viaje`(tNid_Sucursal int(4)) RETURNS int(10)
BEGIN
   

   Declare lnReturn integer;

   Set lnReturn = (select nid_viaje+1 from tcorrelativo where nid_sucursal = tNid_Sucursal);
   update tcorrelativo set nid_viaje = lnReturn where nid_sucursal = tNid_Sucursal;

   Return lnReturn;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Calc_Com_Chof` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `Sp_Calc_Com_Chof`(tcid_periodo varchar(10),tnid_sucursal int(4))
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Calc_Com_chofer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `Sp_Calc_Com_chofer`(tcid_periodo varchar(10),tnid_sucursal int(4),tchofer 
varchar(9))
Cancel: BEGIN
   Declare nError Int(10);
   Declare ldfecha_desde,ldfecha_hasta date;
   Declare lcid_periodo VARCHAR(10);
   DECLARE finished INTEGER DEFAULT 0;
   DECLARE ttperiodo CURSOR FOR SELECT cid_periodo,dfecha_desde,dfecha_hasta FROM tperiodo where cid_periodo = tcid_periodo;
   OPEN ttperiodo;
   FETCH ttperiodo INTO lcid_periodo,ldfecha_desde,ldfecha_hasta;
   close ttperiodo;
   Create Temporary Table ttRelac (nid_relacion Int(10));

   Start Transaction;

      if not exists(select * from tconfig where ifnull(ccompania,'')<>'') then
         ROLLBACK;
         LEAVE Cancel;
      end if;

      if not exists(select cid_periodo,dfecha_desde,dfecha_hasta from tperiodo where cid_periodo = tcid_periodo) then
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
            and cid_chofer = tchofer
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
            and cid_chofer = tchofer
            group by nid_viaje
            having count(nid_relacion)=min(count_viaje)
            order by nid_relacion;

      update trelacion set nstatus = 2 where nid_relacion in (select nid_relacion from ttRelac);    
      update tchofer set nactivo = 0 where cid_chofer = tchofer and nid_sucursal = tnid_sucursal;

   Set nError =(Select @Error);
   if(nError>0) then
      ROLLBACK;
   else
      COMMIT;
   end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Correlativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `Sp_Correlativo`(tNid_Sucursal int(4),tcCampo varchar(20))
BEGIN
        Create Temporary Table ttCorr (nid_movimiento Integer);
        Set @lcCmd = concat('insert into ttCorr(nid_movimiento) ','select ', tcCampo ,' from tcorrelativo where nid_sucursal = ',tNid_Sucursal);
        PREPARE lcCorr FROM @lcCmd;
        EXECUTE lcCorr;
        Set @lNid_Movimiento = ((Select nid_movimiento From ttCorr)+1);

        Drop Temporary Table ttCorr;
        Select @lNid_Movimiento As nid_correlativo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_tgasto_tdetalle_gasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `sp_delete_tgasto_tdetalle_gasto`(tnid_gasto int(10))
BEGIN
   Declare nError Int(10);
   Start Transaction;

      delete from tdetalle_gasto where nid_gasto = tnid_gasto;                                                     
      delete from tgasto_serv where nid_gasto = tnid_gasto;

   Set nError =(Select @Error);
   if(nError>0) then
      ROLLBACK;
   else
      COMMIT;
   end if;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Eliminar_Relacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `Sp_Eliminar_Relacion`(tnid_relacion integer)
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Insert_tCorrelativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `Sp_Insert_tCorrelativo`(tNid_Sucursal Int(4))
BEGIN
        Set @lcCmd = concat('insert into tCorrelativo values (',tNid_Sucursal,',',rpad(tNid_Sucursal,9,0),',',rpad(tNid_Sucursal,9,0),',',rpad(tNid_Sucursal,9,0),',',rpad(tNid_Sucursal,9,0),')');
        PREPARE lcCorr FROM @lcCmd;
        EXECUTE lcCorr;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_ReCalc_Com_Chof` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `Sp_ReCalc_Com_Chof`(tcid_periodo varchar(10),tnid_sucursal int(4))
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
   Create Temporary Table ttViaje (nid_viaje Int(10),nid_relacion Int(10));

   Start Transaction;

      if not exists(select * from tconfig where ifnull(ccompania,'')<>'') then
         ROLLBACK;
         LEAVE Cancel;
      end if;

      if not exists(select cid_periodo,dfecha_desde,dfecha_hasta from tperiodo where cid_periodo = tcid_periodo and nstatus = 0) then
         ROLLBACK;
         LEAVE Cancel;
      end if;

      insert into ttViaje
         (select tcc.nid_viaje,trl.nid_relacion from tcomision_choferes tcc
            inner join tviaje tvj on tvj.nid_viaje = tcc.nid_viaje
            inner join tanticip_tviaje tav on tav.nid_viaje = tvj.nid_viaje
            inner join tanticipo tan on tan.nid_anticipo = tav.nid_anticipo
            inner join trelacion trl on trl.nid_relacion = tan.nid_relacion
            inner join tchofer tch on tch.cid_chofer = tvj.cid_chofer and tch.nid_sucursal = tvj.nid_sucursal_c
            where tch.nid_sucursal = tnid_sucursal and tcc.cid_periodo = tcid_periodo
            order by nid_viaje);

      delete from tcomision_choferes where cid_periodo = tcid_periodo and nid_viaje in (select nid_viaje from ttViaje);

      update trelacion set nstatus = 1 where nid_relacion in (select nid_relacion from ttViaje);
      

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

   Drop Temporary Table ttRelac;
   Drop Temporary Table ttViaje;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Reemplazar_Anticipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`admin`@`%`*/ /*!50003 PROCEDURE `Sp_Reemplazar_Anticipo`(tnid_anticipo Integer,tnid_sucursal int(4),tcid_vehiculo varchar(10),tnid_sucursal_v int(4),tcid_chofer varchar(9),tnid_sucursal_c int(4),tcobservacion text,tcid_usuario varchar(20),tcid_periodo varchar(10))
BEGIN


   Declare nError,lNid_Anticipo,lNid_Viaje,lNid_Anticipo_nvo,lNid_Viaje_nvo integer;
   Set lNid_Anticipo = 0;
   Set lNid_Viaje = 0;
   Set lNid_Anticipo_nvo = 0;
   Set lNid_Viaje_nvo = 0;

   Start Transaction;
      Create Temporary Table ttAnticipo (nid_anticipo Integer,index using btree (nid_anticipo),cnro_recibo varchar(10),nmonto double,cobservacion text,
         dfecha date,nstatus tinyint(1),nid_relacion int(10),nrelacionado tinyint(1),nid_sucursal int(4),nid_anticipo_ant int(10));
      Create Temporary Table ttViaje (nid_viaje Integer,index using btree (nid_viaje),cid_chofer varchar(9),cid_vehiculo varchar(10),dfecha date,cobservacion text,cguia varchar(10),
         corden_carga varchar(10),dfecha_guia date,npeso_neto double,nid_origen int(4),nid_destino int(4),cid_periodo varchar(10),ntipo_viaje  tinyint(1),nid_sucursal_guia int(4),
         ndistancia double,nstatus tinyint(1),cfactura_ext varchar(10),ccliente_ext varchar(45),nid_sucursal_c int(4),nid_sucursal_v int(4),npeso_com double);
      Create Temporary Table ttAnticip_tViaje (nid_anticipo Integer,index using btree (nid_anticipo),nid_anticipo_nvo integer,
         nid_viaje Integer,index using btree (nid_viaje),nid_viaje_nvo integer);
      Create Temporary Table ttNid_Anticipo (nid_anticipo integer,index using btree (nid_anticipo));
      Create Temporary Table ttNid_Viaje (nid_viaje integer,index using btree (nid_viaje));

      insert into ttNid_Viaje select distinct tav.nid_viaje from tanticip_tviaje tav where tav.nid_anticipo = tnid_anticipo;
      insert into ttNid_Anticipo select distinct tav.nid_anticipo from tanticip_tviaje tav where nid_viaje in (select nid_viaje from ttNid_Viaje);
      insert into ttNid_Viaje select distinct tav.nid_viaje from tanticip_tviaje tav where tav.nid_anticipo in (select nid_anticipo from ttNid_Anticipo);
      insert into ttNid_Anticipo select distinct tav.nid_anticipo from tanticip_tviaje tav where nid_viaje in (select nid_viaje from ttNid_Viaje);

      insert into ttAnticipo
         select distinct nid_anticipo,cnro_recibo,nmonto,cobservacion,dfecha,nstatus,nid_relacion,nrelacionado,nid_sucursal,nid_anticipo_ant from tanticipo
            where nid_anticipo in (select * from ttNid_Anticipo);

      insert into ttViaje
         select distinct nid_viaje,cid_chofer,cid_vehiculo,dfecha,cobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,nid_origen,nid_destino,cid_periodo,ntipo_viaje,
            nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,nid_sucursal_c,nid_sucursal_v,npeso_com from tviaje where nid_viaje in (select * from ttNid_Viaje);

      insert into ttAnticip_tViaje (nid_anticipo,nid_viaje)
         select nid_anticipo,nid_viaje from tanticip_tviaje where nid_anticipo in (select * from ttNid_Anticipo);

      While Exists(Select * From ttAnticipo) Do
         Set lNid_Anticipo = (Select nid_anticipo From ttAnticipo Order By nid_anticipo Limit 1);
         Set lNid_Anticipo_nvo = Fn_Corr_Nid_Anticipo(tnid_sucursal);
         insert into tanticipo (nid_anticipo,cnro_recibo,nmonto,nstatus,nid_anticipo_ant,dfecha,nid_sucursal,cid_usuario,cobservacion)
            select lNid_Anticipo_nvo,tan.cnro_recibo,tan.nmonto,tan.nstatus,tan.nid_anticipo,curdate(),tnid_sucursal,tcid_usuario,tcobservacion
            from tanticipo tan where tan.nid_anticipo = lNid_Anticipo;
         update ttAnticip_tViaje set nid_anticipo_nvo = lNid_Anticipo_nvo where nid_anticipo = lNid_Anticipo;
         update tanticipo set nstatus = 3 where nid_anticipo = lNid_Anticipo;
         Delete From ttAnticipo Where nid_anticipo = lNid_Anticipo;
      End While;

      While Exists(Select * From ttViaje) Do
         Set lNid_Viaje = (Select nid_viaje From ttViaje Order By nid_viaje Limit 1);
         Set lNid_Viaje_nvo = Fn_Corr_Nid_Viaje(tnid_sucursal);
         insert into tviaje (nid_viaje,cid_chofer,cid_vehiculo,dfecha,cobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,cid_usuario,nid_origen,nid_destino,
            cid_periodo,ntipo_viaje,nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,nid_sucursal_c,nid_sucursal_v,npeso_com)
            select lNid_Viaje_nvo,tcid_chofer,tcid_vehiculo,curdate(),tcobservacion,tvj.cguia,tvj.corden_carga,tvj.dfecha_guia,tvj.npeso_neto,
               tcid_usuario,tvj.nid_origen,tvj.nid_destino,tcid_periodo,tvj.ntipo_viaje,tvj.nid_sucursal_guia,tvj.ndistancia,tvj.nstatus,tvj.cfactura_ext,
               tvj.ccliente_ext,tnid_sucursal_c,tnid_sucursal_v,tvj.npeso_com
               from tviaje tvj where tvj.nid_viaje = lNid_Viaje;
         update ttAnticip_tViaje set nid_viaje_nvo = lNid_Viaje_nvo where nid_viaje = lNid_Viaje;
         update tviaje set nstatus = 3 where nid_viaje = lNid_Viaje;
         Delete From ttViaje Where nid_viaje = lNid_Viaje;
      End While;
      Select * From ttAnticip_tViaje;
      While Exists(Select * From ttAnticip_tViaje) Do
         Set lNid_Anticipo = (Select nid_anticipo_nvo From ttAnticip_tViaje Limit 1);
         Set lNid_Viaje = (Select nid_viaje_nvo From ttAnticip_tViaje Limit 1);
         insert into tanticip_tviaje (nid_anticipo,nid_viaje) values(lNid_Anticipo,lNid_Viaje);
         Delete From ttAnticip_tViaje Where nid_anticipo_nvo = lNid_Anticipo and nid_viaje_nvo = lNid_Viaje;
      End While;
        select 1;
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




END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_anticipos`
--

/*!50001 DROP TABLE IF EXISTS `vw_anticipos`*/;
/*!50001 DROP VIEW IF EXISTS `vw_anticipos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_anticipos` AS select `tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto`,`tan`.`cid_usuario` AS `cid_usuario`,`tan`.`dfecha_act` AS `dfecha_act`,`tan`.`cobservacion` AS `cobservacion`,`tan`.`dfecha` AS `dfecha`,`tan`.`nstatus` AS `nstatus`,`tan`.`nid_relacion` AS `nid_relacion`,`tan`.`nrelacionado` AS `nrelacionado`,`tan`.`nid_sucursal` AS `nid_sucursal`,`tan`.`nid_anticipo_ant` AS `nid_anticipo_ant`,`tvj`.`nid_viaje` AS `nid_viaje`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`nid_sucursal_c` AS `nid_sucursal_c`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`nid_sucursal_v` AS `nid_sucursal_v`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`corden_carga` AS `corden_carga`,`tvj`.`cguia` AS `cguia`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_com` AS `npeso_com`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`cid_periodo` AS `cid_periodo`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`nactivo` AS `nactivo_s`,`tp`.`cdescripcion` AS `cdescripcion_p`,`tp`.`dfecha_desde` AS `dfecha_desde`,`tp`.`dfecha_hasta` AS `dfecha_hasta`,`tp`.`nstatus` AS `nstatus_p`,`tr`.`cdescripcion` AS `cdescripcion_r`,`tr`.`nactivo` AS `nactivo_r`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal`,(select `torigen_destino`.`cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d`,(select count(`tanticip_tviaje`.`nid_anticipo`) from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_anticipo` = `tan`.`nid_anticipo`)) AS `ncount_viaje`,(select count(`tanticip_tviaje`.`nid_viaje`) from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_viaje` = `tvj`.`nid_viaje`)) AS `ncount_anticipo` from ((((((((`tanticipo` `tan` join `tanticip_tviaje` `tav` on((`tav`.`nid_anticipo` = `tan`.`nid_anticipo`))) join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tav`.`nid_viaje`))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tan`.`nid_sucursal`))) join `tperiodo` `tp` on((`tp`.`cid_periodo` = `tvj`.`cid_periodo`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `truta` `tr` on(((`tr`.`nid_origen` = `tvj`.`nid_origen`) and (`tr`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_choferes`
--

/*!50001 DROP TABLE IF EXISTS `vw_choferes`*/;
/*!50001 DROP VIEW IF EXISTS `vw_choferes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_choferes` AS select `tch`.`cid_chofer` AS `cid_chofer`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`cid_usuario` AS `cid_usuario`,`tch`.`dfecha_act` AS `dfecha_act`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo`,`ts`.`cdescripcion` AS `cdescripcion_s`,count(`tvj`.`cid_chofer`) AS `ntotal_viajes`,(sum(`tvj`.`npeso_neto`) / 1000) AS `ntotal_peso`,sum(`tvj`.`ndistancia`) AS `ntotal_km` from ((`tchofer` `tch` join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tviaje` `tvj` on(((`tvj`.`cid_chofer` = `tch`.`cid_chofer`) and (`tvj`.`nid_sucursal_c` = `tch`.`nid_sucursal`)))) group by `tch`.`cid_chofer` order by cast(`tch`.`cid_chofer` as unsigned) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_comision_choferes`
--

/*!50001 DROP TABLE IF EXISTS `vw_comision_choferes`*/;
/*!50001 DROP VIEW IF EXISTS `vw_comision_choferes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_comision_choferes` AS select `tcc`.`nid_viaje` AS `nid_viaje`,`tcc`.`cid_periodo` AS `cid_periodo`,`tcc`.`nporc_com` AS `nporc_com`,`tcc`.`ntabulador` AS `ntabulador`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`corden_carga` AS `corden_carga`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_com` AS `npeso_com`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`cid_periodo` AS `cid_periodo_v`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`nstatus` AS `nstatus_v`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ncapacidad` AS `ncapacidad`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`cconcepto_com` AS `cconcepto_com`,`ts`.`casignacion_com` AS `casignacion_com`,`ts`.`cdeduccion_com` AS `cdeduccion_com`,`ts`.`ncap_carga` AS `ncap_carga`,`ts`.`nactivo` AS `nactivo_s`,`ts`.`nbono_alm` AS `nbono_alm`,`ts`.`nbono_mon` AS `nbono_mon`,`ts`.`nporc_com` AS `nporc_com_s`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto_a`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nstatus` AS `nstatus_a`,`tan`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha_r`,`trl`.`nstatus` AS `nstatus_r`,`trt`.`cdescripcion` AS `cdescripcion_r`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tp`.`cdescripcion` AS `cdescripcion_p`,`tp`.`dfecha_desde` AS `dfecha_desde`,`tp`.`dfecha_hasta` AS `dfecha_hasta`,`tp`.`nticket_cesta` AS `nticket_cesta`,`tp`.`ndias_feriados` AS `ndias_feriados`,((((`tvj`.`npeso_com` * `tcc`.`ntabulador`) / 1000) * `tcc`.`nporc_com`) / 100) AS `nmonto_com`,sum(`tdr`.`nmonto`) AS `nmonto_r`,(select `torigen_destino`.`cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tvj`.`nid_destino`)) AS `cdescripcion_d`,(select sum(`tanticipo`.`nmonto`) from `tanticipo` where (`tanticipo`.`nid_relacion` = `trl`.`nid_relacion`)) AS `nmonto_ta`,(select count(`tanticip_tviaje`.`nid_anticipo`) from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_anticipo` = `tan`.`nid_anticipo`)) AS `ncount_viaje`,(select count(`tanticip_tviaje`.`nid_viaje`) from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_viaje` = `tvj`.`nid_viaje`)) AS `ncount_anticipo` from (((((((((((`tcomision_choferes` `tcc` join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tcc`.`nid_viaje`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tanticip_tviaje` `tav` on((`tav`.`nid_viaje` = `tvj`.`nid_viaje`))) join `tanticipo` `tan` on((`tan`.`nid_anticipo` = `tav`.`nid_anticipo`))) join `trelacion` `trl` on((`trl`.`nid_relacion` = `tan`.`nid_relacion`))) join `tdetalle_relacion` `tdr` on((`tdr`.`nid_relacion` = `trl`.`nid_relacion`))) join `truta` `trt` on(((`trt`.`nid_origen` = `tvj`.`nid_origen`) and (`trt`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `trt`.`nid_origen`))) join `tperiodo` `tp` on((`tp`.`cid_periodo` = `tcc`.`cid_periodo`))) group by `tcc`.`nid_viaje`,`tcc`.`cid_periodo`,`tcc`.`nporc_com`,`tcc`.`ntabulador`,`tvj`.`cid_chofer`,`tvj`.`cid_vehiculo`,`tvj`.`dfecha`,`tvj`.`cguia`,`tvj`.`corden_carga`,`tvj`.`dfecha_guia`,`tvj`.`npeso_com`,`tvj`.`nid_origen`,`tvj`.`nid_destino`,`tvj`.`cid_periodo`,`tvj`.`ntipo_viaje`,`tvj`.`nid_sucursal_guia`,`tvj`.`ndistancia`,`tvj`.`nstatus`,`tvj`.`cfactura_ext`,`tvj`.`ccliente_ext`,`tvh`.`cdescripcion`,`tvh`.`ncapacidad`,`tvh`.`ctipo_vehic`,`tvh`.`npropio`,`tvh`.`nactivo`,`tch`.`cnombre`,`tch`.`ccontraparte`,`tch`.`cficha_nom`,`tch`.`nid_sucursal`,`tch`.`ncontratado`,`tch`.`nactivo`,`ts`.`cdescripcion`,`ts`.`ncap_carga`,`ts`.`nactivo`,`ts`.`nbono_alm`,`ts`.`nbono_mon`,`ts`.`nporc_com`,`tan`.`nid_anticipo`,`tan`.`cnro_recibo`,`tan`.`nmonto`,`tan`.`dfecha`,`tan`.`nstatus`,`tan`.`nid_relacion`,`trl`.`dfecha`,`trl`.`nstatus`,`trt`.`cdescripcion`,`tod`.`cdescripcion`,`tp`.`cdescripcion`,`tp`.`dfecha_desde`,`tp`.`dfecha_hasta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_enc_relaciones`
--

/*!50001 DROP TABLE IF EXISTS `vw_enc_relaciones`*/;
/*!50001 DROP VIEW IF EXISTS `vw_enc_relaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_enc_relaciones` AS select distinct `trl`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha`,`trl`.`cid_usuario` AS `cid_usuario`,`trl`.`dfecha_act` AS `dfecha_act`,`trl`.`cobservacion` AS `cobservacion`,`trl`.`nstatus` AS `nstatus`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nmonto` AS `nmonto_a`,`tan`.`nid_sucursal` AS `nid_sucursal`,`tan`.`nid_anticipo_ant` AS `nid_anticipo_ant`,`tan`.`nstatus` AS `nstatus_a`,`tvj`.`nid_viaje` AS `nid_viaje`,(case when ((`tvj`.`cfactura_ext` is not null) and (`tvj`.`cfactura_ext` <> '') and (`tvj`.`dfecha_guia` <> '1900-01-01')) then `tvj`.`dfecha_guia` else `tvj`.`dfecha` end) AS `dfecha_v`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`nid_sucursal_c` AS `nid_sucursal_c`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`nid_sucursal_v` AS `nid_sucursal_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_com` AS `npeso_com`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`cid_periodo` AS `cid_periodo`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,`tod`.`cdescripcion` AS `cdescripcion_o`,(select `torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tvj`.`nid_destino`)) AS `cdescripcion_d`,(select sum(`tdetalle_relacion`.`nmonto`) from `tdetalle_relacion` where (`tdetalle_relacion`.`nid_relacion` = `trl`.`nid_relacion`)) AS `nmonto_tr`,(select sum(`tanticipo`.`nmonto`) from `tanticipo` where (`tanticipo`.`nid_relacion` = `trl`.`nid_relacion`)) AS `nmonto_ta`,(select count(`tav1`.`nid_anticipo`) from (`tanticip_tviaje` `tav1` join `tanticipo` `tan1` on((`tan1`.`nid_anticipo` = `tav1`.`nid_anticipo`))) where ((`tan1`.`nstatus` = 2) and (`tav1`.`nid_anticipo` = `tan`.`nid_anticipo`))) AS `ncount_viaje`,(select count(`tav1`.`nid_viaje`) from (`tanticip_tviaje` `tav1` join `tanticipo` `tan1` on((`tan1`.`nid_anticipo` = `tav1`.`nid_anticipo`))) where ((`tan1`.`nstatus` = 2) and (`tav1`.`nid_viaje` = `tvj`.`nid_viaje`))) AS `ncount_anticipo` from ((((((((`trelacion` `trl` join `tanticipo` `tan` on((`tan`.`nid_relacion` = `trl`.`nid_relacion`))) join `tanticip_tviaje` `tav` on((`tav`.`nid_anticipo` = `tan`.`nid_anticipo`))) join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tav`.`nid_viaje`))) join `truta` `trt` on(((`trt`.`nid_origen` = `tvj`.`nid_origen`) and (`trt`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `trt`.`nid_origen`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tan`.`nid_sucursal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gasto_serv`
--

/*!50001 DROP TABLE IF EXISTS `vw_gasto_serv`*/;
/*!50001 DROP VIEW IF EXISTS `vw_gasto_serv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gasto_serv` AS select `tvh`.`cid_vehiculo` AS `cid_vehiculo`,`tvh`.`nid_sucursal` AS `nid_sucursal`,`tvh`.`cdescripcion` AS `cdescripcion`,`tvh`.`cmarca` AS `cmarca`,`tvh`.`cserial_motor` AS `cserial_motor`,`tvh`.`cserial_carroc` AS `cserial_carroc`,`tvh`.`ntara` AS `ntara`,`tvh`.`ncapacidad` AS `ncapacidad`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo`,`tgs`.`nid_gasto` AS `nid_gasto`,`tgs`.`dfecha` AS `dfecha`,`tgs`.`crif_emp` AS `crif_emp`,`tgs`.`cfactura` AS `cfactura`,`tgs`.`ntotal` AS `ntotal_gs`,`tgs`.`nstatus` AS `nstatus_gs`,`tdg`.`cid_servicio` AS `cid_servicio`,`tdg`.`ntotal` AS `ntotal_dg`,`tsv`.`cdescripcion` AS `cdescripcion_sv`,`tsv`.`ccta_cont` AS `ccta_cont`,`tsv`.`cdescrip_cta` AS `cdescrip_cta`,`tsv`.`ncontabiliza` AS `ncontabiliza`,`tsv`.`cid_grupo` AS `cid_grupo`,`tgr`.`cdescripcion` AS `cdescripcion_g`,`ts`.`cdescripcion` AS `cdescripcion_s` from (((((`tvehiculo` `tvh` join `tdetalle_gasto` `tdg` on(((`tdg`.`cid_vehiculo` = `tvh`.`cid_vehiculo`) and (`tdg`.`nid_sucursal_v` = `tvh`.`nid_sucursal`)))) join `tgasto_serv` `tgs` on((`tgs`.`nid_gasto` = `tdg`.`nid_gasto`))) join `tservicio` `tsv` on((`tsv`.`cid_servicio` = `tdg`.`cid_servicio`))) join `tgrupo_servicio` `tgr` on((`tgr`.`cid_grupo` = `tsv`.`cid_grupo`))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tvh`.`nid_sucursal`))) order by `tvh`.`cid_vehiculo`,`tvh`.`nid_sucursal`,`tgs`.`nid_gasto`,`tsv`.`cid_servicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_relaciones`
--

/*!50001 DROP TABLE IF EXISTS `vw_relaciones`*/;
/*!50001 DROP VIEW IF EXISTS `vw_relaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_relaciones` AS select distinct `trl`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha`,`trl`.`cid_usuario` AS `cid_usuario`,`trl`.`dfecha_act` AS `dfecha_act`,`trl`.`cobservacion` AS `cobservacion`,`trl`.`nstatus` AS `nstatus`,`tdr`.`cid_tipogasto` AS `cid_tipogasto`,`tdr`.`nmonto` AS `nmonto`,`ttg`.`cdescripcion` AS `cdescripcion_g`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nmonto` AS `nmonto_a`,`tan`.`nid_sucursal` AS `nid_sucursal`,`tan`.`nid_anticipo_ant` AS `nid_anticipo_ant`,`tan`.`nstatus` AS `nstatus_a`,`tvj`.`nid_viaje` AS `nid_viaje`,(case when ((`tvj`.`cfactura_ext` is not null) and (`tvj`.`cfactura_ext` <> '') and (`tvj`.`dfecha_guia` <> '1900-01-01')) then `tvj`.`dfecha_guia` else `tvj`.`dfecha` end) AS `dfecha_v`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`nid_sucursal_c` AS `nid_sucursal_c`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`nid_sucursal_v` AS `nid_sucursal_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_com` AS `npeso_com`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`cid_periodo` AS `cid_periodo`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,`tod`.`cdescripcion` AS `cdescripcion_o`,(select `torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tvj`.`nid_destino`)) AS `cdescripcion_d`,(select sum(`tdetalle_relacion`.`nmonto`) from `tdetalle_relacion` where (`tdetalle_relacion`.`nid_relacion` = `trl`.`nid_relacion`)) AS `nmonto_tr`,(select sum(`tanticipo`.`nmonto`) from `tanticipo` where (`tanticipo`.`nid_relacion` = `trl`.`nid_relacion`)) AS `nmonto_ta`,(select count(`tav1`.`nid_anticipo`) from (`tanticip_tviaje` `tav1` join `tanticipo` `tan1` on((`tan1`.`nid_anticipo` = `tav1`.`nid_anticipo`))) where ((`tan1`.`nstatus` = 2) and (`tav1`.`nid_anticipo` = `tan`.`nid_anticipo`))) AS `ncount_viaje`,(select count(`tav1`.`nid_viaje`) from (`tanticip_tviaje` `tav1` join `tanticipo` `tan1` on((`tan1`.`nid_anticipo` = `tav1`.`nid_anticipo`))) where ((`tan1`.`nstatus` = 2) and (`tav1`.`nid_viaje` = `tvj`.`nid_viaje`))) AS `ncount_anticipo` from ((((((((((`trelacion` `trl` join `tdetalle_relacion` `tdr` on((`tdr`.`nid_relacion` = `trl`.`nid_relacion`))) join `ttipo_gasto` `ttg` on((`ttg`.`cid_tipogasto` = `tdr`.`cid_tipogasto`))) join `tanticipo` `tan` on((`tan`.`nid_relacion` = `trl`.`nid_relacion`))) join `tanticip_tviaje` `tav` on((`tav`.`nid_anticipo` = `tan`.`nid_anticipo`))) join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tav`.`nid_viaje`))) join `truta` `trt` on(((`trt`.`nid_origen` = `tvj`.`nid_origen`) and (`trt`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `trt`.`nid_origen`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tan`.`nid_sucursal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rutas`
--

/*!50001 DROP TABLE IF EXISTS `vw_rutas`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rutas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rutas` AS select `tr`.`nid_origen` AS `nid_origen`,`tr`.`nid_destino` AS `nid_destino`,`tr`.`ndistancia` AS `ndistancia`,`tr`.`cid_usuario` AS `cid_usuario`,`tr`.`dfecha_act` AS `dfecha_act`,`tr`.`cdescripcion` AS `cdescripcion`,`tr`.`nactivo` AS `nactivo`,`tr`.`nporc_com` AS `nporc_com`,`tr`.`ncom_pes` AS `ncom_pes`,`tr`.`ncom_med` AS `ncom_med`,`tr`.`ncom_liv` AS `ncom_liv`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`cid_ciudad` AS `cid_ciudad_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal_o`,`tc`.`cdescripcion` AS `cdescripcion_co`,`tc`.`cid_estado` AS `cid_estado_o`,`te`.`cdescripcion` AS `cdescripcion_eo`,(select `torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d`,(select `torigen_destino`.`cid_ciudad` AS `cid_ciudad` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cid_ciudad_d`,(select `torigen_destino`.`nactivo` AS `nactivo` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nactivo_d`,(select `torigen_destino`.`nsucursal` AS `nsucursal` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nsucursal_d`,(select `tciudad`.`cdescripcion` AS `cdescripcion` from `tciudad` where (`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cdescripcion_cd`,(select `tciudad`.`cid_estado` AS `cid_estado` from `tciudad` where (`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cid_estado_d`,(select `testado`.`cdescripcion` AS `cdescripcion` from `testado` where (`testado`.`cid_estado` = `cid_estado_d`)) AS `cdescripcion_ed` from (((`truta` `tr` join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`))) join `tciudad` `tc` on((`tc`.`cid_ciudad` = `tod`.`cid_ciudad`))) join `testado` `te` on((`te`.`cid_estado` = `tc`.`cid_estado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_viajes`
--

/*!50001 DROP TABLE IF EXISTS `vw_viajes`*/;
/*!50001 DROP VIEW IF EXISTS `vw_viajes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_viajes` AS select `tvj`.`nid_viaje` AS `nid_viaje`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`npeso_com` AS `npeso_com`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`nstatus` AS `nstatus_v`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ncapacidad` AS `ncapacidad`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tvh`.`crif_empext` AS `crif_empext`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`ncap_carga` AS `ncap_carga`,`ts`.`nactivo` AS `nactivo_s`,`ts`.`nbono_alm` AS `nbono_alm`,`ts`.`nbono_mon` AS `nbono_mon`,`ts`.`nporc_com` AS `nporc_com_s`,`tr`.`cdescripcion` AS `cdescripcion_r`,`tr`.`nporc_com` AS `nporc_com_r`,`tr`.`ncom_pes` AS `ncom_pes`,`tr`.`ncom_med` AS `ncom_med`,`tr`.`ncom_liv` AS `ncom_liv`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nstatus` AS `nstatus_a`,`tan`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha_r`,`trl`.`nstatus` AS `nstatus_r`,(select count(`tav1`.`nid_anticipo`) from (`tanticip_tviaje` `tav1` join `tanticipo` `tan1` on((`tan1`.`nid_anticipo` = `tav1`.`nid_anticipo`))) where ((`tan1`.`nstatus` <> 3) and (`tav1`.`nid_anticipo` = `tan`.`nid_anticipo`))) AS `count_anticipo`,(select count(`tav2`.`nid_viaje`) from (`tanticip_tviaje` `tav2` join `tanticipo` `tan2` on((`tan2`.`nid_anticipo` = `tav2`.`nid_anticipo`))) where ((`tan2`.`nstatus` <> 3) and (`tav2`.`nid_viaje` = `tvj`.`nid_viaje`))) AS `count_viaje` from (((((((`tviaje` `tvj` join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `truta` `tr` on(((`tr`.`nid_origen` = `tvj`.`nid_origen`) and (`tr`.`nid_destino` = `tvj`.`nid_destino`)))) join `tanticip_tviaje` `tav` on((`tav`.`nid_viaje` = `tvj`.`nid_viaje`))) join `tanticipo` `tan` on((`tan`.`nid_anticipo` = `tav`.`nid_anticipo`))) left join `trelacion` `trl` on((`trl`.`nid_relacion` = `tan`.`nid_relacion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-22 18:03:32
