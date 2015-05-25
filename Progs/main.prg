&&Configuracion del Programa
PUBLIC Fun,pcSucursal,pcServidor,pcData,pcRutaSpc,pcUsuario,pcContrasena,pcRuta,pnProgram,pcBarra,oApp,pcAccesSuc,pcUsuarioSystem,pcBarraEstado,pcSucursalDes

&&Variables de acceso
PUBLIC plncerrar_periodos,plnfrmalmacenistas,plnfrmanticipo_viaje,plnfrmcargar_anticipo,plnfrmcargar_viaje,plnfrmcargar_viaje_ext,;
	plnfrmchoferes,plnfrmciudades,plnfrmestados,plnfrmgasto_servicio,plnfrmgrupos_serv,plnfrmmontacarguistas,;
	plnfrmorigendestinos,plnfrmperiodos,plnfrmrelacion,plnfrmrutas,plnfrmservicios,plnfrmsucursales,;
	plnfrmtipo_gastos,plnfrmtransp_ext,plnfrmusuarios,plnfrmvehiculos,plnfrmviajes,plnmov_fperiodo,;
	plnanular,plnrep_com,plncalc_com,plnconfig, pcOrdenCarga
LOCAL lcArchivo,lnCon,lnSize,lcTexto,lcEject,lcCmd

pcUsuarioSystem = ""
pcSucursal=""
pcSucursalDes=""

plnmov_fperiodo = .F.
plncerrar_periodos = .F.
plnfrmalmacenistas = .F.
plnfrmanticipo_viaje = .F.
plnfrmcargar_anticipo = .F.
plnfrmcargar_viaje = .F.
plnfrmcargar_viaje_ext = .F.
plnfrmchoferes = .F.
plnfrmciudades = .F.
plnfrmestados = .F.
plnfrmgasto_servicio = .F.
plnfrmgrupos_serv = .F.
plnfrmmontacarguistas = .F.
plnfrmorigendestinos = .F.
plnfrmperiodos = .F.
plnfrmrelacion = .F.
plnfrmrutas = .F.
plnfrmservicios = .F.
plnfrmsucursales = .F.
plnfrmtipo_gastos = .F.
plnfrmtransp_ext = .F.
plnfrmusuarios = .F.
plnfrmvehiculos = .F.
plnfrmviajes = .F.
plnanular = .F.
plnrep_com = .F.
plncalc_com = .F.
plnconfig = .F.

SET ANSI ON
SET CENTURY ON
SET DATE DMY
SET DELETED ON
SET ESCAPE OFF
SET EXACT ON
SET EXCLUSIVE OFF
SET HOURS TO 24
SET SAFETY OFF
SET STATUS BAR OFF
SET SYSMENU OFF
SET TALK OFF
ON SHUTDOWN Salirsp()
pnProgram=2
pcRuta = FULLPATH(CURDIR())
SET PATH TO FORMS ,Img ,MENUS ,Progs, CLASS
SET PROCEDURE TO Funciones.prg
SET CLASSLIB TO clcomisiones.vcx

_SCREEN.WINDOWSTATE = 2
_SCREEN.CLOSABLE = .F.
_SCREEN.ICON =LOCFILE("camion_16_mary.ico")

&&Validando Servidor
lcTexto = ""
IF FILE("Config.txt")
	lcEject="Import From " + CHR(34) + pcRuta + "Config.txt" + CHR(34) +" Type Xls"
	&lcEject
	GO BOTTOM
	pcServidor=DesEncriptar(ALLTRIM(a))
	pcData=DesEncriptar(ALLTRIM(d))
	pcUsuario=DesEncriptar(ALLTRIM(b))
	pcContrasena=DesEncriptar(ALLTRIM(c))
	SELECT config
	USE
ELSE
	CREATE CURSOR ttTemp (cServidor c(60),cUsuario c(30),cContrasena c(30),cDatabase c(60))
	SELECT ttTemp
	APPEND BLANK
	BROWSE
	pcServidor=cServidor
	pcData=cDatabase
	pcUsuario=cUsuario
	pcContrasena=cContrasena
	REPLACE cServidor WITH Encriptar(ALLTRIM(cServidor)),;
		cUsuario  WITH Encriptar(ALLTRIM(cUsuario)), ;
		cContrasena WITH Encriptar(ALLTRIM(cContrasena)),;
		cDatabase WITH Encriptar(ALLTRIM(cDatabase)) IN ttTemp

	lcEject="EXPORT TO " + CHR(34) + pcRuta + "Config.txt" + CHR(34) +" Type Xls"
	&lcEject
	SELECT ttTemp
	USE
ENDIF
oApp = CREATEOBJECT("Principal")
_SCREEN.CAPTION ="Sistema de Transporte" + "-" + pcServidor +"-"+ pcData
lnConexion=CrearConexion()
IF lnConexion> 0 THEN
	Desconectar(lnConexion)
	DO FORM frmacceso.scx
ELSE
	QUIT
ENDIF

READ EVENTS
