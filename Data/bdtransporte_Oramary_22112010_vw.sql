-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.49-community


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
  `nid_sucursal` int(4) unsigned,
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
  `cdescripcion_d` varchar(60)
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
-- Definition of view `vw_anticipos`
--

DROP TABLE IF EXISTS `vw_anticipos`;
DROP VIEW IF EXISTS `vw_anticipos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vw_anticipos` AS select `tan`.`nid_anticipo` AS `nid_anticipo`,`tan`.`cnro_recibo` AS `cnro_recibo`,`tan`.`nmonto` AS `nmonto`,`tan`.`cid_usuario` AS `cid_usuario`,`tan`.`dfecha_act` AS `dfecha_act`,`tan`.`cobservacion` AS `cobservacion`,`tan`.`dfecha` AS `dfecha`,`tan`.`nstatus` AS `nstatus`,`tan`.`nid_relacion` AS `nid_relacion`,`tan`.`nrelacionado` AS `nrelacionado`,`tvj`.`nid_viaje` AS `nid_viaje`,`tvj`.`cid_chofer` AS `cid_chofer`,`tvj`.`nid_sucursal_c` AS `nid_sucursal_c`,`tvj`.`cid_vehiculo` AS `cid_vehiculo`,`tvj`.`nid_sucursal_v` AS `nid_sucursal_v`,`tvj`.`dfecha` AS `dfecha_v`,`tvj`.`corden_carga` AS `corden_carga`,`tvj`.`cguia` AS `cguia`,`tvj`.`dfecha_guia` AS `dfecha_guia`,`tvj`.`npeso_neto` AS `npeso_neto`,`tvj`.`nid_sucursal_guia` AS `nid_sucursal_guia`,`tvj`.`cid_periodo` AS `cid_periodo`,`tvj`.`nid_origen` AS `nid_origen`,`tvj`.`nid_destino` AS `nid_destino`,`tvj`.`ntipo_viaje` AS `ntipo_viaje`,`tvj`.`ndistancia` AS `ndistancia`,`tvj`.`cfactura_ext` AS `cfactura_ext`,`tvj`.`ccliente_ext` AS `ccliente_ext`,`tvh`.`cdescripcion` AS `cdescripcion_v`,`tvh`.`ctipo_vehic` AS `ctipo_vehic`,`tvh`.`npropio` AS `npropio`,`tvh`.`nactivo` AS `nactivo_v`,`tch`.`cnombre` AS `cnombre`,`tch`.`nid_sucursal` AS `nid_sucursal`,`tch`.`ccontraparte` AS `ccontraparte`,`tch`.`cficha_nom` AS `cficha_nom`,`tch`.`ncontratado` AS `ncontratado`,`tch`.`nactivo` AS `nactivo_c`,`ts`.`cdescripcion` AS `cdescripcion_s`,`ts`.`nactivo` AS `nactivo_s`,`tp`.`cdescripcion` AS `cdescripcion_p`,`tp`.`dfecha_desde` AS `dfecha_desde`,`tp`.`dfecha_hasta` AS `dfecha_hasta`,`tp`.`nstatus` AS `nstatus_p`,`tr`.`cdescripcion` AS `cdescripcion_r`,`tr`.`nactivo` AS `nactivo_r`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal`,(select `torigen_destino`.`cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d` from ((((((((`tanticipo` `tan` join `tanticip_tviaje` `tav` on((`tav`.`nid_anticipo` = `tan`.`nid_anticipo`))) join `tviaje` `tvj` on((`tvj`.`nid_viaje` = `tav`.`nid_viaje`))) join `tchofer` `tch` on(((`tch`.`cid_chofer` = `tvj`.`cid_chofer`) and (`tch`.`nid_sucursal` = `tvj`.`nid_sucursal_c`)))) join `tsucursal` `ts` on((`ts`.`nid_sucursal` = `tch`.`nid_sucursal`))) join `tperiodo` `tp` on((`tp`.`cid_periodo` = `tvj`.`cid_periodo`))) join `tvehiculo` `tvh` on(((`tvh`.`cid_vehiculo` = `tvj`.`cid_vehiculo`) and (`tvh`.`nid_sucursal` = `tvj`.`nid_sucursal_v`)))) join `truta` `tr` on(((`tr`.`nid_origen` = `tvj`.`nid_origen`) and (`tr`.`nid_destino` = `tvj`.`nid_destino`)))) join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`)));

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
CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vw_rutas` AS select `tr`.`nid_origen` AS `nid_origen`,`tr`.`nid_destino` AS `nid_destino`,`tr`.`ndistancia` AS `ndistancia`,`tr`.`cid_usuario` AS `cid_usuario`,`tr`.`dfecha_act` AS `dfecha_act`,`tr`.`cdescripcion` AS `cdescripcion`,`tr`.`nactivo` AS `nactivo`,`tr`.`nporc_com` AS `nporc_com`,`tr`.`ncom_pes` AS `ncom_pes`,`tr`.`ncom_med` AS `ncom_med`,`tr`.`ncom_liv` AS `ncom_liv`,`tod`.`cdescripcion` AS `cdescripcion_o`,`tod`.`cid_ciudad` AS `cid_ciudad_o`,`tod`.`nactivo` AS `nactivo_o`,`tod`.`nsucursal` AS `nsucursal_o`,`tc`.`cdescripcion` AS `cdescripcion_co`,`tc`.`cid_estado` AS `cid_estado_o`,`te`.`cdescripcion` AS `cdescripcion_eo`,(select `torigen_destino`.`cdescripcion` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cdescripcion_d`,(select `torigen_destino`.`cid_ciudad` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `cid_ciudad_d`,(select `torigen_destino`.`nactivo` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nactivo_d`,(select `torigen_destino`.`nsucursal` from `torigen_destino` where (`torigen_destino`.`nid_origdest` = `tr`.`nid_destino`)) AS `nsucursal_d`,(select `tciudad`.`cdescripcion` from `tciudad` where (`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cdescripcion_cd`,(select `tciudad`.`cid_estado` from `tciudad` where (`tciudad`.`cid_ciudad` = `cid_ciudad_d`)) AS `cid_estado_d`,(select `testado`.`cdescripcion` from `testado` where (`testado`.`cid_estado` = `cid_estado_d`)) AS `cdescripcion_ed` from (((`truta` `tr` join `torigen_destino` `tod` on((`tod`.`nid_origdest` = `tr`.`nid_origen`))) join `tciudad` `tc` on((`tc`.`cid_ciudad` = `tod`.`cid_ciudad`))) join `testado` `te` on((`te`.`cid_estado` = `tc`.`cid_estado`)));

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
