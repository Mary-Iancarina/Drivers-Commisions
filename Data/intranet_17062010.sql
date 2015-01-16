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
-- Create schema intranet
--

CREATE DATABASE IF NOT EXISTS intranet;
USE intranet;

--
-- Definition of table `tconfiguracion`
--

DROP TABLE IF EXISTS `tconfiguracion`;
CREATE TABLE `tconfiguracion` (
  `cServEmlInt` varchar(100) NOT NULL DEFAULT '',
  `cDirEmlInt` varchar(150) NOT NULL DEFAULT '',
  `cUsuEmlInt` varchar(150) NOT NULL DEFAULT '',
  `cPassEmlInt` varchar(50) NOT NULL DEFAULT '',
  `nReqAutEmlInt` int(1) NOT NULL DEFAULT '0',
  `nReqConSSLEmlInt` int(1) NOT NULL DEFAULT '0',
  `cServEmlExt` varchar(100) NOT NULL DEFAULT '',
  `cDirEmlExt` varchar(150) NOT NULL DEFAULT '',
  `cUsuEmlExt` varchar(150) NOT NULL DEFAULT '',
  `cPassEmlExt` varchar(50) NOT NULL DEFAULT '',
  `nReqAutEmlExt` int(1) NOT NULL DEFAULT '0',
  `nReqConSSLEmlExt` int(1) NOT NULL DEFAULT '0',
  `cDescripcion` varchar(60) NOT NULL DEFAULT '',
  `nPuertoEmlInt` int(10) NOT NULL DEFAULT '0',
  `nPuertoEmlExt` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tconfiguracion`
--

/*!40000 ALTER TABLE `tconfiguracion` DISABLE KEYS */;
INSERT INTO `tconfiguracion` (`cServEmlInt`,`cDirEmlInt`,`cUsuEmlInt`,`cPassEmlInt`,`nReqAutEmlInt`,`nReqConSSLEmlInt`,`cServEmlExt`,`cDirEmlExt`,`cUsuEmlExt`,`cPassEmlExt`,`nReqAutEmlExt`,`nReqConSSLEmlExt`,`cDescripcion`,`nPuertoEmlInt`,`nPuertoEmlExt`) VALUES 
 ('mail','programador@iancarina.com.ve','programador','˜ž’ž›',0,0,'mail.mary-iancarina.com','sistemas@mary-iancarina.com','sistemas@mary-iancarina.com','Œ–Œ‹š’žŒÇÊ',1,0,'Sistema de control de solicitudes',2525,2525);
/*!40000 ALTER TABLE `tconfiguracion` ENABLE KEYS */;


--
-- Definition of table `tdepartamentos`
--

DROP TABLE IF EXISTS `tdepartamentos`;
CREATE TABLE `tdepartamentos` (
  `cId_Departamento` varchar(4) NOT NULL DEFAULT '',
  `cDescripcion` varchar(60) DEFAULT '',
  `cId_Ubicacion` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`cId_Departamento`),
  KEY `FKtUbicaciones-tDepartamentos` (`cId_Ubicacion`) USING BTREE,
  CONSTRAINT `FK_tUbicaciones_tDepartamentos` FOREIGN KEY (`cId_Ubicacion`) REFERENCES `tubicaciones` (`cId_Ubicacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Departamentos de las ubicaciones de la corporacion';

--
-- Dumping data for table `tdepartamentos`
--

/*!40000 ALTER TABLE `tdepartamentos` DISABLE KEYS */;
INSERT INTO `tdepartamentos` (`cId_Departamento`,`cDescripcion`,`cId_Ubicacion`) VALUES 
 ('1','INFORMATICA','1'),
 ('10','LEGAL','1'),
 ('11','Credito y Cobranzas','5'),
 ('12','almacen papeleria oficina principal','1'),
 ('13','almacen de repuesto planta 1','2'),
 ('14','empaque planta 1','2'),
 ('15','despacho planta 1','2'),
 ('16','laboratorio/romana planta 1','2'),
 ('17','enfermeria planta 1','2'),
 ('18','gerencia planta 1','2'),
 ('19','almacen de repuesto planta 2','3'),
 ('2','CONTABILIDAD','1'),
 ('20','despacho planta 2','3'),
 ('21','laboratorio planta 2 y 3','3'),
 ('22','gerencia planta 2','3'),
 ('23','seguridad industrial planta 2','3'),
 ('24','operaciones planta 3','4'),
 ('25','gerencia planta 3','4'),
 ('26','ventas centro occidente','5'),
 ('27','almacen y despacho barcelona','6'),
 ('28','gerencia caracas','7'),
 ('3','RECURSOS HUMANOS','1'),
 ('32','administracion caracas','7'),
 ('33','almacen y despacho valencia','9'),
 ('34','gerencia valencia','9'),
 ('35','administracion valencia','9'),
 ('36','almacen y despacho maracaibo','8'),
 ('37','gerencia maracaibo','8'),
 ('38','administracion maracaibo','8'),
 ('39','ADMINISTRACION IANCA','12'),
 ('4','FINANZAS','1'),
 ('40','COMPRAS','1'),
 ('41','SEGURIDAD FISICA','2'),
 ('42','ADMINISTRACION BARCELONA','6'),
 ('43','ADMINISTRACION TRANSPORTE','11'),
 ('6','VENTAS','1'),
 ('7','COORDINACION AGRICOLA','1'),
 ('8','GERENCIA GENERAL','1'),
 ('9','GERENCIA OPERACIONES','1');
/*!40000 ALTER TABLE `tdepartamentos` ENABLE KEYS */;


--
-- Definition of table `tempresas`
--

DROP TABLE IF EXISTS `tempresas`;
CREATE TABLE `tempresas` (
  `cId_Empresa` varchar(3) NOT NULL DEFAULT '',
  `cDescripcion` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`cId_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Empresas';

--
-- Dumping data for table `tempresas`
--

/*!40000 ALTER TABLE `tempresas` DISABLE KEYS */;
INSERT INTO `tempresas` (`cId_Empresa`,`cDescripcion`) VALUES 
 ('1','IANCARINA'),
 ('2','IANCA'),
 ('3','CORISA');
/*!40000 ALTER TABLE `tempresas` ENABLE KEYS */;


--
-- Definition of table `tsolicitudes`
--

DROP TABLE IF EXISTS `tsolicitudes`;
CREATE TABLE `tsolicitudes` (
  `nId_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `cId_Solicitante` varchar(15) NOT NULL DEFAULT '',
  `cId_TipoS` varchar(4) NOT NULL DEFAULT '',
  `dFechaSol` datetime DEFAULT NULL,
  `cTituloSol` varchar(60) NOT NULL DEFAULT '',
  `cDetalleSol` text NOT NULL,
  `cId_Operador` varchar(15) NOT NULL DEFAULT '',
  `cTituloResp` varchar(60) NOT NULL DEFAULT '',
  `cDetalleResp` text NOT NULL,
  `dFechaResp` datetime DEFAULT NULL,
  `nBase` int(1) NOT NULL DEFAULT '0',
  `nEstado` int(1) NOT NULL DEFAULT '0',
  `nPrioridad` int(1) NOT NULL DEFAULT '0',
  `cArchivo_Adjunto1` varchar(255) DEFAULT '',
  `cArchivo_Adjunto2` varchar(255) DEFAULT '',
  `dFechaMod` datetime NOT NULL,
  PRIMARY KEY (`nId_Numero`),
  KEY `FKtUsuarios-tSolicitudes1` (`cId_Solicitante`) USING BTREE,
  KEY `FKtTipo_Solicitudes-tSolicitudes` (`cId_TipoS`) USING BTREE,
  CONSTRAINT `FK_Solicitudes_TipoSol` FOREIGN KEY (`cId_TipoS`) REFERENCES `ttipo_solicitudes` (`cId_TipoS`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Solicitud_Usuario1` FOREIGN KEY (`cId_Solicitante`) REFERENCES `tusuarios` (`cId_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=latin1 COMMENT='Solicitudes';

--
-- Dumping data for table `tsolicitudes`
--

/*!40000 ALTER TABLE `tsolicitudes` DISABLE KEYS */;
INSERT INTO `tsolicitudes` (`nId_Numero`,`cId_Solicitante`,`cId_TipoS`,`dFechaSol`,`cTituloSol`,`cDetalleSol`,`cId_Operador`,`cTituloResp`,`cDetalleResp`,`dFechaResp`,`nBase`,`nEstado`,`nPrioridad`,`cArchivo_Adjunto1`,`cArchivo_Adjunto2`,`dFechaMod`) VALUES 
 (1,'RIGOBERTO','39','2009-09-10 08:44:35','CAPTURA DE DATOS SISTEMA DE COBRANZA / SPI','PODRIA VENIR HASTA MI ESTACION DE TRABAJO, PARA EXPLICAR GRAFICAMENTE EL PROBLEMA','cparada','se actualizaron las ventas','se puso a correr el programa de actualizacion de las ventas','2009-09-10 11:16:09',0,3,1,'','','2009-09-10 08:44:35'),
 (2,'ialmacenmp','4','2009-09-10 10:06:49','compra de baterias','Yira hay muchos bajones de luz en el almacen se necesita el ups','backup','BaterÃ­a','Buen dÃ­a, ayer hablÃ© con el proveedor y ya le llegaron las baterÃ­as, maÃ±ana 11-09-2009 me las trae.','2009-09-10 11:21:36',0,3,1,'','','2009-09-10 10:06:49'),
 (3,'marrieta','47','2009-09-14 09:12:50','Cambio de Equipo','Hola buen dÃ­a, Yira sirva el presente para recordar la peticiÃ³n de cambio de equipo que habiamos conversado (mi equipo por el que actualmente las aprendices), esto debido a que por informaciÃ³n que nos diste ese equipo se esta subutilizando y cuando se conversÃ³ con castillo esta de acuerdo que me sea transferido.\r\nEspero tus comentarios.\r\n\r\nGracias.','backup','Cambio PC','Hola, tÃº dime cuando puedo dejarlas sin PC, por lo menos toda la tarde de hoy, o el miÃ©rcoles, ya que maÃ±ana voy a Valencia.','2009-09-14 10:56:08',0,3,2,'','','2009-09-14 09:12:50'),
 (4,'luis silva','10','2009-09-14 09:36:33','Falla de correo externo','No enviar ni recibir correos externos ','backup','Correos','Buen dÃ­a, ya hay internet y correo.','2009-09-14 10:56:51',0,3,1,'','','2009-09-14 09:36:33'),
 (5,'GABRIELA','32','2009-09-14 11:38:19','SOLICITUD DE REGISTRO CTA. CONTABLE','fAVOR APERTURAR EN EL SISTEMA DE GESTION BANCARIA, EL CODIGO CONTABLE NRO. 1101020040, DEL BANCO EXTERIOR CTA. NRO. 082352-0.\r\nGRACIAS','angelfmr','Creacion Cuenta Bancaria','Ya en contabilidad estaba creada la cuenta, deben ingresar en el sistema de Gbancaria y agragarla por la la opcion de maestro de cuentas.\r\n','2009-09-14 18:18:20',0,3,1,'','','2009-09-14 11:38:19'),
 (6,'RIGOBERTO','3','2009-09-14 11:47:03','CAMBIO DE TECLADO','POR FAVOR NECESITO QUE ME CAMBIEN EL TECLADO, EN EL BLOQUE NUMERICO EL 1 Y EL 7 ESTAN DEMASIADO DUROS....','backup','Cambio de teclado','Este requerimiento fue atendido el lunes 14-09-2009 a las 2:00 pm','2009-09-16 10:27:52',0,3,1,'','','2009-09-14 11:47:03'),
 (7,'admsucbar','20','2009-09-15 09:40:35','aprobacion de pedidos','Buenos dias carlos por favor necesito la aprobacion de los suguientes pedidos (389057-389059) debido a la diferencia en precio que genera el saborizado de pollo. Gracias','cparada','Aprobacion de pedidos','Buenos dias, los pedidos ya fueron aprobados..','2009-09-15 09:49:46',0,3,1,'','','2009-09-15 09:40:35'),
 (8,'Tibisay','29','2009-09-15 10:53:52','Inconveniente en el Pase a Contabilidad','Se esta generando un ajuste compras paddy (cuenta 5101010003) en el precomprobante de traspaso correspondiente a la liquidaciÃ³n 18937 de AgrÃ­cola Durigua II, que no deberÃ­a existir, puesto que no ha sido realizado ningun cambio de precio en los boletos.','angelfmr','Solucionado centralizacion','Situacion solventada por Jose Ruiz en la tarde del 15-09-09','2009-09-15 16:20:10',0,3,1,'','','2009-09-15 10:53:52'),
 (9,'BRASILH','13','2009-09-15 11:05:24','ACTUALIZACION LISTA DE PRECIOS.','LA PRESENTE ES PARA COMUNICARLE QUE EL DIA DE HOY EL SEÃ‘OR JESUS CALDERON VENDEDOR 34 ACTUALIZO INFORMACION POR EL SISTEMA PALM EN LA OPCIÃ“N DE ACTUALIZAR LISTA DE PRECIO Y ESTE CULMINO CON ERRORES Y EL VENDEDOR LO INTENTO 3 VECES HASTA QUE EL RESULTADO FUE  CON EXITO.! PERO AL VERIFICAR LA INFORMACION LOS PRECIOS DE ARROZ SI FUERON ACTUALIZADOS. PERO EL PROBLEMA SE PRESENTA EN LOS OTROS PRODUCTOS YA QUE NO LE TRAE PRECIO. ','cparada','Se preparo informacion','Se preparo informaciÃ³n y se chequeo que los precios que estan incluidos son los que estan reflejados en la palm','2009-09-16 14:27:12',0,3,1,'','','2009-09-15 11:05:24'),
 (10,'Tibisay','29','2009-09-15 11:33:05','Problematica en el Pase a Contabilidad','Al seguir realizando los pases a contabilidad de las liquidaciones se puede observar que la mayorÃ­a que presenta la falla mencionada en la solicitud anterior son las que tienen camiones recibidos en fecha 07/09/2009. \r\n\r\nLas liquidaciones son:\r\n\r\n18937 - AgrÃ­cola Durigua II\r\n18941 - AgrÃ­cola San Charbel\r\n18972 - Agrop. Los Primos\r\n18942 - Agrocedros\r\n18947 - Agrop. Pratola\r\n18951 - Campodonico Antonio\r\n18934 - Cordero Pedro Luis\r\n18959 - Guarino Roberto\r\n18963 - Lopez Martin Clemente\r\n18965 - Menecola Lorenmig\r\n18966 - Muro Zulet Martin\r\n18969 - Pietrosanti Inavel\r\n18970 - Romano Salvatore\r\n\r\nEs importante tambien destacar que no todas las recepciones del 07/09/09 generan dicho ajuste, asimismo, la provisiÃ³n de compras del dÃ­a fue realizada con total normalidad y no se ha realizado ningun cambio de precio en el sistema que lo justifique.\r\n','angelfmr','Solucionado Centralizacion','Esta situacion fue solucionado por Jose Ruiz en la tarde del 15-09-09','2009-09-15 16:21:08',0,3,2,'','','2009-09-15 11:33:05'),
 (11,'BRASILH','13','2009-09-15 11:42:44','ACTULIAZACIO DE LISTA DE PRECIOS',' LE COMUNICO QUE EL VENDEDOR 72 ANDRES BRICEÃ‘O TAMBIEN TIENE PROBLEMAS CON LA ACTUALIZACION DE LISTA DE PRECIOS YA QUE ESTE AL VERIFICAR LOS PRECIOS SOLO LE TRAE DE LOS ARROCES 97%, 95% Y 99% Y DE LOS OTROS PRODUCTOS COMO SAL, CREMAS DE ARROZ, INTEGRAL NO LE MUESTRA PRECIOS.','cparada','se les preparo informacion','Se preparo informaciÃ³n y se chequeo que los precios que estan incluidos son los que estan reflejados en la palm','2009-09-16 14:27:37',0,3,2,'','','2009-09-15 11:42:44'),
 (12,'ggomez','5','2009-09-15 14:35:17','Regulador','Por favor hacerme llegar un regulador, ya que que mi equipo no tiene, y hay muchos problemas de luz, para evitar daÃ±os en el equipo.\r\n','backup','','','1000-01-01 00:00:00',0,2,2,'','','2009-09-15 14:35:17'),
 (13,'ADMSUCBAR','20','2009-09-15 15:56:41','Aprobacion de pedidos','Buenas tardes Carlos necesito por favor apruebes el siguiente pedido (3890591) esto debido a la diferencia en precio que genera el saborizado de pollo.','cparada','ya se aprobo el pedido','El sr. Carlos Matias dio la aprobacion a las 6 de la tarde','2009-09-15 18:57:40',0,3,1,'','','2009-09-15 15:56:41'),
 (14,'angelfmr','8','2009-09-15 16:12:55','Impresoras','No se estan generando las impresoras en el Servidor, Favor llamar al Sr. Juan Portero para pedir soporte.','backup','','','1000-01-01 00:00:00',0,2,1,'','','2009-09-15 16:12:55'),
 (15,'angirodriguez','32','2009-09-15 18:06:04','comprobante duplicado','hola mis comprobantes se estan duplicando. por favor recisa que es lo que pasa, gracias','cparada','se elimino el comprobante y se centralizo nuevamente','como el comprobante no estaba en compiere se elimno el comprobante de flexline y se centralizo de nuevo.','2009-09-15 19:22:35',0,3,2,'','','2009-09-15 18:06:04'),
 (16,'angirodriguez','32','2009-09-15 18:06:09','comprobante duplicado','hola mis comprobantes se estan duplicando. por favor recisa que es lo que pasa, gracias','cparada','se elimino el comprobante y se centralizo nuevamente','como el comprobante no estaba en compiere se elimno el comprobante de flexline y se centralizo de nuevo.','2009-09-15 19:22:47',0,3,2,'','','2009-09-15 18:06:09'),
 (17,'angelfmr','9','2009-09-15 18:11:29','Falla Internet en Barcelona','Yira estar pendiente de la falla de internet en Barcelona, se creo el numero de reporte 1517908, describiendo falla de internet muy lento con caida desde el dia de 14-09-09','backup','Internet Barcelona','Se llamÃ³ a la sucursal e informaron que estÃ¡n trabajando bien, que anoche trabajaron hasta las 7:15 y todos los usuarios apagaron los PC','2009-09-16 10:32:04',0,3,2,'','','2009-09-15 18:11:29'),
 (18,'angelfmr','9','2009-09-15 18:12:55','Falla Internet Iancarina-Araure','Yira se creo un reporte para la conexion de Iancarina-Araure 1517909, con la descripcion de internet muy lento desde el 14-09-09 ','backup','','','1000-01-01 00:00:00',0,2,2,'','','2009-09-15 18:12:55'),
 (19,'ADMSUCBAR','20','2009-09-15 18:15:37','Aprobacion de pedidos','Buenas noches carlos te recuerdo que estoy esperando por la aprobacion del pedido nro 3890591, debido a que me esta generando una diferencia en precio por el arroz saborizado de pollo.','cparada','ya se aprobo el pedido','El sr. Carlos Matias dio la aprobacion a las 6 de la tarde ','2009-09-15 18:58:03',0,3,1,'','','2009-09-15 18:15:37'),
 (20,'frankeyra','4','2009-09-16 08:07:38','En el texto','Buenos dias la presente es para informar que mi computadora poseia dos reguladores el cual protegia la maquina perfectamente, este mismo fue llevado por el personal de informatica y desde ese entonces mi maquina presenta falla y se apaga. Necesito un regulador ya que este que poseo se quemo.\r\nSin mas que agregar y Agradeciendo su entera colaboracion.','angelfmr','Situacion UPS y Regulador','Ok revisaremos la situacion ocurrida.','2009-09-16 10:13:18',0,3,1,'','','2009-09-16 08:07:38'),
 (21,'frankeyra','4','2009-09-16 08:07:46','En el texto','Buenos dias la presente es para informar que mi computadora poseia dos reguladores el cual protegia la maquina perfectamente, este mismo fue llevado por el personal de informatica y desde ese entonces mi maquina presenta falla y se apaga. Necesito un regulador ya que este que poseo se quemo.\r\nSin mas que agregar y Agradeciendo su entera colaboracion.','angelfmr','Situacion Regulador y UPS','Ok revisaremos que ocurrio con los equipos','2009-09-16 10:12:25',0,3,1,'','','2009-09-16 08:07:46'),
 (22,'frankeyra','4','2009-09-16 08:07:50','En el texto','Buenos dias la presente es para informar que mi computadora poseia dos reguladores el cual protegia la maquina perfectamente, este mismo fue llevado por el personal de informatica y desde ese entonces mi maquina presenta falla y se apaga. Necesito un regulador ya que este que poseo se quemo.\r\nSin mas que agregar y Agradeciendo su entera colaboracion.','angelfmr','Situacion Regulador y UPS','Yira estara revisando el estado de los equipos para determinar si se debe adquirir uno nuevo.','2009-09-16 10:18:55',0,3,1,'','','2009-09-16 08:07:50'),
 (23,'BRASILH','13','2009-09-16 08:32:04','Actualizacion de lista de precios','Le comunico que todavia no a sido solucionado el problema de la lista de precios.. el cual se presenta  en los vendedores 34 jesus calderon no le muestra precios de los terceros productos igualmente el 72 andres briceÃ±o y 35 jose del rosario.   y en cuanto al 33 omar uribe no le muestra el rubro del integral.','cparada','Se preparo informacion','Se preparo informaciÃ³n y se chequeo que los precios que estan incluidos son los que estan reflejados en la palm','2009-09-16 14:27:26',0,3,1,'','','2009-09-16 08:32:04'),
 (24,'iinciarte','19','2009-09-16 09:14:24','Centralizacion','1- En la centralizacion del dia 15/09/2009 comprobante de Traspaso 323562 me salio el codigo del cliente 50175 no posee codigo de transaccion.\r\n2- La transaccion para el producto no existe:\r\n   0201219724\r\n   0240264125\r\n   0253225312\r\n   0253225212\r\n   0253225112\r\n   0303045012\r\n   0303090006\r\n3- No posee Cuenta de Venta\r\n4- No posee cuenta de IVA    ','cparada','Se coloco el tipo de transaccion al cliente','se coloco el tipo de transaccion 1 al cliente en el maestro de clientes','2009-09-16 17:07:51',0,3,1,'','','2009-09-16 09:14:24'),
 (25,'ADMSUCBAR','1','2009-09-16 09:33:00','falla de impresion','Buenos dias Carlos hago de tu conocimiento que no puedo imprimir las facturas por la maquina de puntos (epson lx-300+II)mucho sabria agradecer la coloboracion que me puedas prestar para la pronta solucion del caso ya expuesto.','angelfmr','Situacion conlas impresoras','Debido a errores en los servidores hemos tenido inconvenientes con las impresoras, ya hoy se debe regularizar la situacion.','2009-09-16 10:14:15',0,3,1,'','','2009-09-16 09:33:00'),
 (26,'wendy','4','2009-09-16 10:10:13','solicitud de ups maquina de Tecnicos','LA COMPUTADORA QUE SE ENCUENTRA EN EL DPTO DE COORDINACION LA CUAL TRABAJA CON UNA ANTENA LOCAL. FUE CAMBIADA HACE UNA SEMANA LA CUAL TRABAJA CON UN REGULADOR PERO APENAS HAY UNA BAJA DE LUZ LA CUAL ES FRECUENTE SE APAGA CONSTANTEMENTE. SE REALIZA LA SOLICITUD DE UN UPS PARA PODER TRABAJAR LOS TECNICOS EN LAS ESTIMACIONES PARA LOS REPORTES DIARIOS E INGRESOS DE LOS INFORMES DE CAMPO. \r\nESPERANDO RESPUESTA DE LA SOLICITUD LO MAS PRONTO POSIBLE...','backup','UPS','Hoy en la tarde viene el proveedor que traerÃ¡ las baterÃ­as, para los UPS que se tienen en el departamento, una vez que las traiga, se le asignarÃ¡ un UPS','2009-09-16 10:30:15',0,3,1,'','','2009-09-16 10:10:13'),
 (27,'admsucbar','13','2009-09-16 10:12:05','problemas palm zona 83.84.85 ','Muy buenos dias, la presente es para recordarle tal conmo hablamos via telefonica el dia de ayer 15/09/09 que los vendedores de las zonas 83,84 y 85 tienen problemas para trabajar con su palm,el caso de la zona 84 es que no ve el maestro de clientes y por lo tanto no puede tomr ningun pedido y cuando trata de actualizar dice que no tiene datos que recibir, este problema se presenta desde la semana pasada (notificado por la Sra. Jessica Hidalgo) y el sr. Pedro Papic tiene conocimiento del mismo, el caso de la zona 85 dice no tiene nada que recibir, le aparecen los clientes, mas no los productos a facturar, el caso se presenta desde la semana pasada tambien notificado por la Sra. Jessica Hidalgo al Sr. Pedro Papic, la zona 83 le aparece la informacion diaria a pesar de enviarla (a pesar de enviar la informacion no se borra de pantalla), pasa los pedidos pero no la recibimos ( a pesar de que da el mensaje de finalizado con exito)\r\n\r\n\r\n\r\n','cparada','Se preparo informacion','se preparo informacion y se chequeo que la informacion fuera correcta','2009-09-16 16:39:13',0,3,1,'','','2009-09-16 10:12:05'),
 (28,'admsucbar','21','2009-09-16 11:54:07','problemas con impresion de guias de despacho','Buenos dias seÃ±or carlos le agradesco m solucione el problema que tengo con respeto a la impresion de las siguientes .guias 1351 y 1346 1318 1317 ya que solo pude imprimir la conformidad \r\ngracias...','cparada','IMPRESION DE GUIAS DE DESPACHO','SE CAMBIO EL ESTATUS DEL VEHICULO Y SE GENERO NUEVAMENTE LA GUIA DE DESPACHO','2009-09-17 08:39:12',0,3,1,'','','2009-09-16 12:03:20'),
 (29,'anagoropeza','15','2009-09-16 12:00:26','COMPROBANTEI ING CARACAS 229556','BUENOS DIAS SR. ANGEL LA PRESENTE ES PARA NOTIFICARLE QUE EN EL SISTEMA DEL SPC CUANDO CONSULTO POR \"HISTORICO PASE DETALLADO\" EL COMPROBANTE 229556 NO ME APARECE, EN CASO CONTRARIO CUANDO LO CONSULTO POR  EL MAYOR DE LA CONTABILIDAD \"FLEXLINE\" APARECE CORRECTAMENTE. \r\nNOTA: CUANDO CONSULTO CUALQUIER DOCUMENTO POR SEPARADO DE DICHO DOCUMENTO ME APARECE CENTRALIZADO EN EL COMP DE CAJA 229558','angelfmr','COMPROBANTEI ING CARACAS 229556 ','solucionado por Jose Ruiz','2009-09-22 11:42:24',0,3,2,'','','2009-09-16 12:00:26'),
 (30,'admsucbar','1','2009-09-16 12:14:37','problemas con el icono iancarina','Hola buenos dias hace como dos horas nos llamaron desde Acarigua para que entraramos al citrix por el icono de iancarina  no por el backcitrix como lo etabamos haciendo sin embargo desde ese icono ningun usuario podia imprimir, por sugerencia del sr. Carlos Matias entramos por backcitrix ya que por alli si  podemos imprimir luego te llame y aprobastes que entraramos por ese icono, a fin de que sepas que estamos trabajando bajo el backcitrix','cparada','conexion citrix','ok no hay ningun problema que trabajes por alli mientras no tengas inconvenientes','2009-09-16 16:41:16',0,3,1,'','','2009-09-16 12:14:37'),
 (31,'ADMSUCBAR','20','2009-09-17 14:37:51','Aprobacion de pedido',' Buenas Tardes Carlos por favor necesito la aprobacion de el pedido nro (388580) debido a que el sistema no me permite su aprobacion por generar una diferencia en precio. llama a el Sr. Carlos Matias para que te de la aprobacion. Gracias','cparada','aprobacion de pedido','se aprobo el pedido despues de hablar con el Sr. Carlos Matias','2009-09-17 15:49:20',0,3,2,'','','2009-09-17 14:37:51'),
 (32,'CARLOS18CASTRO','18','2009-09-17 15:49:56','PROBLEMA EN LA ASIGNACION DE DESPACHO','BUENAS DIAS PEDRO QUERIA VER SI ME PUEDES AYUDAR QUE EN EL MODULO DE DESPACHO YA HACE COMO UN A;O ME APARECEN LOS PEDIDOS YA FACTURADOS Y ESO INCOMODA AL MOMENTO DE FACTURAR POR FAVOR SI ME PUEDES RESOLVER ESTO TE LO AGRADEZCO.....','pedro','','','1000-01-01 00:00:00',0,1,1,'CARLOS18CASTRO_20091117_161631_ERROR EN MODULO DE DESPACHO.doc','','2010-01-05 10:04:03'),
 (33,'CARLOS18CASTRO','13','2009-09-17 15:53:47','PROBLEMA EN SISTEMA DE PALM','DESDE HACE DIA SE HA VENIDO TRABAJANDO CON LAS PALM PERO HAN PRESENTADO PROBLEMA YA QUE AL MOMENTO DE TRANSMITIR ESTAN DUPLICANDO LOS PRODUCTOS Y SALEN REFLAJANDO PRECIOS ANTERIORES POR FAVOR REVIZAR YA QUE ESTO TRAE PROBLEMA EN EL MOMENTO DE FACTURACION','pedro','','','1000-01-01 00:00:00',0,2,1,'','','2009-09-23 14:55:35'),
 (34,'jose ramirez','45','2009-09-17 15:57:52','duplicacion movimiento comp.de makro suc.barcelona','BUENAS TARDES.\r\nSIRVA LA PRESENTE PARA INFORMARLES EN EL COMPROBANTE # 725777 DE FECHA 17/09/2009 EN LA LINEA 1 Y 2 ESTOS MOVIMIENTOS FUERON REALIZADOS EN EL COMPROBANTE # 725759 DEL 31/08/2009.\r\n\r\nAGRADEZCO ME SOLUCIONE ESTA SITUACION.','angelfmr','duplicacion movimiento comp.de makro suc.barcelona ','Resuelto por Jose ruiz','2009-09-22 11:43:22',0,3,2,'','','2009-09-17 15:57:52'),
 (35,'tania','18','2009-09-17 16:36:50','conformidad de carga','se le dio conformidad a la guia n` 1955 se gravo y no tomo la guia de despacho la segunda opcion','cparada','IMPRESION DE GUIAS DE DESPACHO','SE CAMBIO EL ESTATUS DE LA ORDEN DE CARGA Y SE GENERO NUEVAMENTE LA GUIA DE DESPACHO','2009-09-17 16:42:04',0,3,2,'','','2009-09-17 16:36:50'),
 (36,'tania','1','2009-09-18 08:13:44','Configuracion de impresoras','Favor configurar la impresora del almacen HP810C desconfigurada','cparada','Impresion hp810','Se va a imprimir temporalmente por la impresora laser 2015 hasta que se resuelva el problema de impresion del servidor.','2009-09-18 09:04:22',0,3,2,'','','2009-09-18 08:13:44'),
 (37,'RIGOBERTO','1','2009-09-18 08:22:49','ERROR EN IMPRESORA CORISA','ESTE ERROR SE MUESTRA CUANDO TRATAN DE IMPRIMIR CIERTOS REPORTES DEL SPI','backup','ImpresiÃ³n CORISA','Se les va a enviar una aplicaciÃ³n para que se puedan conectar de otra forma, ya que en el servidor donde trabajan actualmente no ha sido solucionado por completo el problema de las impresoras, el proveedor de servicios estÃ¡ trabajando en eso.','2009-09-24 09:17:00',0,3,1,'RIGOBERTO_20090918_82249_error nomina.doc','','2009-09-18 08:22:49'),
 (38,'admsucbar','14','2009-09-18 08:40:33','Comprobantes de Traspaso',' Buenos dias Carlos estoy tratando de imprimir el comprobante de traspaso Nro. 722828 en el modulo de intercambio y me presenta el siguiente error (Variable \"Reserva\" is not found. Rixabel','angelfmr','Comprobantes de Traspaso ','Resuelto por Jose Ruiz','2009-09-22 11:44:09',0,3,1,'','','2009-09-18 08:40:33'),
 (39,'admsucbar','14','2009-09-18 08:40:40','Comprobantes de Traspaso',' Buenos dias Carlos estoy tratando de imprimir el comprobante de traspaso Nro. 722828 en el modulo de intercambio y me presenta el siguiente error (Variable \"Reserva\" is not found. Rixabel','cparada','Impresion de Comprobantes','Jose Gregorio modifico la base de datos.','2009-09-18 18:23:21',0,3,1,'','','2009-09-18 08:40:40'),
 (40,'cmelo','14','2009-09-18 09:12:17','error en centralizacion de ventas','buen dia en la maÃ±ana de hoy en el proceso de centralizacion en intercambio dio la siguiente leyenda de error\" variable reversa is not found\", en consecuencia no se pudo imprimir el comprobante de traspaso NÂº 323564','cparada','Error de Centralizacion en Ventas','Jose Gregorio modifico el programa','2009-09-21 11:54:34',0,3,1,'','','2009-09-18 09:12:17'),
 (41,'cmelo','14','2009-09-18 09:12:23','error en centralizacion de ventas','buen dia en la maÃ±ana de hoy en el proceso de centralizacion en intercambio dio la siguiente leyenda de error\" variable reversa is not found\", en consecuencia no se pudo imprimir el comprobante de traspaso NÂº 323564','cparada','Error de Centralizacion en Ventas','Jose Gregorio modifico el programa','2009-09-21 11:54:21',0,3,1,'','','2009-09-18 09:12:23'),
 (42,'cmelo','14','2009-09-18 09:12:27','error en centralizacion de ventas','buen dia en la maÃ±ana de hoy en el proceso de centralizacion en intercambio dio la siguiente leyenda de error\" variable reversa is not found\", en consecuencia no se pudo imprimir el comprobante de traspaso NÂº 323564','cparada','error en centralizacion de ventas ','Solucionado Jose Gregorio Modifico el programa','2009-09-21 11:51:42',0,3,1,'','','2009-09-18 09:12:27'),
 (43,'anais','38','2009-09-18 09:37:30','ausencia de marcajes en el sistema columbus','Buen dia:\r\nEl motivo de esta solicitud obedece a que el dia de hoy 18/09/09 hay ausencia de marcajes, los mismos se ven reflejados en el sistema veritrax pero no se exporta al sistema columbus (hice varios intentos). \r\nAgradezco lo que puedan hacer al respecto y en espera de una pronto respuesta.','backup','Marcaje','Ya se llamÃ³ al proveedor para que viniera a chequear la situaciÃ³n.','2009-09-24 09:18:19',0,3,1,'','','2009-09-22 08:41:37'),
 (44,'yoly lacruz','6','2009-09-19 11:11:24','Lentitud de equipo','El equipo esta muy lento ','backup','Lentitud PC','Hola, se le colocÃ³ 256 MB de RAM, quedando con 512MB. Cualquier consa me avisas.\r\n','2009-09-24 09:27:41',0,3,2,'','','2009-09-19 11:11:24'),
 (45,'angirodriguez','32','2009-09-21 11:40:50','Error de centralizacion','Error de centralizacion en Gesation Bancaria','cparada','Error de Centralizacion en Gestion Bancaria','Se elimino el comprobante de flexline y se volvio a centralizar','2009-09-21 11:45:00',0,3,1,'angirodriguez_20090921_114050_ERROR_CENTRALIZACION.bmp','','2009-09-21 11:40:50'),
 (46,'RIGOBERTO','40','2009-09-21 16:34:53','TALLER TECNICO Y SEGURIDAD SPI','BUENAS TARDES;\r\nLE INFORMO QUE EL TALLER TECNICO Y SEGURIDAD SPI, SE DICTARA LOS DIAS 06/07 DE OCTUBRE, Y SEGUN LO CONVERSADO EL POSTULADO POR INFORMATICA ES CARLOS PARADA.- TENEMOS BOLETOS DE IDA PARA EL DIA 05/10 A LAS 5 PM, POR LO CUAL ESTAREMOS EN LA CIA HASTA LAS 03PM, AGRADECIENDO SU COLABORACION\r\nATTEN.-\r\nRIGOBERTO ORTEGA','cparada','TALLER TECNICO Y SEGURIDAD SPI ','Ok, confirmado estamos en contacto.','2009-09-23 15:29:14',0,3,2,'','','2009-09-23 15:28:09'),
 (47,'angelfmr','21','2009-09-22 08:43:07','Reporte diario producto terminado','Hola, por favor arreglar los grupos de productos para que salgan ordenados segun su presentacion en los reportes de almacen.','Smariani','Reporte Diario proucto terminado','Listo','2009-09-23 10:02:13',0,3,2,'','','2009-09-22 08:43:07'),
 (48,'ADMSUCBAR','20','2009-09-22 08:56:31','Aprobacion de pedidos','Buenos dias Carlos, necesito que por favor llames a el Sr Carlos Matias para que te autorice aprobar los siguientes pedidos (388580-3885801) porque voy a despachar una mercancia que me quebada en almacn a precio de Bs. 54.80 (Sup 99% 24x1 - Prem 99% 24x1 - Prem 12x2). Rixabel','cparada','aprobacion de pedido','Se aprobaron los pedidos despues de conversar con el sr. Carlos Matias.','2009-09-22 11:03:54',0,3,1,'','','2009-09-22 08:56:31'),
 (49,'Tibisay','29','2009-09-22 16:47:29','Error en Pase a Contabilidad','Se presento error en el pase a contabilidad desde el sistema de productores. Se adjunta la pantalla que mostrÃ³...!','cparada','ERROR PASE CONTABLE DE PRODUCTORES','SOLUCIONADO JOSE GREGORIO MODIFICO EL PROGRAMA.','2009-09-23 15:19:28',0,3,1,'Tibisay_20090922_164729_Error en Pase.bmp','','2009-09-22 16:47:29'),
 (50,'BRASILH','13','2009-09-23 09:06:27','RECEPCION DE INFORMACION','LA PRESENTE ES PARA COMUNICARLE QUE EL DIA DE HOY EL VENDEDOR 35 JOSE DEL ROSARIO ENVIO INFORMACION PERO ESTA NO FUE RECIBIDO... YA EL VENDEDOR EN VIO NUEVAMENTE CON EXITO. Y NO SE RECIBIO LA INFORMACION','cparada','recepcion de informacion','se descargo la informacion nuevamente','2009-09-23 09:11:14',0,3,1,'','','2009-09-23 09:06:27'),
 (51,'valencia','20','2009-09-23 10:01:11','aprobacion de pedido','buenos dÃ­as Sres. de Informatica mediante la presente solocito con caracter de urgencia la aprobaciÃ³n de los pedidos # 20002028 merkapark # 260026071 viveluso # 260026151 Cooperativa Mercalibre 35.que se encuetran bajo precio, la gandola la tenemos ya por cargar.\r\n\r\nsaludos!','pedro','','','1000-01-01 00:00:00',0,1,1,'','','2009-11-30 10:29:37'),
 (52,'valencia','20','2009-09-23 10:01:17','aprobacion de pedido','buenos dÃ­as Sres. de Informatica mediante la presente solocito con caracter de urgencia la aprobaciÃ³n de los pedidos # 20002028 merkapark # 260026071 viveluso # 260026151 Cooperativa Mercalibre 35.que se encuetran bajo precio, la gandola la tenemos ya por cargar.\r\n\r\nsaludos!','pedro','','','1000-01-01 00:00:00',0,1,1,'','','2009-11-30 10:31:15'),
 (53,'valencia','13','2009-09-23 10:06:47','Palms','Tenemos inconvenientes a la hora de transmitir y procesar pedidos con las plams de los representantes de ventas: Alfonso Perez y Jaime Rosas de la sucursal Valencia.','angelfmr','Situacion Palms','Hola, estamos al tanto de algunos inconvenientes que estamos teniendo con vendedores que no tienen actualziado el equipo ya sea porque estaba ausente o equipo daÃ±ado. En estos momento el Sr. Pedro esta de reposo y se incorpora muy pronto, te aseguramos que en lo que llegue solucionaremos esta situacion.\r\nSaludos, Angel','2009-09-23 10:21:34',0,3,1,'','','2009-09-23 10:06:47'),
 (54,'BRASILH','13','2009-09-23 10:22:36','Envio de informaciÃ³n',' el dia de hoy se preparo informacion a todos los vendedores y se les indico que hiceran la actualizacion por la opcion cxc. estos  ahora me indican que no tienen datos que recibir. por favor verificar cual es el error que se esta presentado.','cparada','recepcion de informacion','a pesar que el sistema le dijo que no tenian datos para recibir los vendedores trabajaran asi por el dia de hoy.','2009-09-23 14:51:43',0,3,1,'','','2009-09-23 10:22:36'),
 (55,'BRASILH','13','2009-09-23 11:41:19','PROBLEMAS PARA RECIBIR INFORMACION',' SE LE INFORMO A LOS VENDEDORES QUE REALIZARAN NUEVAMENTE LA ACTUALIZACION DE LA CXC PERO AUN EL SISTEMA LE INDICA QUE NO TIENE DATOS QUE RECIBIR LOS VENDEDORES QUE PRESENTAN EL ERROR SON: 02, 04, 33, 35, 72.  EL VENDEDOR 34 FUE EL UNICO QUE TUVO EXITO EN LA RECEPCION DE LA INFORMACION.','cparada','recepcion de informacion','a pesar que el sistema le dijo que no tenian datos para recibir los vendedores trabajaran asi por el dia de hoy.','2009-09-23 14:51:29',0,3,1,'','','2009-09-23 11:41:19'),
 (56,'supcxcbar','14','2009-09-23 12:17:18','Error en Correlativo Comprobante de Ingreso','Buenos Dias.\r\nLe informo que el dÃ­a 23/09/09 al momento de preparar un comprobante de Ingreso con el correlativo nÂº 725790, el sistema me arroja un mensaje que dice que ese correlativo ya ha sido centralizado el que corresponde es el 735308, lo que es totalmente falso porque deberia seguirle el nÂº 725790 ya que el ultimo comprobante procesado fue el comprobante nÂº 725789.\r\nLe agradeceria lo que pudiera ayudarme con respecto a este caso. \r\nLe saluda cordialmente, \r\nJessica Hidalgo \r\nSup. Credito y Cobranza.','cparada','Correlativos de comprobante','Jose Gregorio modifico el programa para resolver esta situacion','2009-09-24 12:22:34',0,3,2,'supcxcbar_20090923_121718_error-centralizacion.bmp','','2009-09-23 15:27:51'),
 (57,'NDIAZ','29','2009-09-23 15:38:09','Inconvenientes en el pase a contab.-reverso de comprobantes','Por instrucciones del IngÂº Roberto, se debe cambiar el nombre de productores a boletas de rececpines que ya estÃ¡n en provisiÃ³n, al intentar reversar los comprobantes se ha generado un error y no se puede concluir con el proceso.','angelfmr','Asiento de reverso','Atendido por Ruiz','2009-09-24 15:42:37',0,3,1,'NDIAZ_20090923_153809_Error pase contabilidad.bmp','','2009-09-23 15:38:09'),
 (58,'cmelo','19','2009-09-24 08:36:22','error en centralizacion de ventas','CARLOS NECESITO SABER SI ME PUEDES AYUDAR EN ESTO, YA QUE ALEXANDER NO  SE ENCUENTRA EN ACARIGUA, YO LE PASE ESTE MISMO CORREO PERO NO ME HA RESUELTO.\r\nTE EXPLICO: IRENE CENTRALIZO AYER EN LA MAÃ‘ANA EL DIA 22/09 CON OCMPORBANTE DE TRASPASO NÂº 323567 AL MOMENTO DE CENTRALIZAR SALIO LA SIGUIENTE LEYENDA\" LA TRANSACCION PARA EL PRODUCTO 0208-210101 NO EXISTE\". POR LO TANTO  NO SE PUDO CENTRALIZAR ESTE DIA.','cparada','Error de Centralizacion en Ventas','Alexander resolvio esta situacion.','2009-09-25 09:16:26',0,3,1,'','','2009-09-24 08:36:22'),
 (59,'cmelo','19','2009-09-24 08:36:27','error en centralizacion de ventas','CARLOS NECESITO SABER SI ME PUEDES AYUDAR EN ESTO, YA QUE ALEXANDER NO  SE ENCUENTRA EN ACARIGUA, YO LE PASE ESTE MISMO CORREO PERO NO ME HA RESUELTO.\r\nTE EXPLICO: IRENE CENTRALIZO AYER EN LA MAÃ‘ANA EL DIA 22/09 CON OCMPORBANTE DE TRASPASO NÂº 323567 AL MOMENTO DE CENTRALIZAR SALIO LA SIGUIENTE LEYENDA\" LA TRANSACCION PARA EL PRODUCTO 0208-210101 NO EXISTE\". POR LO TANTO  NO SE PUDO CENTRALIZAR ESTE DIA.','cparada','error en centralizacion de ventas ','Alexander resolvio esta sitiacion.','2009-09-25 09:16:00',0,3,1,'','','2009-09-24 08:36:27'),
 (60,'cmelo','15','2009-09-24 09:47:16','Error para preparar comprobantes de ingreso','Carlos: tal como te notifico la Sra. Irma esta maÃ±ana al preparar comprobante de INgreso, se pordujo un error\r\n1- Pide data\r\n2- LUego sale otro cuadro que dice: \"Error COntrol de Costos\" no puede continuar.\r\nIrma me comento que uds. le informaron que debian esperar a Jose Gregorio para resolver dicho caso.\r\n\r\n','cparada','Error en Centralizacion','Jose Gregorio modifico el programa para resolver esta situacion','2009-09-24 12:23:15',0,3,1,'','','2009-09-24 09:47:16'),
 (61,'BRASILH','13','2009-09-24 09:55:47','ActualizaciÃ³n de las cxc.','buenos dias le informo que el vendedor 34 actulizo por cxc y culmino con exito, pero la informacion esta duplicada.','pedro','Actualizar Palm Vend 34','Buenos dÃ­as, por favor pidele al sr. Jesus (vend 34) que actualice nuevamente.','2009-09-24 10:38:44',0,3,1,'','','2009-09-24 09:55:47'),
 (62,'facturacionval','20','2009-09-24 10:02:47','Aprobacion de Pedido Bajo Precio','Buenos dias Carlos solicito la aprobacion del pedido # 260026071 que se encuentra bajo precio.\r\n\r\nSaludos!!','cparada','aprobacion de pedido','Se aprobo despues de conversacion con el Sr. Carlos Matias','2009-09-24 12:03:12',0,3,1,'','','2009-09-24 10:02:47'),
 (63,'BRASILH','14','2009-09-24 10:08:51','centralizaciÃ³n de comprobante.',' buenos dia, la presente es para comunicarle que hoy se esta presentando un error en el modulo de intercambio de datos en el momento de traspaso a contabilidad ene esta aparece una ventana que indica: seleccionar datos de origen. ','angelfmr','Error de centralziacion','Ya esta solucionado puede volver a realziar la centralizacion','2009-09-24 15:41:14',0,3,1,'BRASILH_20090924_100851_error de centralizacion.doc','','2009-09-24 10:08:51'),
 (64,'Nathalie','17','2009-09-24 11:12:17','en el texto','To: Angel MuÃ±oz \r\nCc: Liseth Rodriguez \r\nSent: Wednesday, September 23, 2009 5:41 PM\r\nSubject: Cod Cliente duplicado!\r\n\r\n\r\n    Buenas tardes, sirva el presente para informarle que el Cliente AGROPECUARIA MARY, S.A. Codigo NÂ° 9101, se encuentra duplicado, razon por la cual se solicita de su ayuda y colaboraciÃ³n al respecto, a la brevedad posible.\r\n \r\n    Sin mÃ¡s a que hacer referencia y esperando su colaboraciÃ³n y pronta respuesta.\r\n \r\n    Atentamente;\r\n \r\n    Nathalie Hidalgo.\r\n    Asist. de FacturaciÃ³n.\r\n    Ext. NÂ° 156. \r\n ','angelfmr','Caso cliente 9101','Esta listo su requerimiento','2009-09-24 15:40:10',0,3,2,'','','2009-09-24 11:12:17'),
 (65,'Johanna ','14','2009-09-24 14:32:59','REVISION DE DESCRIPCION DE PRODUCTO ','EN COMPROBANTE REALIZADO POR LA SRTA DINAURY EL DIA 24/09/09 AL MOMENTO DE SER CENTRALIZADO EL COMPROBANTE DE TRASPASO NÂº 732661 EN LA CUENTA 4101010027 QUE CORRESPONDE A LA AVENA EN HOJUELAS,(25x1)NO SE ENCUENTRA LA DESCRIPCION DE DICHO PRODUCTO.\r\nSE LE AGRADECE REALIZAR DICHA CORRECCION EN EL COMPROBANTE QUE SE LE ENTREGARA EL DIA DE HOY A LA LCDA ANA OROPEZA.\r\nSE LE AGRADECE LA COLABORACION AL RESPECTO.\r\nSALUDOS','angelfmr','error en cuenta','Realizado','2009-10-01 16:14:25',0,3,1,'','','2009-09-24 14:32:59'),
 (66,'admsucbar','20','2009-09-25 08:48:47','Precio para el arroz superior tipo 1','Buenos dias Carlos estoy facturando el arroz superior tipo 1 pero no me toma el precio, por favor podrias verificar esto gracias. Rixabel','cparada','Precio para el arroz superior tipo 1 ','Se modifico la lista de precios ya que la que paso el Sr. Carlos Matias no tenia incluido el precio en la hoa de sistema','2009-09-25 09:11:03',0,3,1,'','','2009-09-25 08:48:47'),
 (67,'wendy','24','2009-09-25 16:38:46','ERROR SISTEMA DE PRODUCTORES-Estimaciones','EL IngÂºDAVILMAR SOTELDO REALIZA A DIARIO LA INCLUSION DE LOS INFORMES TECNICOS DE CADA PRODUCTOR EN EL MODULO DE ESTIMACION Y AL ESTAR REALIZANDO EL VACIADO DE LA INFORMACION SE LE PRESENTA CONSTANTEMENTE UN ERROR \"QUE NO TIENE ACCESO\" O UNA PANTALLA QUE DETALLA EL ERROR Index does not match the table. Delete the index file and re-create the index.\r\nLOS TECNICOS QUE UTILIZAN ESTE MODULO SE HAN QUEJADO ULTIMAMENTE POR NO PODER REALIZAR EL TRABAJO DE LAS INCLUSIONES DE LOS INFORMES TECNICOS DE LOS LOTES POR TENER QUE SALIRSE DEL SISTEMA CADA VEZ QUE DA ESTE ERROR A PARTE DE ESO SE CUELGA.','angelfmr','sistema de estimaciones','Resulto por jose Ruiz','2009-11-10 18:39:35',0,3,1,'wendy_20090925_163846_ERROR SISTEMA.odt','','2009-09-25 16:38:46'),
 (68,'BRASILH','14','2009-09-25 17:25:00','Error de centralizaciÃ³n','buenas tardes le comunico que el dia 24/09/09 se presento un error a la hora de centralizacion del operardor nÂ° 5 en ella se elaboraron seis notas de debito por cheque devuelto pero al monmento de centralizar solo se traspasaron tres notas y las otras tres quedaron  por fuera pero no estan pendiente en ningun operardor.','cparada','Error de centralizaciÃ³n','ALEXANDER HABLO CON JOSE GREGORIO PARA RESOLVER ESTA SITUACION','2009-09-29 16:38:37',0,3,2,'','','2009-09-25 17:25:00'),
 (69,'facturacionval','20','2009-09-28 09:46:27','en el texo','Buenos dias Carlos Solicito por favor la aprobaciÃ³n de pedido # 2509097 por producto 97% Bajo Precio Bs. 64.30\r\n\r\nsaludos!!','cparada','aprobacion de pedido','esto ya no se va a facturar','2009-09-28 14:20:23',0,3,1,'','','2009-09-28 09:46:27'),
 (70,'BRASILH','14','2009-09-28 11:33:12','ERROR EN CENTRALIZACION',' HOLA BUEN DIA.. \r\nLAS NOTA DE DEBITO QUE DEBERIAN APARECER EN EL MOVIMIENTO 5 PENDIENTES POR CENTRALIZAR SON: 275, 276, 277 TODAS DE FECHA  24/09/09','cparada','ERROR EN CENTRALIZACION','ALEXANDER HABLO CON JOSE GREGORIO PARA RESOLVER ESTA SITUACION','2009-09-29 16:39:04',0,3,1,'','','2009-09-28 11:33:12'),
 (71,'BRASILH','14','2009-09-28 11:33:18','ERROR EN CENTRALIZACION',' HOLA BUEN DIA.. \r\nLAS NOTA DE DEBITO QUE DEBERIAN APARECER EN EL MOVIMIENTO 5 PENDIENTES POR CENTRALIZAR SON: 275, 276, 277 TODAS DE FECHA  24/09/09','cparada','ERROR EN CENTRALIZACION','ALEXANDER HABLO CON JOSE GREGORIO PARA RESOLVER ESTA SITUACION','2009-09-29 16:38:54',0,3,1,'','','2009-09-28 11:33:18'),
 (72,'facturacionval','20','2009-09-28 14:05:23','en el texto','Buenas tardes solicito por favor la aprobaciÃ³n con caracter de urgencia de los pedidos # 390358, 384765 que se enuentran bajo precio.\r\n\r\nsaludos!','cparada','aprobacion de pedido','CARLOS MATIAS DIO APROBACION A UN SOLO PEDIDO','2009-09-28 14:51:00',0,3,1,'','','2009-09-28 14:05:23'),
 (73,'admsucbar','20','2009-09-28 16:51:08','Aprobacion de Pedidos','Buenas tardes Carlos necesito por favor me apruebes los siguientes pedidos (82001551-82001555-82001556)ya que en logistica me rechaza su aprobacion por la diferencia en precio que genera el saborizado de pollo. Gracias. Rixabel','cparada','aprobacion de pedido','Se aprobaron los pedidos despues de hablar con el Sr. Carlos Matias','2009-09-29 08:30:47',0,3,1,'','','2009-09-28 16:51:08'),
 (74,'admsucbar','20','2009-09-29 17:07:48','Aprobacion de pedido','Buenas tardes Carlos, necesito la aprobacion de los siguientes pedidos (389087-389086) gracias. Rixabel ','cparada','aprobacion de pedido','se aprobaron los pedidos despues de conversacion con el Sr. Carlos Matias','2009-09-30 08:14:08',0,3,1,'','','2009-09-29 17:07:48'),
 (75,'facturacionval','20','2009-09-30 08:54:57','EN EL TEXTO','Buenos dias Carlos! solicito por favor la aprobaciÃ³n del Pedido # 2525251 del cliente ISMAIL RAFIC BAHIJ (COM. MAYE) con 1440 bultos de Superior Tipo 1. con 64.30\r\n\r\nSaludos!!','cparada','aprobacion de pedido','Se aprobo el pedido despues de hablar con el Sr. Carlos Matias.','2009-09-30 12:07:27',0,3,1,'','','2009-09-30 08:54:57'),
 (76,'NDIAZ','24','2009-09-30 17:46:14','Factura proveedores','Por error ingrese una factura de proveedor con el nÃºmero equivocado, no lo he pasado a contabilidad, intento anularla en anulacion factura proveedor y no me permite hacerlo. Aun no he hecho el proceso de pase productores con esta factura.','angelfmr','Factrura proveedor','Resuelto por Jose Ruiz','2009-10-06 10:18:44',0,3,1,'NDIAZ_20090930_174614_Error en anulacion de facturas.bmp','','2009-09-30 17:46:14'),
 (77,'NDIAZ','29','2009-10-01 08:00:10','Reversar Comprobantes','Se requiere reversar un comprobante de liquidaciÃ³n y sale un error al procesar dicho reverso, el cual no deja avanzar.','angelfmr','Reserva Comprobante','Resuelto por Jose Ruiz','2009-10-06 10:18:14',0,3,1,'NDIAZ_20091001_80010_Error reverso comprobantes.bmp','','2009-10-01 08:00:10'),
 (78,'Tibisay','29','2009-10-02 11:32:17','Error Reversando Comprobante','Al procesar factura 186 del Productor 81122130 (Vincenzo Curto Pelle), se genero el precomprobante de liquidacion correctamente, sin embargo, al imprimir el comprobante de traspaso se observa que pasÃ³ con un monto distinto. Al intentar reversar el comprobante se generÃ³ un error, el cual puede encontrarse en el archivo adjunto.','angelfmr','Caso Vicente Curtupele','Resuelto por Jose Ruiz','2009-10-06 10:17:33',0,3,1,'Tibisay_20091002_113217_Error Reversando.bmp','','2009-10-02 11:32:17'),
 (79,'anais','41','2009-10-05 09:56:50','AUSENCIA DE MARCAJES','BUEN DIA YIRA:\r\nAMIGA SE PRESENTA AUSENCIA DE MARCAJE DEL PERSONAL DE TURNO NOCTURNO EL DIA VIERNES 02/10 Y TODO EL DIA DEL SABADO 03/10 PARA TODO EL PERSONAL.. AGRADEZCO ME AYUDES EN ESTO RECUERDA QUE LOS LUNES ELABORO LA NOMINA DE OBREROS...SIN MAS, Y EN ESPERA DE UNA PRONTA RESPUESTA...ANAIS TRAVIESO','backup','Marcaje','Solicitud fue realizada en la misma fecha 05-10-2009','2009-11-30 10:26:25',0,3,1,'','','2009-10-05 09:56:50'),
 (80,'Tibisay','29','2009-10-05 17:07:47','Error en A/A Y C.C','En los comprobantes contables generados desde el sistema de productores en fecha octubre, se estÃ¡ presentando error en cuanto al anÃ¡lisis adicional y centro de costo. En el archivo adjunto se puede observar que se estÃ¡ colocando A/A 801 y C.C 80100, cuando realmente A/A debe ser 10 y no debe llevar C.C.','angelfmr','asiento contables','Solucionado por Jose Ruiz','2009-10-07 15:40:21',0,3,1,'Tibisay_20091005_170747_81T0910.0004.bmp','','2009-10-05 17:08:04'),
 (81,'Tibisay','29','2009-10-06 10:03:24','Error en Reversos','Buenos DÃ­as:\r\n\r\nAl realizar reverso de comprobantes contables desde el sistema de productores, puede observarse que las lÃ­neas no estÃ¡n pasando exactamente iguales, lo que acarrea que no se estÃ©n realizando correctamente los reversos en el sistema contable. Adjunto documento en el que se observa un comprobante con su respectivo reverso.','angelfmr','asiento contable','Solucionado por Jose Ruiz','2009-10-07 15:39:46',0,3,1,'Tibisay_20091006_100324_Comprobantes.doc','','2009-10-06 10:03:24'),
 (82,'NDIAZ','32','2009-10-06 10:57:54','Nuevo error orden de pago','No me permite generar orden de pago a nombre de Agrop. Cridaca. Reviso el comprobante y no veo datos duplicados.\r\n\r\nPedro por favor revisa este caso','pedro','Solucionado','Su solicitud esta solucionada','2009-10-07 17:17:42',0,3,1,'NDIAZ_20091006_105754_ORDEN DE PAGO.bmp','','2009-10-06 11:17:46'),
 (83,'NOM_CONT','34','2009-10-07 14:49:23','COMPROBANTE BLOQUEADO','BUENAS TARDE POR ERROR INVOLUNTARIO AL REAIZAR UN REVERSO TOME UN NUMERO DE COMPROBANTE YA UTILIZADO POR LO CUAL EL COMPROBANTE ESTA BLOQUEADO Y NECESITO HACER UNA MODIFICACION EN EL EL NUMERO DE ESTE ES 246346 EL CUAL IBA HACER REVERSADO CON EL NUMERO 246348(YA UTILIZADO) Y EL NUEVO 246349, Y AHORA EL SISTEMA NO ME PERMITE REALIZAR NINGUN ASIENTO, SE ENCUENTRA BLOQUEADO.','cparada','error en reverso','se solvento haciendo un comprobante nuevo.','2009-10-08 15:11:05',0,3,2,'','','2009-10-07 15:38:52'),
 (84,'angelfmr','33','2009-10-07 15:37:53','Sistema Compiere','Necesitamos arreglar esto:\r\n1.- Contraparte: Eliminar solamente las direcciones y volverlas a actualizar.\r\n2.- Validar las cuentas que manejan documentos.\r\n3.- Arreglar los tipÃ²s de documentos en gcontab y compiere desde enero 2009\r\n4.- Gbancaria: \r\n    4.1 ordenes de pago manuales en finanzas, arreglar el tipo documento.\r\n    4.2 anulacion de cheques.\r\n    4.3 cheques con otro beneficiario a contabilizar.\r\n    4.4 manejo del codigo swift.\r\n    4.5 las ordene de pago viendo todo compiere.\r\n5.- validar la duplicidad de comprobantes en gcontab.\r\n\r\nEs todo hasta los momentos','cparada','Sistema Compiere ','Todos los puntos de la solicitud se cumplieron.\r\nSaludos','2009-10-21 16:43:42',0,3,1,'','','2009-10-07 15:37:53'),
 (85,'transporte','10','2009-10-07 15:59:24','solicitud','con autorizacion del ing. roberto se solicita otra cuenta de correo para el departamento de transporte.\r\n ','angelfmr','correo electrocnio','Hola por favor especificar el uso de la cuenta de correo (interna o Externa) y quien lo usaria','2009-10-13 09:56:28',0,3,2,'','','2009-10-07 15:59:24'),
 (86,'transporte','10','2009-10-07 15:59:24','solicitud','con autorizacion del ing. roberto se solicita otra cuenta de correo para el departamento de transporte.\r\n ','angelfmr','correo electronico','Hola por favor especificar el uso de la cuenta de correo (interna o Externa) y quien lo usaria','2009-10-13 09:56:03',0,3,2,'','','2009-10-07 15:59:24'),
 (87,'transporte','10','2009-10-07 15:59:28','solicitud','con autorizacion del ing. roberto se solicita otra cuenta de correo para el departamento de transporte.\r\n ','angelfmr','correo electronico','Hola por favor especificar el uso de la cuenta de correo (interna o Externa) y quien lo usaria','2009-10-13 09:55:31',0,3,2,'','','2009-10-07 15:59:28'),
 (88,'transporte','10','2009-10-07 15:59:28','solicitud','con autorizacion del ing. roberto se solicita otra cuenta de correo para el departamento de transporte.\r\n ','angelfmr','correo electronico','Hola por favor especificar el uso de la cuenta de correo (interna o Externa) y quien lo usaria','2009-10-13 09:55:05',0,3,2,'','','2009-10-07 15:59:28'),
 (89,'transporte','10','2009-10-07 15:59:29','solicitud','con autorizacion del ing. roberto se solicita otra cuenta de correo para el departamento de transporte.\r\n ','angelfmr','correo electrocnico','Hola por favor especificar el uso de la cuenta de correo (interna o Externa) y quien lo usaria','2009-10-13 09:54:39',0,3,2,'','','2009-10-07 15:59:29'),
 (90,'transporte','10','2009-10-07 15:59:35','solicitud','con autorizacion del ing. roberto se solicita otra cuenta de correo para el departamento de transporte.\r\n ','angelfmr','correo electronico','Hola por favor especificar el uso de la cuenta de correo (interna o Externa) y quien lo usaria','2009-10-13 09:54:11',0,3,2,'','','2009-10-07 15:59:35'),
 (91,'BRASILH','13','2009-10-08 10:07:43','ACTUALIZACION DE INFORMACION (CXC)','Buenos dÃ­as. \r\nla presente es para comunicarle que desde hace mÃ¡s de tres dÃ­as se esta observando errores en la actualizacion de la informacion en las palms especificamente en la de cxc. eta se presenta en todos los vendedores.\r\ncuando hacen el proceso de actualizar este le indica que no tiene datos que recibir y el monto bs de sus cuentas no coinciden con los del dia.','pedro','ACTUALIZACION DE INFORMACION (CXC)','Buenos dÃ­as, se hizo una revisiÃ³n del sistema y se corrigio el error.','2009-10-09 10:20:47',0,3,1,'','','2009-10-08 10:07:43'),
 (92,'YULIS','38','2009-10-09 11:00:11','PROBLEMAS DE MARCAJE','NO SE REGISTRARON LOS MARCAJES DEL DIA DE AYER A LAS 6:30 PM Y HOY EN LA MAÃ‘ANA','backup','','','1000-01-01 00:00:00',0,1,1,'','','2009-10-09 11:00:11'),
 (93,'facturacionval','20','2009-10-13 13:35:10','Aprobacion de Pedidos','Buenas tardes solicito por favor la aprobaciÃ³n de los siguientes pedidos que se encuentran bajo precio el producto Crema 6x900 Bs. 30.42 la caja.\r\n390386/390393/21003238/21003241/21003242/21003243/21003244/21003245/21003246/21003247/21003248/21003249/22002880/22002885/22002886/22002887.\r\n\r\nSin otro particular\r\n\r\nMarelvis Marin \r\nFacturaciÃ³n\r\nSuc. Valencia','cparada','aprobacion de pedido','Fueron aprobados todos los pedidos que estaban rechazados en credito y que tuvieran crema de arroz de 6 * 900 ','2009-10-13 14:31:45',0,3,1,'','','2009-10-13 13:35:10'),
 (94,'supcxcbar','8','2009-10-13 14:09:13','SIN IMPRESION-SUC BARCELONA','Buenas tardes,\r\n\r\nDesde tempranas horas de la maÃ±ana no podemos imprimir desde el sistema por la conexiÃ³n de Backcitrix, recordando que desde el dÃ­a 9/10/09 se pudo imprimir desde Ã©sta conexiÃ³n despues de haber tenido una semana sin poder imprimir,tampoco se puede imprimir desde la conexiÃ³n de Internet.\r\nLe agradecemos en lo que puedan ayudarnos para resolver esta situaciÃ³n, ya que sin esta aplicaciÃ³n se nos retrasa el trabajo sobretodo e importante los comprobantes que tenemos que preparar y tampoco se pueden transcribir las cobranzas que tienen retencÃ­on Iva ya que no existe un modulo para imprimir los ajustes de Credito.\r\npor favor no olviden comunicarse con nosotros por si podemos colaborarle en cualquier cosa desde aqui.\r\nAgradecida!!!\r\n','angelfmr','Impresora  ','Ya les envie un correo explicando la situacion de las improsoras estamos pendiente de ellos, el caso de la inpresion de iva debes llamar a Alexander Adan y exponer el caso.','2009-10-16 10:28:13',0,3,1,'','','2009-10-13 14:09:13'),
 (95,'rh-social','10','2009-10-13 14:37:55','Cuenta correo externo','\r\nBuenas Tardes, \r\n\r\nAngel siguendo instruciones del Lic. castillo... \r\n\r\nSolicito la apertura de una cuenta de correo externo. \r\n\r\nSaludos Cordiales,\r\n\r\nEgdalis Timaure \r\n\r\n\r\n','angelfmr','Creado correo','Usuario: irhsocial@mary-iancarina.com\r\nClave: Marysocial33','2009-11-19 11:33:44',0,3,2,'','','2009-10-13 14:37:55'),
 (96,'facturacionval','20','2009-10-14 13:32:53','Aprobacion bajo precio','Buenas tardes el presente es para solicitarle con caracter de urgencia la aprobacion de los siguientes pedidos que se encunetran bajo precio la crema 6x900 en 30.42 Bs.\r\n# PEDIDOS:\r\n390379/390390/390392/21003247/21003251/21003252/21003253/26002642/26002643/26002646/26002649/22002890\r\n\r\nsin otro particular\r\n\r\nMARELVIS MARIN\r\nFACTURACION\r\nSUC. VALENCIA','cparada','aprobacion de pedido','Se aprobaron los pedidos que estaban rechazados en credito y que tenian incluido la crema de arroz 6x900 Segun correo del Sr. Carlos Matias.','2009-10-16 10:52:15',0,3,2,'','','2009-10-14 13:32:53'),
 (97,'YULIS','38','2009-10-15 08:15:16','FALLA DE HAND TEST','PROBLEMAS DE MARCAJE DEL SISTEMA HAND TEST AUN ESTA PENDIENTE POR ARREGLAR DESDE LA SEMANA PASADA LOS DIAS SON 08/10 Y 09/10 DE OCTUBRE','pedro','FALLA DE HAND TEST','Buenos dias, la falla del marcaje de los dÃ­as 08 y 09 de octubre ha sido resuelta el dia 19-10-09','2009-10-22 09:58:02',0,3,1,'','','2009-10-15 08:15:16'),
 (98,'facturacionval','20','2009-10-15 13:17:39','Aprobacion de Pedidos','Buenas Tardes el presente es para solicitar con caracter de URGENCIA la aprobacion de los siguientes pedidos por crema 6x900 precio viejo Bs. 30.42\r\n\r\n384786/384787/384788/384789/390377/390379/390383/390390/390392/27002446/27002449/27002459\r\n\r\nsin otro particular\r\n\r\nMarelvis Marin \r\nFacturaciÃ³n\r\n>Suc. Valencia\r\n','cparada','aprobacion de pedido','Se aprobaron los pedidos que estaban rechazados en credito y que tenian incluido la crema de arroz 6x900 Segun correo del Sr. Carlos Matias.','2009-10-16 10:51:51',0,3,1,'','','2009-10-15 13:17:39'),
 (99,'facturacionval','20','2009-10-15 15:43:23','Aprobacion de Pedidos','buenas tardes solicito aprobacion de los siguientes pedidos bajo precio crema 6x900 Bs 30.42\r\n\r\n21003250/21003260/21003261/21003262/23003168/23003170\r\n\r\n\r\nsin otro particular\r\n\r\nmarelvis marin','cparada','aprobacion de pedido','Se aprobaron los pedidos que estaban rechazados en credito y que tenian incluido la crema de arroz 6x900 Segun correo del Sr. Carlos Matias.','2009-10-16 10:51:33',0,3,1,'','','2009-10-15 15:43:23'),
 (100,'carmen berrios','45','2009-10-16 09:24:59','solicitud de tecnico de impresora','BUENOS DIAS SR. ANGEL, NECESITO DE SU COLABORACION LO MAS PRONTO POSIBLE QUE CONTACTEN AL TENNICO DE LAS IMPRESORAS POR QUE LA QUE ESTOY USANDO ESTA PRESENTANDO FALLAS EN IMPRESION Y LAS NOTAS DE CREDITO ESTAN SALIENDO IMPRESAS REMARCADAS, RECUENDE QUE ESTO NOS PUEDE TRAER PROBLEMAS POR EL SENIAT. ESTO FUE HABLADO CON LA SRA. YIRA PERO A LA FECHA NO HAN SOLUCIONADO.\r\n\r\nAGRADEZCO SU COLABORACION','angelfmr','Impresora  ','Ya esta notificado al proveedor de servicio para que los asista, esperamos por ellos.','2009-10-16 10:21:59',0,3,2,'','','2009-10-16 09:24:59'),
 (101,'facturacionval','20','2009-10-16 13:21:47','pedidos bajo precio','Buenas tardes solicito con urgencia la aprobacion de los siguientes pedidos que se encuentra la crema 6x900 bajo precio en Bs. 30.42 (6.50 u)\r\n\r\n20002943/20002949/23003166/23003167/23003172/23003173/23003176/23003179/22002881/22002886/22002887/22002888/22002892/22002894/22002895/24003942/21003260/21003261/21003262/21003285/\r\n\r\n\r\nsin otro particular \r\n\r\nMarelvis MarÃ­n\r\nFacturaciÃ³n\r\nSuc. Valencia','cparada','aprobacion de pedido','Se aprobaron los pedidos solicitados.','2009-10-16 16:51:55',0,3,1,'','','2009-10-16 13:52:26'),
 (102,'Johanna ','7','2009-10-16 14:22:44','PRECIO DE ARROZ MARY PREMIUM 12X2 TIPO 1 ','EL ARROZ MARY PREMIUM TIPO 1 12X2 NO ESTA INCLUIDO EN LA LISTA DE PRECIOS','cparada','PRECIO DE ARROZ MARY PREMIUM 12X2 TIPO 1 ','YA SE INCLUYO EL PRECIO DEL ARROZ PREMIUM 12X2 TIPO 1 EN LA LISTA DE PRECIOS.','2009-10-16 14:23:50',0,3,2,'','','2009-10-16 14:22:44'),
 (103,'facturacionval','20','2009-10-19 10:19:38','AprobaciÃ³n de Pedidos','Buenos dÃ­as solicito por favor la aprobacion del pedido 384783 que se encuentra bajo precio 30.42 cremas 6x900\r\n\r\nsin otro particular\r\n\r\n\r\nMarelvis MarÃ­n','cparada','aprobacion de pedido','el pedido fue aprobado segun autorizacion del Sr. Carlos Matias.','2009-10-19 16:24:35',0,3,2,'','','2009-10-19 10:19:38'),
 (104,'BRASILH','13','2009-10-19 11:14:56','Actualizacion de informacion.','buenos dias.\r\nle comunico que hoy se esta presentando problemas con la recpeciÃ³n de la informaciÃ³n ya que los vendedores me indica que no tienen datos que recibir.. por favor verificar cual es la raiz del problema asi evitar los incovenientes que ya se estan presentado.','pedro','ActualizaciÃ³n','Buenos dÃ­as, se estÃ¡ monitoreando el proceso de actualizaciÃ³n, favor informar cualquier inconveniente','2009-10-22 09:55:19',0,3,1,'','','2009-10-19 11:14:56'),
 (105,'facturacionval','20','2009-10-19 12:20:04','Pedidos bajo precio','buenas tardes por favor solicito con urgencia la AprobaciÃ³n de los siguientes pedidos que estan precio viejo el producto crema 6x900 # 38477/384778/384777/384778/21003289\r\n\r\nGracias!\r\n\r\nMarelvis Marin','cparada','aprobacion de pedido','el pedido fue aprobado segun autorizacion del Sr. Carlos Matias.','2009-10-19 16:24:53',0,3,1,'','','2009-10-19 12:20:04'),
 (106,'jose ramirez','20','2009-10-19 16:16:40','aprobacion de pedido','solicito la aprobacion del pedido 365211 al cliente distribuidora mercamar por diferencia de precio en el arroz superior a 63.66\r\n','cparada','aprobacion de pedido','se aprobo el pedido autorizado por el sr. Carlos Matias.','2009-10-19 16:21:50',0,3,2,'','','2009-10-19 16:16:40'),
 (107,'jose ramirez','13','2009-10-20 09:13:52','LOS VENDEDORES NO HAN RECIBIDO INFORMACION','LOS VENDEDORES PRESENTAN PROBLEMAS PARA RECIBIR INFORMACION','cparada','recepcion de informacion','se les preparo informacion a los vendedores con problemas.','2009-10-21 09:49:58',0,3,2,'','','2009-10-20 09:13:52'),
 (108,'Nathalie','18','2009-10-20 11:56:29','cambio de destino','buenas tardes la prsente es para solicitar el cambio de el destino de la salida de almacen 9301 orden de carga 10105 que corresponde a la sucursal de caracas ya que este carro se accidento en valencia por lo tanto se descargo en la sucursal de valencia.\r\ngracias','angelfmr','Cambio destino','El sistema ya realiza el cambio de destino cuando el despacho es hacia un cliente, pero aun nos falta cuando es una transferencia a una sucursal.','2009-11-20 14:16:42',0,3,2,'','','2009-10-20 11:56:29'),
 (109,'facturacionval','20','2009-10-21 11:56:57','AprobaciÃ³n de Pedidos','Buenos dias solicito por favor la Aprobacion de los siguientes pedidos que se encuentran bajo precio el superior tipo 1. 390407/ 23003195/ 384297\r\n\r\nSaludos!\r\n\r\nMarelvis MarÃ­n\r\nFacturaciÃ³n\r\nSuc. Valencia','cparada','aprobacion de pedido','se aprobaron los pedidos despues de pedirle aprobacion al Sr. Carlos Matias.\r\n','2009-10-21 16:40:10',0,3,1,'','','2009-10-21 11:56:57'),
 (110,'jose ramirez','20','2009-10-22 09:05:45','aprobacion de pedidos','por favor aprobar los pedidos numeros 365213 del cliente viveres almacen 608 de quinta crespo y 365215 cliente el bombon dorado aprobados por el sr carlos matias','cparada','aprobacion de pedido','Fue aprobado segun correo del Sr. Carlos Matias. ','2009-10-22 11:56:39',0,3,2,'','','2009-10-22 09:05:45'),
 (111,'jose ramirez','20','2009-10-22 09:05:54','aprobacion de pedidos','por favor aprobar los pedidos numeros 365213 del cliente viveres almacen 608 de quinta crespo y 365215 cliente el bombon dorado aprobados por el sr carlos matias','cparada','aprobacion de pedido','Fue aprobado segun correo del Sr. Carlos Matias. \r\n','2009-10-22 11:56:14',0,3,2,'','','2009-10-22 09:05:54'),
 (112,'jose ramirez','20','2009-10-22 09:06:04','aprobacion de pedidos','por favor aprobar los pedidos numeros 365213 del cliente viveres almacen 608 de quinta crespo y 365215 cliente el bombon dorado aprobados por el sr carlos matias','cparada','aprobacion de pedido','Fue aprobado segun correo del Sr. Carlos Matias.','2009-10-22 11:42:05',0,3,2,'','','2009-10-22 09:06:04'),
 (113,'BRASILH','14','2009-10-22 11:36:34',' Error en CentralizaciÃ³n ','le informmo que se me presento un errror al realizar el traspaso a contabilidada de un un comprobante de ingreso. el error me dice que:\r\n1. las siguientes lineas no han sido parametrizadas en compier o.-\r\n2. las sigientes lineas no equivalen a lo condicionado  en el maestro de cuenta para el documento 7.-\r\nla informacion del este comprobante esta el movimiento nÂ°1410. esta pendiente por procesar.','Smariani','CENTRALIZACIÃ“N','ESTE DETALLE YA FUE RESUELTO POR JRUIZ','2009-10-29 10:00:29',0,3,1,'','','2009-10-29 08:23:34'),
 (114,'cmelo','34','2009-10-22 16:19:12','comprobantes de traspaso y de ingreso por compiere','hemos notado que el procesar de centralizar comprobantes de ingreso y traspaso por compiere es muy tardio, por ejemplo en el caso de los comrpobantes de traspaso, Irene espera hasta el otro dia para que le emita el comprobante de centralizacion, en el caso de credito y cobranza con los comprobantes de ingreso  Irma  no puede esperar tanto tiempo para que se centralice el comprobante, ya que tiene que seguir procesando cobranza','angelfmr','Centralizacion de Comprobantes','Los comprobantes deben ser actualizados manualmente, si aun no tienen acceso para entrar al sistema compiere deberan solicitarles a contabilidad iancarina que se los actualice.\r\n\r\nSaludos','2009-10-29 08:26:23',0,3,2,'','','2009-10-22 16:19:12'),
 (115,'Nathalie','19','2009-10-27 14:05:41','PRECOMPROBANTE DE TRASPASO','BUENAS TARDES.\r\n\r\nLE INFORMO QUE EL PRECOMPROBANTE DE TRASPASO (VENTAS) DE EL DIA 20/10/2009 PRESENTA ERROR EN LA CUENTA 0264015001 UNID. GALLETAS CHARMY (1X1) LA CUAL NO ES PARAMETRIZADA EN COMPIER.\r\n LE AGREDESCO SU MAYOR COLABORACION Y PRONTA RESPUESTA, YA QUE EL CIERRE SE REALIZARA HASTA EL DIA 31/10/2009','angelfmr','Precomprobante de ventas','Listo resuelto por Sandra','2009-10-29 08:30:31',0,3,1,'','','2009-10-27 14:05:41'),
 (116,'cmelo','34','2009-10-27 17:22:29','comprobantes de ingreso por compiere','los comprobantes de ingreso no se pueden procesar desde el nro. 83I0910.0063 al 74','angelfmr','Comprobantes en Compiere','No entiendo lo que quieres decir que no se puede procesar, si aun no los puedes imprimir debes pedirle a conabilidad que te los actualice.','2009-10-29 08:29:45',0,3,1,'','','2009-10-27 17:22:29'),
 (117,'cmelo','15','2009-10-27 17:24:42','notas de debito','Al momento de realizar una nota d debito por cheque devuelto al ingresar el numero de cheque sale un letrero que dice \"cheque no esta depositado\"','angelfmr','Nota de debito','Deben chequear bien si este cheque fue ingresado a caja y fue contabilizado y luego esta relacionado con el deposito, lo que quiere decir es que el cheque no le han asignado el deposito en caja.','2009-10-29 08:28:04',0,3,1,'','','2009-10-27 17:24:42'),
 (118,'Laura Valencia','34','2009-10-28 16:59:31','ActualizaciÃ³n','Buenas Tardes Pedro necesito que por favor me actualices los siguientes Comprobantes Compiere 81I0910.0100 81I0910.0101 81I0910.0104 81I0910.0105.\r\n\r\nÂ´Sin mÃ¡s que agregar.\r\n\r\nAtt.\r\nLaura Valencia','pedro','ActualizaciÃ³n ','Listo','2009-10-28 17:31:10',0,3,1,'','','2009-10-28 16:59:31'),
 (119,'Laura Valencia','34','2009-10-29 17:11:28','Actualizacion','Buenas Tardes Pedro necesito que por favor me actualices los siguientes comprobantes 81I0910.0111 y 81I0910.0113','pedro','ActualizaciÃ²n de comprobantes','Buenos dÃ­as Laura, en tu mÃ quina se instalÃ² el sistema Compiere con la finalidad de que tu misma puedas importar los comprobantes en el sistema, por lo cual no es necesario que lo solicites por El Sistema De Control De Solicitudes, a menos que tengas algÃ¹n problema o inconveniente con el sistema.\r\nSaludos.','2009-11-09 11:51:50',0,3,2,'','','2009-10-29 17:11:28'),
 (120,'Laura Valencia','34','2009-10-30 15:19:25','Actualizacion','Buenas Tardes. \r\n\r\nPedro necesito que por favor me actualices los siguientes comprobantes 81I0910.0121 y 81I0910.0122.','pedro','ActualizaciÃ²n de comprobantes','Buenos dÃ­as Laura, en tu mÃ quina se instalÃ² el sistema Compiere con la finalidad de que tu misma puedas importar los comprobantes en el sistema, por lo cual no es necesario que lo solicites por El Sistema De Control De Solicitudes, a menos que tengas algÃ¹n problema o inconveniente con el sistema.\r\nSaludos.','2009-11-09 11:50:55',0,3,2,'','','2009-10-30 15:19:25'),
 (121,'angelfmr','34','2009-11-02 08:08:27','Reportes Iancarina Contabildiad','Carlos estos son los reportes que necersitamos diseÃ±ar, primero en Compiere y luego en Jasper.\r\n1.- Listado de documentos con saldo. Solo cuentas con movimiento\r\n2.- Mayor analitico, Detalle y resumen de cuentas con saldo inicial, debemes, habermes, saldomes, saldofinal.\r\n3.- Organizacion por cuenta y viceversa, detallado y resumen, movimiento del mes.\r\n4.- Reporte de contapartes no sale la direccion.\r\n\r\nLos filtros del punto 2 y 3 lleva rango organizacion, cuentas y  periodo, \r\nPara el punto la organizacion, rango fecha vencto, cuentas y contrapartes, si no selecciona el reporte emitira todo los documentos pendientes de las cuentas controladas por documentos.\r\n\r\nEl campo obligatorio es la fecha o perido.\r\n\r\nvemos los detalles cuendo tengas algo.','cparada','Reportes Compiere','Todos los reportes se realizaron y se montaron en el servidor jasper.','2009-11-10 10:28:21',0,3,2,'','','2009-11-02 08:08:27'),
 (122,'Tibisay','6','2009-11-03 15:42:34','Lentitud anormal en el equipo','    Se hace de su conocimiento que el computador, desde hace aproximadamente una semana estÃ¡ tardando mucho tiempo mÃ¡s de lo normal para abrir los archivos de Open Office, Outlook Express y otros, ademÃ¡s, varias veces ha aparecido una pantalla que cita: \"MÃ­nimo de Memoria Virtual demasiado bajo\". Al abrir simultÃ¡neamente varios sistemas la mÃ¡quina se queda \"colgada\" de manera tal que ni siquiera muestra el administrador de tareas y es necesario apagar el UPS para apagar la mÃ¡quina y luego volverla a encender. \r\n \r\n    Esta situaciÃ³n se ha venido repitiendo con relativa frecuencia, lo que acarrea retardos en el trabajo en general, en el proceso de las liquidaciones (para el cual se cuenta con poco tiempo) y en la atenciÃ³n al productor, pues el mismo solicita estados de cuenta, guÃ­as de movilizaciÃ³n y otros reportes que ameritan la utilizaciÃ³n de los sistemas.\r\n\r\n    Esperando pronta atenciÃ³n a la situaciÃ³n planteada,','backup','Lentitud PC','Buenas tardes,\r\n\r\nSe te va a asignar un equipo nuevo.','2009-11-09 13:59:37',0,3,2,'','','2009-11-03 15:42:34'),
 (123,'Tibisay','6','2009-11-03 15:45:21','Lentitud anormal en el equipo','    Se hace de su conocimiento que el computador, desde hace aproximadamente una semana estÃ¡ tardando mucho tiempo mÃ¡s de lo normal para abrir los archivos de Open Office, Outlook Express y otros, ademÃ¡s, varias veces ha aparecido una pantalla que cita: \"MÃ­nimo de Memoria Virtual demasiado bajo\". Al abrir simultÃ¡neamente varios sistemas la mÃ¡quina se queda \"colgada\" de manera tal que ni siquiera muestra el administrador de tareas y es necesario apagar el UPS para apagar la mÃ¡quina y luego volverla a encender. \r\n \r\n    Esta situaciÃ³n se ha venido repitiendo con relativa frecuencia, lo que acarrea retardos en el trabajo en general, en el proceso de las liquidaciones (para el cual se cuenta con poco tiempo) y en la atenciÃ³n al productor, pues el mismo solicita estados de cuenta, guÃ­as de movilizaciÃ³n y otros reportes que ameritan la utilizaciÃ³n de los sistemas.\r\n\r\n    Esperando pronta atenciÃ³n a la situaciÃ³n planteada,','backup','Lentitud PC','Buenas tardes,\r\n\r\nYa te estoy preparando el PC','2009-11-09 14:00:53',0,3,2,'','','2009-11-09 11:53:14'),
 (124,'mazuaje','46','2009-11-05 17:05:29','Solicitud de Codificados','Adjunto solicitud de nÃºmeros codificados','angelfmr','codigos','listo','2009-11-18 18:19:00',0,3,2,'mazuaje_20091105_170529_Solicitudes de Codificados.xls','','2009-11-05 17:05:29'),
 (125,'mazuaje','46','2009-11-05 18:57:42','Codificados','Adjunto listado de cambios en codificados\r\n','angelfmr','codigos','listo','2009-11-18 18:18:37',0,3,1,'mazuaje_20091105_185742_Solicitudes de Codificados1.xls','','2009-11-05 18:57:42'),
 (126,'mazuaje','45','2009-11-06 10:40:58','Eliminar CÃ³digos','sr. Angel necesito por favor se eliminen los cÃ³digos:\r\n292\r\n289\r\n291','angelfmr','codigos','listo','2009-11-18 18:18:08',0,3,2,'','','2009-11-06 10:40:58'),
 (127,'NDIAZ','24','2009-11-06 14:13:15','Error en Precio de Boletas','Buenas Tardes:\r\n\r\nAdjunto Listado de Recepciones del productor: AgrÃ­cola CaÃ±o Lucas, C.A., en cuyas boletas (de fecha 04/11/09 en adelante) existe error en precio (Debe ser 1.150 y aparece 0.710). Cabe destacar que NO han sido modificados los precios en el sistema por nuestra parte y dichos boletos deben ser procesados para las liquidaciones de la prÃ³xima semana el dÃ­a lunes, por lo que se agradece la mayor atenciÃ³n al caso...\r\n\r\nTibisay','angelfmr','SISTEMA COSECHA PRECIO','Debes chequear las formulas y ver los demÃ¡s boletos del dÃ­a, ya que si es solo el de este productores entonces se debe chequear sus condiciones que aplica en la formulaciÃ³n, preguntale a Normedis.','2009-11-17 14:54:11',0,3,2,'NDIAZ_20091106_141315_Recep. CaÃ±o Lucas.pdf','','2009-11-06 14:13:15');
INSERT INTO `tsolicitudes` (`nId_Numero`,`cId_Solicitante`,`cId_TipoS`,`dFechaSol`,`cTituloSol`,`cDetalleSol`,`cId_Operador`,`cTituloResp`,`cDetalleResp`,`dFechaResp`,`nBase`,`nEstado`,`nPrioridad`,`cArchivo_Adjunto1`,`cArchivo_Adjunto2`,`dFechaMod`) VALUES 
 (128,'facturacionval','22','2009-11-09 10:40:52','ImpresiÃ³n de Comprobante','Buenos dÃ­as!! mediante la presente solicito por favor la ayuda para la impresiÃ³n de los siguientes comprobantes de Traspaso # 85T0911.0001/0002/0003/0004/ ya que al momento de imprimirlo en compier indica que espere 5 minutos y ya pasada hora y media sigue indicando lo mismo.\r\n\r\nsin otro particular y en espera de su pronta soluciÃ³n\r\n\r\n\r\nMarelvis MarÃ­n\r\nFacturaciÃ³n\r\nSuc. Valencia','pedro','ImpresiÃ³n de Comprobante ','Sus comprobantes han sido importados correctamente al sistema.\r\nSaludos','2009-11-09 11:45:56',0,3,1,'','','2009-11-09 10:40:52'),
 (129,'ylopez','34','2009-11-09 15:13:11','CONTRAPARTE','Buenas tardes angel se necesita ver un reporte de contrapartes con saldo, con un rango del 8000 al 8999, en un solo listado, por favor si nos puedes ayudar.','angelfmr','Listado de contraparte','Hola, vamos a ver si no hay uno en Compiere que te funcione para poder avanzar con otros procesos y determinar el uso, ya que depende del perfil de los usuarios y quines lo usarian','2009-11-10 18:44:17',0,3,2,'','','2009-11-09 15:13:11'),
 (130,'ylopez','6','2009-11-10 09:48:57','EQUIPO','Buenos dÃ­as angel, te informo que al abrir varias ventanas para consultas simultaneas mi equipo no responde y se cuelga, motivo por el cual te agradezco girar las instrucciones a quien corresponda para que lo revisen o cambien. Gracias','angelfmr','Lentitud en el Equipo','Ya le dije a Yira que revisara el equipo para determinar lo que pasa y de acuerdo a eso vemos que podemos hacer.','2009-11-10 18:46:18',0,3,1,'','','2009-11-10 09:48:57'),
 (131,'ylopez','6','2009-11-10 09:49:02','EQUIPO','Yira por favor verifica. \r\nBuenos dÃ­as angel, te informo que al abrir varias ventanas para consultas simultaneas mi equipo no responde y se cuelga, motivo por el cual te agradezco girar las instrucciones a quien corresponda para que lo revisen o cambien. Gracias','backup','Equipo','Se le colocÃ³ una memoria de 256 MB, quedando el equipo con 512 MB.','2009-11-13 14:05:53',0,3,1,'','','2009-11-10 18:45:09'),
 (132,'ylopez','34','2009-11-10 16:29:59','REVERSO DE CHEQUES EN FINANZAS','Buenas tardes angel, en conversaciÃ³n sostenida con su persona, ud me indicÃ³ que el dpto de finanzas procesarÃ­a sus cheques anulados, pero en la prÃ¡ctica lo estamos procesando en el dpto de contabilidad. favor aclararme Ã©sta situaciÃ³n. gracias','angelfmr','Anulacion de Cheques ','Si efectivamente aun no hemmos terminado ese proceso debido que se ha estado trabajando con los reportes del Compiere, ademas vamos a trabajar en finanzas para arreglar lo de los numeros de comprobantes y alli arreglamos el proceso de anulacon de cheque.','2009-11-10 18:41:07',0,3,1,'','','2009-11-10 16:29:59'),
 (133,'angelfmr','32','2009-11-10 18:42:40','comprobantes contable y anulacion de cheque','Debemos incluir en las actividades arreglar lo de los numeros de comprobantes y alli arreglamos el proceso de anulacon de cheque en Gbancaria.','cparada','comprobantes contable y anulacion de cheque ','Ya se corrigio para que cuando se genere el cheque de una vez tome el numero de comprobante de compiere al igual que cuando se anula de manera que cuando se imprima el cheque se refleje el numero de comprobante de compiere.','2009-11-11 15:30:58',0,3,2,'','','2009-11-10 18:42:40'),
 (134,'jose ramirez','20','2009-11-13 15:46:59','aprobacion de pedido','por favor aprobar el pedido numero 365226 de distribuidora mercamax','cparada','aprobacion de pedidos','fue aprobado el pedido segun correo del Sr. Carlos Matias ','2009-11-13 15:56:44',0,3,2,'','','2009-11-13 15:46:59'),
 (135,'ylopez','6','2009-11-17 10:17:58','equipo se cuelga','Buenos dÃ­as Angel, yira examinÃ³ mi equipo pero continÃºa colgandose, estÃ¡ muy lento y como te dije en el correo anterior necesito consultas simultaneas. Por favor te agradezco la soluciÃ³n mas efectiva.\r\n\r\nGracias \r\nINFORMAME','backup','','','1000-01-01 00:00:00',0,1,1,'','','2009-11-17 14:48:37'),
 (136,'ylopez','6','2009-11-17 10:18:03','equipo se cuelga','Buenos dÃ­as Angel, yira examinÃ³ mi equipo pero continÃºa colgandose, estÃ¡ muy lento y como te dije en el correo anterior necesito consultas simultaneas. Por favor te agradezco la soluciÃ³n mas efectiva.\r\n\r\nGracias\r\n\r\nYIRA POR FAVOR INFORMAME SOBRE ESTO','backup','','','1000-01-01 00:00:00',0,1,1,'','','2009-11-17 14:48:07'),
 (137,'facturacionval','20','2009-11-17 11:23:33','aprobacion de pedidos','buen dia Carlos por favor necesito de tu ayuda para aprobaciÃ³n de los siguientes pedido que se encuentran bajo precio:\r\n22003001/ 27002522/27002531/20002982/20002983\r\n\r\nsin otro particular\r\n\r\nMarelvis MarÃ­n\r\nFacturaciÃ³n\r\nSuc. Valencia','cparada','aprobacion de pedidos','Fue aprobado el pedido.','2009-11-24 09:28:00',0,3,1,'','','2009-11-17 11:37:01'),
 (138,'facturacionval','20','2009-11-17 14:00:04','Aprobacion de Pedidos','hola carlos! por favor necesito la aprobacion de los siguientes pedidos #0100117 Lebon Gourmet/240040131 S/M Hung y Cen, que se encuentran bajo precio.\r\n\r\nsin otro particular\r\n\r\nMarelvis MarÃ­n\r\nfacturaciÃ³n\r\nSuc. Valencia','cparada','aprobacion de pedidos','Fue aprobado el pedido.','2009-11-24 09:27:30',0,3,1,'','','2009-11-17 14:00:04'),
 (139,'mazuaje','45','2009-11-17 14:30:56','SOLICITUD DE CODIFICADOS','SR ANGEL NECESITO POR FAVOR ASIGNAR EL CODIGO 333 AL NUM 0424-5030852 DEL ING. RICARDO ALVAREZ.\r\nMODIFICAR EL CODIGO 613 DE ORLANDO ORTIZ 0414-5609356','angelfmr','codigos','listo','2009-11-18 18:17:46',0,3,2,'','','2009-11-17 14:30:56'),
 (140,'mazuaje','46','2009-11-17 14:54:04','MODIFICAR CODIGO','SR ANGEL POR FAVOR NECESITO SEA MODIFICADO EL CODIGO 290 (0412-1695238)','angelfmr','codigos','listo','2009-11-18 18:17:20',0,3,2,'','','2009-11-17 14:54:04'),
 (141,'CARLOS18CASTRO','45','2009-11-17 15:07:53','aprobacion de pedidos ','buenas tardes carlos necesito que me apruebes los pedidos 154065 y el 154067 los cuales son mil bultos pero estan divididos en dos partes. los cuales son para despachar ma;ana','cparada','aprobacion de pedidos','Fue Aprobado el pedido.','2009-11-24 09:27:03',0,3,1,'','','2009-11-17 15:07:53'),
 (142,'admsucbar','47','2009-11-17 16:56:28','APROBACION DE PEDIDOS','Buenas tardes por favor necesito me apruebes los siguientes pedidos:391171,86001352,86001353,86001354 por ahora','cparada','aprobacion de pedidos','Fue Aprobado el pedido','2009-11-24 09:26:32',0,3,2,'','','2009-11-17 16:57:54'),
 (143,'admsucbar','47','2009-11-19 08:31:41','APROBACION DE PEDIDOS DE DESPACHO DIRECTO','Muy buenos dias Carlos por favor necesito que me apruebes los siguientes pedidos de despacho directo pues me dan bajo pecio los pedidos son: 84001613 y 84001603\r\nAgradeciento tu valiosa colaboracion, me despido\r\nCarmen Orozco','cparada','aprobacion de pedidos','Fue aprobado el pedido.','2009-11-24 09:26:00',0,3,1,'','','2009-11-19 08:31:41'),
 (144,'Tibisay','24','2009-11-19 08:42:48','Irregularidades en Modulo Anticipos - Sist. de Productores','Buenos DÃ­as: Al realizar las cancelaciones a los recibos correspondientes en el sistema de productores, modulo de anticipos, no todos aparecen reflejados al momento de hacer la consulta de cancelaciÃ³n de anticipos, sin embargo el estado de cuenta estÃ¡ correcto. Es importante seÃ±alar que necesito esta situaciÃ³n sea solucionada a la brevedad posible, pues es necesario pasar informacion concerniente a este caso al Ing. Roberto Di Lanzo.','angelfmr','Modulo de Anticipo','Por favor enviarme las pantallas y reportes y u caso explicativo de un productor especifico.','2009-11-19 11:24:01',0,3,1,'','','2009-11-19 08:45:03'),
 (145,'mazuaje','46','2009-11-19 08:49:53','Asignar cÃ³digo','Sr. Angel por favor necesito sea asignado el cÃ³digo 450 a Ambulancias Portu Salud, el nÃºmero es 0255-6146748','angelfmr','Codigos','listo','2010-01-08 11:23:46',0,3,2,'','','2009-11-19 08:49:53'),
 (146,'Tibisay','10','2009-11-19 13:39:02','Cambio de nombre en equipo y correo electrÃ³nico','Buenos DÃ­as: La Lcda. Normedy DÃ­az fue cambiada de departamento, por lo que se solicita sea creado un nuevo correo interno y cambio en el nombre en el correo externo. Asimismo, se debe cambiar el nombre en la mÃ¡quina de la auxiliar administrativo, que ahora es la Srta. Raisa Peraza. Es importante tambien seÃ±alar que esto fue aprobado por la Ing. Ruby Pacheco - Coordinadora AgrÃ­cola','backup','','','1000-01-01 00:00:00',0,1,2,'','','2009-11-19 13:40:05'),
 (147,'ylopez','34','2009-11-19 16:29:26','ficha cuenta con saldo','Angel buenas tardes, te informo que la ficha cuenta con saldo no estÃ¡ correcto, los saldos estÃ¡n malos tienen diferencias, motivo por el cual necesitamos urgentemente la soluciÃ³n. Gracias','angelfmr','Saldo por documentos','Ya esta reportado a los consultores Avanted, ellos estarÃ¡n el dÃ­a martes 24 del presente mes','2009-11-20 14:07:51',0,3,1,'','','2009-11-19 16:29:26'),
 (148,'ylopez','34','2009-11-19 16:29:29','ficha cuenta con saldo','Angel buenas tardes, te informo que la ficha cuenta con saldo no estÃ¡ correcto, los saldos estÃ¡n malos tienen diferencias, motivo por el cual necesitamos urgentemente la soluciÃ³n. Gracias','angelfmr','Saldo por documentos','Ya esta reportado a los consultores Avanted, ellos estarÃ¡n el dÃ­a martes 24 del presente mes','2009-11-20 14:07:09',0,3,1,'','','2009-11-19 16:29:29'),
 (149,'ylopez','34','2009-11-19 16:29:32','ficha cuenta con saldo','Angel buenas tardes, te informo que la ficha cuenta con saldo no estÃ¡ correcto, los saldos estÃ¡n malos tienen diferencias, motivo por el cual necesitamos urgentemente la soluciÃ³n. Gracias','angelfmr','Saldos por documento','Ya esta reportado a los consultores Avanted, ellos estarÃ¡n el dÃ­a martes 24 del presente mes','2009-11-20 14:06:28',0,3,1,'','','2009-11-19 16:29:32'),
 (150,'CARLOS18CASTRO','45','2009-11-23 14:40:09','APROBACION DE PEDIDO PLANSUAREZ','BUENAS TARDES POR FAVOR CARLOS NECESITO ME APRUEBES LOS SIGUIENTES PEDIDOS 227857 Y 326344 SON PARA [PLANSUAREZ A UN PRECIO DE 62.94 LO CUALES ESTAN DIVIDIDOS EN TRES PARTES.','cparada','aprobacion de pedidos','fue Aprobado el pedido','2009-11-24 09:25:30',0,3,1,'','','2009-11-23 14:40:09'),
 (151,'ylopez','34','2009-11-24 09:46:16','saldos del 2008','Buenos dÃ­as angel favor verificar que hay mucha informaciÃ³n del aÃ±o 2008, pasada en compiere todas con fecha 31/12/2008, favor informar','angelfmr','AÃ±o 2008','Listo','2009-12-21 14:53:15',0,3,1,'','','2009-11-24 09:46:16'),
 (152,'ylopez','34','2009-11-24 09:46:19','saldos del 2008','Buenos dÃ­as angel favor verificar que hay mucha informaciÃ³n del aÃ±o 2008, pasada en compiere todas con fecha 31/12/2008, favor informar','angelfmr','AÃ±o 2008','Listo','2009-12-21 14:52:26',0,3,1,'','','2009-11-24 09:46:19'),
 (153,'ylopez','34','2009-11-24 09:46:22','saldos del 2008','Buenos dÃ­as angel favor verificar que hay mucha informaciÃ³n del aÃ±o 2008, pasada en compiere todas con fecha 31/12/2008, favor informar','angelfmr','AÃ±o 2008','Listo','2009-12-21 14:51:43',0,3,1,'','','2009-11-24 09:46:22'),
 (154,'ylopez','34','2009-11-24 09:46:22','saldos del 2008','Buenos dÃ­as angel favor verificar que hay mucha informaciÃ³n del aÃ±o 2008, pasada en compiere todas con fecha 31/12/2008, favor informar','angelfmr','AÃ±o 2008','Listo','2009-12-21 14:50:35',0,3,1,'','','2009-11-24 09:46:22'),
 (155,'ylopez','34','2009-11-24 09:46:31','saldos del 2008','Buenos dÃ­as angel favor verificar que hay mucha informaciÃ³n del aÃ±o 2008, pasada en compiere todas con fecha 31/12/2008, favor informar','angelfmr','AÃ±o 2008','Listo','2009-12-21 14:49:21',0,3,1,'','','2009-11-24 09:46:31'),
 (156,'ylopez','34','2009-11-24 09:46:33','saldos del 2008','Buenos dÃ­as angel favor verificar que hay mucha informaciÃ³n del aÃ±o 2008, pasada en compiere todas con fecha 31/12/2008, favor informar','angelfmr','AÃ±o 2008','Listo','2009-12-21 14:48:35',0,3,1,'','','2009-11-24 09:46:33'),
 (157,'ylopez','34','2009-11-24 09:46:33','saldos del 2008','Buenos dÃ­as angel favor verificar que hay mucha informaciÃ³n del aÃ±o 2008, pasada en compiere todas con fecha 31/12/2008, favor informar','angelfmr','AÃ±o 2008','Listo','2009-12-21 14:47:01',0,3,1,'','','2009-11-24 09:46:33'),
 (158,'ylopez','34','2009-11-24 09:48:26','ficha cuenta con saldo','Favor verificar ficha cuenta con saldo, saldos no son reales','angelfmr','Ficha cuenta con saldo','Listo','2009-12-21 14:44:51',0,3,1,'','','2009-11-24 09:48:26'),
 (159,'ylopez','34','2009-11-24 09:48:29','ficha cuenta con saldo','Favor verificar ficha cuenta con saldo, saldos no son reales','angelfmr','Ficha cuenta con saldo','Listo','2009-12-21 14:45:25',0,3,1,'','','2009-11-24 09:48:29'),
 (160,'ylopez','34','2009-11-24 09:48:30','ficha cuenta con saldo','Favor verificar ficha cuenta con saldo, saldos no son reales','angelfmr','Ficha cuenta con saldo','Listo','2009-12-21 14:45:56',0,3,1,'','','2009-11-24 09:48:30'),
 (161,'CARLOS18CASTRO','45','2009-11-24 10:30:32','APROBACION DE PEDIDO PLANSUAREZ CAURIMARE','BUENOS DIAS POR FAVOR PARA QUE ME APRUEBES EL PEDIDO 124764 DE PLANSUAREZ CAURIMARE ESTE ES PARTE DEL PEDIDO DE 1000 BULTOS.\r\n\r\nGRACIAS','cparada','Aprobacion de pedidos','SE APROBARON LOS PEDIDOS','2009-12-01 17:33:44',0,3,1,'','','2009-11-24 10:30:32'),
 (162,'anais','38','2009-11-25 08:56:34','AUSENCIA DE MARCAJES','BUEN DIA:\r\nNUEVAMENTE NOS ENCONTRAMOS CON AUSENCIAS DE MARCAJE EL DIA DE AYER MARTES 24/11/09 A LA SALIDA 6:30 PM\r\nAGRADEZCO TU MAYOR COLABORACION ES ESTO.. EN ESPERA DE UNA PORNTA RESPUESTA..ANAIS TRAVIESO','pedro','AUSENCIA DE MARCAJES ','Buenas tardes\r\nEl problema de los marcajes del dÃ­a 24/11/2009 a las 6:30 pm fuÃ© resuelto el dÃ­a 25/11/2009.\r\n\r\nSaludos','2009-11-26 17:38:12',0,3,1,'','','2009-11-25 08:56:34'),
 (163,'ylopez','34','2009-11-25 11:40:52','reporte ficha cuenta con saldo','Buenos dÃ­as Angel, necesitamos que ficha cuenta con saldo pueda leer un rango de contrapartes, ejemplo: de la ficha\r\n101100 a la ficha 160999 y por compiere puedo ver solamente una ficha.','angelfmr','Reporte de ficha cuenta','Ok por favor envia un correo a smariani@mary-iancarina especificando los detalles para que lo proceso con los consultores de Avanted','2010-01-08 10:22:52',0,3,1,'','','2009-11-25 11:40:52'),
 (164,'facturacionval','20','2009-11-25 15:33:48','Aprobacion de Pedidos','Buenas tardes por favor Carlos necesito la aprobaciÃ³n del pedido # 24004033 Frigorificos Unidos de Valencia que se encuentra bajo precio Bs 62.94 menos el 1% 750 Bultos de Superior. \r\n\r\nSin otro particular\r\n\r\nMarelvis MarÃ­n','cparada','Aprobacion de pedidos','SE APROBARON LOS PEDIDOS','2009-12-01 17:33:23',0,3,1,'','','2009-11-25 15:33:48'),
 (165,'ysalas','10','2009-11-26 12:12:59','Correo','Angel por favor crear la cuenta de correo exerno para Danny (secretaria).\r\n\r\nGracias.','angelfmr','creacion de correo','En revision por disponibilidad','2009-12-21 14:43:21',0,3,1,'','','2009-11-26 12:12:59'),
 (166,'Tibisay','24','2009-11-26 17:03:48','Diferencias en sumatoria listado de recepcion','Adjunto listado de recepciones de los productores pertenecientes a la categorÃ­a 3 del mes de octubre en el que existe una diferencia de Bs. 0.07 entre el total de la suma mostrado por el sistema y el real (son 0.07 Bs. menos).','pedro','Diferencias en sumatoria listado de recepcion ','Buenos dÃ­as.\r\nSe ha corregido el error de totalizaciÃ³n en el reporte de Listado de Recepciones.','2009-11-30 10:16:28',0,3,2,'Tibisay_20091126_170348_Recepciones Oct Categoria 3.pdf','','2009-11-26 17:03:48'),
 (167,'Tibisay','24','2009-11-26 17:03:55','Diferencias en sumatoria listado de recepcion','Adjunto listado de recepciones de los productores pertenecientes a la categorÃ­a 3 del mes de octubre en el que existe una diferencia de Bs. 0.07 entre el total de la suma mostrado por el sistema y el real (son 0.07 Bs. menos).','pedro','Diferencias en sumatoria listado de recepcion ','Buenos dÃ­as.\r\nSe ha corregido el error de totalizaciÃ³n en el reporte de Listado de Recepciones.','2009-11-30 10:15:03',0,3,2,'Tibisay_20091126_170355_Recepciones Oct Categoria 3.pdf','','2009-11-26 17:03:55'),
 (168,'Tibisay','24','2009-11-26 17:38:01','Sistema de Productores - Modulo Anticipos','Al consultar estados de cuenta de varios productores estÃ¡ mostrando pedidos pendientes que fueron realizados hace mucho tiempo y que no se veÃ­an hasta que fue cambiado el sistema flexline por el compiere. Adjunto un estado de cuenta en el que se puede observar esta situaciÃ³n','pedro','Sistema de Productores - Modulo Anticipos','Buenos dias \r\nCon respecto a los pedidos pendientes que se estÃ¡n mostrando en el estado de cuenta de los productores, este no es un problema de sistema, ya que esos pedidos estÃ¡n en la base de datos del sistema de productores, por lo cual se recomienda eliminarlos. ','2009-11-30 10:17:55',0,3,2,'Tibisay_20091126_173801_Estado de cuenta.pdf','','2009-11-26 17:38:01'),
 (169,'Tibisay','24','2009-11-26 17:38:22','Sistema de Productores - Modulo Anticipos','Al consultar estados de cuenta de varios productores estÃ¡ mostrando pedidos pendientes que fueron realizados hace mucho tiempo y que no se veÃ­an hasta que fue cambiado el sistema flexline por el compiere. Adjunto un estado de cuenta en el que se puede observar esta situaciÃ³n','pedro','Sistema de Productores - Modulo Anticipos','Buenos dias\r\nCon respecto a los pedidos pendientes que se estÃ¡n mostrando en el estado de cuenta de los productores, este no es un problema de sistema, ya que esos pedidos estÃ¡n en la base de datos del sistema de productores, por lo cual se recomienda eliminarlos.','2009-11-30 10:12:35',0,3,2,'Tibisay_20091126_173822_Estado de cuenta.pdf','','2009-11-26 17:38:22'),
 (170,'admsucbar','20','2009-11-27 08:38:53','Aprobacion de pedidos','Buenos dias Carlos, por favor necesito me apuebes los siguientes pedidos (86001355 - 391120)debido a los precios especiales que autorizo es Sr. Carlos Matias por la cantidad de pacas que pida el cliente. Rixabel','cparada','Aprobacion de pedidos','SE APROBARON LOS PEDIDOS','2009-12-01 17:33:03',0,3,2,'','','2009-11-27 08:38:53'),
 (171,'facturacionval','20','2009-11-27 14:46:44','aprobacion de Pedidos','Buenas Tardes carlos por favor necesito la aprobaciÃ³n de los siguienets pedidos que se encuentran bajo precio 27002568/270025681 Nota: (pedido dividido por la cantidad de kilos).\r\n29001549/24004077\r\n\r\nSin otro Particular\r\n\r\nMarelvis Marin\r\nSuc. valencia\r\n ','cparada','Aprobacion de pedidos','SE APROBARON LOS PEDIDOS','2009-12-01 17:32:39',0,3,1,'','','2009-11-27 14:46:44'),
 (172,'admsucbar','45','2009-11-30 14:38:19','Aprobacion de pedidos','Buenas tardes Pedro por favor necesito me apruebes los siguientes pedidos ( 1331-134-135-1361-138) estos  corresponden a los despachos que se le han realizado a ACOPIN, y los precios de los mismos estan por debajo de los precios de nuestra lista actual. Cualquier duda comunicate con el Ing. Carlos Matias, Gracias. Rixabel','pedro','Aprobacion de pedidos ','Buenas tardes.\r\nSe le informa que los pedidos han sido aprobados.','2009-11-30 15:41:21',0,3,1,'','','2009-11-30 14:38:19'),
 (173,'CARLOS18CASTRO','18','2009-12-02 11:04:51','APROBACION DE PEDIDO 154185','BUENOS DIAS CARLOS POR FAVOR PARA QUE ME APRUEBES EL PEDIDO 154185 QUE CORRESPONDE AL DESPACHO DE 1000 BULTOS DE ARROZ MARY SUPERIOR TIPO I 24X1 PARA EL DIA DE MA;ANA ','cparada','Aprobacion de pedidos','Se aprobo el pedido.','2009-12-02 11:15:31',0,3,1,'','','2009-12-02 11:04:51'),
 (174,'Tibisay','24','2009-12-02 11:29:04','Error al anular una cancelaciÃ³n en sistema de productores','Buenos DÃ­as: Al intentar realizar una anulaciÃ³n de una cancelaciÃ³n de boleta de liquidaciÃ³n en el sistema de productores, genera un error que puede observarse en la pantalla adjunta, y no me permite anularla. Para buscar una rÃ¡pida soluciÃ³n he procedido a anular la factura y emitir una nueva para poder realizar la cancelaciÃ³n con los cambios necesarios, sin embargo, no es la manera mÃ¡s correcta de proceder, por lo que solicito sea solucionado a la brevedad posible.','angelfmr','Anular cancelaciones','Listo por Ruiz','2009-12-21 14:42:29',0,3,2,'Tibisay_20091202_112904_Error en Anulacion de Cancelacion.bmp','','2009-12-02 11:29:04'),
 (175,'CARLOS18CASTRO','20','2009-12-03 14:25:04','aprobacion de pedidos ','BUENAS TARDES CARLOS NECESITO QUE ME APRUEBES ESTOS PEDIDO QUE NECESITO PARA HOY ES DE GALLETA PERO ES PARA LA GENTE DE ACOPIN *MERCA* Y A ELLOS LE DAN UN PRECIO DIFENRENTE. CULAQUIER COSA HABLAMOS.','cparada','Aprobacion de pedidos','SE CLASIFICO EL CLIENTE COMO UN TIPO DE NEGOCIO 9 (ACOPIN)PARA QUE NO LE DIERA DIFERENCIA EN PRECIO.','2009-12-09 14:31:38',0,3,1,'','','2009-12-03 14:25:04'),
 (176,'CARLOS18CASTRO','20','2009-12-03 14:27:42','aprobacion de pedidos ','DISCULPA LOS PEDIDOS SON 154298, 154299, 154300','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:32:00',0,3,1,'','','2009-12-03 14:27:42'),
 (177,'mazuaje','46','2009-12-03 18:00:11','CODIFICADOS','SR. ANGEL NECESITO LAS SIGUIENTES CODIFICACIONES\r\n142: 0414-3501488 (MARTIN SEGOVIA - TECNI RODAMIENTOS)\r\n382: 0414-5571695 (EDUARDO VELIZ - CONTRATISTA)\r\n383: 0426-9526655 (GERARDO SALCEDO - CONTRATISTA)\r\n384: 0414-5309235 (BENITO COLMENAREZ - CONTRATISTA)','angelfmr','codigos','listo','2010-01-08 11:23:22',0,3,1,'','','2009-12-03 18:00:11'),
 (178,'jose ramirez','20','2009-12-04 10:45:47','Aprobacion de pedidos','por favor para que me apruebe el pedido n# 364905 de distribuidora maxi mayor gracias','cparada','Aprobacion de pedidos','el pedido fue aprobado.','2009-12-04 10:52:32',0,3,2,'','','2009-12-04 10:52:02'),
 (179,'facturacionval','20','2009-12-04 14:46:24','pedidos','carlos estos son los pedidos que se encuentran bajo precio  390216/390217','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:32:25',0,3,1,'','','2009-12-04 14:46:24'),
 (180,'CARLOS18CASTRO','20','2009-12-04 14:52:44','aprobacion de pedidos ','BUENAS TARDES CARLOS NECESITO URGENTE LA APROBACION DE ESTE PEDIDO 154186 POR FAVOR DAME RESPUESTA LO MAS PRONTO\r\n','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:32:54',0,3,1,'','','2009-12-04 14:53:11'),
 (181,'facturacionval','20','2009-12-07 08:14:12','Pedidos bajo precio','Buenos dias! por favor solicito la aprobaciÃ³n del pedido # 240040861 que se encuentra bajo precio el arroz en Bs. 63.62\r\n\r\nSin otro particular\r\n\r\nMarelvis Marin\r\nFacturaciÃ³n\r\nSuc. Valencia\r\n','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:34:42',0,3,1,'','','2009-12-07 08:14:12'),
 (182,'facturacionval','45','2009-12-07 14:53:16','aprobacion de Pedidos','Buenas tardes por favor solicito la aprobaciÃ³n del siguiente pedido #390215 que se encuentra bajo precio el Superior para un despacho directo de planta 1440 bultos en Bs. 62.94','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:35:07',0,3,1,'','','2009-12-07 14:53:16'),
 (183,'mazuaje','47','2009-12-08 09:46:51','cambio de Nro. codificado','Buenos Dias Sr. Angel por favor necesito realice un cambio del numero telefonico que actualmente aparece en el codificado 588 por el siguiente numero: 6150269 nuevo pack\r\n\r\ngracias..','angelfmr','Codigos','listo','2010-01-08 11:22:59',0,3,2,'','','2009-12-08 11:59:29'),
 (184,'CARLOS18CASTRO','20','2009-12-08 11:19:09','aprobacion de pedidos ','BUENOS DIAS CARLOS PARA QUE ME QUE ME APRUEBES ESTE PEDIDO 154186 SON 1500 PACAS PERO VAN SEPARADAS EN 3 DE QUINIENTOS. \r\nGRACIAS','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:35:28',0,3,1,'','','2009-12-08 11:19:09'),
 (185,'admsucbar','45','2009-12-08 11:41:28','Aprobacion de pedidos','Buenos dias Carlos, por favor necesito apruebes los siguientes numeros de pedido. (86001394-86001400-86001395) esto debido a los precios especiales que autorizo el Sr. Carlos Matias a los clientes que compren una determinada cantidad de bultos de arroz.','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:33:41',0,3,1,'','','2009-12-08 11:41:28'),
 (186,'admsucbar','45','2009-12-08 11:41:55','Aprobacion de pedidos','Buenos dias Carlos, por favor necesito apruebes los siguientes numeros de pedido. (86001394-86001400-86001395) esto debido a los precios especiales que autorizo el Sr. Carlos Matias a los clientes que compren una determinada cantidad de bultos de arroz. Gracias. Rixabel','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.\r\n','2009-12-09 14:33:17',0,3,1,'','','2009-12-08 11:41:55'),
 (187,'facturacionval','20','2009-12-08 14:33:37','AprobaciÃ³n','Buenas Tardes por favor solicito la aprobaciÃ³n del pedido # 22003089 que se encuentra bajo precio el SUPERIOR 1440 BULTOS en 62.94','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:30:26',0,3,1,'','','2009-12-08 14:33:37'),
 (188,'jose ramirez','20','2009-12-08 16:01:07','APROBACION DE PEDIDO','POR FAVOR APROBAR EL PEDIDO N# 364906 DEL CLIENTE DISTRIBUIDORA ELITE CHE \r\n\r\nMUCHAS GRACIAS','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:35:54',0,3,2,'','','2009-12-08 16:01:07'),
 (189,'Tibisay','24','2009-12-09 11:30:41','Sistema de Productores - Modulo Anticipos','Buenos DÃ­as: En solicitudes pasadas se expreso que en el sistema de productores modulo de anticipos no estaban apareciendo las cancelaciones de algunas facturas, la situaciÃ³n fue solucionada al momento pero esta volviendo a aparecer el mismo error... Adjunto listado de cancelaciones pero en el faltan cancelaciones que ya fueron realizadas.','pedro','Sistema de Productores - Modulo Anticipos ','Buenas tardes.\r\nLs cancelaciones ya se reflejan en el reporte.\r\n','2009-12-11 17:02:32',0,3,2,'Tibisay_20091209_113041_Anticipo.JPG','','2009-12-09 11:30:41'),
 (190,'facturacionval','20','2009-12-09 14:25:57','AprobaciÃ³n','Buenas tardes carlos el pedido aprobar es el 24004095 que sae encuentra bajo precio 63.62\r\n\r\nSaludos!!','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2009-12-09 14:30:02',0,3,1,'','','2009-12-09 14:25:57'),
 (191,'Tibisay','29','2009-12-10 10:09:57','Error al reversar comprobante contable','Buenos DÃ­as: Al intentar realizar reverso del comprobante de traspaso 91T0911.0054 desde el sistema de productores - modulo de pase a contabilidad, aparece: Error de datos el comprobante de anticipos ya no existe, sin embargo el comprobante estÃ¡ en compiere y necesito reversarlo para entregar el dÃ­a de hoy el cuadre de cuentas de fin de mes a contabilidad. El error puede observarse en archivo adjunto.','pedro','Error al reversar comprobante contable ','Buenas tardes.\r\nSu solicitud ha sido solucionada.\r\nSaludos','2009-12-11 16:59:22',0,3,1,'Tibisay_20091210_100957_error_productores.bmp','','2009-12-10 17:14:51'),
 (192,'CARLOS18CASTRO','18','2009-12-10 10:31:47','aprobacion de pedidos ','BUENOS DIAS PARA QUE POR FAVOR ME APRUEBES ESTE PEDIDO 154384 URGENTE','cparada','APROBACION DE PEDIDOS','FUE APROBADO EL PEDIDO.','2009-12-14 09:16:19',0,3,1,'','','2009-12-10 10:31:47'),
 (193,'admsucbar','45','2009-12-10 11:39:26','Aprobacion de pedidos',' Hola Carlos por favor apruebame el pedido nro 902621659 que corresponde a Central Madeirense, me da bajo precio por al arroz superior. Gracias. Rixa','cparada','aprobacion de pedido','no se aprobo porque los precios no coincidian con la lista de precios.','2009-12-14 10:35:57',0,3,1,'','','2009-12-10 11:39:26'),
 (194,'CARLOS18CASTRO','20','2009-12-10 15:01:10','aprobacion de pedidos ','BUENAS TARDES CARLOS NECESITO LA APROBACION DE ESTE PEDIDO 154371 Y EL QUE TE PASE ESTA MA;ANA 154384 AVISAME \r\n','cparada','APROBACION DE PEDIDOS','FUE APROBADO EL PEDIDO.','2009-12-14 09:15:52',0,3,1,'','','2009-12-10 15:01:10'),
 (195,'CARLOS18CASTRO','20','2009-12-11 09:45:51','aprobacion de pedidos ','BUENOS DIAS CARLOS PARA QUE ME APRUEBES EL PEDIDO 154367. GRACIAS','cparada','APROBACION DE PEDIDOS','FUE APROBADO EL PEDIDO.','2009-12-14 09:15:29',0,3,1,'','','2009-12-11 09:45:51'),
 (196,'CARLOS18CASTRO','20','2009-12-11 09:49:00','aprobacion de pedidos ','APROBACION DE PEDIDO 154435 ','cparada','APROBACION DE PEDIDOS','FUE APROBADO EL PEDIDO.','2009-12-14 09:15:09',0,3,1,'','','2009-12-11 09:49:00'),
 (197,'facturacionval','20','2009-12-11 15:54:54','aprobacion de Pedidos','Buenas tardes por favor solicito la aprobaciÃ³n del pedido # 390224 que se encuentra bajo precio.\r\n\r\nsin Otro particular\r\n\r\n\r\nMarelvis Marin','pedro','Aprobacion de Pedidos','Buenas tardes.\r\nEl pedido ha sido aprobado.\r\nSaludos','2009-12-11 17:00:40',0,3,1,'','','2009-12-11 16:00:25'),
 (198,'CARLOS18CASTRO','20','2009-12-14 08:45:19','aprobacion de pedidos ','buenos dias carlos para que por favor me apruebes el siguiente pedido 364913 el cual va ser despachado el dia de ma;ana','cparada','APROBACION DE PEDIDOS','FUE APROBADO EL PEDIDO.','2009-12-14 09:14:46',0,3,1,'','','2009-12-14 08:45:19'),
 (199,'admsucbar','45','2009-12-14 10:28:56','Aprobacion de pedidos','Buenos dias Carlos necesito apruebes el siguiente nro de pedido 81002248, ya que le estoy facturando 500 pacas de premiun y hay que faturarla a Bs. 63.62.  Gracias, Rixabel.','cparada','aprobacion de pedido','el pedido fue aprobado','2009-12-14 10:34:27',0,3,2,'','','2009-12-14 10:28:56'),
 (200,'BRASILH','14','2009-12-14 15:36:52','ERROR EN CENTRALIZACIÃ“N CXC','BUENAS TARDES.\r\n\r\nHOY 14/12/09 INGRESE A INTERCAMBIO DE DATOS PARA CENTRALIZAR UN COMPROBANTE DE CXC, COLOQUE LA EL MOVIMIENTO (1412), FECHA (14/12/09) Y GLOSA(CXC DEL 14/12/09 CUANDO LE DOY EN OPCIÃ“N CENTRALIZAR ME DA EL SIGUIENTE ERRO: LOS SIGUIENTES REGISTROS DEL MAESTRO DE CUENTAS NO POSEE DATOS EN AÃ‘O MOVIEMIENTO 134. DE IGUAL MANERA ME PASO AL PREPARAR COMPROBANTE DE EFECTIVO POR DEPOSITAR.','pedro','ERROR EN CENTRALIZACIÃ“N CXC ','Buenos dias.\r\nEste error fuÃ© solucionado el dÃ­a 14/12/09 por el Sr. Alexander Adan.\r\n\r\nSaludos.','2009-12-16 08:53:34',0,3,1,'BRASILH_20091214_153652_ERROR DE CENTRALIZACIÃ“N.doc','','2009-12-14 15:37:45'),
 (201,'facturacionval','20','2009-12-17 09:51:12','aprobacion de pedidos','Buen dia el numero de pedido es 3902241 que se encuentra bajo precio el Premium y Superior en 63.62 menos el 1%\r\n\r\n\r\nSaludos!!','pedro','Aprobacion de pedido','Buenas tardes.\r\nNo se ha aprobado el pedido a peticion del usuario.\r\nSaludos.','2009-12-18 16:32:16',0,3,2,'','','2009-12-17 09:51:12'),
 (202,'facturacionval','20','2009-12-17 14:16:58','Aprobacion de pedido','hola pedro por favor necesito la aprobacion del seiguinete pedido que tiene precio mayorista 63.62 mas el 1% catidad 500 bultos\r\n\r\nSin otro particular\r\n\r\nMarelvis Marin','pedro','Aprobacion de pedido','Buenas tardes\r\nEl pedido Nro. 22003111 ya fuÃ© aprobado.\r\n\r\nSaludos..','2009-12-17 14:56:59',0,3,1,'','','2009-12-17 14:16:58'),
 (203,'facturacionval','20','2009-12-17 16:39:19','Aprobacion de Pedidos','Buenas tardes Pedro por favor necesito la aprobaciÃ³n de los siguientes pedidos 27002610 y 27002612 c/u con 500 bultos precio 63.62 mÃ¡s el 1%\r\n\r\n\r\nSin otro particular\r\n\r\nMarelvis Marin','pedro','Aprobacion de pedido','Buenas tardes\r\nLos pedidos han sido aprobados\r\nSaludos.\r\n','2009-12-18 16:30:03',0,3,1,'','','2009-12-17 16:39:19'),
 (204,'admsucbar','45','2009-12-18 10:52:02','Aprobacion de pedidos',' Buenos dias Carlos por favor apruebame los siguientes pedidos (86001375 - 86001442 - 86001443 - 82001712 - 86001422). Estos son despachos de gandolas y torontos y hay que darles un precio especial por la cantidad de pacas que estan comprando. Gracias. Rixa','cparada','aprobacion de pedido','SE APROBARON TODOS LOS PEDIDOS.','2009-12-18 14:08:49',0,3,2,'','','2009-12-18 10:52:02'),
 (205,'Laura Valencia','34','2009-12-18 11:00:26','Comprobante','Buenos Dias Pedro.\r\nEl presente es para notificar el problema que he tenido al momento de procesar un comprobante en el Sistema SPC yo lo proceso en compiere  al momento de imprimirlo me dice que no se registran datos el comprobante es 81I0912.0054.','cparada','comprobante compiere','se volvio a centralizar el comprobante.','2009-12-21 07:56:10',0,3,2,'','','2009-12-18 16:55:53'),
 (206,'CARLOS18CASTRO','20','2009-12-18 11:49:02','aprobacion de pedidos ','BUENOS DIAS POR FAVOR AUTORIZAME LOS SIGUIENTES PEDIDO 364921 Y 364917 LOS CUALES VAN A SER DESPACHOS DESDE ACARIGUA.\r\nGRACIAS','cparada','aprobacion de pedido','SE APROBARON TODOS LOS PEDIDOS.','2009-12-18 14:08:28',0,3,1,'','','2009-12-18 11:49:02'),
 (207,'almprodterp2','22','2009-12-18 15:31:36','despachos de II y harina','por medio del presente le comunico que en elinventario diario no se estan reflejando dos descargas de de sub-productos harina amarilla y II granel del dia 17/12/09 los mismos tienen boletos de peso se agradece la mayor colaboracion para la solucion de esta situacion y poder procesar un inventario real','angelfmr','Descarga de producto','Listo.','2009-12-21 14:41:38',0,3,1,'','','2009-12-18 15:31:36'),
 (208,'facturacionval','20','2009-12-21 08:18:30','Pedidos bajo precio','Buenos dias! por favor solicito la aprobacion de los siguientes pedidos # 24004085/ 24004143 que se encuentran bajo precio 62.94 nota: estos clientes compraron 1440 bultos el cual estan divididos en 2 pedidos.\r\n\r\n\r\nsin otro particular\r\n\r\n\r\nMarelvis Marin','pedro','Aprobacion de pedido','Buenos dias.\r\nLos pedidos # 24004085 y 24004143 fueron aprobados.\r\nSaludos\r\n','2009-12-21 09:30:07',0,3,1,'','','2009-12-21 08:18:30'),
 (209,'facturacionval','21','2009-12-21 17:34:26','Problema de Conformidad de Carga','Buenas tardes el presente es para explicarle que se presento un inconveniente al momento de realizar la Orden de carga del Sr. Jose Sequera C.I. 14464865, fecha: 17-12-2009, Carga # 2862: Al momento de asignarle el numero de Carga no me permitia cargar el Producto Dog Plus 1X18 10 bultos, reflejaba un mensaje indicando, que la cantidad 10 bultos era mayor a la que habia en almacen 4 bultos. Modifique la cantidad de ese producto a 4 bultos lo que habia en Stock. Se logra generar la Orden de carga con el # 2862, pero con el producto dog plus 1x18 2 veces uno con la cantidad de 4 bultos y otro al final con 6 bultos, pero en Almacen al momento de darle conformidad cuando va a cargar ese producto le dice que es mayor a la cantidad que hay en existencia.\r\n\r\nSin otro particular y en la espera de su pronta solucion\r\n\r\n\r\nMarelvis Marin\r\nFacturaciÃ³n\r\nSuc. Valencia\r\n','pedro','Problema de Conformidad de Carga','Buenas tardes.\r\nEl problema que se presenta con la Orden de Carga 2862 es que se agregÃ³ en la misma el producto 0262100118 Dog Plus 1*18 Dos veces, una con cantidad 4 y otra con 6, por lo tanto debe anular la orden de carga 2862 sin anular los pedidos asociados a ella para luego volver a hacer la orden de carga incluyendo solo una vez cada producto.\r\nSaludos','2009-12-23 12:43:37',0,3,1,'','','2009-12-21 17:34:26'),
 (210,'jose ramirez','20','2009-12-22 09:45:38','APROBACION DE PEDIDO','\r\nPOR FAVOR PARA QUE ME APRUEBE LOS SIGUIENTES PEDIDOS \r\n364922 DE MAROMA\r\n364915 DE DISTRIBUIDORA ELITCHE\r\n364914 DE DISTRIBUIDORA MERCAMAX\r\n\r\nMUCHAS GRACIAS ','cparada','aprobacion de pedido','se aprobo el pedido.','2009-12-28 15:29:53',0,3,2,'','','2009-12-22 09:45:38'),
 (211,'mazuaje','46','2009-12-22 10:08:30','cambio y nuevas codificaciones ','Buenos dias Sr. Angel\r\n\r\n- Favor realizar un cambio de codigio al chofer jorge canelon por el 7-189 con telef. 0424-5953260. \r\n\r\n- Favor realizar asignacion a los siguientes choferes (nuevos ingresos):\r\n    - Alvarado Waldwmar  7-237 con el  telef. 0416-4546710\r\n    - CabaÃ±as Victor     7-319 con el telef. 0414-5618746.\r\n\r\nIgualmente le quiero recordar que aun estan pendientes unas codificaciones,\r\n\r\nmilitza','angelfmr','codigos','listo','2010-01-08 11:22:20',0,3,2,'','','2009-12-22 10:08:30'),
 (212,'supcxcbar','15','2009-12-22 15:56:37','Problematica en sistema','Buenas Tardes Sr. Pedro, por medio de este medio le informo que en el Modulo de CXC o listado de CXC aparece una diferencia de 0.08 del cliente 80725 Siempre Completo el mismo no aparece en el modulo de transacciones, lo que deberia aparecer pues se necesita esta informaciÃ³n para poder ajustar esta diferencia con una nota de crÃ©dito por ajuste de diferencia en cobranza.\r\nAgradezco lo que pueda hacer al respecto para poder solventar esta situaciÃ³n.\r\nAgradecida\r\nJessica HIdalgo\r\nSup. CYC','pedro','','','1000-01-01 00:00:00',0,1,1,'','','2009-12-22 15:56:37'),
 (213,'mazuaje','46','2009-12-23 14:38:49','acceso a extensiones','Sr. Angel por solicitud de la Dra. Anna se solicita el siguiente acceso.\r\nLa extensiÃ³n 127 (Daleanny) que tenga acceso a los digitales, que pueda recibir llamadas externas y pueda realizar llamadas a codificados y poder transferirlas al  Dpto. Legal.\r\nSaludos\r\nMilitza','angelfmr','acceso exte','Listo Francisco Rodriguez','2010-01-08 11:21:48',0,3,2,'','','2009-12-23 14:38:49'),
 (214,'facturacionval','10','2010-01-04 10:00:37','actualizacion de comprobantes de ingresos','hola buenos dias pedro te lo envio la solicitud por la clave de marelvis en mi sistema no tengo creada el modulo de solicitudes,\r\npor favor actualizame desde el comprobante de Ingreso Nros.\r\n85I0912.0056 AL 85I0912.0069, DE FECHA 23/12/09. \r\n\r\npor favor cuando esten listos me avisas.\r\n\r\ngracias\r\n\r\nmaria cardona\r\ncredito y cobranzas\r\nsucursal valencia','pedro','actualizacion de comprobantes de ingresos','Buenos dÃ­as\r\n\r\nLos comprobantes de Ingreso Nros. 85I0912.0056 AL 85I0912.0069, DE FECHA 23/12/09, ya fueron actualizados en Compiere\r\n\r\nSaludos','2010-01-04 11:51:12',0,3,2,'','','2010-01-04 10:00:37'),
 (215,'facturacionval','10','2010-01-04 15:13:25','actualizacion de comprobantes de ingresos','hola buenas tardes, disculpa la molestia por favor actualizame los ultimos comprobantes de ingreso son de caja del 85I0912.0070. 85I0912.0071. 85I0912.0072 Y 85I0912.0073.\r\n\r\nGRACIAS Y DISCULPA TANTA MOLESTIA.\r\n\r\n\r\nMARIA CARDONA\r\nCREDITO Y COBRANZA\r\nSUCURSAL VALENCIA','pedro','ActualizaciÃ²n de comprobantes','Ok','2010-01-08 18:19:44',0,3,2,'','','2010-01-04 15:13:25'),
 (216,'CARLOS18CASTRO','20','2010-01-05 08:15:49','aprobacion de pedidos ','BUENOS DIAS CARLOS FELIZ A;O NUEVO PRIMERO QUE TODO ESPERO LA HALLA PASADO BIEN. BUENO LO SIGUIENTE ES PARA QUE ME APRUEBES EL SIGUIENTE PEDIDO QUE ES UN COMPLEMENTO DEL A;O PASADO EL PEDIDO ES EL 154385. POR FAVOR','pedro','Aprobacion de pedido','Buenos dÃ­as\r\nEl pedido nro. 154385 fuÃ© aprobado.\r\n','2010-01-05 11:38:46',0,3,1,'','','2010-01-05 09:27:02'),
 (217,'mazuaje','46','2010-01-06 07:59:02','eliminar codigo','Buenos dias Sr. Angel, por solicitud de Silvio Di Lanzo solicito eliminar la asignaciÃ³n al cÃ³digo 365 ya que quien lo tenia asignado culmino su contrato laboral con la empresa.\r\nEn espera de su confirmaciÃ³n\r\nSaludos\r\nMilitza','angelfmr','Codigos','Listo','2010-01-08 11:21:15',0,3,1,'','','2010-01-06 07:59:02'),
 (218,'facturacionval','45','2010-01-07 11:37:48','Aprobacion de pedido','Buenos dias pedro por favor solicito la aprobacion del siguiente pedido que se encuentra bajo precio # 322349 Cliente Ismael Rafit(Com. Maye), cantidad 800 Bultos de superior.\r\n\r\n\r\nSin otro Particular\r\nMarelvis Marin\r\n\r\n\r\n','pedro','Aprobacion de pedido','Buenas tardes.\r\nEl pedido Nro. 322349 ya fue aprobado.','2010-01-07 16:15:47',0,3,1,'','','2010-01-07 11:37:48'),
 (219,'CARLOS18CASTRO','20','2010-01-08 08:02:04','aprobacion de pedidos ','BUENOS DIAS PEDRO POR FAVOR PARA QUE ME APRUEBES EL PEDIDO 154540.','pedro','Aprobacion de pedido 154540. ','Buenas tardes.\r\nEl pedido nro. 154540 no puede ser aprobado debido a que tiene 500 bultos al precio 62.94 y dicho precio solo aplica desde 1000 a 1440 bultos, por lo cual el precio correcto debiÃ³ haber sido 63.62','2010-01-08 18:15:57',0,3,1,'','','2010-01-08 08:02:04'),
 (220,'almprodterp2','22','2010-01-08 09:09:47','INVENTARIO','LA PRESENTE PARA COMUNICARLE QUE EN LOS DIAS 07 Y 08 DEL PRESENTE MES SE HA PRESENTADO FALLAS DEL SISTEMA LO CUAL IMPIDE ELABORAR Y ACTUALIZAR LAS PRODUCCIONES ANTES DE LAS 8:00 AM AGRADESCO LA MAYOR COLABORACION A TAL SITUACION','angelfmr','Cierre inventario produccion','ok','2010-01-08 10:21:18',0,3,2,'','','2010-01-08 09:09:47'),
 (221,'almprodterp2','22','2010-01-08 09:09:50','INVENTARIO','LA PRESENTE PARA COMUNICARLE QUE EN LOS DIAS 07 Y 08 DEL PRESENTE MES SE HA PRESENTADO FALLAS DEL SISTEMA LO CUAL IMPIDE ELABORAR Y ACTUALIZAR LAS PRODUCCIONES ANTES DE LAS 8:00 AM AGRADESCO LA MAYOR COLABORACION A TAL SITUACION','angelfmr','Cierre inventario produccion','ok','2010-01-08 10:21:06',0,3,2,'','','2010-01-08 09:09:50'),
 (222,'almprodterp2','22','2010-01-08 09:09:54','INVENTARIO','LA PRESENTE PARA COMUNICARLE QUE EN LOS DIAS 07 Y 08 DEL PRESENTE MES SE HA PRESENTADO FALLAS DEL SISTEMA LO CUAL IMPIDE ELABORAR Y ACTUALIZAR LAS PRODUCCIONES ANTES DE LAS 8:00 AM AGRADESCO LA MAYOR COLABORACION A TAL SITUACION','angelfmr','Error carga produccion ','ok ','2010-01-08 10:20:30',0,3,2,'','','2010-01-08 09:09:54'),
 (223,'facturacionval','20','2010-01-08 11:32:36','Aprobacion de Pedidos','Buenos Dias Pedro por favor solicito la aprobacion del siguiente pedido que se encuentra bajo precio #24004169, Cantidad 1440 Bultos de Superior\r\n\r\n\r\nSin otro Particular\r\n\r\n\r\nMarelvis MarÃ­n\r\nFacturacion\r\nSuc. Valencia','pedro','Aprobacion de pedido','Buenas tardes.\r\nEl pedido Nro. 24004169 ha sido aprobado.','2010-01-08 14:36:19',0,3,1,'','','2010-01-08 11:32:36'),
 (224,'facturacionval','20','2010-01-11 15:52:33','Aprobacion de pedido','BUENAS TARDES SR PEDRO, PODRIA POR FAVOR APROBAR EL SIGUIENTE PEDIDO QUE SE ENCUENTRA BAJO PRECIO #390241,CANTIDAD 1440 BULTOS DE SUPERIOR Bs 63.62\r\n\r\nSIN OTRO PARTICULAR\r\n\r\n\r\nMARELVIS MARIN','pedro','APROBACION DE PEDIDOS','Buenas tardes.\r\nNo se puede aprobar el pedido debido a que las promociones de arroz quedaron suspendidas.\r\n\r\nSaludos.','2010-01-12 14:16:07',0,3,1,'','','2010-01-11 15:52:33'),
 (225,'Raisa ','24','2010-01-11 16:54:04','Error en la CancelaciÃ³n','Al intentar realizar la anulaciÃ³n de la cancelaciÃ³n de una factura el sistema genera un error que se puede observar en el documento adjunto. Favor solucionar a la brevedad posible.','angelfmr','Cancelacion productores','Lsito','2010-02-17 17:22:10',0,3,2,'Raisa _20100111_165404_Error en Cancelacion.bmp','','2010-01-11 16:54:04'),
 (226,'admsucbar','45','2010-01-11 17:33:56','Aprobacion de pedidos','Buenas tardes Pedro por favor necesito me apruebes los siguientes pedidos. 86001432 y 390852.','pedro','APROBACION DE PEDIDOS','Buenas tardes.\r\nNo se pueden aprobar los pedidos debido a que las promociones de arroz quedaron suspendidas.\r\n\r\nSaludos.','2010-01-12 14:17:24',0,3,2,'','','2010-01-11 17:33:56'),
 (227,'cmelo','3','2010-01-12 11:08:36','adaptador muose daÃ±ado','Yira, necesito por favor me consigas un adaptador de mouse con extremos de puerto USB y del otro lado redondo, ya que a uno de nuestros mouse se le daÃ±o dicho adaptador y aqui lo hemos buscado en algunas tiendas y no lo consiguimos.','backup','Conector','Buenas tardes,\r\n\r\nTe lo envÃ­o esta tarde que hay despacho.\r\n\r\nSaludos','2010-01-12 14:05:32',0,3,1,'','','2010-01-12 11:08:36'),
 (228,'jose ramirez','20','2010-01-13 08:47:52','APROBACION DE PEDIDO','\r\ncarlos buenos dias para que me haga el favor de aprobarme el pedido n# 364933 del cliente com. ferrera ferrera\r\n\r\nmuchas gracias','cparada','aprobacion de pedido','se aprobaron los pedidos','2010-01-25 10:29:27',0,3,2,'','','2010-01-13 08:47:52'),
 (229,'CARLOS18CASTRO','20','2010-01-13 09:37:36','aprobacion de pedidos ','BUENOS DIS APEDRO POR FAVOR APRUEBAME ESTE PEDIDO 154562, ESTE PEDIDO CORRESPONDE DE LA SEMANA PASADA EL CUAL TIENE ORDEN DE DESPACHO PARA MA;ANA, CUALQUIER COSA AVISAME','pedro','aprobacion de pedido','Buenos dÃ­as.\r\nNo se puede aprobar el pedido debido a que las promociones que se tenian en los arroces quedaron suspendidas.\r\nSaludos.','2010-01-13 10:02:41',0,3,1,'','','2010-01-13 09:37:36'),
 (230,'jose ramirez','20','2010-01-13 09:49:20','APROBACION DE PEDIDO','\r\nbuenos dias pedro para que me haga el favor de aprobarme el pedido n# 364933 del cliente com.ferrera ferrera \r\n\r\ngracias','pedro','aprobacion de pedido','Buenos dÃ­as.\r\nNo se puede aprobar el pedido debido a que las promociones que se tenian en los arroces quedaron suspendidas.\r\nSaludos.','2010-01-13 10:03:07',0,3,2,'','','2010-01-13 09:49:20'),
 (231,'mazuaje','46','2010-01-13 15:00:28','cambio de codificado',' Por medio de la presente me dirijo a usted en la oportunidad de informarle que el nÃºmero codificado 7-239 de Iancarina a nombre de Daniel Quiroga, debe ser cambiado en el sistema de telefonÃ­a por un nuevo nÃºmero: 04265461988 en tal sentido hacer todo lo pertinente al caso.','angelfmr','codigos','listo','2010-02-17 17:48:50',0,3,1,'','','2010-01-13 15:00:28'),
 (232,'mazuaje','46','2010-01-13 15:00:29','cambio de codificado',' Por medio de la presente me dirijo a usted en la oportunidad de informarle que el nÃºmero codificado 7-239 de Iancarina a nombre de Daniel Quiroga, debe ser cambiado en el sistema de telefonÃ­a por un nuevo nÃºmero: 04265461988 en tal sentido hacer todo lo pertinente al caso.','angelfmr','codigos','listo','2010-02-17 17:49:11',0,3,1,'','','2010-01-13 15:00:29'),
 (233,'mazuaje','46','2010-01-13 15:00:33','cambio de codificado',' Por medio de la presente me dirijo a usted en la oportunidad de informarle que el nÃºmero codificado 7-239 de Iancarina a nombre de Daniel Quiroga, debe ser cambiado en el sistema de telefonÃ­a por un nuevo nÃºmero: 04265461988 en tal sentido hacer todo lo pertinente al caso.','angelfmr','codigos','listo','2010-02-17 17:49:33',0,3,1,'','','2010-01-13 15:00:33'),
 (234,'gtesucvalencia','10','2010-01-14 09:07:35','apertura correo outlook','Esta solicitud es motivada a que el personal que la labora en el departamento de facturaciÃ³n como lo es la seÃ±orita Marelvis Marin y la seÃ±ora Maria Cardona del departamento de CrÃ©dito y Cobranza, necesitan esta opcion por que son las personas que deben estar comunicadas e informadas de todo lo relacionado con sus deberes con Planta Acarigua.','angelfmr','Correo Electronico','Listo','2010-02-17 17:10:42',0,3,1,'','','2010-01-14 09:07:35'),
 (235,'mazuaje','46','2010-01-14 15:39:29','SOLICITUD DE CODIFICADOS','TODO TICKET 163 0212-7617122 \r\nOSCAR BRAVO (T Y T) 129 0426-9515062 \r\nWALDEMAR ALVARADO (T Y T) 237 0426-8390047 \r\nDANIEL QUIROGA (Laboratorio) 239 0426-5461988 \r\nFRANKLIN BRACHO (T Y T) 325 0416-4371998  \r\nJOSE ALDANA (T Y T) 327 0426-2436547 \r\nJHONNY RODRIGUEZ (T y T) 331 0414-5164755 \r\nDOUGLAS HERNANDEZ (T Y T) 415 0416-7586740\r\nJUNIOR RIVERO (T Y T) 484 0416-4591320 \r\nCARLOS BOLIVAR (T Y T) 617 0426-2577317\r\nNUEVO PACK 588 0255-6150269 \r\n\r\n\r\n','angelfmr','codigos','listo','2010-02-17 17:49:54',0,3,1,'','','2010-01-14 16:41:34'),
 (236,'almprodterp2','22','2010-01-16 10:16:57','II granel','la presente para comunicarle que el dia 15/01/2010 se despacho una gandola de II garnel en planta 1 con el numero de orden de carga 11929 la misma fue liberada en romana por planta 2 lo cual trajo como consecuencia el descuadre de inventario agrdesco la mayor colaboracion a dicha situacion  lo antes posible','angelfmr','Inventario','Listo','2010-02-17 17:11:29',0,3,2,'','','2010-01-16 10:16:57'),
 (237,'almprodterp2','22','2010-01-16 10:18:25','II GRANEL ',': la presente para comunicarle que el dia 15/01/2010 se despacho una gandola de II garnel en planta 1 con el numero de orden de carga 11929 la misma fue liberada en romana por planta 2 lo cual trajo como consecuencia el descuadre de inventario agrdesco la mayor colaboracion a dicha situacion lo antes posible  ','pedro','II GRANEL ','Ok','2010-01-25 10:17:45',0,3,1,'','','2010-01-16 10:18:25'),
 (238,'mazuaje','46','2010-01-18 09:12:07','SE BORRO ESTE CODIFICADO','CARLOS ROJAS (T Y T)	424	0424-5641016\r\n','angelfmr','codigos','listo','2010-02-17 17:50:24',0,3,2,'','','2010-01-18 09:12:07'),
 (239,'mazuaje','46','2010-01-18 11:17:35','MODIFICAR CODIGO','GUADALUPE SANCHEZ (T y T)	119	0416-5163683\r\n','angelfmr','codigos','listo','2010-02-17 17:50:46',0,3,2,'','','2010-01-18 11:17:35'),
 (240,'NOHELIA','9','2010-01-19 09:20:50','Acceso Pag. Inces - ONA','Buen dÃ­a,\r\n\r\nLe informo que desde el jueves pasado (14-01-2010), algunas opciones de estas pÃ ginas estÃ¡n desactivadas, aparece que estÃ¡n en mantenimiento hasta prÃ³ximo aviso, mÃ¡s sin embargo en otras computadoras si funcionan. Yira acceso internet con su clave en mi PC y las opciones aparecen desactivada. Acceso en otra PC de recursos humanos y si le aparecen activadas.','angelfmr','Acceso a Paginas','Por favor notificar bien el link de la pagina web y darle a la Sra Yira la informacion para realizar los tramites','2010-02-17 17:23:52',0,3,1,'NOHELIA_20100119_92050_inces.JPG','','2010-01-19 09:20:50'),
 (241,'Nathalie','20','2010-01-20 10:33:50','ANULACION DE PEDIDOS DE SUCURSALES','la presente es para solicita la anulacion de los pediodo de sucursales (PENDIENTE X ANALIZA EN TRANSFERENCIA Y D.D.) lo cual atrasa el sistema y no seran utilizadas a futuro:\r\n GRACIAS\r\n   NATHALIE HIDALGO\r\nNOTA: TOMAR EN CUENTA AL REALIZAR LA ANULACION NO AFECTAR LA CUOTAS DE LAS SUCURSALES. \"DESPACHOS REALIZADOS\"\r\n','angelfmr','eliminar DD.','Se debe desaprobar los peddos y notificar a cada sucursal que los elimine, de esta manera se borran  del distema de oficina principal','2010-02-17 17:26:28',0,3,2,'','','2010-01-20 10:33:50'),
 (242,'almprodterp2','6','2010-01-20 11:04:29','equipÃ²',' saludos... la presente para comunicar la lentitud que se esta presentando en mi maquina se esta colgando a cada rato, el reporte de inventario de saldos tarda aproximadamente 15 o 20 minutos para abrir y muchas veces no abre hay que reiniciar la maquina muchas veces. esto trae como consecuencia el atraso en la elaboracion de los inventario en horas de la maÃ±ana. tambien cabe destacar que mi equipo es viejo y talves esto causa tal situacion, agradesco la mayor colaboracion lo antes posible ya que el inventario lo estoy pasando tarde   ','angelfmr','Lentitud','Estamos probando porque sucede esto.','2010-02-17 17:12:44',0,3,2,'','','2010-01-20 11:04:29'),
 (243,'almprodterp2','6','2010-01-20 11:09:58','equipo colgado','solicitud: saludos... la presente para comunicar la lentitud que se esta presentando en mi maquina se esta colgando a cada rato, el reporte de inventario de saldos tarda aproximadamente 15 o 20 minutos para abrir y muchas veces no abre hay que reiniciar la maquina muchas veces. esto trae como consecuencia el atraso en la elaboracion de los inventario en horas de la maÃ±ana. tambien cabe destacar que mi equipo es viejo y talves esto causa tal situacion, agradesco la mayor colaboracion lo antes posible ya que el inventario lo estoy pasando tarde   \r\n            \r\n     \r\n','backup','PC - Lenta','Hola Oswaldo, te voy a comenzar a preparar una computadora, para maÃ±ana te la estoy entregando.\r\n\r\nSaludos','2010-01-20 15:27:36',0,3,1,'','','2010-01-20 14:34:39'),
 (244,'RIGOBERTO','10','2010-01-21 15:30:59','SOLICITUD DE CORREO EXTERNO','SE REQUIERE LA HABILITACION DEL CORREO EXTERNO, PARA LA ANALISTA YAERMI ANAIS TRAVIESO, MOTIVADO A QUE A PARTIR DE ESTA FECHA ELLA PROCESARA LA SOLICTUD DEL BENEFICIO DE ALIMENTACION A TRAVEZ DE SODEXHO PASS Y TODO TICKET, POR LO CUAL REQUIERE ENVIAR Y RECIBIR ARCHIVO, CORREOS, COMUNICADOS, ETC. GRACIAS','angelfmr','Correo Electronico','Listo','2010-02-17 17:24:37',0,3,1,'','','2010-01-21 15:30:59'),
 (245,'mazuaje','46','2010-01-26 09:58:50','MODIFICAR CODIGO','JOSE DEL ROSARIO (Ventas) 577 0424-5476905 \r\nJOSE LUCENA (T Y T) 386 0416-5580358 \r\n\r\n\r\n \r\n','angelfmr','codigos','listo','2010-02-17 17:51:07',0,3,2,'','','2010-01-26 09:58:50'),
 (246,'Nathalie','20','2010-01-26 16:36:07','.',' \r\n Datos Solicitud:   \r\n Numero Solicitud: 241   \r\n Solicitante: Nathalie Hidalgo    \r\n Operador: Angel Munoz   \r\n Tipo de Solicitud: SISTEMA SPC - PEDIDOS   \r\n Fecha Solicitud: 20/01/2010   \r\n Hora Solicitud: 10:33:50 AM   \r\n Tiempo Transcurrido: 6 Dia(s)   \r\n Fecha ModificaciÃ³n: 20/01/2010   \r\n Hora ModificaciÃ³n: 10:33:50 AM   \r\n Tiempo Transcurrido: 6 Dia(s)   \r\n Prioridad: Normal   \r\n Estado: En ElaboraciÃ³n   \r\n Archivo adjunto:   \r\n Titulo solicitud: ANULACION DE PEDIDOS DE SUCURSALES   \r\n Detalle solicitud: la presente es para solicita la anulacion de los pediodo de sucursales (PENDIENTE X ANALIZA EN TRANSFERENCIA Y D.D.) lo cual atrasa el sistema y no seran utilizadas a futuro: GRACIAS NATHALIE HIDALGO NOTA: TOMAR EN CUENTA AL REALIZAR LA ANULACION NO AFECTAR LA CUOTAS DE LAS SUCURSALES. \\\"DESPACHOS REALIZADOS\\\"  \r\n','angelfmr','Despachos','ok','2010-02-17 17:15:06',0,3,2,'','','2010-01-26 16:36:07'),
 (247,'yaranguren','10','2010-01-29 16:40:57','Fallas en el envio de los correos','Angel: tengo problemas para enviar y recibir correos, esto ha ocurrido toda la semana.','angelfmr','Correos','En observacion','2010-02-17 17:15:39',0,3,1,'','','2010-01-29 16:40:57'),
 (248,'yaranguren','9','2010-01-29 16:42:16','Problemas con el Ingreso a Intenet','No he podido trabajar con las paginas del gobierno porque estan muy lentas. agradezco resolver esta siuacion lo antes posible ya que se ha retraso muchisimo el trabajo','angelfmr','Internet','En Observacion','2010-02-17 17:16:34',0,3,1,'','','2010-01-29 16:42:16'),
 (249,'Tibisay','24','2010-02-02 10:40:53','Inconsistencias en Listados de Sistema de Productores','Buenos DÃ­as,\r\n\r\nLe informo que el Listado de Compras de arroz paddy generado por el mÃ³dulo de LiquidaciÃ³n y FacturaciÃ³n del Sistema de Productores no estÃ¡ mostrando el monto real en el que fueron contabilizadas las provisiones, lo cual puede observarse en el documento adjunto... Se agradece la mayor atenciÃ³n al caso, puesto que dicha informaciÃ³n debe ser entregada a la Lcda. Patricia Giusti los primeros cinco dÃ­as de cada mes.','angelfmr','Inconsistencia Productores-Contabilidad','A la espera de revision por Jose Ruiz','2010-02-17 17:21:27',0,3,1,'Tibisay_20100202_104053_Listado compras y monto contabilizado.pdf','','2010-02-02 10:40:53'),
 (250,'Recepcion','46','2010-02-03 18:13:34','Solicitud de codificados ','Buenas tardes sr Angel \r\n\r\nFAVOR CODIFICAR ESTOS NUMEROS EN ESTAS EXTENXIONES:\r\n\r\nTODO TICKET                 = 163  / 0212-7617122\r\nGUADALUPE SANCHEZ (T y T)   = 119  / 0416-1551658\r\nOSCAR BRAVO  (T y T)        = 129  / 0426-9515062\r\nWALDEMAR ALVARADO (T y T)   = 237  / 0426-8390047\r\nDANIEL QUIROGA(Laboratorio) = 239  / 0426-5461988\r\nFRANKLIN BRACHO (T y T)     = 325  / 0414-4693136\r\nJOSE ALDANA  (T y T)        = 327  / 0426-2436547\r\nJHONNY RODRIGUEZ (T y T)    = 331  / 0414-5164755\r\nJOSE LUCENA (T y T)         = 386  / 0416-5580358\r\nDOUGLAS HERNANDEZ (T y T)   = 415  / 0416-7586740\r\nCARLOS ROJAS (T y T)        = 424  / 0424-5641016\r\nJUNIOR RIVERO (T y T)       = 484  / 0424-5193529\r\nCARLOS BOLIVAR (T y T)      = 617  / 0426-2577317\r\nJOSE DEL ROSARIO (VENTAS)   = 577  / 0424-5476905\r\nNUEVO PACK                  = 588  / 0255-6150269\r\nJOSE A. MARTINEZ (T y T     = 599  / 0426-9553711\r\nEDGAR CASTILLO (T y T)      = 200  / 0416-5293188\r\n\r\nMODIFICAR NUMERO TELEFONICO:\r\n\r\n0281-3172508 POR 0281-3172501 EN EL CODIGO NÂº 246\r\n\r\nELIMINAR CODIFICACION:\r\n\r\n0281-3175723  CODIGO: 477\r\n\r\nSR. Angel estas codificacion y modificaciones las estan necesitando con urgencia por favor a penas tenaga respuesta no los hace saber.\r\n\r\ngracias \r\n\r\nNailet /Militza\r\n  \r\n','angelfmr','Codigos','listo','2010-02-17 17:48:07',0,3,2,'','','2010-02-03 18:13:34'),
 (251,'ventasianca','34','2010-02-08 15:14:49','CreaciÃ³n de contrapartes en compiere.','BUENAS TARDES LA PRESENTE ES PARA NOTIFICARLE QUE LA CREACIÃ“N DE LOS PRODUCTORES ES UNA DE MIS FUNCIONES YA QUE LO HE VENIDO REALIZANDO DESDE HACE 1 AÃ‘O APROXIMADAMENTE EL DIA VIERNES 05/02/2010 NECESITABA CREAR A UN PRODUCTOR QUE ESTABA ENTRANDO AL PROGRAMA DE FINANCIAMIENTO Y NO PUDE HACERLO PORQUE NO TENGO ACCESO Y NO FUI NOTIFICADA DE ESTE CAMBIO E IGUALMENTE EL CAMBIO DE MI CLAVE EN COMPIERE NO SABIA QUE TENIA QUE COMPARTIRLA CON JAIRELI CASTILLO HASTA QUE SE PRESENTO EL DIA JUEVES 04/02/2010 QUE NO PODIA ENTRAR AL SISTEMA SIN MAS A QUE REFERIRME ME DESPIDO DE USTED ESPERANDO UNA SATISFACTORIA RESPUESTA CUALQUIER DUDA O SUGERENCIA POR FAVOR COMUNICARMELA.\r\nGRACIAS ATT.INGÂº LEIDY ANDRADE.\r\n','angelfmr','Cotrapartes','estamos estudiando los perfiles, acceso temporal','2010-02-17 17:18:30',0,3,2,'','','2010-02-08 15:14:49'),
 (252,'mazuaje','46','2010-02-10 17:18:53','SOLICITUD DE CODIFICADOS','Buenas Tardes Sr. Angel \r\nla presente es para solicitar sea asignado el codigo 387 a German Lucena con el nÃºmero de telÃ©fono 0424-5601415','angelfmr','codigos','listo','2010-02-17 17:51:27',0,3,2,'','','2010-02-10 17:18:53'),
 (253,'CARLOS18CASTRO','20','2010-02-11 09:15:29','AUTORIZACION DE PEDIDO','BUENOS DIAS PEDRO PAAR QUE POR FAVOR APRUEBES EL SIGUIENTE PEDIDO 51885 QUE CORRESPONDE A UNICASA LA CANDELARIA LA CUAL ME DA BAJO PRECIO POR LAS GALLETAS. EL SR. CARLOS MATIAS ME DIJO QUE LAS CADENAS SE LES VA A RESPETAR EL PRECIO.','cparada','Aprobacion de pedidos','se aprobo el pedido autorizado por Carlos Matias.','2010-02-11 11:16:24',0,3,1,'','','2010-02-11 09:20:17'),
 (254,'Tibisay','24','2010-02-17 17:43:13','Modulo de Anticipos Sistema de Productores','Buenas Tardes,\r\n\r\nAl realizar cancelaciÃ³n de anticipos en el sistema de productores se ha notado en varias oportunidades que las mismas no aparecen reflejadas en el listado de cancelaciÃ³n de anticipos, tambiÃ©n se ha notado que la mayorÃ­a de las veces que Ã©sto sucede es cuando se cancelan varios documentos con el mismo nÃºmero de recibo. Se agradece la mayor atenciÃ³n al caso, pues algunos de estos listados deben ser entregados a la brevedad posible al Ing. Roberto Di Lanzo...','pedro','Modulo de Anticipos Sistema de Productores','Su solicitud ha sido resuelta el dia jueves 18/02/10.','2010-02-19 14:48:48',0,3,2,'Tibisay_20100217_174313_Solicitud informatica.pdf','','2010-02-17 17:43:13'),
 (255,'Recepcion','46','2010-02-18 12:05:15','solicitud de codidicaciones y modificacion ','Buenos dias Sr. Angel\r\nNUEVAS CODIFICACIONES:\r\n\r\nFRANKLIN BRACHO (TYT)   325/0416-4371998\r\nDOUGLAS HERNANDEZ (TYT) 415/0416-7586740\r\nJHONNY MANZANO (TYT)      132/0414-5163491\r\nANDRES MENDEZ (TYT)       259/0416-3565577\r\nGERMAN LUCENA (AUDITOR DE PLANTA) 387/0424-5601415\r\nROMER VILLAROEL (TYT)     395/0416-0566737\r\nALEJANDRO RODRIGUEZ(TYT)  347/0426-2501172\r\nJAVIER BRITO (TYT)        459/0424-5212995\r\nCARLOS HERNANDEZ (TYT)    593/0424-5024726\r\n','angelfmr','codigos','Listo','2010-03-24 09:08:38',0,3,2,'','','2010-02-18 12:05:15'),
 (256,'almacenp1','47','2010-02-24 09:52:42','formato de descarga','El presente es  para solicitar sea anexado en el formato de descarga de productos la opcion de OBSERVACIONES la cual la necesitamos para justificar las salidas de productos que se hacen en almacen para llevar un mejor control de los mismos y quede grabado en sistema la razon de la descarga. Agradeciendo de ante mano su pronta y acostumbrada colaboracion\r\n\r\n','angelfmr','Agregar Observacion','Ok esto se enviara a programacion, puede tardar ya que tenemos otras prioridades, pero estara en las actividades.\r\nSaludos','2010-03-03 11:39:35',0,3,1,'','','2010-02-24 09:55:22'),
 (257,'CARLOS18CASTRO','20','2010-02-24 10:00:14','aprobacion de pedidos ','BUENOS DIAS CARLOS POR FAVOR AUTORIZAME ESTOS PEDIDOS SON POR LE PRECIO DE LA GALLETA PARA UNAS CADENAS, UNICASA Y PLANSUREZ A LOS CUALES EL PRECIO SE LE VA A RESPETAR','cparada','Aprobacion de pedidos','EL PEDIDO FUE APROBADO.','2010-02-24 11:21:46',0,3,1,'','','2010-02-24 10:00:14'),
 (258,'danny','33','2010-02-24 16:23:28','cambio de fecha en comprobante','que me cambie la fecha del comprobante de egreso, porque le coloque fecha 31/12/10 y corresponde a 31/01/10. porfavor es urgente gracias ','cparada','cambio de fecha en comprobante','Se cambio la fecha del comprobante.','2010-02-24 18:10:31',0,3,1,'','','2010-02-24 16:23:28'),
 (259,'NELIGER ARIAS','33','2010-02-25 10:07:40','SOLICITUD','Buenos Dias por medio de la presente solicito por favor el cambio de numero del comprobante de egreso 147491 de fecha 31012010 a 247491 ya que por error se coloco un numero incorrecto.sin mas que agregar y esperando su pronta respuesta.','cparada','cambio de numero de comprobante','el numero de comprobante fue cambiado al numero solicitado.\r\n','2010-02-25 10:11:50',0,3,1,'','','2010-02-25 10:07:40'),
 (260,'anais','38','2010-02-26 10:46:16','AUSENCIA DE MARCAJES','BUEN DIA YIRA:\r\nTE COMUNICO POR ESTE MEDIO QUE EL SISTEMA COLUMBUS, ESTA PRESENTADO PROBLEMAS (AUSENCIA DE MARCAJE EN LAS TARDE DESDE EL MARTES 23/02 HASTA LA FECHA).\r\nAGRADEZCO LO QUE PUEDAS HACER EL RESPECTO, EN ESPERA DE UNA PRONTA RESPUESTA...\r\n                                      ANAIS TRAVIESO...','backup','','','1000-01-01 00:00:00',0,1,1,'','','2010-02-26 10:46:16'),
 (261,'NELIGER ARIAS','47','2010-03-01 09:22:39','SOLICITUD','BUENOS DIAS: POR MEDIO DE LA PRESENTE SOLICITO ME SEAN TRASLADADOS LOS ARCHIVOS QUE SE ENCUENTRA EN EL COMPUTADOR ASIGNADO A USUARIO CONT-CXP (Neliger Arias) AL COMPUTADOR QUE ERA DE LA SRA YAJAIRA ASI COMO TAMBIEN EL CORREO QUE ACTUALMENTE TENGO PARA QUE LO PUEDA ABRIR POR ESE COMPUTADOR. sin mas que agregar y esperando su pronta respuesta.\r\n\r\nAtt. Neliger Arias','cparada','Cambio de equipo','Se cambio la ubicacion del equipo que estaba en el puesto de cxp al puesto que era de la sra. Yajaira. y se coloco la memoria ram del equipo de la sr. Yajaira al equipo de Neliger Arias.','2010-03-02 09:13:07',0,3,1,'','','2010-03-01 10:22:47'),
 (262,'LOGISTICA','45','2010-03-01 11:25:32','SOLICITUD DE APROBACION','CARLOS POR FAVOR SI PUEDES APROBAR DOS (02) PEDIDOS BAJO PRECIO 322297 Y 29001672, EL SR. CARLOS ESTA AQUI ESPERANDO TU LLAMADA.\r\n\r\nSALUDOS\r\nHAIZKEL','cparada','aprobacion de pedido','se aprobo el pedido despues de conversacion con Carlos Matias.','2010-03-01 11:58:56',0,3,1,'','','2010-03-01 11:51:38'),
 (263,'danny','33','2010-03-01 11:42:17','caso retencion','buenos dia, porfavor necesito de caracter urgente que me digan o programen como enviar las retnciones desde geiva y hacerle llegar dicha retencion a los proveedores por su correo. gracias.','cparada','Notificacion de retencion a proveedor','Buenos dias esa opcion que tu solicitas esta en el reporte tu lo puedes enviar al correo electronico que desees, solo debes dar un click en la carta que sale alli te va a salir una ventana con 2 opciones, una para colocar el formato en el cual deberas seleccionar el formato del archivo que vas a enviar por email y otro dice destino en el cual debes seleccionar microsoft mail mapi que es la opcion para enviar  por email, luego precionas el boton aceptar y te saldra una ventana en donde debes colocar los destinatarios, el asunto y el mensaje si lo deseas.\r\n\r\nSi tienes alguna duda por favor notificamelo, \r\nSaludos.','2010-03-18 09:48:06',0,3,1,'','','2010-03-01 11:42:17'),
 (264,'NELIGER ARIAS','46','2010-03-01 16:40:21','CAMBIO DE LINEA','BUENAS TARDES POR MEDIO DE LA PRESENTE SOLICITO LE SEA CAMBIADO LA EXTENSION DE TELEFONO DE GUZMAN WILMAN QUE ACTUALMENTE TIENE LA 113 A LA 121 Y DONDE ESTA LA 121 DEJEN LA 113.\r\nSIN MAS QUE AGREGAR Y ESPERANDO SU PRONTA RESPUESTA SE DESPIDE;NELIGER','backup','','','1000-01-01 00:00:00',0,1,1,'','','2010-03-01 16:40:21');
INSERT INTO `tsolicitudes` (`nId_Numero`,`cId_Solicitante`,`cId_TipoS`,`dFechaSol`,`cTituloSol`,`cDetalleSol`,`cId_Operador`,`cTituloResp`,`cDetalleResp`,`dFechaResp`,`nBase`,`nEstado`,`nPrioridad`,`cArchivo_Adjunto1`,`cArchivo_Adjunto2`,`dFechaMod`) VALUES 
 (265,'NELIGER ARIAS','47','2010-03-01 21:50:02','VARIOS','Buenas Noches,por medio de la presente solicito la creacion de plantillas de asientos de comprobantes de egresos en excel correspondientes a las reservas e intereses de`prestaciones de empleados obreros,gerencial,sucursales,choferes para de esta forma agilizar el registro de ellas ya que mes a mes se hace bastante engorroso y repetitivo ya que es la misma estructura de asiento, lo que varia son los montos,de manera fisica le hare llegar los modelos de las plantillas a crear.\r\nSin mas que agregar y esperando su pronta respuesta me despido. ','cparada','Creacion de plantilla de asientos contables','Buenos dias con respecto a tu solicitud es complicado desarrollar una aplicaciÃ³n de esta magnitud, porque en este sistema no solo se transcriben asientos sino que tambiÃ©n se transcriben las retenciones de iva e impuesto sobre la renta y las facturas que bajan al libro. Por lo cual no puedo colocar una opciÃ³n abierta al pÃºblico para que suba asientos de esta forma ya que para ello implicarÃ­a hacer una validaciÃ³n lÃ­nea por lÃ­nea de las cuentas y si estas manejan retenciÃ³n de IVA e islr. Sin embargo puedes enviarme el archivo de Excel con las reservas siempre y cuando yo tenga disponibilidad de tiempo, es decir debes consultarme primero y queda totalmente bajo tu responsabilidad los comprobantes generados de esta forma, cualquier duda estoy a tu disposiciÃ³n saludos.','2010-03-18 10:56:30',0,3,1,'','','2010-03-01 21:50:02'),
 (266,'CARLOS18CASTRO','20','2010-03-02 08:48:56','aprobacion de pedidos ','BUENOS DIAS CARLOS PARA QUE POR FAVOR ME APRUEBES LOS SIGUIENTES PEDIDOS SON DE CADENAS POR LE PRECIO DE LAS GALLETAS COMO LOS DEL OTRO DIA LOS NUMEROS SON. 332862 Y EL 52071 POR FAVOR AVISAME.','cparada','Aprobacion de pedidos','Se facturaron los pedidos sin el producto que estaba bajo precio.','2010-03-02 14:07:01',0,3,1,'','','2010-03-02 08:49:21'),
 (267,'Tibisay','24','2010-03-02 10:28:56','Error en formulacion','Buenos DÃ­as, \r\n\r\nAdjunto error que presenta el sistema de productores al momento de realizar la liquidaciÃ³n de determinados boletos luego de haberles cambiado el precio. EliminÃ© la formula y la volvÃ­ a hacer y aÃºn aparece el mismo error. RealicÃ© otra formulaciÃ³n de un sÃ³lo boleto y tambien aparece. Favor revisar el caso a la mayor brevedad posible, pues la liquidaciÃ³n debe ser pagada para este viernes por instrucciones del Ing. Roberto Di Lanzo.','pedro','Error en formulacion','Este error ya fuÃ© resuelto.\r\nSaludos','2010-03-03 11:13:21',0,3,1,'Tibisay_20100302_102856_Error en formulacion 02-03-10.bmp','','2010-03-02 10:28:56'),
 (268,'Tibisay','24','2010-03-03 10:32:34','Error en Listado de Recepciones (Compra)','Buenos DÃ­as,\r\n\r\nAdjunto listado de recepciones (Compra) del productor CorporaciÃ³n Casa de los dÃ­as 12 y 13 de febrero del presente mes, cuyo precio de compra no es el real, lo que me crea una diferencia entre el sistema de productores y contabilidad. Favor resolver Ã©sta situaciÃ³n a la mayor brevedad posible, puesto que dichos listados deben ser entregados a la Lcda. Patricia Giusti antes del 05 del presente mes.','pedro','Error en Listado de Recepciones (Compra)','Su solicitud fue solucionada','2010-03-18 09:40:57',0,3,1,'Tibisay_20100303_103234_CASA 12 Y 13-02-10.pdf','','2010-03-03 10:32:34'),
 (269,'NELIGER ARIAS','33','2010-03-04 10:07:34','SOLICITUD','BuenosDias:por medio de la presente le solicito revisar el comprobante de egreso 144169 de fecha 31-12-2009 ya que luego de centralizarlo y importar el comprobante en compiere al intentar imprimir el comprobante centralizado en gestion contable sale la hoja en blanco.\r\nEn espera de su pronta respuesta','cparada','comprobante no se ve impreso','esto esta solucionado.','2010-03-18 09:50:26',0,3,1,'','','2010-03-04 10:07:34'),
 (270,'mazuaje','46','2010-03-05 15:41:56','MODIFICAR CODIGO','CAMBIAR NÂº DE TELEFONO ASIGNADO AL CODIGO 384 (BENITO COLMENRAREZ - CONTRATISTA)\r\n0424-5806684','angelfmr','codigos','Listo','2010-03-24 09:08:13',0,3,1,'','','2010-03-05 15:41:56'),
 (271,'marasist1cxc','15','2010-03-10 16:56:25','error en sistema de cobranza','error en sistema de cobranza ','cparada','error en sistema de cobranzas','jose gregorio corrigio el error','2010-03-25 16:07:43',0,3,2,'marasist1cxc_20100310_165625_untitled.bmp','','2010-03-10 16:56:25'),
 (272,'Nathalie','18','2010-03-10 17:03:09','.','BUENAS TARDES.\r\nEL CARRO 401XCD CARGO HARINA AMARILLA EN PLANTA  II ESTE YA POSE LA BOLETA Y AL MOMENTO DE REALIZA LA GUIA EL SISTEMA MUESTRA \"VERIFIQUE EL ESTATUS DEL VEHICULO\" \r\nEL CARRO ESTA ESPERANDO POR PAPELES','angelfmr','OC 13108','Listo','2010-03-10 17:11:16',0,3,2,'','','2010-03-10 17:03:09'),
 (273,'mazuaje','46','2010-03-11 10:21:03','CODIFICADOS','Se requieren las siguientes modificaciones y/o asignaciones\r\n159: 0416-2537263\r\n395: 0416-7324176\r\n415: 0416-5959400\r\n498:0426-8480082\r\n325:0416-4371998\r\n347:0426-2501172\r\n459:0424-5212995\r\n593:0424-5024726\r\n332:0414-5163491','angelfmr','codigos','Listo','2010-03-24 09:07:51',0,3,2,'','','2010-03-11 10:21:03'),
 (274,'supcxcbar','45','2010-03-11 11:08:03','PROBLEMATICA EN GUIA DE DESPACHO','BUENOS DIAS SR.PEDRO POR MEDIO DEL PRESENTE QUISIERA SOLICITARLE QUE ME PRESTE SU AYUDA PARA REIMPRIMIR UNA GUIA DE DESPACHO QUE SE QUEDO ATASCADA EN EL SISTEMA EL NUMERO DE CARGA ES 2269 Y LA CONFORMIDAD 2099 AGRADECIDA DE ANTEMANO \r\nZUNILDE PARACO \r\nASIST.ALMACEN','angelfmr','Reimpresion Guia','Hola\r\nPrimero la opcion que seleccionastes fue la de Camaras y debes elegir la del sistema SPC\r\nPara reimprimir una guia solo debes llamarla de nuevo y emitirla.\r\nSaludos','2010-03-23 09:06:04',0,3,2,'','','2010-03-11 11:08:03'),
 (275,'cmelo','15','2010-03-11 11:46:16','error en modulo de cobranza','En este modulo sale la siguiente lectura de error:\r\nNumero de error: 12\r\nMensaje de error: Variable \"VENPRESA2\" is not found\r\nLinea de codigo con error\r\nNumero de linea: 14\r\nPrograma con error: FP_DEFINE\r\n            OK\r\n\r\n','cparada','error en sistema de cobranzas','el error fue solventado.','2010-03-25 16:08:16',0,3,1,'','','2010-03-11 11:46:16'),
 (276,'CARLOS18CASTRO','20','2010-03-18 08:47:03','aprobacion de pedidos ','BUENOS DIAS CARLOS ;A PRESENTE ES PARA QUE POR FAVOR ME APRUEBES EL SIGUIENTE PEDIDO 4526579 ES DE PLAZA POR EL ARROZ INTEGRAL QUE ESTA A PRECIO VIEJO Y SEGUN LO HABLADO CON EL SR. CARLOS MATIAS TE IVA A INFORMAR PARA SU APROBACION DE ESTE ARROZ HASTA QUE SE TERMINE SU EXISTENCIA. AVISAME CUALQUIER COSA','cparada','Aprobacion de pedidos','SE APROBO LUEGO DE HABLAR CON CARLOS MATIAS.','2010-03-18 10:45:36',0,3,1,'','','2010-03-18 08:47:03'),
 (277,'CARLOS18CASTRO','20','2010-03-18 10:58:50','aprobacion de pedidos ','DISCULPA CARLOS APRUEBAME OTRA VEZ EL PEDIDO PORQUE NO ME DI CUENTA Y SE ME OLVIDO QUITARLE UNOS PRODUCTOS QUE NO TENGO AHORITA, DISCULPAME ESA Y UNAS CUANTAS MAS....','cparada','Aprobacion de pedidos','SE APROBO NUEVAMENTE EL PEDIDO.','2010-03-18 11:05:52',0,3,1,'','','2010-03-18 10:58:50'),
 (278,'mazuaje','46','2010-03-18 15:18:48','CODIFICADOS','SR. ANGEL REQUIERO DE LOS SIGUIENTES CODIFICADOS\r\n268: 0412-6441640\r\n394: 0414-4699039','angelfmr','Codigos','Listo','2010-03-24 09:07:25',0,3,2,'','','2010-03-18 15:19:35'),
 (279,'admsucbar','20','2010-03-23 08:43:47','Aprobacion de pedidos','Buenos dias Carlos, eston son los numeros de pedido que por favor necesito sean aprobados (395065/395068/395069/395070/395071/391136/391192/3911341/391135/391194/3411941/0395066)\r\nGracias. Rixabel\r\n','cparada','Aprobacion de pedidos','se aprobaron los pedidos.','2010-03-23 14:53:25',0,3,1,'','','2010-03-23 08:43:47'),
 (280,'admsucbar','20','2010-03-24 10:07:57','Aprobacion de pedidos','Buenos dias Carlos, por favor necesito que apruebes los soguiente pedidos (678039/681007/100372859)son dos Makros y un C.Madeirense, esto debido a los precios especiales que tienen por la promocion. Gracias... Rixabel\r\n','cparada','Aprobacion de pedidos','Disculpa pero no es pocible la aprobacion de los pedidos que solicitaste ya que la promocion solo incluye el arroz dorado y solo el cliente Central Madeirence, uno de los pedidos es a makro y el de Central incluye otros productos bajo precio aparte de el arroz dorado.','2010-03-24 10:50:09',0,3,2,'','','2010-03-24 10:08:43'),
 (281,'admsucbar','20','2010-03-24 17:16:25','Aprobacion de pedidos','Buenos tardes carlos, adicional a los pedidos que te envie en horas de la maÃ±ana para que los aprobaras necesito que incluyas estos dos (1071024/1078022). Gracias. Rixabel','cparada','Aprobacion de pedidos','los pedidos fueron aprobados despues de consultar con el Sr. Carlos Matias.','2010-03-25 09:53:42',0,3,2,'','','2010-03-24 17:16:25'),
 (282,'LOGISTICA','7','2010-03-25 09:00:46','APROBACION PEDIDO PRECIO DORADO','BUEN DIA CARLOS, POR FAVOR SI PUEDES APROBAR EL PEDIDO 780383 DE MAKRO VALENCIA, DONDE SE LE DEBE FACTURAR  100 PACAS DE DORADO EN BS.100,32 DE ACUERDO A LO INDICADO POR EL SR. CARLOS MATIAS.\r\n\r\nSALUDO','cparada','Aprobacion de pedidos','el pedido fue aprobado.','2010-03-25 17:06:43',0,3,1,'','','2010-03-25 14:49:22'),
 (283,'cmelo','47','2010-03-25 16:47:53','estadisticas 2009','CARLOS EL SR. JUAN CELIS NECESITA POR FAVOR VER LAS ESTADISTICAS DEL AÃ‘O 2009 PARA HACER UNAS MEDICIONES EN CUANTO AL CRECIMIENTO DE LAS ZONAS POR FAVOR NECESITAMOS NOS INSTALES EL ICONO CON ESTA INFORMACION','cparada','Ventas 2009','se coloco un respaldo de la data al 30/12/2009 y se coloco acceso a la misma.','2010-03-25 17:06:17',0,3,1,'','','2010-03-25 16:47:53'),
 (284,'LOGISTICA','7','2010-03-26 14:30:33','APROBACION PEDIDO PRECIO DORADO','BUENAS TARDES CARLOS, POR FAVOR PARA APROBAR DOS PEDIDOS 290026034 Y 7803032, UNO DE CENTRAL MADEIRENSE CON 100 DORADO A BS. 93.48 Y EL OTRO 40 PACAS DE MAKRO NAGUANAGUA A BS.100.32.\r\n\r\nGRACIAS......','cparada','Aprobacion de pedidos','El pedido fue aprobado.','2010-03-29 10:04:25',0,3,1,'','','2010-03-26 14:30:33'),
 (285,'LOGISTICA','45','2010-04-05 08:47:33','APROBACION PEDIDO PRECIO DORADO','BUEN DIA CARLOS!\r\n\r\nPOR FAVOR NECESITO CON URGENCIA ME APRUEBES DOS PEDIDOS DE MAKRO MARACAY 397498 100 PACAS  Y EL MAKRO PARAGUANA 7802318 20 PACAS, YA QUE LOS ESTAN ESPERANDO PARA HOY.\r\n\r\nGRACIAS\r\nSALUDOS\r\n\r\n\r\n','cparada','Aprobacion de pedidos','Se aprobaron los pedidos despues de hablar con el Sr. Carlos Matias.','2010-04-05 09:14:55',0,3,1,'','','2010-04-05 08:47:33'),
 (286,'CARLOS18CASTRO','18','2010-04-05 12:12:10','sistema de despacho','buenas tardes carlos hace tiempo les envie un correo por este medio para ver si me podian solucionar en problema que tengo en el sistema de despacho el cual al momento de asignar los pedidos me aparecen pedidos que ya han sido despachados en su oprotunidad.\r\nCuando puedas darme respuesta a esto te lo agradezco, ya que estoy ense;andole a una persona y es algo fastidioso eso ahi lo cual no deberia estar.\r\n\r\nGracias...','cparada','','','1000-01-01 00:00:00',0,1,2,'','','2010-04-05 12:12:10'),
 (287,'CARLOS18CASTRO','11','2010-04-05 12:16:16','asignacion de impresora','buenas tardea pedro espero estes bien, bueno empiezo el mes molestandote como debes saber se creo un nuevo cargo la cual esa persona debe facturar, pero en la computadora que se le asigno no se si esta asignada la impresora de punto por favor cuando puedas revizalo y avisame ella esta trabajando la el usuario. jbriceno, cuando puedas darme respuesta te lo agradezco...\r\n\r\nGracias.....','backup','','','1000-01-01 00:00:00',0,1,1,'','','2010-04-20 18:08:41'),
 (288,'admsucbar','20','2010-04-05 15:22:10','Aprobacion de pedidos','Buenas tardes Carlos, por favor necesito me apruebes el pedido numero 100383252 de Central Madeirense porque hay diferencia en el precio del Dorado. Rixabel. Gracias.','cparada','APROBACION DE PEDIDO','EL PEDIDO FUE APROBADO SEGUN CORREO DE CARLOS MATIAS.','2010-04-06 09:20:36',0,3,1,'','','2010-04-06 09:07:53'),
 (289,'admsucbar','20','2010-04-06 09:21:27','Aprobacion de pedidos','Buenos dias Carlos, necesito me apruebes el siguiente pedido (1578020) es Makro por la diferencia en precio del arroz Dorado. Gracias. Rixa','cparada','APROBACION DE PEDIDO','EL PEDIDO FUE APROBADO SEGUN CORREO DE CARLOS MATIAS.','2010-04-06 09:23:28',0,3,2,'','','2010-04-06 09:21:27'),
 (290,'admsucbar','20','2010-04-06 10:29:22','Aprobacion de pedidos','Carlos necesito apruebes el pedido (1003728935) Central madeirense por diferencia en precio del arroz Dorado. Gracias. Rixa\r\n','cparada','APROBACION DE PEDIDOS','EL PEDIDO FUE APROBADO SEGUN CORREO DE CARLOS MATIAS.','2010-04-06 14:27:40',0,3,2,'','','2010-04-06 10:29:22'),
 (291,'admsucbar','20','2010-04-06 15:30:20','Aprobacion de pedidos','Buenas tardes Carlos, necesito me apruebes el pedido (2271027) Makro por la diferencia de precio en arroz Dorado.','cparada','APROBACION DE PEDIDOS','EL PEDIDO FUE APROBADO SEGUN CORREO DE CARLOS MATIAS.','2010-04-06 16:49:15',0,3,2,'','','2010-04-06 16:35:32'),
 (292,'cmelo','7','2010-04-06 16:46:34','CAMBIO DE PRECIO DORADO','CARLOS POR FAVOR RECUERDA CAMBIAR EL PRECIO DEL ARROZ DORADO YA QUE YA SE AGOTO EN NUESTRA SUCURSAL LA EXOSTENCIA DE ESTE PODUCTO A PRECIO VIEJO','cparada','CAMBIO DE LISTA DE PRECIO','SE CAMBIO EL PRECIO DEL ARROZ DORADO AL PRECIO NUEVO.','2010-04-06 16:55:51',0,3,1,'','','2010-04-06 16:46:34'),
 (293,'LOGISTICA','10','2010-04-07 11:35:24','APROBACION PEDIDO PRECIO DORADO','BUEN DIA CARLOS, POR FAVOR PARA APROBAR EL PEDIDO 5774421 DE MAKRO VALLE LA PASCUA, 12 PACAS DE DORADO BS. 100.32.\r\n\r\nGRACIAS','cparada','APROBACION DE PEDIDO','EL PEDIDO FUE APROBADO.','2010-04-07 14:31:19',0,3,1,'','','2010-04-07 11:35:24'),
 (294,'admsucbar','20','2010-04-07 11:56:25','Aprobacion de pedidos','Buenos dias Carlos por favor necesito apruebes el pedido 391140 S/M Unicasa por la diferencia en precio del arroz Dorado. Garcias. Rixa','cparada','APROBACION DE PEDIDO','EL PEDIDO FUE APROBADO.','2010-04-07 14:27:02',0,3,2,'','','2010-04-07 11:56:25'),
 (295,'LOGISTICA','10','2010-04-07 12:05:47','APROBACION PEDIDO PRECIO DORADO','SOLICITUD DE APROBACION PEDIDO 7101232 MAKRO NAGUANAGUA 10 PACAS DE DORADO  BS.100.32','cparada','APROBACION DE PEDIDO','EL PEDIDO FUE APROBADO.','2010-04-07 14:30:19',0,3,1,'','','2010-04-07 12:05:47'),
 (296,'admsucbar','20','2010-04-07 14:37:04','Aprobacion de pedidos','Buenas tardes Carlos por favor aprueba el pedido 100262315 de Central Madeirense por la diferencia en precio del arroz Dorado. Gracias. Rixa','cparada','APROBACION DE PEDIDO','EL PEDIDO FUE APROBADO.','2010-04-09 14:43:10',0,3,1,'','','2010-04-07 14:37:04'),
 (297,'admsucbar','20','2010-04-09 11:46:18','Aprobacion de pedidos','Buenos Dias Carlos por segunda vez te solicito que por favor me apruebes el pedido 2378029 y el 100262315, son Makro y Central y tienes diferencia en precio con el arroz Dorado. Gracias. Rixa','cparada','APROBACION DE PEDIDO','EL PEDIDO FUE APROBADO.','2010-04-09 14:43:35',0,3,1,'','','2010-04-09 11:46:18'),
 (298,'LOGISTICA','10','2010-04-13 09:14:52','APROBACION PEDIDO PRECIO DORADO','BUEN DIA CARLOS, POR FAVOR PARA APROBAR EL PEDIDO 7403130 DE MAKRO VALENCIA 60 PACAS DE DORADO BS.100.32.\r\n\r\nSALUDOS\r\nGRACIAS','cparada','APROBACION DE PEDIDO','el pedido fue aprobado.','2010-04-13 14:25:42',0,3,1,'','','2010-04-13 09:14:52'),
 (299,'cmelo','1','2010-04-14 11:42:41','configuracion de impresora','Estimado Angel: desde el dia de ayer la impresora laser que trabaja en red para toda la oficina administrativa, esta desconfigurada los formatos salen cortados del lado derecho de la hoja por lo tanto la informaciÃ²n de todos los reporte emitidos dentro de citrix estan asÃ¬.\r\nPor fa ayudanos lo mas pronto posible con esto','angelfmr','','','1000-01-01 00:00:00',0,1,1,'','','2010-04-14 11:42:41'),
 (300,'cmelo','1','2010-04-15 14:16:54','problemas con la impresora','Pedro de este correo ya le notifique a Angel, estamos urgidos que nos ayuden con la impresora laser que trabaja en red en nuestra oficinas administrativas, la misma esta desconfigurada imprime los formatos incompletos o en su defecto solo las lineas y no la leyenda este problema lo tiene en todos los modulos de citrix.  Por fa es urgente','angelfmr','','','1000-01-01 00:00:00',0,1,1,'','','2010-04-20 18:00:04'),
 (301,'cparada','11','2010-04-17 12:21:22','Conexion de Red IANCA','Error de Conexion desde las 8 y media de la maÃ±ana a citrix a pesar de que daba respuesta desde ambos sitios.','angelfmr','','','1000-01-01 00:00:00',0,1,1,'','','2010-04-17 12:21:22'),
 (302,'cmelo','1','2010-04-30 14:38:17','impresora laser  desconfigurada','Angel desde la semana pasada los usuarios estan quedando sin impresoras aparecen otras impresora que no estan en red.\r\nPor fa ayudanos con esto ya que a cada rato estamos llanado a informatica para nos las configuren de nuevo','angelfmr','','','1000-01-01 00:00:00',0,1,1,'','','2010-04-30 14:38:17'),
 (303,'admsucbar','45','2010-04-30 16:56:24','Aprobacion de pedidos','Buenas tardes Carlos por favor necesito me apruebes el pedido nro 850015191 ya que esta rechazado por bajo precio en el producto Mary Integral. ','cparada','APROBACION DE PEDIDOS','se aprobo el pedido.','2010-05-17 09:47:29',0,3,1,'','','2010-04-30 16:56:24'),
 (304,'cmelo','22','2010-05-11 08:48:31','error para accesar a modulo de reportes','AMIGO CARLOS TAL Y COMO TE COMENTE TENEMOS PROBLEMAS PARA ACCESAR AL MODULO DE REPORTES SALE EL SIGUIENTE ERROR:\r\n\"EXISTE UNA CONECCION ODBC MAL CONFIGURADA O NO EXISTE COMUNIQUESE CON EL ADMINISTRADOR DEL SISTEMA\" LUEGO OTRA LEYENDA QUE DICE: \"RECUERDE QUE LA CONECCION ODBC PARA DATA FLEX ES COBRANZA Y LA CONECCION DE ACCESS ES COBRANZA ES COBRANZA_APP','cparada','','','1000-01-01 00:00:00',0,1,1,'','','2010-05-11 08:48:31'),
 (305,'cmelo','21','2010-05-19 10:45:24','salida de almacen','Hola Carlos, la presente es para informatarte que en el formato de Salida de Almacen las unidades del aceite no se multiplican por su peso por lo tanto coloca el mismo monto de las unidades de aceite','cparada','','','1000-01-01 00:00:00',0,1,1,'','','2010-05-19 10:45:24'),
 (306,'cmelo','22','2010-05-19 10:47:46','reporte de estadisticas de ventas','Hola Carlos en el reporte de ventas (estadisticas) se reflejan las ventas de lentejas como si fueran arvejas partidas ','cparada','','','1000-01-01 00:00:00',0,1,1,'','','2010-05-19 10:47:46');
/*!40000 ALTER TABLE `tsolicitudes` ENABLE KEYS */;


--
-- Definition of table `ttipo_solicitudes`
--

DROP TABLE IF EXISTS `ttipo_solicitudes`;
CREATE TABLE `ttipo_solicitudes` (
  `cId_TipoS` varchar(4) NOT NULL DEFAULT '',
  `cDescripcion` varchar(60) DEFAULT '',
  `cId_Departamento` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`cId_TipoS`) USING BTREE,
  KEY `FKtDepartamentos-ttipo_solicitudes` (`cId_Departamento`),
  CONSTRAINT `FKtDepartamentos-ttipo_solicitudes` FOREIGN KEY (`cId_Departamento`) REFERENCES `tdepartamentos` (`cId_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tipos de Solicitudes';

--
-- Dumping data for table `ttipo_solicitudes`
--

/*!40000 ALTER TABLE `ttipo_solicitudes` DISABLE KEYS */;
INSERT INTO `ttipo_solicitudes` (`cId_TipoS`,`cDescripcion`,`cId_Departamento`) VALUES 
 ('1','HARDWARE IMPRESORAS','1'),
 ('10','CORREO','1'),
 ('11','CONEXION RED','1'),
 ('12','CAMBIO DE CLAVE','1'),
 ('13','SISTEMA PALM','1'),
 ('14','SISTEMA SPC - INTERCAMBIO DE DATOS','1'),
 ('15','SISTEMA SPC - COBRANZAS','1'),
 ('16','SISTEMA SPC - CAJA','1'),
 ('17','SISTEMA SPC - PARAMETROS','1'),
 ('18','SISTEMA SPC - DESPACHOS','1'),
 ('19','SISTEMA SPC - VENTAS','1'),
 ('2','PANTALLA AZUL','1'),
 ('20','SISTEMA SPC - PEDIDOS','1'),
 ('21','SISTEMA SPC - ALMACEN','1'),
 ('22','SISTEMA SPC - REPORTES','1'),
 ('23','SISTEMA REPORTES CORPORATIVOS','1'),
 ('24','SISTEMA PRODUCTORES - LIQUIDACION','1'),
 ('25','SISTEMA PRODUCTORES - PARAMETROS','1'),
 ('26','SISTEMA PRODUCTORES - ROMANA','1'),
 ('27','SISTEMA PRODUCTORES - LABORATORIO','1'),
 ('28','SISTEMA PRODUCTORES - CONTROL ENTRADA','1'),
 ('29','SISTEMA PRODUCTORES - PASE CONTABILIDAD','1'),
 ('3','HARDWARE MOUSE/TECLADO','1'),
 ('30','SISTEMA SAINT','1'),
 ('31','SISTEMA FLEXLINE','1'),
 ('32','SISTEMA GESTION BANCARIA','1'),
 ('33','SISTEMA GESTION CONTABLE','1'),
 ('34','SISTEMA COMPIERE','1'),
 ('35','SISTEMA BALANCE DE COMPROBACION','1'),
 ('36','SISTEMA DE TRANSPORTE','1'),
 ('37','SISTEMA BOLETOS P1 - P2','1'),
 ('38','SISTEMA COLUMBUS','1'),
 ('39','SISTEMA COMISIONES','1'),
 ('4','HARDWARE UPS (BATERIA)','1'),
 ('40','SISTEMA SPI','1'),
 ('41','SISTEMA VERITRAX','1'),
 ('42','OFFICE','1'),
 ('43','OPEN OFFICE','1'),
 ('44','SCANNER','1'),
 ('45','CAMARAS','1'),
 ('46','LINEAS y EXTENSIONES TELEFONICAS','1'),
 ('47','REQUERIMIENTOS','1'),
 ('5','HARDWARE REGULADOR DE VOLTAJE','1'),
 ('6','LENTITUD EQUIPO','1'),
 ('7','LISTA DE PRECIO','1'),
 ('8','CONEXION CITRIX','1'),
 ('9','INTERNET','1');
/*!40000 ALTER TABLE `ttipo_solicitudes` ENABLE KEYS */;


--
-- Definition of table `tubicaciones`
--

DROP TABLE IF EXISTS `tubicaciones`;
CREATE TABLE `tubicaciones` (
  `cId_Ubicacion` varchar(3) NOT NULL DEFAULT '',
  `cDescripcion` varchar(60) DEFAULT '',
  `cId_Empresa` varchar(3) NOT NULL,
  PRIMARY KEY (`cId_Ubicacion`),
  KEY `FKtEmpresas-tUbicaciones` (`cId_Empresa`) USING BTREE,
  KEY `FK_Ubic_empresa` (`cId_Empresa`),
  CONSTRAINT `FK_Ubic_empresa` FOREIGN KEY (`cId_Empresa`) REFERENCES `tempresas` (`cId_Empresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Ubicaciones de la corporación';

--
-- Dumping data for table `tubicaciones`
--

/*!40000 ALTER TABLE `tubicaciones` DISABLE KEYS */;
INSERT INTO `tubicaciones` (`cId_Ubicacion`,`cDescripcion`,`cId_Empresa`) VALUES 
 ('1','ADMINISTRACION','1'),
 ('10','CARACAS LIDO','1'),
 ('11','TRANSPORTE','1'),
 ('12','ADMINISTRACION IANCA','2'),
 ('13','ADMINISTRACION CORISA','3'),
 ('2','PLANTA 1','1'),
 ('3','PLANTA 2','1'),
 ('4','PLANTA 3','1'),
 ('5','Sucursal Centro Occidente','1'),
 ('6','Sucursal Barcelona','1'),
 ('7','Sucursal Caracas','1'),
 ('8','Sucursal Maracaibo','1'),
 ('9','Sucursal Valencia','1');
/*!40000 ALTER TABLE `tubicaciones` ENABLE KEYS */;


--
-- Definition of table `tusuarios`
--

DROP TABLE IF EXISTS `tusuarios`;
CREATE TABLE `tusuarios` (
  `cId_Usuario` varchar(15) NOT NULL DEFAULT '',
  `cDescripcion` varchar(60) NOT NULL DEFAULT '',
  `cPassword` varchar(15) NOT NULL DEFAULT '',
  `nOperador` int(1) NOT NULL DEFAULT '0',
  `cId_Departamento` varchar(4) NOT NULL DEFAULT '' COMMENT 'tDepartamentos',
  `cTelefono1` varchar(12) DEFAULT '',
  `cTelefono2` varchar(12) DEFAULT '',
  `cTelefono3` varchar(12) DEFAULT '',
  `cCorreo1` varchar(100) DEFAULT '',
  `cCorreo2` varchar(100) DEFAULT '',
  `cCorreo3` varchar(100) DEFAULT '',
  `cPregunta` varchar(100) DEFAULT '',
  `cRespuesta` varchar(100) DEFAULT '',
  `nTipoSol` int(1) NOT NULL DEFAULT '0',
  `nUbicaciones` int(1) NOT NULL DEFAULT '0',
  `nDepartamentos` int(1) NOT NULL DEFAULT '0',
  `nUsuarios` int(1) NOT NULL DEFAULT '0',
  `nReportes` int(1) NOT NULL DEFAULT '0',
  `nAdministrar` int(1) NOT NULL DEFAULT '0',
  `nEmpresas` int(1) NOT NULL DEFAULT '0',
  `nActivo` int(1) NOT NULL DEFAULT '0',
  `nConfiguracio` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cId_Usuario`) USING BTREE,
  KEY `FKtDepartamentos-tUsuarios` (`cId_Departamento`) USING BTREE,
  CONSTRAINT `FK_Usuarios_Dpto` FOREIGN KEY (`cId_Departamento`) REFERENCES `tdepartamentos` (`cId_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Usuarios del Sistema';

--
-- Dumping data for table `tusuarios`
--

/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` (`cId_Usuario`,`cDescripcion`,`cPassword`,`nOperador`,`cId_Departamento`,`cTelefono1`,`cTelefono2`,`cTelefono3`,`cCorreo1`,`cCorreo2`,`cCorreo3`,`cPregunta`,`cRespuesta`,`nTipoSol`,`nUbicaciones`,`nDepartamentos`,`nUsuarios`,`nReportes`,`nAdministrar`,`nEmpresas`,`nActivo`,`nConfiguracio`) VALUES 
 ('admin','Administrador de Sistema','ž›’–‘',0,'1','','','','programador@iancarina.com.ve','','','SA','SA',1,1,1,1,1,1,1,1,1),
 ('admsucbar','Carmen Zavala','ž›’ŒŠœž',0,'42','','','','ibarcelona@mary-iancarina.com','','','quien es la mas linda de la sucursal','?',0,0,0,0,0,0,0,1,0),
 ('almacenp1','oswaldo ramirez','ž“’Î',0,'15','','','','jefealmacenop@mary-iancarina .com','','','animal que pelea karate','oso panda',0,0,0,0,0,0,0,1,0),
 ('almprodterp2','oswaldo ramirez','ÍÌ',0,'20','223','211','','almprodterp2@iancarina.com','','','animal mas rapido','la serpiente',0,0,0,0,0,0,0,1,0),
 ('anagoropeza','departamento contabilidad La principal','ÍËÍË',0,'2','','','','icontabcxc@mary-iancarina.com','icontabcxc@corporacionmary.com','anagracielaoropeza@hotmail.com','contabilidad','si',0,0,0,0,0,0,0,1,0),
 ('anais','nomina','ÎÊÏÉÇÏ',0,'3','04143524203','','','analista-nomina@iancarina.com.ve','','','donde trabajas','mary incarina',0,0,0,0,0,0,0,1,0),
 ('angelfmr','Angel Munoz','”š’‘',1,'1','136','','','angelfmr@mary-iancarina.com','','','nombre mi perro','kia',0,0,0,0,1,1,0,1,0),
 ('angirodriguez','angi rodriguez cherurini','ÎÇÇËËÆÊÊ',0,'4','04245555552','','','finanzas@mary-iancarina.com','','','nombre y apellido de mi mama','carmen cherurini',0,0,0,0,0,0,0,1,0),
 ('aptp2','oswaldo ramirez','žžÍÌ',0,'20','','','','almprodterp2@iancarina.com.ve','','','cual es el animal mas rapido','la serpiente',0,0,0,0,0,0,0,1,0),
 ('ASISTPROD','ANA ELISA ESCALONA','ÎÍÌË',0,'7','0424-5020150','','','LICHA2104@HOTMAIL.COM','','','CONTRASEÃ‘A','1243',0,0,0,0,0,0,0,1,0),
 ('auditorcc','auditor de calidad','­ž–…žÊÙ',0,'18','','','','auditorcc@mary-iancarina.com','auditorcc@iancarina.com.ve','','control de calidad','planta 1',0,0,0,0,0,0,0,1,0),
 ('backup','Soporte TÃ©cnico','–Œ‹šœ‘–œ',1,'1','','','','istecnico@iancarina.com.ve','istecnico@mary-iancarina.com','','ingreso','10102005',1,1,1,1,1,1,1,1,1),
 ('BRASILH','Heliana Brasil','ÎÈÌÉÍÆÏÉ',0,'11','105','103','','dalvarez@iancarina.com.ve','','','como se llama mi mascota?','negro',0,0,0,0,0,0,0,1,0),
 ('CARLOS18CASTRO','ASIS. ADMINISTRATIVO','ÎÉÆÌÊÆÎÈÎÉ',0,'32','4162913','04241791831','','CARLOS18CASTRO@HOTMAIL.COM','','','NOMBRE DE MI HIJA','STEPHANIE',0,0,0,0,0,0,0,1,0),
 ('carmen berrios','supervisora de credito y cobranza','ÌÏÉÊ',0,'32','4169029','04144118703','','cxcicaracas@mary-ianacarina','','','nombre de mi hija','charlott',0,0,0,0,0,0,0,1,0),
 ('cmelo','karin PÃ¨rez Administradora','’žœ’š“',0,'38','','','','imaracaibo@mary-iancarina.com','','','nombre de su hija','daniela',0,0,0,0,0,0,0,1,0),
 ('cparada','Carlos Parada','ÎÉÆÉËÇËÏ',1,'1','124','7550','','programador@iancarina.com.ve','sistemas@mary-iancarina.com','','Quien es Ã¡ Ã© Ã­ Ã³ Ãº Ã± Ã‘','yo',1,1,1,1,1,1,1,1,1),
 ('creditoval','maria cardona','–ž‘œž–‘ž',0,'35','0241-6179445','0241-6179442','0241-6179443','josmary55@hotmail.com','','','hola','chao',0,0,0,0,0,0,0,1,0),
 ('credycobval','maria cardona','œš›†œ‰ž“',0,'11','02416179442','02416179443','02416179445','cxcvalencia@mary-iancarina.com','','','hola','chao',0,0,0,0,0,0,0,1,0),
 ('danny','Danny Rojas','›ž‘‘†',0,'2','116','','','secretariacontab@iancarina.com.ve','','','mi apellido','rojas',0,0,0,0,0,0,0,1,0),
 ('facturacionval','Marelvis MarÃ­n','ÎÉÇÆÈÆËË',0,'35','04143492966','','','facturacionvalencia@hotmail.com','','','grupo musical','mana',0,0,0,0,0,0,0,1,0),
 ('frankeyra','Frankeyra Pineda','™ž‘”š†ž',0,'40','107','158','','icompras@mary-iancarina.com','','','NOMBRE DE HERMANA','gabriela pineda',0,0,0,0,0,0,0,1,0),
 ('GABRIELA','GABRIELA CIRICA','¾³»¾ÎÏ',0,'4','0255-6212522','0255-6000400','0414-3552020','gcirica@mary-iancarina.com','gabrielacirica@hotmail.com','','MI PERRITO','SKYPY',0,0,0,0,0,0,0,1,0),
 ('ggomez','CrÃ©dito y Cobranzas Valencia','ÍÌÍÉÎÍ',0,'35','','','','ivalencia@mary-iancarina.com','','','cual es mi equipo preferido','argentina',0,0,0,0,0,0,0,1,0),
 ('gtesucvalencia','giancarlo','ÇÊÏÌÏ',0,'34','','','','gtesucvalencia@mary-iancarina.com','','','color de mi carro','rojo',0,0,0,0,0,0,0,1,0),
 ('ialmacenmp','almacen de repuestos planta 1','ÎÍÌËÊÉ',0,'13','0414-5103798','','','ialmacenmp@mary-iancarina.com','pedroruiz70hotmail.com','','quien eres','soy yo',0,0,0,0,0,0,0,1,0),
 ('iinciarte','Irene Inciarte','––‘œ–ž‹š',0,'38','','','','imarcaibo@mary-iancarina.com','','','usuario iancarina','iinciarte',0,0,0,0,0,0,0,1,0),
 ('itransporte','asist.administrativo','«ž‘Œ‹š',0,'43','6150407','6212522','','itransporte@iancarina.com','','','taller y transporte','vehiculos',0,0,0,0,0,0,0,1,0),
 ('Jlozada','Johanna Lozada','ššÏÎ',0,'26','','','','jlozada@iancarina.com.ve','icoccidente@mary-iancarina.com','','SA','SA',0,0,0,0,0,0,0,1,0),
 ('Johanna ','Administradora','šš',0,'26','','','','icoccidente@mary-iancarina.com','','','dibujo animado ','winnie pooh',0,0,0,0,0,0,0,1,0),
 ('jose ramirez','analista de cuentas especiales','ÎÏÏÎÉÉ',0,'32','04241863673','02125830121','02124162923','joseg08ramirez@hotmail.com','','','nombre de mi hija','katheryne',0,0,0,0,0,0,0,1,0),
 ('Laura Valencia','secretaria planta I','ÎÆÍÇÌÇÆË',0,'18','','','','secplanta1@iancarina.com','','','Fecha de nacimiento','13/09/1989',0,0,0,0,0,0,0,1,0),
 ('LOGISTICA','HAIZKEL GUEDEZ','©º±«¾¬',0,'1','02416179442','02416179443','','logistica@mary-iancarina.com','','','color preferido','blanco',0,0,0,0,0,0,0,1,0),
 ('Luis Silva','Jefe de Planta I','“Œ–“‰ž',0,'18','','','','lsilva@mary-iancarina.com','','','animal','caballo',0,0,0,0,0,0,0,1,0),
 ('marasist1cxc','beatriz ceballos','ÍËÏÍÈÏ',0,'38','','','','imaracaibo@mary-iancarina.com','','','mi dulce favorito','quesillo',0,0,0,0,0,0,0,1,0),
 ('Marrieta','Maria Alejandra Arrieta','ÎËÉÈÉÌÇÌ',0,'3','ext. 154','04143106778','','irrhhsel@mary-iancarina.com','marrieta@iancarina.com','','Numero de identidad','14676383',0,0,0,0,0,0,0,1,0),
 ('mazuaje','Militza Azuaje','’ž…Šž•š',0,'9','','','','mazuaje@mary-iancarina.com','','','usuario','mazuaje',0,0,0,0,0,0,0,1,0),
 ('MGALLARDO','CAJA CHICA','ÏÉÏËÍÏÏÆ',0,'2','04145568621','02556212522','','icontabcaja@mary-iancarina.com','marlennys52@hotmail.com','','Â¿Mi gran Amor?','Cesar Mendez',0,0,0,0,0,0,0,1,0),
 ('Nathalie','Nathalie Hidalgo','’šÍ',0,'6','156','','','ventas-fac@iancarina.com.ve','','','ci:','19637267',0,0,0,0,0,0,0,1,0),
 ('NDIAZ','NORMEDY','‘›–ž…',0,'7','','','','PRODUCTORES@MARY-IANCARINA.COM','','','NOMBRE PAPA','JUAN',0,0,0,0,0,0,0,1,0),
 ('NELIGER ARIAS','NELIGER','ÎÉÊÉÊÉÊÏ',0,'2','02556212522','','','cont-cxp@iancarina.com.ve','','','QUIEN ES MI MAMA','NELIDA',0,0,0,0,0,0,0,1,0),
 ('nestor','Nestor Suarez','ÎÍÌ',0,'1','138','','','nestorsuarezXXI2009@hotmail.com','','','Cual es mi numero de cedula','21395862',0,0,0,0,1,1,0,1,0),
 ('NOHELIA','Asistente de Gerencia de Recursos Humanos','ÏÈÏËÇÏ',0,'3','','','','irrhh@mary-iancarina.com','','','nombre de mi mascota','chicha',0,0,0,0,0,0,0,1,0),
 ('NOM_CONT','NOMINA CONTABLE','±°²¶±¾',0,'2','','','','cont-nomina@iancarina.com.ve','','','NOMBRE DE MI NOVIO','DAVID',0,0,0,0,0,0,0,1,0),
 ('pedro','Pedro Papic','–‘™ÎÍÌ',1,'1','','','','programador2@iancarina.com.ve','pedro.papic@gmail.com','pedropj2@gmail.com','videojuego favorito','ff',1,1,1,1,1,1,1,1,1),
 ('Peggy Vale','Analista de control de calidad','¯š˜˜†Î',0,'18','','','','analistacc@iancarina.com.ve','','','Nombre de mi espocito.','Israel',0,0,0,0,0,0,0,1,0),
 ('Raisa ','Raisa Peraza','ž–Œž',0,'7','','','','aux_productores@iancarina.com.ve','','','Donde estudias?','En el IUTEP',0,0,0,0,0,0,0,1,0),
 ('Recepcion','Nailet Perez','­šœšœ–‘',0,'9','251','','','recepcion2@iancarina.com.ve','recepiancarina@mary-iancarina.com','','mis mascota','valiente',0,0,0,0,0,0,0,1,0),
 ('rh-social','Egdalis Timaure','ÎÍÌ',0,'3','0424-5238516','','','egdalisk@gmail.com','','','Usuario','Esocial',0,0,0,0,0,0,0,1,0),
 ('RIGOBERTO','JEFE DPTO NOMINA','®ªº¬«ÏÎ',0,'3','04127933489','','','inomina@mary-iancarina.com.','','','CUAL ES SU CARGO','JEFE',0,0,0,0,0,0,0,1,0),
 ('rivero','JosÃ© Rivero','–‰š',0,'41','','','','supsegp1@iancarina.com.ve','cseguridad@mary-iancarina.com','','nombre hijo mayor','Moises',0,0,0,0,0,0,0,1,0),
 ('sec legal','Daleany Ramirez','Œœ“š˜ž“ÏÏ',0,'10','','','','sec-legal@iancarina.com.ve','','','Mi ficha','6379',0,0,0,0,0,0,0,1,0),
 ('Smariani','Sandra Mariani','Œž’ÎÈÏÆ',1,'1','','','','smariani@mary-iancarina.com','smariani@iancarina.com.ve','','Nombre de su papa','vittorio',1,1,1,1,1,1,1,1,1),
 ('supcxcbar','Jessica Hidalgo','ŒŠœ‡œž',0,'42','0414-8237867','0281-3172501','','Jessihidalgo_183@hotmail.com','Jessicahidalgo64@yahoo.es','','Jessica','Hidalgo',0,0,0,0,0,0,0,1,0),
 ('tania','tania figueredo','ÏÎÏÌÉÆ',0,'33','04244259748','0241811715','','tanif@hotmail.es','','','quien va usarlo','tania',0,0,0,0,0,0,0,1,0),
 ('Tibisay','Auxiliar de Productores','žŠ‡ ›Šœ‹šŒ',0,'7','02556212522','04165533364','','asist-productores@iancarina.com.ve','tibisay_molina@yahoo.es','','Cargo en la empresa','Auxiliar Administrativo',0,0,0,0,0,0,0,1,0),
 ('transporte','carmen','ÉÎÊÏËÏÈ',0,'43','6150407','','','itransporte@incarina.com','','','sugerencias','imediata',0,0,0,0,0,0,0,1,0),
 ('valencia','edgar escarra','‰ž“š‘œ–ž',0,'34','04144218522','02416179443','','gtesucvalencia@mary-iancarina.com','','','uno mas uno','dos',0,0,0,0,0,0,0,1,0),
 ('ventasianca','Leidy Andrade','ÍÍÏÇ',0,'7','','','','ventas@ianca.com.ve','','','Cual es el nombre de mi 1er hijo?','Daniel ',0,0,0,0,0,0,0,1,0),
 ('wendy','auxiliar de coordinacion agricola','ÎÍÌËÊ',0,'7','02556215255','','','productores@iancarina.com.ve','','','postre preferido','quesillo',0,0,0,0,0,0,0,1,0),
 ('yaranguren','Yrma Aranguren','”ž’–“ž‰ž“',0,'40','04169596854','','','yaranguren@mary-iancarina.com','yaranguren@gmail.com','icompras@mary-iancarina.com','Nombre de mi hijo','Ivan',0,0,0,0,0,0,0,1,0),
 ('YDeAngelis','Asistente Finanzas','ž–ž‘˜”',0,'4','02556242522','02556000400','','ydangeli@mary-iancarina.com','ydangeli@mary-iancarina.com','','Fecha Ingreso','1994',0,0,0,0,0,0,0,1,0),
 ('ylopez','Yajaira LÃ³pez','†“š…',0,'2','111','111','111','icontabcxp@mary-iancarina.com','ylopez_69@hotmail.com','','cual es la fecha de ingreso a iancarina','16/03/1992',0,0,0,0,0,0,0,1,0),
 ('Yoly Lacruz','Supervisor de Control de Calidad','œž“–›ž›',0,'16','04245725481','6212864','','supp1@iancarina.com.ve','','','Cual s el nombre de mi hija?','MarÃ­a JosÃ© Ballero',0,0,0,0,0,0,0,1,0),
 ('ysalas','Yuraima Salas','†Œž“žŒ',0,'2','','','','ysalas@iancarina.com.ve','ysalas@mary-iancarina.com','','clave igual usuario','ysalas',0,0,0,0,0,0,0,1,0),
 ('YULIS','ANALISTA DE NOMINA','µ¾©¶º­',0,'3','04145580141','02556237554','02556212522','Y_ANTONIETA@HOTMAIL.COM','YELCHEIKH@iancarina.com','','CUANTOS HERMONOS SOMOS','4',0,0,0,0,0,0,0,1,0);
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;


--
-- Definition of function `FN_Acentos`
--

DROP FUNCTION IF EXISTS `FN_Acentos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_Acentos`(tcValor VarChar(255)) RETURNS varchar(255) CHARSET latin1
BEGIN
  Declare lcValorReturn Varchar(255);
  set lcValorReturn = tcValor;
  Set lcValorReturn= REPLACE(lcValorReturn, 'á', '&aacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'Á', '&Aacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'é', '&eacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'É', '&Eacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'í', '&iacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'Í', '&Iacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'ó', '&oacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'Ó', '&Oacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'ú', '&uacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'Ú', '&Uacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'ñ', '&nacute;');
  Set lcValorReturn= REPLACE(lcValorReturn, 'Ñ', '&Nacute;');
  Return lcValorReturn;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `FN_ColorStatus`
--

DROP FUNCTION IF EXISTS `FN_ColorStatus`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_ColorStatus`(tnValor int(2)) RETURNS varchar(20) CHARSET latin1
BEGIN
  Declare tcValorReturn VarChar(20);
  Set tcValorReturn= Case When tnValor=1 Then '#FFFF99'
                          When tnValor=2 Then '#99FF66'
                          Else '#FFFFFF' End;
  Return tcValorReturn;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `FN_ConvertirFecha`
--

DROP FUNCTION IF EXISTS `FN_ConvertirFecha`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_ConvertirFecha`(tdFecha DateTime) RETURNS varchar(15) CHARSET latin1
BEGIN
  Declare lcValorReturn VarChar(15);
  Set lcValorReturn = '';
  Set lcValorReturn = Case When (Date_format(Date(tdFecha),'%d/%m/%Y')=Date_format(Date(Now()),'%d/%m/%Y')) Then 'Hoy'
                           When Year(tdFecha)=Year(now()) Then Date_format(Date(tdFecha),'%d-%b')
                           When Year(tdFecha)<>Year(now()) Then Date_format(Date(tdFecha),'%d-%b-%Y')
                           Else '' End;
  
  Set lcValorReturn=REPLACE(lcValorReturn, 'Jan', 'Ene');
  Set lcValorReturn=REPLACE(lcValorReturn, 'Apr', 'Abr');
  Set lcValorReturn=REPLACE(lcValorReturn, 'Aug', 'Ago');
  Set lcValorReturn=REPLACE(lcValorReturn, 'Dec', 'Dic');
  Return lcValorReturn;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `FN_ConvertirPrioridad`
--

DROP FUNCTION IF EXISTS `FN_ConvertirPrioridad`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_ConvertirPrioridad`(tnValor Int(2),tcSitio Varchar(200)) RETURNS varchar(200) CHARSET latin1
BEGIN
  Declare lcValorReturn VarChar(200);
  Set lcValorReturn = Case When (tnValor=1) Then ConCat('<img src="',tcSitio,'\Urgente.jpg"',' border="0" />')
                           When (tnValor=2) Then ConCat('<img src="',tcSitio,'\Normal.jpg"',' border="0" />')
                           When (tnValor=3) Then ConCat('<img src="',tcSitio,'\Bajo.jpg"',' border="0" />')
                           Else '' End;
  Return lcValorReturn;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `FN_CrearConsulta`
--

DROP FUNCTION IF EXISTS `FN_CrearConsulta`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`%` FUNCTION `FN_CrearConsulta`(tcNombd Varchar(50),tcCampos VarChar(1000),tcTablas VarChar(1000),tcAlias VarChar(1000),tcCondicion VarChar(1000),tcHaving Varchar(1000),tcGroup Varchar(1000),tcOrder Varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
  Declare lcTablas Varchar(1000);
  Declare lcAlias Varchar(1000);
  Declare lcFrom Varchar(1000);
  Declare lcWhere Varchar(1000);
  Declare lcHaving Varchar(1000);
  Declare lcGroup Varchar(1000);
  Declare lcOrder Varchar(1000);
  Declare lcConsulta Varchar(1000);

  Declare lnNumero Int(10);
  Declare lnnId Int(10);
  Declare lcTablaOrigen Varchar(100);
  Declare lcCampoOrigen Varchar(100);
  Declare lcTablaReferencia Varchar(100);
  Declare lcCampoReferencia Varchar(100);
  Declare lcAliasOrigen Varchar(100);
  Declare lcAliasReferencia Varchar(100);

  Set lcFrom ='';
  Set lcTablas = tcTablas;
  Set lcAlias = tcAlias;
  Set lnNumero =0;
  Set lcTablaOrigen ='';
  Set lcCampoOrigen ='';
  Set lcAliasOrigen ='';
  Set lcTablaReferencia ='';
  Set lcCampoReferencia='';
  Set lcAliasReferencia ='';
  Set lcHaving ='';
  Set lcGroup ='';
  Set lcOrder ='';
  Set lcWhere='';
  Set lcConsulta ='';

  
  Create Temporary Table tConsultas(nId Int(10) Primary Key not null AUTO_INCREMENT,cTabla_Origen VarChar(60),cCampo_Origen VarChar(60),cTabla_Referencia VarChar(60),cCampo_Referencia VarChar(60),cAliasOrigen VarChar(60),cAliasReferencia VarChar(60));
  Create Temporary Table tTablas (nId Int(10) Primary Key not null AUTO_INCREMENT,cTabla Varchar(60),cAlias Varchar(60));
  Create Temporary Table tTablasTmp (nId Int(10) Primary Key not null AUTO_INCREMENT,cTabla Varchar(60),cAlias Varchar(60));
  
  While (INSTR(lcTablas, ',')<>0) Do
    Insert InTo tTablas (cTabla,cAlias) Values(SUBSTRING_INDEX(lcTablas, ',', 1),SUBSTRING_INDEX(lcAlias, ',', 1));
    Set lcTablas = Substring(lcTablas,INSTR(lcTablas, ',')+1);
    Set lcAlias  = Substring(lcAlias,INSTR(lcAlias, ',')+1);
  End While;
  if (lcTablas<>'') then
    Insert InTo tTablas (cTabla,cAlias) Values(lcTablas,lcAlias);
  end if;
  Insert Into tTablasTmp(cTabla,cAlias)Select cTabla,cAlias From tTablas;
  Insert InTo tConsultas(cTabla_Origen,cCampo_Origen,cTabla_Referencia,cCampo_Referencia,cAliasOrigen,cAliasReferencia) Select KCU.Table_Name,KCU.Column_Name,KCU.Referenced_Table_Name,KCU.Referenced_Column_Name,TT.cAlias,(Select tTablasTmp.cAlias From tTablasTmp Where tTablasTmp.cTabla=Referenced_Table_Name) From information_schema.KEY_COLUMN_USAGE KCU Inner Join tTablas TT On KCU.Table_Name=TT.cTabla WHERE KCU.CONSTRAINT_SCHEMA=tcNombd  And Not IsNull(KCU.Referenced_Table_Name);

  While Exists(Select * From tTablas) Do
    Set lnNumero = (Select nId From tTablas Order By nId Asc Limit 1);
    While Exists(Select cTabla_Origen From tConsultas Where cTabla_Origen = (Select cTabla From tTablas Where nId=lnNumero)) Do
      Set lnNid=(Select Nid From tConsultas Where cTabla_Origen = (Select cTabla From tTablas Where nId=lnNumero) Order By Nid Asc Limit 1);
      Set lcTablaOrigen = (Select cTabla_Origen From tConsultas Where nId=lnNid);
      Set lcCampoOrigen = (Select cCampo_Origen From tConsultas Where nId=lnNid);
      Set lcTablaReferencia = (Select cTabla_Referencia From tConsultas Where nId=lnNid);
      Set lcCampoReferencia = (Select cCampo_Referencia From tConsultas Where nId=lnNid);
      Set lcAliasOrigen = (Select cAliasOrigen From tConsultas Where nId=lnNid);
      Set lcAliasReferencia = (Select cAliasReferencia From tConsultas Where nId=lnNid);

      If(Not IsNull(lcAliasReferencia)) Then
        If (INSTR(lcFrom, lcCampoReferencia)=0) Then
          If lcFrom <>'' Then
            Set lcFrom = Concat(lcFrom,' Inner Join ',tcNombd,'.',lcTablaReferencia,' As ',lcAliasReferencia,' On ', lcAliasOrigen,'.',lcCampoOrigen,'=',lcAliasReferencia,'.',lcCampoReferencia);
          Else
            Set lcFrom = Concat(tcNombd,'.',lcTablaOrigen,' As ',lcAliasOrigen,' Inner Join ',tcNombd,'.',lcTablaReferencia ,' As ',lcAliasReferencia,' On ' ,lcAliasOrigen,'.',lcCampoOrigen,'=',lcAliasReferencia,'.',lcCampoReferencia);
          End If;
        End If;
      End If;
      Delete From tConsultas Where nId=lnNid;
    End While;
    Delete From tTablas Where nId=lnNumero;
  End While;

  If (lcFrom='') Then
    Set lcFrom= Concat(tcNombd,'.',tcTablas,' As ',tcAlias);
  End If;

  If (tcCondicion<>'') Then
    Set lcWhere = Concat(' Where ',tcCondicion);
  End If;

  If (tcHaving<>'') Then
    Set lcHaving = Concat(' Having ',tcHaving);
  End If;

  If (tcGroup<>'') Then
    Set lcGroup = Concat(' Group By ',tcGroup);
  End If;

  If (tcOrder<>'') Then
    Set lcOrder = Concat(' Order By ',tcOrder);
  End If;

  Set lcConsulta =Concat('Select ',tcCampos,' From ',lcFrom ,lcWhere,lcGroup,lcHaving,lcOrder);

  Return lcConsulta;
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
