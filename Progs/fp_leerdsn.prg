Parameters XFILE

XFILE = 'DSN.TXT'
Local gnFileHandle,XRUTA
gnFileHandle = Fopen(XFILE)
XL = Fseek(gnFileHandle,0,2)

=Fseek(gnFileHandle,0,0)

XRUTA =  Fread(gnFileHandle,XL)
XLINEA1 =''
XLINEA2 =''

FOR I= 1 TO XL
	X001 = SUBSTR(XRUTA,I,1)
	IF ASC(X001) = 13 OR ASC(X001) = 10
	ELSE
	
		IF BETWEEN(I,1,100)
			XLINEA1 = XLINEA1 + X001
		ENDIF

		IF BETWEEN(I,101,300)
			XLINEA2 = XLINEA2 + X001
		ENDIF

	ENDIF
ENDFOR

XRUTA= XLINEA1 + XLINEA2
Fclose(gnFileHandle)
Return Alltrim(XRUTA)
