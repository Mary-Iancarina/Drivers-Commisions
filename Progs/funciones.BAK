FUNCTION CrearConexion()
LOCAL lnConex
lnConex=SQLSTRINGCONNECT("DRIVER={MySQL ODBC 3.51 Driver}; SERVER=" + ALLTRIM(pcServidor)+ "; option =3;DATABASE=" + ALLTRIM(pcData) + ";UID=" + ALLTRIM(pcUsuario) + ";PWD=" + ALLTRIM(pcContrasena) + "")
IF lnConex < 0
	MESSAGEBOX("No se pudo establecer la conexión con el servidor de datos",0+16,"Error")
ENDIF
RETURN lnConex
ENDFUNC


FUNCTION Desconectar(tnConexion)
LOCAL lnConex
lnConex=SQLDISCONNECT(tnConexion)
IF lnConex <> 1
	MESSAGEBOX("No se pudo desconectar",0+48,"Atención")
ENDIF
ENDFUNC


FUNCTION CrearConexionSystem()
LOCAL lnConex
lnConex=SQLSTRINGCONNECT("DRIVER={MySQL ODBC 3.51 Driver}; SERVER=" + ALLTRIM(pcServidor)+ "; DATABASE=information_schema;UID=" + ALLTRIM(pcUsuario) + "; PWD=" + ALLTRIM(pcContrasena) + "")
IF lnConex < 0
	MESSAGEBOX("No se pudo establecer la conexión con el servidor de datos",0+16,"Error")
ENDIF
RETURN lnConex
ENDFUNC


FUNCTION CrearConexionOtraData(tcConexion)
LOCAL lnConex
lnConex=SQLSTRINGCONNECT(tcConexion)
IF lnConex < 0
	MESSAGEBOX("No se pudo establecer la conexión con el servidor de datos",0+16,"Error")
ENDIF
RETURN lnConex
ENDFUNC


FUNCTION Salir()
IF MESSAGEBOX("¿Desea Salir?",4+32,"Información")=6
*!*			RELEASE ALL
*!*			CLEAR EVENTS
*!*			CLOSE DATABASES all
	QUIT
ELSE
	RETURN
ENDIF
ENDFUNC

FUNCTION Salirsp()
QUIT
ENDFUNC


FUNCTION Encriptar(tcValor)
LOCAL lcValor, lnPos, lnTam
lnTam = LEN(tcValor)
lcValor = ""
FOR lnPos = 1 TO lnTam STEP 1
	lcValor = lcValor + CHR(255 - ASC(SUBSTR(tcValor, lnPos, 1)))
NEXT
RETURN lcValor
ENDFUNC


FUNCTION DesEncriptar(tcValor)
LOCAL lcValor, lnPos, lnTam
lnTam = LEN(tcValor)
lcValor = ""
FOR lnPos = 1 TO lnTam STEP 1
	lcValor = lcValor + CHR(255 - ASC(SUBSTR(tcValor, lnPos, 1)))
NEXT
RETURN lcValor
ENDFUNC


PROCEDURE Activar_BarraExploracion()
_SCREEN.ACTIVEFORM.BarraExp.cmdPrimero.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdAnterior.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdSiguiente.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdUltimo.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdNuevo.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdModificar.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdEliminar.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdGuardar.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdCancelar.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdImprimir.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdBuscar.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdCerrar.ENABLED = .T.
ENDPROC


PROCEDURE DesActivar_BarraExploracion()
_SCREEN.ACTIVEFORM.BarraExp.cmdPrimero.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdAnterior.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdSiguiente.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdUltimo.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdNuevo.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdModificar.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdEliminar.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdGuardar.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdCancelar.ENABLED = .T.
_SCREEN.ACTIVEFORM.BarraExp.cmdImprimir.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdBuscar.ENABLED = .F.
_SCREEN.ACTIVEFORM.BarraExp.cmdCerrar.ENABLED = .F.
ENDPROC


PROCEDURE AccesoBarra()
pcBarra.cmdChoferes.ENABLED = plnfrmchoferes
pcBarra.cmdVehiculos.ENABLED=plnfrmvehiculos
pcBarra.cmdAnticipos.ENABLED = plnfrmanticipo_viaje
pcBarra.cmdRelacion.ENABLED=plnfrmrelacion
pcBarra.cmdViajes_Ext.ENABLED=plnfrmviajes
pcBarra.cmdGastos_Serv.ENABLED=plnfrmgasto_servicio
ENDPROC


FUNCTION ConvertirApostrofe(tcValor)
lcValor = ""
lcValor = STRTRAN(tcValor,"'",CHR(34))
RETURN lcValor
ENDFUNC

