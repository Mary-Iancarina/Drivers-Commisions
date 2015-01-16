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
-- Definition of table `tanticipo_viaje`
--

DROP TABLE IF EXISTS `tanticipo_viaje`;
CREATE TABLE `tanticipo_viaje` (
  `nid_anticipo` int(10) unsigned NOT NULL default '0',
  `cnro_recibo` varchar(10) NOT NULL default '',
  `cid_chofer` varchar(9) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `nmonto` double NOT NULL,
  `dfecha` date NOT NULL,
  `cobservacion` text,
  `cguia` varchar(10) default NULL,
  `corden_carga` varchar(10) NOT NULL,
  `dfecha_guia` date default NULL,
  `npeso_neto` double default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cid_sucursal` varchar(2) NOT NULL,
  `cid_destino` varchar(4) NOT NULL,
  PRIMARY KEY  USING BTREE (`nid_anticipo`),
  KEY `FK_tant_viaje_tchofer` (`cid_chofer`),
  KEY `FK_tant_viaje_tvehic` (`cid_vehiculo`),
  KEY `FK_tant_viaje_tdistancia` (`cid_sucursal`,`cid_destino`),
  CONSTRAINT `FK_tant_viaje_tchofer` FOREIGN KEY (`cid_chofer`) REFERENCES `tchofer` (`cid_chofer`),
  CONSTRAINT `FK_tant_viaje_tdistancia` FOREIGN KEY (`cid_sucursal`, `cid_destino`) REFERENCES `tdistancia` (`cid_sucursal`, `cid_destino`),
  CONSTRAINT `FK_tant_viaje_tvehic` FOREIGN KEY (`cid_vehiculo`) REFERENCES `tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanticipo_viaje`
--

/*!40000 ALTER TABLE `tanticipo_viaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tanticipo_viaje` ENABLE KEYS */;


--
-- Definition of table `tchofer`
--

DROP TABLE IF EXISTS `tchofer`;
CREATE TABLE `tchofer` (
  `cid_chofer` varchar(9) NOT NULL,
  `cnombre` varchar(60) NOT NULL default '',
  `ccta_cont` varchar(6) default NULL,
  `cficha` varchar(6) default NULL,
  `cid_sucursal` varchar(2) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `lcontratado` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`cid_chofer`),
  KEY `FK_tchofer_tsucursal` (`cid_sucursal`),
  CONSTRAINT `FK_tchofer_tsucursal` FOREIGN KEY (`cid_sucursal`) REFERENCES `tsucursal` (`cid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tchofer`
--

/*!40000 ALTER TABLE `tchofer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tchofer` ENABLE KEYS */;


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
  KEY `FK_tciudad_tEstado` USING BTREE (`cid_estado`),
  CONSTRAINT `FK_tciudad_tEstado` FOREIGN KEY (`cid_estado`) REFERENCES `testado` (`cid_estado`)
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
-- Definition of table `tdestino`
--

DROP TABLE IF EXISTS `tdestino`;
CREATE TABLE `tdestino` (
  `cid_destino` varchar(4) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_ciudad` varchar(4) NOT NULL default '',
  `nporc_comision` double NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid_destino`),
  KEY `FK_tdestino_tciudad` (`cid_ciudad`),
  CONSTRAINT `FK_tdestino_tciudad` FOREIGN KEY (`cid_ciudad`) REFERENCES `tciudad` (`cid_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdestino`
--

/*!40000 ALTER TABLE `tdestino` DISABLE KEYS */;
INSERT INTO `tdestino` (`cid_destino`,`cdescripcion`,`cid_ciudad`,`nporc_comision`,`cid_usuario`,`dfecha_act`) VALUES 
 ('0001','CARACAS','2401',1,'P','2010-02-08 15:27:29'),
 ('0002','VALENCIA','0701',2,'P','2010-02-08 15:28:00'),
 ('0003','BARQUISIMETO','1201',3,'P','2010-02-08 15:28:23'),
 ('0004','MERIDA','1301',4,'P','2010-02-08 15:28:53');
/*!40000 ALTER TABLE `tdestino` ENABLE KEYS */;


--
-- Definition of table `tdetalle_orden`
--

DROP TABLE IF EXISTS `tdetalle_orden`;
CREATE TABLE `tdetalle_orden` (
  `cid_orden` varchar(10) NOT NULL,
  `cid_vehiculo` varchar(10) NOT NULL,
  `cid_servicio` varchar(3) NOT NULL,
  `ncantidad` int(10) unsigned NOT NULL,
  `nprecio` double NOT NULL,
  `ndescuento` double NOT NULL,
  PRIMARY KEY  (`cid_orden`),
  KEY `FK_tdet_ord_tvehic` (`cid_vehiculo`),
  KEY `FK_tdet_ord_tservicio` (`cid_servicio`),
  CONSTRAINT `FK_tdet_ord_torden` FOREIGN KEY (`cid_orden`) REFERENCES `torden_serv` (`cid_orden`),
  CONSTRAINT `FK_tdet_ord_tservicio` FOREIGN KEY (`cid_servicio`) REFERENCES `tservicio` (`cid_servicio`),
  CONSTRAINT `FK_tdet_ord_tvehic` FOREIGN KEY (`cid_vehiculo`) REFERENCES `tvehiculo` (`cid_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_orden`
--

/*!40000 ALTER TABLE `tdetalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdetalle_orden` ENABLE KEYS */;


--
-- Definition of table `tdistancia`
--

DROP TABLE IF EXISTS `tdistancia`;
CREATE TABLE `tdistancia` (
  `cid_sucursal` varchar(2) NOT NULL,
  `cid_destino` varchar(4) NOT NULL,
  `ndistancia` double NOT NULL,
  PRIMARY KEY  USING BTREE (`cid_sucursal`,`cid_destino`),
  KEY `FK_tdistancia_tdestino` USING BTREE (`cid_destino`),
  KEY `FK_tdistancia_tsucursal` USING BTREE (`cid_sucursal`),
  CONSTRAINT `FK_tdistancia_tdestino` FOREIGN KEY (`cid_destino`) REFERENCES `tdestino` (`cid_destino`),
  CONSTRAINT `FK_tdistancia_tsucursal` FOREIGN KEY (`cid_sucursal`) REFERENCES `tsucursal` (`cid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdistancia`
--

/*!40000 ALTER TABLE `tdistancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdistancia` ENABLE KEYS */;


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
 ('03','Apure','P01','2010-02-04 10:41:11'),
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
-- Definition of table `tgrupo_servicio`
--

DROP TABLE IF EXISTS `tgrupo_servicio`;
CREATE TABLE `tgrupo_servicio` (
  `cid_grupo` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tgrupo_servicio`
--

/*!40000 ALTER TABLE `tgrupo_servicio` DISABLE KEYS */;
INSERT INTO `tgrupo_servicio` (`cid_grupo`,`cdescripcion`,`cid_usuario`,`dfecha_act`) VALUES 
 ('01','GRUPO 1','P','2010-02-22 16:21:59'),
 ('02','GRUPO 2','P','2010-02-22 16:22:11');
/*!40000 ALTER TABLE `tgrupo_servicio` ENABLE KEYS */;


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
  `cid_orden` varchar(10) NOT NULL,
  `dfecha` date NOT NULL,
  `cfactura` varchar(10) NOT NULL,
  `ntotal` double NOT NULL,
  `crif_emp` varchar(12) default NULL,
  `cnombre_emp` varchar(60) default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torden_serv`
--

/*!40000 ALTER TABLE `torden_serv` DISABLE KEYS */;
/*!40000 ALTER TABLE `torden_serv` ENABLE KEYS */;


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
INSERT INTO `tperiodo` (`cid_periodo`,`dfecha_desde`,`dfecha_hasta`,`cdescripcion`,`cid_usuario`,`dfecha_act`,`lstatus`) VALUES 
 ('001','2010-02-24','2010-03-26','FEB-MAR 2010','P','2010-02-24 20:21:42',1),
 ('0123456789','2010-02-24','2010-03-24','PERIODO 1','P','2010-02-24 20:20:40',0),
 ('1','2001-01-01','2001-01-01','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','P','2010-02-24 19:39:52',0);
/*!40000 ALTER TABLE `tperiodo` ENABLE KEYS */;


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
  PRIMARY KEY  (`cid_servicio`),
  KEY `FK_tservicio_tgrupo` (`cid_grupo`),
  CONSTRAINT `FK_tservicio_tgrupo` FOREIGN KEY (`cid_grupo`) REFERENCES `tgrupo_servicio` (`cid_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tservicio`
--

/*!40000 ALTER TABLE `tservicio` DISABLE KEYS */;
INSERT INTO `tservicio` (`cid_servicio`,`cdescripcion`,`cid_grupo`,`cid_usuario`,`dfecha_act`) VALUES 
 ('001','SERVICIO 1','01','P','2010-02-22 16:25:21'),
 ('002','SERVICIO 2','02','P','2010-02-22 16:25:44');
/*!40000 ALTER TABLE `tservicio` ENABLE KEYS */;


--
-- Definition of table `tsucursal`
--

DROP TABLE IF EXISTS `tsucursal`;
CREATE TABLE `tsucursal` (
  `cid_sucursal` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_ciudad` varchar(4) NOT NULL default '',
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ccarpeta` varchar(20) NOT NULL,
  `ncap_carga` double NOT NULL,
  PRIMARY KEY  (`cid_sucursal`),
  KEY `FK_tsucursal_tciudad` (`cid_ciudad`),
  CONSTRAINT `FK_tsucursal_tciudad` FOREIGN KEY (`cid_ciudad`) REFERENCES `tciudad` (`cid_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

/*!40000 ALTER TABLE `tsucursal` DISABLE KEYS */;
INSERT INTO `tsucursal` (`cid_sucursal`,`cdescripcion`,`cid_ciudad`,`cid_usuario`,`dfecha_act`,`ccarpeta`,`ncap_carga`) VALUES 
 ('01','OFICINA PRINCIPAL','1703','P','2010-02-04 11:45:38','',0),
 ('02','VALENCIA','0701','P','2010-02-04 16:41:49','',0),
 ('03','MARACAIBO','2301','P','2010-02-04 18:12:04','',0),
 ('04','CARACAS','2401','P','2010-02-04 19:10:29','',0);
/*!40000 ALTER TABLE `tsucursal` ENABLE KEYS */;


--
-- Definition of table `ttipo_gasto`
--

DROP TABLE IF EXISTS `ttipo_gasto`;
CREATE TABLE `ttipo_gasto` (
  `cid_tipogasto` varchar(2) NOT NULL,
  `cdescripcion` varchar(60) NOT NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid_tipogasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttipo_gasto`
--

/*!40000 ALTER TABLE `ttipo_gasto` DISABLE KEYS */;
INSERT INTO `ttipo_gasto` (`cid_tipogasto`,`cdescripcion`,`cid_usuario`,`dfecha_act`) VALUES 
 ('01','FFFGFFTTTTTHHHHHHTTTTGGGGGFFF','P','2010-02-09 14:17:06'),
 ('02','GGGGGGGGGGGG','P','2010-02-09 11:14:12'),
 ('03','SFSDFSDF','P','2010-02-09 11:14:20'),
 ('04','GGGGGGG','P','2010-02-09 11:19:58'),
 ('05','UUUUUUUUUUUUUUU','P','2010-02-09 11:20:18');
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
  `cid_sucursal` varchar(2) NOT NULL,
  `ncosto` double default NULL,
  `cid_usuario` varchar(20) NOT NULL,
  `dfecha_act` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `npropio` int(1) unsigned NOT NULL,
  PRIMARY KEY  (`cid_vehiculo`),
  KEY `FK_tvehiculo_tchofer` (`cid_chofer`),
  KEY `FK_tvehiculo_tsucursal` (`cid_sucursal`),
  CONSTRAINT `FK_tvehiculo_tchofer` FOREIGN KEY (`cid_chofer`) REFERENCES `tchofer` (`cid_chofer`),
  CONSTRAINT `FK_tvehiculo_tsucursal` FOREIGN KEY (`cid_sucursal`) REFERENCES `tsucursal` (`cid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tvehiculo`
--

/*!40000 ALTER TABLE `tvehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvehiculo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
