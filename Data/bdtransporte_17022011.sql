-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.46-community


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
  `nstatus` tinyint(1) unsigned,
  `nid_relacion` int(10) unsigned,
  `nrelacionado` tinyint(1) unsigned,
  `nid_sucursal` int(4) unsigned,
  `nid_viaje` int(14) unsigned,
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
  `nporc_com` int(3) unsigned,
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
  `npeso_com` double,
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
  `ncount_viaje` bigint(21),
  `ncount_anticipo` bigint(21)
);

--
-- Temporary table structure for view `vw_relaciones`
--
DROP TABLE IF EXISTS `vw_relaciones`;
DROP VIEW IF EXISTS `vw_relaciones`;
CREATE TABLE `vw_relaciones` (
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
  `cguia` varchar(10),
  `dfecha_guia` date,
  `npeso_neto` double,
  `nid_sucursal_guia` int(4) unsigned,
  `cid_periodo` varchar(10),
  `ntipo_viaje` tinyint(1) unsigned,
  `cfactura_ext` varchar(10),
  `ccliente_ext` varchar(45),
  `cdescripcion_v` varchar(60),
  `nactivo_v` tinyint(1) unsigned,
  `cnombre` varchar(60),
  `nactivo_c` tinyint(1) unsigned,
  `cdescripcion_s` varchar(60),
  `nmonto_tr` double,
  `nmonto_ta` double
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
  `nid_viaje` int(14) unsigned,
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
);

--
-- Definition of table `tacceso_suc`
--

DROP TABLE IF EXISTS `tacceso_suc`;
CREATE TABLE `tacceso_suc` (
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `crutaspc` varchar(250) NOT NULL DEFAULT ' ',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid_usuario`,`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tacceso_suc`
--

/*!40000 ALTER TABLE `tacceso_suc` DISABLE KEYS */;
INSERT INTO `tacceso_suc` (`cid_usuario`,`crutaspc`,`nid_sucursal`) VALUES 
 ('ADMCOC','L:/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('ADMIN','L:/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('ADMIN','L:/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('ADMIN','L:/CARACAS/COBRANZAS/COBDATOS/',3),
 ('ADMIN','L:/VALENCIA/COBRANZAS/COBDATOS/',4),
 ('ADMIN','L:/BARCELON/COBRANZAS/COBDATOS/',5),
 ('ADMIN','L:/MARACAIB/COBRANZAS/COBDATOS/',6),
 ('JLOZADA','L:/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('MARIO','L:/FLXONLINE/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('MARIO','L:/FLXONLINE/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('NELIGER','L:/FLXONLINE/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('NELIGER','L:/FLXONLINE/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('P','L:/OFICINAP/COBRANZAS/COBDATOS/',1),
 ('P','L:/COCCIDEN/COBRANZAS/COBDATOS/',2),
 ('P','L:/CARACAS/COBRANZAS/COBDATOS/',3),
 ('P','L:/VALENCIA/COBRANZAS/COBDATOS/',4),
 ('P','L:/BARCELON/COBRANZAS/COBDATOS/',5),
 ('P','L:/MARACAIB/COBRANZAS/COBDATOS/',6),
 ('RRHH','I:/',1),
 ('RRHH','I:/',2);
/*!40000 ALTER TABLE `tacceso_suc` ENABLE KEYS */;


--
-- Definition of table `talmacenista`
--

DROP TABLE IF EXISTS `talmacenista`;
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
  `nid_anticipo` int(10) unsigned NOT NULL DEFAULT '0',
  `nid_viaje` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid_anticipo`,`nid_viaje`),
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
 (100000003,100000003),
 (100000003,100000004),
 (100000004,100000005),
 (100000005,100000006),
 (100000005,100000007),
 (100000006,100000008),
 (100000007,100000009),
 (100000008,100000010),
 (100000009,100000011),
 (100000010,100000012),
 (100000011,100000013),
 (100000012,100000014),
 (100000013,100000015),
 (100000014,100000015),
 (100000015,100000016),
 (100000016,100000017),
 (200000001,200000001),
 (200000002,200000002),
 (200000003,200000003),
 (200000004,200000004),
 (200000013,200000004),
 (200000005,200000005),
 (200000006,200000006),
 (200000007,200000007),
 (200000008,200000008),
 (200000009,200000009),
 (200000010,200000010),
 (200000011,200000011),
 (200000012,200000012),
 (200000014,200000013),
 (200000015,200000014),
 (200000016,200000015),
 (200000017,200000016),
 (200000018,200000017),
 (200000019,200000018),
 (200000020,200000019),
 (200000031,200000019),
 (200000021,200000020),
 (200000022,200000021),
 (200000023,200000022),
 (200000024,200000023),
 (200000025,200000024),
 (200000026,200000025),
 (200000027,200000026),
 (200000028,200000027),
 (200000029,200000028),
 (200000030,200000029),
 (200000032,200000030),
 (200000033,200000031),
 (200000034,200000032),
 (200000035,200000033),
 (200000036,200000034),
 (200000037,200000035),
 (200000038,200000036),
 (200000039,200000037),
 (200000040,200000038),
 (200000041,200000039),
 (200000042,200000040),
 (200000043,200000041),
 (200000044,200000042),
 (200000045,200000043),
 (200000046,200000044),
 (200000047,200000045),
 (200000048,200000046),
 (200000049,200000047),
 (200000050,200000048),
 (200000051,200000049),
 (200000052,200000050),
 (200000053,200000051),
 (200000054,200000052),
 (200000055,200000053),
 (200000056,200000054),
 (200000057,200000055),
 (200000069,200000055),
 (200000058,200000056),
 (200000059,200000057),
 (200000060,200000058),
 (200000061,200000059),
 (200000062,200000060),
 (200000063,200000061),
 (200000064,200000062),
 (200000065,200000063),
 (200000066,200000064),
 (200000067,200000065),
 (200000068,200000066),
 (200000070,200000067),
 (200000071,200000068),
 (200000072,200000069),
 (200000073,200000070),
 (200000074,200000071),
 (200000075,200000072),
 (200000076,200000073),
 (200000077,200000074),
 (200000078,200000075),
 (200000079,200000076),
 (200000080,200000077),
 (200000081,200000078),
 (200000082,200000079),
 (200000083,200000080),
 (200000099,200000080),
 (200000084,200000081),
 (200000085,200000082),
 (200000086,200000083),
 (200000087,200000084),
 (200000088,200000085),
 (200000089,200000086),
 (200000090,200000087),
 (200000091,200000088),
 (200000106,200000088),
 (200000092,200000089),
 (200000093,200000090),
 (200000094,200000091),
 (200000095,200000092),
 (200000096,200000093),
 (200000097,200000094),
 (200000098,200000095),
 (200000100,200000096),
 (200000101,200000097),
 (200000102,200000098),
 (200000103,200000099),
 (200000104,200000100),
 (200000105,200000101),
 (200000107,200000102),
 (200000108,200000103),
 (200000109,200000104),
 (200000110,200000105),
 (200000111,200000106),
 (200000112,200000107),
 (200000113,200000108),
 (200000114,200000109),
 (200000145,200000109),
 (200000115,200000110),
 (200000116,200000111),
 (200000117,200000112),
 (200000118,200000113),
 (200000119,200000114),
 (200000120,200000115),
 (200000121,200000116),
 (200000122,200000117),
 (200000123,200000118),
 (200000124,200000119),
 (200000125,200000120),
 (200000126,200000121),
 (200000127,200000122),
 (200000128,200000123),
 (200000129,200000124),
 (200000130,200000125),
 (200000131,200000126),
 (200000132,200000127),
 (200000133,200000128),
 (200000134,200000129),
 (200000135,200000130),
 (200000136,200000131),
 (200000137,200000132),
 (200000138,200000133),
 (200000139,200000134),
 (200000140,200000135),
 (200000141,200000136),
 (200000142,200000137),
 (200000143,200000138),
 (200000144,200000139),
 (200000146,200000140),
 (200000147,200000141),
 (200000148,200000142),
 (200000149,200000143),
 (200000150,200000144),
 (200000151,200000145),
 (200000152,200000146),
 (200000153,200000147),
 (200000154,200000148),
 (200000155,200000149),
 (200000156,200000150),
 (200000157,200000151),
 (200000158,200000152),
 (200000159,200000153),
 (200000160,200000154),
 (200000161,200000155),
 (200000162,200000156),
 (200000163,200000157),
 (200000164,200000158),
 (200000165,200000159),
 (200000166,200000160),
 (200000167,200000161),
 (200000168,200000162),
 (200000169,200000163),
 (200000170,200000164),
 (200000171,200000165),
 (200000172,200000166),
 (200000173,200000167),
 (200000174,200000168),
 (200000175,200000169),
 (200000176,200000170),
 (200000177,200000171),
 (200000178,200000172),
 (200000179,200000173),
 (200000180,200000174),
 (200000181,200000175),
 (200000182,200000176),
 (200000183,200000177);
/*!40000 ALTER TABLE `tanticip_tviaje` ENABLE KEYS */;


--
-- Definition of table `tanticipo`
--

DROP TABLE IF EXISTS `tanticipo`;
CREATE TABLE `tanticipo` (
  `nid_anticipo` int(10) unsigned NOT NULL DEFAULT '0',
  `cnro_recibo` varchar(10) NOT NULL DEFAULT ' ',
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
  PRIMARY KEY (`nid_anticipo`),
  KEY `ix_recibo` (`cnro_recibo`),
  KEY `FK_tanticipo_trelacion` (`nid_relacion`),
  CONSTRAINT `FK_tanticipo_trelacion` FOREIGN KEY (`nid_relacion`) REFERENCES `trelacion` (`nid_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo`
--

/*!40000 ALTER TABLE `tanticipo` DISABLE KEYS */;
INSERT INTO `tanticipo` (`nid_anticipo`,`cnro_recibo`,`nmonto`,`cid_usuario`,`dfecha_act`,`cobservacion`,`dfecha`,`nstatus`,`nid_relacion`,`nrelacionado`,`nid_sucursal`,`nid_anticipo_ant`) VALUES 
 (100000001,'192404',1030,'MARIO','2010-12-17 11:20:35','','2010-12-15',2,100000001,1,1,NULL),
 (100000002,'185417',800,'P','2011-01-11 11:19:47','','2011-01-11',2,100000003,1,1,NULL),
 (100000003,'185457',680,'P','2011-01-11 11:21:22','','2011-01-11',2,100000004,1,1,NULL),
 (100000004,'185643',230,'P','2011-01-11 10:54:21','','2011-01-11',3,NULL,1,1,NULL),
 (100000005,'185530',1720,'P','2011-01-11 11:25:22','','2011-01-11',2,100000005,1,1,NULL),
 (100000006,'185643',230,'P','2011-01-11 11:30:32','','2011-01-11',2,100000006,1,1,NULL),
 (100000007,'186583',930,'P','2011-01-11 11:35:12','','2011-01-11',2,100000007,1,1,NULL),
 (100000008,'186638',320,'P','2011-01-11 11:41:46','','2011-01-11',2,100000008,1,1,NULL),
 (100000009,'186673',400,'P','2011-01-11 11:42:56','','2011-01-11',2,100000009,1,1,NULL),
 (100000010,'186735',310,'P','2011-01-11 11:44:03','','2011-01-11',2,100000010,1,1,NULL),
 (100000011,'186884',680,'P','2011-01-11 11:44:41','','2011-01-11',2,100000011,1,1,NULL),
 (100000012,'186855',250,'P','2011-01-11 11:45:22','','2011-01-11',2,100000012,1,1,NULL),
 (100000013,'185421',370,'ADMIN','2011-01-31 11:25:36','bien','2011-01-31',2,100000014,1,1,NULL),
 (100000014,'185475',250,'ADMIN','2011-01-31 11:25:36','','2011-01-31',2,100000014,1,1,NULL),
 (100000015,'987',0,'P','2011-02-01 11:07:38','','2011-01-31',3,NULL,0,1,NULL),
 (100000016,'777',700,'P','2011-02-15 17:48:37','','2011-02-15',1,NULL,0,1,NULL),
 (200000001,'188375',430,'ADMCOC','2010-11-30 09:23:57','(2 Repartos)\r\n','2010-11-15',2,200000014,1,2,NULL),
 (200000002,'188377',530,'ADMCOC','2010-11-30 08:55:58','(2 repartos)','2010-11-15',2,200000005,1,2,NULL),
 (200000003,'188378',400,'ADMCOC','2010-11-30 08:54:46','(3 repartos)','2010-11-15',2,200000004,1,2,NULL),
 (200000004,'188380',440,'ADMCOC','2010-12-06 18:26:06','(5 repartos)','2010-11-16',2,200000025,1,2,NULL),
 (200000005,'188381',430,'ADMCOC','2010-12-07 07:44:21','(1 reparto)','2010-11-16',2,200000030,1,2,NULL),
 (200000006,'188383',585,'ADMCOC','2010-12-15 10:15:34','(3 repartos)','2010-11-16',2,200000103,1,2,NULL),
 (200000007,'188384',400,'ADMCOC','2010-12-07 16:12:37','(8 repartos)','2010-11-16',2,200000046,1,2,NULL),
 (200000008,'188385',380,'ADMCOC','2010-11-30 09:10:18','(7 repartos)','2010-11-16',2,200000010,1,2,NULL),
 (200000009,'188386',410,'ADMCOC','2010-12-07 07:51:50','(13Repartos)','2010-11-17',2,200000037,1,2,NULL),
 (200000010,'188387',390,'ADMCOC','2010-11-30 09:14:54','(1 reparto)','2010-11-17',2,200000012,1,2,NULL),
 (200000011,'188388',330,'ADMCOC','2010-11-30 09:16:43','(4 repartos)','2010-11-17',2,200000013,1,2,NULL),
 (200000012,'188391',380,'ADMCOC','2010-11-30 09:01:04','(5 repartos)','2010-11-18',2,200000007,1,2,NULL),
 (200000013,'188392',140,'ADMCOC','2010-12-06 18:26:06','complemento de viaje en caleta \r\n\r\n','2010-11-18',2,200000025,1,2,NULL),
 (200000014,'188393',440,'ADMCOC','2010-11-30 09:11:07','(5 repartos) valera-carvajal','2010-11-18',2,200000011,1,2,NULL),
 (200000015,'188394',410,'ADMCOC','2010-12-07 16:12:08','(1 reparto)','2010-11-18',2,200000045,1,2,NULL),
 (200000016,'188395',545,'ADMCOC','2010-12-15 10:16:06','(5 repartos) Barinas-Barinitas','2010-11-18',2,200000104,1,2,NULL),
 (200000017,'188397',330,'ADMCOC','2010-12-07 07:43:33','(7 REPARTOS)','2010-11-18',2,200000029,1,2,NULL),
 (200000018,'188399',410,'ADMCOC','2010-12-07 07:45:25','(8 REPARTOS)','2010-11-18',2,200000032,1,2,NULL),
 (200000019,'188389',410,'ADMCOC','2010-11-30 08:56:51','(9 repartos)','2010-11-19',2,200000006,1,2,NULL),
 (200000020,'188400',390,'ADMCOC','2010-12-10 08:58:26','(12 repartos) acarigua-piritu-turen-ospino','2010-11-19',2,200000065,1,2,NULL),
 (200000021,'188401',390,'ADMCOC','2010-12-10 08:49:48','(12 repartos) guanare-guanarito','2010-11-19',2,200000054,1,2,NULL),
 (200000022,'188402',410,'ADMCOC','2010-11-30 08:53:39','(12 repartos)','2010-11-19',2,200000003,1,2,NULL),
 (200000023,'188403',480,'ADMCOC','2010-12-07 07:51:16','( 7  repartos)','2010-11-19',2,200000036,1,2,NULL),
 (200000024,'188404',410,'ADMCOC','2010-12-07 16:11:43','(8 repartos) no se crea de destino de siquisiqui por tan motivo se coloco destino de carora conversado con pedro papic','2010-11-19',2,200000044,1,2,NULL),
 (200000025,'188405',410,'ADMCOC','2010-11-30 09:04:29','(12repartos)','2010-11-22',2,200000009,1,2,NULL),
 (200000026,'188406',400,'ADMCOC','2010-12-07 07:42:49','(9 repartos)','2010-11-22',2,200000028,1,2,NULL),
 (200000027,'188407',615,'ADMCOC','2010-12-15 10:21:15','(6 repartos)','2010-11-22',2,200000107,1,2,NULL),
 (200000028,'188408',410,'ADMCOC','2010-11-30 09:02:10','(12 repartos)','2010-11-22',2,200000008,1,2,NULL),
 (200000029,'188409',380,'ADMCOC','2010-11-30 09:26:10','(3 repartos)','2010-11-22',2,200000015,1,2,NULL),
 (200000030,'188411',390,'ADMCOC','2010-11-30 09:26:40','(1 reparto)','2010-11-22',2,200000016,1,2,NULL),
 (200000031,'188412',100,'ADMCOC','2010-12-10 08:58:26','complemento de caleta por makro araure','2010-11-22',2,200000065,1,2,NULL),
 (200000032,'188414',440,'ADMCOC','2010-12-07 07:42:17','( 4 repartos)','2010-11-23',2,200000027,1,2,NULL),
 (200000033,'188415',380,'ADMCOC','2010-12-07 16:11:16','9 REPARTOS GUANARE-PEDRAZA','2010-11-23',2,200000043,1,2,NULL),
 (200000034,'188416',410,'ADMCOC','2010-12-07 07:52:36','(8 REPARTOS) MERCABAR-BQTO','2010-11-23',2,200000038,1,2,NULL),
 (200000035,'188417',400,'ADMCOC','2010-12-06 18:19:24','(5 REPARTOS) SAN FELIPE','2010-11-23',2,200000018,1,2,NULL),
 (200000036,'188418',410,'ADMCOC','2010-12-06 18:21:13','(7 REPARTOS) CIUDAD DE NUTRIAS','2010-11-23',2,200000021,1,2,NULL),
 (200000037,'188419',430,'ADMCOC','2010-12-10 08:48:24','(1 REPARTO VALERA)','2010-11-23',2,200000053,1,2,NULL),
 (200000038,'188420',400,'ADMCOC','2010-12-06 18:23:45','(6 REPARTOS BQTO)','2010-11-23',2,200000024,1,2,NULL),
 (200000039,'188421',580,'ADMCOC','2010-12-15 10:20:32','(1 REPARTO)','2010-11-23',2,200000106,1,2,NULL),
 (200000040,'188422',400,'ADMCOC','2010-12-07 07:44:55','(9 REPARTOS BQTO-MERCABAR)','2010-11-23',2,200000031,1,2,NULL),
 (200000041,'188423',400,'ADMCOC','2010-11-30 09:27:19','(7 REPARTOS SAN FELIPE)','2010-11-24',2,200000017,1,2,NULL),
 (200000042,'188426',370,'ADMCOC','2010-12-06 18:21:49','( 7 repartos barinas)','2010-11-25',2,200000022,1,2,NULL),
 (200000043,'188427',390,'ADMCOC','2010-12-06 18:23:13','(1 reparto san felipe)','2010-11-25',2,200000023,1,2,NULL),
 (200000044,'188428',380,'ADMCOC','2010-12-15 11:49:42','(9 REPARTOS BARINAS-BARINITAS)','2010-11-25',2,200000113,1,2,NULL),
 (200000045,'188430',400,'ADMCOC','2010-12-06 18:20:04','','2010-11-25',2,200000019,1,2,NULL),
 (200000046,'188431',400,'ADMCOC','2010-12-07 16:10:46','','2010-11-25',2,200000042,1,2,NULL),
 (200000047,'188432',330,'ADMCOC','2010-12-10 08:47:30','(9 REPARTOS  ACARIGUA-PAYARA)','2010-11-25',2,200000052,1,2,NULL),
 (200000048,'188434',520,'ADMCOC','2010-12-15 10:16:45','(1 REPARTO BARINAS)','2010-11-25',2,200000105,1,2,NULL),
 (200000049,'188435',440,'ADMCOC','2010-12-07 07:41:43','(8 REP. MOTATAN-VALERA-PAMPAN-PAMPANITO-MONAY-CARVAJAL)','2010-11-25',2,200000026,1,2,NULL),
 (200000050,'188425',400,'ADMCOC','2010-12-07 07:50:42','(7 rep bqto)','2010-11-26',2,200000035,1,2,NULL),
 (200000051,'188437',410,'ADMCOC','2010-12-13 14:27:40','(12 repartos bqto)','2010-11-26',2,200000082,1,2,NULL),
 (200000052,'188444',410,'ADMCOC','2010-12-06 18:20:44','(12 repartos el destino es urachiche no se ha creado todavia)','2010-11-26',2,200000020,1,2,NULL),
 (200000053,'188447',320,'ADMCOC','2010-12-13 14:24:20','','2010-11-29',2,200000078,1,2,NULL),
 (200000054,'188440',420,'ADMCOC','2010-12-07 16:10:18','','2010-11-29',2,200000041,1,2,NULL),
 (200000055,'188441',560,'ADMCOC','2010-12-10 09:00:28','(2 REPARTOS SOCOPO)','2010-11-29',2,200000069,1,2,NULL),
 (200000056,'188445',400,'ADMCOC','2010-12-07 07:50:09','(6 REPARTOS BQTO-MERCABAR)','2010-11-29',2,200000034,1,2,NULL),
 (200000057,'188448',410,'ADMCOC','2010-12-13 17:34:28','(12 REPARTOS BQTO-CABUDARE)','2010-11-29',2,200000094,1,2,NULL),
 (200000058,'188355',390,'MARIO','2010-11-30 08:43:29','','2010-11-29',2,200000001,1,2,NULL),
 (200000059,'188442',410,'ADMCOC','2010-12-15 14:38:55','(1 repartos socopo)','2010-11-30',2,200000115,1,2,NULL),
 (200000060,'188364',400,'MARIO','2010-11-30 08:50:09','8 repartos','2010-11-30',2,200000002,1,2,NULL),
 (200000061,'188449',380,'ADMCOC','2010-12-10 08:53:49','(3 repartos barinas)','2010-11-30',2,200000059,1,2,NULL),
 (200000062,'188450',380,'ADMCOC','2010-12-07 16:07:57','(5 repartos santa barbara)','2010-11-30',2,200000039,1,2,NULL),
 (200000063,'191551',540,'ADMCOC','2010-12-10 14:46:03','(1 REPARTO BQTO)','2010-11-30',2,200000070,1,2,NULL),
 (200000064,'191552',390,'ADMCOC','2010-12-07 16:14:49','(1 REPARTO BQTO)','2010-11-30',2,200000047,1,2,NULL),
 (200000065,'191553',390,'ADMCOC','2010-12-10 08:47:00','(12 REP GUANARE-GUANARITO)','2010-11-30',2,200000051,1,2,NULL),
 (200000066,'191554',300,'ADMCOC','2010-12-07 16:09:53','(1 REP ACARIGUA)','2010-11-30',2,200000040,1,2,NULL),
 (200000067,'191555',400,'ADMCOC','2010-12-13 14:17:35','(5 REP CABUDARE-BQTO)','2010-11-30',2,200000074,1,2,NULL),
 (200000068,'191556',410,'ADMCOC','2010-12-15 14:40:11','(12 REP ACARIGUA-AGUA B-SAN R-APARTADERO)','2010-11-30',2,200000117,1,2,NULL),
 (200000069,'191560',230,'ADMCOC','2010-12-13 17:34:28','complemento de caleta \r\n\r\n\r\n','2010-12-01',2,200000094,1,2,NULL),
 (200000070,'191559',430,'ADMCOC','2010-12-10 08:58:53','(2 Rep Valera)','2010-12-01',2,200000066,1,2,NULL),
 (200000071,'191562',540,'ADMCOC','2010-12-10 08:59:55','(1 REPARTO BQTO)','2010-12-01',2,200000068,1,2,NULL),
 (200000072,'191563',380,'ADMCOC','2010-12-07 16:15:20','(5 REP GUANARE-BARINAS)','2010-12-01',2,200000048,1,2,NULL),
 (200000073,'191564',400,'ADMCOC','2010-12-13 17:34:57','(3 REP LA MIEL-BQTO)','2010-12-01',2,200000095,1,2,NULL),
 (200000074,'191566',490,'ADMCOC','2010-12-10 08:50:48','(2 REP EL AMPARO)','2010-12-02',2,200000056,1,2,NULL),
 (200000075,'191561',440,'ADMCOC','2010-12-08 15:42:08','(6 REP VALERA)','2010-12-02',3,NULL,0,2,NULL),
 (200000076,'191567',390,'ADMCOC','2010-12-15 14:39:37','(2 REP BQTO)','2010-12-02',2,200000116,1,2,NULL),
 (200000077,'191568',495,'ADMCOC','2010-12-10 08:57:38','(2 REP-GUASDUALITO-EL AMPARO)','2010-12-02',2,200000064,1,2,NULL),
 (200000078,'191569',410,'ADMCOC','2010-12-13 14:18:02','(12 REP CHIVACOA-SABANA DE PARRA-SAN FELIPE)','2010-12-02',2,200000075,1,2,NULL),
 (200000079,'191570',710,'ADMCOC','2010-12-10 08:59:25','(2 REP EL AMPARO)','2010-12-02',2,200000067,1,2,NULL),
 (200000080,'191571',400,'ADMCOC','2010-12-13 14:17:05','','2010-12-02',2,200000073,1,2,NULL),
 (200000081,'191572',370,'ADMCOC','2010-12-10 08:46:30','(1 REP BARINAS)','2010-12-03',2,200000050,1,2,NULL),
 (200000082,'191574',420,'ADMCOC','2010-12-13 14:26:16','(3 REP BRUZUAL)','2010-12-03',2,200000079,1,2,NULL),
 (200000083,'191575',400,'ADMCOC','2010-12-10 08:53:22','(7 REP DUACA)','2010-12-03',2,200000058,1,2,NULL),
 (200000084,'191578',410,'ADMCOC','2010-12-13 17:35:25','(8 REP BQTO)','2010-12-03',2,200000096,1,2,NULL),
 (200000085,'191579',530,'ADMCOC','2010-12-15 10:22:22','(7 REP CANC VIAJE A MESA DE CAVACA ESTA PENDIENTE POR CREAR DESTINO)','2010-12-03',2,200000108,1,2,NULL),
 (200000086,'191580',400,'ADMCOC','2010-12-10 08:50:20','( 8REP DUACA)','2010-12-03',2,200000055,1,2,NULL),
 (200000087,'191581',390,'ADMCOC','2010-12-10 08:57:08','(12 REP CANC VIAJE HASTA CHABASQUEN ESTA PENDIENTE CREAR DESTINO)','2010-12-03',2,200000063,1,2,NULL),
 (200000088,'191582',370,'ADMCOC','2010-12-13 14:18:27','(12 REP CANC VIAJE HASTA CHABASQUEN ESTA PENDIENTE CREAR DESTINO)','2010-12-03',2,200000076,1,2,NULL),
 (200000089,'191583',400,'ADMCOC','2010-12-10 08:54:51','','2010-12-03',2,200000061,1,2,NULL),
 (200000090,'191584',370,'ADMCOC','2010-12-13 14:28:05','(1 REP LIBERTAD)','2010-12-03',2,200000083,1,2,NULL),
 (200000091,'191586',430,'ADMCOC','2010-12-13 14:16:35','(2 Rep Caja Seca-Nva Bolivia)','2010-12-06',2,200000072,1,2,NULL),
 (200000092,'191587',400,'ADMCOC','2010-12-13 14:32:51','','2010-12-06',2,200000088,1,2,NULL),
 (200000093,'191573',390,'ADMCOC','2010-12-13 14:33:15','(1 Rep Bqto)','2010-12-06',2,200000089,1,2,NULL),
 (200000094,'191588',400,'ADMCOC','2010-12-10 08:54:22','(8 Rep-La Miel-Cabudare-Bqto)','2010-12-06',2,200000060,1,2,NULL),
 (200000095,'188369',400,'MARIO','2010-12-07 07:48:04','7 repartos','2010-12-07',2,200000033,1,2,NULL),
 (200000096,'191589',470,'ADMCOC','2010-12-15 10:22:52','(2 rep Acarigua)','2010-12-07',2,200000109,1,2,NULL),
 (200000097,'191590',430,'ADMCOC','2010-12-13 14:27:14','(2 Rep Buena Vista-Arapuey)','2010-12-07',2,200000081,1,2,NULL),
 (200000098,'191592',400,'ADMCOC','2010-12-13 14:23:55','(6 Rep - Bqto)','2010-12-07',2,200000077,1,2,NULL),
 (200000099,'191594',30,'ADMCOC','2010-12-10 08:53:22','complemento de caleta de viaje a duaca','2010-12-07',2,200000058,1,2,NULL),
 (200000100,'191595',420,'ADMCOC','2010-12-15 10:45:51','(4 Rep- Libertad- Dolores)','2010-12-07',2,200000111,1,2,NULL),
 (200000101,'191596',440,'ADMCOC','2010-12-13 14:26:42','(3 Rep Nueva Bolivia- Caja Seca)','2010-12-07',2,200000080,1,2,NULL),
 (200000102,'191597',410,'ADMCOC','2010-12-13 14:15:38','(3 Rep-Mercabar-Bqto)','2010-12-07',2,200000071,1,2,NULL),
 (200000103,'191598',485,'ADMCOC','2010-12-07 17:42:56','(4 Rep Nueva Bolivia-Caja Seca)','2010-12-07',1,NULL,0,2,NULL),
 (200000104,'191599',390,'ADMCOC','2010-12-13 14:31:44','( 2 Rep Bqto)','2010-12-08',2,200000086,1,2,NULL),
 (200000105,'191600',390,'ADMCOC','2010-12-13 14:32:16','(1 Rep Bqto)','2010-12-08',2,200000087,1,2,NULL),
 (200000106,'196101',60,'ADMCOC','2010-12-13 14:16:35','complemento de caleta','2010-12-08',2,200000072,1,2,NULL),
 (200000107,'191602',580,'ADMCOC','2010-12-15 10:23:26','(1 Rep Cja Seca)','2010-12-08',2,200000110,1,2,NULL),
 (200000108,'191561',440,'ADMCOC','2010-12-13 14:31:01','REEMPLAZO DEL ANTICIPO NÚMERO: 200000075','2010-12-08',2,200000085,1,2,200000075),
 (200000109,'188372',400,'MARIO','2010-12-08 17:16:01','3 repartos','2010-12-08',2,200000049,1,2,NULL),
 (200000110,'191603',400,'ADMCOC','2010-12-13 14:30:32','(7 Rep Via Duaca-Duaca-Bqto)','2010-12-08',2,200000084,1,2,NULL),
 (200000111,'191604',410,'ADMCOC','2010-12-13 14:33:43','(8 Rep Mercabar-Bqto)','2010-12-08',2,200000090,1,2,NULL),
 (200000112,'191605',430,'ADMCOC','2010-12-09 10:24:41','(2 Rep Sta Polonia-La Ceiba) Cancelar viaje hasta la ceiba pendiente por crear la  ruta por el sr Pedro Papic','2010-12-09',1,NULL,0,2,NULL),
 (200000113,'191608',400,'ADMCOC','2010-12-13 17:35:46','(4 REP BQTO)','2010-12-09',2,200000097,1,2,NULL),
 (200000114,'191609',510,'ADMCOC','2010-12-09 15:53:33','(4 Rep Capitanejo-El Amparo)','2010-12-09',1,NULL,0,2,NULL),
 (200000115,'191610',440,'ADMCOC','2010-12-09 17:12:31','(3 Rep Valera)','2010-12-09',1,NULL,0,2,NULL),
 (200000116,'191612',440,'ADMCOC','2010-12-13 17:32:15','(4 REP VALERA)','2010-12-09',2,200000091,1,2,NULL),
 (200000117,'188357',400,'MARIO','2010-12-10 08:52:38','9 repartos','2010-12-10',2,200000057,1,2,NULL),
 (200000118,'188367',410,'MARIO','2010-12-10 08:56:42','3 repartos','2010-12-10',2,200000062,1,2,NULL),
 (200000119,'191614',370,'ADMCOC','2010-12-10 09:56:04','(1 Rep Barinas)','2010-12-10',1,NULL,0,2,NULL),
 (200000120,'191616',400,'ADMCOC','2010-12-13 17:33:46','(2 Rep Bqto Mercabar)','2010-12-10',2,200000093,1,2,NULL),
 (200000121,'191615',400,'ADMCOC','2010-12-13 17:33:13','(Rep Bqto-Mercabar)','2010-12-10',2,200000092,1,2,NULL),
 (200000122,'191617',380,'ADMCOC','2010-12-13 17:36:10','(3 Rep Guanare)','2010-12-10',2,200000098,1,2,NULL),
 (200000123,'191618',405,'ADMCOC','2010-12-10 15:07:41','(5 Rep Guanare)','2010-12-10',1,NULL,0,2,NULL),
 (200000124,'191619',580,'ADMCOC','2010-12-10 15:23:02','(2 Rep Caja Seca-Nva Bolivia)','2010-12-10',1,NULL,0,2,NULL),
 (200000125,'191620',400,'ADMCOC','2010-12-10 16:42:58','(6 Rep Bqto)','2010-12-10',1,NULL,0,2,NULL),
 (200000126,'191621',400,'ADMCOC','2010-12-10 19:22:49','(9 REP SAN FELIPE)','2010-12-10',1,NULL,0,2,NULL),
 (200000127,'191622',380,'ADMCOC','2010-12-10 19:23:56','(6 REP GUANARE)','2010-12-10',1,NULL,0,2,NULL),
 (200000128,'191624',380,'ADMCOC','2010-12-10 19:26:50','(6 REP BARRANCAS-BARINAS)','2010-12-10',1,NULL,0,2,NULL),
 (200000129,'191625',330,'ADMCOC','2010-12-10 19:27:59','(6 REP ACARIGUA)','2010-12-10',1,NULL,0,2,NULL),
 (200000130,'191627',380,'ADMCOC','2010-12-14 16:00:50','(5 REP BARINAS)','2010-12-13',3,NULL,0,2,NULL),
 (200000131,'191628',330,'ADMCOC','2010-12-13 15:20:23','(6 REP ACARIGUA-PAYARA)','2010-12-13',1,NULL,0,2,NULL),
 (200000132,'191629',430,'ADMCOC','2010-12-13 16:30:14','(1 REP VALERA)','2010-12-13',1,NULL,0,2,NULL),
 (200000133,'189294',400,'MARIO','2010-12-13 18:30:25','7 repartos\r\n','2010-12-13',2,200000102,1,2,NULL),
 (200000134,'189278',400,'MARIO','2010-12-13 18:29:57','7 repartos','2010-12-13',2,200000101,1,2,NULL),
 (200000135,'189273',410,'MARIO','2010-12-13 18:29:31','','2010-12-13',2,200000100,1,2,NULL),
 (200000136,'12446697',440,'MARIO','2010-12-15 09:55:12','8 repartos','2010-12-13',3,NULL,1,2,NULL),
 (200000137,'191630',440,'ADMCOC','2010-12-14 10:29:11','(5 REP SABANA MENDOZA)','2010-12-14',1,NULL,0,2,NULL),
 (200000138,'191631',400,'ADMCOC','2010-12-14 10:58:53','(4 REP BQTO-CABUDARE)','2010-12-14',1,NULL,0,2,NULL),
 (200000139,'191633',405,'ADMCOC','2010-12-14 15:40:28','(8 REP GUANARE)','2010-12-14',1,NULL,0,2,NULL),
 (200000140,'191627',380,'ADMCOC','2010-12-14 16:03:41','(5 REP BARINAS-BARINITAS)','2010-12-14',1,NULL,0,2,NULL),
 (200000141,'191634',400,'ADMCOC','2010-12-14 17:07:15','(4 REP BQTO)','2010-12-14',1,NULL,0,2,NULL),
 (200000142,'191635',545,'ADMCOC','2010-12-14 17:39:10','(8 REP GUANARE-GUANARITO)','2010-12-14',1,NULL,0,2,NULL),
 (200000143,'191636',410,'ADMCOC','2010-12-14 17:43:03','(6 REP MERCABAR-BQTO)','2010-12-14',1,NULL,0,2,NULL),
 (200000144,'191637',400,'ADMCOC','2010-12-14 18:12:46','(5 REP BARQUISIMETO)','2010-12-14',1,NULL,0,2,NULL),
 (200000145,'191638',50,'ADMCOC','2010-12-14 18:20:28','COMPLEMENTO DE CALETA DE VIAJE','2010-12-14',1,NULL,0,2,NULL),
 (200000146,'188368',410,'MARIO','2010-12-15 11:37:11','6 repartos','2010-12-15',2,200000112,1,2,NULL),
 (200000147,'191639',380,'JLOZADA','2010-12-15 11:53:19','(4 REP GUANARE-BARINAS)','2010-12-15',1,NULL,0,2,NULL),
 (200000148,'191640',420,'JLOZADA','2010-12-15 12:02:27','(5 REP STA BARBARA)','2010-12-15',1,NULL,0,2,NULL),
 (200000149,'189208',440,'MARIO','2010-12-15 14:36:31','','2010-12-15',2,200000114,1,2,NULL),
 (200000150,'191641',400,'JLOZADA','2010-12-15 14:38:09','(7 REP BQTO-DUACA)','2010-12-15',1,NULL,0,2,NULL),
 (200000151,'191623',330,'JLOZADA','2010-12-15 15:26:45','(5 REP ACARIGUA)','2010-12-15',1,NULL,0,2,NULL),
 (200000152,'191642',420,'JLOZADA','2010-12-15 15:30:32','(4 REP SOCOPO-STA BARBARA)','2010-12-15',1,NULL,0,2,NULL),
 (200000153,'191644',400,'JLOZADA','2010-12-15 16:22:13','(8 REP BQTO-CADUDARE)','2010-12-15',1,NULL,0,2,NULL),
 (200000154,'191645',440,'JLOZADA','2010-12-15 16:57:26','(5 REP BETIJOQUE-VALERA)','2010-12-15',1,NULL,0,2,NULL),
 (200000155,'191646',390,'JLOZADA','2010-12-16 10:22:53','(2 REP BQTO)','2010-12-16',1,NULL,0,2,NULL),
 (200000156,'191647',390,'JLOZADA','2010-12-16 10:59:05','(1 REP BQTO)','2010-12-16',1,NULL,0,2,NULL),
 (200000157,'191648',410,'JLOZADA','2010-12-16 11:32:11','(12 REP BQTO-EL TOCUYO)','2010-12-16',1,NULL,0,2,NULL),
 (200000158,'191649',605,'JLOZADA','2010-12-16 12:02:06','(6 REP BOCONO)','2010-12-16',1,NULL,0,2,NULL),
 (200000159,'191650',400,'JLOZADA','2010-12-16 14:19:56','(12 REP CARORA)','2010-12-16',1,NULL,0,2,NULL),
 (200000160,'193603',430,'JLOZADA','2010-12-17 11:13:01','(1 REP VALERA)','2010-12-17',1,NULL,0,2,NULL),
 (200000161,'193604',410,'JLOZADA','2010-12-17 11:18:30','(12 REP BQTO)','2010-12-17',1,NULL,0,2,NULL),
 (200000162,'193605',400,'JLOZADA','2010-12-17 12:00:30','(8 REP BQTO)','2010-12-17',1,NULL,0,2,NULL),
 (200000163,'193606',430,'JLOZADA','2010-12-17 13:55:35','(2 REP VALERA)','2010-12-17',1,NULL,0,2,NULL),
 (200000164,'193607',440,'JLOZADA','2010-12-17 13:56:53','(4 REP VALERA-TRUJILLO)','2010-12-17',1,NULL,0,2,NULL),
 (200000165,'193608',430,'JLOZADA','2010-12-17 13:58:16','(1 REP CARVAJAL)','2010-12-17',1,NULL,0,2,NULL),
 (200000166,'193609',540,'JLOZADA','2010-12-17 14:02:52','(1 REP BQTO)','2010-12-17',1,NULL,0,2,NULL),
 (200000167,'193610',400,'JLOZADA','2010-12-17 14:04:13','(7 REP BQTO-QUIBOR)','2010-12-17',1,NULL,0,2,NULL),
 (200000168,'193611',400,'JLOZADA','2010-12-17 14:05:35','(9 REP SARARE-YARITAGUA)','2010-12-17',1,NULL,0,2,NULL),
 (200000169,'193613',400,'JLOZADA','2010-12-17 14:07:31','(8 REP YARITAGUA-CHIVACOA)','2010-12-17',1,NULL,0,2,NULL),
 (200000170,'193616',410,'JLOZADA','2010-12-20 16:38:18','(4 REP BQTO MERCABAR)','2010-12-20',1,NULL,0,2,NULL),
 (200000171,'193617',540,'JLOZADA','2010-12-20 18:33:39','(2 REP BQTO)','2010-12-20',1,NULL,0,2,NULL),
 (200000172,'193618',450,'ADMCOC','2010-12-21 11:29:16','3 repartos guacas de riberas- el canton- abejales','2010-12-21',1,NULL,0,2,NULL),
 (200000173,'193619',430,'JLOZADA','2010-12-21 14:35:17','(1 REP VALERA)','2010-12-21',1,NULL,0,2,NULL),
 (200000174,'193621',430,'JLOZADA','2010-12-21 15:27:55','(2 REP VALERA)','2010-12-21',1,NULL,0,2,NULL),
 (200000175,'193624',320,'JLOZADA','2010-12-21 16:03:48','(2 REP ACARIGUA)','2010-12-21',1,NULL,0,2,NULL),
 (200000176,'193623',410,'JLOZADA','2010-12-21 16:09:29','(12 REP ACARIGUA-AGUA BLANCA-SAN RAFAEL-OSPINO)','2010-12-21',1,NULL,0,2,NULL),
 (200000177,'193625',420,'JLOZADA','2010-12-21 16:19:46','(12 REP MERCABAR-BTO)','2010-12-21',1,NULL,0,2,NULL),
 (200000178,'193626',410,'JLOZADA','2010-12-21 17:13:31','(15 REP ACARIGUA-PIRITU-TUREN)','2010-12-21',1,NULL,0,2,NULL),
 (200000179,'193627',370,'JLOZADA','2010-12-21 17:27:49','(1 REP BARINAS)','2010-12-21',1,NULL,0,2,NULL),
 (200000180,'193628',400,'JLOZADA','2010-12-21 17:56:33','(4 REP BQTO)','2010-12-21',1,NULL,0,2,NULL),
 (200000181,'193629',605,'JLOZADA','2010-12-22 08:34:36','(3 REP VALERA-ESCUQUE)','2010-12-22',1,NULL,0,2,NULL),
 (200000182,'66666',600,'P','2011-01-06 11:32:15','','2011-01-06',1,NULL,0,2,NULL),
 (200000183,'321',321,'P','2011-01-06 11:32:00','','2011-01-06',1,NULL,0,2,NULL);
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
  `nid_bitacora` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctabla` varchar(20) NOT NULL,
  `coperacion` varchar(1) NOT NULL DEFAULT '' COMMENT 'I:Insert   U:Update   D:Delete\r\n',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha` datetime NOT NULL,
  `cregistro` varchar(20) NOT NULL,
  PRIMARY KEY (`nid_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=3781 DEFAULT CHARSET=latin1;

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
 (28,'torigen_destino','I','ADMIN','2010-08-05 19:22:14','12'),
 (29,'truta','I','ADMIN','2010-08-05 19:25:10','121'),
 (33,'tviaje','I','P','2010-08-05 19:39:41','29'),
 (34,'tvehiculo','I','ADMIN','2010-08-11 11:10:34','A62AA9D'),
 (35,'tChofer','I','ADMIN','2010-08-11 11:10:34','11081888'),
 (36,'tChofer','U','ADMIN','2010-08-11 11:24:48','11081888'),
 (37,'tChofer','U','ADMIN','2010-08-11 15:02:37','7599282'),
 (38,'tChofer','U','ADMIN','2010-08-11 16:06:38','10142878'),
 (39,'tperiodo','U','P','2010-08-16 15:43:45','07100810'),
 (40,'tvehiculo','I','ADMIN','2010-08-16 16:13:37','A15AU5D'),
 (41,'tChofer','I','ADMIN','2010-08-16 16:13:37','7547865'),
 (42,'tChofer','U','ADMIN','2010-08-16 16:25:08','10142878'),
 (43,'tChofer','U','ADMIN','2010-08-16 16:25:08','11081499'),
 (44,'tChofer','U','ADMIN','2010-08-16 16:25:08','11081888'),
 (45,'tChofer','U','ADMIN','2010-08-16 16:25:08','11547715'),
 (46,'tChofer','U','ADMIN','2010-08-16 16:25:08','16346069'),
 (47,'tChofer','U','ADMIN','2010-08-16 16:25:08','16751579'),
 (48,'tChofer','U','ADMIN','2010-08-16 16:25:08','7547865'),
 (49,'tChofer','U','ADMIN','2010-08-16 16:25:08','8603178'),
 (50,'tChofer','U','ADMIN','2010-08-16 16:25:08','9844698'),
 (51,'tChofer','I','ADMIN','2010-08-16 16:36:27','321'),
 (52,'tChofer','U','ADMIN','2010-08-16 16:36:44','321'),
 (53,'tChofer','D','ADMIN','2010-08-16 16:36:47','321'),
 (54,'tChofer','U','ADMIN','2010-08-16 16:45:11','7547865'),
 (55,'tChofer','U','ADMIN','2010-08-16 16:53:22','10142878'),
 (56,'tChofer','U','ADMIN','2010-08-16 16:55:29','10142878'),
 (57,'tvehiculo','I','ADMIN','2010-08-17 11:36:17','730OAD'),
 (58,'tChofer','I','ADMIN','2010-08-17 11:36:17','11545892'),
 (59,'tChofer','U','ADMIN','2010-08-17 11:36:54','11545892'),
 (60,'tvehiculo','I','ADMIN','2010-08-17 17:39:43','66XPAC'),
 (61,'tChofer','I','ADMIN','2010-08-17 17:39:44','15693221'),
 (62,'tChofer','U','ADMIN','2010-08-17 17:40:02','15693221'),
 (63,'torigen_destino','I','ADMIN','2010-08-17 17:55:05','13'),
 (64,'truta','I','ADMIN','2010-08-17 17:56:00','113'),
 (71,'tAnticipo','I','P','2010-08-18 11:03:51','17'),
 (72,'tviaje','I','P','2010-08-18 11:03:55','31'),
 (73,'torigen_destino','I','ADMIN','2010-08-18 11:52:37','14'),
 (74,'truta','I','ADMIN','2010-08-18 11:56:52','114'),
 (78,'tAnticipo','I','P','2010-08-18 12:07:57','21'),
 (79,'tviaje','I','P','2010-08-18 12:07:58','32'),
 (80,'tvehiculo','I','ADMIN','2010-08-18 14:22:43','39HDAO'),
 (81,'tChofer','I','ADMIN','2010-08-18 14:22:43','10139779'),
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
 (94,'tvehiculo','I','ADMIN','2010-09-08 17:33:34','A05AE7T'),
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
 (116,'ttipo_gasto','I','ADMIN','2010-09-16 14:58:57','01'),
 (117,'ttipo_gasto','I','ADMIN','2010-09-16 14:59:25','02'),
 (118,'ttipo_gasto','I','ADMIN','2010-09-16 14:59:50','05'),
 (119,'ttipo_gasto','I','ADMIN','2010-09-16 15:00:07','06'),
 (120,'ttipo_gasto','I','ADMIN','2010-09-16 15:00:29','07'),
 (121,'ttipo_gasto','I','ADMIN','2010-09-16 15:00:45','08'),
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
 (152,'torigen_destino','U','ADMIN','2010-09-24 14:52:36','1'),
 (153,'tsucursal','U','ADMIN','2010-09-24 14:52:36','1'),
 (154,'torigen_destino','U','ADMIN','2010-09-24 14:52:49','1'),
 (155,'tsucursal','U','ADMIN','2010-09-24 14:52:49','1'),
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
 (166,'tvehiculo','I','ADMIN','2010-10-01 15:23:24','A64AE3E'),
 (167,'tChofer','I','ADMIN','2010-10-01 15:23:24','9566638'),
 (168,'tChofer','U','ADMIN','2010-10-01 15:24:40','9566638'),
 (169,'tCiudad','I','ADMIN','2010-10-01 15:42:33','1502'),
 (170,'torigen_destino','I','ADMIN','2010-10-01 15:47:21','15'),
 (171,'truta','I','ADMIN','2010-10-01 15:48:34','115'),
 (172,'tAnticipo','I','P','2010-10-01 18:46:16','28'),
 (173,'tviaje','I','P','2010-10-01 18:46:17','35'),
 (174,'tAnticipo','I','P','2010-10-01 18:47:27','29'),
 (179,'tChofer','U','ADMIN','2010-10-01 18:59:56','10139779'),
 (180,'tAnticipo','U','P','2010-10-04 09:07:31','28'),
 (181,'tvehiculo','I','ADMIN','2010-10-04 09:32:57','A86AA0D'),
 (182,'tChofer','I','ADMIN','2010-10-04 09:32:57','9562700'),
 (183,'tChofer','U','ADMIN','2010-10-04 09:33:53','9562700'),
 (184,'talmacenista','I','P','2010-10-04 10:49:12','321'),
 (185,'talmacenista','I','P','2010-10-04 10:49:47','123'),
 (186,'talmacenista','U','P','2010-10-04 10:50:17','123'),
 (187,'talmacenista','D','P','2010-10-04 10:50:36','123'),
 (188,'talmacenista','I','P','2010-10-04 10:50:44','324'),
 (189,'tvehiculo','I','ADMIN','2010-10-04 11:52:44','A22AE3U'),
 (190,'tChofer','I','ADMIN','2010-10-04 11:52:44','12262801'),
 (191,'tvehiculo','I','ADMIN','2010-10-04 11:52:48','A13AG7E'),
 (192,'tChofer','I','ADMIN','2010-10-04 11:52:48','10637589'),
 (193,'tviaje','I','P','2010-10-04 11:53:39','36'),
 (194,'torigen_destino','I','ADMIN','2010-10-04 15:30:44','16'),
 (195,'truta','I','ADMIN','2010-10-04 15:31:05','116'),
 (196,'tAnticipo','I','P','2010-10-04 15:35:37','30'),
 (197,'tviaje','I','P','2010-10-04 15:35:37','37'),
 (198,'torigen_destino','I','ADMIN','2010-10-04 16:04:16','17'),
 (199,'tsucursal','I','ADMIN','2010-10-04 16:04:16','5'),
 (200,'torigen_destino','I','ADMIN','2010-10-04 16:04:57','18'),
 (201,'tsucursal','I','ADMIN','2010-10-04 16:04:57','6'),
 (202,'torigen_destino','I','ADMIN','2010-10-04 16:37:15','19'),
 (203,'tsucursal','I','ADMIN','2010-10-04 16:37:15','7'),
 (204,'truta','I','ADMIN','2010-10-04 16:40:28','117'),
 (205,'torigen_destino','U','ADMIN','2010-10-04 16:46:01','18'),
 (206,'tsucursal','U','ADMIN','2010-10-04 16:46:01','6'),
 (207,'truta','I','ADMIN','2010-10-04 16:47:09','118'),
 (208,'tvehiculo','I','ADMIN','2010-10-04 16:55:44','A86AA/OD'),
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
 (231,'tChofer','U','ADMIN','2010-10-05 18:10:55','10139779'),
 (232,'tChofer','U','ADMIN','2010-10-05 18:11:03','10139779'),
 (233,'tChofer','I','ADMIN','2010-10-05 18:11:25','2314123'),
 (234,'tChofer','D','ADMIN','2010-10-05 18:11:29','2314123'),
 (235,'tvehiculo','U','ADMIN','2010-10-05 18:12:17','22MDBB'),
 (236,'tvehiculo','U','ADMIN','2010-10-05 18:12:38','22MDBB'),
 (237,'tvehiculo','U','ADMIN','2010-10-05 18:12:47','22MDBB'),
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
 (262,'tvehiculo','I','ADMIN','2010-10-06 21:14:55','A75A/D1I'),
 (263,'tChofer','I','ADMIN','2010-10-06 21:14:55','9568641'),
 (264,'tvehiculo','I','ADMIN','2010-10-06 21:15:56','76SDAR'),
 (265,'tChofer','I','ADMIN','2010-10-06 21:15:56','7241360'),
 (266,'tvehiculo','I','ADMIN','2010-10-06 21:27:52','36R/DAR'),
 (267,'tRelacion','I','P','2010-10-06 21:39:28','1000000001'),
 (268,'tAnticipo','U','P','2010-10-06 21:39:28','1000000001'),
 (269,'torigen_destino','I','ADMIN','2010-10-07 10:32:09','20'),
 (270,'tsucursal','I','ADMIN','2010-10-07 10:32:09','8'),
 (271,'torigen_destino','I','ADMIN','2010-10-07 10:32:13','21'),
 (272,'tsucursal','I','ADMIN','2010-10-07 10:32:13','9'),
 (273,'torigen_destino','I','ADMIN','2010-10-07 10:34:04','22'),
 (274,'tsucursal','I','ADMIN','2010-10-07 10:34:04','10'),
 (275,'torigen_destino','I','ADMIN','2010-10-07 12:02:07','23'),
 (276,'tsucursal','I','ADMIN','2010-10-07 12:02:07','11'),
 (277,'torigen_destino','I','ADMIN','2010-10-07 12:02:15','24'),
 (278,'tsucursal','I','ADMIN','2010-10-07 12:02:15','12'),
 (283,'torigen_destino','I','ADMIN','2010-10-07 14:47:34','27'),
 (284,'tsucursal','I','ADMIN','2010-10-07 14:47:34','15'),
 (285,'tgasto_serv','I','P','2010-10-07 16:06:03','100000001'),
 (286,'tgasto_serv','I','P','2010-10-07 16:07:05','100000002'),
 (287,'tvehiculo','U','ADMIN','2010-10-07 16:20:05','A02AF5T'),
 (288,'tgasto_serv','I','P','2010-10-07 16:20:35','200000001'),
 (289,'tgasto_serv','I','P','2010-10-07 16:21:07','200000002'),
 (290,'tgasto_serv','I','P','2010-10-07 16:24:21','200000003'),
 (291,'tAnticipo','I','P','2010-10-07 16:43:54','100000001'),
 (292,'tviaje','I','P','2010-10-07 16:43:54','100000001'),
 (293,'tvehiculo','I','ADMIN','2010-10-07 16:45:07','81XPAC'),
 (294,'tChofer','I','ADMIN','2010-10-07 16:45:07','11273120'),
 (295,'tAnticipo','I','P','2010-10-07 16:45:25','100000002'),
 (296,'tviaje','I','P','2010-10-07 16:45:25','100000002'),
 (297,'tvehiculo','I','ADMIN','2010-10-07 17:05:12','48SDAR'),
 (298,'tChofer','I','ADMIN','2010-10-07 17:05:12','8657021'),
 (299,'tvehiculo','I','ADMIN','2010-10-07 17:05:45','06NDAS'),
 (300,'tChofer','I','ADMIN','2010-10-07 17:05:45','11849935'),
 (301,'tChofer','U','ADMIN','2010-10-07 17:06:10','11849935'),
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
 (323,'ttipo_gasto','D','ADMIN','2010-10-07 17:09:48','01'),
 (324,'ttipo_gasto','D','ADMIN','2010-10-07 17:09:48','02'),
 (325,'ttipo_gasto','D','ADMIN','2010-10-07 17:09:48','05'),
 (326,'ttipo_gasto','D','ADMIN','2010-10-07 17:09:48','06'),
 (327,'ttipo_gasto','D','ADMIN','2010-10-07 17:09:48','07'),
 (328,'ttipo_gasto','D','ADMIN','2010-10-07 17:09:48','08'),
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
 (388,'tChofer','D','ADMIN','2010-10-07 18:31:19','10139779'),
 (389,'tChofer','D','ADMIN','2010-10-07 18:31:19','10142878'),
 (390,'tChofer','D','ADMIN','2010-10-07 18:31:19','10637589'),
 (391,'tChofer','D','ADMIN','2010-10-07 18:31:19','11081499'),
 (392,'tChofer','D','ADMIN','2010-10-07 18:31:19','11081888'),
 (393,'tChofer','D','ADMIN','2010-10-07 18:31:19','11273120'),
 (394,'tChofer','D','ADMIN','2010-10-07 18:31:19','11545892'),
 (395,'tChofer','D','ADMIN','2010-10-07 18:31:19','11547715'),
 (396,'tChofer','D','ADMIN','2010-10-07 18:31:19','11849935'),
 (397,'tChofer','D','ADMIN','2010-10-07 18:31:19','12262801'),
 (398,'tChofer','D','ADMIN','2010-10-07 18:31:19','15693221'),
 (399,'tChofer','D','ADMIN','2010-10-07 18:31:19','16346069'),
 (400,'tChofer','D','ADMIN','2010-10-07 18:31:19','16751579'),
 (401,'tChofer','D','ADMIN','2010-10-07 18:31:19','7241360'),
 (402,'tChofer','D','ADMIN','2010-10-07 18:31:19','7547865'),
 (403,'tChofer','D','ADMIN','2010-10-07 18:31:19','7599282'),
 (404,'tChofer','D','ADMIN','2010-10-07 18:31:19','8603178'),
 (405,'tChofer','D','ADMIN','2010-10-07 18:31:19','8657021'),
 (406,'tChofer','D','ADMIN','2010-10-07 18:31:19','9562700'),
 (407,'tChofer','D','ADMIN','2010-10-07 18:31:19','9566638'),
 (408,'tChofer','D','ADMIN','2010-10-07 18:31:19','9568641'),
 (409,'tChofer','D','ADMIN','2010-10-07 18:31:19','9844698'),
 (410,'tgrupo_servicio','D','P','2010-10-07 18:31:21','01'),
 (411,'tgrupo_servicio','D','P','2010-10-07 18:31:21','02'),
 (412,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','1'),
 (413,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','2'),
 (414,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','3'),
 (415,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','4'),
 (416,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','5'),
 (417,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','6'),
 (418,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','7'),
 (419,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','8'),
 (420,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','9'),
 (421,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','10'),
 (422,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','11'),
 (423,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','12'),
 (424,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','13'),
 (425,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','14'),
 (426,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','15'),
 (427,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','16'),
 (428,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','17'),
 (429,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','18'),
 (430,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','19'),
 (431,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','20'),
 (432,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','21'),
 (433,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','22'),
 (434,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','23'),
 (435,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','24'),
 (436,'torigen_destino','D','ADMIN','2010-10-07 18:31:22','27'),
 (437,'tperiodo','D','P','2010-10-07 18:31:23','07100810'),
 (438,'tperiodo','D','P','2010-10-07 18:31:23','16091510'),
 (439,'tsucursal','D','ADMIN','2010-10-07 18:31:25','1'),
 (440,'tsucursal','D','ADMIN','2010-10-07 18:31:25','2'),
 (441,'tsucursal','D','ADMIN','2010-10-07 18:31:25','4'),
 (442,'tsucursal','D','ADMIN','2010-10-07 18:31:25','5'),
 (443,'tsucursal','D','ADMIN','2010-10-07 18:31:25','6'),
 (444,'tsucursal','D','ADMIN','2010-10-07 18:31:25','7'),
 (445,'tsucursal','D','ADMIN','2010-10-07 18:31:25','8'),
 (446,'tsucursal','D','ADMIN','2010-10-07 18:31:25','9'),
 (447,'tsucursal','D','ADMIN','2010-10-07 18:31:25','10'),
 (448,'tsucursal','D','ADMIN','2010-10-07 18:31:25','11'),
 (449,'tsucursal','D','ADMIN','2010-10-07 18:31:25','12'),
 (450,'tsucursal','D','ADMIN','2010-10-07 18:31:25','15'),
 (451,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','06NDAS'),
 (452,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','22MDBB'),
 (453,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','36R/DAR'),
 (454,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','36RDAR'),
 (455,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','39HDAO'),
 (456,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','48SDAR'),
 (457,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','61MDAS'),
 (458,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','66XPAC'),
 (459,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','730OAD'),
 (460,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','76SDAR'),
 (461,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','81XPAC'),
 (462,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A02AF5T'),
 (463,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A05AE7T'),
 (464,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A13AG7E'),
 (465,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A15AU5D'),
 (466,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A22AB1D'),
 (467,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A22AE2U'),
 (468,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A22AE3U'),
 (469,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A62AA9D'),
 (470,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A64/AE2E'),
 (471,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A64AE3E'),
 (472,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A71AE4E'),
 (473,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A75A/D1I'),
 (474,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A86AA/OD'),
 (475,'tvehiculo','D','ADMIN','2010-10-07 18:31:29','A86AA0D'),
 (476,'trelacion','D','P','2010-10-08 08:04:00','1'),
 (477,'trelacion','D','P','2010-10-08 08:04:00','2'),
 (478,'trelacion','D','P','2010-10-08 08:04:00','3'),
 (479,'trelacion','D','P','2010-10-08 08:04:00','4'),
 (480,'trelacion','D','P','2010-10-08 08:04:00','5'),
 (481,'trelacion','D','P','2010-10-08 08:04:00','1000000001'),
 (482,'torigen_destino','I','ADMIN','2010-10-08 15:15:07','1'),
 (483,'tsucursal','I','ADMIN','2010-10-08 15:15:07','1'),
 (484,'torigen_destino','I','ADMIN','2010-10-08 15:18:00','2'),
 (485,'tsucursal','I','ADMIN','2010-10-08 15:18:00','2'),
 (486,'torigen_destino','I','ADMIN','2010-10-08 15:18:42','3'),
 (487,'tsucursal','I','ADMIN','2010-10-08 15:18:42','3'),
 (488,'torigen_destino','I','ADMIN','2010-10-08 15:20:20','4'),
 (489,'tsucursal','I','ADMIN','2010-10-08 15:20:20','4'),
 (490,'torigen_destino','I','ADMIN','2010-10-08 15:22:13','5'),
 (491,'tsucursal','I','ADMIN','2010-10-08 15:22:13','5'),
 (492,'torigen_destino','I','ADMIN','2010-10-08 15:22:37','6'),
 (493,'tsucursal','I','ADMIN','2010-10-08 15:22:37','6'),
 (494,'tsucursal','U','ADMIN','2010-10-08 15:24:29','5'),
 (495,'tsucursal','U','ADMIN','2010-10-08 15:25:06','3'),
 (496,'tsucursal','U','ADMIN','2010-10-08 15:25:37','4'),
 (497,'tsucursal','U','ADMIN','2010-10-08 15:26:49','4'),
 (498,'tsucursal','U','ADMIN','2010-10-08 15:27:26','5'),
 (499,'tsucursal','U','ADMIN','2010-10-08 15:27:47','6'),
 (500,'tsucursal','U','ADMIN','2010-10-08 15:28:15','3'),
 (501,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0101'),
 (502,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0201'),
 (503,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0301'),
 (504,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0401'),
 (505,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0501'),
 (506,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0601'),
 (507,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0701'),
 (508,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0801'),
 (509,'tCiudad','U','ADMIN','2010-10-08 15:51:38','0901'),
 (510,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1001'),
 (511,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1101'),
 (512,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1201'),
 (513,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1301'),
 (514,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1401'),
 (515,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1501'),
 (516,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1601'),
 (517,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1701'),
 (518,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1702'),
 (519,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1801'),
 (520,'tCiudad','U','ADMIN','2010-10-08 15:51:38','1901'),
 (521,'tCiudad','U','ADMIN','2010-10-08 15:51:38','2001'),
 (522,'tCiudad','U','ADMIN','2010-10-08 15:51:38','2101'),
 (523,'tCiudad','U','ADMIN','2010-10-08 15:51:38','2201'),
 (524,'tCiudad','U','ADMIN','2010-10-08 15:51:38','2301'),
 (525,'tCiudad','U','ADMIN','2010-10-08 15:51:38','2401'),
 (526,'tEstado','U','ADMIN','2010-10-08 15:51:55','01'),
 (527,'tEstado','U','ADMIN','2010-10-08 15:51:55','02'),
 (528,'tEstado','U','ADMIN','2010-10-08 15:51:55','04'),
 (529,'tEstado','U','ADMIN','2010-10-08 15:51:55','05'),
 (530,'tEstado','U','ADMIN','2010-10-08 15:51:55','06'),
 (531,'tEstado','U','ADMIN','2010-10-08 15:51:55','07'),
 (532,'tEstado','U','ADMIN','2010-10-08 15:51:55','09'),
 (533,'tEstado','U','ADMIN','2010-10-08 15:51:55','10'),
 (534,'tEstado','U','ADMIN','2010-10-08 15:51:55','11'),
 (535,'tEstado','U','ADMIN','2010-10-08 15:51:55','12'),
 (536,'tEstado','U','ADMIN','2010-10-08 15:51:55','13'),
 (537,'tEstado','U','ADMIN','2010-10-08 15:51:55','14'),
 (538,'tEstado','U','ADMIN','2010-10-08 15:51:55','15'),
 (539,'tEstado','U','ADMIN','2010-10-08 15:51:55','16'),
 (540,'tEstado','U','ADMIN','2010-10-08 15:51:55','17'),
 (541,'tEstado','U','ADMIN','2010-10-08 15:51:55','18'),
 (542,'tEstado','U','ADMIN','2010-10-08 15:51:55','19'),
 (543,'tEstado','U','ADMIN','2010-10-08 15:51:55','20'),
 (544,'tEstado','U','ADMIN','2010-10-08 15:51:55','21'),
 (545,'tEstado','U','ADMIN','2010-10-08 15:51:55','22'),
 (546,'tEstado','U','ADMIN','2010-10-08 15:51:55','23'),
 (547,'tEstado','U','ADMIN','2010-10-08 15:51:55','24'),
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
 (600,'tsucursal','U','ADMIN','2010-10-08 15:53:49','1'),
 (601,'tsucursal','U','ADMIN','2010-10-08 15:53:58','2'),
 (602,'tusuario','D','CARLOS','2010-10-08 15:59:07','CARLOS'),
 (603,'truta','I','ADMIN','2010-10-08 17:32:51','13'),
 (604,'truta','I','ADMIN','2010-10-08 17:34:16','14'),
 (605,'truta','I','ADMIN','2010-10-08 17:36:11','15'),
 (606,'truta','I','ADMIN','2010-10-08 17:37:50','16'),
 (607,'tCiudad','I','ADMIN','2010-10-08 17:41:12','0202'),
 (608,'tCiudad','D','ADMIN','2010-10-08 17:41:49','0202'),
 (609,'tCiudad','I','ADMIN','2010-10-08 17:42:04','0202'),
 (610,'tCiudad','I','ADMIN','2010-10-08 17:42:18','0203'),
 (611,'tCiudad','D','ADMIN','2010-10-08 17:42:33','0203'),
 (612,'tCiudad','I','ADMIN','2010-10-08 17:43:05','0203'),
 (613,'tCiudad','I','ADMIN','2010-10-08 17:43:18','0204'),
 (614,'tCiudad','I','ADMIN','2010-10-08 17:43:33','0205'),
 (615,'tCiudad','I','ADMIN','2010-10-08 17:43:59','0206'),
 (616,'tCiudad','I','ADMIN','2010-10-08 17:44:28','0207'),
 (617,'tCiudad','I','ADMIN','2010-10-08 17:48:23','1503'),
 (618,'tCiudad','U','ADMIN','2010-10-08 17:48:36','1503'),
 (619,'tCiudad','I','ADMIN','2010-10-08 17:48:56','1504'),
 (620,'tCiudad','I','ADMIN','2010-10-08 17:49:25','1505'),
 (621,'tCiudad','I','ADMIN','2010-10-08 17:51:41','2202'),
 (622,'tCiudad','I','ADMIN','2010-10-08 17:52:03','2203'),
 (623,'tCiudad','I','ADMIN','2010-10-08 17:52:17','2204'),
 (624,'tCiudad','I','ADMIN','2010-10-08 17:57:47','1402'),
 (625,'tCiudad','I','ADMIN','2010-10-08 17:58:07','1403'),
 (626,'tCiudad','U','ADMIN','2010-10-08 17:58:26','1403'),
 (627,'tCiudad','I','ADMIN','2010-10-08 17:58:46','1404'),
 (628,'tCiudad','I','ADMIN','2010-10-08 17:59:06','1405'),
 (629,'tCiudad','I','ADMIN','2010-10-08 17:59:30','1406'),
 (630,'tCiudad','I','ADMIN','2010-10-08 17:59:49','1407'),
 (631,'tCiudad','I','ADMIN','2010-10-08 18:01:15','1002'),
 (632,'tCiudad','I','ADMIN','2010-10-08 18:03:51','0402'),
 (633,'tCiudad','I','ADMIN','2010-10-08 18:04:12','0403'),
 (634,'tCiudad','I','ADMIN','2010-10-08 18:04:28','0404'),
 (635,'tCiudad','I','ADMIN','2010-10-08 18:06:32','0802'),
 (636,'tCiudad','I','ADMIN','2010-10-08 18:06:42','0803'),
 (637,'tCiudad','I','ADMIN','2010-10-08 18:07:08','0804'),
 (638,'tCiudad','I','ADMIN','2010-10-08 18:08:25','2002'),
 (639,'tCiudad','I','ADMIN','2010-10-08 18:08:53','2003'),
 (640,'torigen_destino','I','ADMIN','2010-10-08 18:11:04','7'),
 (641,'torigen_destino','I','ADMIN','2010-10-08 18:11:41','8'),
 (642,'torigen_destino','I','ADMIN','2010-10-08 18:12:01','9'),
 (643,'torigen_destino','I','ADMIN','2010-10-08 18:12:30','10'),
 (644,'torigen_destino','I','ADMIN','2010-10-08 18:13:00','11'),
 (645,'torigen_destino','I','ADMIN','2010-10-08 18:13:21','12'),
 (646,'torigen_destino','I','ADMIN','2010-10-08 18:13:43','13'),
 (647,'torigen_destino','I','ADMIN','2010-10-08 18:13:59','14'),
 (648,'torigen_destino','I','ADMIN','2010-10-08 18:14:20','15'),
 (649,'torigen_destino','I','ADMIN','2010-10-08 18:15:05','16'),
 (650,'torigen_destino','I','ADMIN','2010-10-08 18:15:25','17'),
 (651,'torigen_destino','I','ADMIN','2010-10-08 18:15:45','18'),
 (652,'torigen_destino','I','ADMIN','2010-10-08 18:16:15','19'),
 (653,'torigen_destino','I','ADMIN','2010-10-08 18:16:37','20'),
 (654,'torigen_destino','I','ADMIN','2010-10-08 18:16:54','21'),
 (655,'torigen_destino','I','ADMIN','2010-10-08 18:19:55','22'),
 (656,'torigen_destino','I','ADMIN','2010-10-08 18:21:02','23'),
 (657,'torigen_destino','I','ADMIN','2010-10-08 18:21:17','24'),
 (658,'torigen_destino','I','ADMIN','2010-10-08 18:21:43','25'),
 (659,'torigen_destino','I','ADMIN','2010-10-08 18:22:04','26'),
 (660,'torigen_destino','I','ADMIN','2010-10-08 18:26:19','27'),
 (661,'tCiudad','I','ADMIN','2010-10-08 18:27:53','2302'),
 (662,'tCiudad','I','ADMIN','2010-10-08 18:28:22','2303'),
 (663,'tCiudad','I','ADMIN','2010-10-08 18:28:46','2304'),
 (664,'tCiudad','I','ADMIN','2010-10-08 18:29:09','2305'),
 (665,'torigen_destino','I','ADMIN','2010-10-08 18:30:46','28'),
 (666,'torigen_destino','I','ADMIN','2010-10-08 18:31:09','29'),
 (667,'torigen_destino','I','ADMIN','2010-10-08 18:32:02','30'),
 (668,'torigen_destino','I','ADMIN','2010-10-08 18:33:01','31'),
 (669,'torigen_destino','I','ADMIN','2010-10-08 18:33:35','32'),
 (670,'torigen_destino','I','ADMIN','2010-10-08 18:33:50','33'),
 (671,'torigen_destino','I','ADMIN','2010-10-08 18:34:07','34'),
 (672,'torigen_destino','I','ADMIN','2010-10-08 18:34:58','35'),
 (673,'tCiudad','I','ADMIN','2010-10-11 08:32:10','1102'),
 (674,'torigen_destino','I','ADMIN','2010-10-11 08:32:48','36'),
 (675,'truta','I','ADMIN','2010-10-11 08:35:09','136'),
 (676,'truta','I','ADMIN','2010-10-11 08:37:24','135'),
 (677,'truta','I','ADMIN','2010-10-11 08:39:55','114'),
 (678,'truta','I','ADMIN','2010-10-11 10:09:28','132'),
 (679,'truta','I','ADMIN','2010-10-11 10:10:26','134'),
 (680,'truta','I','ADMIN','2010-10-11 10:11:51','131'),
 (681,'truta','I','ADMIN','2010-10-11 10:14:53','133'),
 (682,'truta','I','ADMIN','2010-10-11 10:37:29','64'),
 (683,'truta','I','ADMIN','2010-10-11 10:40:01','126'),
 (684,'torigen_destino','D','ADMIN','2010-10-11 10:41:21','29'),
 (685,'truta','I','ADMIN','2010-10-13 08:21:48','128'),
 (686,'truta','I','ADMIN','2010-10-13 08:23:18','271'),
 (687,'truta','I','ADMIN','2010-10-13 08:31:32','116'),
 (688,'tPeriodo','I','P','2010-10-13 09:02:16','16091510'),
 (689,'tvehiculo','I','ADMIN','2010-10-13 09:03:09','65XPAC'),
 (690,'tChofer','I','ADMIN','2010-10-13 09:03:09','13486315'),
 (691,'tChofer','U','ADMIN','2010-10-13 09:03:53','13486315'),
 (692,'tvehiculo','I','ADMIN','2010-10-13 09:06:23','A75AD1/I'),
 (693,'tChofer','I','ADMIN','2010-10-13 09:06:23','9568641'),
 (694,'tvehiculo','I','ADMIN','2010-10-13 09:06:36','A86AA0D'),
 (695,'tChofer','I','ADMIN','2010-10-13 09:06:36','9562700'),
 (696,'tvehiculo','I','ADMIN','2010-10-13 09:06:44','A64AE3E'),
 (697,'tChofer','I','ADMIN','2010-10-13 09:06:44','9566638'),
 (698,'tChofer','U','ADMIN','2010-10-13 09:07:03','9562700'),
 (699,'tChofer','U','ADMIN','2010-10-13 09:07:37','9566638'),
 (700,'tChofer','U','ADMIN','2010-10-13 09:07:48','9568641'),
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
 (715,'ttipo_gasto','I','ADMIN','2010-10-13 10:02:17','01'),
 (716,'ttipo_gasto','I','ADMIN','2010-10-13 10:02:43','02'),
 (717,'ttipo_gasto','I','ADMIN','2010-10-13 10:03:25','06'),
 (718,'ttipo_gasto','I','ADMIN','2010-10-13 10:07:47','05'),
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
 (742,'tvehiculo','I','ADMIN','2010-10-13 14:43:41','A75A/D1I'),
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
 (753,'ttipo_gasto','I','ADMIN','2010-10-14 15:44:05','08'),
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
 (785,'tvehiculo','I','ADMIN','2010-10-18 14:39:41','A22AE3U'),
 (786,'tChofer','I','ADMIN','2010-10-18 14:39:41','12262801'),
 (787,'tChofer','U','ADMIN','2010-10-18 14:40:20','12262801'),
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
 (800,'tvehiculo','I','ADMIN','2010-10-18 14:54:11','A86AA/OD'),
 (801,'tvehiculo','I','ADMIN','2010-10-18 14:54:23','A62AA9D'),
 (802,'tChofer','I','ADMIN','2010-10-18 14:54:23','11081888'),
 (803,'tvehiculo','I','ADMIN','2010-10-18 14:54:38','A15AU8D'),
 (804,'tChofer','I','ADMIN','2010-10-18 14:54:38','9841618'),
 (805,'tvehiculo','I','ADMIN','2010-10-18 14:54:48','76SDAR'),
 (806,'tChofer','I','ADMIN','2010-10-18 14:54:48','7241360'),
 (807,'tvehiculo','I','ADMIN','2010-10-18 14:55:00','39HDAO'),
 (808,'tChofer','I','ADMIN','2010-10-18 14:55:00','10139779'),
 (809,'tvehiculo','I','ADMIN','2010-10-18 14:55:14','48SDAR'),
 (810,'tChofer','I','ADMIN','2010-10-18 14:55:14','8657021'),
 (811,'tvehiculo','I','ADMIN','2010-10-18 14:55:30','61MDAS'),
 (812,'tChofer','I','ADMIN','2010-10-18 14:55:30','8603178'),
 (813,'tChofer','U','ADMIN','2010-10-18 14:57:05','7241360'),
 (814,'tChofer','U','ADMIN','2010-10-18 14:57:59','8657021'),
 (815,'tChofer','U','ADMIN','2010-10-18 14:58:16','10139779'),
 (816,'tChofer','U','ADMIN','2010-10-18 14:58:52','9841618'),
 (817,'tChofer','U','ADMIN','2010-10-18 14:59:13','11081888'),
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
 (830,'tChofer','U','ADMIN','2010-10-18 15:14:31','13486315'),
 (831,'tChofer','U','ADMIN','2010-10-18 15:14:59','13486315'),
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
 (864,'tvehiculo','I','ADMIN','2010-10-18 15:59:30','A15AU5D'),
 (865,'tChofer','I','ADMIN','2010-10-18 15:59:30','7547865'),
 (866,'tvehiculo','I','ADMIN','2010-10-18 15:59:43','09JGAK'),
 (867,'tChofer','I','ADMIN','2010-10-18 15:59:43','14000037'),
 (868,'tvehiculo','I','ADMIN','2010-10-18 16:00:17','67XPAC'),
 (869,'tChofer','I','ADMIN','2010-10-18 16:00:17','15107255'),
 (870,'tChofer','U','ADMIN','2010-10-18 16:01:28','15107255'),
 (871,'tChofer','U','ADMIN','2010-10-18 16:01:48','14000037'),
 (872,'tChofer','U','ADMIN','2010-10-18 16:02:07','7547865'),
 (873,'truta','I','ADMIN','2010-10-18 16:04:40','123'),
 (874,'tAnticipo','I','P','2010-10-18 16:05:18','100000021'),
 (875,'tviaje','I','P','2010-10-18 16:05:18','100000020'),
 (876,'tAnticipo','U','P','2010-10-18 16:08:44','100000021'),
 (877,'tAnticipo','I','P','2010-10-18 16:09:30','100000022'),
 (878,'tviaje','I','P','2010-10-18 16:09:30','100000021'),
 (879,'tAnticipo','I','P','2010-10-18 16:10:44','100000023'),
 (880,'tviaje','I','P','2010-10-18 16:10:44','100000022'),
 (881,'tAnticipo','I','P','2010-10-18 16:11:49','100000024'),
 (882,'tviaje','I','P','2010-10-18 16:11:49','100000023'),
 (883,'truta','I','ADMIN','2010-10-18 16:20:26','63'),
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
 (901,'tvehiculo','U','ADMIN','2010-10-20 10:56:19','65XPAC'),
 (902,'tvehiculo','U','ADMIN','2010-10-20 11:25:05','65XPAC'),
 (903,'tvehiculo','U','ADMIN','2010-10-20 11:31:06','65XPAC'),
 (904,'tvehiculo','U','ADMIN','2010-10-20 11:31:15','65XPAC'),
 (905,'tvehiculo','U','ADMIN','2010-10-20 11:31:22','65XPAC'),
 (906,'tsucursal','U','ADMIN','2010-10-20 11:44:05','1'),
 (907,'tsucursal','U','ADMIN','2010-10-20 11:44:05','2'),
 (908,'tsucursal','U','ADMIN','2010-10-20 11:44:05','3'),
 (909,'tsucursal','U','ADMIN','2010-10-20 11:44:05','4'),
 (910,'tsucursal','U','ADMIN','2010-10-20 11:44:05','5'),
 (911,'tsucursal','U','ADMIN','2010-10-20 11:44:05','6'),
 (912,'tsucursal','U','ADMIN','2010-10-20 12:03:42','1'),
 (913,'torigen_destino','U','ADMIN','2010-10-20 12:04:08','1'),
 (914,'tsucursal','U','ADMIN','2010-10-20 12:04:08','1'),
 (915,'torigen_destino','U','ADMIN','2010-10-20 12:04:16','1'),
 (916,'tsucursal','U','ADMIN','2010-10-20 12:04:16','1'),
 (917,'tsucursal','U','ADMIN','2010-10-20 12:13:42','1'),
 (918,'tsucursal','U','ADMIN','2010-10-20 12:14:20','1'),
 (919,'tvehiculo','U','ADMIN','2010-10-20 14:23:05','09JGAK'),
 (920,'tvehiculo','U','ADMIN','2010-10-20 14:24:08','39HDAO'),
 (921,'tvehiculo','U','ADMIN','2010-10-20 14:24:57','48SDAR'),
 (922,'tvehiculo','D','ADMIN','2010-10-20 14:26:44','61MDAS'),
 (923,'tvehiculo','U','ADMIN','2010-10-20 14:28:24','65XPAC'),
 (924,'tvehiculo','U','ADMIN','2010-10-20 14:29:31','67XPAC'),
 (925,'tvehiculo','U','ADMIN','2010-10-20 15:11:44','76SDAR'),
 (926,'tvehiculo','U','ADMIN','2010-10-20 15:25:04','A15AU5D'),
 (927,'tvehiculo','U','ADMIN','2010-10-20 15:25:39','A15AU8D'),
 (928,'tvehiculo','U','ADMIN','2010-10-20 15:26:13','A62AA9D'),
 (929,'tvehiculo','U','ADMIN','2010-10-20 15:27:24','A64AE3E'),
 (930,'tvehiculo','U','ADMIN','2010-10-20 15:30:23','A75A/D1I'),
 (931,'tvehiculo','U','ADMIN','2010-10-20 15:30:55','A75AD1/I'),
 (932,'tvehiculo','U','ADMIN','2010-10-20 15:31:25','A86AA/OD'),
 (933,'tvehiculo','U','ADMIN','2010-10-20 15:31:51','A86AA0D'),
 (934,'tvehiculo','I','ADMIN','2010-10-20 16:38:14','667XGB'),
 (935,'tChofer','I','ADMIN','2010-10-20 16:38:19','4605734'),
 (936,'tChofer','U','ADMIN','2010-10-20 16:39:02','8603178'),
 (937,'tChofer','U','ADMIN','2010-10-20 16:39:13','4605734'),
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
 (954,'tCiudad','I','ADMIN','2010-10-29 18:11:00','1705'),
 (955,'tCiudad','I','ADMIN','2010-10-29 18:11:35','1706'),
 (956,'tCiudad','I','ADMIN','2010-10-29 18:11:46','1707'),
 (957,'tCiudad','I','ADMIN','2010-10-29 18:12:14','1708'),
 (958,'tCiudad','I','ADMIN','2010-10-29 18:12:27','1709'),
 (959,'tCiudad','I','ADMIN','2010-10-29 18:12:43','1710'),
 (960,'tCiudad','I','ADMIN','2010-10-29 19:24:12','0502'),
 (961,'tCiudad','I','ADMIN','2010-10-29 19:25:01','0503'),
 (962,'tCiudad','I','ADMIN','2010-10-29 19:26:04','0504'),
 (963,'tCiudad','I','ADMIN','2010-10-29 19:26:54','0505'),
 (964,'tCiudad','I','ADMIN','2010-10-29 19:28:22','0506'),
 (965,'tCiudad','I','ADMIN','2010-10-29 19:29:10','0507'),
 (966,'tCiudad','I','ADMIN','2010-10-29 19:30:47','0508'),
 (967,'tCiudad','I','ADMIN','2010-10-29 19:31:44','0509'),
 (968,'tCiudad','I','ADMIN','2010-10-29 19:33:02','0510'),
 (969,'tCiudad','I','ADMIN','2010-10-29 19:33:30','0511'),
 (970,'tCiudad','I','ADMIN','2010-10-29 19:35:28','1711'),
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
 (1059,'truta','I','ADMIN','2010-10-29 20:47:24','110'),
 (1060,'truta','I','ADMIN','2010-10-29 20:49:26','19'),
 (1061,'tCiudad','I','ADMIN','2010-10-29 20:51:45','0602'),
 (1062,'torigen_destino','I','ADMIN','2010-10-29 20:53:39','37'),
 (1063,'truta','I','ADMIN','2010-10-29 20:54:06','137'),
 (1064,'tperiodo','D','P','2010-10-29 21:02:52','08101110'),
 (1065,'tPeriodo','I','P','2010-10-29 21:03:18','08101110'),
 (1066,'tperiodo','D','P','2010-10-29 21:04:17','08101110'),
 (1067,'tPeriodo','I','P','2010-10-29 21:04:36','08101110'),
 (1068,'tChofer','I','ADMIN','2010-10-29 21:12:53','9562700'),
 (1069,'tChofer','U','ADMIN','2010-10-29 21:13:31','9562700'),
 (1070,'tAnticipo','I','P','2010-10-29 21:15:28','200000001'),
 (1071,'tviaje','I','P','2010-10-29 21:15:28','200000001'),
 (1072,'tChofer','U','ADMIN','2010-10-30 12:12:01','9562700'),
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
 (1094,'tvehiculo','I','ADMIN','2010-10-30 17:08:03','66XPAC'),
 (1095,'tChofer','I','ADMIN','2010-10-30 17:08:12','19170321'),
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
 (1110,'ttipo_gasto','I','ADMIN','2010-10-30 17:17:40','07'),
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
 (1122,'tRelacion','I','P','2010-10-30 17:25:29','100000007');
INSERT INTO `tbitacora` (`nid_bitacora`,`ctabla`,`coperacion`,`cid_usuario`,`dfecha`,`cregistro`) VALUES 
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
 (1150,'trelacion','U','P','2010-10-30 17:34:06','100000013'),
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
 (1169,'truta','I','ADMIN','2010-11-01 11:47:26','61'),
 (1170,'tviaje','I','','2010-11-01 11:49:16','100000018'),
 (1171,'tAnticipo','I','P','2010-11-01 11:50:04','100000017'),
 (1172,'tAnticipo','I','P','2010-11-01 12:02:40','100000018'),
 (1173,'tviaje','I','P','2010-11-01 12:02:40','100000019'),
 (1174,'truta','I','ADMIN','2010-11-01 12:12:10','3616'),
 (1175,'tviaje','I','','2010-11-01 12:13:42','100000020'),
 (1176,'torigen_destino','I','ADMIN','2010-11-01 15:26:57','38'),
 (1177,'torigen_destino','U','ADMIN','2010-11-01 15:27:08','38'),
 (1178,'torigen_destino','U','ADMIN','2010-11-01 15:29:11','38'),
 (1179,'truta','I','ADMIN','2010-11-01 15:31:03','138'),
 (1180,'tAnticipo','I','P','2010-11-01 15:31:54','100000019'),
 (1181,'tviaje','I','P','2010-11-01 15:31:54','100000021'),
 (1182,'tAnticipo','I','P','2010-11-02 09:10:38','100000020'),
 (1183,'tviaje','I','P','2010-11-02 09:10:38','100000022'),
 (1184,'tAnticipo','I','P','2010-11-02 09:15:42','100000021'),
 (1185,'tviaje','I','P','2010-11-02 09:15:42','100000023'),
 (1186,'tAnticipo','I','P','2010-11-02 09:22:50','100000022'),
 (1187,'tviaje','I','P','2010-11-02 09:22:50','100000024'),
 (1188,'torigen_destino','I','ADMIN','2010-11-02 10:02:47','39'),
 (1189,'torigen_destino','I','ADMIN','2010-11-02 10:05:05','40'),
 (1190,'truta','I','ADMIN','2010-11-02 10:06:11','3940'),
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
 (1239,'tCiudad','I','ADMIN','2010-11-03 10:42:23','1712'),
 (1240,'tCiudad','I','ADMIN','2010-11-03 14:55:20','0512'),
 (1241,'torigen_destino','I','ADMIN','2010-11-03 15:00:26','41'),
 (1242,'torigen_destino','I','ADMIN','2010-11-03 15:00:50','42'),
 (1243,'torigen_destino','I','ADMIN','2010-11-03 15:01:11','43'),
 (1244,'torigen_destino','I','ADMIN','2010-11-03 15:01:33','44'),
 (1245,'torigen_destino','I','ADMIN','2010-11-03 15:01:57','45'),
 (1246,'torigen_destino','I','ADMIN','2010-11-03 15:04:01','46'),
 (1247,'torigen_destino','I','ADMIN','2010-11-03 15:04:20','47'),
 (1248,'torigen_destino','I','ADMIN','2010-11-03 15:05:37','48'),
 (1249,'torigen_destino','I','ADMIN','2010-11-03 15:06:40','49'),
 (1250,'torigen_destino','I','ADMIN','2010-11-03 15:07:09','50'),
 (1251,'torigen_destino','I','ADMIN','2010-11-03 15:08:18','51'),
 (1252,'truta','I','ADMIN','2010-11-03 16:15:57','150'),
 (1253,'truta','I','ADMIN','2010-11-03 16:18:08','142'),
 (1254,'truta','I','ADMIN','2010-11-03 16:20:22','148'),
 (1255,'truta','I','ADMIN','2010-11-03 16:22:40','149'),
 (1256,'truta','I','ADMIN','2010-11-03 16:26:47','147'),
 (1257,'truta','I','ADMIN','2010-11-03 16:28:33','143'),
 (1258,'truta','I','ADMIN','2010-11-03 16:30:25','151'),
 (1259,'truta','I','ADMIN','2010-11-03 16:33:23','141'),
 (1260,'truta','I','ADMIN','2010-11-03 16:34:48','145'),
 (1261,'truta','I','ADMIN','2010-11-03 16:36:19','146'),
 (1262,'truta','I','ADMIN','2010-11-03 16:37:35','144'),
 (1263,'tCiudad','I','ADMIN','2010-11-04 08:16:59','2004'),
 (1264,'tCiudad','I','ADMIN','2010-11-04 08:17:31','2005'),
 (1265,'tCiudad','I','ADMIN','2010-11-04 08:18:06','2006'),
 (1266,'tCiudad','I','ADMIN','2010-11-04 08:19:20','2007'),
 (1267,'tCiudad','I','ADMIN','2010-11-04 08:19:40','2008'),
 (1268,'tCiudad','I','ADMIN','2010-11-04 08:20:55','2009'),
 (1269,'torigen_destino','I','ADMIN','2010-11-04 08:35:13','52'),
 (1270,'torigen_destino','I','ADMIN','2010-11-04 08:35:42','53'),
 (1271,'torigen_destino','I','ADMIN','2010-11-04 08:36:27','54'),
 (1272,'torigen_destino','I','ADMIN','2010-11-04 08:39:26','55'),
 (1273,'torigen_destino','I','ADMIN','2010-11-04 08:39:50','56'),
 (1274,'torigen_destino','U','ADMIN','2010-11-04 08:39:56','56'),
 (1275,'torigen_destino','I','ADMIN','2010-11-04 08:40:22','57'),
 (1276,'torigen_destino','U','ADMIN','2010-11-04 08:40:28','57'),
 (1277,'truta','I','ADMIN','2010-11-04 08:42:36','152'),
 (1278,'truta','I','ADMIN','2010-11-04 08:46:03','153'),
 (1279,'torigen_destino','I','ADMIN','2010-11-04 09:03:44','58'),
 (1280,'truta','I','ADMIN','2010-11-04 09:05:18','158'),
 (1281,'truta','I','ADMIN','2010-11-04 09:09:15','154'),
 (1282,'truta','I','ADMIN','2010-11-04 09:11:38','155'),
 (1283,'torigen_destino','U','ADMIN','2010-11-04 09:16:36','56'),
 (1284,'truta','I','ADMIN','2010-11-04 09:22:48','156'),
 (1285,'torigen_destino','U','ADMIN','2010-11-04 09:27:31','57'),
 (1286,'truta','I','ADMIN','2010-11-04 09:30:11','157'),
 (1287,'truta','I','ADMIN','2010-11-04 09:34:28','124'),
 (1288,'torigen_destino','I','ADMIN','2010-11-04 09:44:06','59'),
 (1289,'torigen_destino','I','ADMIN','2010-11-04 09:45:21','60'),
 (1290,'tCiudad','I','ADMIN','2010-11-04 09:47:23','1713'),
 (1291,'torigen_destino','I','ADMIN','2010-11-04 09:47:43','61'),
 (1292,'tCiudad','I','ADMIN','2010-11-04 09:48:55','1714'),
 (1293,'torigen_destino','I','ADMIN','2010-11-04 09:49:12','62'),
 (1294,'torigen_destino','I','ADMIN','2010-11-04 09:49:52','63'),
 (1295,'torigen_destino','I','ADMIN','2010-11-04 09:50:31','64'),
 (1296,'torigen_destino','I','ADMIN','2010-11-04 09:51:06','65'),
 (1297,'torigen_destino','I','ADMIN','2010-11-04 09:51:43','66'),
 (1298,'tCiudad','U','ADMIN','2010-11-04 09:52:53','1711'),
 (1299,'torigen_destino','I','ADMIN','2010-11-04 09:53:14','67'),
 (1300,'torigen_destino','I','ADMIN','2010-11-04 09:53:57','68'),
 (1301,'truta','I','ADMIN','2010-11-04 09:57:14','140'),
 (1302,'truta','I','ADMIN','2010-11-04 09:59:15','159'),
 (1303,'truta','I','ADMIN','2010-11-04 10:00:54','160'),
 (1304,'truta','I','ADMIN','2010-11-04 10:02:21','161'),
 (1305,'truta','I','ADMIN','2010-11-04 10:04:41','162'),
 (1306,'truta','I','ADMIN','2010-11-04 10:06:08','121'),
 (1307,'truta','I','ADMIN','2010-11-04 10:07:19','163'),
 (1308,'truta','I','ADMIN','2010-11-04 10:08:40','164'),
 (1309,'truta','I','ADMIN','2010-11-04 10:09:50','165'),
 (1310,'truta','I','ADMIN','2010-11-04 10:11:04','166'),
 (1311,'truta','I','ADMIN','2010-11-04 10:12:01','167'),
 (1312,'truta','I','ADMIN','2010-11-04 10:13:36','168'),
 (1313,'tCiudad','I','ADMIN','2010-11-04 10:28:42','1902'),
 (1314,'torigen_destino','I','ADMIN','2010-11-04 10:29:15','69'),
 (1315,'torigen_destino','U','ADMIN','2010-11-04 10:29:27','68'),
 (1316,'truta','I','ADMIN','2010-11-04 10:30:53','169'),
 (1317,'tCiudad','I','ADMIN','2010-11-04 10:45:52','1202'),
 (1318,'tCiudad','I','ADMIN','2010-11-04 10:46:11','1203'),
 (1319,'tCiudad','I','ADMIN','2010-11-04 10:47:11','1204'),
 (1320,'tCiudad','I','ADMIN','2010-11-04 10:47:37','1205'),
 (1321,'tCiudad','I','ADMIN','2010-11-04 10:48:58','1206'),
 (1322,'tCiudad','I','ADMIN','2010-11-04 10:49:25','1207'),
 (1323,'torigen_destino','I','ADMIN','2010-11-04 10:51:12','70'),
 (1324,'torigen_destino','I','ADMIN','2010-11-04 10:56:33','71'),
 (1325,'torigen_destino','U','ADMIN','2010-11-04 10:56:48','16'),
 (1326,'torigen_destino','I','ADMIN','2010-11-04 10:57:15','72'),
 (1327,'torigen_destino','I','ADMIN','2010-11-04 10:57:31','73'),
 (1328,'torigen_destino','I','ADMIN','2010-11-04 10:57:46','74'),
 (1329,'torigen_destino','I','ADMIN','2010-11-04 10:58:07','75'),
 (1330,'tCiudad','I','ADMIN','2010-11-04 10:59:12','1302'),
 (1331,'torigen_destino','I','ADMIN','2010-11-04 10:59:31','76'),
 (1332,'truta','I','ADMIN','2010-11-04 11:01:04','170'),
 (1333,'truta','I','ADMIN','2010-11-04 11:02:20','171'),
 (1334,'truta','I','ADMIN','2010-11-04 11:04:10','172'),
 (1335,'truta','I','ADMIN','2010-11-04 11:05:47','173'),
 (1336,'truta','I','ADMIN','2010-11-04 11:07:21','176'),
 (1337,'truta','I','ADMIN','2010-11-04 11:10:49','174'),
 (1338,'truta','I','ADMIN','2010-11-04 11:12:17','175'),
 (1339,'tCiudad','I','ADMIN','2010-11-04 14:30:25','0302'),
 (1340,'tCiudad','I','ADMIN','2010-11-04 14:31:27','0303'),
 (1341,'tCiudad','I','ADMIN','2010-11-04 14:32:23','0304'),
 (1342,'tCiudad','I','ADMIN','2010-11-04 14:36:03','2306'),
 (1343,'tCiudad','I','ADMIN','2010-11-04 14:37:45','2205'),
 (1344,'tCiudad','I','ADMIN','2010-11-04 14:39:26','2206'),
 (1345,'tCiudad','I','ADMIN','2010-11-04 14:41:53','2207'),
 (1346,'torigen_destino','I','ADMIN','2010-11-04 14:42:36','77'),
 (1347,'torigen_destino','I','ADMIN','2010-11-04 14:43:09','78'),
 (1348,'torigen_destino','I','ADMIN','2010-11-04 14:43:34','79'),
 (1349,'torigen_destino','I','ADMIN','2010-11-04 14:44:04','80'),
 (1350,'torigen_destino','I','ADMIN','2010-11-04 14:45:27','81'),
 (1351,'torigen_destino','I','ADMIN','2010-11-04 14:49:12','82'),
 (1352,'torigen_destino','I','ADMIN','2010-11-04 14:49:53','83'),
 (1353,'torigen_destino','I','ADMIN','2010-11-04 14:50:32','84'),
 (1354,'torigen_destino','I','ADMIN','2010-11-04 14:50:43','85'),
 (1355,'truta','I','ADMIN','2010-11-04 14:52:58','177'),
 (1356,'truta','I','ADMIN','2010-11-04 15:00:30','178'),
 (1357,'truta','I','ADMIN','2010-11-04 15:01:44','179'),
 (1358,'truta','I','ADMIN','2010-11-04 15:03:18','180'),
 (1359,'truta','I','ADMIN','2010-11-04 15:05:27','181'),
 (1360,'truta','I','ADMIN','2010-11-04 15:06:50','182'),
 (1361,'truta','I','ADMIN','2010-11-04 15:09:31','183'),
 (1362,'truta','I','ADMIN','2010-11-04 15:13:12','184'),
 (1363,'truta','I','ADMIN','2010-11-04 15:14:07','185'),
 (1364,'torigen_destino','I','ADMIN','2010-11-04 17:34:33','86'),
 (1365,'truta','I','ADMIN','2010-11-04 17:36:05','186'),
 (1366,'tCiudad','I','ADMIN','2010-11-04 18:12:22','0305'),
 (1367,'torigen_destino','I','ADMIN','2010-11-04 18:12:48','87'),
 (1368,'truta','I','ADMIN','2010-11-04 18:14:17','187'),
 (1369,'tperiodo','U','P','2010-11-05 14:58:36','08101110'),
 (1370,'tChofer','I','ADMIN','2010-11-05 15:07:32','1111'),
 (1371,'tChofer','D','ADMIN','2010-11-05 15:07:39','1111'),
 (1372,'tChofer','U','ADMIN','2010-11-05 15:32:59','10139779'),
 (1373,'tChofer','U','ADMIN','2010-11-05 15:45:39','10139779'),
 (1374,'tChofer','U','ADMIN','2010-11-05 16:20:27','7241360'),
 (1375,'tChofer','U','ADMIN','2010-11-05 16:21:08','9562700'),
 (1376,'tsucursal','U','ADMIN','2010-11-05 17:40:41','1'),
 (1377,'tsucursal','U','ADMIN','2010-11-05 17:40:53','1'),
 (1378,'tsucursal','U','ADMIN','2010-11-05 17:41:09','2'),
 (1379,'tsucursal','U','ADMIN','2010-11-05 17:41:21','3'),
 (1380,'tsucursal','U','ADMIN','2010-11-05 17:41:31','4'),
 (1381,'tsucursal','U','ADMIN','2010-11-05 17:41:42','5'),
 (1382,'tsucursal','U','ADMIN','2010-11-05 17:41:49','6'),
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
 (1411,'tvehiculo','I','ADMIN','2010-11-11 11:08:37','A15AU7D'),
 (1412,'tChofer','I','ADMIN','2010-11-11 11:08:46','5426026'),
 (1413,'tChofer','U','ADMIN','2010-11-11 11:27:06','5426026'),
 (1414,'tvehiculo','U','ADMIN','2010-11-11 11:30:53','A15AU7D'),
 (1415,'tCiudad','I','ADMIN','2010-11-11 14:42:53','1303'),
 (1416,'torigen_destino','I','ADMIN','2010-11-11 17:18:33','88'),
 (1417,'torigen_destino','U','ADMIN','2010-11-11 17:18:41','88'),
 (1418,'truta','I','ADMIN','2010-11-11 17:28:06','188'),
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
 (1435,'tvehiculo','I','ADMIN','2010-11-12 11:58:01','62XPAC'),
 (1436,'tvehiculo','U','ADMIN','2010-11-12 11:58:57','62XPAC'),
 (1437,'tCiudad','I','ADMIN','2010-11-12 12:02:57','0702'),
 (1438,'torigen_destino','I','ADMIN','2010-11-12 12:03:36','89'),
 (1439,'truta','I','ADMIN','2010-11-12 12:05:28','189'),
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
 (1488,'tvehiculo','I','ADMIN','2010-11-12 16:30:26','A22AE9U'),
 (1489,'tChofer','I','ADMIN','2010-11-12 16:30:30','16346069'),
 (1490,'tvehiculo','I','ADMIN','2010-11-12 16:31:02','A46AG7E'),
 (1491,'tChofer','I','ADMIN','2010-11-12 16:31:03','16966899'),
 (1492,'tvehiculo','I','ADMIN','2010-11-12 16:31:18','01UDAY'),
 (1493,'tChofer','I','ADMIN','2010-11-12 16:31:19','8715289'),
 (1494,'tvehiculo','I','ADMIN','2010-11-12 16:37:56','A23AE2U'),
 (1495,'tChofer','I','ADMIN','2010-11-12 16:38:00','8103812'),
 (1496,'tvehiculo','I','ADMIN','2010-11-12 16:38:10','68IDIBB'),
 (1497,'tChofer','I','ADMIN','2010-11-12 16:41:47','15444793'),
 (1498,'tvehiculo','I','ADMIN','2010-11-12 16:41:58','69UDAY'),
 (1499,'tChofer','I','ADMIN','2010-11-12 16:42:36','11615836'),
 (1500,'tvehiculo','I','ADMIN','2010-11-12 16:47:58','A23AE1U'),
 (1501,'tChofer','I','ADMIN','2010-11-12 16:48:00','12446697'),
 (1502,'tvehiculo','I','ADMIN','2010-11-12 16:48:05','A13AG7E'),
 (1503,'tChofer','I','ADMIN','2010-11-12 16:48:06','10637589'),
 (1504,'tvehiculo','I','ADMIN','2010-11-12 16:48:20','A22AE2U'),
 (1505,'tChofer','I','ADMIN','2010-11-12 16:48:22','11081499'),
 (1506,'tvehiculo','I','ADMIN','2010-11-12 16:48:35','A22AE4U'),
 (1507,'tChofer','I','ADMIN','2010-11-12 16:48:36','15340627'),
 (1508,'tvehiculo','I','ADMIN','2010-11-12 16:48:46','A72AE3E'),
 (1509,'tChofer','I','ADMIN','2010-11-12 16:48:47','16751579'),
 (1510,'tvehiculo','I','ADMIN','2010-11-12 16:49:14','A02AF5T'),
 (1511,'tChofer','I','ADMIN','2010-11-12 16:49:15','9347051'),
 (1512,'tChofer','U','ADMIN','2010-11-12 16:50:15','10637589'),
 (1513,'tChofer','U','ADMIN','2010-11-12 16:51:14','11081499'),
 (1514,'tChofer','D','ADMIN','2010-11-12 16:52:02','11615836'),
 (1515,'tChofer','D','ADMIN','2010-11-12 16:52:26','12262801'),
 (1516,'tChofer','U','ADMIN','2010-11-12 16:53:10','9347051'),
 (1517,'tChofer','D','ADMIN','2010-11-12 16:53:34','8715289'),
 (1518,'tChofer','U','ADMIN','2010-11-12 16:54:28','12446697'),
 (1519,'tChofer','U','ADMIN','2010-11-12 16:55:21','15340627'),
 (1520,'tChofer','U','ADMIN','2010-11-12 17:12:51','16346069'),
 (1521,'tChofer','U','ADMIN','2010-11-12 17:13:51','16751579'),
 (1522,'tChofer','U','ADMIN','2010-11-12 17:15:20','16966899'),
 (1523,'tChofer','U','ADMIN','2010-11-12 17:16:39','8103812'),
 (1524,'tChofer','I','ADMIN','2010-11-12 17:20:51','11542453'),
 (1525,'tChofer','D','ADMIN','2010-11-12 17:21:28','15444793'),
 (1526,'tAnticipo','D','P','2010-11-15 08:32:42','100000001'),
 (1527,'tAnticipo','D','P','2010-11-15 08:32:42','100000002'),
 (1528,'tAnticipo','D','P','2010-11-15 08:32:42','100000003'),
 (1529,'tAnticipo','D','P','2010-11-15 08:32:42','100000004'),
 (1530,'tAnticipo','D','P','2010-11-15 08:32:42','100000005'),
 (1531,'tAnticipo','D','P','2010-11-15 08:32:42','100000006'),
 (1532,'tAnticipo','D','P','2010-11-15 08:32:42','100000007'),
 (1533,'tAnticipo','D','P','2010-11-15 08:32:42','100000008'),
 (1534,'tAnticipo','D','P','2010-11-15 08:32:42','100000009'),
 (1535,'tAnticipo','D','P','2010-11-15 08:32:42','100000010'),
 (1536,'tAnticipo','D','P','2010-11-15 08:32:42','100000011'),
 (1537,'tAnticipo','D','P','2010-11-15 08:32:42','100000012'),
 (1538,'tAnticipo','D','P','2010-11-15 08:32:42','100000013'),
 (1539,'tAnticipo','D','P','2010-11-15 08:32:42','100000014'),
 (1540,'tAnticipo','D','P','2010-11-15 08:32:42','100000015'),
 (1541,'tAnticipo','D','P','2010-11-15 08:32:42','100000016'),
 (1542,'tAnticipo','D','P','2010-11-15 08:32:42','100000017'),
 (1543,'tAnticipo','D','P','2010-11-15 08:32:42','100000018'),
 (1544,'tAnticipo','D','P','2010-11-15 08:32:42','100000019'),
 (1545,'tAnticipo','D','P','2010-11-15 08:32:42','100000020'),
 (1546,'tAnticipo','D','P','2010-11-15 08:32:42','100000021'),
 (1547,'tAnticipo','D','P','2010-11-15 08:32:42','100000022'),
 (1548,'tAnticipo','D','P','2010-11-15 08:32:42','100000023'),
 (1549,'tAnticipo','D','P','2010-11-15 08:32:42','100000024'),
 (1550,'tAnticipo','D','P','2010-11-15 08:32:42','100000025'),
 (1551,'tAnticipo','D','P','2010-11-15 08:32:42','100000026'),
 (1552,'tAnticipo','D','P','2010-11-15 08:32:42','100000027'),
 (1553,'tAnticipo','D','P','2010-11-15 08:32:42','100000028'),
 (1554,'tAnticipo','D','P','2010-11-15 08:32:42','100000029'),
 (1555,'tAnticipo','D','P','2010-11-15 08:32:42','100000030'),
 (1556,'tAnticipo','D','P','2010-11-15 08:32:42','100000031'),
 (1557,'tAnticipo','D','P','2010-11-15 08:32:42','100000032'),
 (1558,'tAnticipo','D','P','2010-11-15 08:32:42','100000033'),
 (1559,'tAnticipo','D','P','2010-11-15 08:32:42','100000034'),
 (1560,'tAnticipo','D','P','2010-11-15 08:32:42','100000035'),
 (1561,'tAnticipo','D','P','2010-11-15 08:32:42','100000036'),
 (1562,'trelacion','D','P','2010-11-15 08:32:43','100000001'),
 (1563,'trelacion','D','P','2010-11-15 08:32:43','100000002'),
 (1564,'trelacion','D','P','2010-11-15 08:32:43','100000003'),
 (1565,'trelacion','D','P','2010-11-15 08:32:43','100000004'),
 (1566,'trelacion','D','P','2010-11-15 08:32:43','100000005'),
 (1567,'trelacion','D','P','2010-11-15 08:32:43','100000006'),
 (1568,'trelacion','D','P','2010-11-15 08:32:43','100000007'),
 (1569,'trelacion','D','P','2010-11-15 08:32:43','100000009'),
 (1570,'trelacion','D','P','2010-11-15 08:32:43','100000010'),
 (1571,'trelacion','D','P','2010-11-15 08:32:43','100000011'),
 (1572,'trelacion','D','P','2010-11-15 08:32:43','100000012'),
 (1573,'trelacion','D','P','2010-11-15 08:32:43','100000013'),
 (1574,'trelacion','D','P','2010-11-15 08:32:43','100000014'),
 (1575,'trelacion','D','P','2010-11-15 08:32:43','100000016'),
 (1576,'trelacion','D','P','2010-11-15 08:32:43','100000018'),
 (1577,'trelacion','D','P','2010-11-15 08:32:43','100000019'),
 (1578,'trelacion','D','P','2010-11-15 08:32:43','100000020'),
 (1579,'trelacion','D','P','2010-11-15 08:32:43','100000021'),
 (1580,'trelacion','D','P','2010-11-15 08:32:43','100000022'),
 (1581,'trelacion','D','P','2010-11-15 08:32:43','100000023'),
 (1582,'trelacion','D','P','2010-11-15 08:32:43','100000024'),
 (1583,'trelacion','D','P','2010-11-15 08:32:43','100000025'),
 (1584,'trelacion','D','P','2010-11-15 08:32:43','100000026'),
 (1585,'trelacion','D','P','2010-11-15 08:32:43','100000027'),
 (1586,'trelacion','D','P','2010-11-15 08:32:43','100000028'),
 (1587,'trelacion','D','P','2010-11-15 08:32:43','100000029'),
 (1588,'trelacion','D','P','2010-11-15 08:32:43','100000030'),
 (1589,'trelacion','D','P','2010-11-15 08:32:43','100000031'),
 (1590,'trelacion','D','P','2010-11-15 08:32:43','100000032'),
 (1591,'trelacion','D','P','2010-11-15 08:32:43','100000033'),
 (1592,'trelacion','D','P','2010-11-15 08:32:43','100000034'),
 (1593,'trelacion','D','P','2010-11-15 08:32:43','100000035'),
 (1594,'trelacion','D','P','2010-11-15 08:32:43','100000036'),
 (1595,'tviaje','D','P','2010-11-15 08:33:20','100000001'),
 (1596,'tviaje','D','P','2010-11-15 08:33:20','100000002'),
 (1597,'tviaje','D','P','2010-11-15 08:33:20','100000003'),
 (1598,'tviaje','D','P','2010-11-15 08:33:20','100000004'),
 (1599,'tviaje','D','P','2010-11-15 08:33:20','100000005'),
 (1600,'tviaje','D','P','2010-11-15 08:33:20','100000006'),
 (1601,'tviaje','D','P','2010-11-15 08:33:20','100000007'),
 (1602,'tviaje','D','P','2010-11-15 08:33:20','100000008'),
 (1603,'tviaje','D','P','2010-11-15 08:33:20','100000009'),
 (1604,'tviaje','D','P','2010-11-15 08:33:20','100000010'),
 (1605,'tviaje','D','','2010-11-15 08:33:20','100000011'),
 (1606,'tviaje','D','P','2010-11-15 08:33:20','100000012'),
 (1607,'tviaje','D','P','2010-11-15 08:33:20','100000013'),
 (1608,'tviaje','D','P','2010-11-15 08:33:20','100000014'),
 (1609,'tviaje','D','P','2010-11-15 08:33:20','100000015'),
 (1610,'tviaje','D','P','2010-11-15 08:33:20','100000016'),
 (1611,'tviaje','D','P','2010-11-15 08:33:20','100000017'),
 (1612,'tviaje','D','','2010-11-15 08:33:20','100000018'),
 (1613,'tviaje','D','P','2010-11-15 08:33:20','100000019'),
 (1614,'tviaje','D','','2010-11-15 08:33:20','100000020'),
 (1615,'tviaje','D','P','2010-11-15 08:33:20','100000021'),
 (1616,'tviaje','D','P','2010-11-15 08:33:20','100000022'),
 (1617,'tviaje','D','P','2010-11-15 08:33:20','100000023'),
 (1618,'tviaje','D','P','2010-11-15 08:33:20','100000024'),
 (1619,'tviaje','D','','2010-11-15 08:33:20','100000025'),
 (1620,'tviaje','D','P','2010-11-15 08:33:20','100000026'),
 (1621,'tviaje','D','P','2010-11-15 08:33:20','100000027'),
 (1622,'tviaje','D','P','2010-11-15 08:33:20','100000028'),
 (1623,'tviaje','D','P','2010-11-15 08:33:20','100000029'),
 (1624,'tviaje','D','P','2010-11-15 08:33:20','100000030'),
 (1625,'tviaje','D','P','2010-11-15 08:33:20','100000031'),
 (1626,'tviaje','D','','2010-11-15 08:33:20','100000032'),
 (1627,'tviaje','D','P','2010-11-15 08:33:20','100000033'),
 (1628,'tviaje','D','P','2010-11-15 08:33:20','100000034'),
 (1629,'tviaje','D','P','2010-11-15 08:33:20','100000035'),
 (1630,'tviaje','D','P','2010-11-15 08:33:20','100000036'),
 (1631,'tviaje','D','P','2010-11-15 08:33:20','100000037'),
 (1632,'tviaje','D','P','2010-11-15 08:33:20','100000038'),
 (1633,'tviaje','D','P','2010-11-15 08:33:20','100000039'),
 (1634,'tviaje','D','P','2010-11-15 08:33:20','100000040'),
 (1635,'tviaje','D','P','2010-11-15 08:33:20','100000041'),
 (1636,'tgasto_serv','D','P','2010-11-15 08:36:26','100000001'),
 (1637,'tperiodo','D','P','2010-11-15 08:36:44','08101110'),
 (1638,'tusuario','U','P','2010-11-15 09:37:54','P'),
 (1639,'tusuario','I','ADMCOC','2010-11-15 09:39:38','ADMCOC'),
 (1640,'tusuario','U','P','2010-11-15 09:47:22','P'),
 (1641,'tusuario','U','P','2010-11-15 09:47:22','P'),
 (1642,'tusuario','U','P','2010-11-15 09:47:22','P'),
 (1643,'tusuario','U','P','2010-11-15 09:47:22','P'),
 (1644,'tusuario','U','P','2010-11-15 09:47:22','P'),
 (1645,'tusuario','U','P','2010-11-15 09:47:22','P'),
 (1646,'tusuario','U','P','2010-11-15 09:47:22','P'),
 (1647,'tusuario','U','ADMIN','2010-11-15 09:47:22','ADMIN'),
 (1648,'tusuario','U','ADMIN','2010-11-15 09:47:22','ADMIN'),
 (1649,'tusuario','U','ADMIN','2010-11-15 09:47:22','ADMIN'),
 (1650,'tusuario','U','ADMIN','2010-11-15 09:47:22','ADMIN'),
 (1651,'tusuario','U','ADMIN','2010-11-15 09:47:22','ADMIN'),
 (1652,'tusuario','U','ADMIN','2010-11-15 09:47:22','ADMIN'),
 (1653,'tPeriodo','I','ADMIN','2010-11-15 10:33:40','122010'),
 (1654,'tvehiculo','I','ADMIN','2010-11-15 17:33:34','A71AE4E'),
 (1655,'tvehiculo','U','ADMIN','2010-11-15 17:35:32','A71AE4E'),
 (1656,'tAnticipo','I','ADMCOC','2010-11-15 17:37:47','200000001'),
 (1657,'tviaje','I','ADMCOC','2010-11-15 17:37:47','200000001'),
 (1658,'tvehiculo','U','ADMIN','2010-11-15 17:51:48','A22AE2U'),
 (1659,'tAnticipo','I','ADMCOC','2010-11-15 17:54:47','200000002'),
 (1660,'tviaje','I','ADMCOC','2010-11-15 17:54:47','200000002'),
 (1661,'tvehiculo','U','ADMIN','2010-11-15 18:02:42','A22AE9U'),
 (1662,'tAnticipo','I','ADMCOC','2010-11-15 18:03:42','200000003'),
 (1663,'tviaje','I','ADMCOC','2010-11-15 18:03:42','200000003'),
 (1664,'tvehiculo','I','ADMIN','2010-11-15 18:10:49','A68AE5E'),
 (1665,'tChofer','I','ADMIN','2010-11-15 18:10:56','12264842'),
 (1666,'tusuario','U','ADMCOC','2010-11-16 09:33:03','ADMCOC'),
 (1667,'tusuario','U','ADMIN','2010-11-16 10:14:12','ADMIN'),
 (1668,'tChofer','D','ADMIN','2010-11-16 10:15:03','12264842'),
 (1669,'tChofer','D','ADMIN','2010-11-16 10:15:18','9562700'),
 (1670,'tvehiculo','U','ADMIN','2010-11-16 14:19:55','A72AE3E'),
 (1671,'tAnticipo','I','ADMCOC','2010-11-16 14:20:53','200000004'),
 (1672,'tviaje','I','ADMCOC','2010-11-16 14:20:53','200000004'),
 (1673,'tvehiculo','U','ADMIN','2010-11-16 14:22:10','A46AG7E'),
 (1674,'tAnticipo','I','ADMCOC','2010-11-16 14:24:13','200000005'),
 (1675,'tviaje','I','ADMCOC','2010-11-16 14:24:13','200000005'),
 (1676,'tvehiculo','I','ADMIN','2010-11-16 15:33:27','A67AE8E'),
 (1677,'tvehiculo','U','ADMIN','2010-11-16 15:35:16','A67AE8E'),
 (1678,'tAnticipo','I','ADMCOC','2010-11-16 15:36:05','200000006'),
 (1679,'tviaje','I','ADMCOC','2010-11-16 15:36:05','200000006'),
 (1680,'tChofer','I','ADMIN','2010-11-16 16:33:30','12262801'),
 (1681,'tvehiculo','U','ADMIN','2010-11-16 16:34:11','A22AE3U'),
 (1682,'tChofer','U','ADMIN','2010-11-16 16:36:08','12262801'),
 (1683,'tAnticipo','I','ADMCOC','2010-11-16 16:40:35','200000007'),
 (1684,'tviaje','I','ADMCOC','2010-11-16 16:40:35','200000007'),
 (1685,'tvehiculo','U','ADMIN','2010-11-16 16:45:53','A22AE4U'),
 (1686,'tAnticipo','I','ADMCOC','2010-11-16 16:47:59','200000008'),
 (1687,'tviaje','I','ADMCOC','2010-11-16 16:47:59','200000008'),
 (1688,'tvehiculo','U','ADMIN','2010-11-17 11:19:17','A23AE2U'),
 (1689,'tAnticipo','I','ADMCOC','2010-11-17 11:21:06','200000009'),
 (1690,'tviaje','I','ADMCOC','2010-11-17 11:21:06','200000009'),
 (1691,'tvehiculo','I','ADMIN','2010-11-17 11:57:15','A23AE0U'),
 (1692,'tvehiculo','U','ADMIN','2010-11-17 17:07:39','A23AE0U'),
 (1693,'tAnticipo','I','ADMCOC','2010-11-17 17:11:11','200000010'),
 (1694,'tviaje','I','ADMCOC','2010-11-17 17:11:11','200000010'),
 (1695,'tAnticipo','I','ADMCOC','2010-11-17 17:12:58','200000011'),
 (1696,'tviaje','I','ADMCOC','2010-11-17 17:12:58','200000011'),
 (1697,'tAnticipo','I','ADMCOC','2010-11-18 14:15:28','200000012'),
 (1698,'tviaje','I','ADMCOC','2010-11-18 14:15:28','200000012'),
 (1699,'tAnticipo','I','ADMCOC','2010-11-18 14:47:36','200000013'),
 (1700,'tAnticipo','U','ADMCOC','2010-11-18 14:47:36','200000004'),
 (1701,'tAnticipo','I','ADMCOC','2010-11-18 14:54:50','200000014'),
 (1702,'tviaje','I','ADMCOC','2010-11-18 14:54:50','200000013'),
 (1703,'tAnticipo','I','ADMCOC','2010-11-18 15:28:35','200000015'),
 (1704,'tviaje','I','ADMCOC','2010-11-18 15:28:35','200000014'),
 (1705,'tAnticipo','I','ADMCOC','2010-11-18 15:49:56','200000016'),
 (1706,'tviaje','I','ADMCOC','2010-11-18 15:49:56','200000015'),
 (1707,'tAnticipo','I','ADMCOC','2010-11-18 16:27:25','200000017'),
 (1708,'tviaje','I','ADMCOC','2010-11-18 16:27:25','200000016'),
 (1709,'tAnticipo','I','ADMCOC','2010-11-18 17:11:44','200000018'),
 (1710,'tviaje','I','ADMCOC','2010-11-18 17:11:44','200000017'),
 (1711,'tAnticipo','I','ADMCOC','2010-11-19 09:51:11','200000019'),
 (1712,'tviaje','I','ADMCOC','2010-11-19 09:51:11','200000018'),
 (1713,'tAnticipo','I','ADMCOC','2010-11-19 11:40:33','200000020'),
 (1714,'tviaje','I','ADMCOC','2010-11-19 11:40:33','200000019'),
 (1715,'tAnticipo','I','ADMCOC','2010-11-19 14:19:08','200000021'),
 (1716,'tviaje','I','ADMCOC','2010-11-19 14:19:08','200000020'),
 (1717,'tAnticipo','I','ADMCOC','2010-11-19 14:38:22','200000022'),
 (1718,'tviaje','I','ADMCOC','2010-11-19 14:38:22','200000021'),
 (1719,'tAnticipo','I','ADMCOC','2010-11-19 15:00:34','200000023'),
 (1720,'tviaje','I','ADMCOC','2010-11-19 15:00:34','200000022'),
 (1721,'tAnticipo','I','ADMCOC','2010-11-19 16:38:58','200000024'),
 (1722,'tviaje','I','ADMCOC','2010-11-19 16:38:58','200000023'),
 (1723,'truta','U','ADMIN','2010-11-22 09:41:23','13'),
 (1724,'truta','U','ADMIN','2010-11-22 09:41:23','14'),
 (1725,'truta','U','ADMIN','2010-11-22 09:41:23','15'),
 (1726,'truta','U','ADMIN','2010-11-22 09:41:23','16'),
 (1727,'truta','U','ADMIN','2010-11-22 09:41:23','19'),
 (1728,'truta','U','ADMIN','2010-11-22 09:41:23','110'),
 (1729,'truta','U','ADMIN','2010-11-22 09:41:23','114'),
 (1730,'truta','U','ADMIN','2010-11-22 09:41:23','116'),
 (1731,'truta','U','ADMIN','2010-11-22 09:41:23','121'),
 (1732,'truta','U','ADMIN','2010-11-22 09:41:23','123'),
 (1733,'truta','U','ADMIN','2010-11-22 09:41:23','124'),
 (1734,'truta','U','ADMIN','2010-11-22 09:41:23','126'),
 (1735,'truta','U','ADMIN','2010-11-22 09:41:23','128'),
 (1736,'truta','U','ADMIN','2010-11-22 09:41:23','131'),
 (1737,'truta','U','ADMIN','2010-11-22 09:41:23','132'),
 (1738,'truta','U','ADMIN','2010-11-22 09:41:23','133'),
 (1739,'truta','U','ADMIN','2010-11-22 09:41:23','134'),
 (1740,'truta','U','ADMIN','2010-11-22 09:41:23','135'),
 (1741,'truta','U','ADMIN','2010-11-22 09:41:23','136'),
 (1742,'truta','U','ADMIN','2010-11-22 09:41:23','137'),
 (1743,'truta','U','ADMIN','2010-11-22 09:41:23','138'),
 (1744,'truta','U','ADMIN','2010-11-22 09:41:23','140'),
 (1745,'truta','U','ADMIN','2010-11-22 09:41:23','141'),
 (1746,'truta','U','ADMIN','2010-11-22 09:41:23','142'),
 (1747,'truta','U','ADMIN','2010-11-22 09:41:23','143'),
 (1748,'truta','U','ADMIN','2010-11-22 09:41:23','144'),
 (1749,'truta','U','ADMIN','2010-11-22 09:41:23','145'),
 (1750,'truta','U','ADMIN','2010-11-22 09:41:23','146'),
 (1751,'truta','U','ADMIN','2010-11-22 09:41:23','147'),
 (1752,'truta','U','ADMIN','2010-11-22 09:41:23','148'),
 (1753,'truta','U','ADMIN','2010-11-22 09:41:23','149'),
 (1754,'truta','U','ADMIN','2010-11-22 09:41:23','150'),
 (1755,'truta','U','ADMIN','2010-11-22 09:41:23','151'),
 (1756,'truta','U','ADMIN','2010-11-22 09:41:23','152'),
 (1757,'truta','U','ADMIN','2010-11-22 09:41:23','153'),
 (1758,'truta','U','ADMIN','2010-11-22 09:41:23','154'),
 (1759,'truta','U','ADMIN','2010-11-22 09:41:23','155'),
 (1760,'truta','U','ADMIN','2010-11-22 09:41:23','156'),
 (1761,'truta','U','ADMIN','2010-11-22 09:41:23','157'),
 (1762,'truta','U','ADMIN','2010-11-22 09:41:23','158'),
 (1763,'truta','U','ADMIN','2010-11-22 09:41:23','159'),
 (1764,'truta','U','ADMIN','2010-11-22 09:41:23','160'),
 (1765,'truta','U','ADMIN','2010-11-22 09:41:23','161'),
 (1766,'truta','U','ADMIN','2010-11-22 09:41:23','162'),
 (1767,'truta','U','ADMIN','2010-11-22 09:41:23','163'),
 (1768,'truta','U','ADMIN','2010-11-22 09:41:23','164'),
 (1769,'truta','U','ADMIN','2010-11-22 09:41:23','165'),
 (1770,'truta','U','ADMIN','2010-11-22 09:41:23','166'),
 (1771,'truta','U','ADMIN','2010-11-22 09:41:23','167'),
 (1772,'truta','U','ADMIN','2010-11-22 09:41:23','168'),
 (1773,'truta','U','ADMIN','2010-11-22 09:41:23','169'),
 (1774,'truta','U','ADMIN','2010-11-22 09:41:23','170'),
 (1775,'truta','U','ADMIN','2010-11-22 09:41:23','171'),
 (1776,'truta','U','ADMIN','2010-11-22 09:41:23','172'),
 (1777,'truta','U','ADMIN','2010-11-22 09:41:23','173'),
 (1778,'truta','U','ADMIN','2010-11-22 09:41:23','174'),
 (1779,'truta','U','ADMIN','2010-11-22 09:41:23','175'),
 (1780,'truta','U','ADMIN','2010-11-22 09:41:23','176'),
 (1781,'truta','U','ADMIN','2010-11-22 09:41:23','177'),
 (1782,'truta','U','ADMIN','2010-11-22 09:41:23','178'),
 (1783,'truta','U','ADMIN','2010-11-22 09:41:23','179'),
 (1784,'truta','U','ADMIN','2010-11-22 09:41:23','180'),
 (1785,'truta','U','ADMIN','2010-11-22 09:41:23','181'),
 (1786,'truta','U','ADMIN','2010-11-22 09:41:23','182'),
 (1787,'truta','U','ADMIN','2010-11-22 09:41:23','183'),
 (1788,'truta','U','ADMIN','2010-11-22 09:41:23','184'),
 (1789,'truta','U','ADMIN','2010-11-22 09:41:23','185'),
 (1790,'truta','U','ADMIN','2010-11-22 09:41:23','186'),
 (1791,'truta','U','ADMIN','2010-11-22 09:41:23','187'),
 (1792,'truta','U','ADMIN','2010-11-22 09:41:23','188'),
 (1793,'truta','U','ADMIN','2010-11-22 09:41:23','189'),
 (1794,'truta','U','ADMIN','2010-11-22 09:41:23','61'),
 (1795,'truta','U','ADMIN','2010-11-22 09:41:23','63'),
 (1796,'truta','U','ADMIN','2010-11-22 09:41:23','64'),
 (1797,'truta','U','ADMIN','2010-11-22 09:41:23','271'),
 (1798,'truta','U','ADMIN','2010-11-22 09:41:23','3616'),
 (1799,'truta','U','ADMIN','2010-11-22 09:41:23','3940'),
 (1800,'tAnticipo','I','ADMCOC','2010-11-22 14:49:26','200000025'),
 (1801,'tviaje','I','ADMCOC','2010-11-22 14:49:26','200000024'),
 (1802,'tAnticipo','I','ADMCOC','2010-11-22 14:50:41','200000026'),
 (1803,'tviaje','I','ADMCOC','2010-11-22 14:50:41','200000025'),
 (1804,'tAnticipo','I','ADMCOC','2010-11-22 14:54:32','200000027'),
 (1805,'tviaje','I','ADMCOC','2010-11-22 14:54:32','200000026'),
 (1806,'tAnticipo','I','ADMCOC','2010-11-22 14:58:08','200000028'),
 (1807,'tviaje','I','ADMCOC','2010-11-22 14:58:08','200000027'),
 (1808,'tAnticipo','I','ADMCOC','2010-11-22 14:59:03','200000029'),
 (1809,'tviaje','I','ADMCOC','2010-11-22 14:59:03','200000028'),
 (1810,'tAnticipo','I','ADMCOC','2010-11-22 16:12:36','200000030'),
 (1811,'tviaje','I','ADMCOC','2010-11-22 16:12:36','200000029'),
 (1812,'tAnticipo','I','ADMCOC','2010-11-22 17:45:07','200000031'),
 (1813,'tAnticipo','U','ADMCOC','2010-11-22 17:45:07','200000020'),
 (1814,'tvehiculo','I','ADMIN','2010-11-23 13:57:04','22-11-10'),
 (1815,'tChofer','I','ADMIN','2010-11-23 13:57:09','10144162'),
 (1816,'tAnticipo','I','ADMCOC','2010-11-23 14:37:13','200000032'),
 (1817,'tviaje','I','ADMCOC','2010-11-23 14:37:13','200000030'),
 (1818,'tAnticipo','I','ADMCOC','2010-11-23 15:00:45','200000033'),
 (1819,'tviaje','I','ADMCOC','2010-11-23 15:00:45','200000031'),
 (1820,'tAnticipo','I','ADMCOC','2010-11-23 15:01:40','200000034'),
 (1821,'tviaje','I','ADMCOC','2010-11-23 15:01:40','200000032'),
 (1822,'tAnticipo','I','ADMCOC','2010-11-23 15:33:37','200000035'),
 (1823,'tviaje','I','ADMCOC','2010-11-23 15:33:37','200000033'),
 (1824,'tAnticipo','I','ADMCOC','2010-11-23 15:39:45','200000036'),
 (1825,'tviaje','I','ADMCOC','2010-11-23 15:39:45','200000034'),
 (1826,'tAnticipo','I','ADMCOC','2010-11-23 15:42:22','200000037'),
 (1827,'tviaje','I','ADMCOC','2010-11-23 15:42:22','200000035'),
 (1828,'tAnticipo','I','ADMCOC','2010-11-23 16:01:53','200000038'),
 (1829,'tviaje','I','ADMCOC','2010-11-23 16:01:53','200000036'),
 (1830,'tAnticipo','I','ADMCOC','2010-11-23 17:11:23','200000039'),
 (1831,'tviaje','I','ADMCOC','2010-11-23 17:11:23','200000037'),
 (1832,'tAnticipo','I','ADMCOC','2010-11-23 17:17:25','200000040'),
 (1833,'tviaje','I','ADMCOC','2010-11-23 17:17:25','200000038'),
 (1834,'tAnticipo','I','ADMCOC','2010-11-24 15:23:33','200000041'),
 (1835,'tviaje','I','ADMCOC','2010-11-24 15:23:33','200000039'),
 (1836,'tAnticipo','I','ADMCOC','2010-11-25 11:57:15','200000042'),
 (1837,'tviaje','I','ADMCOC','2010-11-25 11:57:15','200000040'),
 (1838,'tAnticipo','I','ADMCOC','2010-11-25 11:58:53','200000043'),
 (1839,'tviaje','I','ADMCOC','2010-11-25 11:58:53','200000041'),
 (1840,'tAnticipo','I','ADMCOC','2010-11-25 14:05:54','200000044'),
 (1841,'tviaje','I','ADMCOC','2010-11-25 14:05:54','200000042'),
 (1842,'tAnticipo','I','ADMCOC','2010-11-25 15:24:24','200000045'),
 (1843,'tviaje','I','ADMCOC','2010-11-25 15:24:24','200000043'),
 (1844,'tAnticipo','I','ADMCOC','2010-11-25 15:38:50','200000046'),
 (1845,'tviaje','I','ADMCOC','2010-11-25 15:38:50','200000044'),
 (1846,'tAnticipo','I','ADMCOC','2010-11-25 16:48:46','200000047'),
 (1847,'tviaje','I','ADMCOC','2010-11-25 16:48:46','200000045'),
 (1848,'tAnticipo','I','ADMCOC','2010-11-25 17:01:22','200000048'),
 (1849,'tviaje','I','ADMCOC','2010-11-25 17:01:22','200000046'),
 (1850,'tAnticipo','I','ADMCOC','2010-11-25 17:22:05','200000049'),
 (1851,'tviaje','I','ADMCOC','2010-11-25 17:22:05','200000047'),
 (1852,'tusuario','I','CONTTRANSPORTE','2010-11-25 17:51:10','CONTTRANSPORTE'),
 (1853,'tusuario','D','CONTTRANSPORTE','2010-11-26 08:33:40','CONTTRANSPORTE'),
 (1854,'tusuario','D','P','2010-11-26 08:41:08','P'),
 (1855,'tusuario','I','NELIGER','2010-11-26 08:43:44','NELIGER'),
 (1856,'tusuario','U','NELIGER','2010-11-26 08:44:30','NELIGER'),
 (1857,'tusuario','I','MARIO','2010-11-26 08:46:08','MARIO'),
 (1858,'tusuario','U','NELIGER','2010-11-26 09:31:45','NELIGER'),
 (1859,'tAnticipo','I','ADMCOC','2010-11-26 15:35:30','200000050'),
 (1860,'tviaje','I','ADMCOC','2010-11-26 15:35:30','200000048'),
 (1861,'tAnticipo','I','ADMCOC','2010-11-26 16:02:15','200000051'),
 (1862,'tviaje','I','ADMCOC','2010-11-26 16:02:15','200000049'),
 (1863,'tAnticipo','I','ADMCOC','2010-11-26 17:50:56','200000052'),
 (1864,'tviaje','I','ADMCOC','2010-11-26 17:51:30','200000050'),
 (1865,'tAnticipo','I','ADMCOC','2010-11-29 14:32:16','200000053'),
 (1866,'tviaje','I','ADMCOC','2010-11-29 14:32:17','200000051'),
 (1867,'tAnticipo','I','ADMCOC','2010-11-29 14:35:45','200000054'),
 (1868,'tviaje','I','ADMCOC','2010-11-29 14:35:46','200000052'),
 (1869,'tAnticipo','I','ADMCOC','2010-11-29 14:37:21','200000055'),
 (1870,'tviaje','I','ADMCOC','2010-11-29 14:37:22','200000053'),
 (1871,'tAnticipo','I','ADMCOC','2010-11-29 14:38:47','200000056'),
 (1872,'tviaje','I','ADMCOC','2010-11-29 14:38:48','200000054'),
 (1873,'tAnticipo','I','ADMCOC','2010-11-29 17:07:01','200000057'),
 (1874,'tviaje','I','ADMCOC','2010-11-29 17:07:01','200000055'),
 (1875,'tusuario','U','MARIO','2010-11-29 17:54:24','MARIO'),
 (1876,'tusuario','U','MARIO','2010-11-29 17:55:58','MARIO'),
 (1877,'tvehiculo','I','MARIO','2010-11-29 17:57:07','A23AE4U'),
 (1878,'tChofer','I','MARIO','2010-11-29 17:57:07','11540495'),
 (1879,'tperiodo','U','ADMIN','2010-11-29 18:10:10','122010'),
 (1880,'tvehiculo','I','MARIO','2010-11-29 18:10:41','A23AE5U'),
 (1881,'tusuario','U','MARIO','2010-11-29 18:24:09','MARIO'),
 (1882,'tChofer','U','ADMIN','2010-11-29 18:25:58','11542453'),
 (1883,'tusuario','U','ADMCOC','2010-11-29 18:26:30','ADMCOC'),
 (1884,'tusuario','U','ADMCOC','2010-11-29 18:26:39','ADMCOC'),
 (1885,'tusuario','U','MARIO','2010-11-29 18:26:44','MARIO'),
 (1886,'tvehiculo','U','MARIO','2010-11-29 18:29:07','A23AE5U'),
 (1887,'tAnticipo','I','MARIO','2010-11-29 18:31:58','200000058'),
 (1888,'tviaje','I','MARIO','2010-11-29 18:31:59','200000056'),
 (1889,'tvehiculo','I','ADMCOC','2010-11-30 07:54:06','26-11-2010'),
 (1890,'tChofer','I','ADMCOC','2010-11-30 07:54:09','20809213'),
 (1891,'tAnticipo','I','ADMCOC','2010-11-30 07:54:54','200000059'),
 (1892,'tviaje','I','ADMCOC','2010-11-30 07:54:54','200000057'),
 (1893,'tRelacion','I','MARIO','2010-11-30 08:43:29','200000001'),
 (1894,'tAnticipo','U','MARIO','2010-11-30 08:43:29','200000058'),
 (1895,'tAnticipo','I','MARIO','2010-11-30 08:47:35','200000060'),
 (1896,'tviaje','I','MARIO','2010-11-30 08:47:35','200000058'),
 (1897,'tRelacion','I','MARIO','2010-11-30 08:50:09','200000002'),
 (1898,'tAnticipo','U','MARIO','2010-11-30 08:50:09','200000060'),
 (1899,'tRelacion','I','MARIO','2010-11-30 08:53:39','200000003'),
 (1900,'tAnticipo','U','ADMCOC','2010-11-30 08:53:39','200000022'),
 (1901,'tRelacion','I','MARIO','2010-11-30 08:54:46','200000004'),
 (1902,'tAnticipo','U','ADMCOC','2010-11-30 08:54:46','200000003'),
 (1903,'tRelacion','I','MARIO','2010-11-30 08:55:58','200000005'),
 (1904,'tAnticipo','U','ADMCOC','2010-11-30 08:55:58','200000002'),
 (1905,'tRelacion','I','MARIO','2010-11-30 08:56:51','200000006'),
 (1906,'tAnticipo','U','ADMCOC','2010-11-30 08:56:51','200000019'),
 (1907,'tRelacion','I','MARIO','2010-11-30 09:01:04','200000007'),
 (1908,'tAnticipo','U','ADMCOC','2010-11-30 09:01:04','200000012'),
 (1909,'tRelacion','I','MARIO','2010-11-30 09:02:10','200000008'),
 (1910,'tAnticipo','U','ADMCOC','2010-11-30 09:02:10','200000028'),
 (1911,'tRelacion','I','MARIO','2010-11-30 09:04:29','200000009'),
 (1912,'tAnticipo','U','ADMCOC','2010-11-30 09:04:29','200000025'),
 (1913,'tChofer','I','MARIO','2010-11-30 09:05:13','12264842'),
 (1914,'tvehiculo','U','MARIO','2010-11-30 09:07:40','A68AE5E'),
 (1915,'tvehiculo','U','MARIO','2010-11-30 09:09:07','A68AE5E'),
 (1916,'tRelacion','I','MARIO','2010-11-30 09:10:18','200000010'),
 (1917,'tAnticipo','U','ADMCOC','2010-11-30 09:10:18','200000008'),
 (1918,'tRelacion','I','MARIO','2010-11-30 09:11:07','200000011'),
 (1919,'tAnticipo','U','ADMCOC','2010-11-30 09:11:07','200000014'),
 (1920,'tRelacion','I','MARIO','2010-11-30 09:14:54','200000012'),
 (1921,'tAnticipo','U','ADMCOC','2010-11-30 09:14:54','200000010'),
 (1922,'tRelacion','I','MARIO','2010-11-30 09:16:43','200000013'),
 (1923,'tAnticipo','U','ADMCOC','2010-11-30 09:16:43','200000011'),
 (1924,'tRelacion','I','MARIO','2010-11-30 09:23:57','200000014'),
 (1925,'tAnticipo','U','ADMCOC','2010-11-30 09:23:57','200000001'),
 (1926,'tRelacion','I','MARIO','2010-11-30 09:26:10','200000015'),
 (1927,'tAnticipo','U','ADMCOC','2010-11-30 09:26:10','200000029'),
 (1928,'tRelacion','I','MARIO','2010-11-30 09:26:40','200000016'),
 (1929,'tAnticipo','U','ADMCOC','2010-11-30 09:26:40','200000030'),
 (1930,'tRelacion','I','MARIO','2010-11-30 09:27:19','200000017'),
 (1931,'tAnticipo','U','ADMCOC','2010-11-30 09:27:19','200000041'),
 (1932,'tAnticipo','I','ADMCOC','2010-11-30 10:28:11','200000061'),
 (1933,'tviaje','I','ADMCOC','2010-11-30 10:28:11','200000059'),
 (1934,'tAnticipo','I','ADMCOC','2010-11-30 14:29:22','200000062'),
 (1935,'tviaje','I','ADMCOC','2010-11-30 14:29:22','200000060'),
 (1936,'tAnticipo','I','ADMCOC','2010-11-30 14:34:12','200000063'),
 (1937,'tviaje','I','ADMCOC','2010-11-30 14:34:12','200000061'),
 (1938,'tAnticipo','I','ADMCOC','2010-11-30 14:59:55','200000064'),
 (1939,'tviaje','I','ADMCOC','2010-11-30 14:59:55','200000062'),
 (1940,'tAnticipo','I','ADMCOC','2010-11-30 15:11:42','200000065'),
 (1941,'tviaje','I','ADMCOC','2010-11-30 15:11:42','200000063'),
 (1942,'tAnticipo','I','ADMCOC','2010-11-30 15:35:25','200000066'),
 (1943,'tviaje','I','ADMCOC','2010-11-30 15:35:25','200000064'),
 (1944,'tAnticipo','I','ADMCOC','2010-11-30 15:51:47','200000067'),
 (1945,'tviaje','I','ADMCOC','2010-11-30 15:51:47','200000065'),
 (1946,'tAnticipo','I','ADMCOC','2010-11-30 16:05:37','200000068'),
 (1947,'tviaje','I','ADMCOC','2010-11-30 16:05:37','200000066'),
 (1948,'tusuario','U','ADMCOC','2010-11-30 18:16:00','ADMCOC'),
 (1949,'tusuario','U','ADMCOC','2010-11-30 18:16:07','ADMCOC'),
 (1950,'tusuario','U','MARIO','2010-11-30 18:16:22','MARIO'),
 (1951,'tusuario','U','NELIGER','2010-11-30 18:16:31','NELIGER'),
 (1952,'tusuario','U','NELIGER','2010-11-30 18:27:51','NELIGER'),
 (1953,'ttipo_gasto','U','NELIGER','2010-11-30 18:29:44','01'),
 (1954,'tAnticipo','I','ADMCOC','2010-12-01 14:22:34','200000069'),
 (1955,'tAnticipo','U','ADMCOC','2010-12-01 14:22:34','200000057'),
 (1956,'tAnticipo','I','ADMCOC','2010-12-01 14:24:38','200000070'),
 (1957,'tviaje','I','ADMCOC','2010-12-01 14:24:38','200000067'),
 (1958,'tAnticipo','I','ADMCOC','2010-12-01 17:45:41','200000071'),
 (1959,'tviaje','I','ADMCOC','2010-12-01 17:45:41','200000068'),
 (1960,'tAnticipo','I','ADMCOC','2010-12-01 17:46:58','200000072'),
 (1961,'tviaje','I','ADMCOC','2010-12-01 17:46:58','200000069'),
 (1962,'tAnticipo','I','ADMCOC','2010-12-01 17:49:48','200000073'),
 (1963,'tviaje','I','ADMCOC','2010-12-01 17:49:48','200000070'),
 (1964,'tAnticipo','I','ADMCOC','2010-12-02 10:52:21','200000074'),
 (1965,'tviaje','I','ADMCOC','2010-12-02 10:52:21','200000071'),
 (1966,'tAnticipo','I','ADMCOC','2010-12-02 11:09:42','200000075'),
 (1967,'tviaje','I','ADMCOC','2010-12-02 11:09:42','200000072'),
 (1968,'tAnticipo','I','ADMCOC','2010-12-02 11:12:45','200000076'),
 (1969,'tviaje','I','ADMCOC','2010-12-02 11:12:45','200000073'),
 (1970,'tAnticipo','I','ADMCOC','2010-12-02 12:05:05','200000077'),
 (1971,'tviaje','I','ADMCOC','2010-12-02 12:05:05','200000074'),
 (1972,'tAnticipo','I','ADMCOC','2010-12-02 14:55:01','200000078'),
 (1973,'tviaje','I','ADMCOC','2010-12-02 14:55:01','200000075'),
 (1974,'tAnticipo','I','ADMCOC','2010-12-02 15:54:47','200000079'),
 (1975,'tviaje','I','ADMCOC','2010-12-02 15:54:47','200000076'),
 (1976,'tAnticipo','I','ADMCOC','2010-12-02 17:18:23','200000080'),
 (1977,'tviaje','I','ADMCOC','2010-12-02 17:18:23','200000077'),
 (1978,'tAnticipo','I','ADMCOC','2010-12-03 09:24:12','200000081'),
 (1979,'tviaje','I','ADMCOC','2010-12-03 09:24:12','200000078'),
 (1980,'tvehiculo','I','ADMCOC','2010-12-03 11:55:02','A23AE3U'),
 (1981,'tvehiculo','U','ADMIN','2010-12-03 11:59:24','A23AE3U'),
 (1982,'tAnticipo','I','ADMCOC','2010-12-03 12:01:46','200000082'),
 (1983,'tviaje','I','ADMCOC','2010-12-03 12:01:46','200000079'),
 (1984,'tAnticipo','I','ADMCOC','2010-12-03 16:42:24','200000083'),
 (1985,'tviaje','I','ADMCOC','2010-12-03 16:42:24','200000080'),
 (1986,'tAnticipo','I','ADMCOC','2010-12-03 17:26:21','200000084'),
 (1987,'tviaje','I','ADMCOC','2010-12-03 17:26:21','200000081'),
 (1988,'tAnticipo','I','ADMCOC','2010-12-03 17:32:59','200000085'),
 (1989,'tviaje','I','ADMCOC','2010-12-03 17:32:59','200000082'),
 (1990,'tAnticipo','I','ADMCOC','2010-12-03 17:34:39','200000086'),
 (1991,'tviaje','I','ADMCOC','2010-12-03 17:34:39','200000083'),
 (1992,'tAnticipo','I','ADMCOC','2010-12-03 17:38:12','200000087'),
 (1993,'tviaje','I','ADMCOC','2010-12-03 17:38:12','200000084'),
 (1994,'tAnticipo','I','ADMCOC','2010-12-03 17:40:19','200000088'),
 (1995,'tviaje','I','ADMCOC','2010-12-03 17:40:19','200000085'),
 (1996,'tAnticipo','I','ADMCOC','2010-12-03 17:42:54','200000089'),
 (1997,'tviaje','I','ADMCOC','2010-12-03 17:42:54','200000086'),
 (1998,'tCiudad','U','ADMIN','2010-12-03 17:46:56','1714'),
 (1999,'torigen_destino','U','ADMIN','2010-12-03 17:47:30','62'),
 (2000,'truta','U','ADMIN','2010-12-03 17:47:54','162'),
 (2001,'tAnticipo','I','ADMCOC','2010-12-03 17:52:42','200000090'),
 (2002,'tviaje','I','ADMCOC','2010-12-03 17:52:42','200000087'),
 (2003,'tAnticipo','I','ADMCOC','2010-12-06 16:27:53','200000091'),
 (2004,'tviaje','I','ADMCOC','2010-12-06 16:27:53','200000088'),
 (2005,'tAnticipo','I','ADMCOC','2010-12-06 16:33:15','200000092'),
 (2006,'tviaje','I','ADMCOC','2010-12-06 16:33:15','200000089'),
 (2007,'tAnticipo','I','ADMCOC','2010-12-06 16:38:07','200000093'),
 (2008,'tviaje','I','ADMCOC','2010-12-06 16:38:07','200000090'),
 (2009,'tAnticipo','I','ADMCOC','2010-12-06 17:33:43','200000094'),
 (2010,'tviaje','I','ADMCOC','2010-12-06 17:33:43','200000091'),
 (2011,'tRelacion','I','MARIO','2010-12-06 18:19:24','200000018'),
 (2012,'tAnticipo','U','ADMCOC','2010-12-06 18:19:24','200000035'),
 (2013,'tRelacion','I','MARIO','2010-12-06 18:20:04','200000019'),
 (2014,'tAnticipo','U','ADMCOC','2010-12-06 18:20:04','200000045'),
 (2015,'tRelacion','I','MARIO','2010-12-06 18:20:44','200000020'),
 (2016,'tAnticipo','U','ADMCOC','2010-12-06 18:20:44','200000052'),
 (2017,'tRelacion','I','MARIO','2010-12-06 18:21:13','200000021'),
 (2018,'tAnticipo','U','ADMCOC','2010-12-06 18:21:13','200000036'),
 (2019,'tRelacion','I','MARIO','2010-12-06 18:21:49','200000022'),
 (2020,'tAnticipo','U','ADMCOC','2010-12-06 18:21:49','200000042'),
 (2021,'tRelacion','I','MARIO','2010-12-06 18:23:13','200000023'),
 (2022,'tAnticipo','U','ADMCOC','2010-12-06 18:23:13','200000043'),
 (2023,'tRelacion','I','MARIO','2010-12-06 18:23:45','200000024'),
 (2024,'tAnticipo','U','ADMCOC','2010-12-06 18:23:45','200000038'),
 (2025,'tRelacion','I','MARIO','2010-12-06 18:26:06','200000025'),
 (2026,'tAnticipo','U','ADMCOC','2010-12-06 18:26:06','200000004'),
 (2027,'tAnticipo','U','ADMCOC','2010-12-06 18:26:06','200000013'),
 (2028,'tRelacion','I','MARIO','2010-12-07 07:41:43','200000026'),
 (2029,'tAnticipo','U','ADMCOC','2010-12-07 07:41:43','200000049'),
 (2030,'tRelacion','I','MARIO','2010-12-07 07:42:17','200000027'),
 (2031,'tAnticipo','U','ADMCOC','2010-12-07 07:42:17','200000032'),
 (2032,'tRelacion','I','MARIO','2010-12-07 07:42:49','200000028'),
 (2033,'tAnticipo','U','ADMCOC','2010-12-07 07:42:49','200000026'),
 (2034,'tRelacion','I','MARIO','2010-12-07 07:43:33','200000029'),
 (2035,'tAnticipo','U','ADMCOC','2010-12-07 07:43:33','200000017'),
 (2036,'tRelacion','I','MARIO','2010-12-07 07:44:21','200000030'),
 (2037,'tAnticipo','U','ADMCOC','2010-12-07 07:44:21','200000005'),
 (2038,'tRelacion','I','MARIO','2010-12-07 07:44:55','200000031'),
 (2039,'tAnticipo','U','ADMCOC','2010-12-07 07:44:55','200000040'),
 (2040,'tRelacion','I','MARIO','2010-12-07 07:45:25','200000032'),
 (2041,'tAnticipo','U','ADMCOC','2010-12-07 07:45:25','200000018'),
 (2042,'tAnticipo','I','MARIO','2010-12-07 07:46:56','200000095'),
 (2043,'tviaje','I','MARIO','2010-12-07 07:46:56','200000092'),
 (2044,'tRelacion','I','MARIO','2010-12-07 07:48:04','200000033'),
 (2045,'tAnticipo','U','MARIO','2010-12-07 07:48:04','200000095'),
 (2046,'tRelacion','I','MARIO','2010-12-07 07:50:09','200000034'),
 (2047,'tAnticipo','U','ADMCOC','2010-12-07 07:50:09','200000056'),
 (2048,'tRelacion','I','MARIO','2010-12-07 07:50:42','200000035'),
 (2049,'tAnticipo','U','ADMCOC','2010-12-07 07:50:42','200000050'),
 (2050,'tRelacion','I','MARIO','2010-12-07 07:51:16','200000036'),
 (2051,'tAnticipo','U','ADMCOC','2010-12-07 07:51:16','200000023'),
 (2052,'tRelacion','I','MARIO','2010-12-07 07:51:50','200000037'),
 (2053,'tAnticipo','U','ADMCOC','2010-12-07 07:51:50','200000009'),
 (2054,'tRelacion','I','MARIO','2010-12-07 07:52:36','200000038'),
 (2055,'tAnticipo','U','ADMCOC','2010-12-07 07:52:36','200000034'),
 (2056,'tAnticipo','I','ADMCOC','2010-12-07 11:11:15','200000096'),
 (2057,'tviaje','I','ADMCOC','2010-12-07 11:11:15','200000093'),
 (2058,'tAnticipo','I','ADMCOC','2010-12-07 14:57:53','200000097'),
 (2059,'tviaje','I','ADMCOC','2010-12-07 14:57:53','200000094'),
 (2060,'tAnticipo','I','ADMCOC','2010-12-07 15:18:36','200000098'),
 (2061,'tviaje','I','ADMCOC','2010-12-07 15:18:36','200000095'),
 (2062,'tAnticipo','I','ADMCOC','2010-12-07 15:57:30','200000099'),
 (2063,'tAnticipo','U','ADMCOC','2010-12-07 15:57:31','200000083'),
 (2064,'tAnticipo','I','ADMCOC','2010-12-07 16:03:47','200000100'),
 (2065,'tviaje','I','ADMCOC','2010-12-07 16:03:47','200000096'),
 (2066,'tRelacion','I','MARIO','2010-12-07 16:07:57','200000039'),
 (2067,'tAnticipo','U','ADMCOC','2010-12-07 16:07:57','200000062'),
 (2068,'tRelacion','I','MARIO','2010-12-07 16:09:53','200000040'),
 (2069,'tAnticipo','U','ADMCOC','2010-12-07 16:09:53','200000066'),
 (2070,'tRelacion','I','MARIO','2010-12-07 16:10:18','200000041'),
 (2071,'tAnticipo','U','ADMCOC','2010-12-07 16:10:18','200000054'),
 (2072,'tRelacion','I','MARIO','2010-12-07 16:10:46','200000042'),
 (2073,'tAnticipo','U','ADMCOC','2010-12-07 16:10:46','200000046'),
 (2074,'tRelacion','I','MARIO','2010-12-07 16:11:16','200000043'),
 (2075,'tAnticipo','U','ADMCOC','2010-12-07 16:11:16','200000033'),
 (2076,'tRelacion','I','MARIO','2010-12-07 16:11:43','200000044'),
 (2077,'tAnticipo','U','ADMCOC','2010-12-07 16:11:43','200000024'),
 (2078,'tRelacion','I','MARIO','2010-12-07 16:12:08','200000045'),
 (2079,'tAnticipo','U','ADMCOC','2010-12-07 16:12:08','200000015'),
 (2080,'tRelacion','I','MARIO','2010-12-07 16:12:37','200000046'),
 (2081,'tAnticipo','U','ADMCOC','2010-12-07 16:12:37','200000007'),
 (2082,'tRelacion','I','MARIO','2010-12-07 16:14:49','200000047'),
 (2083,'tAnticipo','U','ADMCOC','2010-12-07 16:14:49','200000064'),
 (2084,'tRelacion','I','MARIO','2010-12-07 16:15:20','200000048'),
 (2085,'tAnticipo','U','ADMCOC','2010-12-07 16:15:20','200000072'),
 (2086,'tAnticipo','I','ADMCOC','2010-12-07 16:34:50','200000101'),
 (2087,'tviaje','I','ADMCOC','2010-12-07 16:34:50','200000097'),
 (2088,'tvehiculo','U','ADMIN','2010-12-07 17:00:25','A02AF5T'),
 (2089,'tChofer','I','ADMCOC','2010-12-07 17:00:29','13072039'),
 (2090,'tChofer','U','ADMIN','2010-12-07 17:01:24','13072039'),
 (2091,'tAnticipo','I','ADMCOC','2010-12-07 17:02:20','200000102'),
 (2092,'tviaje','I','ADMCOC','2010-12-07 17:02:20','200000098'),
 (2093,'tAnticipo','I','ADMCOC','2010-12-07 17:42:56','200000103'),
 (2094,'tviaje','I','ADMCOC','2010-12-07 17:42:56','200000099'),
 (2095,'tvehiculo','U','ADMIN','2010-12-08 11:33:26','A13AG7E'),
 (2096,'tAnticipo','I','ADMCOC','2010-12-08 11:34:04','200000104'),
 (2097,'tviaje','I','ADMCOC','2010-12-08 11:34:04','200000100'),
 (2098,'tAnticipo','I','ADMCOC','2010-12-08 11:39:24','200000105'),
 (2099,'tviaje','I','ADMCOC','2010-12-08 11:39:24','200000101'),
 (2100,'tAnticipo','I','ADMCOC','2010-12-08 12:01:08','200000106'),
 (2101,'tAnticipo','U','ADMCOC','2010-12-08 12:01:09','200000091'),
 (2102,'tAnticipo','I','ADMCOC','2010-12-08 14:00:33','200000107'),
 (2103,'tviaje','I','ADMCOC','2010-12-08 14:00:33','200000102'),
 (2104,'tAnticipo','I','ADMCOC','2010-12-08 15:42:08','200000108'),
 (2105,'tAnticipo','U','ADMCOC','2010-12-08 15:42:08','200000075'),
 (2106,'tviaje','I','ADMCOC','2010-12-08 15:42:08','200000103'),
 (2107,'tviaje','U','ADMCOC','2010-12-08 15:42:08','200000072'),
 (2108,'tAnticipo','U','ADMCOC','2010-12-08 15:42:09','200000075'),
 (2109,'tAnticipo','U','ADMCOC','2010-12-08 15:43:26','200000108'),
 (2110,'tAnticipo','I','MARIO','2010-12-08 17:15:21','200000109'),
 (2111,'tviaje','I','MARIO','2010-12-08 17:15:21','200000104'),
 (2112,'tRelacion','I','MARIO','2010-12-08 17:16:01','200000049'),
 (2113,'tAnticipo','U','MARIO','2010-12-08 17:16:01','200000109'),
 (2114,'tAnticipo','I','ADMCOC','2010-12-08 17:17:08','200000110'),
 (2115,'tviaje','I','ADMCOC','2010-12-08 17:17:08','200000105'),
 (2116,'tAnticipo','I','ADMCOC','2010-12-08 17:21:50','200000111'),
 (2117,'tviaje','I','ADMCOC','2010-12-08 17:21:50','200000106'),
 (2118,'tAnticipo','I','ADMCOC','2010-12-09 10:24:41','200000112'),
 (2119,'tviaje','I','ADMCOC','2010-12-09 10:24:41','200000107'),
 (2120,'tAnticipo','I','ADMCOC','2010-12-09 15:16:49','200000113'),
 (2121,'tviaje','I','ADMCOC','2010-12-09 15:16:49','200000108'),
 (2122,'tAnticipo','I','ADMCOC','2010-12-09 15:53:33','200000114'),
 (2123,'tviaje','I','ADMCOC','2010-12-09 15:53:33','200000109'),
 (2124,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000068'),
 (2125,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000070'),
 (2126,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000081'),
 (2127,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000082'),
 (2128,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000083'),
 (2129,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000084'),
 (2130,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000085'),
 (2131,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000086'),
 (2132,'tviaje','U','ADMCOC','2010-12-09 16:06:16','200000087'),
 (2133,'tAnticipo','I','ADMCOC','2010-12-09 17:12:31','200000115'),
 (2134,'tviaje','I','ADMCOC','2010-12-09 17:12:31','200000110');
INSERT INTO `tbitacora` (`nid_bitacora`,`ctabla`,`coperacion`,`cid_usuario`,`dfecha`,`cregistro`) VALUES 
 (2135,'tAnticipo','I','ADMCOC','2010-12-09 17:52:14','200000116'),
 (2136,'tviaje','I','ADMCOC','2010-12-09 17:52:14','200000111'),
 (2137,'tviaje','U','ADMCOC','2010-12-09 17:57:07','200000109'),
 (2138,'tRelacion','I','MARIO','2010-12-10 08:46:30','200000050'),
 (2139,'tAnticipo','U','ADMCOC','2010-12-10 08:46:30','200000081'),
 (2140,'tRelacion','I','MARIO','2010-12-10 08:47:00','200000051'),
 (2141,'tAnticipo','U','ADMCOC','2010-12-10 08:47:00','200000065'),
 (2142,'tRelacion','I','MARIO','2010-12-10 08:47:30','200000052'),
 (2143,'tAnticipo','U','ADMCOC','2010-12-10 08:47:30','200000047'),
 (2144,'tRelacion','I','MARIO','2010-12-10 08:48:24','200000053'),
 (2145,'tAnticipo','U','ADMCOC','2010-12-10 08:48:24','200000037'),
 (2146,'tRelacion','I','MARIO','2010-12-10 08:49:48','200000054'),
 (2147,'tAnticipo','U','ADMCOC','2010-12-10 08:49:48','200000021'),
 (2148,'tRelacion','I','MARIO','2010-12-10 08:50:20','200000055'),
 (2149,'tAnticipo','U','ADMCOC','2010-12-10 08:50:20','200000086'),
 (2150,'tRelacion','I','MARIO','2010-12-10 08:50:48','200000056'),
 (2151,'tAnticipo','U','ADMCOC','2010-12-10 08:50:48','200000074'),
 (2152,'tAnticipo','I','MARIO','2010-12-10 08:51:50','200000117'),
 (2153,'tviaje','I','MARIO','2010-12-10 08:51:50','200000112'),
 (2154,'tRelacion','I','MARIO','2010-12-10 08:52:38','200000057'),
 (2155,'tAnticipo','U','MARIO','2010-12-10 08:52:38','200000117'),
 (2156,'tRelacion','I','MARIO','2010-12-10 08:53:22','200000058'),
 (2157,'tAnticipo','U','ADMCOC','2010-12-10 08:53:22','200000083'),
 (2158,'tAnticipo','U','ADMCOC','2010-12-10 08:53:22','200000099'),
 (2159,'tRelacion','I','MARIO','2010-12-10 08:53:49','200000059'),
 (2160,'tAnticipo','U','ADMCOC','2010-12-10 08:53:49','200000061'),
 (2161,'tRelacion','I','MARIO','2010-12-10 08:54:22','200000060'),
 (2162,'tAnticipo','U','ADMCOC','2010-12-10 08:54:22','200000094'),
 (2163,'tRelacion','I','MARIO','2010-12-10 08:54:51','200000061'),
 (2164,'tAnticipo','U','ADMCOC','2010-12-10 08:54:51','200000089'),
 (2165,'tAnticipo','I','MARIO','2010-12-10 08:56:03','200000118'),
 (2166,'tviaje','I','MARIO','2010-12-10 08:56:03','200000113'),
 (2167,'tRelacion','I','MARIO','2010-12-10 08:56:42','200000062'),
 (2168,'tAnticipo','U','MARIO','2010-12-10 08:56:42','200000118'),
 (2169,'tRelacion','I','MARIO','2010-12-10 08:57:08','200000063'),
 (2170,'tAnticipo','U','ADMCOC','2010-12-10 08:57:08','200000087'),
 (2171,'tRelacion','I','MARIO','2010-12-10 08:57:38','200000064'),
 (2172,'tAnticipo','U','ADMCOC','2010-12-10 08:57:38','200000077'),
 (2173,'tRelacion','I','MARIO','2010-12-10 08:58:26','200000065'),
 (2174,'tAnticipo','U','ADMCOC','2010-12-10 08:58:26','200000020'),
 (2175,'tAnticipo','U','ADMCOC','2010-12-10 08:58:26','200000031'),
 (2176,'tRelacion','I','MARIO','2010-12-10 08:58:53','200000066'),
 (2177,'tAnticipo','U','ADMCOC','2010-12-10 08:58:53','200000070'),
 (2178,'tRelacion','I','MARIO','2010-12-10 08:59:25','200000067'),
 (2179,'tAnticipo','U','ADMCOC','2010-12-10 08:59:25','200000079'),
 (2180,'tRelacion','I','MARIO','2010-12-10 08:59:55','200000068'),
 (2181,'tAnticipo','U','ADMCOC','2010-12-10 08:59:55','200000071'),
 (2182,'tRelacion','I','MARIO','2010-12-10 09:00:28','200000069'),
 (2183,'tAnticipo','U','ADMCOC','2010-12-10 09:00:28','200000055'),
 (2184,'tAnticipo','I','ADMCOC','2010-12-10 09:56:04','200000119'),
 (2185,'tviaje','I','ADMCOC','2010-12-10 09:56:04','200000114'),
 (2186,'tRelacion','I','MARIO','2010-12-10 14:46:03','200000070'),
 (2187,'tAnticipo','U','ADMCOC','2010-12-10 14:46:03','200000063'),
 (2188,'tAnticipo','I','ADMCOC','2010-12-10 14:56:12','200000120'),
 (2189,'tviaje','I','ADMCOC','2010-12-10 14:56:12','200000115'),
 (2190,'tAnticipo','I','ADMCOC','2010-12-10 15:00:58','200000121'),
 (2191,'tviaje','I','ADMCOC','2010-12-10 15:00:58','200000116'),
 (2192,'tAnticipo','I','ADMCOC','2010-12-10 15:04:36','200000122'),
 (2193,'tviaje','I','ADMCOC','2010-12-10 15:04:36','200000117'),
 (2194,'tAnticipo','I','ADMCOC','2010-12-10 15:07:41','200000123'),
 (2195,'tviaje','I','ADMCOC','2010-12-10 15:07:41','200000118'),
 (2196,'tAnticipo','I','ADMCOC','2010-12-10 15:23:02','200000124'),
 (2197,'tviaje','I','ADMCOC','2010-12-10 15:23:02','200000119'),
 (2198,'tAnticipo','I','ADMCOC','2010-12-10 16:42:58','200000125'),
 (2199,'tviaje','I','ADMCOC','2010-12-10 16:42:58','200000120'),
 (2200,'tAnticipo','I','ADMCOC','2010-12-10 19:22:49','200000126'),
 (2201,'tviaje','I','ADMCOC','2010-12-10 19:22:49','200000121'),
 (2202,'tAnticipo','I','ADMCOC','2010-12-10 19:23:56','200000127'),
 (2203,'tviaje','I','ADMCOC','2010-12-10 19:23:56','200000122'),
 (2204,'tChofer','I','ADMCOC','2010-12-10 19:24:52','16072039'),
 (2205,'tAnticipo','I','ADMCOC','2010-12-10 19:26:50','200000128'),
 (2206,'tviaje','I','ADMCOC','2010-12-10 19:26:50','200000123'),
 (2207,'tAnticipo','I','ADMCOC','2010-12-10 19:27:59','200000129'),
 (2208,'tviaje','I','ADMCOC','2010-12-10 19:27:59','200000124'),
 (2209,'tRelacion','I','MARIO','2010-12-13 14:15:38','200000071'),
 (2210,'tAnticipo','U','ADMCOC','2010-12-13 14:15:38','200000102'),
 (2211,'tRelacion','I','MARIO','2010-12-13 14:16:35','200000072'),
 (2212,'tAnticipo','U','ADMCOC','2010-12-13 14:16:35','200000091'),
 (2213,'tAnticipo','U','ADMCOC','2010-12-13 14:16:35','200000106'),
 (2214,'tRelacion','I','MARIO','2010-12-13 14:17:05','200000073'),
 (2215,'tAnticipo','U','ADMCOC','2010-12-13 14:17:05','200000080'),
 (2216,'tRelacion','I','MARIO','2010-12-13 14:17:35','200000074'),
 (2217,'tAnticipo','U','ADMCOC','2010-12-13 14:17:35','200000067'),
 (2218,'tRelacion','I','MARIO','2010-12-13 14:18:02','200000075'),
 (2219,'tAnticipo','U','ADMCOC','2010-12-13 14:18:02','200000078'),
 (2220,'tRelacion','I','MARIO','2010-12-13 14:18:27','200000076'),
 (2221,'tAnticipo','U','ADMCOC','2010-12-13 14:18:27','200000088'),
 (2222,'tRelacion','I','MARIO','2010-12-13 14:23:55','200000077'),
 (2223,'tAnticipo','U','ADMCOC','2010-12-13 14:23:55','200000098'),
 (2224,'tRelacion','I','MARIO','2010-12-13 14:24:20','200000078'),
 (2225,'tAnticipo','U','ADMCOC','2010-12-13 14:24:20','200000053'),
 (2226,'tRelacion','I','MARIO','2010-12-13 14:26:16','200000079'),
 (2227,'tAnticipo','U','ADMCOC','2010-12-13 14:26:16','200000082'),
 (2228,'tRelacion','I','MARIO','2010-12-13 14:26:42','200000080'),
 (2229,'tAnticipo','U','ADMCOC','2010-12-13 14:26:42','200000101'),
 (2230,'tRelacion','I','MARIO','2010-12-13 14:27:14','200000081'),
 (2231,'tAnticipo','U','ADMCOC','2010-12-13 14:27:14','200000097'),
 (2232,'tRelacion','I','MARIO','2010-12-13 14:27:40','200000082'),
 (2233,'tAnticipo','U','ADMCOC','2010-12-13 14:27:40','200000051'),
 (2234,'tRelacion','I','MARIO','2010-12-13 14:28:05','200000083'),
 (2235,'tAnticipo','U','ADMCOC','2010-12-13 14:28:05','200000090'),
 (2236,'tRelacion','I','MARIO','2010-12-13 14:30:32','200000084'),
 (2237,'tAnticipo','U','ADMCOC','2010-12-13 14:30:32','200000110'),
 (2238,'tRelacion','I','MARIO','2010-12-13 14:31:01','200000085'),
 (2239,'tAnticipo','U','ADMCOC','2010-12-13 14:31:01','200000108'),
 (2240,'tRelacion','I','MARIO','2010-12-13 14:31:44','200000086'),
 (2241,'tAnticipo','U','ADMCOC','2010-12-13 14:31:44','200000104'),
 (2242,'tRelacion','I','MARIO','2010-12-13 14:32:16','200000087'),
 (2243,'tAnticipo','U','ADMCOC','2010-12-13 14:32:16','200000105'),
 (2244,'tRelacion','I','MARIO','2010-12-13 14:32:51','200000088'),
 (2245,'tAnticipo','U','ADMCOC','2010-12-13 14:32:51','200000092'),
 (2246,'tRelacion','I','MARIO','2010-12-13 14:33:15','200000089'),
 (2247,'tAnticipo','U','ADMCOC','2010-12-13 14:33:15','200000093'),
 (2248,'tRelacion','I','MARIO','2010-12-13 14:33:43','200000090'),
 (2249,'tAnticipo','U','ADMCOC','2010-12-13 14:33:43','200000111'),
 (2250,'tAnticipo','I','ADMCOC','2010-12-13 14:52:24','200000130'),
 (2251,'tviaje','I','ADMCOC','2010-12-13 14:52:24','200000125'),
 (2252,'tAnticipo','I','ADMCOC','2010-12-13 15:20:23','200000131'),
 (2253,'tviaje','I','ADMCOC','2010-12-13 15:20:23','200000126'),
 (2254,'tAnticipo','I','ADMCOC','2010-12-13 16:30:14','200000132'),
 (2255,'tviaje','I','ADMCOC','2010-12-13 16:30:14','200000127'),
 (2256,'tRelacion','I','MARIO','2010-12-13 17:32:15','200000091'),
 (2257,'tAnticipo','U','ADMCOC','2010-12-13 17:32:15','200000116'),
 (2258,'tRelacion','I','MARIO','2010-12-13 17:33:13','200000092'),
 (2259,'tAnticipo','U','ADMCOC','2010-12-13 17:33:13','200000121'),
 (2260,'tRelacion','I','MARIO','2010-12-13 17:33:46','200000093'),
 (2261,'tAnticipo','U','ADMCOC','2010-12-13 17:33:46','200000120'),
 (2262,'tRelacion','I','MARIO','2010-12-13 17:34:28','200000094'),
 (2263,'tAnticipo','U','ADMCOC','2010-12-13 17:34:28','200000057'),
 (2264,'tAnticipo','U','ADMCOC','2010-12-13 17:34:28','200000069'),
 (2265,'tRelacion','I','MARIO','2010-12-13 17:34:57','200000095'),
 (2266,'tAnticipo','U','ADMCOC','2010-12-13 17:34:57','200000073'),
 (2267,'tRelacion','I','MARIO','2010-12-13 17:35:25','200000096'),
 (2268,'tAnticipo','U','ADMCOC','2010-12-13 17:35:25','200000084'),
 (2269,'tRelacion','I','MARIO','2010-12-13 17:35:46','200000097'),
 (2270,'tAnticipo','U','ADMCOC','2010-12-13 17:35:46','200000113'),
 (2271,'tRelacion','I','MARIO','2010-12-13 17:36:10','200000098'),
 (2272,'tAnticipo','U','ADMCOC','2010-12-13 17:36:10','200000122'),
 (2273,'tperiodo','U','ADMIN','2010-12-13 18:20:57','122010'),
 (2274,'tperiodo','U','ADMIN','2010-12-13 18:20:57','122010'),
 (2275,'tvehiculo','U','ADMIN','2010-12-13 18:22:34','A23AE1U'),
 (2276,'tAnticipo','I','MARIO','2010-12-13 18:24:23','200000133'),
 (2277,'tviaje','I','MARIO','2010-12-13 18:24:23','200000128'),
 (2278,'tAnticipo','I','MARIO','2010-12-13 18:25:24','200000134'),
 (2279,'tviaje','I','MARIO','2010-12-13 18:25:25','200000129'),
 (2280,'tAnticipo','I','MARIO','2010-12-13 18:26:15','200000135'),
 (2281,'tviaje','I','MARIO','2010-12-13 18:26:15','200000130'),
 (2282,'tAnticipo','I','MARIO','2010-12-13 18:27:17','200000136'),
 (2283,'tviaje','I','MARIO','2010-12-13 18:27:17','200000131'),
 (2284,'tRelacion','I','MARIO','2010-12-13 18:29:02','200000099'),
 (2285,'tAnticipo','U','MARIO','2010-12-13 18:29:02','200000136'),
 (2286,'tRelacion','I','MARIO','2010-12-13 18:29:31','200000100'),
 (2287,'tAnticipo','U','MARIO','2010-12-13 18:29:31','200000135'),
 (2288,'tRelacion','I','MARIO','2010-12-13 18:29:57','200000101'),
 (2289,'tAnticipo','U','MARIO','2010-12-13 18:29:57','200000134'),
 (2290,'tRelacion','I','MARIO','2010-12-13 18:30:25','200000102'),
 (2291,'tAnticipo','U','MARIO','2010-12-13 18:30:25','200000133'),
 (2292,'tAnticipo','I','ADMCOC','2010-12-14 10:29:11','200000137'),
 (2293,'tviaje','I','ADMCOC','2010-12-14 10:29:11','200000132'),
 (2294,'tAnticipo','I','ADMCOC','2010-12-14 10:58:53','200000138'),
 (2295,'tviaje','I','ADMCOC','2010-12-14 10:58:53','200000133'),
 (2296,'tperiodo','U','ADMIN','2010-12-14 11:18:12','122010'),
 (2297,'tperiodo','U','ADMIN','2010-12-14 11:37:17','122010'),
 (2298,'tusuario','U','MARIO','2010-12-14 11:44:51','MARIO'),
 (2299,'tusuario','U','NELIGER','2010-12-14 11:46:36','NELIGER'),
 (2300,'tAnticipo','I','ADMCOC','2010-12-14 15:40:28','200000139'),
 (2301,'tviaje','I','ADMCOC','2010-12-14 15:40:28','200000134'),
 (2302,'tAnticipo','U','ADMCOC','2010-12-14 16:00:50','200000130'),
 (2303,'tAnticipo','I','ADMCOC','2010-12-14 16:03:41','200000140'),
 (2304,'tviaje','I','ADMCOC','2010-12-14 16:03:41','200000135'),
 (2305,'tAnticipo','I','ADMCOC','2010-12-14 17:07:15','200000141'),
 (2306,'tviaje','I','ADMCOC','2010-12-14 17:07:15','200000136'),
 (2307,'tAnticipo','I','ADMCOC','2010-12-14 17:39:10','200000142'),
 (2308,'tviaje','I','ADMCOC','2010-12-14 17:39:10','200000137'),
 (2309,'tAnticipo','I','ADMCOC','2010-12-14 17:43:03','200000143'),
 (2310,'tviaje','I','ADMCOC','2010-12-14 17:43:03','200000138'),
 (2311,'tAnticipo','I','ADMCOC','2010-12-14 18:12:46','200000144'),
 (2312,'tviaje','I','ADMCOC','2010-12-14 18:12:46','200000139'),
 (2313,'tAnticipo','I','ADMCOC','2010-12-14 18:20:28','200000145'),
 (2314,'tAnticipo','U','ADMCOC','2010-12-14 18:20:28','200000114'),
 (2315,'tusuario','I','JLOZADA','2010-12-15 08:46:37','JLOZADA'),
 (2316,'tusuario','U','JLOZADA','2010-12-15 08:46:59','JLOZADA'),
 (2317,'tusuario','U','JLOZADA','2010-12-15 08:47:35','JLOZADA'),
 (2318,'tusuario','U','MARIO','2010-12-15 09:49:05','MARIO'),
 (2319,'tAnticipo','U','MARIO','2010-12-15 09:54:50','200000136'),
 (2320,'trelacion','D','MARIO','2010-12-15 09:54:50','200000099'),
 (2321,'tAnticipo','U','MARIO','2010-12-15 09:55:12','200000136'),
 (2322,'tRelacion','I','MARIO','2010-12-15 10:15:34','200000103'),
 (2323,'tAnticipo','U','ADMCOC','2010-12-15 10:15:34','200000006'),
 (2324,'tRelacion','I','MARIO','2010-12-15 10:16:06','200000104'),
 (2325,'tAnticipo','U','ADMCOC','2010-12-15 10:16:06','200000016'),
 (2326,'tRelacion','I','MARIO','2010-12-15 10:16:45','200000105'),
 (2327,'tAnticipo','U','ADMCOC','2010-12-15 10:16:45','200000048'),
 (2328,'tRelacion','I','MARIO','2010-12-15 10:20:32','200000106'),
 (2329,'tAnticipo','U','ADMCOC','2010-12-15 10:20:32','200000039'),
 (2330,'tRelacion','I','MARIO','2010-12-15 10:21:15','200000107'),
 (2331,'tAnticipo','U','ADMCOC','2010-12-15 10:21:15','200000027'),
 (2332,'tRelacion','I','MARIO','2010-12-15 10:22:22','200000108'),
 (2333,'tAnticipo','U','ADMCOC','2010-12-15 10:22:22','200000085'),
 (2334,'tRelacion','I','MARIO','2010-12-15 10:22:52','200000109'),
 (2335,'tAnticipo','U','ADMCOC','2010-12-15 10:22:52','200000096'),
 (2336,'tRelacion','I','MARIO','2010-12-15 10:23:26','200000110'),
 (2337,'tAnticipo','U','ADMCOC','2010-12-15 10:23:26','200000107'),
 (2338,'tRelacion','I','MARIO','2010-12-15 10:45:51','200000111'),
 (2339,'tAnticipo','U','ADMCOC','2010-12-15 10:45:51','200000100'),
 (2340,'tvehiculo','U','MARIO','2010-12-15 11:25:10','A23AE4U'),
 (2341,'truta','I','ADMIN','2010-12-15 11:35:03','117'),
 (2342,'tAnticipo','I','MARIO','2010-12-15 11:36:12','200000146'),
 (2343,'tviaje','I','MARIO','2010-12-15 11:36:12','200000140'),
 (2344,'tRelacion','I','MARIO','2010-12-15 11:37:11','200000112'),
 (2345,'tAnticipo','U','MARIO','2010-12-15 11:37:11','200000146'),
 (2346,'tRelacion','I','MARIO','2010-12-15 11:49:42','200000113'),
 (2347,'tAnticipo','U','ADMCOC','2010-12-15 11:49:42','200000044'),
 (2348,'tAnticipo','I','JLOZADA','2010-12-15 11:53:19','200000147'),
 (2349,'tviaje','I','JLOZADA','2010-12-15 11:53:20','200000141'),
 (2350,'tAnticipo','I','JLOZADA','2010-12-15 12:02:27','200000148'),
 (2351,'tviaje','I','JLOZADA','2010-12-15 12:02:27','200000142'),
 (2352,'tAnticipo','I','MARIO','2010-12-15 14:35:36','200000149'),
 (2353,'tviaje','I','MARIO','2010-12-15 14:35:36','200000143'),
 (2354,'tRelacion','I','MARIO','2010-12-15 14:36:31','200000114'),
 (2355,'tAnticipo','U','MARIO','2010-12-15 14:36:31','200000149'),
 (2356,'tAnticipo','I','JLOZADA','2010-12-15 14:38:09','200000150'),
 (2357,'tviaje','I','JLOZADA','2010-12-15 14:38:09','200000144'),
 (2358,'tRelacion','I','MARIO','2010-12-15 14:38:55','200000115'),
 (2359,'tAnticipo','U','ADMCOC','2010-12-15 14:38:55','200000059'),
 (2360,'tRelacion','I','MARIO','2010-12-15 14:39:37','200000116'),
 (2361,'tAnticipo','U','ADMCOC','2010-12-15 14:39:37','200000076'),
 (2362,'tRelacion','I','MARIO','2010-12-15 14:40:11','200000117'),
 (2363,'tAnticipo','U','ADMCOC','2010-12-15 14:40:11','200000068'),
 (2364,'tAnticipo','I','JLOZADA','2010-12-15 15:26:45','200000151'),
 (2365,'tviaje','I','JLOZADA','2010-12-15 15:26:45','200000145'),
 (2366,'tAnticipo','I','JLOZADA','2010-12-15 15:30:32','200000152'),
 (2367,'tviaje','I','JLOZADA','2010-12-15 15:30:32','200000146'),
 (2368,'tAnticipo','I','JLOZADA','2010-12-15 16:22:13','200000153'),
 (2369,'tviaje','I','JLOZADA','2010-12-15 16:22:13','200000147'),
 (2370,'tAnticipo','I','JLOZADA','2010-12-15 16:57:26','200000154'),
 (2371,'tviaje','I','JLOZADA','2010-12-15 16:57:26','200000148'),
 (2372,'tAnticipo','I','JLOZADA','2010-12-16 10:22:53','200000155'),
 (2373,'tviaje','I','JLOZADA','2010-12-16 10:22:53','200000149'),
 (2374,'tAnticipo','I','JLOZADA','2010-12-16 10:59:05','200000156'),
 (2375,'tviaje','I','JLOZADA','2010-12-16 10:59:05','200000150'),
 (2376,'tAnticipo','U','JLOZADA','2010-12-16 11:31:11','200000156'),
 (2377,'tAnticipo','I','JLOZADA','2010-12-16 11:32:11','200000157'),
 (2378,'tviaje','I','JLOZADA','2010-12-16 11:32:11','200000151'),
 (2379,'tperiodo','U','ADMIN','2010-12-16 11:59:43','122010'),
 (2380,'tPeriodo','I','NELIGER','2010-12-16 12:01:25','166'),
 (2381,'tAnticipo','I','JLOZADA','2010-12-16 12:02:06','200000158'),
 (2382,'tviaje','I','JLOZADA','2010-12-16 12:02:06','200000152'),
 (2383,'tAnticipo','I','JLOZADA','2010-12-16 14:19:56','200000159'),
 (2384,'tviaje','I','JLOZADA','2010-12-16 14:19:56','200000153'),
 (2385,'trelacion','U','MARIO','2010-12-16 15:31:18','200000001'),
 (2386,'trelacion','U','MARIO','2010-12-16 15:31:18','200000002'),
 (2387,'trelacion','U','MARIO','2010-12-16 15:31:18','200000003'),
 (2388,'trelacion','U','MARIO','2010-12-16 15:31:18','200000004'),
 (2389,'trelacion','U','MARIO','2010-12-16 15:31:18','200000005'),
 (2390,'trelacion','U','MARIO','2010-12-16 15:31:18','200000006'),
 (2391,'trelacion','U','MARIO','2010-12-16 15:31:18','200000007'),
 (2392,'trelacion','U','MARIO','2010-12-16 15:31:18','200000008'),
 (2393,'trelacion','U','MARIO','2010-12-16 15:31:18','200000009'),
 (2394,'trelacion','U','MARIO','2010-12-16 15:31:18','200000010'),
 (2395,'trelacion','U','MARIO','2010-12-16 15:31:18','200000011'),
 (2396,'trelacion','U','MARIO','2010-12-16 15:31:18','200000012'),
 (2397,'trelacion','U','MARIO','2010-12-16 15:31:18','200000013'),
 (2398,'trelacion','U','MARIO','2010-12-16 15:31:18','200000014'),
 (2399,'trelacion','U','MARIO','2010-12-16 15:31:18','200000015'),
 (2400,'trelacion','U','MARIO','2010-12-16 15:31:18','200000016'),
 (2401,'trelacion','U','MARIO','2010-12-16 15:31:18','200000017'),
 (2402,'trelacion','U','MARIO','2010-12-16 15:31:18','200000018'),
 (2403,'trelacion','U','MARIO','2010-12-16 15:31:18','200000019'),
 (2404,'trelacion','U','MARIO','2010-12-16 15:31:18','200000020'),
 (2405,'trelacion','U','MARIO','2010-12-16 15:31:18','200000021'),
 (2406,'trelacion','U','MARIO','2010-12-16 15:31:18','200000022'),
 (2407,'trelacion','U','MARIO','2010-12-16 15:31:18','200000023'),
 (2408,'trelacion','U','MARIO','2010-12-16 15:31:18','200000024'),
 (2409,'trelacion','U','MARIO','2010-12-16 15:31:18','200000025'),
 (2410,'trelacion','U','MARIO','2010-12-16 15:31:18','200000026'),
 (2411,'trelacion','U','MARIO','2010-12-16 15:31:18','200000027'),
 (2412,'trelacion','U','MARIO','2010-12-16 15:31:18','200000028'),
 (2413,'trelacion','U','MARIO','2010-12-16 15:31:18','200000029'),
 (2414,'trelacion','U','MARIO','2010-12-16 15:31:18','200000030'),
 (2415,'trelacion','U','MARIO','2010-12-16 15:31:18','200000031'),
 (2416,'trelacion','U','MARIO','2010-12-16 15:31:18','200000032'),
 (2417,'trelacion','U','MARIO','2010-12-16 15:31:18','200000033'),
 (2418,'trelacion','U','MARIO','2010-12-16 15:31:18','200000034'),
 (2419,'trelacion','U','MARIO','2010-12-16 15:31:18','200000035'),
 (2420,'trelacion','U','MARIO','2010-12-16 15:31:18','200000036'),
 (2421,'trelacion','U','MARIO','2010-12-16 15:31:18','200000037'),
 (2422,'trelacion','U','MARIO','2010-12-16 15:31:18','200000038'),
 (2423,'trelacion','U','MARIO','2010-12-16 15:31:18','200000039'),
 (2424,'trelacion','U','MARIO','2010-12-16 15:31:18','200000040'),
 (2425,'trelacion','U','MARIO','2010-12-16 15:31:18','200000041'),
 (2426,'trelacion','U','MARIO','2010-12-16 15:31:18','200000042'),
 (2427,'trelacion','U','MARIO','2010-12-16 15:31:18','200000043'),
 (2428,'trelacion','U','MARIO','2010-12-16 15:31:18','200000044'),
 (2429,'trelacion','U','MARIO','2010-12-16 15:31:18','200000045'),
 (2430,'trelacion','U','MARIO','2010-12-16 15:31:18','200000046'),
 (2431,'trelacion','U','MARIO','2010-12-16 15:31:18','200000047'),
 (2432,'trelacion','U','MARIO','2010-12-16 15:31:18','200000048'),
 (2433,'trelacion','U','MARIO','2010-12-16 15:31:18','200000049'),
 (2434,'trelacion','U','MARIO','2010-12-16 15:31:18','200000050'),
 (2435,'trelacion','U','MARIO','2010-12-16 15:31:18','200000051'),
 (2436,'trelacion','U','MARIO','2010-12-16 15:31:18','200000052'),
 (2437,'trelacion','U','MARIO','2010-12-16 15:31:18','200000053'),
 (2438,'trelacion','U','MARIO','2010-12-16 15:31:18','200000054'),
 (2439,'trelacion','U','MARIO','2010-12-16 15:31:18','200000055'),
 (2440,'trelacion','U','MARIO','2010-12-16 15:31:18','200000056'),
 (2441,'trelacion','U','MARIO','2010-12-16 15:31:18','200000057'),
 (2442,'trelacion','U','MARIO','2010-12-16 15:31:18','200000058'),
 (2443,'trelacion','U','MARIO','2010-12-16 15:31:18','200000059'),
 (2444,'trelacion','U','MARIO','2010-12-16 15:31:18','200000060'),
 (2445,'trelacion','U','MARIO','2010-12-16 15:31:18','200000061'),
 (2446,'trelacion','U','MARIO','2010-12-16 15:31:18','200000062'),
 (2447,'trelacion','U','MARIO','2010-12-16 15:31:18','200000063'),
 (2448,'trelacion','U','MARIO','2010-12-16 15:31:18','200000064'),
 (2449,'trelacion','U','MARIO','2010-12-16 15:31:18','200000065'),
 (2450,'trelacion','U','MARIO','2010-12-16 15:31:18','200000066'),
 (2451,'trelacion','U','MARIO','2010-12-16 15:31:18','200000067'),
 (2452,'trelacion','U','MARIO','2010-12-16 15:31:18','200000068'),
 (2453,'trelacion','U','MARIO','2010-12-16 15:31:18','200000069'),
 (2454,'trelacion','U','MARIO','2010-12-16 15:31:18','200000070'),
 (2455,'trelacion','U','MARIO','2010-12-16 15:31:18','200000071'),
 (2456,'trelacion','U','MARIO','2010-12-16 15:31:18','200000072'),
 (2457,'trelacion','U','MARIO','2010-12-16 15:31:18','200000073'),
 (2458,'trelacion','U','MARIO','2010-12-16 15:31:18','200000074'),
 (2459,'trelacion','U','MARIO','2010-12-16 15:31:18','200000075'),
 (2460,'trelacion','U','MARIO','2010-12-16 15:31:18','200000076'),
 (2461,'trelacion','U','MARIO','2010-12-16 15:31:18','200000077'),
 (2462,'trelacion','U','MARIO','2010-12-16 15:31:18','200000078'),
 (2463,'trelacion','U','MARIO','2010-12-16 15:31:18','200000079'),
 (2464,'trelacion','U','MARIO','2010-12-16 15:31:18','200000080'),
 (2465,'trelacion','U','MARIO','2010-12-16 15:31:18','200000081'),
 (2466,'trelacion','U','MARIO','2010-12-16 15:31:18','200000082'),
 (2467,'trelacion','U','MARIO','2010-12-16 15:31:18','200000083'),
 (2468,'trelacion','U','MARIO','2010-12-16 15:31:18','200000084'),
 (2469,'trelacion','U','MARIO','2010-12-16 15:31:18','200000085'),
 (2470,'trelacion','U','MARIO','2010-12-16 15:31:18','200000086'),
 (2471,'trelacion','U','MARIO','2010-12-16 15:31:18','200000087'),
 (2472,'trelacion','U','MARIO','2010-12-16 15:31:18','200000088'),
 (2473,'trelacion','U','MARIO','2010-12-16 15:31:18','200000089'),
 (2474,'trelacion','U','MARIO','2010-12-16 15:31:18','200000090'),
 (2475,'trelacion','U','MARIO','2010-12-16 15:31:18','200000091'),
 (2476,'trelacion','U','MARIO','2010-12-16 15:31:18','200000092'),
 (2477,'trelacion','U','MARIO','2010-12-16 15:31:18','200000093'),
 (2478,'trelacion','U','MARIO','2010-12-16 15:31:18','200000094'),
 (2479,'trelacion','U','MARIO','2010-12-16 15:31:18','200000095'),
 (2480,'trelacion','U','MARIO','2010-12-16 15:31:18','200000096'),
 (2481,'trelacion','U','MARIO','2010-12-16 15:31:18','200000097'),
 (2482,'trelacion','U','MARIO','2010-12-16 15:31:18','200000098'),
 (2483,'trelacion','U','MARIO','2010-12-16 15:31:18','200000100'),
 (2484,'trelacion','U','MARIO','2010-12-16 15:31:18','200000101'),
 (2485,'trelacion','U','MARIO','2010-12-16 15:31:18','200000102'),
 (2486,'trelacion','U','MARIO','2010-12-16 15:31:18','200000103'),
 (2487,'trelacion','U','MARIO','2010-12-16 15:31:18','200000104'),
 (2488,'trelacion','U','MARIO','2010-12-16 15:31:18','200000105'),
 (2489,'trelacion','U','MARIO','2010-12-16 15:31:18','200000106'),
 (2490,'trelacion','U','MARIO','2010-12-16 15:31:18','200000107'),
 (2491,'trelacion','U','MARIO','2010-12-16 15:31:18','200000108'),
 (2492,'trelacion','U','MARIO','2010-12-16 15:31:18','200000109'),
 (2493,'trelacion','U','MARIO','2010-12-16 15:31:18','200000110'),
 (2494,'trelacion','U','MARIO','2010-12-16 15:31:18','200000111'),
 (2495,'trelacion','U','MARIO','2010-12-16 15:31:18','200000112'),
 (2496,'trelacion','U','MARIO','2010-12-16 15:31:18','200000113'),
 (2497,'trelacion','U','MARIO','2010-12-16 15:31:18','200000114'),
 (2498,'trelacion','U','MARIO','2010-12-16 15:31:18','200000115'),
 (2499,'trelacion','U','MARIO','2010-12-16 15:31:18','200000116'),
 (2500,'trelacion','U','MARIO','2010-12-16 15:31:18','200000117'),
 (2501,'tvehiculo','U','ADMIN','2010-12-16 16:07:15','A67AE8E'),
 (2502,'tviaje','U','ADMCOC','2010-12-17 09:15:25','200000122'),
 (2503,'tviaje','U','ADMCOC','2010-12-17 09:15:25','200000123'),
 (2504,'tviaje','U','ADMCOC','2010-12-17 09:15:25','200000124'),
 (2505,'tvehiculo','I','MARIO','2010-12-17 10:26:42','03LTAE'),
 (2506,'tvehiculo','U','MARIO','2010-12-17 10:29:20','03LTAE'),
 (2507,'tAnticipo','I','MARIO','2010-12-17 10:30:48','100000001'),
 (2508,'tviaje','I','MARIO','2010-12-17 10:30:48','100000001'),
 (2509,'tRelacion','I','MARIO','2010-12-17 10:35:49','100000001'),
 (2510,'tAnticipo','U','MARIO','2010-12-17 10:35:49','100000001'),
 (2511,'tviaje','U','ADMCOC','2010-12-17 10:47:18','200000069'),
 (2512,'tviaje','U','ADMCOC','2010-12-17 10:47:18','200000069'),
 (2513,'tviaje','U','ADMCOC','2010-12-17 10:47:18','200000069'),
 (2514,'tAnticipo','I','JLOZADA','2010-12-17 11:13:01','200000160'),
 (2515,'tviaje','I','JLOZADA','2010-12-17 11:13:02','200000154'),
 (2516,'tAnticipo','I','JLOZADA','2010-12-17 11:18:30','200000161'),
 (2517,'tviaje','I','JLOZADA','2010-12-17 11:18:30','200000155'),
 (2518,'tviaje','U','ADMCOC','2010-12-17 11:19:02','200000050'),
 (2519,'tviaje','U','ADMCOC','2010-12-17 11:19:02','200000050'),
 (2520,'tviaje','U','ADMCOC','2010-12-17 11:19:02','200000050'),
 (2521,'tviaje','U','MARIO','2010-12-17 11:19:47','100000001'),
 (2522,'tAnticipo','U','MARIO','2010-12-17 11:20:35','100000001'),
 (2523,'tviaje','U','MARIO','2010-12-17 11:21:24','100000001'),
 (2524,'trelacion','U','MARIO','2010-12-17 11:23:59','100000001'),
 (2525,'trelacion','U','MARIO','2010-12-17 11:23:59','200000001'),
 (2526,'trelacion','U','MARIO','2010-12-17 11:23:59','200000002'),
 (2527,'trelacion','U','MARIO','2010-12-17 11:23:59','200000003'),
 (2528,'trelacion','U','MARIO','2010-12-17 11:23:59','200000004'),
 (2529,'trelacion','U','MARIO','2010-12-17 11:23:59','200000005'),
 (2530,'trelacion','U','MARIO','2010-12-17 11:23:59','200000006'),
 (2531,'trelacion','U','MARIO','2010-12-17 11:23:59','200000007'),
 (2532,'trelacion','U','MARIO','2010-12-17 11:23:59','200000008'),
 (2533,'trelacion','U','MARIO','2010-12-17 11:23:59','200000009'),
 (2534,'trelacion','U','MARIO','2010-12-17 11:23:59','200000010'),
 (2535,'trelacion','U','MARIO','2010-12-17 11:23:59','200000011'),
 (2536,'trelacion','U','MARIO','2010-12-17 11:23:59','200000012'),
 (2537,'trelacion','U','MARIO','2010-12-17 11:23:59','200000013'),
 (2538,'trelacion','U','MARIO','2010-12-17 11:23:59','200000014'),
 (2539,'trelacion','U','MARIO','2010-12-17 11:23:59','200000015'),
 (2540,'trelacion','U','MARIO','2010-12-17 11:23:59','200000016'),
 (2541,'trelacion','U','MARIO','2010-12-17 11:23:59','200000017'),
 (2542,'trelacion','U','MARIO','2010-12-17 11:23:59','200000018'),
 (2543,'trelacion','U','MARIO','2010-12-17 11:23:59','200000019'),
 (2544,'trelacion','U','MARIO','2010-12-17 11:23:59','200000020'),
 (2545,'trelacion','U','MARIO','2010-12-17 11:23:59','200000021'),
 (2546,'trelacion','U','MARIO','2010-12-17 11:23:59','200000022'),
 (2547,'trelacion','U','MARIO','2010-12-17 11:23:59','200000023'),
 (2548,'trelacion','U','MARIO','2010-12-17 11:23:59','200000024'),
 (2549,'trelacion','U','MARIO','2010-12-17 11:23:59','200000025'),
 (2550,'trelacion','U','MARIO','2010-12-17 11:23:59','200000026'),
 (2551,'trelacion','U','MARIO','2010-12-17 11:23:59','200000027'),
 (2552,'trelacion','U','MARIO','2010-12-17 11:23:59','200000028'),
 (2553,'trelacion','U','MARIO','2010-12-17 11:23:59','200000029'),
 (2554,'trelacion','U','MARIO','2010-12-17 11:23:59','200000030'),
 (2555,'trelacion','U','MARIO','2010-12-17 11:23:59','200000031'),
 (2556,'trelacion','U','MARIO','2010-12-17 11:23:59','200000032'),
 (2557,'trelacion','U','MARIO','2010-12-17 11:23:59','200000033'),
 (2558,'trelacion','U','MARIO','2010-12-17 11:23:59','200000034'),
 (2559,'trelacion','U','MARIO','2010-12-17 11:23:59','200000035'),
 (2560,'trelacion','U','MARIO','2010-12-17 11:23:59','200000036'),
 (2561,'trelacion','U','MARIO','2010-12-17 11:23:59','200000037'),
 (2562,'trelacion','U','MARIO','2010-12-17 11:23:59','200000038'),
 (2563,'trelacion','U','MARIO','2010-12-17 11:23:59','200000039'),
 (2564,'trelacion','U','MARIO','2010-12-17 11:23:59','200000040'),
 (2565,'trelacion','U','MARIO','2010-12-17 11:23:59','200000041'),
 (2566,'trelacion','U','MARIO','2010-12-17 11:23:59','200000042'),
 (2567,'trelacion','U','MARIO','2010-12-17 11:23:59','200000043'),
 (2568,'trelacion','U','MARIO','2010-12-17 11:23:59','200000044'),
 (2569,'trelacion','U','MARIO','2010-12-17 11:23:59','200000045'),
 (2570,'trelacion','U','MARIO','2010-12-17 11:23:59','200000046'),
 (2571,'trelacion','U','MARIO','2010-12-17 11:23:59','200000047'),
 (2572,'trelacion','U','MARIO','2010-12-17 11:23:59','200000048'),
 (2573,'trelacion','U','MARIO','2010-12-17 11:23:59','200000049'),
 (2574,'trelacion','U','MARIO','2010-12-17 11:23:59','200000050'),
 (2575,'trelacion','U','MARIO','2010-12-17 11:23:59','200000051'),
 (2576,'trelacion','U','MARIO','2010-12-17 11:23:59','200000052'),
 (2577,'trelacion','U','MARIO','2010-12-17 11:23:59','200000053'),
 (2578,'trelacion','U','MARIO','2010-12-17 11:23:59','200000054'),
 (2579,'trelacion','U','MARIO','2010-12-17 11:23:59','200000055'),
 (2580,'trelacion','U','MARIO','2010-12-17 11:23:59','200000056'),
 (2581,'trelacion','U','MARIO','2010-12-17 11:23:59','200000057'),
 (2582,'trelacion','U','MARIO','2010-12-17 11:23:59','200000058'),
 (2583,'trelacion','U','MARIO','2010-12-17 11:23:59','200000059'),
 (2584,'trelacion','U','MARIO','2010-12-17 11:23:59','200000060'),
 (2585,'trelacion','U','MARIO','2010-12-17 11:23:59','200000061'),
 (2586,'trelacion','U','MARIO','2010-12-17 11:23:59','200000062'),
 (2587,'trelacion','U','MARIO','2010-12-17 11:23:59','200000063'),
 (2588,'trelacion','U','MARIO','2010-12-17 11:23:59','200000064'),
 (2589,'trelacion','U','MARIO','2010-12-17 11:23:59','200000065'),
 (2590,'trelacion','U','MARIO','2010-12-17 11:23:59','200000066'),
 (2591,'trelacion','U','MARIO','2010-12-17 11:23:59','200000067'),
 (2592,'trelacion','U','MARIO','2010-12-17 11:23:59','200000068'),
 (2593,'trelacion','U','MARIO','2010-12-17 11:23:59','200000069'),
 (2594,'trelacion','U','MARIO','2010-12-17 11:23:59','200000070'),
 (2595,'trelacion','U','MARIO','2010-12-17 11:23:59','200000071'),
 (2596,'trelacion','U','MARIO','2010-12-17 11:23:59','200000072'),
 (2597,'trelacion','U','MARIO','2010-12-17 11:23:59','200000073'),
 (2598,'trelacion','U','MARIO','2010-12-17 11:23:59','200000074'),
 (2599,'trelacion','U','MARIO','2010-12-17 11:23:59','200000075'),
 (2600,'trelacion','U','MARIO','2010-12-17 11:23:59','200000076'),
 (2601,'trelacion','U','MARIO','2010-12-17 11:23:59','200000077'),
 (2602,'trelacion','U','MARIO','2010-12-17 11:23:59','200000078'),
 (2603,'trelacion','U','MARIO','2010-12-17 11:23:59','200000079'),
 (2604,'trelacion','U','MARIO','2010-12-17 11:23:59','200000080'),
 (2605,'trelacion','U','MARIO','2010-12-17 11:23:59','200000081'),
 (2606,'trelacion','U','MARIO','2010-12-17 11:23:59','200000082'),
 (2607,'trelacion','U','MARIO','2010-12-17 11:23:59','200000083'),
 (2608,'trelacion','U','MARIO','2010-12-17 11:23:59','200000084'),
 (2609,'trelacion','U','MARIO','2010-12-17 11:23:59','200000085'),
 (2610,'trelacion','U','MARIO','2010-12-17 11:23:59','200000086'),
 (2611,'trelacion','U','MARIO','2010-12-17 11:23:59','200000087'),
 (2612,'trelacion','U','MARIO','2010-12-17 11:23:59','200000088'),
 (2613,'trelacion','U','MARIO','2010-12-17 11:23:59','200000089'),
 (2614,'trelacion','U','MARIO','2010-12-17 11:23:59','200000090'),
 (2615,'trelacion','U','MARIO','2010-12-17 11:23:59','200000091'),
 (2616,'trelacion','U','MARIO','2010-12-17 11:23:59','200000092'),
 (2617,'trelacion','U','MARIO','2010-12-17 11:23:59','200000093'),
 (2618,'trelacion','U','MARIO','2010-12-17 11:23:59','200000094'),
 (2619,'trelacion','U','MARIO','2010-12-17 11:23:59','200000095'),
 (2620,'trelacion','U','MARIO','2010-12-17 11:23:59','200000096'),
 (2621,'trelacion','U','MARIO','2010-12-17 11:23:59','200000097'),
 (2622,'trelacion','U','MARIO','2010-12-17 11:23:59','200000098'),
 (2623,'trelacion','U','MARIO','2010-12-17 11:23:59','200000100'),
 (2624,'trelacion','U','MARIO','2010-12-17 11:23:59','200000101'),
 (2625,'trelacion','U','MARIO','2010-12-17 11:23:59','200000102'),
 (2626,'trelacion','U','MARIO','2010-12-17 11:23:59','200000103'),
 (2627,'trelacion','U','MARIO','2010-12-17 11:23:59','200000104'),
 (2628,'trelacion','U','MARIO','2010-12-17 11:23:59','200000105'),
 (2629,'trelacion','U','MARIO','2010-12-17 11:23:59','200000106'),
 (2630,'trelacion','U','MARIO','2010-12-17 11:23:59','200000107'),
 (2631,'trelacion','U','MARIO','2010-12-17 11:23:59','200000108'),
 (2632,'trelacion','U','MARIO','2010-12-17 11:23:59','200000109'),
 (2633,'trelacion','U','MARIO','2010-12-17 11:23:59','200000110'),
 (2634,'trelacion','U','MARIO','2010-12-17 11:23:59','200000111'),
 (2635,'trelacion','U','MARIO','2010-12-17 11:23:59','200000112'),
 (2636,'trelacion','U','MARIO','2010-12-17 11:23:59','200000113'),
 (2637,'trelacion','U','MARIO','2010-12-17 11:23:59','200000114'),
 (2638,'trelacion','U','MARIO','2010-12-17 11:23:59','200000115'),
 (2639,'trelacion','U','MARIO','2010-12-17 11:23:59','200000116'),
 (2640,'trelacion','U','MARIO','2010-12-17 11:23:59','200000117'),
 (2641,'trelacion','U','MARIO','2010-12-17 11:26:27','200000001'),
 (2642,'trelacion','U','MARIO','2010-12-17 11:26:27','200000002'),
 (2643,'trelacion','U','MARIO','2010-12-17 11:26:27','200000003'),
 (2644,'trelacion','U','MARIO','2010-12-17 11:26:27','200000004'),
 (2645,'trelacion','U','MARIO','2010-12-17 11:26:27','200000005'),
 (2646,'trelacion','U','MARIO','2010-12-17 11:26:27','200000006'),
 (2647,'trelacion','U','MARIO','2010-12-17 11:26:27','200000007'),
 (2648,'trelacion','U','MARIO','2010-12-17 11:26:27','200000008'),
 (2649,'trelacion','U','MARIO','2010-12-17 11:26:27','200000009'),
 (2650,'trelacion','U','MARIO','2010-12-17 11:26:27','200000010'),
 (2651,'trelacion','U','MARIO','2010-12-17 11:26:27','200000011'),
 (2652,'trelacion','U','MARIO','2010-12-17 11:26:27','200000012'),
 (2653,'trelacion','U','MARIO','2010-12-17 11:26:27','200000013'),
 (2654,'trelacion','U','MARIO','2010-12-17 11:26:27','200000014'),
 (2655,'trelacion','U','MARIO','2010-12-17 11:26:27','200000015'),
 (2656,'trelacion','U','MARIO','2010-12-17 11:26:27','200000016'),
 (2657,'trelacion','U','MARIO','2010-12-17 11:26:27','200000017'),
 (2658,'trelacion','U','MARIO','2010-12-17 11:26:27','200000018'),
 (2659,'trelacion','U','MARIO','2010-12-17 11:26:27','200000019'),
 (2660,'trelacion','U','MARIO','2010-12-17 11:26:27','200000020'),
 (2661,'trelacion','U','MARIO','2010-12-17 11:26:27','200000021'),
 (2662,'trelacion','U','MARIO','2010-12-17 11:26:27','200000022'),
 (2663,'trelacion','U','MARIO','2010-12-17 11:26:27','200000023'),
 (2664,'trelacion','U','MARIO','2010-12-17 11:26:27','200000024'),
 (2665,'trelacion','U','MARIO','2010-12-17 11:26:27','200000025'),
 (2666,'trelacion','U','MARIO','2010-12-17 11:26:27','200000026'),
 (2667,'trelacion','U','MARIO','2010-12-17 11:26:27','200000027'),
 (2668,'trelacion','U','MARIO','2010-12-17 11:26:27','200000028'),
 (2669,'trelacion','U','MARIO','2010-12-17 11:26:27','200000029'),
 (2670,'trelacion','U','MARIO','2010-12-17 11:26:27','200000030'),
 (2671,'trelacion','U','MARIO','2010-12-17 11:26:27','200000031'),
 (2672,'trelacion','U','MARIO','2010-12-17 11:26:27','200000032'),
 (2673,'trelacion','U','MARIO','2010-12-17 11:26:27','200000033'),
 (2674,'trelacion','U','MARIO','2010-12-17 11:26:27','200000034'),
 (2675,'trelacion','U','MARIO','2010-12-17 11:26:27','200000035'),
 (2676,'trelacion','U','MARIO','2010-12-17 11:26:27','200000036'),
 (2677,'trelacion','U','MARIO','2010-12-17 11:26:27','200000037'),
 (2678,'trelacion','U','MARIO','2010-12-17 11:26:27','200000038'),
 (2679,'trelacion','U','MARIO','2010-12-17 11:26:27','200000039'),
 (2680,'trelacion','U','MARIO','2010-12-17 11:26:27','200000040'),
 (2681,'trelacion','U','MARIO','2010-12-17 11:26:27','200000041'),
 (2682,'trelacion','U','MARIO','2010-12-17 11:26:27','200000042'),
 (2683,'trelacion','U','MARIO','2010-12-17 11:26:27','200000043'),
 (2684,'trelacion','U','MARIO','2010-12-17 11:26:27','200000044'),
 (2685,'trelacion','U','MARIO','2010-12-17 11:26:27','200000045'),
 (2686,'trelacion','U','MARIO','2010-12-17 11:26:27','200000046'),
 (2687,'trelacion','U','MARIO','2010-12-17 11:26:27','200000047'),
 (2688,'trelacion','U','MARIO','2010-12-17 11:26:27','200000048'),
 (2689,'trelacion','U','MARIO','2010-12-17 11:26:27','200000049'),
 (2690,'trelacion','U','MARIO','2010-12-17 11:26:27','200000050'),
 (2691,'trelacion','U','MARIO','2010-12-17 11:26:27','200000051'),
 (2692,'trelacion','U','MARIO','2010-12-17 11:26:27','200000052'),
 (2693,'trelacion','U','MARIO','2010-12-17 11:26:27','200000053'),
 (2694,'trelacion','U','MARIO','2010-12-17 11:26:27','200000054'),
 (2695,'trelacion','U','MARIO','2010-12-17 11:26:27','200000055'),
 (2696,'trelacion','U','MARIO','2010-12-17 11:26:27','200000056'),
 (2697,'trelacion','U','MARIO','2010-12-17 11:26:27','200000057'),
 (2698,'trelacion','U','MARIO','2010-12-17 11:26:27','200000058'),
 (2699,'trelacion','U','MARIO','2010-12-17 11:26:27','200000059'),
 (2700,'trelacion','U','MARIO','2010-12-17 11:26:27','200000060'),
 (2701,'trelacion','U','MARIO','2010-12-17 11:26:27','200000061'),
 (2702,'trelacion','U','MARIO','2010-12-17 11:26:27','200000062'),
 (2703,'trelacion','U','MARIO','2010-12-17 11:26:27','200000063'),
 (2704,'trelacion','U','MARIO','2010-12-17 11:26:27','200000064'),
 (2705,'trelacion','U','MARIO','2010-12-17 11:26:27','200000065'),
 (2706,'trelacion','U','MARIO','2010-12-17 11:26:27','200000066'),
 (2707,'trelacion','U','MARIO','2010-12-17 11:26:27','200000067'),
 (2708,'trelacion','U','MARIO','2010-12-17 11:26:27','200000068'),
 (2709,'trelacion','U','MARIO','2010-12-17 11:26:27','200000069'),
 (2710,'trelacion','U','MARIO','2010-12-17 11:26:27','200000070'),
 (2711,'trelacion','U','MARIO','2010-12-17 11:26:27','200000071'),
 (2712,'trelacion','U','MARIO','2010-12-17 11:26:27','200000072'),
 (2713,'trelacion','U','MARIO','2010-12-17 11:26:27','200000073'),
 (2714,'trelacion','U','MARIO','2010-12-17 11:26:27','200000074'),
 (2715,'trelacion','U','MARIO','2010-12-17 11:26:27','200000075'),
 (2716,'trelacion','U','MARIO','2010-12-17 11:26:27','200000076'),
 (2717,'trelacion','U','MARIO','2010-12-17 11:26:27','200000077'),
 (2718,'trelacion','U','MARIO','2010-12-17 11:26:27','200000078'),
 (2719,'trelacion','U','MARIO','2010-12-17 11:26:27','200000079'),
 (2720,'trelacion','U','MARIO','2010-12-17 11:26:27','200000080'),
 (2721,'trelacion','U','MARIO','2010-12-17 11:26:27','200000081'),
 (2722,'trelacion','U','MARIO','2010-12-17 11:26:27','200000082'),
 (2723,'trelacion','U','MARIO','2010-12-17 11:26:27','200000083'),
 (2724,'trelacion','U','MARIO','2010-12-17 11:26:27','200000084'),
 (2725,'trelacion','U','MARIO','2010-12-17 11:26:27','200000085'),
 (2726,'trelacion','U','MARIO','2010-12-17 11:26:27','200000086'),
 (2727,'trelacion','U','MARIO','2010-12-17 11:26:27','200000087'),
 (2728,'trelacion','U','MARIO','2010-12-17 11:26:27','200000088'),
 (2729,'trelacion','U','MARIO','2010-12-17 11:26:27','200000089'),
 (2730,'trelacion','U','MARIO','2010-12-17 11:26:27','200000090'),
 (2731,'trelacion','U','MARIO','2010-12-17 11:26:27','200000091'),
 (2732,'trelacion','U','MARIO','2010-12-17 11:26:27','200000092'),
 (2733,'trelacion','U','MARIO','2010-12-17 11:26:27','200000093'),
 (2734,'trelacion','U','MARIO','2010-12-17 11:26:27','200000094'),
 (2735,'trelacion','U','MARIO','2010-12-17 11:26:27','200000095'),
 (2736,'trelacion','U','MARIO','2010-12-17 11:26:27','200000096'),
 (2737,'trelacion','U','MARIO','2010-12-17 11:26:27','200000097'),
 (2738,'trelacion','U','MARIO','2010-12-17 11:26:27','200000098'),
 (2739,'trelacion','U','MARIO','2010-12-17 11:26:27','200000100'),
 (2740,'trelacion','U','MARIO','2010-12-17 11:26:27','200000101'),
 (2741,'trelacion','U','MARIO','2010-12-17 11:26:27','200000102'),
 (2742,'trelacion','U','MARIO','2010-12-17 11:26:27','200000103'),
 (2743,'trelacion','U','MARIO','2010-12-17 11:26:27','200000104'),
 (2744,'trelacion','U','MARIO','2010-12-17 11:26:27','200000105'),
 (2745,'trelacion','U','MARIO','2010-12-17 11:26:27','200000106'),
 (2746,'trelacion','U','MARIO','2010-12-17 11:26:27','200000107'),
 (2747,'trelacion','U','MARIO','2010-12-17 11:26:27','200000108'),
 (2748,'trelacion','U','MARIO','2010-12-17 11:26:27','200000109'),
 (2749,'trelacion','U','MARIO','2010-12-17 11:26:27','200000110'),
 (2750,'trelacion','U','MARIO','2010-12-17 11:26:27','200000111'),
 (2751,'trelacion','U','MARIO','2010-12-17 11:26:27','200000112'),
 (2752,'trelacion','U','MARIO','2010-12-17 11:26:27','200000113'),
 (2753,'trelacion','U','MARIO','2010-12-17 11:26:27','200000114'),
 (2754,'trelacion','U','MARIO','2010-12-17 11:26:27','200000115'),
 (2755,'trelacion','U','MARIO','2010-12-17 11:26:27','200000116'),
 (2756,'trelacion','U','MARIO','2010-12-17 11:26:27','200000117'),
 (2757,'trelacion','U','MARIO','2010-12-17 11:42:36','100000001'),
 (2758,'trelacion','U','MARIO','2010-12-17 11:42:43','100000001'),
 (2759,'trelacion','U','MARIO','2010-12-17 11:42:43','200000001'),
 (2760,'trelacion','U','MARIO','2010-12-17 11:42:43','200000002'),
 (2761,'trelacion','U','MARIO','2010-12-17 11:42:43','200000003'),
 (2762,'trelacion','U','MARIO','2010-12-17 11:42:43','200000004'),
 (2763,'trelacion','U','MARIO','2010-12-17 11:42:43','200000005'),
 (2764,'trelacion','U','MARIO','2010-12-17 11:42:43','200000006'),
 (2765,'trelacion','U','MARIO','2010-12-17 11:42:43','200000007'),
 (2766,'trelacion','U','MARIO','2010-12-17 11:42:43','200000008'),
 (2767,'trelacion','U','MARIO','2010-12-17 11:42:43','200000009'),
 (2768,'trelacion','U','MARIO','2010-12-17 11:42:43','200000010'),
 (2769,'trelacion','U','MARIO','2010-12-17 11:42:43','200000011'),
 (2770,'trelacion','U','MARIO','2010-12-17 11:42:43','200000012'),
 (2771,'trelacion','U','MARIO','2010-12-17 11:42:43','200000013'),
 (2772,'trelacion','U','MARIO','2010-12-17 11:42:43','200000014'),
 (2773,'trelacion','U','MARIO','2010-12-17 11:42:43','200000015'),
 (2774,'trelacion','U','MARIO','2010-12-17 11:42:43','200000016'),
 (2775,'trelacion','U','MARIO','2010-12-17 11:42:43','200000017'),
 (2776,'trelacion','U','MARIO','2010-12-17 11:42:43','200000018'),
 (2777,'trelacion','U','MARIO','2010-12-17 11:42:43','200000019'),
 (2778,'trelacion','U','MARIO','2010-12-17 11:42:43','200000020'),
 (2779,'trelacion','U','MARIO','2010-12-17 11:42:43','200000021'),
 (2780,'trelacion','U','MARIO','2010-12-17 11:42:43','200000022'),
 (2781,'trelacion','U','MARIO','2010-12-17 11:42:43','200000023'),
 (2782,'trelacion','U','MARIO','2010-12-17 11:42:43','200000024'),
 (2783,'trelacion','U','MARIO','2010-12-17 11:42:43','200000025'),
 (2784,'trelacion','U','MARIO','2010-12-17 11:42:43','200000026'),
 (2785,'trelacion','U','MARIO','2010-12-17 11:42:43','200000027'),
 (2786,'trelacion','U','MARIO','2010-12-17 11:42:43','200000028'),
 (2787,'trelacion','U','MARIO','2010-12-17 11:42:43','200000029'),
 (2788,'trelacion','U','MARIO','2010-12-17 11:42:43','200000030'),
 (2789,'trelacion','U','MARIO','2010-12-17 11:42:43','200000031'),
 (2790,'trelacion','U','MARIO','2010-12-17 11:42:43','200000032'),
 (2791,'trelacion','U','MARIO','2010-12-17 11:42:43','200000033'),
 (2792,'trelacion','U','MARIO','2010-12-17 11:42:43','200000034'),
 (2793,'trelacion','U','MARIO','2010-12-17 11:42:43','200000035'),
 (2794,'trelacion','U','MARIO','2010-12-17 11:42:43','200000036'),
 (2795,'trelacion','U','MARIO','2010-12-17 11:42:43','200000037'),
 (2796,'trelacion','U','MARIO','2010-12-17 11:42:43','200000038'),
 (2797,'trelacion','U','MARIO','2010-12-17 11:42:43','200000039'),
 (2798,'trelacion','U','MARIO','2010-12-17 11:42:43','200000040'),
 (2799,'trelacion','U','MARIO','2010-12-17 11:42:43','200000041'),
 (2800,'trelacion','U','MARIO','2010-12-17 11:42:43','200000042'),
 (2801,'trelacion','U','MARIO','2010-12-17 11:42:43','200000043'),
 (2802,'trelacion','U','MARIO','2010-12-17 11:42:43','200000044'),
 (2803,'trelacion','U','MARIO','2010-12-17 11:42:43','200000045'),
 (2804,'trelacion','U','MARIO','2010-12-17 11:42:43','200000046'),
 (2805,'trelacion','U','MARIO','2010-12-17 11:42:43','200000047'),
 (2806,'trelacion','U','MARIO','2010-12-17 11:42:43','200000048'),
 (2807,'trelacion','U','MARIO','2010-12-17 11:42:43','200000049'),
 (2808,'trelacion','U','MARIO','2010-12-17 11:42:43','200000050'),
 (2809,'trelacion','U','MARIO','2010-12-17 11:42:43','200000051'),
 (2810,'trelacion','U','MARIO','2010-12-17 11:42:43','200000052'),
 (2811,'trelacion','U','MARIO','2010-12-17 11:42:43','200000053'),
 (2812,'trelacion','U','MARIO','2010-12-17 11:42:43','200000054'),
 (2813,'trelacion','U','MARIO','2010-12-17 11:42:43','200000055'),
 (2814,'trelacion','U','MARIO','2010-12-17 11:42:43','200000056'),
 (2815,'trelacion','U','MARIO','2010-12-17 11:42:43','200000057'),
 (2816,'trelacion','U','MARIO','2010-12-17 11:42:43','200000058'),
 (2817,'trelacion','U','MARIO','2010-12-17 11:42:43','200000059'),
 (2818,'trelacion','U','MARIO','2010-12-17 11:42:43','200000060'),
 (2819,'trelacion','U','MARIO','2010-12-17 11:42:43','200000061'),
 (2820,'trelacion','U','MARIO','2010-12-17 11:42:43','200000062'),
 (2821,'trelacion','U','MARIO','2010-12-17 11:42:43','200000063'),
 (2822,'trelacion','U','MARIO','2010-12-17 11:42:43','200000064'),
 (2823,'trelacion','U','MARIO','2010-12-17 11:42:43','200000065'),
 (2824,'trelacion','U','MARIO','2010-12-17 11:42:43','200000066'),
 (2825,'trelacion','U','MARIO','2010-12-17 11:42:43','200000067'),
 (2826,'trelacion','U','MARIO','2010-12-17 11:42:43','200000068'),
 (2827,'trelacion','U','MARIO','2010-12-17 11:42:43','200000069'),
 (2828,'trelacion','U','MARIO','2010-12-17 11:42:43','200000070'),
 (2829,'trelacion','U','MARIO','2010-12-17 11:42:43','200000071'),
 (2830,'trelacion','U','MARIO','2010-12-17 11:42:43','200000072'),
 (2831,'trelacion','U','MARIO','2010-12-17 11:42:43','200000073'),
 (2832,'trelacion','U','MARIO','2010-12-17 11:42:43','200000074'),
 (2833,'trelacion','U','MARIO','2010-12-17 11:42:43','200000075'),
 (2834,'trelacion','U','MARIO','2010-12-17 11:42:43','200000076'),
 (2835,'trelacion','U','MARIO','2010-12-17 11:42:43','200000077'),
 (2836,'trelacion','U','MARIO','2010-12-17 11:42:43','200000078'),
 (2837,'trelacion','U','MARIO','2010-12-17 11:42:43','200000079'),
 (2838,'trelacion','U','MARIO','2010-12-17 11:42:43','200000080'),
 (2839,'trelacion','U','MARIO','2010-12-17 11:42:43','200000081'),
 (2840,'trelacion','U','MARIO','2010-12-17 11:42:43','200000082'),
 (2841,'trelacion','U','MARIO','2010-12-17 11:42:43','200000083'),
 (2842,'trelacion','U','MARIO','2010-12-17 11:42:43','200000084'),
 (2843,'trelacion','U','MARIO','2010-12-17 11:42:43','200000085'),
 (2844,'trelacion','U','MARIO','2010-12-17 11:42:43','200000086'),
 (2845,'trelacion','U','MARIO','2010-12-17 11:42:43','200000087'),
 (2846,'trelacion','U','MARIO','2010-12-17 11:42:43','200000088'),
 (2847,'trelacion','U','MARIO','2010-12-17 11:42:43','200000089'),
 (2848,'trelacion','U','MARIO','2010-12-17 11:42:43','200000090'),
 (2849,'trelacion','U','MARIO','2010-12-17 11:42:43','200000091'),
 (2850,'trelacion','U','MARIO','2010-12-17 11:42:43','200000092'),
 (2851,'trelacion','U','MARIO','2010-12-17 11:42:43','200000093'),
 (2852,'trelacion','U','MARIO','2010-12-17 11:42:43','200000094'),
 (2853,'trelacion','U','MARIO','2010-12-17 11:42:43','200000095'),
 (2854,'trelacion','U','MARIO','2010-12-17 11:42:43','200000096'),
 (2855,'trelacion','U','MARIO','2010-12-17 11:42:43','200000097'),
 (2856,'trelacion','U','MARIO','2010-12-17 11:42:43','200000098'),
 (2857,'trelacion','U','MARIO','2010-12-17 11:42:43','200000100'),
 (2858,'trelacion','U','MARIO','2010-12-17 11:42:43','200000101'),
 (2859,'trelacion','U','MARIO','2010-12-17 11:42:43','200000102'),
 (2860,'trelacion','U','MARIO','2010-12-17 11:42:43','200000103'),
 (2861,'trelacion','U','MARIO','2010-12-17 11:42:43','200000104'),
 (2862,'trelacion','U','MARIO','2010-12-17 11:42:43','200000105'),
 (2863,'trelacion','U','MARIO','2010-12-17 11:42:43','200000106'),
 (2864,'trelacion','U','MARIO','2010-12-17 11:42:43','200000107'),
 (2865,'trelacion','U','MARIO','2010-12-17 11:42:43','200000108'),
 (2866,'trelacion','U','MARIO','2010-12-17 11:42:43','200000109'),
 (2867,'trelacion','U','MARIO','2010-12-17 11:42:43','200000110'),
 (2868,'trelacion','U','MARIO','2010-12-17 11:42:43','200000111'),
 (2869,'trelacion','U','MARIO','2010-12-17 11:42:43','200000112'),
 (2870,'trelacion','U','MARIO','2010-12-17 11:42:43','200000113'),
 (2871,'trelacion','U','MARIO','2010-12-17 11:42:43','200000114'),
 (2872,'trelacion','U','MARIO','2010-12-17 11:42:43','200000115'),
 (2873,'trelacion','U','MARIO','2010-12-17 11:42:43','200000116'),
 (2874,'trelacion','U','MARIO','2010-12-17 11:42:43','200000117'),
 (2875,'trelacion','U','MARIO','2010-12-17 11:47:24','100000001'),
 (2876,'trelacion','U','MARIO','2010-12-17 11:47:24','200000001'),
 (2877,'trelacion','U','MARIO','2010-12-17 11:47:24','200000002'),
 (2878,'trelacion','U','MARIO','2010-12-17 11:47:24','200000003'),
 (2879,'trelacion','U','MARIO','2010-12-17 11:47:24','200000004'),
 (2880,'trelacion','U','MARIO','2010-12-17 11:47:24','200000005'),
 (2881,'trelacion','U','MARIO','2010-12-17 11:47:24','200000006'),
 (2882,'trelacion','U','MARIO','2010-12-17 11:47:24','200000007'),
 (2883,'trelacion','U','MARIO','2010-12-17 11:47:24','200000008'),
 (2884,'trelacion','U','MARIO','2010-12-17 11:47:24','200000009'),
 (2885,'trelacion','U','MARIO','2010-12-17 11:47:24','200000010'),
 (2886,'trelacion','U','MARIO','2010-12-17 11:47:24','200000011'),
 (2887,'trelacion','U','MARIO','2010-12-17 11:47:24','200000012'),
 (2888,'trelacion','U','MARIO','2010-12-17 11:47:24','200000013'),
 (2889,'trelacion','U','MARIO','2010-12-17 11:47:24','200000014'),
 (2890,'trelacion','U','MARIO','2010-12-17 11:47:24','200000015'),
 (2891,'trelacion','U','MARIO','2010-12-17 11:47:24','200000016'),
 (2892,'trelacion','U','MARIO','2010-12-17 11:47:24','200000017'),
 (2893,'trelacion','U','MARIO','2010-12-17 11:47:24','200000018'),
 (2894,'trelacion','U','MARIO','2010-12-17 11:47:24','200000019'),
 (2895,'trelacion','U','MARIO','2010-12-17 11:47:24','200000020'),
 (2896,'trelacion','U','MARIO','2010-12-17 11:47:24','200000021'),
 (2897,'trelacion','U','MARIO','2010-12-17 11:47:24','200000022'),
 (2898,'trelacion','U','MARIO','2010-12-17 11:47:24','200000023'),
 (2899,'trelacion','U','MARIO','2010-12-17 11:47:24','200000024'),
 (2900,'trelacion','U','MARIO','2010-12-17 11:47:24','200000025'),
 (2901,'trelacion','U','MARIO','2010-12-17 11:47:24','200000026'),
 (2902,'trelacion','U','MARIO','2010-12-17 11:47:24','200000027'),
 (2903,'trelacion','U','MARIO','2010-12-17 11:47:24','200000028'),
 (2904,'trelacion','U','MARIO','2010-12-17 11:47:24','200000029'),
 (2905,'trelacion','U','MARIO','2010-12-17 11:47:24','200000030'),
 (2906,'trelacion','U','MARIO','2010-12-17 11:47:24','200000031'),
 (2907,'trelacion','U','MARIO','2010-12-17 11:47:24','200000032'),
 (2908,'trelacion','U','MARIO','2010-12-17 11:47:24','200000033'),
 (2909,'trelacion','U','MARIO','2010-12-17 11:47:24','200000034'),
 (2910,'trelacion','U','MARIO','2010-12-17 11:47:24','200000035'),
 (2911,'trelacion','U','MARIO','2010-12-17 11:47:24','200000036'),
 (2912,'trelacion','U','MARIO','2010-12-17 11:47:24','200000037'),
 (2913,'trelacion','U','MARIO','2010-12-17 11:47:24','200000038'),
 (2914,'trelacion','U','MARIO','2010-12-17 11:47:24','200000039'),
 (2915,'trelacion','U','MARIO','2010-12-17 11:47:24','200000040'),
 (2916,'trelacion','U','MARIO','2010-12-17 11:47:24','200000041'),
 (2917,'trelacion','U','MARIO','2010-12-17 11:47:24','200000042'),
 (2918,'trelacion','U','MARIO','2010-12-17 11:47:24','200000043'),
 (2919,'trelacion','U','MARIO','2010-12-17 11:47:24','200000044'),
 (2920,'trelacion','U','MARIO','2010-12-17 11:47:24','200000045'),
 (2921,'trelacion','U','MARIO','2010-12-17 11:47:24','200000046'),
 (2922,'trelacion','U','MARIO','2010-12-17 11:47:24','200000047'),
 (2923,'trelacion','U','MARIO','2010-12-17 11:47:24','200000048'),
 (2924,'trelacion','U','MARIO','2010-12-17 11:47:24','200000049'),
 (2925,'trelacion','U','MARIO','2010-12-17 11:47:24','200000050'),
 (2926,'trelacion','U','MARIO','2010-12-17 11:47:24','200000051'),
 (2927,'trelacion','U','MARIO','2010-12-17 11:47:24','200000052'),
 (2928,'trelacion','U','MARIO','2010-12-17 11:47:24','200000053'),
 (2929,'trelacion','U','MARIO','2010-12-17 11:47:24','200000054'),
 (2930,'trelacion','U','MARIO','2010-12-17 11:47:24','200000055'),
 (2931,'trelacion','U','MARIO','2010-12-17 11:47:24','200000056'),
 (2932,'trelacion','U','MARIO','2010-12-17 11:47:24','200000057'),
 (2933,'trelacion','U','MARIO','2010-12-17 11:47:24','200000058'),
 (2934,'trelacion','U','MARIO','2010-12-17 11:47:24','200000059'),
 (2935,'trelacion','U','MARIO','2010-12-17 11:47:24','200000060'),
 (2936,'trelacion','U','MARIO','2010-12-17 11:47:24','200000061'),
 (2937,'trelacion','U','MARIO','2010-12-17 11:47:24','200000062'),
 (2938,'trelacion','U','MARIO','2010-12-17 11:47:24','200000063'),
 (2939,'trelacion','U','MARIO','2010-12-17 11:47:24','200000064'),
 (2940,'trelacion','U','MARIO','2010-12-17 11:47:24','200000065'),
 (2941,'trelacion','U','MARIO','2010-12-17 11:47:24','200000066'),
 (2942,'trelacion','U','MARIO','2010-12-17 11:47:24','200000067'),
 (2943,'trelacion','U','MARIO','2010-12-17 11:47:24','200000068'),
 (2944,'trelacion','U','MARIO','2010-12-17 11:47:24','200000069'),
 (2945,'trelacion','U','MARIO','2010-12-17 11:47:24','200000070'),
 (2946,'trelacion','U','MARIO','2010-12-17 11:47:24','200000071'),
 (2947,'trelacion','U','MARIO','2010-12-17 11:47:24','200000072'),
 (2948,'trelacion','U','MARIO','2010-12-17 11:47:24','200000073'),
 (2949,'trelacion','U','MARIO','2010-12-17 11:47:24','200000074'),
 (2950,'trelacion','U','MARIO','2010-12-17 11:47:24','200000075'),
 (2951,'trelacion','U','MARIO','2010-12-17 11:47:24','200000076'),
 (2952,'trelacion','U','MARIO','2010-12-17 11:47:24','200000077'),
 (2953,'trelacion','U','MARIO','2010-12-17 11:47:24','200000078'),
 (2954,'trelacion','U','MARIO','2010-12-17 11:47:24','200000079'),
 (2955,'trelacion','U','MARIO','2010-12-17 11:47:24','200000080'),
 (2956,'trelacion','U','MARIO','2010-12-17 11:47:24','200000081'),
 (2957,'trelacion','U','MARIO','2010-12-17 11:47:24','200000082'),
 (2958,'trelacion','U','MARIO','2010-12-17 11:47:24','200000083'),
 (2959,'trelacion','U','MARIO','2010-12-17 11:47:24','200000084'),
 (2960,'trelacion','U','MARIO','2010-12-17 11:47:24','200000085'),
 (2961,'trelacion','U','MARIO','2010-12-17 11:47:24','200000086'),
 (2962,'trelacion','U','MARIO','2010-12-17 11:47:24','200000087'),
 (2963,'trelacion','U','MARIO','2010-12-17 11:47:24','200000088'),
 (2964,'trelacion','U','MARIO','2010-12-17 11:47:24','200000089'),
 (2965,'trelacion','U','MARIO','2010-12-17 11:47:24','200000090'),
 (2966,'trelacion','U','MARIO','2010-12-17 11:47:24','200000091'),
 (2967,'trelacion','U','MARIO','2010-12-17 11:47:24','200000092'),
 (2968,'trelacion','U','MARIO','2010-12-17 11:47:24','200000093'),
 (2969,'trelacion','U','MARIO','2010-12-17 11:47:24','200000094'),
 (2970,'trelacion','U','MARIO','2010-12-17 11:47:24','200000095'),
 (2971,'trelacion','U','MARIO','2010-12-17 11:47:24','200000096'),
 (2972,'trelacion','U','MARIO','2010-12-17 11:47:24','200000097'),
 (2973,'trelacion','U','MARIO','2010-12-17 11:47:24','200000098'),
 (2974,'trelacion','U','MARIO','2010-12-17 11:47:24','200000100'),
 (2975,'trelacion','U','MARIO','2010-12-17 11:47:24','200000101'),
 (2976,'trelacion','U','MARIO','2010-12-17 11:47:24','200000102'),
 (2977,'trelacion','U','MARIO','2010-12-17 11:47:24','200000103'),
 (2978,'trelacion','U','MARIO','2010-12-17 11:47:24','200000104'),
 (2979,'trelacion','U','MARIO','2010-12-17 11:47:24','200000105'),
 (2980,'trelacion','U','MARIO','2010-12-17 11:47:24','200000106'),
 (2981,'trelacion','U','MARIO','2010-12-17 11:47:24','200000107'),
 (2982,'trelacion','U','MARIO','2010-12-17 11:47:24','200000108'),
 (2983,'trelacion','U','MARIO','2010-12-17 11:47:24','200000109'),
 (2984,'trelacion','U','MARIO','2010-12-17 11:47:24','200000110'),
 (2985,'trelacion','U','MARIO','2010-12-17 11:47:24','200000111'),
 (2986,'trelacion','U','MARIO','2010-12-17 11:47:24','200000112'),
 (2987,'trelacion','U','MARIO','2010-12-17 11:47:24','200000113'),
 (2988,'trelacion','U','MARIO','2010-12-17 11:47:24','200000114'),
 (2989,'trelacion','U','MARIO','2010-12-17 11:47:24','200000115'),
 (2990,'trelacion','U','MARIO','2010-12-17 11:47:24','200000116'),
 (2991,'trelacion','U','MARIO','2010-12-17 11:47:24','200000117'),
 (2992,'tAnticipo','I','JLOZADA','2010-12-17 12:00:30','200000162'),
 (2993,'tviaje','I','JLOZADA','2010-12-17 12:00:30','200000156'),
 (2994,'tAnticipo','I','JLOZADA','2010-12-17 13:55:35','200000163'),
 (2995,'tviaje','I','JLOZADA','2010-12-17 13:55:35','200000157'),
 (2996,'tAnticipo','I','JLOZADA','2010-12-17 13:56:53','200000164'),
 (2997,'tviaje','I','JLOZADA','2010-12-17 13:56:53','200000158'),
 (2998,'tAnticipo','I','JLOZADA','2010-12-17 13:58:16','200000165'),
 (2999,'tviaje','I','JLOZADA','2010-12-17 13:58:16','200000159'),
 (3000,'tAnticipo','I','JLOZADA','2010-12-17 14:02:52','200000166'),
 (3001,'tviaje','I','JLOZADA','2010-12-17 14:02:52','200000160'),
 (3002,'tAnticipo','I','JLOZADA','2010-12-17 14:04:13','200000167'),
 (3003,'tviaje','I','JLOZADA','2010-12-17 14:04:13','200000161'),
 (3004,'tAnticipo','I','JLOZADA','2010-12-17 14:05:35','200000168'),
 (3005,'tviaje','I','JLOZADA','2010-12-17 14:05:35','200000162'),
 (3006,'tAnticipo','I','JLOZADA','2010-12-17 14:07:31','200000169'),
 (3007,'tviaje','I','JLOZADA','2010-12-17 14:07:31','200000163'),
 (3008,'truta','U','ADMIN','2010-12-17 14:50:42','13'),
 (3009,'truta','U','ADMIN','2010-12-17 14:51:20','13'),
 (3010,'tviaje','U','MARIO','2010-12-17 18:00:07','100000001'),
 (3011,'trelacion','U','MARIO','2010-12-17 18:00:55','100000001'),
 (3012,'trelacion','U','MARIO','2010-12-17 18:00:55','200000001'),
 (3013,'trelacion','U','MARIO','2010-12-17 18:00:55','200000002'),
 (3014,'trelacion','U','MARIO','2010-12-17 18:00:55','200000003'),
 (3015,'trelacion','U','MARIO','2010-12-17 18:00:55','200000004'),
 (3016,'trelacion','U','MARIO','2010-12-17 18:00:55','200000005'),
 (3017,'trelacion','U','MARIO','2010-12-17 18:00:55','200000006'),
 (3018,'trelacion','U','MARIO','2010-12-17 18:00:55','200000007'),
 (3019,'trelacion','U','MARIO','2010-12-17 18:00:55','200000008'),
 (3020,'trelacion','U','MARIO','2010-12-17 18:00:55','200000009'),
 (3021,'trelacion','U','MARIO','2010-12-17 18:00:55','200000010'),
 (3022,'trelacion','U','MARIO','2010-12-17 18:00:55','200000011'),
 (3023,'trelacion','U','MARIO','2010-12-17 18:00:55','200000012'),
 (3024,'trelacion','U','MARIO','2010-12-17 18:00:55','200000013'),
 (3025,'trelacion','U','MARIO','2010-12-17 18:00:55','200000014'),
 (3026,'trelacion','U','MARIO','2010-12-17 18:00:55','200000015'),
 (3027,'trelacion','U','MARIO','2010-12-17 18:00:55','200000016'),
 (3028,'trelacion','U','MARIO','2010-12-17 18:00:55','200000017'),
 (3029,'trelacion','U','MARIO','2010-12-17 18:00:55','200000018'),
 (3030,'trelacion','U','MARIO','2010-12-17 18:00:55','200000019'),
 (3031,'trelacion','U','MARIO','2010-12-17 18:00:55','200000020'),
 (3032,'trelacion','U','MARIO','2010-12-17 18:00:55','200000021'),
 (3033,'trelacion','U','MARIO','2010-12-17 18:00:55','200000022'),
 (3034,'trelacion','U','MARIO','2010-12-17 18:00:55','200000023'),
 (3035,'trelacion','U','MARIO','2010-12-17 18:00:55','200000024'),
 (3036,'trelacion','U','MARIO','2010-12-17 18:00:55','200000025'),
 (3037,'trelacion','U','MARIO','2010-12-17 18:00:55','200000026'),
 (3038,'trelacion','U','MARIO','2010-12-17 18:00:55','200000027'),
 (3039,'trelacion','U','MARIO','2010-12-17 18:00:55','200000028'),
 (3040,'trelacion','U','MARIO','2010-12-17 18:00:55','200000029'),
 (3041,'trelacion','U','MARIO','2010-12-17 18:00:55','200000030'),
 (3042,'trelacion','U','MARIO','2010-12-17 18:00:55','200000031'),
 (3043,'trelacion','U','MARIO','2010-12-17 18:00:55','200000032'),
 (3044,'trelacion','U','MARIO','2010-12-17 18:00:55','200000033'),
 (3045,'trelacion','U','MARIO','2010-12-17 18:00:55','200000034'),
 (3046,'trelacion','U','MARIO','2010-12-17 18:00:55','200000035'),
 (3047,'trelacion','U','MARIO','2010-12-17 18:00:55','200000036'),
 (3048,'trelacion','U','MARIO','2010-12-17 18:00:55','200000037'),
 (3049,'trelacion','U','MARIO','2010-12-17 18:00:55','200000038'),
 (3050,'trelacion','U','MARIO','2010-12-17 18:00:55','200000039'),
 (3051,'trelacion','U','MARIO','2010-12-17 18:00:55','200000040'),
 (3052,'trelacion','U','MARIO','2010-12-17 18:00:55','200000041'),
 (3053,'trelacion','U','MARIO','2010-12-17 18:00:55','200000042'),
 (3054,'trelacion','U','MARIO','2010-12-17 18:00:55','200000043'),
 (3055,'trelacion','U','MARIO','2010-12-17 18:00:55','200000044'),
 (3056,'trelacion','U','MARIO','2010-12-17 18:00:55','200000045'),
 (3057,'trelacion','U','MARIO','2010-12-17 18:00:55','200000046'),
 (3058,'trelacion','U','MARIO','2010-12-17 18:00:55','200000047'),
 (3059,'trelacion','U','MARIO','2010-12-17 18:00:55','200000048'),
 (3060,'trelacion','U','MARIO','2010-12-17 18:00:55','200000049'),
 (3061,'trelacion','U','MARIO','2010-12-17 18:00:55','200000050'),
 (3062,'trelacion','U','MARIO','2010-12-17 18:00:55','200000051'),
 (3063,'trelacion','U','MARIO','2010-12-17 18:00:55','200000052'),
 (3064,'trelacion','U','MARIO','2010-12-17 18:00:55','200000053'),
 (3065,'trelacion','U','MARIO','2010-12-17 18:00:55','200000054'),
 (3066,'trelacion','U','MARIO','2010-12-17 18:00:55','200000055'),
 (3067,'trelacion','U','MARIO','2010-12-17 18:00:55','200000056'),
 (3068,'trelacion','U','MARIO','2010-12-17 18:00:55','200000057'),
 (3069,'trelacion','U','MARIO','2010-12-17 18:00:55','200000058'),
 (3070,'trelacion','U','MARIO','2010-12-17 18:00:55','200000059'),
 (3071,'trelacion','U','MARIO','2010-12-17 18:00:55','200000060'),
 (3072,'trelacion','U','MARIO','2010-12-17 18:00:55','200000061'),
 (3073,'trelacion','U','MARIO','2010-12-17 18:00:55','200000062'),
 (3074,'trelacion','U','MARIO','2010-12-17 18:00:55','200000063'),
 (3075,'trelacion','U','MARIO','2010-12-17 18:00:55','200000064'),
 (3076,'trelacion','U','MARIO','2010-12-17 18:00:55','200000065'),
 (3077,'trelacion','U','MARIO','2010-12-17 18:00:55','200000066'),
 (3078,'trelacion','U','MARIO','2010-12-17 18:00:55','200000067'),
 (3079,'trelacion','U','MARIO','2010-12-17 18:00:55','200000068'),
 (3080,'trelacion','U','MARIO','2010-12-17 18:00:55','200000069'),
 (3081,'trelacion','U','MARIO','2010-12-17 18:00:55','200000070'),
 (3082,'trelacion','U','MARIO','2010-12-17 18:00:55','200000071'),
 (3083,'trelacion','U','MARIO','2010-12-17 18:00:55','200000072'),
 (3084,'trelacion','U','MARIO','2010-12-17 18:00:55','200000073'),
 (3085,'trelacion','U','MARIO','2010-12-17 18:00:55','200000074'),
 (3086,'trelacion','U','MARIO','2010-12-17 18:00:55','200000075'),
 (3087,'trelacion','U','MARIO','2010-12-17 18:00:55','200000076'),
 (3088,'trelacion','U','MARIO','2010-12-17 18:00:55','200000077'),
 (3089,'trelacion','U','MARIO','2010-12-17 18:00:55','200000078'),
 (3090,'trelacion','U','MARIO','2010-12-17 18:00:55','200000079');
INSERT INTO `tbitacora` (`nid_bitacora`,`ctabla`,`coperacion`,`cid_usuario`,`dfecha`,`cregistro`) VALUES 
 (3091,'trelacion','U','MARIO','2010-12-17 18:00:55','200000080'),
 (3092,'trelacion','U','MARIO','2010-12-17 18:00:55','200000081'),
 (3093,'trelacion','U','MARIO','2010-12-17 18:00:55','200000082'),
 (3094,'trelacion','U','MARIO','2010-12-17 18:00:55','200000083'),
 (3095,'trelacion','U','MARIO','2010-12-17 18:00:55','200000084'),
 (3096,'trelacion','U','MARIO','2010-12-17 18:00:55','200000085'),
 (3097,'trelacion','U','MARIO','2010-12-17 18:00:55','200000086'),
 (3098,'trelacion','U','MARIO','2010-12-17 18:00:55','200000087'),
 (3099,'trelacion','U','MARIO','2010-12-17 18:00:55','200000088'),
 (3100,'trelacion','U','MARIO','2010-12-17 18:00:55','200000089'),
 (3101,'trelacion','U','MARIO','2010-12-17 18:00:55','200000090'),
 (3102,'trelacion','U','MARIO','2010-12-17 18:00:55','200000091'),
 (3103,'trelacion','U','MARIO','2010-12-17 18:00:55','200000092'),
 (3104,'trelacion','U','MARIO','2010-12-17 18:00:55','200000093'),
 (3105,'trelacion','U','MARIO','2010-12-17 18:00:55','200000094'),
 (3106,'trelacion','U','MARIO','2010-12-17 18:00:55','200000095'),
 (3107,'trelacion','U','MARIO','2010-12-17 18:00:55','200000096'),
 (3108,'trelacion','U','MARIO','2010-12-17 18:00:55','200000097'),
 (3109,'trelacion','U','MARIO','2010-12-17 18:00:55','200000098'),
 (3110,'trelacion','U','MARIO','2010-12-17 18:00:55','200000100'),
 (3111,'trelacion','U','MARIO','2010-12-17 18:00:55','200000101'),
 (3112,'trelacion','U','MARIO','2010-12-17 18:00:55','200000102'),
 (3113,'trelacion','U','MARIO','2010-12-17 18:00:55','200000103'),
 (3114,'trelacion','U','MARIO','2010-12-17 18:00:55','200000104'),
 (3115,'trelacion','U','MARIO','2010-12-17 18:00:55','200000105'),
 (3116,'trelacion','U','MARIO','2010-12-17 18:00:55','200000106'),
 (3117,'trelacion','U','MARIO','2010-12-17 18:00:55','200000107'),
 (3118,'trelacion','U','MARIO','2010-12-17 18:00:55','200000108'),
 (3119,'trelacion','U','MARIO','2010-12-17 18:00:55','200000109'),
 (3120,'trelacion','U','MARIO','2010-12-17 18:00:55','200000110'),
 (3121,'trelacion','U','MARIO','2010-12-17 18:00:55','200000111'),
 (3122,'trelacion','U','MARIO','2010-12-17 18:00:55','200000112'),
 (3123,'trelacion','U','MARIO','2010-12-17 18:00:55','200000113'),
 (3124,'trelacion','U','MARIO','2010-12-17 18:00:55','200000114'),
 (3125,'trelacion','U','MARIO','2010-12-17 18:00:55','200000115'),
 (3126,'trelacion','U','MARIO','2010-12-17 18:00:55','200000116'),
 (3127,'trelacion','U','MARIO','2010-12-17 18:00:55','200000117'),
 (3128,'trelacion','U','MARIO','2010-12-17 18:02:45','100000001'),
 (3129,'trelacion','U','MARIO','2010-12-17 18:02:45','200000001'),
 (3130,'trelacion','U','MARIO','2010-12-17 18:02:45','200000002'),
 (3131,'trelacion','U','MARIO','2010-12-17 18:02:45','200000003'),
 (3132,'trelacion','U','MARIO','2010-12-17 18:02:45','200000004'),
 (3133,'trelacion','U','MARIO','2010-12-17 18:02:45','200000005'),
 (3134,'trelacion','U','MARIO','2010-12-17 18:02:45','200000006'),
 (3135,'trelacion','U','MARIO','2010-12-17 18:02:45','200000007'),
 (3136,'trelacion','U','MARIO','2010-12-17 18:02:45','200000008'),
 (3137,'trelacion','U','MARIO','2010-12-17 18:02:45','200000009'),
 (3138,'trelacion','U','MARIO','2010-12-17 18:02:45','200000010'),
 (3139,'trelacion','U','MARIO','2010-12-17 18:02:45','200000011'),
 (3140,'trelacion','U','MARIO','2010-12-17 18:02:45','200000012'),
 (3141,'trelacion','U','MARIO','2010-12-17 18:02:45','200000013'),
 (3142,'trelacion','U','MARIO','2010-12-17 18:02:45','200000014'),
 (3143,'trelacion','U','MARIO','2010-12-17 18:02:45','200000015'),
 (3144,'trelacion','U','MARIO','2010-12-17 18:02:45','200000016'),
 (3145,'trelacion','U','MARIO','2010-12-17 18:02:45','200000017'),
 (3146,'trelacion','U','MARIO','2010-12-17 18:02:45','200000018'),
 (3147,'trelacion','U','MARIO','2010-12-17 18:02:45','200000019'),
 (3148,'trelacion','U','MARIO','2010-12-17 18:02:45','200000020'),
 (3149,'trelacion','U','MARIO','2010-12-17 18:02:45','200000021'),
 (3150,'trelacion','U','MARIO','2010-12-17 18:02:45','200000022'),
 (3151,'trelacion','U','MARIO','2010-12-17 18:02:45','200000023'),
 (3152,'trelacion','U','MARIO','2010-12-17 18:02:45','200000024'),
 (3153,'trelacion','U','MARIO','2010-12-17 18:02:45','200000025'),
 (3154,'trelacion','U','MARIO','2010-12-17 18:02:45','200000026'),
 (3155,'trelacion','U','MARIO','2010-12-17 18:02:45','200000027'),
 (3156,'trelacion','U','MARIO','2010-12-17 18:02:45','200000028'),
 (3157,'trelacion','U','MARIO','2010-12-17 18:02:45','200000029'),
 (3158,'trelacion','U','MARIO','2010-12-17 18:02:45','200000030'),
 (3159,'trelacion','U','MARIO','2010-12-17 18:02:45','200000031'),
 (3160,'trelacion','U','MARIO','2010-12-17 18:02:45','200000032'),
 (3161,'trelacion','U','MARIO','2010-12-17 18:02:45','200000033'),
 (3162,'trelacion','U','MARIO','2010-12-17 18:02:45','200000034'),
 (3163,'trelacion','U','MARIO','2010-12-17 18:02:45','200000035'),
 (3164,'trelacion','U','MARIO','2010-12-17 18:02:45','200000036'),
 (3165,'trelacion','U','MARIO','2010-12-17 18:02:45','200000037'),
 (3166,'trelacion','U','MARIO','2010-12-17 18:02:45','200000038'),
 (3167,'trelacion','U','MARIO','2010-12-17 18:02:45','200000039'),
 (3168,'trelacion','U','MARIO','2010-12-17 18:02:45','200000040'),
 (3169,'trelacion','U','MARIO','2010-12-17 18:02:45','200000041'),
 (3170,'trelacion','U','MARIO','2010-12-17 18:02:45','200000042'),
 (3171,'trelacion','U','MARIO','2010-12-17 18:02:45','200000043'),
 (3172,'trelacion','U','MARIO','2010-12-17 18:02:45','200000044'),
 (3173,'trelacion','U','MARIO','2010-12-17 18:02:45','200000045'),
 (3174,'trelacion','U','MARIO','2010-12-17 18:02:45','200000046'),
 (3175,'trelacion','U','MARIO','2010-12-17 18:02:45','200000047'),
 (3176,'trelacion','U','MARIO','2010-12-17 18:02:45','200000048'),
 (3177,'trelacion','U','MARIO','2010-12-17 18:02:45','200000049'),
 (3178,'trelacion','U','MARIO','2010-12-17 18:02:45','200000050'),
 (3179,'trelacion','U','MARIO','2010-12-17 18:02:45','200000051'),
 (3180,'trelacion','U','MARIO','2010-12-17 18:02:45','200000052'),
 (3181,'trelacion','U','MARIO','2010-12-17 18:02:45','200000053'),
 (3182,'trelacion','U','MARIO','2010-12-17 18:02:45','200000054'),
 (3183,'trelacion','U','MARIO','2010-12-17 18:02:45','200000055'),
 (3184,'trelacion','U','MARIO','2010-12-17 18:02:45','200000056'),
 (3185,'trelacion','U','MARIO','2010-12-17 18:02:45','200000057'),
 (3186,'trelacion','U','MARIO','2010-12-17 18:02:45','200000058'),
 (3187,'trelacion','U','MARIO','2010-12-17 18:02:45','200000059'),
 (3188,'trelacion','U','MARIO','2010-12-17 18:02:45','200000060'),
 (3189,'trelacion','U','MARIO','2010-12-17 18:02:45','200000061'),
 (3190,'trelacion','U','MARIO','2010-12-17 18:02:45','200000062'),
 (3191,'trelacion','U','MARIO','2010-12-17 18:02:45','200000063'),
 (3192,'trelacion','U','MARIO','2010-12-17 18:02:45','200000064'),
 (3193,'trelacion','U','MARIO','2010-12-17 18:02:45','200000065'),
 (3194,'trelacion','U','MARIO','2010-12-17 18:02:45','200000066'),
 (3195,'trelacion','U','MARIO','2010-12-17 18:02:45','200000067'),
 (3196,'trelacion','U','MARIO','2010-12-17 18:02:45','200000068'),
 (3197,'trelacion','U','MARIO','2010-12-17 18:02:45','200000069'),
 (3198,'trelacion','U','MARIO','2010-12-17 18:02:45','200000070'),
 (3199,'trelacion','U','MARIO','2010-12-17 18:02:45','200000071'),
 (3200,'trelacion','U','MARIO','2010-12-17 18:02:45','200000072'),
 (3201,'trelacion','U','MARIO','2010-12-17 18:02:45','200000073'),
 (3202,'trelacion','U','MARIO','2010-12-17 18:02:45','200000074'),
 (3203,'trelacion','U','MARIO','2010-12-17 18:02:45','200000075'),
 (3204,'trelacion','U','MARIO','2010-12-17 18:02:45','200000076'),
 (3205,'trelacion','U','MARIO','2010-12-17 18:02:45','200000077'),
 (3206,'trelacion','U','MARIO','2010-12-17 18:02:45','200000078'),
 (3207,'trelacion','U','MARIO','2010-12-17 18:02:45','200000079'),
 (3208,'trelacion','U','MARIO','2010-12-17 18:02:45','200000080'),
 (3209,'trelacion','U','MARIO','2010-12-17 18:02:45','200000081'),
 (3210,'trelacion','U','MARIO','2010-12-17 18:02:45','200000082'),
 (3211,'trelacion','U','MARIO','2010-12-17 18:02:45','200000083'),
 (3212,'trelacion','U','MARIO','2010-12-17 18:02:45','200000084'),
 (3213,'trelacion','U','MARIO','2010-12-17 18:02:45','200000085'),
 (3214,'trelacion','U','MARIO','2010-12-17 18:02:45','200000086'),
 (3215,'trelacion','U','MARIO','2010-12-17 18:02:45','200000087'),
 (3216,'trelacion','U','MARIO','2010-12-17 18:02:45','200000088'),
 (3217,'trelacion','U','MARIO','2010-12-17 18:02:45','200000089'),
 (3218,'trelacion','U','MARIO','2010-12-17 18:02:45','200000090'),
 (3219,'trelacion','U','MARIO','2010-12-17 18:02:45','200000091'),
 (3220,'trelacion','U','MARIO','2010-12-17 18:02:45','200000092'),
 (3221,'trelacion','U','MARIO','2010-12-17 18:02:45','200000093'),
 (3222,'trelacion','U','MARIO','2010-12-17 18:02:45','200000094'),
 (3223,'trelacion','U','MARIO','2010-12-17 18:02:45','200000095'),
 (3224,'trelacion','U','MARIO','2010-12-17 18:02:45','200000096'),
 (3225,'trelacion','U','MARIO','2010-12-17 18:02:45','200000097'),
 (3226,'trelacion','U','MARIO','2010-12-17 18:02:45','200000098'),
 (3227,'trelacion','U','MARIO','2010-12-17 18:02:45','200000100'),
 (3228,'trelacion','U','MARIO','2010-12-17 18:02:45','200000101'),
 (3229,'trelacion','U','MARIO','2010-12-17 18:02:45','200000102'),
 (3230,'trelacion','U','MARIO','2010-12-17 18:02:45','200000103'),
 (3231,'trelacion','U','MARIO','2010-12-17 18:02:45','200000104'),
 (3232,'trelacion','U','MARIO','2010-12-17 18:02:45','200000105'),
 (3233,'trelacion','U','MARIO','2010-12-17 18:02:45','200000106'),
 (3234,'trelacion','U','MARIO','2010-12-17 18:02:45','200000107'),
 (3235,'trelacion','U','MARIO','2010-12-17 18:02:45','200000108'),
 (3236,'trelacion','U','MARIO','2010-12-17 18:02:45','200000109'),
 (3237,'trelacion','U','MARIO','2010-12-17 18:02:45','200000110'),
 (3238,'trelacion','U','MARIO','2010-12-17 18:02:45','200000111'),
 (3239,'trelacion','U','MARIO','2010-12-17 18:02:45','200000112'),
 (3240,'trelacion','U','MARIO','2010-12-17 18:02:45','200000113'),
 (3241,'trelacion','U','MARIO','2010-12-17 18:02:45','200000114'),
 (3242,'trelacion','U','MARIO','2010-12-17 18:02:45','200000115'),
 (3243,'trelacion','U','MARIO','2010-12-17 18:02:45','200000116'),
 (3244,'trelacion','U','MARIO','2010-12-17 18:02:45','200000117'),
 (3245,'tCiudad','I','ADMIN','2010-12-20 09:25:12','2010'),
 (3246,'torigen_destino','I','ADMIN','2010-12-20 09:32:22','90'),
 (3247,'tviaje','U','JLOZADA','2010-12-20 09:40:06','200000157'),
 (3248,'tviaje','U','JLOZADA','2010-12-20 09:40:06','200000158'),
 (3249,'tviaje','U','JLOZADA','2010-12-20 09:40:06','200000159'),
 (3250,'tviaje','U','JLOZADA','2010-12-20 09:40:06','200000160'),
 (3251,'tviaje','U','JLOZADA','2010-12-20 09:40:06','200000161'),
 (3252,'tviaje','U','JLOZADA','2010-12-20 09:40:06','200000162'),
 (3253,'tviaje','U','JLOZADA','2010-12-20 09:40:06','200000163'),
 (3254,'tCiudad','I','ADMIN','2010-12-20 09:54:49','2011'),
 (3255,'tCiudad','I','ADMIN','2010-12-20 09:56:41','0513'),
 (3256,'tCiudad','I','ADMIN','2010-12-20 10:00:59','2208'),
 (3257,'tCiudad','I','ADMIN','2010-12-20 10:01:38','2209'),
 (3258,'tCiudad','I','ADMIN','2010-12-20 10:02:08','2210'),
 (3259,'tCiudad','I','ADMIN','2010-12-20 10:04:01','1208'),
 (3260,'tCiudad','I','ADMIN','2010-12-20 10:26:14','1715'),
 (3261,'torigen_destino','I','ADMIN','2010-12-20 10:29:29','91'),
 (3262,'torigen_destino','U','ADMIN','2010-12-20 10:29:36','91'),
 (3263,'torigen_destino','I','ADMIN','2010-12-20 10:30:08','92'),
 (3264,'torigen_destino','I','ADMIN','2010-12-20 10:30:41','93'),
 (3265,'torigen_destino','I','ADMIN','2010-12-20 10:31:04','94'),
 (3266,'torigen_destino','I','ADMIN','2010-12-20 10:31:43','95'),
 (3267,'torigen_destino','I','ADMIN','2010-12-20 10:32:04','96'),
 (3268,'torigen_destino','I','ADMIN','2010-12-20 10:32:41','97'),
 (3269,'truta','I','ADMIN','2010-12-20 10:34:25','190'),
 (3270,'truta','I','ADMIN','2010-12-20 10:36:34','191'),
 (3271,'truta','I','ADMIN','2010-12-20 10:38:20','192'),
 (3272,'truta','I','ADMIN','2010-12-20 10:40:58','193'),
 (3273,'truta','I','ADMIN','2010-12-20 10:42:09','194'),
 (3274,'truta','I','ADMIN','2010-12-20 10:43:17','195'),
 (3275,'truta','I','ADMIN','2010-12-20 10:46:17','196'),
 (3276,'truta','I','ADMIN','2010-12-20 10:47:57','197'),
 (3277,'tusuario','I','RRHH','2010-12-20 15:45:16','RRHH'),
 (3278,'tusuario','U','RRHH','2010-12-20 15:45:34','RRHH'),
 (3279,'tAnticipo','I','JLOZADA','2010-12-20 16:38:18','200000170'),
 (3280,'tviaje','I','JLOZADA','2010-12-20 16:38:19','200000164'),
 (3281,'tAnticipo','I','JLOZADA','2010-12-20 18:33:39','200000171'),
 (3282,'tviaje','I','JLOZADA','2010-12-20 18:33:39','200000165'),
 (3283,'tAnticipo','I','ADMCOC','2010-12-21 11:29:16','200000172'),
 (3284,'tviaje','I','ADMCOC','2010-12-21 11:29:16','200000166'),
 (3285,'tAnticipo','I','JLOZADA','2010-12-21 14:35:17','200000173'),
 (3286,'tviaje','I','JLOZADA','2010-12-21 14:35:17','200000167'),
 (3287,'tAnticipo','I','JLOZADA','2010-12-21 15:27:55','200000174'),
 (3288,'tviaje','I','JLOZADA','2010-12-21 15:27:55','200000168'),
 (3289,'tAnticipo','I','JLOZADA','2010-12-21 16:03:48','200000175'),
 (3290,'tviaje','I','JLOZADA','2010-12-21 16:03:48','200000169'),
 (3291,'tAnticipo','I','JLOZADA','2010-12-21 16:09:29','200000176'),
 (3292,'tviaje','I','JLOZADA','2010-12-21 16:09:29','200000170'),
 (3293,'tAnticipo','I','JLOZADA','2010-12-21 16:19:46','200000177'),
 (3294,'tviaje','I','JLOZADA','2010-12-21 16:19:46','200000171'),
 (3295,'tAnticipo','I','JLOZADA','2010-12-21 17:13:31','200000178'),
 (3296,'tviaje','I','JLOZADA','2010-12-21 17:13:31','200000172'),
 (3297,'tAnticipo','I','JLOZADA','2010-12-21 17:27:49','200000179'),
 (3298,'tviaje','I','JLOZADA','2010-12-21 17:27:49','200000173'),
 (3299,'tAnticipo','I','JLOZADA','2010-12-21 17:56:33','200000180'),
 (3300,'tviaje','I','JLOZADA','2010-12-21 17:56:33','200000174'),
 (3301,'tAnticipo','I','JLOZADA','2010-12-22 08:34:36','200000181'),
 (3302,'tviaje','I','JLOZADA','2010-12-22 08:34:36','200000175'),
 (3303,'tusuario','I','P','2010-12-22 11:46:53','P'),
 (3304,'tusuario','U','P','2010-12-22 11:48:15','P'),
 (3305,'tusuario','U','P','2010-12-22 11:48:20','P'),
 (3306,'tusuario','U','P','2010-12-22 11:48:25','P'),
 (3307,'tperiodo','U','ADMIN','2011-01-04 18:22:50','122010'),
 (3308,'tperiodo','U','ADMIN','2011-01-04 18:22:50','122010'),
 (3309,'tperiodo','U','NELIGER','2011-01-04 18:22:50','166'),
 (3310,'tusuario','U','P','2011-01-04 18:24:15','P'),
 (3311,'tviaje','U','MARIO','2011-01-04 18:26:22','100000001'),
 (3312,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000001'),
 (3313,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000002'),
 (3314,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000003'),
 (3315,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000004'),
 (3316,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000005'),
 (3317,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000006'),
 (3318,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000007'),
 (3319,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000008'),
 (3320,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000009'),
 (3321,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000010'),
 (3322,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000011'),
 (3323,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000012'),
 (3324,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000013'),
 (3325,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000014'),
 (3326,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000015'),
 (3327,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000016'),
 (3328,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000017'),
 (3329,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000018'),
 (3330,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000019'),
 (3331,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000020'),
 (3332,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000021'),
 (3333,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000022'),
 (3334,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000023'),
 (3335,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000024'),
 (3336,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000025'),
 (3337,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000026'),
 (3338,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000027'),
 (3339,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000028'),
 (3340,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000029'),
 (3341,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000030'),
 (3342,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000031'),
 (3343,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000032'),
 (3344,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000033'),
 (3345,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000034'),
 (3346,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000035'),
 (3347,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000036'),
 (3348,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000037'),
 (3349,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000038'),
 (3350,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000039'),
 (3351,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000040'),
 (3352,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000041'),
 (3353,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000042'),
 (3354,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000043'),
 (3355,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000044'),
 (3356,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000045'),
 (3357,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000046'),
 (3358,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000047'),
 (3359,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000048'),
 (3360,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000049'),
 (3361,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000050'),
 (3362,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000051'),
 (3363,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000052'),
 (3364,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000053'),
 (3365,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000054'),
 (3366,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000055'),
 (3367,'tviaje','U','MARIO','2011-01-04 18:26:22','200000056'),
 (3368,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000057'),
 (3369,'tviaje','U','MARIO','2011-01-04 18:26:22','200000058'),
 (3370,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000059'),
 (3371,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000060'),
 (3372,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000061'),
 (3373,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000062'),
 (3374,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000063'),
 (3375,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000064'),
 (3376,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000065'),
 (3377,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000066'),
 (3378,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000067'),
 (3379,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000068'),
 (3380,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000069'),
 (3381,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000070'),
 (3382,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000071'),
 (3383,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000072'),
 (3384,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000073'),
 (3385,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000074'),
 (3386,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000075'),
 (3387,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000076'),
 (3388,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000077'),
 (3389,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000078'),
 (3390,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000079'),
 (3391,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000080'),
 (3392,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000081'),
 (3393,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000082'),
 (3394,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000083'),
 (3395,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000084'),
 (3396,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000085'),
 (3397,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000086'),
 (3398,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000087'),
 (3399,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000088'),
 (3400,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000089'),
 (3401,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000090'),
 (3402,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000091'),
 (3403,'tviaje','U','MARIO','2011-01-04 18:26:22','200000092'),
 (3404,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000093'),
 (3405,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000094'),
 (3406,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000095'),
 (3407,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000096'),
 (3408,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000097'),
 (3409,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000098'),
 (3410,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000099'),
 (3411,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000100'),
 (3412,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000101'),
 (3413,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000102'),
 (3414,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000103'),
 (3415,'tviaje','U','MARIO','2011-01-04 18:26:22','200000104'),
 (3416,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000105'),
 (3417,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000106'),
 (3418,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000107'),
 (3419,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000108'),
 (3420,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000109'),
 (3421,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000110'),
 (3422,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000111'),
 (3423,'tviaje','U','MARIO','2011-01-04 18:26:22','200000112'),
 (3424,'tviaje','U','MARIO','2011-01-04 18:26:22','200000113'),
 (3425,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000114'),
 (3426,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000115'),
 (3427,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000116'),
 (3428,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000117'),
 (3429,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000118'),
 (3430,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000119'),
 (3431,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000120'),
 (3432,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000121'),
 (3433,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000122'),
 (3434,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000123'),
 (3435,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000124'),
 (3436,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000125'),
 (3437,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000126'),
 (3438,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000127'),
 (3439,'tviaje','U','MARIO','2011-01-04 18:26:22','200000128'),
 (3440,'tviaje','U','MARIO','2011-01-04 18:26:22','200000129'),
 (3441,'tviaje','U','MARIO','2011-01-04 18:26:22','200000130'),
 (3442,'tviaje','U','MARIO','2011-01-04 18:26:22','200000131'),
 (3443,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000132'),
 (3444,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000133'),
 (3445,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000134'),
 (3446,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000135'),
 (3447,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000136'),
 (3448,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000137'),
 (3449,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000138'),
 (3450,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000139'),
 (3451,'tviaje','U','MARIO','2011-01-04 18:26:22','200000140'),
 (3452,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000141'),
 (3453,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000142'),
 (3454,'tviaje','U','MARIO','2011-01-04 18:26:22','200000143'),
 (3455,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000144'),
 (3456,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000145'),
 (3457,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000146'),
 (3458,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000147'),
 (3459,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000148'),
 (3460,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000149'),
 (3461,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000150'),
 (3462,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000151'),
 (3463,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000152'),
 (3464,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000153'),
 (3465,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000154'),
 (3466,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000155'),
 (3467,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000156'),
 (3468,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000157'),
 (3469,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000158'),
 (3470,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000159'),
 (3471,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000160'),
 (3472,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000161'),
 (3473,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000162'),
 (3474,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000163'),
 (3475,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000164'),
 (3476,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000165'),
 (3477,'tviaje','U','ADMCOC','2011-01-04 18:26:22','200000166'),
 (3478,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000167'),
 (3479,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000168'),
 (3480,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000169'),
 (3481,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000170'),
 (3482,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000171'),
 (3483,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000172'),
 (3484,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000173'),
 (3485,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000174'),
 (3486,'tviaje','U','JLOZADA','2011-01-04 18:26:22','200000175'),
 (3487,'tvehiculo','I','P','2011-01-06 11:28:34','15-11-10'),
 (3488,'tChofer','I','P','2011-01-06 11:28:36','19637267'),
 (3489,'tvehiculo','I','P','2011-01-06 11:29:45','26-11-20'),
 (3490,'tvehiculo','I','P','2011-01-06 11:29:53','2611-201'),
 (3491,'tChofer','I','P','2011-01-06 11:29:54','12076944'),
 (3492,'tAnticipo','I','P','2011-01-06 11:30:58','200000182'),
 (3493,'tviaje','I','P','2011-01-06 11:30:58','200000176'),
 (3494,'tAnticipo','I','P','2011-01-06 11:32:00','200000183'),
 (3495,'tviaje','I','P','2011-01-06 11:32:00','200000177'),
 (3496,'tAnticipo','U','P','2011-01-06 11:32:15','200000182'),
 (3497,'tAnticipo','I','P','2011-01-11 08:48:57','100000002'),
 (3498,'tviaje','I','P','2011-01-11 08:48:57','100000002'),
 (3499,'tAnticipo','I','P','2011-01-11 08:51:21','100000003'),
 (3500,'tviaje','I','P','2011-01-11 08:51:21','100000003'),
 (3501,'tviaje','I','P','2011-01-11 08:51:21','100000004'),
 (3502,'tAnticipo','U','P','2011-01-11 09:00:41','100000002'),
 (3503,'tAnticipo','U','P','2011-01-11 09:00:41','100000003'),
 (3504,'tviaje','U','P','2011-01-11 09:18:50','200000176'),
 (3505,'tviaje','U','P','2011-01-11 09:18:50','200000176'),
 (3506,'tviaje','U','P','2011-01-11 09:18:50','200000177'),
 (3507,'tviaje','U','P','2011-01-11 09:18:50','200000176'),
 (3508,'tviaje','U','P','2011-01-11 09:18:50','200000177'),
 (3509,'tAnticipo','I','P','2011-01-11 10:46:47','100000004'),
 (3510,'tviaje','I','P','2011-01-11 10:46:47','100000005'),
 (3511,'tRelacion','I','P','2011-01-11 10:48:54','100000002'),
 (3512,'tAnticipo','U','P','2011-01-11 10:48:54','100000004'),
 (3513,'tAnticipo','U','P','2011-01-11 10:54:08','100000004'),
 (3514,'trelacion','D','P','2011-01-11 10:54:08','100000002'),
 (3515,'tAnticipo','U','P','2011-01-11 10:54:21','100000004'),
 (3516,'tAnticipo','I','P','2011-01-11 11:06:00','100000005'),
 (3517,'tviaje','I','P','2011-01-11 11:06:00','100000006'),
 (3518,'tviaje','I','P','2011-01-11 11:06:00','100000007'),
 (3519,'tAnticipo','I','P','2011-01-11 11:06:58','100000006'),
 (3520,'tviaje','I','P','2011-01-11 11:06:58','100000008'),
 (3521,'tAnticipo','I','P','2011-01-11 11:09:04','100000007'),
 (3522,'tviaje','I','P','2011-01-11 11:09:04','100000009'),
 (3523,'tAnticipo','I','P','2011-01-11 11:11:03','100000008'),
 (3524,'tviaje','I','P','2011-01-11 11:11:03','100000010'),
 (3525,'tAnticipo','I','P','2011-01-11 11:13:46','100000009'),
 (3526,'tviaje','I','P','2011-01-11 11:13:46','100000011'),
 (3527,'tAnticipo','I','P','2011-01-11 11:14:34','100000010'),
 (3528,'tviaje','I','P','2011-01-11 11:14:34','100000012'),
 (3529,'tAnticipo','I','P','2011-01-11 11:15:23','100000011'),
 (3530,'tviaje','I','P','2011-01-11 11:15:23','100000013'),
 (3531,'tAnticipo','I','P','2011-01-11 11:16:00','100000012'),
 (3532,'tviaje','I','P','2011-01-11 11:16:00','100000014'),
 (3533,'tRelacion','I','P','2011-01-11 11:19:47','100000003'),
 (3534,'tAnticipo','U','P','2011-01-11 11:19:47','100000002'),
 (3535,'tRelacion','I','P','2011-01-11 11:21:22','100000004'),
 (3536,'tAnticipo','U','P','2011-01-11 11:21:22','100000003'),
 (3537,'tRelacion','I','P','2011-01-11 11:25:22','100000005'),
 (3538,'tAnticipo','U','P','2011-01-11 11:25:22','100000005'),
 (3539,'tRelacion','I','P','2011-01-11 11:30:32','100000006'),
 (3540,'tAnticipo','U','P','2011-01-11 11:30:32','100000006'),
 (3541,'tRelacion','I','P','2011-01-11 11:35:12','100000007'),
 (3542,'tAnticipo','U','P','2011-01-11 11:35:12','100000007'),
 (3543,'tRelacion','I','P','2011-01-11 11:41:46','100000008'),
 (3544,'tAnticipo','U','P','2011-01-11 11:41:46','100000008'),
 (3545,'tRelacion','I','P','2011-01-11 11:42:56','100000009'),
 (3546,'tAnticipo','U','P','2011-01-11 11:42:56','100000009'),
 (3547,'tRelacion','I','P','2011-01-11 11:44:03','100000010'),
 (3548,'tAnticipo','U','P','2011-01-11 11:44:03','100000010'),
 (3549,'tRelacion','I','P','2011-01-11 11:44:41','100000011'),
 (3550,'tAnticipo','U','P','2011-01-11 11:44:41','100000011'),
 (3551,'tRelacion','I','P','2011-01-11 11:45:22','100000012'),
 (3552,'tAnticipo','U','P','2011-01-11 11:45:22','100000012'),
 (3553,'tperiodo','U','ADMIN','2011-01-11 11:45:43','122010'),
 (3554,'trelacion','U','P','2011-01-11 11:45:55','100000003'),
 (3555,'trelacion','U','P','2011-01-11 11:45:55','100000004'),
 (3556,'trelacion','U','P','2011-01-11 11:45:55','100000005'),
 (3557,'trelacion','U','P','2011-01-11 11:45:55','100000006'),
 (3558,'trelacion','U','P','2011-01-11 11:45:55','100000007'),
 (3559,'trelacion','U','P','2011-01-11 11:45:55','100000008'),
 (3560,'trelacion','U','P','2011-01-11 11:45:55','100000009'),
 (3561,'trelacion','U','P','2011-01-11 11:45:55','100000010'),
 (3562,'trelacion','U','P','2011-01-11 11:45:55','100000011'),
 (3563,'trelacion','U','P','2011-01-11 11:45:55','100000012'),
 (3564,'tviaje','U','MARIO','2011-01-13 17:16:17','100000001'),
 (3565,'tviaje','U','P','2011-01-13 17:16:17','100000002'),
 (3566,'tviaje','U','P','2011-01-13 17:16:17','100000003'),
 (3567,'tviaje','U','P','2011-01-13 17:16:17','100000004'),
 (3568,'tviaje','U','P','2011-01-13 17:16:17','100000005'),
 (3569,'tviaje','U','P','2011-01-13 17:16:17','100000006'),
 (3570,'tviaje','U','P','2011-01-13 17:16:17','100000007'),
 (3571,'tviaje','U','P','2011-01-13 17:16:17','100000008'),
 (3572,'tviaje','U','P','2011-01-13 17:16:17','100000009'),
 (3573,'tviaje','U','P','2011-01-13 17:16:17','100000010'),
 (3574,'tviaje','U','P','2011-01-13 17:16:17','100000011'),
 (3575,'tviaje','U','P','2011-01-13 17:16:17','100000012'),
 (3576,'tviaje','U','P','2011-01-13 17:16:17','100000013'),
 (3577,'tviaje','U','P','2011-01-13 17:16:17','100000014'),
 (3578,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000001'),
 (3579,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000002'),
 (3580,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000003'),
 (3581,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000004'),
 (3582,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000005'),
 (3583,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000006'),
 (3584,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000007'),
 (3585,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000008'),
 (3586,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000009'),
 (3587,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000010'),
 (3588,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000011'),
 (3589,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000012'),
 (3590,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000013'),
 (3591,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000014'),
 (3592,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000015'),
 (3593,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000016'),
 (3594,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000017'),
 (3595,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000018'),
 (3596,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000019'),
 (3597,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000020'),
 (3598,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000021'),
 (3599,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000022'),
 (3600,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000023'),
 (3601,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000024'),
 (3602,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000025'),
 (3603,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000026'),
 (3604,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000027'),
 (3605,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000028'),
 (3606,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000029'),
 (3607,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000030'),
 (3608,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000031'),
 (3609,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000032'),
 (3610,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000033'),
 (3611,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000034'),
 (3612,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000035'),
 (3613,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000036'),
 (3614,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000037'),
 (3615,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000038'),
 (3616,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000039'),
 (3617,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000040'),
 (3618,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000041'),
 (3619,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000042'),
 (3620,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000043'),
 (3621,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000044'),
 (3622,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000045'),
 (3623,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000046'),
 (3624,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000047'),
 (3625,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000048'),
 (3626,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000049'),
 (3627,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000050'),
 (3628,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000051'),
 (3629,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000052'),
 (3630,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000053'),
 (3631,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000054'),
 (3632,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000055'),
 (3633,'tviaje','U','MARIO','2011-01-13 17:16:17','200000056'),
 (3634,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000057'),
 (3635,'tviaje','U','MARIO','2011-01-13 17:16:17','200000058'),
 (3636,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000059'),
 (3637,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000060'),
 (3638,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000061'),
 (3639,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000062'),
 (3640,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000063'),
 (3641,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000064'),
 (3642,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000065'),
 (3643,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000066'),
 (3644,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000067'),
 (3645,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000068'),
 (3646,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000069'),
 (3647,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000070'),
 (3648,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000071'),
 (3649,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000072'),
 (3650,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000073'),
 (3651,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000074'),
 (3652,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000075'),
 (3653,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000076'),
 (3654,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000077'),
 (3655,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000078'),
 (3656,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000079'),
 (3657,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000080'),
 (3658,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000081'),
 (3659,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000082'),
 (3660,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000083'),
 (3661,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000084'),
 (3662,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000085'),
 (3663,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000086'),
 (3664,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000087'),
 (3665,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000088'),
 (3666,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000089'),
 (3667,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000090'),
 (3668,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000091'),
 (3669,'tviaje','U','MARIO','2011-01-13 17:16:17','200000092'),
 (3670,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000093'),
 (3671,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000094'),
 (3672,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000095'),
 (3673,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000096'),
 (3674,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000097'),
 (3675,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000098'),
 (3676,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000099'),
 (3677,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000100'),
 (3678,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000101'),
 (3679,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000102'),
 (3680,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000103'),
 (3681,'tviaje','U','MARIO','2011-01-13 17:16:17','200000104'),
 (3682,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000105'),
 (3683,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000106'),
 (3684,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000107'),
 (3685,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000108'),
 (3686,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000109'),
 (3687,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000110'),
 (3688,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000111'),
 (3689,'tviaje','U','MARIO','2011-01-13 17:16:17','200000112'),
 (3690,'tviaje','U','MARIO','2011-01-13 17:16:17','200000113'),
 (3691,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000114'),
 (3692,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000115'),
 (3693,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000116'),
 (3694,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000117'),
 (3695,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000118'),
 (3696,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000119'),
 (3697,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000120'),
 (3698,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000121'),
 (3699,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000122'),
 (3700,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000123'),
 (3701,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000124'),
 (3702,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000125'),
 (3703,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000126'),
 (3704,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000127'),
 (3705,'tviaje','U','MARIO','2011-01-13 17:16:17','200000128'),
 (3706,'tviaje','U','MARIO','2011-01-13 17:16:17','200000129'),
 (3707,'tviaje','U','MARIO','2011-01-13 17:16:17','200000130'),
 (3708,'tviaje','U','MARIO','2011-01-13 17:16:17','200000131'),
 (3709,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000132'),
 (3710,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000133'),
 (3711,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000134'),
 (3712,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000135'),
 (3713,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000136'),
 (3714,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000137'),
 (3715,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000138'),
 (3716,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000139'),
 (3717,'tviaje','U','MARIO','2011-01-13 17:16:17','200000140'),
 (3718,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000141'),
 (3719,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000142'),
 (3720,'tviaje','U','MARIO','2011-01-13 17:16:17','200000143'),
 (3721,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000144'),
 (3722,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000145'),
 (3723,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000146'),
 (3724,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000147'),
 (3725,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000148'),
 (3726,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000149'),
 (3727,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000150'),
 (3728,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000151'),
 (3729,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000152'),
 (3730,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000153'),
 (3731,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000154'),
 (3732,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000155'),
 (3733,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000156'),
 (3734,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000157'),
 (3735,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000158'),
 (3736,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000159'),
 (3737,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000160'),
 (3738,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000161'),
 (3739,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000162'),
 (3740,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000163'),
 (3741,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000164'),
 (3742,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000165'),
 (3743,'tviaje','U','ADMCOC','2011-01-13 17:16:17','200000166'),
 (3744,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000167'),
 (3745,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000168'),
 (3746,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000169'),
 (3747,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000170'),
 (3748,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000171'),
 (3749,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000172'),
 (3750,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000173'),
 (3751,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000174'),
 (3752,'tviaje','U','JLOZADA','2011-01-13 17:16:17','200000175'),
 (3753,'tviaje','U','P','2011-01-13 17:16:17','200000176'),
 (3754,'tviaje','U','P','2011-01-13 17:16:17','200000177'),
 (3755,'tperiodo','U','ADMIN','2011-01-13 17:18:46','122010'),
 (3756,'tperiodo','U','ADMIN','2011-01-13 17:21:59','122010'),
 (3757,'tPeriodo','I','ADMIN','2011-01-31 11:02:26','167'),
 (3758,'tperiodo','U','ADMIN','2011-01-31 11:02:41','167'),
 (3759,'tperiodo','U','ADMIN','2011-01-31 11:07:55','167'),
 (3760,'tAnticipo','I','ADMIN','2011-01-31 11:12:27','100000013'),
 (3761,'tviaje','I','ADMIN','2011-01-31 11:12:27','100000015'),
 (3762,'tAnticipo','I','ADMIN','2011-01-31 11:13:21','100000014'),
 (3763,'tAnticipo','U','ADMIN','2011-01-31 11:13:21','100000013'),
 (3764,'tRelacion','I','ADMIN','2011-01-31 11:23:16','100000013'),
 (3765,'tAnticipo','U','ADMIN','2011-01-31 11:23:16','100000013'),
 (3766,'tAnticipo','U','ADMIN','2011-01-31 11:23:16','100000014'),
 (3767,'tAnticipo','U','ADMIN','2011-01-31 11:23:39','100000013'),
 (3768,'tAnticipo','U','ADMIN','2011-01-31 11:23:39','100000014'),
 (3769,'trelacion','D','ADMIN','2011-01-31 11:23:39','100000013'),
 (3770,'tRelacion','I','ADMIN','2011-01-31 11:25:36','100000014'),
 (3771,'tAnticipo','U','ADMIN','2011-01-31 11:25:36','100000013'),
 (3772,'tAnticipo','U','ADMIN','2011-01-31 11:25:36','100000014'),
 (3773,'tAnticipo','I','P','2011-01-31 16:06:55','100000015'),
 (3774,'tviaje','I','P','2011-01-31 16:06:56','100000016'),
 (3775,'tAnticipo','U','P','2011-02-01 11:07:38','100000015'),
 (3776,'tAnticipo','I','P','2011-02-15 17:48:37','100000016'),
 (3777,'tviaje','I','P','2011-02-15 17:48:37','100000017'),
 (3778,'truta','I','P','2011-02-16 18:24:33','630'),
 (3779,'torigen_destino','U','P','2011-02-16 18:25:10','6'),
 (3780,'tsucursal','U','P','2011-02-16 18:25:10','6');
/*!40000 ALTER TABLE `tbitacora` ENABLE KEYS */;


--
-- Definition of table `tchofer`
--

DROP TABLE IF EXISTS `tchofer`;
CREATE TABLE `tchofer` (
  `cid_chofer` varchar(9) NOT NULL,
  `cnombre` varchar(60) NOT NULL DEFAULT '',
  `ccontraparte` varchar(10) DEFAULT ' ',
  `cficha_nom` varchar(10) DEFAULT ' ',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ncontratado` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid_chofer`,`nid_sucursal`),
  KEY `FK_tchofer_tsucursal` (`nid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tchofer`
--

/*!40000 ALTER TABLE `tchofer` DISABLE KEYS */;
INSERT INTO `tchofer` (`cid_chofer`,`cnombre`,`ccontraparte`,`cficha_nom`,`nid_sucursal`,`cid_usuario`,`dfecha_act`,`ncontratado`,`nactivo`) VALUES 
 ('10139779','CABAÑA VICTOR','456','456',1,'P','2010-11-05 15:45:39',0,1),
 ('10144162','RAFAEL A ADAN',' ',' ',2,'ADMCOC','2010-11-23 13:57:09',1,0),
 ('10637589','LUCENA YEPEZ, JOSE','222','06689',2,'P','2010-11-12 16:50:15',0,1),
 ('11081499','ROJAS MORILLO, CARLOS','222','06628',2,'P','2010-11-12 16:51:14',0,1),
 ('11081888','ROJAS , MATIAS PASTO','456','456',1,'P','2010-10-18 14:59:13',0,1),
 ('11540495','ABELINO A. ZARRAGA P',' ',' ',2,'MARIO','2010-11-29 17:57:07',1,0),
 ('11542453','RODRIGUEZ, JHONNY','222','06686',2,'ADMIN','2010-11-29 18:25:58',0,1),
 ('12076944','YURAIMA SALAS',' ',' ',2,'P','2011-01-06 11:29:54',1,0),
 ('12262801','VIRGÜEZ JORGELIS','222','06736',2,'ADMIN','2010-11-16 16:36:08',0,1),
 ('12264842','PIMENTEL BRACHO,JHON',' ',' ',2,'MARIO','2010-11-30 09:05:13',1,0),
 ('12446697','SUAREZ RUSA RAMON  A','222','06646',2,'P','2010-11-12 16:54:28',0,1),
 ('13072039','DIRMO RODRIGUEZ','222','222',2,'ADMIN','2010-12-07 17:01:24',0,1),
 ('13486315','LUIS RAMON MORENO MA','123','123',1,'P','2010-10-18 15:14:59',0,1),
 ('14000037','PINEDA PEREZ ALCIDES','456','456',1,'P','2010-10-18 16:01:48',0,1),
 ('15107255','VILLARROEL V. ROMER','456','456',1,'P','2010-10-18 16:01:28',0,1),
 ('15340627','MANROY COLOMBO JOSE','222','06709',2,'P','2010-11-12 16:55:21',0,1),
 ('16072039','DIRMO RODRIGUEZ',' ',' ',2,'ADMCOC','2010-12-10 19:24:52',1,0),
 ('16346069','MENDEZ M. ANDRES','22','06683',2,'P','2010-11-12 17:12:51',0,1),
 ('16751579','ARNAO ARNOLDO','222','06760',2,'P','2010-11-12 17:13:51',0,1),
 ('16966899','LAMEDA JOHAN JOSE','222','06801',2,'P','2010-11-12 17:15:20',0,1),
 ('19170321','HERNANDEZ DOUGLAS',' ',' ',1,'P','2010-10-30 17:08:12',1,0),
 ('19637267','NATHALIE HIDALGO',' ',' ',2,'P','2011-01-06 11:28:36',1,0),
 ('20809213','ENDRINA AGUERO',' ',' ',2,'ADMCOC','2010-11-30 07:54:09',1,0),
 ('4605734','DOMINGO ARROYO','456','456',1,'P','2010-10-20 16:39:13',0,1),
 ('5426026','SILVA G. JOSE DANIEL','222','04790',1,'P','2010-11-11 11:27:06',0,1),
 ('7241360','SANDOVAL, STALIN JOS','123','6418',1,'P','2010-11-05 16:20:27',0,1),
 ('7547865','PASTRAN A. FELIPE J','456','456',1,'P','2010-10-18 16:02:07',0,1),
 ('8103812','VARELA PINEDA, ABEL','22','06452',2,'P','2010-11-12 17:16:39',0,1),
 ('8603178','MENDEZ R. EDDYS E .','456','456',1,'P','2010-10-20 16:39:02',0,1),
 ('8657021','TORRES MELENDEZ,NEST','123','123',1,'P','2010-10-18 14:57:59',0,1),
 ('9347051','GUERRA  JOSE','222','04206',2,'P','2010-11-12 16:53:10',0,1),
 ('9562700','SANCHEZ M. GUADALUPE','222','5056',1,'P','2010-11-05 16:21:08',0,1),
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
  `cid_ciudad` varchar(4) NOT NULL DEFAULT '',
  `cdescripcion` varchar(60) NOT NULL,
  `cid_estado` varchar(2) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid_ciudad`),
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
 ('0513','CIUDAD DE NUTRIAS','05','ADMIN','2010-12-20 09:56:41'),
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
 ('1208','SIQUISIQUE','12','ADMIN','2010-12-20 10:04:01'),
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
 ('1714','CHABASQUEN','17','ADMIN','2010-12-03 17:46:56'),
 ('1715','MESA DE CAVACAS','17','ADMIN','2010-12-20 10:26:14'),
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
 ('2010','ESCUQUE','20','ADMIN','2010-12-20 09:25:12'),
 ('2011','EL DIVIDIVE','20','ADMIN','2010-12-20 09:54:49'),
 ('2101','LA GUAIRA','21','ADMIN','2010-10-08 15:52:57'),
 ('2201','SAN FELIPE','22','ADMIN','2010-10-08 15:52:57'),
 ('2202','CHIVACOA','22','P','2010-10-08 17:51:41'),
 ('2203','NIRGUA','22','P','2010-10-08 17:52:03'),
 ('2204','YARITAGUA','22','P','2010-10-08 17:52:17'),
 ('2205','SABANA DE PARRA','22','P','2010-11-04 14:37:45'),
 ('2206','YUMARE','22','P','2010-11-04 14:39:26'),
 ('2207','AROA','22','P','2010-11-04 14:41:53'),
 ('2208','COCOROTE','22','ADMIN','2010-12-20 10:00:59'),
 ('2209','URACHICHE','22','ADMIN','2010-12-20 10:01:38'),
 ('2210','SAN PABLO','22','ADMIN','2010-12-20 10:02:08'),
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
  `nporc_com` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '% de comisión de la ruta.',
  `ntabulador` double NOT NULL DEFAULT '0' COMMENT 'tabulador de viaje para el tipo de vehículo en la ruta.',
  PRIMARY KEY (`nid_viaje`,`cid_periodo`),
  UNIQUE KEY `Ix_com_chof` (`nid_viaje`,`cid_periodo`),
  CONSTRAINT `FK_tcomchof_tviaje` FOREIGN KEY (`nid_viaje`) REFERENCES `tviaje` (`nid_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcomision_choferes`
--

/*!40000 ALTER TABLE `tcomision_choferes` DISABLE KEYS */;
INSERT INTO `tcomision_choferes` (`nid_viaje`,`cid_periodo`,`nporc_com`,`ntabulador`) VALUES 
 (100000001,'122010',100,13.45),
 (100000002,'122010',100,16.14),
 (100000003,'122010',100,20),
 (100000004,'122010',100,16.85),
 (100000006,'122010',100,26.24),
 (100000007,'122010',100,16.85),
 (100000008,'122010',100,13.45),
 (100000009,'122010',100,15.29),
 (100000010,'122010',100,13.27),
 (100000011,'122010',100,17.72),
 (100000012,'122010',100,9.8),
 (100000013,'122010',100,20),
 (100000014,'122010',100,16.14),
 (200000001,'122010',100,36.83),
 (200000002,'122010',100,38.48),
 (200000003,'122010',100,28.05),
 (200000004,'122010',100,38.45),
 (200000005,'122010',100,36.83),
 (200000006,'122010',100,27.1),
 (200000007,'122010',100,20.18),
 (200000008,'122010',100,15.47),
 (200000009,'122010',100,31.03),
 (200000010,'122010',100,20.18),
 (200000011,'122010',100,10.31),
 (200000012,'122010',100,26.87),
 (200000013,'122010',100,38.48),
 (200000014,'122010',100,31.4),
 (200000015,'122010',100,17.29),
 (200000016,'122010',100,10.31),
 (200000017,'122010',100,23.28),
 (200000018,'122010',100,20.18),
 (200000019,'122010',100,16.83),
 (200000020,'122010',100,27.87),
 (200000021,'122010',100,23.98),
 (200000022,'122010',100,51.75),
 (200000023,'122010',100,28.05),
 (200000024,'122010',100,20.18),
 (200000025,'122010',100,20.18),
 (200000026,'122010',100,30.34),
 (200000027,'122010',100,23.98),
 (200000028,'122010',100,19.74),
 (200000029,'122010',100,20.18),
 (200000030,'122010',100,38.48),
 (200000031,'122010',100,32.75),
 (200000032,'122010',100,20.18),
 (200000033,'122010',100,25.61),
 (200000034,'122010',100,36.66),
 (200000035,'122010',100,38.48),
 (200000036,'122010',100,20.18),
 (200000037,'122010',100,22.56),
 (200000038,'122010',100,20.18),
 (200000039,'122010',100,25.61),
 (200000040,'122010',100,26.87),
 (200000041,'122010',100,25.61),
 (200000042,'122010',100,29.5),
 (200000043,'122010',100,20.18),
 (200000044,'122010',100,20.18),
 (200000045,'122010',100,10.68),
 (200000046,'122010',100,15.75),
 (200000047,'122010',100,38.45),
 (200000048,'122010',100,20.18),
 (200000049,'122010',100,20.18),
 (200000050,'122010',100,23.52),
 (200000051,'122010',100,10.31),
 (200000052,'122010',100,35.2),
 (200000053,'122010',100,20.63),
 (200000054,'122010',100,20.18),
 (200000055,'122010',100,20.18),
 (200000056,'122010',100,20.18),
 (200000057,'122010',100,35.2),
 (200000058,'122010',100,20.18),
 (200000059,'122010',100,26.87),
 (200000060,'122010',100,39.45),
 (200000061,'122010',100,11.83),
 (200000062,'122010',100,20.18),
 (200000063,'122010',100,27.87),
 (200000064,'122010',100,10.31),
 (200000065,'122010',100,20.18),
 (200000066,'122010',100,16.83),
 (200000067,'122010',100,38.48),
 (200000068,'122010',100,11.83),
 (200000069,'122010',100,26.87),
 (200000070,'122010',100,20.18),
 (200000071,'122010',100,53.75),
 (200000073,'122010',100,20.18),
 (200000074,'122010',100,53.75),
 (200000075,'122010',100,25.61),
 (200000076,'122010',100,31.51),
 (200000077,'122010',100,20.18),
 (200000078,'122010',100,26.87),
 (200000079,'122010',100,36.66),
 (200000080,'122010',100,23.98),
 (200000081,'122010',100,20.18),
 (200000082,'122010',100,11.57),
 (200000083,'122010',100,23.98),
 (200000084,'122010',100,19.74),
 (200000085,'122010',100,26.87),
 (200000086,'122010',100,20.18),
 (200000087,'122010',100,31.4),
 (200000088,'122010',100,51.75),
 (200000089,'122010',100,25.61),
 (200000090,'122010',100,20.18),
 (200000091,'122010',100,20.18),
 (200000092,'122010',100,19.74),
 (200000093,'122010',100,6.05),
 (200000094,'122010',100,38.82),
 (200000095,'122010',100,20.18),
 (200000096,'122010',100,42.71),
 (200000097,'122010',100,51.75),
 (200000098,'122010',100,20.18),
 (200000100,'122010',100,20.18),
 (200000101,'122010',100,20.18),
 (200000102,'122010',100,30.34),
 (200000103,'122010',100,38.48),
 (200000104,'122010',100,36.83),
 (200000105,'122010',100,23.98),
 (200000106,'122010',100,20.18),
 (200000108,'122010',100,20.18),
 (200000111,'122010',100,38.48),
 (200000112,'122010',100,20.18),
 (200000113,'122010',100,20.18),
 (200000115,'122010',100,20.18),
 (200000116,'122010',100,20.18),
 (200000117,'122010',100,19.74),
 (200000128,'122010',100,23.98),
 (200000129,'122010',100,23.98),
 (200000130,'122010',100,20.18),
 (200000140,'122010',100,56.01),
 (200000143,'122010',100,38.45);
/*!40000 ALTER TABLE `tcomision_choferes` ENABLE KEYS */;


--
-- Definition of table `tconfig`
--

DROP TABLE IF EXISTS `tconfig`;
CREATE TABLE `tconfig` (
  `ccompania` varchar(60) NOT NULL DEFAULT ' ' COMMENT 'Código de la compañia en el sistema de nómina (SPI). Actualmente 01',
  `nbono_base` double NOT NULL DEFAULT '0' COMMENT 'Bono base para efectuar el cálculo de las comisiones de jefe de almacen y montacarguista.',
  `ndias` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de días de un mes. Se utiliza para el calculo del cesta ticket.',
  `npeso_min_liv` double NOT NULL DEFAULT '0' COMMENT 'Peso minimo que se le reconoce a los vehiculos livianos.',
  `npeso_min_med` double NOT NULL DEFAULT '0' COMMENT 'Peso minimo que se le reconoce a los vehiculos medianos.',
  `npeso_min_pes` double NOT NULL DEFAULT '0' COMMENT 'Peso minimo que se le reconoce a los vehiculos pesados.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tconfig`
--

/*!40000 ALTER TABLE `tconfig` DISABLE KEYS */;
INSERT INTO `tconfig` (`ccompania`,`nbono_base`,`ndias`,`npeso_min_liv`,`npeso_min_med`,`npeso_min_pes`) VALUES 
 ('01',200,30,10000,17000,28000);
/*!40000 ALTER TABLE `tconfig` ENABLE KEYS */;


--
-- Definition of table `tcorrelativo`
--

DROP TABLE IF EXISTS `tcorrelativo`;
CREATE TABLE `tcorrelativo` (
  `nid_sucursal` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `nid_anticipo` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `nid_viaje` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `nid_relacion` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `nid_gasto` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcorrelativo`
--

/*!40000 ALTER TABLE `tcorrelativo` DISABLE KEYS */;
INSERT INTO `tcorrelativo` (`nid_sucursal`,`nid_anticipo`,`nid_viaje`,`nid_relacion`,`nid_gasto`) VALUES 
 (0001,0100000016,0100000017,0100000014,0100000000),
 (0002,0200000183,0200000177,0200000117,0200000000),
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
  `nid_gasto` int(10) unsigned NOT NULL DEFAULT '0',
  `cid_vehiculo` varchar(10) NOT NULL,
  `cid_servicio` varchar(3) NOT NULL,
  `ntotal` double NOT NULL DEFAULT '0',
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
 (200000001,'01',260),
 (200000001,'05',12),
 (200000002,'06',120),
 (200000002,'01',260),
 (200000002,'05',12),
 (200000003,'06',130),
 (200000003,'01',260),
 (200000003,'05',12),
 (200000004,'06',120),
 (200000004,'01',260),
 (200000004,'05',12),
 (200000004,'08',3),
 (200000005,'06',150),
 (200000005,'01',260),
 (200000005,'05',12),
 (200000005,'08',100),
 (200000006,'06',120),
 (200000006,'01',260),
 (200000006,'05',20),
 (200000007,'06',120),
 (200000007,'01',260),
 (200000008,'06',130),
 (200000008,'01',260),
 (200000008,'05',12),
 (200000009,'06',130),
 (200000009,'01',260),
 (200000009,'05',12),
 (200000010,'06',120),
 (200000010,'01',260),
 (200000011,'06',160),
 (200000011,'01',260),
 (200000011,'05',6),
 (200000012,'06',110),
 (200000012,'01',260),
 (200000012,'05',12),
 (200000013,'06',70),
 (200000013,'01',260),
 (200000014,'06',150),
 (200000014,'01',260),
 (200000014,'05',12),
 (200000015,'06',120),
 (200000015,'01',260),
 (200000016,'06',110),
 (200000016,'01',260),
 (200000016,'05',12),
 (200000017,'06',120),
 (200000017,'01',260),
 (200000017,'05',18),
 (200000018,'06',120),
 (200000018,'01',360),
 (200000018,'05',15),
 (200000019,'06',120),
 (200000019,'01',260),
 (200000019,'05',12),
 (200000020,'06',130),
 (200000020,'01',260),
 (200000020,'05',15),
 (200000021,'06',150),
 (200000021,'01',260),
 (200000022,'06',110),
 (200000022,'01',260),
 (200000023,'06',110),
 (200000023,'01',260),
 (200000023,'05',15),
 (200000024,'06',120),
 (200000024,'01',260),
 (200000025,'06',160),
 (200000025,'01',260),
 (200000025,'05',12),
 (200000025,'08',140),
 (200000026,'06',160),
 (200000026,'01',260),
 (200000026,'05',12),
 (200000027,'06',160),
 (200000027,'01',260),
 (200000027,'05',12),
 (200000028,'06',120),
 (200000028,'01',260),
 (200000028,'05',12),
 (200000029,'06',70),
 (200000029,'01',260),
 (200000030,'06',150),
 (200000030,'01',260),
 (200000030,'05',12),
 (200000031,'06',120),
 (200000031,'01',260),
 (200000031,'05',12),
 (200000031,'08',8),
 (200000032,'06',120),
 (200000032,'01',260),
 (200000032,'05',20),
 (200000033,'06',120),
 (200000033,'01',260),
 (200000033,'08',20),
 (200000034,'06',120),
 (200000034,'01',260),
 (200000034,'05',20),
 (200000035,'06',120),
 (200000035,'01',260),
 (200000035,'05',12),
 (200000036,'06',160),
 (200000036,'01',260),
 (200000036,'05',12),
 (200000036,'08',40),
 (200000037,'06',130),
 (200000037,'01',260),
 (200000037,'05',12),
 (200000038,'06',120),
 (200000038,'01',260),
 (200000038,'05',12),
 (200000039,'06',120),
 (200000039,'01',260),
 (200000039,'02',5),
 (200000040,'06',40),
 (200000040,'01',260),
 (200000041,'06',160),
 (200000041,'01',260),
 (200000042,'06',120),
 (200000042,'01',260),
 (200000042,'05',20),
 (200000043,'06',120),
 (200000043,'01',260),
 (200000044,'06',120),
 (200000044,'01',260),
 (200000044,'05',20),
 (200000045,'06',150),
 (200000045,'01',260),
 (200000046,'06',120),
 (200000046,'01',260),
 (200000046,'05',20),
 (200000047,'06',110),
 (200000047,'01',260),
 (200000047,'05',12),
 (200000048,'06',120),
 (200000048,'01',260),
 (200000049,'06',120),
 (200000049,'01',260),
 (200000049,'05',12),
 (200000050,'06',110),
 (200000050,'01',260),
 (200000051,'06',130),
 (200000051,'01',260),
 (200000052,'06',70),
 (200000052,'01',260),
 (200000053,'06',150),
 (200000053,'01',260),
 (200000053,'05',6),
 (200000053,'02',15),
 (200000054,'06',130),
 (200000054,'01',260),
 (200000055,'06',120),
 (200000055,'01',260),
 (200000055,'05',12),
 (200000056,'06',150),
 (200000056,'01',325),
 (200000056,'02',20),
 (200000057,'06',120),
 (200000057,'01',260),
 (200000057,'05',12),
 (200000058,'06',120),
 (200000058,'01',260),
 (200000058,'05',12),
 (200000058,'08',30),
 (200000059,'06',120),
 (200000059,'01',260),
 (200000060,'06',120),
 (200000060,'01',260),
 (200000060,'05',20),
 (200000061,'06',120),
 (200000061,'01',260),
 (200000061,'05',12),
 (200000062,'06',120),
 (200000062,'01',260),
 (200000063,'06',130),
 (200000063,'01',260),
 (200000064,'06',150),
 (200000064,'01',325),
 (200000064,'07',20),
 (200000065,'06',130),
 (200000065,'01',260),
 (200000065,'08',100),
 (200000066,'06',150),
 (200000066,'01',260),
 (200000066,'05',12),
 (200000067,'06',200),
 (200000067,'01',490),
 (200000067,'02',20),
 (200000068,'06',110),
 (200000068,'01',410),
 (200000068,'05',14),
 (200000069,'06',150),
 (200000069,'01',410),
 (200000070,'06',110),
 (200000070,'01',410),
 (200000070,'05',14),
 (200000071,'06',120),
 (200000071,'01',260),
 (200000071,'05',20),
 (200000072,'06',150),
 (200000072,'01',260),
 (200000072,'05',12),
 (200000072,'08',60),
 (200000073,'06',120),
 (200000073,'01',260),
 (200000073,'05',12),
 (200000073,'08',4),
 (200000074,'06',120),
 (200000074,'01',260),
 (200000074,'05',12),
 (200000075,'06',130),
 (200000075,'01',260),
 (200000075,'05',15),
 (200000076,'06',110),
 (200000076,'01',260),
 (200000077,'06',120),
 (200000077,'01',260),
 (200000077,'05',20),
 (200000078,'06',60),
 (200000078,'01',260),
 (200000079,'06',160),
 (200000079,'01',260),
 (200000080,'06',160),
 (200000080,'01',260),
 (200000080,'05',12),
 (200000081,'06',150),
 (200000081,'01',260),
 (200000081,'05',12),
 (200000081,'02',10),
 (200000082,'06',130),
 (200000082,'01',260),
 (200000082,'05',12),
 (200000083,'06',110),
 (200000083,'01',260),
 (200000084,'06',120),
 (200000084,'01',260),
 (200000084,'05',12),
 (200000085,'06',160),
 (200000085,'01',260),
 (200000085,'05',12),
 (200000086,'06',110),
 (200000086,'01',260),
 (200000086,'05',16),
 (200000087,'06',110),
 (200000087,'01',260),
 (200000087,'05',12),
 (200000087,'08',5),
 (200000088,'06',120),
 (200000088,'01',260),
 (200000088,'05',15),
 (200000089,'06',110),
 (200000089,'01',260),
 (200000089,'05',12),
 (200000090,'06',120),
 (200000090,'01',260),
 (200000090,'05',20),
 (200000091,'06',160),
 (200000091,'01',260),
 (200000091,'05',12),
 (200000092,'06',110),
 (200000092,'01',260),
 (200000092,'08',8),
 (200000092,'05',12),
 (200000093,'06',110),
 (200000093,'01',260),
 (200000093,'05',20),
 (200000094,'06',210),
 (200000094,'01',418),
 (200000094,'05',12),
 (200000095,'06',120),
 (200000095,'01',260),
 (200000095,'05',12),
 (200000096,'06',120),
 (200000096,'01',260),
 (200000096,'05',12),
 (200000096,'07',8),
 (200000097,'06',120),
 (200000097,'01',260),
 (200000097,'05',12),
 (200000098,'06',120),
 (200000098,'01',260),
 (200000100,'06',120),
 (200000100,'01',260),
 (200000100,'05',20),
 (200000101,'06',120),
 (200000101,'01',260),
 (200000101,'05',12),
 (200000102,'06',120),
 (200000102,'01',260),
 (200000102,'05',12),
 (200000103,'06',175),
 (200000103,'01',410),
 (200000103,'02',20),
 (200000104,'06',135),
 (200000104,'01',410),
 (200000104,'02',10),
 (200000105,'06',110),
 (200000105,'01',410),
 (200000106,'06',150),
 (200000106,'01',410),
 (200000106,'05',14),
 (200000107,'06',175),
 (200000107,'01',410),
 (200000107,'05',14),
 (200000107,'02',10),
 (200000108,'06',135),
 (200000108,'01',410),
 (200000109,'06',60),
 (200000109,'01',410),
 (200000110,'06',150),
 (200000110,'01',410),
 (200000110,'05',14),
 (200000110,'02',10),
 (200000111,'06',160),
 (200000111,'01',260),
 (200000112,'06',160),
 (200000112,'01',260),
 (200000112,'05',12),
 (200000113,'06',120),
 (200000113,'01',260),
 (200000114,'06',160),
 (200000114,'01',260),
 (200000114,'05',12),
 (200000115,'06',150),
 (200000115,'01',260),
 (200000116,'06',110),
 (200000116,'01',260),
 (200000116,'05',12),
 (200000117,'06',130),
 (200000117,'01',260),
 (200000117,'05',12),
 (100000001,'06',150),
 (100000001,'01',800),
 (100000001,'05',37),
 (100000001,'02',12),
 (100000003,'06',200),
 (100000003,'01',520),
 (100000003,'05',52),
 (100000004,'06',450),
 (100000004,'01',100),
 (100000004,'05',56),
 (100000004,'02',20),
 (100000005,'06',500),
 (100000005,'01',1100),
 (100000005,'05',85),
 (100000005,'02',30),
 (100000006,'06',150),
 (100000006,'05',74),
 (100000007,'06',150),
 (100000007,'01',700),
 (100000007,'05',74),
 (100000008,'06',150),
 (100000008,'01',100),
 (100000008,'05',28),
 (100000008,'08',100),
 (100000009,'06',200),
 (100000009,'01',100),
 (100000009,'08',100),
 (100000010,'06',110),
 (100000010,'01',100),
 (100000010,'05',52),
 (100000010,'08',100),
 (100000011,'06',200),
 (100000011,'05',56),
 (100000011,'02',15),
 (100000012,'06',150),
 (100000012,'05',98),
 (100000014,'01',100),
 (100000014,'06',230),
 (100000014,'05',72),
 (100000014,'07',100),
 (100000014,'08',200);
/*!40000 ALTER TABLE `tdetalle_relacion` ENABLE KEYS */;


--
-- Definition of table `testado`
--

DROP TABLE IF EXISTS `testado`;
CREATE TABLE `testado` (
  `cid_estado` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL DEFAULT '',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid_estado`)
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
  PRIMARY KEY (`nid_gasto`)
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
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL,
  PRIMARY KEY (`cid_grupo`)
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
  `nid_origdest` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_ciudad` varchar(4) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nactivo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `norigen` tinyint(1) unsigned NOT NULL,
  `nsucursal` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`nid_origdest`),
  KEY `FK_torigdest_tciudad` (`cid_ciudad`),
  CONSTRAINT `FK_torigdest_tciudad` FOREIGN KEY (`cid_ciudad`) REFERENCES `tciudad` (`cid_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

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
 (6,'MARACAIBO SUC','2301','P','2011-02-16 18:25:10',1,1,1),
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
 (62,'CHABASQUEN','1714','ADMIN','2010-12-03 17:47:30',1,0,0),
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
 (89,'GUACARA','0702','P','2010-11-12 12:03:36',1,0,0),
 (90,'ESCUQUE','2010','ADMIN','2010-12-20 09:32:22',1,0,0),
 (91,'EL DIVIDIVE','2011','ADMIN','2010-12-20 10:29:36',1,0,0),
 (92,'CIUDAD DE NUTRIAS','0513','ADMIN','2010-12-20 10:30:08',1,0,0),
 (93,'COCOROTE','2208','ADMIN','2010-12-20 10:30:41',1,0,0),
 (94,'URACHICHE','2209','ADMIN','2010-12-20 10:31:04',1,0,0),
 (95,'SAN PABLO','2210','ADMIN','2010-12-20 10:31:43',1,0,0),
 (96,'SIQUISIQUE','1208','ADMIN','2010-12-20 10:32:04',1,0,0),
 (97,'MESA DE CAVACAS','1715','ADMIN','2010-12-20 10:32:41',1,0,0);
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
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nstatus` tinyint(1) NOT NULL DEFAULT '0',
  `nticket_cesta` double NOT NULL DEFAULT '0' COMMENT 'Valor en Bs de un cesta ticket',
  `ndias_feriados` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de días feriados del periodo',
  PRIMARY KEY (`cid_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tperiodo`
--

/*!40000 ALTER TABLE `tperiodo` DISABLE KEYS */;
INSERT INTO `tperiodo` (`cid_periodo`,`dfecha_desde`,`dfecha_hasta`,`cdescripcion`,`cid_usuario`,`dfecha_act`,`nstatus`,`nticket_cesta`,`ndias_feriados`) VALUES 
 ('122010','2010-08-23','2010-12-15','NOVIEMBRE 2010 - DICIEMBRE 2010','ADMIN','2011-01-13 17:21:59',0,26,5),
 ('166','2010-12-16','2011-01-15','','NELIGER','2011-01-04 18:22:50',0,26,5),
 ('167','2010-08-30','2011-03-02','PERIODO DE PRUEBA','ADMIN','2011-01-31 11:07:55',1,0,0);
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
  `nid_relacion` int(10) unsigned NOT NULL DEFAULT '0',
  `dfecha` date NOT NULL DEFAULT '1900-01-01',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cobservacion` text,
  `nstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1: Normal, 2: Contabilizado',
  PRIMARY KEY (`nid_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trelacion`
--

/*!40000 ALTER TABLE `trelacion` DISABLE KEYS */;
INSERT INTO `trelacion` (`nid_relacion`,`dfecha`,`cid_usuario`,`dfecha_act`,`cobservacion`,`nstatus`) VALUES 
 (100000001,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (100000003,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000004,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000005,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000006,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000007,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000008,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000009,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000010,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000011,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000012,'2010-12-15','P','2011-01-11 11:45:55','',2),
 (100000014,'2011-01-31','ADMIN','2011-01-31 11:25:36','',1),
 (200000001,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000002,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000003,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000004,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000005,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000006,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000007,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000008,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000009,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000010,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000011,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000012,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000013,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000014,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000015,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000016,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000017,'2010-11-30','MARIO','2010-12-17 18:02:45','',2),
 (200000018,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000019,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000020,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000021,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000022,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000023,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000024,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000025,'2010-12-06','MARIO','2010-12-17 18:02:45','',2),
 (200000026,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000027,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000028,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000029,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000030,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000031,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000032,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000033,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000034,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000035,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000036,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000037,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000038,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000039,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000040,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000041,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000042,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000043,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000044,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000045,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000046,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000047,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000048,'2010-12-07','MARIO','2010-12-17 18:02:45','',2),
 (200000049,'2010-12-08','MARIO','2010-12-17 18:02:45','',2),
 (200000050,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000051,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000052,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000053,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000054,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000055,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000056,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000057,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000058,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000059,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000060,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000061,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000062,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000063,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000064,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000065,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000066,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000067,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000068,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000069,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000070,'2010-12-10','MARIO','2010-12-17 18:02:45','',2),
 (200000071,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000072,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000073,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000074,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000075,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000076,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000077,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000078,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000079,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000080,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000081,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000082,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000083,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000084,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000085,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000086,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000087,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000088,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000089,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000090,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000091,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000092,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000093,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000094,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000095,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000096,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000097,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000098,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000100,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000101,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000102,'2010-12-13','MARIO','2010-12-17 18:02:45','',2),
 (200000103,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000104,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000105,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000106,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000107,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000108,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000109,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000110,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000111,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000112,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000113,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000114,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000115,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000116,'2010-12-15','MARIO','2010-12-17 18:02:45','',2),
 (200000117,'2010-12-15','MARIO','2010-12-17 18:02:45','',2);
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

--
-- Dumping data for table `truta`
--

/*!40000 ALTER TABLE `truta` DISABLE KEYS */;
INSERT INTO `truta` (`nid_origen`,`nid_destino`,`ndistancia`,`cid_usuario`,`dfecha_act`,`cdescripcion`,`nactivo`,`nporc_com`,`ncom_pes`,`ncom_med`,`ncom_liv`) VALUES 
 (1,3,343,'ADMIN','2010-12-17 14:51:20','OP - CARACAS SUC.',1,100,13.45,22.86,39),
 (1,4,185,'P','2010-11-22 09:41:23','OP - VALENCIA SUC.',1,100,9.2,15.65,26.69),
 (1,5,628,'P','2010-11-22 09:41:23','OP - BARCELONA SUC.',1,100,20,34,58),
 (1,6,440,'P','2010-11-22 09:41:23','OP - MARACAIBO SUC.',1,100,16.14,27.44,46.81),
 (1,9,234,'P','2010-11-22 09:41:23','OP - MARACAY',1,100,10.92,18.56,31.67),
 (1,10,172,'P','2010-11-22 09:41:23','OP - BARINAS',1,100,9.27,15.75,26.87),
 (1,14,371,'P','2010-11-22 09:41:23','OP - CORO',1,100,14.54,24.72,42.17),
 (1,16,86,'P','2010-11-22 09:41:23','OP - BARQUISIMETO',1,100,6.96,11.83,20.18),
 (1,17,319,'ADMIN','2010-12-15 11:35:03','OP - MERIDA',1,100,19.31,32.83,56.01),
 (1,21,82,'P','2010-11-22 09:41:23','OP - GUANARE',1,100,6.81,11.57,19.74),
 (1,23,473,'P','2010-11-22 09:41:23','OP - SAN CRISTOBAL',1,100,17.72,30.13,51.39),
 (1,24,300,'P','2010-11-22 09:41:23','OP - TRUJILLO',1,100,12.7,21.59,36.83),
 (1,26,157,'P','2010-11-22 09:41:23','OP - SAN FELIPE',1,100,8.83,15.01,25.61),
 (1,28,921,'P','2010-11-22 09:41:23','OP - TEMBLADOR',1,100,28.43,48.32,82.44),
 (1,31,400,'P','2010-11-22 09:41:23','OP - GUATIRE',1,100,15.29,25.99,44.34),
 (1,32,301,'P','2010-11-22 09:41:23','OP - CAGUA',1,100,12.73,21.64,36.92),
 (1,33,320,'P','2010-11-22 09:41:23','OP - VALERA',1,100,13.27,22.56,38.48),
 (1,34,47,'P','2010-11-22 09:41:23','OP - APARTADERO',1,100,5.8,9.87,16.83),
 (1,35,339,'P','2010-11-22 09:41:23','OP - CHARALLAVE',1,100,13.79,23.44,39.99),
 (1,36,326,'P','2010-11-22 09:41:23','OP - CALABOZO',1,100,13.42,22.81,38.91),
 (1,37,916,'P','2010-11-22 09:41:23','OP -  SAN FELIX',1,100,26.24,44.61,76.1),
 (1,38,586,'P','2010-11-22 09:41:23','OP - PUNTO FIJO',1,100,19.41,32.99,56.28),
 (1,40,1,'P','2010-11-22 09:41:23','OP - ACARIGUA',1,100,3.56,6.05,10.31),
 (1,41,148,'P','2010-11-22 09:41:23','OP - SABANETA',1,100,8.61,14.64,24.97),
 (1,42,138,'P','2010-11-22 09:41:23','OP - BARRANCAS',1,100,8.33,14.16,24.16),
 (1,43,175,'P','2010-11-22 09:41:23','OP - MIJAGUAL',1,100,9.3,15.82,26.98),
 (1,44,204,'P','2010-11-22 09:41:23','OP - SANTA ROSA',1,100,10.11,17.18,29.32),
 (1,45,279,'P','2010-11-22 09:41:23','OP - SOCOPO',1,100,12.14,20.63,35.2),
 (1,46,332,'P','2010-11-22 09:41:23','OP - SANTA BARBARA',1,100,13.6,23.13,39.45),
 (1,47,230,'P','2010-11-22 09:41:23','OP - LIBERTAD',1,100,10.83,18.4,31.4),
 (1,48,315,'P','2010-11-22 09:41:23','OP - CAPITANEJO',1,100,13.14,22.33,38.09),
 (1,49,380,'P','2010-11-22 09:41:23','OP - DOLORES',1,100,14.73,25.03,42.71),
 (1,50,206,'P','2010-11-22 09:41:23','OP - BARINITAS',1,100,10.17,17.29,29.5),
 (1,51,247,'P','2010-11-22 09:41:23','OP - PEDRAZA',1,100,11.29,19.2,32.75),
 (1,52,325,'P','2010-11-22 09:41:23','OP - BUENA VISTA',1,100,13.38,22.75,38.82),
 (1,53,392,'P','2010-11-22 09:41:23','OP - BETIJOQUE',1,100,15.04,25.56,43.6),
 (1,54,320,'P','2010-11-22 09:41:23','OP - CARVAJAL',1,100,13.26,22.54,38.45),
 (1,55,220,'P','2010-11-22 09:41:23','OP - MONAY',1,100,10.55,17.93,30.58),
 (1,56,250,'P','2010-11-22 09:41:23','OP - PAM PAM',1,100,11.36,19.31,32.93),
 (1,57,300,'P','2010-11-22 09:41:23','OP - SABANA MENDOZA',1,100,12.7,21.59,36.83),
 (1,58,400,'P','2010-11-22 09:41:23','OP - BOCONO',1,100,15.29,25.99,44.34),
 (1,59,20,'P','2010-11-22 09:41:23','OP - AGUA BLANCA',1,100,4.27,7.27,12.4),
 (1,60,1,'P','2010-11-22 09:41:23','OP - ARAURE',1,100,3.56,6.05,10.31),
 (1,61,129,'P','2010-11-22 09:41:23','OP - BISCUCUY',1,100,8.08,13.74,23.43),
 (1,62,166,'ADMIN','2010-12-03 17:47:54','OP - CHABASQUEN',1,100,9.08,15.43,26.33),
 (1,63,185,'P','2010-11-22 09:41:23','OP - GUANARITO',1,100,9.61,16.34,27.87),
 (1,64,47,'P','2010-11-22 09:41:23','OP - OSPINO',1,100,5.8,9.87,16.83),
 (1,65,11,'P','2010-11-22 09:41:23','OP - PAYARA',1,100,3.68,6.26,10.68),
 (1,66,30,'P','2010-11-22 09:41:23','OP - PIRITU',1,100,5.34,9.07,15.47),
 (1,67,81,'P','2010-11-22 09:41:23','OP - PLAYON',1,100,6.77,11.51,19.63),
 (1,68,47,'P','2010-11-22 09:41:23','OP - TUREN',1,100,5.8,9.87,16.83),
 (1,69,367,'P','2010-11-22 09:41:23','OP - ABEJALES',1,100,14.45,24.56,41.89),
 (1,70,188,'P','2010-11-22 09:41:23','OP - CARORA',1,100,9.67,16.44,28.05),
 (1,71,136,'P','2010-11-22 09:41:23','OP - DUACA',1,100,8.27,14.06,23.98),
 (1,72,226,'P','2010-11-22 09:41:23','OP - EL TOCUYO',1,100,10.7,18.19,31.03),
 (1,73,20,'P','2010-11-22 09:41:23','OP - LA MIEL',1,100,4.27,7.27,12.4),
 (1,74,127,'P','2010-11-22 09:41:23','OP - QUIBOR',1,100,8.03,13.65,23.28),
 (1,75,33,'P','2010-11-22 09:41:23','OP - SARARE',1,100,5.46,9.28,15.83),
 (1,76,481,'P','2010-11-22 09:41:23','OP - NUEVA BOLIVIA',1,100,17.85,30.34,51.75),
 (1,77,206,'P','2010-11-22 09:41:23','OP - AROA',1,100,10.17,17.29,29.5),
 (1,78,294,'P','2010-11-22 09:41:23','OP - BRUZUAL',1,100,12.64,21.49,36.66),
 (1,79,480,'P','2010-11-22 09:41:23','OP - CAJA SECA',1,100,17.85,30.34,51.75),
 (1,80,130,'P','2010-11-22 09:41:23','OP - CHIVACOA',1,100,8.11,13.79,23.52),
 (1,81,527,'P','2010-11-22 09:41:23','OP - EL AMPARO',1,100,18.53,31.51,53.75),
 (1,82,507,'P','2010-11-22 09:41:23','OP - GUASDUALITO',1,100,18.22,30.98,52.84),
 (1,83,115,'P','2010-11-22 09:41:23','OP - SABANA DE PARRA',1,100,7.71,13.1,22.35),
 (1,84,110,'P','2010-11-22 09:41:23','OP - YARITAGUA',1,100,7.55,12.84,21.9),
 (1,85,212,'P','2010-11-22 09:41:23','OP - YUMARE',1,100,10.33,17.56,29.95),
 (1,86,36,'P','2010-11-22 09:41:23','OP - SAN RAFAEL DE ONOTO',1,100,5.52,9.39,16.01),
 (1,87,432,'P','2010-11-22 09:41:23','OP - EL CANTON, GUACAS',1,100,15.94,27.1,46.24),
 (1,88,440,'P','2010-11-22 09:41:23','OP - EL VIGIA',1,100,16.14,27.44,46.81),
 (1,89,193,'P','2010-11-22 09:41:23','OP - GUACARA',1,100,9.8,16.65,28.41),
 (1,90,330,'ADMIN','2010-12-20 10:34:25','OP - ESCUQUE',1,100,13.27,22.56,38.48),
 (1,91,295,'ADMIN','2010-12-20 10:36:34','OP - EL DIVIDIVE',1,100,12.7,21.59,36.83),
 (1,92,286,'ADMIN','2010-12-20 10:38:20','OP - CIUDAD DE NUTRIAS',1,100,12.64,21.49,36.66),
 (1,93,150,'ADMIN','2010-12-20 10:40:58','OP - COCOROTE',1,100,8.83,15.01,25.61),
 (1,94,115,'ADMIN','2010-12-20 10:42:09','OP - URACHICHE',1,100,8.11,13.79,23.52),
 (1,95,142,'ADMIN','2010-12-20 10:43:17','OP - SAN PABLO',1,100,8.11,13.79,23.52),
 (1,96,218,'ADMIN','2010-12-20 10:46:17','OP - SIQUISIQUE',1,100,9.27,15.75,26.87),
 (1,97,94,'ADMIN','2010-12-20 10:47:57','OP - MESA DE CAVACAS',1,100,6.81,11.57,19.74),
 (6,1,440,'P','2010-11-22 09:41:23','MARACAIBO - OP',1,100,16.14,27.44,46.81),
 (6,3,786,'P','2010-10-18 16:20:26','MARACAIBO - CARACAS',1,100,22.99,39.08,66.67),
 (6,4,522,'P','2010-10-11 10:37:29','SAN FRANCISCO - VALENCIA',1,100,0.01,0.01,0.01),
 (6,30,3,'P','2011-02-16 18:24:33','MARACAIBO - SAN FRANCISCO',1,100,2.68,4.56,7.78),
 (27,1,633,'P','2010-11-22 09:41:23','PTO LA CRUZ - OP',1,100,20.09,34.16,58.27),
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
-- Definition of table `tservicio`
--

DROP TABLE IF EXISTS `tservicio`;
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
  PRIMARY KEY (`nid_sucursal`)
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
 (6,'MARACAIBO SUC','2301','P','2011-02-16 18:25:10',10,6,1,0.1800,0.0040,0,'1104');
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
  `cdescripcion` varchar(60) NOT NULL DEFAULT ' ',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ccta_cont` varchar(10) NOT NULL DEFAULT ' ',
  `cdescrip_cta` varchar(60) NOT NULL,
  PRIMARY KEY (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttipo_gasto`
--

/*!40000 ALTER TABLE `ttipo_gasto` DISABLE KEYS */;
INSERT INTO `ttipo_gasto` (`cid_tipogasto`,`cdescripcion`,`cid_usuario`,`dfecha_act`,`ccta_cont`,`cdescrip_cta`) VALUES 
 ('01','CALETAS','NELIGER','2010-11-30 18:29:44','7202030010','FLETES/VENTAS CONTRATADOS'),
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
  `crif` varchar(15) NOT NULL DEFAULT ' ',
  `cnombre` varchar(60) NOT NULL DEFAULT ' ',
  `nporc_ret` double DEFAULT '0' COMMENT 'Porcentaje de retencion de iva',
  `nid_sucursal` int(4) unsigned NOT NULL DEFAULT '0',
  `cid_usuario` varchar(20) NOT NULL DEFAULT ' ',
  `dfecha_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nactivo` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`crif`,`nid_sucursal`)
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

--
-- Dumping data for table `tusuario`
--

/*!40000 ALTER TABLE `tusuario` DISABLE KEYS */;
INSERT INTO `tusuario` (`cid_usuario`,`cnombre`,`cclave`,`nactivo`,`nfrmalmacenistas`,`nfrmanticipo_viaje`,`nfrmcargar_anticipo`,`nfrmcargar_viaje`,`nfrmcargar_viaje_ext`,`nfrmchoferes`,`nfrmciudades`,`nfrmestados`,`nfrmgasto_servicio`,`nfrmgrupos_serv`,`nfrmmontacarguistas`,`nfrmorigendestinos`,`nfrmperiodos`,`nfrmrelacion`,`nfrmrutas`,`nfrmservicios`,`nfrmsucursales`,`nfrmtipo_gastos`,`nfrmtransp_ext`,`nfrmusuarios`,`nfrmvehiculos`,`nfrmviajes`,`ncerrar_periodos`,`nmov_fperiodo`,`nanular`,`nrep_com`,`ncalc_com`,`nconfig`,`codbc_oracle`) VALUES 
 ('ADMCOC','JOHANA LOZADA','ž›’œœ',1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'ORACLE EN ORADB10G_HOME1'),
 ('ADMIN','ADMINISTRADOR','ËÍÉÍÍÈËÉÍ',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,''),
 ('JLOZADA','JOHANA LOZADA','šš',1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'ORACLE EN ORADB10G_HOME1'),
 ('MARIO','MARIO BARRIOS','’ÆÇÈ',1,0,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,1,1,0,0,'ORACLE IN ORADB10G_HOME1'),
 ('NELIGER','NELIGER ARIAS','‘œž',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,1,1,0,1,1,1,1,'ORACLE EN ORACLIENT10G_HOME1'),
 ('P','PEDRO PAPIC','È',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,'ORACLE IN ORACLIENT10G_HOME1'),
 ('RRHH','NOMINA','­­··',1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,'');
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
  PRIMARY KEY (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tvehiculo`
--

/*!40000 ALTER TABLE `tvehiculo` DISABLE KEYS */;
INSERT INTO `tvehiculo` (`cid_vehiculo`,`cdescripcion`,`cmarca`,`cserial_motor`,`cserial_carroc`,`ntara`,`ncapacidad`,`ctipo_vehic`,`ncosto`,`cid_usuario`,`dfecha_act`,`npropio`,`nactivo`,`nid_sucursal`,`crif_empext`) VALUES 
 ('01UDAY','DEMETRIO DUARTE',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:31:18',0,1,2,' '),
 ('03LTAE','KODIAK TIPO TORONTO','MV','SM','SC',17000,30000,3,0,'MARIO','2010-12-17 10:29:20',1,1,1,''),
 ('09JGAK','CAMION CHUTO 1998','MV','SM','SC',20000,31000,3,0,'P','2010-10-20 14:23:05',1,1,1,''),
 ('15-11-10','NATHALIE HIDALGO',' ',' ',' ',0,0,0,0,'P','2011-01-06 11:28:34',0,1,2,' '),
 ('22-11-10','VEHICULO',' ',' ',' ',0,0,0,0,'ADMCOC','2010-11-23 13:57:04',0,1,2,' '),
 ('26-11-20','VEHICULO',' ',' ',' ',0,0,0,0,'P','2011-01-06 11:29:45',0,1,2,' '),
 ('26-11-2010','VEHICULO',' ',' ',' ',0,0,0,0,'ADMCOC','2010-11-30 07:54:06',0,1,2,' '),
 ('2611-201','VEHICULO',' ',' ',' ',0,0,0,0,'P','2011-01-06 11:29:53',0,1,2,' '),
 ('39HDAO','GANDOLA MACK','MV','SM','SC',20000,31000,3,0,'P','2010-10-20 14:24:08',1,1,1,''),
 ('48SDAR','CHUTO  NUEVO','MV','SM','SC',20000,30000,3,0,'P','2010-10-20 14:24:57',1,1,1,''),
 ('62XPAC','CHUTO 1999','MC','SM','SC',13000,31000,3,0,'P','2010-11-12 11:58:57',1,1,1,''),
 ('65XPAC','MACK  CH613','M','SM','',20000,31000,3,0,'P','2010-10-20 14:28:24',1,1,1,''),
 ('667XGB','VP',' ',' ',' ',0,0,0,0,'P','2010-10-20 16:38:14',0,1,1,' '),
 ('66XPAC','CAMION CHUTO 1999',' ',' ',' ',0,0,0,0,'P','2010-10-30 17:08:03',0,1,1,' '),
 ('67XPAC','GANDOLA MACK','MV','SM','SC',20000,31000,3,0,'P','2010-10-20 14:29:31',1,1,1,''),
 ('68IDIBB','JOSMAN ESCALONA',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:38:10',0,1,2,' '),
 ('69UDAY','GERMAN CASTILLO',' ',' ',' ',0,0,0,0,'P','2010-11-12 16:41:58',0,1,2,' '),
 ('76SDAR','GANDOLA MACK','MV','SM','SC',20000,30000,3,0,'P','2010-10-20 15:11:44',1,1,1,''),
 ('A02AF5T','VEHICULO LIVIANO','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-12-07 17:00:25',1,1,2,''),
 ('A13AG7E','VEH. LIVIANO','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-12-08 11:33:26',1,1,2,''),
 ('A15AU5D','CAMION CHUTO','MV','SM','SC',13000,30000,3,0,'P','2010-10-20 15:25:04',1,1,1,''),
 ('A15AU7D','CAMION CHUTO','MV','SM','SC',17000,31000,3,0,'P','2010-11-11 11:30:53',1,1,1,''),
 ('A15AU8D','CAMION CHUTO','MV','SM','SC',13000,30000,3,0,'P','2010-10-20 15:25:39',1,1,1,''),
 ('A22AE2U','CAMION FURGON BLANCO AÑO 2001','MV','SM','SC',7000,13000,1,0,'ADMCOC','2010-11-15 17:51:48',1,1,2,''),
 ('A22AE3U','CAMION KODIAK','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-11-16 16:34:11',1,1,2,''),
 ('A22AE4U','CAMION FURGON','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-11-16 16:45:53',1,1,2,''),
 ('A22AE9U','VEHICULO LIVIANO','MV','SM','SC',7000,13000,1,0,'ADMCOC','2010-11-15 18:02:42',1,1,2,''),
 ('A23AE0U','CAMION FURGON 2007 COLOR BLANCO','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-11-17 17:07:39',1,1,2,''),
 ('A23AE1U','VEICULO LIVIANO','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-12-13 18:22:34',1,1,2,''),
 ('A23AE2U','VEHICULO LIVIANO','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-11-17 11:19:17',1,1,2,''),
 ('A23AE3U','CHEVROLET MOD-FVR-CHASIS CABINA','MV','SM','SC',7000,13000,1,0,'ADMIN','2010-12-03 11:59:24',1,1,2,''),
 ('A23AE4U','VEH.LIVIANO','MV','SM','SC',7000,13000,1,0,'MARIO','2010-12-15 11:25:10',1,1,2,''),
 ('A23AE5U','KODIAK - FURGON','N/T','N/T','N/T',7000,13000,1,0,'MARIO','2010-11-29 18:29:07',1,1,2,''),
 ('A46AG7E','KODIAK','MV','SM','SC',7000,13000,1,0,'ADMCOC','2010-11-16 14:22:10',1,1,2,''),
 ('A62AA9D','CAMION  MACK','MV','SM','SC',13000,30000,3,0,'P','2010-10-20 15:26:13',1,1,1,''),
 ('A64AE3E','CAMION-CHASIS','MV','SM','SC',15000,30000,3,0,'P','2010-10-20 15:27:24',1,1,1,''),
 ('A67AE8E','KODIAK.VEH.MEDIANO','MV','SM','SC',7000,19000,2,0,'ADMIN','2010-12-16 16:07:15',1,1,2,''),
 ('A68AE5E','CAMION -CHEVROLET MOD-FVR','N/T','N/T','',7000,13000,1,0,'MARIO','2010-11-30 09:07:40',1,1,2,''),
 ('A71AE4E','CAMION CHEVROLET CAVA 2001','MC','SM','SC',7000,13000,1,0,'ADMCOC','2010-11-15 17:35:32',1,1,2,''),
 ('A72AE3E','VEH LIVIANO','MV','SM','SC',7000,13000,1,0,'ADMCOC','2010-11-16 14:19:55',1,1,2,''),
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
  `nid_viaje` int(14) unsigned NOT NULL DEFAULT '0',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `dfecha` date DEFAULT NULL,
  `cobservacion` text,
  `cguia` varchar(10) DEFAULT ' ',
  `corden_carga` varchar(10) DEFAULT ' ',
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
  `npeso_com` double DEFAULT '0' COMMENT 'Peso para calcular comisiones. Si el peso neto es menor al peso minimo en tconfig para el tipo de vehic, se guarda el peso de tconfig correspondiente, sino se guarda el npeso_neto',
  PRIMARY KEY (`nid_viaje`),
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
INSERT INTO `tviaje` (`nid_viaje`,`cid_chofer`,`cid_vehiculo`,`dfecha`,`cobservacion`,`cguia`,`corden_carga`,`dfecha_guia`,`npeso_neto`,`cid_usuario`,`dfecha_act`,`nid_origen`,`nid_destino`,`cid_periodo`,`ntipo_viaje`,`nid_sucursal_guia`,`ndistancia`,`nstatus`,`cfactura_ext`,`ccliente_ext`,`nid_sucursal_c`,`nid_sucursal_v`,`npeso_com`) VALUES 
 (100000001,'11081499','03LTAE','2010-12-15','','17402','18722','2010-12-02',28000,'MARIO','2011-01-04 18:26:22',1,3,'122010',1,1,343,1,'','',2,1,28000),
 (100000002,'5426026','A15AU7D','2011-01-11','','15271','16451','2010-08-14',31380,'P','2011-01-11 08:48:57',1,88,'122010',1,1,440,1,'','',1,1,31380),
 (100000003,'5426026','A15AU7D','2011-01-11','','15312','16498','2010-08-17',31410,'P','2011-01-11 08:51:21',1,5,'122010',1,1,628,1,'','',1,1,31410),
 (100000004,'5426026','A15AU7D','2011-01-11','','','','2010-08-18',28560,'P','2011-01-11 08:51:21',39,40,'122010',2,0,628,1,'303200','CEMEX',1,1,28560),
 (100000005,'5426026','A15AU7D','2011-01-11','','15515','16712','2010-08-27',34870,'P','2011-01-11 10:46:47',1,3,'122010',1,1,343,1,'','',1,1,34870),
 (100000006,'5426026','A15AU7D','2011-01-11','','15391','16584','2010-08-20',32940,'P','2011-01-11 11:06:00',1,37,'122010',1,1,916,1,'','',1,1,32940),
 (100000007,'5426026','A15AU7D','2011-01-11','','','','2010-08-25',28560,'P','2011-01-11 11:06:00',39,40,'122010',2,0,628,1,'306891','CEMEX',1,1,28560),
 (100000008,'5426026','A15AU7D','2011-01-11','','15515','16712','2010-08-27',34870,'P','2011-01-11 11:06:58',1,3,'122010',1,1,343,1,'','',1,1,34870),
 (100000009,'5426026','A15AU7D','2011-01-11','','15569','16771','2010-08-31',31290,'P','2011-01-11 11:09:04',1,31,'122010',1,1,400,1,'','',1,1,31290),
 (100000010,'5426026','A15AU7D','2011-01-11','','15629','16845','2010-09-02',30210,'P','2011-01-11 11:11:03',1,90,'122010',1,1,330,1,'','',1,1,30210),
 (100000011,'5426026','A15AU7D','2011-01-11','','15663','16885','2010-09-04',30270,'P','2011-01-11 11:13:46',1,23,'122010',1,1,473,1,'','',1,1,30270),
 (100000012,'5426026','62XPAC','2011-01-11','','15735','16957','2010-09-08',30250,'P','2011-01-11 11:14:34',1,89,'122010',1,1,193,1,'','',1,1,30250),
 (100000013,'5426026','A15AU7D','2011-01-11','','15845','17066','2010-09-14',31040,'P','2011-01-11 11:15:23',1,5,'122010',1,1,628,1,'','',1,1,31040),
 (100000014,'5426026','A15AU7D','2011-01-11','','15815','17023','2010-09-11',31450,'P','2011-01-11 11:16:00',1,6,'122010',1,1,440,1,'','',1,1,31450),
 (100000015,'9562700','A86AA0D','2011-01-31','bien','15280','16466','2010-08-14',30150,'ADMIN','2011-01-31 11:12:27',1,14,'167',1,1,371,1,'','',1,1,0),
 (100000016,'14000037','09JGAK','2011-01-31','','','','2011-01-02',0,'P','2011-01-31 16:06:56',1,14,'167',2,0,371,1,'987','321',1,1,0),
 (100000017,'14000037','03LTAE','2011-02-15','','','','2011-02-15',700,'P','2011-02-15 17:48:37',1,10,'167',2,0,172,1,'777','321',1,1,700),
 (200000001,'16346069','A71AE4E','2010-11-15','\r\n\r\n\r\n\r\n','3397','3577','2010-11-15',12320,'ADMCOC','2011-01-04 18:26:22',1,57,'122010',1,2,300,1,'','',2,2,12320),
 (200000002,'11081499','A22AE2U','2010-11-15','(2repartos)','3399','3580','2010-11-15',13040,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,13040),
 (200000003,'11542453','A22AE9U','2010-11-15','(3 repartos)\r\n','3400','3581','2010-11-15',12500,'ADMCOC','2011-01-04 18:26:22',1,70,'122010',1,2,188,1,'','',2,2,12500),
 (200000004,'16751579','A72AE3E','2010-11-16','(5 repartos)\r\n','3403','3584','2010-11-16',12930,'ADMCOC','2011-01-04 18:26:22',1,54,'122010',1,2,320,1,'','',2,2,12930),
 (200000005,'16966899','A46AG7E','2010-11-16','(1 reparto)\r\n','3401','3585','2010-11-16',12950,'ADMCOC','2011-01-04 18:26:22',1,24,'122010',1,2,300,1,'','',2,2,12950),
 (200000006,'9347051','A67AE8E','2010-11-16','(3 repartos)','3406','3587','2010-11-16',19460,'ADMCOC','2011-01-04 18:26:22',1,87,'122010',1,2,432,1,'','',2,2,19460),
 (200000007,'12262801','A22AE3U','2010-11-16','(8 repartos)','3404','3582','2010-11-16',12530,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12530),
 (200000008,'15340627','A22AE4U','2010-11-16','(7 repartos)','3402','3583','2010-11-16',12090,'ADMCOC','2011-01-04 18:26:22',1,66,'122010',1,2,30,1,'','',2,2,12090),
 (200000009,'8103812','A23AE2U','2010-11-17','(13 repartos)','3407','3588','2010-11-17',12410,'ADMCOC','2011-01-04 18:26:22',1,72,'122010',1,2,226,1,'','',2,2,12410),
 (200000010,'12446697','A23AE0U','2010-11-17','(1 reparto)','3408','3589','2010-11-17',13060,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13060),
 (200000011,'11081499','A22AE2U','2010-11-17','(4 repartos)','3411','3592','2010-11-17',12220,'ADMCOC','2011-01-04 18:26:22',1,40,'122010',1,2,1,1,'','',2,2,12220),
 (200000012,'16346069','A71AE4E','2010-11-18','(5 repartos)','3414','3595','2010-11-18',12980,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12980),
 (200000013,'15340627','A22AE4U','2010-11-18','(5 repartos) valera-carvajal\r\n','3413','3596','2010-11-18',12180,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12180),
 (200000014,'12262801','A22AE3U','2010-11-18','(1 reparto)\r\n','3416','3597','2010-11-18',12560,'ADMCOC','2011-01-04 18:26:22',1,47,'122010',1,2,230,1,'','',2,2,12560),
 (200000015,'9347051','A67AE8E','2010-11-18','(5 repartos) Barinas-Barinitas \r\n','3417','3598','2010-11-18',19240,'ADMCOC','2011-01-04 18:26:22',1,50,'122010',1,2,206,1,'','',2,2,19240),
 (200000016,'16966899','A46AG7E','2010-11-18','(7 REPARTOS)','3418','3599','2010-11-18',13070,'ADMCOC','2011-01-04 18:26:22',1,40,'122010',1,2,1,1,'','',2,2,13070),
 (200000017,'11081499','A22AE2U','2010-11-18','(8 REPARTOS)','3419','3600','2010-11-18',12750,'ADMCOC','2011-01-04 18:26:22',1,74,'122010',1,2,127,1,'','',2,2,12750),
 (200000018,'11542453','A22AE9U','2010-11-19','(9 repartos)','3412','3593','2010-11-17',12930,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12930),
 (200000019,'16751579','A72AE3E','2010-11-19','(12 repartos) acarigua-piritu-turen-ospino','3421','3602','2010-11-19',12260,'ADMCOC','2011-01-04 18:26:22',1,68,'122010',1,2,47,1,'','',2,2,12260),
 (200000020,'12446697','A23AE0U','2010-11-19','(12 repartos) guanare-guanarito','3424','3603','2010-11-19',12570,'ADMCOC','2011-01-04 18:26:22',1,63,'122010',1,2,185,1,'','',2,2,12570),
 (200000021,'11542453','A22AE9U','2010-11-19','(12 repartos)','3425','3605','2010-11-19',12750,'ADMCOC','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12750),
 (200000022,'8103812','A23AE2U','2010-11-19','( 7  repartos)','3426','3607','2010-11-19',12370,'ADMCOC','2011-01-04 18:26:22',1,79,'122010',1,2,480,1,'','',2,2,12370),
 (200000023,'12262801','A22AE3U','2010-11-19','(8 repartos) no se crea de destino de siquisiqui por tan motivo se coloco destino de carora conversado con pedro papic','3427','3608','2010-11-19',13060,'ADMCOC','2011-01-04 18:26:22',1,70,'122010',1,2,188,1,'','',2,2,13060),
 (200000024,'15340627','A22AE4U','2010-11-22','(12repartos)','3429','3609','2010-11-20',13050,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13050),
 (200000025,'16966899','A46AG7E','2010-11-22','(9 repartos)','3431','3610','2010-11-20',12740,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12740),
 (200000026,'9347051','A67AE8E','2010-11-22','(6 repartos)','3432','3611','2010-11-20',19680,'ADMCOC','2011-01-04 18:26:22',1,79,'122010',1,2,480,1,'','',2,2,19680),
 (200000027,'16346069','A71AE4E','2010-11-22','(12 repartos)','3433','3612','2010-11-20',12710,'ADMCOC','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12710),
 (200000028,'11081499','A22AE2U','2010-11-22','(3 repartos)','3430','3613','2010-11-20',12980,'ADMCOC','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,12980),
 (200000029,'11081499','A22AE2U','2010-11-22','(1 reparto)','3435','3616','2010-11-22',12550,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12550),
 (200000030,'16966899','A46AG7E','2010-11-23','( 4 repartos)','3438','3622','2010-11-23',12790,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12790),
 (200000031,'12262801','A22AE3U','2010-11-23','9 REPARTOS GUANARE-PEDRAZA','3439','3624','2010-11-23',12900,'ADMCOC','2011-01-04 18:26:22',1,51,'122010',1,2,247,1,'','',2,2,12900),
 (200000032,'8103812','A23AE2U','2010-11-23','(8 REPARTOS) MERCABAR-BQTO','3440','3625','2010-11-23',12660,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12660),
 (200000033,'11542453','A22AE9U','2010-11-23','(5 REPARTOS) SAN FELIPE','3437','3618','2010-11-23',12830,'ADMCOC','2011-01-04 18:26:22',1,26,'122010',1,2,157,1,'','',2,2,12830),
 (200000034,'15340627','A22AE4U','2010-11-23','(7 REPARTOS) CIUDAD DE NUTRIAS','3442','3623','2010-11-23',12210,'ADMCOC','2011-01-04 18:26:22',1,78,'122010',1,2,294,1,'','',2,2,12210),
 (200000035,'12446697','A23AE0U','2010-11-23','(1 REPARTO VALERA)','3441','3620','2010-11-23',12360,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12360),
 (200000036,'16751579','A72AE3E','2010-11-23','(6 REPARTOS BQTO)','3443','3626','2010-11-23',12430,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12430),
 (200000037,'9347051','A67AE8E','2010-11-23','(1 REPARTO)','3444','3621','2010-11-23',19850,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,19850),
 (200000038,'16346069','A71AE4E','2010-11-23','(9 REPARTOS BQTO-MERCABAR)','3445','3619','2010-11-23',12790,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12790),
 (200000039,'11081499','A22AE2U','2010-11-24','(7 REPARTOS SAN FELIPE)','3446','3628','2010-11-24',12240,'ADMCOC','2011-01-04 18:26:22',1,26,'122010',1,2,157,1,'','',2,2,12240),
 (200000040,'15340627','A22AE4U','2010-11-25','( 7 repartos barinas)','3450','3633','2010-11-25',12930,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12930),
 (200000041,'16751579','A72AE3E','2010-11-25','(1 reparto san felipe)','3451','3631','2010-11-25',12000,'ADMCOC','2011-01-04 18:26:22',1,26,'122010',1,2,157,1,'','',2,2,12000),
 (200000042,'16346069','A71AE4E','2010-11-25','(9 REPARTOS BARINAS-BARINITAS)','3452','3634','2010-11-25',13050,'ADMCOC','2011-01-04 18:26:22',1,50,'122010',1,2,206,1,'','',2,2,13050),
 (200000043,'11542453','A22AE9U','2010-11-25','(7 REPARTOS BQTO)','3448','3629','2010-11-25',12400,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12400),
 (200000044,'12262801','A22AE3U','2010-11-25','(8 REPARTOS BQTO)','3453','3632','2010-11-25',12590,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12590),
 (200000045,'12446697','A23AE0U','2010-11-25','(9 REPARTOS  ACARIGUA-PAYARA)','3454','3638','2010-11-25',12280,'ADMCOC','2011-01-04 18:26:22',1,65,'122010',1,2,11,1,'','',2,2,12280),
 (200000046,'9347051','A67AE8E','2010-11-25','(1 REPARTO BARINAS)','3456','3637','2010-11-25',19940,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,19940),
 (200000047,'16966899','A46AG7E','2010-11-25','(8 REP. MOTATAN-VALERA-PAMPAN-PAMPANITO-MONAY-CARVAJAL)','3457','3639','2010-11-25',12860,'ADMCOC','2011-01-04 18:26:22',1,54,'122010',1,2,320,1,'','',2,2,12860),
 (200000048,'8103812','A23AE2U','2010-11-26','(7 rep bqto)','3449','3630','2010-11-25',13000,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13000),
 (200000049,'11081499','A22AE2U','2010-11-26','(12 repartos bqto)','3462','3644','2010-11-26',12080,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12080),
 (200000050,'11542453','A22AE9U','2010-11-26','(12 repartos el destino es urachiche no se ha creado todavia)','3468','3650','2010-11-27',12560,'ADMCOC','2011-01-04 18:26:22',1,80,'122010',1,2,130,1,'','',2,2,12560),
 (200000051,'15340627','A22AE4U','2010-11-29','(1 reparto acarigua)','3473','3655','2010-11-29',12310,'ADMCOC','2011-01-04 18:26:22',1,40,'122010',1,2,1,1,'','',2,2,12310),
 (200000052,'12262801','A22AE3U','2010-11-29','(4 repartos socopo)','3467','3649','2010-11-27',12980,'ADMCOC','2011-01-04 18:26:22',1,45,'122010',1,2,279,1,'','',2,2,12980),
 (200000053,'9347051','A67AE8E','2010-11-29','(2 REPARTOS SOCOPO)','3466','3646','2010-11-27',19080,'ADMCOC','2011-01-04 18:26:22',1,45,'122010',1,2,279,1,'','',2,2,19080),
 (200000054,'16751579','A72AE3E','2010-11-29','(6 REPARTOS BQTO-MERCABAR)','3465','3651','2010-11-27',12910,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12910),
 (200000055,'16346069','A71AE4E','2010-11-29','(12 REPARTOS BQTO-CABUDARE)','3474','3656','2010-11-29',12840,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12840),
 (200000056,'11542453','A23AE5U','2010-11-29','2 REPARTOS','3376','3557','2010-11-11',12840,'MARIO','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12840),
 (200000057,'8103812','A23AE2U','2010-11-30','(1 repartos socopo)','3464','3648','2010-11-27',12860,'ADMCOC','2011-01-04 18:26:22',1,45,'122010',1,2,279,1,'','',2,2,12860),
 (200000058,'11542453','A22AE9U','2010-11-30','8 repartos','3386','3567','2010-11-12',12460,'MARIO','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12460),
 (200000059,'16751579','A72AE3E','2010-11-30','(3 repartos barinas)','3476','3658','2010-11-30',12870,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12870),
 (200000060,'11542453','A22AE9U','2010-11-30','(5 repartos santa barbara)','3479','3662','2010-11-30',12910,'ADMCOC','2011-01-04 18:26:22',1,46,'122010',1,2,332,1,'','',2,2,12910),
 (200000061,'9347051','A67AE8E','2010-11-30','(1 REPARTO BQTO)','3478','3659','2010-11-30',19740,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,19740),
 (200000062,'16966899','A46AG7E','2010-11-30','(1 REPARTO BQTO)','3477','3660','2010-11-30',13090,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13090),
 (200000063,'12446697','A23AE0U','2010-11-30','(12 REP GUANARE-GUANARITO)','3475','3657','2010-11-30',12740,'ADMCOC','2011-01-04 18:26:22',1,63,'122010',1,2,185,1,'','',2,2,12740),
 (200000064,'12262801','A22AE3U','2010-11-30','(1 REP ACARIGUA)','3481','3664','2010-11-30',13010,'ADMCOC','2011-01-04 18:26:22',1,40,'122010',1,2,1,1,'','',2,2,13010),
 (200000065,'15340627','A22AE4U','2010-11-30','(5 REP CABUDARE-BQTO)','3482','3665','2010-11-30',12580,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12580),
 (200000066,'8103812','A23AE2U','2010-11-30','(12 REP ACARIGUA-AGUA B-SAN R-APARTADERO)','3483','3661','2010-11-30',13050,'ADMCOC','2011-01-04 18:26:22',1,34,'122010',1,2,47,1,'','',2,2,13050),
 (200000067,'16751579','A72AE3E','2010-12-01','(2 Rep Valera)','3485','3667','2010-12-01',12550,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12550),
 (200000068,'9347051','A67AE8E','2010-12-01','(1 REPARTO BQTO)','3486','3673','2010-12-01',19630,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,19630),
 (200000069,'16966899','A46AG7E','2010-12-01','(5 REP GUANARE-BARINAS)','3488','3668','2010-12-01',12260,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12260),
 (200000070,'16346069','A71AE4E','2010-12-01','(3 REP LA MIEL-BQTO)','3487','3674','2010-12-01',12470,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12470),
 (200000071,'12446697','A23AE0U','2010-12-02','(2 REP EL AMPARO)','3489','3670','2010-12-02',12630,'ADMCOC','2011-01-04 18:26:22',1,81,'122010',1,2,527,1,'','',2,2,12630),
 (200000072,'11081499','A22AE2U','2010-12-02','(6 REP VALERA)','3480','3663','2010-11-30',12710,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,3,'','',2,2,12710),
 (200000073,'8103812','A23AE2U','2010-12-02','(2 REP BQTO)','3490','3675','2010-12-02',12320,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12320),
 (200000074,'11542453','A22AE9U','2010-12-02','(2 REP-GUASDUALITO-EL AMPARO)','3491','3669','2010-12-02',13070,'ADMCOC','2011-01-04 18:26:22',1,81,'122010',1,2,527,1,'','',2,2,13070),
 (200000075,'15340627','A22AE4U','2010-12-02','(12 REP CHIVACOA-SABANA DE PARRA-SAN FELIPE)','3492','3672','2010-12-02',12460,'ADMCOC','2011-01-04 18:26:22',1,26,'122010',1,2,157,1,'','',2,2,12460),
 (200000076,'9347051','A67AE8E','2010-12-02','(2 REP EL AMPARO)','3493','3676','2010-12-02',19800,'ADMCOC','2011-01-04 18:26:22',1,81,'122010',1,2,527,1,'','',2,2,19800),
 (200000077,'16346069','A71AE4E','2010-12-02','(3 REP SARARE-BQTO)','3494','3679','2010-12-02',12350,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12350),
 (200000078,'16751579','A72AE3E','2010-12-03','(1 REP BARINAS)','3495','3678','2010-12-03',12630,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12630),
 (200000079,'8103812','A23AE2U','2010-12-03','(3 REP BRUZUAL)','3499','3682','2010-12-03',12210,'ADMCOC','2011-01-04 18:26:22',1,78,'122010',1,2,294,1,'','',2,2,12210),
 (200000080,'16966899','A46AG7E','2010-12-03','(7 REP DUACA)','3500','3686','2010-12-03',12630,'ADMCOC','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12630),
 (200000081,'16346069','A71AE4E','2010-12-03','(8 REP BQTO)','3503','3685','2010-12-04',13000,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13000),
 (200000082,'9347051','A67AE8E','2010-12-03','(7 REP CANC VIAJE A MESA DE CAVACA ESTA PENDIENTE POR CREAR DESTINO)','3509','3687','2010-12-04',19310,'ADMCOC','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,19310),
 (200000083,'12446697','A23AE0U','2010-12-03','( 8REP DUACA)','3504','3684','2010-12-04',12390,'ADMCOC','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12390),
 (200000084,'11542453','A22AE9U','2010-12-03','(12 REP CANC VIAJE HASTA CHABASQUEN ESTA PENDIENTE CREAR DESTINO)','3506','3680','2010-12-04',12930,'ADMCOC','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,12930),
 (200000085,'15340627','A22AE4U','2010-12-03','(2 REP BARINAS)','3510','3683','2010-12-04',12940,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12940),
 (200000086,'16751579','A72AE3E','2010-12-03','(3 REP BQTO-MERCABAR)','3508','3690','2010-12-04',12680,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12680),
 (200000087,'11081499','A22AE2U','2010-12-03','(1 REP LIBERTAD)','3507','3694','2010-12-04',12800,'ADMCOC','2011-01-04 18:26:22',1,47,'122010',1,2,230,1,'','',2,2,12800),
 (200000088,'15340627','A22AE4U','2010-12-06','(2 Rep Caja seca-Nva Bolivia)','3511','3697','2010-12-06',12800,'ADMCOC','2011-01-04 18:26:22',1,79,'122010',1,2,480,1,'','',2,2,12800),
 (200000089,'12262801','A22AE3U','2010-12-06','(5 Rep- Sabana de Parra-San Felipe)','3512','3696','2010-12-06',12830,'ADMCOC','2011-01-04 18:26:22',1,26,'122010',1,2,157,1,'','',2,2,12830),
 (200000090,'12262801','A23AE3U','2010-12-06','(1 Rep Bqto)','3498','3681','2010-12-03',12090,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12090),
 (200000091,'16751579','A72AE3E','2010-12-06','(8 Rep-La Miel-Cabudare-Bqto)','3513','3698','2010-12-06',12700,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12700),
 (200000092,'16966899','A46AG7E','2010-12-07','','3392','3571','2010-11-13',12960,'MARIO','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,12960),
 (200000093,'9347051','A67AE8E','2010-12-07','(2 rep Acarigua)','3514','3699','2010-12-07',19640,'ADMCOC','2011-01-04 18:26:22',1,40,'122010',1,2,1,1,'','',2,2,19640),
 (200000094,'12446697','A23AE0U','2010-12-07','(2 Rep Buena Vista-Arapuey)','3515','3705','2010-12-07',13010,'ADMCOC','2011-01-04 18:26:22',1,52,'122010',1,2,325,1,'','',2,2,13010),
 (200000095,'11542453','A22AE9U','2010-12-07','(6 Rep - Bqto)','3517','3704','2010-12-07',13220,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13220),
 (200000096,'16966899','A46AG7E','2010-12-07','(4 Rep- Libertad- Dolores)','3519','3701','2010-12-07',12160,'ADMCOC','2011-01-04 18:26:22',1,49,'122010',1,2,380,1,'','',2,2,12160),
 (200000097,'8103812','A23AE2U','2010-12-07','(3 Rep Nueva Bolivia- Caja Seca)','3520','3703','2010-12-07',12300,'ADMCOC','2011-01-04 18:26:22',1,79,'122010',1,2,480,1,'','',2,2,12300),
 (200000098,'13072039','A02AF5T','2010-12-07','(3 Rep-Mercabar-Bqto)','3521','3707','2010-12-07',12100,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12100),
 (200000099,'16346069','A68AE5E','2010-12-07','(4 Rep Nueva Bolivia-Caja Seca)','3522','3709','2010-12-07',12990,'ADMCOC','2011-01-04 18:26:22',1,79,'122010',1,2,480,1,'','',2,2,12990),
 (200000100,'10637589','A13AG7E','2010-12-08','( 2 Rep Bqto)','3523','3711','2010-12-08',12660,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12660),
 (200000101,'12262801','A22AE3U','2010-12-08','(1 Rep Bqto)','3524','3710','2010-12-08',12840,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12840),
 (200000102,'9347051','A67AE8E','2010-12-08','(1 Rep Cja Seca)','3525','3712','2010-12-08',19840,'ADMCOC','2011-01-04 18:26:22',1,79,'122010',1,2,480,1,'','',2,2,19840),
 (200000103,'12262801','A22AE2U','2010-12-08','\r\n REEMPLAZO DEL ANTICIPO NÚMERO: 200000075','3480','3663','2010-11-30',12710,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12710),
 (200000104,'8103812','A23AE2U','2010-12-08','','3394','3573','2010-11-13',12980,'MARIO','2011-01-04 18:26:22',1,57,'122010',1,2,300,1,'','',2,2,12980),
 (200000105,'15340627','A22AE4U','2010-12-08','(7 Rep Via Duaca-Duaca-Bqto)','3526','3708','2010-12-08',12610,'ADMCOC','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12610),
 (200000106,'16751579','A72AE3E','2010-12-08','(8 Rep Mercabar-Bqto)','3527','3713','2010-12-08',12780,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12780),
 (200000107,'13072039','A02AF5T','2010-12-09','(2 Rep Sta Polonia-La Ceiba) Cancelar viaje hasta la ceiba pendiente por crear la  ruta por el sr Pedro Papic','3528','3714','2010-12-09',12970,'ADMCOC','2011-01-04 18:26:22',1,57,'122010',1,2,300,1,'','',2,2,12970),
 (200000108,'11542453','A22AE9U','2010-12-09','(4 REP BQTO)','3529','3716','2010-12-09',12320,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12320),
 (200000109,'8103812','A23AE2U','2010-12-09','(4 Rep Capitanejo-El Amparo)','3533','3718','2010-12-09',12630,'ADMCOC','2011-01-04 18:26:22',1,81,'122010',1,2,527,1,'','',2,2,12630),
 (200000110,'16966899','A46AG7E','2010-12-09','(3 Rep Valera)','3530','3717','2010-12-09',12960,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12960),
 (200000111,'11081499','A22AE2U','2010-12-09','(4 REP VALERA)','3532','3720','2010-12-09',12190,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12190),
 (200000112,'12446697','A23AE0U','2010-12-10','','3378','3558','2010-11-11',12280,'MARIO','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12280),
 (200000113,'16751579','A72AE3E','2010-12-10','','3388','3569','2010-11-12',12230,'MARIO','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12230),
 (200000114,'12262801','A22AE3U','2010-12-10','(1 Rep Barinas)','3534','3723','2010-12-10',12770,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12770),
 (200000115,'12446697','A23AE0U','2010-12-10','(2 Rep Bqto Mercabar)','3536','3721','2010-12-10',12570,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12570),
 (200000116,'16346069','A71AE4E','2010-12-10','(Rep Bqto-Mercabar)','3535','3722','2010-12-10',12020,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12020),
 (200000117,'16751579','A72AE3E','2010-12-10','(3 Rep Guanare)','3537','3724','2010-12-10',12820,'ADMCOC','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,12820),
 (200000118,'15340627','A22AE4U','2010-12-10','(5 Rep Guanare)','3538','3725','2010-12-10',12360,'ADMCOC','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,12360),
 (200000119,'9347051','A67AE8E','2010-12-10','(2 Rep Caja Seca-Nva Bolivia)','3539','3726','2010-12-10',19380,'ADMCOC','2011-01-04 18:26:22',1,79,'122010',1,2,480,1,'','',2,2,19380),
 (200000120,'10637589','A13AG7E','2010-12-10','(6 Rep Bqto)','3540','3728','2010-12-10',12440,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12440),
 (200000121,'11542453','A22AE9U','2010-12-10','(9 REP SAN FELIPE)','3542','3729','2010-12-10',12440,'ADMCOC','2011-01-04 18:26:22',1,26,'122010',1,2,157,1,'','',2,2,12440),
 (200000122,'16966899','A46AG7E','2010-12-10','(6 REP GUANARE)','3545','3732','2010-12-11',12540,'ADMCOC','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,12540),
 (200000123,'11081499','A22AE2U','2010-12-10','(6 REP BARRANCAS-BARINAS)','3544','3731','2010-12-11',13050,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,13050),
 (200000124,'8103812','A23AE2U','2010-12-10','(6 REP ACARIGUA)','3546','3734','2010-12-11',12740,'ADMCOC','2011-01-04 18:26:22',1,40,'122010',1,2,1,1,'','',2,2,12740),
 (200000125,'16751579','A72AE3E','2010-12-13','(5 REP BARINAS)','3548','3735','2010-12-13',12730,'ADMCOC','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12730),
 (200000126,'16346069','A68AE5E','2010-12-13','(6 REP ACARIGUA-PAYARA)','3549','3736','2010-12-13',13010,'ADMCOC','2011-01-04 18:26:22',1,65,'122010',1,2,11,1,'','',2,2,13010),
 (200000127,'12262801','A22AE3U','2010-12-13','(1 REP VALERA)','3551','3737','2010-12-13',12960,'ADMCOC','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12960),
 (200000128,'12446697','A23AE0U','2010-12-13','','3365','3546','2010-11-09',12620,'MARIO','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12620),
 (200000129,'10637589','A13AG7E','2010-12-13','','3353','3530','2010-11-06',12320,'MARIO','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12320),
 (200000130,'10637589','A13AG7E','2010-12-13','','3344','3521','2010-11-05',12550,'MARIO','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12550),
 (200000131,'12446697','A23AE1U','2010-12-13','','3280','3461','2010-10-23',12170,'MARIO','2011-01-04 18:26:22',1,33,'122010',1,2,320,1,'','',2,2,12170),
 (200000132,'10637589','A13AG7E','2010-12-14','(5 REP SABANA MENDOZA)','3552','3742','2010-12-14',12770,'ADMCOC','2011-01-04 18:26:22',1,57,'122010',1,2,300,1,'','',2,2,12770),
 (200000133,'13072039','A02AF5T','2010-12-14','(4 REP BQTO-CABUDARE)','3553','3740','2010-12-14',12930,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12930),
 (200000134,'11081499','A22AE2U','2010-12-14','(8 REP GUANARE)','3556','3746','2010-12-14',12600,'ADMCOC','2011-01-04 18:26:22',1,21,'122010',1,2,82,1,'','',2,2,12600),
 (200000135,'16751579','A72AE3E','2010-12-14','(5 REP BARINAS-BARINITAS)','3548','3735','2010-12-13',12730,'ADMCOC','2011-01-04 18:26:22',1,50,'122010',1,2,206,1,'','',2,2,12730),
 (200000136,'12446697','A23AE0U','2010-12-14','(4 REP BQTO)','3557','3745','2010-12-14',12900,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12900),
 (200000137,'9347051','A67AE8E','2010-12-14','(8 REP GUANARE-GUANARITO)','3554','3739','2010-12-14',20090,'ADMCOC','2011-01-04 18:26:22',1,63,'122010',1,2,185,1,'','',2,2,20090),
 (200000138,'16966899','A46AG7E','2010-12-14','(6 REP MERCABAR-BQTO)','3558','3741','2010-12-14',12490,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12490),
 (200000139,'8103812','A23AE2U','2010-12-14','(5 REP BARQUISIMETO)','3559','3744','2010-12-14',13060,'ADMCOC','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13060),
 (200000140,'9347051','A23AE4U','2010-12-15','','3390','3572','2010-11-13',12910,'MARIO','2011-01-04 18:26:22',1,17,'122010',1,2,319,1,'','',2,2,12910),
 (200000141,'16751579','A72AE3E','2010-12-15','(4 REP GUANARE-BARINAS)','3560','3747','2010-12-15',12280,'JLOZADA','2011-01-04 18:26:22',1,10,'122010',1,2,172,1,'','',2,2,12280),
 (200000142,'16346069','A68AE5E','2010-12-15','(5 REP STA BARBARA)','3561','3748','2010-12-15',12890,'JLOZADA','2011-01-04 18:26:22',1,46,'122010',1,2,332,1,'','',2,2,12890),
 (200000143,'12446697','A23AE1U','2010-12-15','','3280','3461','2010-10-23',12170,'MARIO','2011-01-04 18:26:22',1,54,'122010',1,2,320,1,'','',2,2,12170),
 (200000144,'11542453','A23AE5U','2010-12-15','(7 REP BQTO-DUACA)','3563','3750','2010-12-15',12480,'JLOZADA','2011-01-04 18:26:22',1,71,'122010',1,2,136,1,'','',2,2,12480),
 (200000145,'13072039','A02AF5T','2010-12-15','(5 REP ACARIGUA)','3547','3733','2010-12-11',12610,'JLOZADA','2011-01-04 18:26:22',1,40,'122010',1,2,1,1,'','',2,2,12610),
 (200000146,'13072039','A02AF5T','2010-12-15','(4 REP SOCOPO-STA BARBARA)','3564','3749','2010-12-15',12700,'JLOZADA','2011-01-04 18:26:22',1,46,'122010',1,2,332,1,'','',2,2,12700),
 (200000147,'12262801','A22AE3U','2010-12-15','(8 REP BQTO-CADUDARE)','3565','3751','2010-12-15',12500,'JLOZADA','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12500),
 (200000148,'12446697','A23AE0U','2010-12-15','(5 REP BETIJOQUE-VALERA)','3566','3753','2010-12-15',12410,'JLOZADA','2011-01-04 18:26:22',1,53,'122010',1,2,392,1,'','',2,2,12410),
 (200000149,'11081499','A22AE2U','2010-12-16','(2 REP BQTO)','3567','3759','2010-12-16',12550,'JLOZADA','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,12550),
 (200000150,'8103812','A23AE2U','2010-12-16','(1 REP BQTO)','3568','3758','2010-12-16',13150,'JLOZADA','2011-01-04 18:26:22',1,16,'122010',1,2,86,1,'','',2,2,13150),
 (200000151,'16966899','A46AG7E','2010-12-16','(12 REP BQTO-EL TOCUYO)','3569','3754','2010-12-16',12720,'JLOZADA','2011-01-04 18:26:22',1,72,'122010',1,2,226,1,'','',2,2,12720),
 (200000152,'9347051','A67AE8E','2010-12-16','(6 REP BOCONO)','3570','3755','2010-12-16',19590,'JLOZADA','2011-01-04 18:26:22',1,58,'166',1,2,400,1,'','',2,2,19590),
 (200000153,'10637589','A13AG7E','2010-12-16','(12 REP CARORA)','3571','3756','2010-12-16',13060,'JLOZADA','2011-01-04 18:26:22',1,70,'166',1,2,188,1,'','',2,2,13060),
 (200000154,'12262801','A22AE3U','2010-12-17','(1 REP VALERA)','3574','3764','2010-12-17',12970,'JLOZADA','2011-01-04 18:26:22',1,33,'166',1,2,320,1,'','',2,2,12970),
 (200000155,'11542453','A23AE5U','2010-12-17','(12 REP BQTO)','3575','3769','2010-12-17',13020,'JLOZADA','2011-01-04 18:26:22',1,16,'166',1,2,86,1,'','',2,2,13020),
 (200000156,'16346069','A68AE5E','2010-12-17','(8 REP BQTO)','3577','3775','2010-12-17',12920,'JLOZADA','2011-01-04 18:26:22',1,16,'166',1,2,86,1,'','',2,2,12920),
 (200000157,'8103812','A23AE2U','2010-12-17','(2 REP VALERA)','3581','3762','2010-12-18',12930,'JLOZADA','2011-01-04 18:26:22',1,33,'166',1,2,320,1,'','',2,2,12930),
 (200000158,'13072039','A02AF5T','2010-12-17','(4 REP VALERA-TRUJILLO)','3579','3768','2010-12-17',12520,'JLOZADA','2011-01-04 18:26:22',1,33,'166',1,2,320,1,'','',2,2,12520),
 (200000159,'16751579','A72AE3E','2010-12-17','(1 REP CARVAJAL)','3580','3763','2010-12-17',12740,'JLOZADA','2011-01-04 18:26:22',1,54,'166',1,2,320,1,'','',2,2,12740),
 (200000160,'9347051','A67AE8E','2010-12-17','(1 REP BQTO)','3586','3770','2010-12-18',20110,'JLOZADA','2011-01-04 18:26:22',1,16,'166',1,2,86,1,'','',2,2,20110),
 (200000161,'12446697','A22AE2U','2010-12-17','(7 REP BQTO-QUIBOR)','3585','3776','2010-12-18',12350,'JLOZADA','2011-01-04 18:26:22',1,74,'166',1,2,127,1,'','',2,2,12350),
 (200000162,'16966899','A46AG7E','2010-12-17','(9 REP SARARE-YARITAGUA)','3582','3772','2010-12-18',12350,'JLOZADA','2011-01-04 18:26:22',1,84,'166',1,2,110,1,'','',2,2,12350),
 (200000163,'10637589','A13AG7E','2010-12-17','(8 REP YARITAGUA-CHIVACOA)','3584','3771','2010-12-18',12280,'JLOZADA','2011-01-04 18:26:22',1,80,'166',1,2,130,1,'','',2,2,12280),
 (200000164,'11542453','A23AE5U','2010-12-20','(4 REP BQTO MERCABAR)','3588','3780','2010-12-20',12920,'JLOZADA','2011-01-04 18:26:22',1,16,'166',1,2,86,1,'','',2,2,12920),
 (200000165,'9347051','A67AE8E','2010-12-20','(2 REP BQTO)','3589','3779','2010-12-20',19890,'JLOZADA','2011-01-04 18:26:22',1,16,'166',1,2,86,1,'','',2,2,19890),
 (200000166,'16751579','A72AE3E','2010-12-21','3 repartos guacas de riberas- el canton- abejales\r\n','3590','3781','2010-12-21',13070,'ADMCOC','2011-01-04 18:26:22',1,87,'166',1,2,432,1,'','',2,2,13070),
 (200000167,'16966899','A46AG7E','2010-12-21','(1 REP VALERA)','3591','3783','2010-12-21',12980,'JLOZADA','2011-01-04 18:26:22',1,33,'166',1,2,320,1,'','',2,2,12980),
 (200000168,'16346069','A68AE5E','2010-12-21','(2 REP VALERA)','3593','3782','2010-12-21',12380,'JLOZADA','2011-01-04 18:26:22',1,33,'166',1,2,320,1,'','',2,2,12380),
 (200000169,'13072039','A02AF5T','2010-12-21','(2 REP ACARIGUA)','3595','3787','2010-12-21',12530,'JLOZADA','2011-01-04 18:26:22',1,40,'166',1,2,1,1,'','',2,2,12530),
 (200000170,'10637589','A13AG7E','2010-12-21','(12 REP ACARIGUA-AGUA BLANCA-SAN RAFAEL-OSPINO)','3592','3786','2010-12-21',12330,'JLOZADA','2011-01-04 18:26:22',1,64,'166',1,2,47,1,'','',2,2,12330),
 (200000171,'8103812','A23AE2U','2010-12-21','(12 REP MERCABAR-BTO)','3596','3785','2010-12-21',12630,'JLOZADA','2011-01-04 18:26:22',1,16,'166',1,2,86,1,'','',2,2,12630),
 (200000172,'12262801','A22AE3U','2010-12-21','(15 REP ACARIGUA-PIRITU-TUREN)','3597','3788','2010-12-21',12530,'JLOZADA','2011-01-04 18:26:22',1,68,'166',1,2,47,1,'','',2,2,12530),
 (200000173,'11542453','A23AE5U','2010-12-21','(1 REP BARINAS)','3598','3789','2010-12-21',13010,'JLOZADA','2011-01-04 18:26:22',1,10,'166',1,2,172,1,'','',2,2,13010),
 (200000174,'12446697','A22AE4U','2010-12-21','(4 REP BQTO)','3599','3790','2010-12-21',12620,'JLOZADA','2011-01-04 18:26:22',1,16,'166',1,2,86,1,'','',2,2,12620),
 (200000175,'9347051','A67AE8E','2010-12-22','(3 REP VALERA-ESCUQUE) \r\n','3601','3791','2010-12-22',19980,'JLOZADA','2011-01-04 18:26:22',1,90,'166',1,2,330,1,'','',2,2,19980),
 (200000176,'11542453','A23AE2U','2011-01-06','','','','2011-01-01',321,'P','2011-01-11 09:18:50',1,14,'122010',2,2,371,1,'321','321',2,2,321),
 (200000177,'10637589','A23AE5U','2011-01-06','','','','2011-01-01',654,'P','2011-01-11 09:18:50',1,10,'122010',2,2,172,1,'654','3541',2,2,654);
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
-- Definition of procedure `Sp_ReCalc_Com_Chof`
--

DROP PROCEDURE IF EXISTS `Sp_ReCalc_Com_Chof`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ReCalc_Com_Chof`(tcid_periodo varchar(10),tnid_sucursal int(4))
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

      delete from tcomision_choferes where cid_periodo = tcid_periodo and nid_viaje in
         (select tcc.nid_viaje from tcomision_choferes tcc
            inner join tviaje tvj on tvj.nid_viaje = tcc.nid_viaje
            inner join tanticip_tviaje tav on tav.nid_viaje = tvj.nid_viaje
            inner join tanticipo tan on tan.nid_anticipo = tav.nid_anticipo
            where tan.nid_sucursal = tnid_sucursal and tcc.cid_periodo = tcid_periodo
            order by nid_viaje);

      update trelacion set nstatus = 1 where dfecha between ldfecha_desde and ldfecha_hasta;

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
-- Definition of procedure `Sp_Reemplazar_Anticipo`
--

DROP PROCEDURE IF EXISTS `Sp_Reemplazar_Anticipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Reemplazar_Anticipo`(tnid_anticipo Integer,tnid_sucursal int(4),tcid_vehiculo varchar(10),tnid_sucursal_v int(4),tcid_chofer varchar(9),tnid_sucursal_c int(4),tcobservacion text,tcid_usuario varchar(20),tcid_periodo varchar(10))
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
         corden_carga varchar(10),dfecha_guia date,npeso_neto double,nid_origen int(4),nid_destino int(4),cid_periodo varchar(10),ntipo_viaje  tinyint(1),
         nid_sucursal_guia int(4),ndistancia double,nstatus tinyint(1),cfactura_ext varchar(10),ccliente_ext varchar(45),nid_sucursal_c int(4),nid_sucursal_v int(4));
      Create Temporary Table ttAnticip_tViaje (nid_anticipo Integer,index using btree (nid_anticipo),nid_anticipo_nvo integer,
         nid_viaje Integer,index using btree (nid_viaje),nid_viaje_nvo integer);
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

      While Exists(Select * From ttAnticipo) Do
         Set lNid_Anticipo = (Select Nid_Anticipo From ttAnticipo Order By Nid_Anticipo Limit 1);
         Set lNid_Anticipo_nvo = Fn_Corr_Nid_Anticipo(tnid_sucursal);
         insert into tanticipo (nid_anticipo,cnro_recibo,nmonto,nstatus,nid_anticipo_ant,dfecha,nid_sucursal,cid_usuario,cobservacion)
            select lNid_Anticipo_nvo,tan.cnro_recibo,tan.nmonto,tan.nstatus,tan.nid_anticipo,curdate(),tnid_sucursal,tcid_usuario,tcobservacion
            from tanticipo tan where tan.nid_anticipo = lNid_Anticipo;
         update ttAnticip_tViaje set nid_anticipo_nvo = lNid_Anticipo_nvo where nid_anticipo = lNid_Anticipo;
         update tanticipo set nstatus = 3 where nid_anticipo = lNid_Anticipo;
         Delete From ttAnticipo Where Nid_Anticipo = lNid_Anticipo;
      End While;

      While Exists(Select * From ttViaje) Do
         Set lNid_Viaje = (Select Nid_Viaje From ttViaje Order By Nid_Viaje Limit 1);
         Set lNid_Viaje_nvo = Fn_Corr_Nid_Viaje(tnid_sucursal);
         insert into tviaje (nid_viaje,cid_chofer,cid_vehiculo,dfecha,cobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,cid_usuario,nid_origen,nid_destino,
            cid_periodo,ntipo_viaje,nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,nid_sucursal_c,nid_sucursal_v)
            select lNid_Viaje_nvo,tcid_chofer,tcid_vehiculo,curdate(),tcobservacion,tvj.cguia,tvj.corden_carga,tvj.dfecha_guia,tvj.npeso_neto,
               tcid_usuario,tvj.nid_origen,tvj.nid_destino,tcid_periodo,tvj.ntipo_viaje,tvj.nid_sucursal_guia,tvj.ndistancia,tvj.nstatus,tvj.cfactura_ext,
               tvj.ccliente_ext,tnid_sucursal_c,tnid_sucursal_v
               from tviaje tvj where tvj.nid_viaje = lNid_Viaje;
         update ttAnticip_tViaje set nid_viaje_nvo = lNid_Viaje_nvo where nid_viaje = lNid_Viaje;
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




END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `vw_anticipos`
--

DROP TABLE IF EXISTS `vw_anticipos`;
DROP VIEW IF EXISTS `vw_anticipos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vw_anticipos` AS select `tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto`,`tan`.`cid_usuario` AS `cid_usuario`,`tan`.`dfecha_act` AS `dfecha_act`,`tan`.`cobservacion` AS `cobservacion`,`tan`.`dfecha` AS `dfecha`,`tan`.`nstatus` AS `nstatus`,`tan`.`nid_relacion` AS `nid_relacion`,`tan`.`nrelacionado` AS `nrelacionado`,`tan`.`nid_sucursal` AS `nid_sucursal`,`tvj`.`nid_viaje` AS `nid_viaje`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`nid_sucursal_c` AS `nid_sucursal_c`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`nid_sucursal_v` AS `nid_sucursal_v`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`corden_carga` AS `corden_carga`,`tvj`.`cguia` AS `cguia`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_neto` AS `npeso_neto`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`cid_periodo` AS `cid_periodo`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`nactivo` AS `nactivo_s`,`tp`.`cdescripcion` AS `cdescripcion_p`,`tp`.`dfecha_desde` AS `dfecha_desde`,`tp`.`dfecha_hasta` AS `dfecha_hasta`,`tp`.`nstatus` AS `nstatus_p`,`tr`.`cdescripcion` AS `cdescripcion_r`,`tr`.`nactivo` AS `nactivo_r`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal`,(select `bdtransporte`.`torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`bdtransporte`.`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d`,(select count(`bdtransporte`.`tanticip_tviaje`.`nid_anticipo`) AS `count(nid_anticipo)` from `tanticip_tviaje` where (`bdtransporte`.`tanticip_tviaje`.`nid_anticipo` = `tan`.`nid_anticipo`)) AS `ncount_viaje`,(select count(`bdtransporte`.`tanticip_tviaje`.`nid_viaje`) AS `count(nid_viaje)` from `tanticip_tviaje` where (`bdtransporte`.`tanticip_tviaje`.`nid_viaje` = `tvj`.`nid_viaje`)) AS `ncount_anticipo` from ((((((((`tanticipo` `tan` join `tanticip_tviaje` `tav` on((`tav`.`nid_anticipo` = `tan`.`nid_anticipo`))) join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tav`.`nid_viaje`))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tan`.`nid_sucursal`))) join `tperiodo` `tp` on((`tp`.`cid_periodo` = `tvj`.`cid_periodo`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `truta` `tr` on(((`tr`.`nid_origen` = `tvj`.`nid_origen`) and (`tr`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`)));

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_comision_choferes` AS select `tcc`.`nid_viaje` AS `nid_viaje`,`tcc`.`cid_periodo` AS `cid_periodo`,`tcc`.`nporc_com` AS `nporc_com`,`tcc`.`ntabulador` AS `ntabulador`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`corden_carga` AS `corden_carga`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_neto` AS `npeso_neto`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`cid_periodo` AS `cid_periodo_v`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`nstatus` AS `nstatus_v`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvj`.`npeso_com` AS `npeso_com`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ncapacidad` AS `ncapacidad`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cconcepto_com` AS `cconcepto_com`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`ncap_carga` AS `ncap_carga`,`ts`.`nactivo` AS `nactivo_s`,`ts`.`nbono_alm` AS `nbono_alm`,`ts`.`nbono_mon` AS `nbono_mon`,`ts`.`nporc_com` AS `nporc_com_s`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto_a`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nstatus` AS `nstatus_a`,`tan`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha_r`,`trl`.`nstatus` AS `nstatus_r`,`trt`.`cdescripcion` AS `cdescripcion_r`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tp`.`cdescripcion` AS `cdescripcion_p`,`tp`.`dfecha_desde` AS `dfecha_desde`,`tp`.`dfecha_hasta` AS `dfecha_hasta`,`tp`.`nticket_cesta` AS `nticket_cesta`,`tp`.`ndias_feriados` AS `ndias_feriados`,((((`tvj`.`npeso_com` * `tcc`.`ntabulador`) / 1000) * `tcc`.`nporc_com`) / 100) AS `nmonto_com`,sum(`tdr`.`nmonto`) AS `nmonto_r`,(select `torigen_destino`.`cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tvj`.`nid_destino`)) AS `cdescripcion_d`,(select count(`tanticip_tviaje`.`nid_anticipo`) from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_anticipo` = `tan`.`nid_anticipo`)) AS `ncount_viaje`,(select count(`tanticip_tviaje`.`nid_viaje`) from `tanticip_tviaje` where (`tanticip_tviaje`.`nid_viaje` = `tvj`.`nid_viaje`)) AS `ncount_anticipo` from (((((((((((`tcomision_choferes` `tcc` join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tcc`.`nid_viaje`))) join `tvehiculo` `tvh` on((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tanticip_tviaje` `tav` on((`tav`.`nid_viaje` = `tvj`.`nid_viaje`))) join `tanticipo` `tan` on((`tan`.`nid_anticipo` = `tav`.`nid_anticipo`))) join `trelacion` `trl` on((`trl`.`nid_relacion` = `tan`.`nid_relacion`))) join `tdetalle_relacion` `tdr` on((`tdr`.`nid_relacion` = `trl`.`nid_relacion`))) join `truta` `trt` on(((`trt`.`nid_origen` = `tvj`.`nid_origen`) and (`trt`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `trt`.`nid_origen`))) join `tperiodo` `tp` on((`tp`.`cid_periodo` = `tcc`.`cid_periodo`))) group by `tcc`.`nid_viaje`,`tcc`.`cid_periodo`,`tcc`.`nporc_com`,`tcc`.`ntabulador`,`tvj`.`cid_chofer`,`tvj`.`cid_vehiculo`,`tvj`.`dfecha`,`tvj`.`cguia`,`tvj`.`corden_carga`,`tvj`.`dfecha_guia`,`tvj`.`npeso_neto`,`tvj`.`nid_origen`,`tvj`.`nid_destino`,`tvj`.`cid_periodo`,`tvj`.`ntipo_viaje`,`tvj`.`nid_sucursal_guia`,`tvj`.`ndistancia`,`tvj`.`nstatus`,`tvj`.`cfactura_ext`,`tvj`.`ccliente_ext`,`tvh`.`cdescripcion`,`tvh`.`ncapacidad`,`tvh`.`ctipo_vehic`,`tvh`.`npropio`,`tvh`.`nactivo`,`tch`.`cnombre`,`tch`.`ccontraparte`,`tch`.`cficha_nom`,`tch`.`nid_sucursal`,`tch`.`ncontratado`,`tch`.`nactivo`,`ts`.`cdescripcion`,`ts`.`ncap_carga`,`ts`.`nactivo`,`ts`.`nbono_alm`,`ts`.`nbono_mon`,`ts`.`nporc_com`,`tan`.`nid_anticipo`,`tan`.`cnro_recibo`,`tan`.`nmonto`,`tan`.`dfecha`,`tan`.`nstatus`,`tan`.`nid_relacion`,`trl`.`dfecha`,`trl`.`nstatus`,`trt`.`cdescripcion`,`tod`.`cdescripcion`,`tp`.`cdescripcion`,`tp`.`dfecha_desde`,`tp`.`dfecha_hasta`;

--
-- Definition of view `vw_relaciones`
--

DROP TABLE IF EXISTS `vw_relaciones`;
DROP VIEW IF EXISTS `vw_relaciones`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_relaciones` AS select distinct `trl`.`nid_relacion` AS `nid_relacion`,`trl`.`dfecha` AS `dfecha`,`trl`.`cid_usuario` AS `cid_usuario`,`trl`.`dfecha_act` AS `dfecha_act`,`trl`.`cobservacion` AS `cobservacion`,`trl`.`nstatus` AS `nstatus`,`tdr`.`cid_tipogasto` AS `cid_tipogasto`,`tdr`.`nmonto` AS `nmonto`,`ttg`.`cdescripcion` AS `cdescripcion_g`,`tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`dfecha` AS `dfecha_a`,`tan`.`nmonto` AS `nmonto_a`,`tan`.`nid_sucursal` AS `nid_sucursal`,`tan`.`nid_anticipo_ant` AS `nid_anticipo_ant`,`tan`.`nstatus` AS `nstatus_a`,`tvj`.`nid_viaje` AS `nid_viaje`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`nid_sucursal_c` AS `nid_sucursal_c`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`nid_sucursal_v` AS `nid_sucursal_v`,`tvj`.`cguia` AS `cguia`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_neto` AS `npeso_neto`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`cid_periodo` AS `cid_periodo`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,(select sum(`tdetalle_relacion`.`nmonto`) AS `sum(nmonto)` from `tdetalle_relacion` where (`tdetalle_relacion`.`nid_relacion` = `trl`.`nid_relacion`)) AS `nmonto_tr`,(select sum(`tanticipo`.`nmonto`) AS `sum(nmonto)` from `tanticipo` where (`tanticipo`.`nid_relacion` = `trl`.`nid_relacion`)) AS `nmonto_ta` from ((((((((`trelacion` `trl` join `tdetalle_relacion` `tdr` on((`tdr`.`nid_relacion` = `trl`.`nid_relacion`))) join `ttipo_gasto` `ttg` on((`ttg`.`cid_tipogasto` = `tdr`.`cid_tipogasto`))) join `tanticipo` `tan` on((`tan`.`nid_relacion` = `trl`.`nid_relacion`))) join `tanticip_tviaje` `tav` on((`tav`.`nid_anticipo` = `tan`.`nid_anticipo`))) join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tav`.`nid_viaje`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tan`.`nid_sucursal`)));

--
-- Definition of view `vw_rutas`
--

DROP TABLE IF EXISTS `vw_rutas`;
DROP VIEW IF EXISTS `vw_rutas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vw_rutas` AS select `tr`.`nid_origen` AS `nid_origen`,`tr`.`nid_destino` AS `nid_destino`,`tr`.`ndistancia` AS `ndistancia`,`tr`.`cid_usuario` AS `cid_usuario`,`tr`.`dfecha_act` AS `dfecha_act`,`tr`.`cdescripcion` AS `cdescripcion`,`tr`.`nactivo` AS `nactivo`,`tr`.`nporc_com` AS `nporc_com`,`tr`.`ncom_pes` AS `ncom_pes`,`tr`.`ncom_med` AS `ncom_med`,`tr`.`ncom_liv` AS `ncom_liv`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`cid_ciudad` AS `cid_ciudad_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal_o`,`tc`.`cdescripcion` AS `cdescripcion_co`,`tc`.`cid_estado` AS `cid_estado_o`,`te`.`cdescripcion` AS `cdescripcion_eo`,(select `bdtransporte`.`torigen_destino`.`cdescripcion` AS `cdescripcion` from `torigen_destino` where (`bdtransporte`.`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d`,(select `bdtransporte`.`torigen_destino`.`cid_ciudad` AS `cid_ciudad` from `torigen_destino` where (`bdtransporte`.`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cid_ciudad_d`,(select `bdtransporte`.`torigen_destino`.`nactivo` AS `nactivo` from `torigen_destino` where (`bdtransporte`.`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nactivo_d`,(select `bdtransporte`.`torigen_destino`.`nsucursal` AS `nsucursal` from `torigen_destino` where (`bdtransporte`.`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nsucursal_d`,(select `bdtransporte`.`tciudad`.`cdescripcion` AS `cdescripcion` from `tciudad` where (`bdtransporte`.`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cdescripcion_cd`,(select `bdtransporte`.`tciudad`.`cid_estado` AS `cid_estado` from `tciudad` where (`bdtransporte`.`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cid_estado_d`,(select `bdtransporte`.`testado`.`cdescripcion` AS `cdescripcion` from `testado` where (`bdtransporte`.`testado`.`cid_estado` = `cid_estado_d`)) AS `cdescripcion_ed` from (((`truta` `tr` join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`))) join `tciudad` `tc` on((`tc`.`cid_ciudad` = `tod`.`cid_ciudad`))) join `testado` `te` on((`te`.`cid_estado` = `tc`.`cid_estado`)));

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