PROCEDURE  ErrProc()
ENDPROC


FUNCTION SalirConf()
IF MESSAGEBOX("¿Desea cancelar el proceso?",4+32,"Información")=6
*!*			RELEASE ALL
*!*			CLEAR EVENTS
*!*			CLOSE DATABASES all
	QUIT
ELSE
	RETURN
ENDIF
ENDFUNC


FUNCTION Codigo_Estado(tcCiudad)
IF !EMPTY(tcCiudad)
	RETURN SUBSTR(tcCiudad,1,2)
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Estado(tcCid_Estado)
LOCAL nConect,lcCmd
nConect = 0
IF !EMPTY(tcCid_Estado)
	lcCmd = "Select cDescripcion From tEstado where cid_Estado = '" + tcCid_Estado + "'"
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tEstadoFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tEstadoFunciones.cDescripcion
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Ciudad(tcCid_Ciudad)
LOCAL nConect,lcCmd
nConect = 0
IF !EMPTY(tcCid_Ciudad)
	lcCmd = "Select cDescripcion From tCiudad where cid_Ciudad = '" + tcCid_Ciudad + "'"
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tCiudadFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tCiudadFunciones.cDescripcion
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Sucursal(tnNid_Sucursal)
LOCAL nConect,lcCmd
nConect = 0
*!*	MESSAGEBOX(TYPE("tnNid_Sucursal"))
IF !EMPTY(tnNid_Sucursal)
	lcCmd = "Select cDescripcion From tSucursal where nid_Sucursal = " + tnNid_Sucursal
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tSucursalFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tSucursalFunciones.cDescripcion
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Destino(tcCid_Destino)
LOCAL nConect,lcCmd
nConect = 0
IF !EMPTY(tcCid_Destino)
	lcCmd = "Select cdescripcion From tdestino where cid_destino = '" + tcCid_Destino + "'"
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tDestinoFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tDestinoFunciones.cDescripcion
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Chofer(tcCid_Chofer)
LOCAL nConect,lcCmd
nConect = 0
IF !EMPTY(tcCid_Chofer)
	lcCmd = "Select cNombre From tChofer where Cid_Chofer = '" + tcCid_Chofer + "'"
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tChoferFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tChoferFunciones.cNombre
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Vehiculo(tcCid_Vehiculo)
LOCAL nConect,lcCmd
nConect = 0
IF !EMPTY(tcCid_Vehiculo)
	lcCmd = "Select cdescripcion From tvehiculo where Cid_vehiculo = '" + tcCid_Vehiculo + "'"
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tVehiculoFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tVehiculoFunciones.cDescripcion
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Grupo(tcCid_Grupo)
LOCAL nConect,lcCmd
nConect = 0
IF !EMPTY(tcCid_Grupo)
	lcCmd = "Select cdescripcion From tgrupo_servicio where cid_grupo = '" + tcCid_Grupo + "'"
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tGrupo_ServicioFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tGrupo_ServicioFunciones.cDescripcion
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION Nombre_Servicio(tcCid_Servicio)
LOCAL nConect,lcCmd
nConect = 0
IF !EMPTY(tcCid_Servicio)
	lcCmd = "Select cdescripcion From tservicio where cid_servicio = '" + tcCid_Servicio + "'"
	nConect = CrearConexion()
	IF nConect > 0 THEN
		SQLEXEC(nConect,lcCmd,"tServicioFunciones")
		Desconectar(nConect)
		nConect = 0
		RETURN tServicioFunciones.cDescripcion
	ENDIF
ELSE
	RETURN ""
ENDIF
ENDFUNC


FUNCTION ValCod(tcTabla,tcCampo,tcValor)
LOCAL lcCmd,lnConect
lnConect = CrearConexion()
IF lnConect > 0 THEN
*!*		lcCmd = "select * from "+tcTabla+" where "+tcCampo+" = '" + tcValor + "'"
	lcCmd = "select * from "+tcTabla+" where "+tcCampo+" = " + IIF(VARTYPE(tcValor)="N",tcValor,"'" + ALLTRIM(tcValor) + "'")
	SQLEXEC(lnConect,lcCmd,tcTabla+"ValCod")
	Desconectar(lnConect)
	lnConect = 0
	SELECT (tcTabla+"ValCod")
	IF RECCOUNT()<=0
*!*			MESSAGEBOX("El código introducido NO existe",32,"Información")
		RETURN .F.
	ELSE
		RETURN .T.
	ENDIF
ENDIF
