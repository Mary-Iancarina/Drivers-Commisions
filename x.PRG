PUBLIC lRecord,lArrCond,lcEject,larrRecord,lcValor,lcValor1,I

xncamposprincipal = 1
xCamposselect  = 'distinct tgs.*'
Xtablaprincnomb  = 'tgasto_serv as tgs'
xCondicion  = ''
xOrden = ' 1 '
Xtablaprincipal = 'tgasto_servFrmGastos'

DIMENSION lArrCond(xncamposprincipal)
DIMENSION larrRecord(xncamposprincipal)


LOCAL lcCmd
xConexion = CrearConexion()
*?xConexion 
IF xConexion > 0 THEN
	lcCmd= "Select " + xCamposselect + " From " + Xtablaprincnomb + IIF(!EMPTY(xCondicion), " Where " + xCondicion ,"") + " Order By " + xOrden
	WAIT WINDOW lcCmd
	SQLEXEC(xConexion ,lcCmd,ALLTRIM(Xtablaprincipal))

	Desconectar(xConexion )
	xConexion=0
ENDIF

xoperacion =0
