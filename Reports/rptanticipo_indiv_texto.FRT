   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Epson LX-300+
OUTPUT=LPT1:
ORIENTATION=0
PAPERSIZE=1
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=120
COLOR=2
YRESOLUTION=72
TTOPTION=3
COLLATE=0
            W  !   winspool  Epson LX-300+  LPT1:                             .4                           �Epson LX-300+  ESC/P             � $C�  �
od   x   H    Letter                                                        ����                DINU" � $  �Z�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        �   SMTJ     � E p s o n   L X - 3 0 0 +   InputBin FORMSOURCE RESDLL UniresDLL Orientation PORTRAIT Resolution Option2 PaperSize LETTER PrintQuality Option1 ColorMode Mono Halftone HT_PATSIZE_AUTO                                                              Courier New                    ttVistaReporte.nid_anticipo                                     "Sistema de Transporte"        Arial                          DATE()                         Arial                          
"Impreso:"                     Arial                          "Fecha:"                       Arial                          ttVistaReporte.dfecha          Arial                          Halltrim(ttVistaReporte.cid_chofer)+",  "+alltrim(ttVistaReporte.cnombre)                                                        Arial                          "Sucursal:"                    Arial                          Ualltrim(str(ttVistaReporte.nid_sucursal))+", "+alltrim(ttVistaReporte.cdescripcion_s)            Arial                          ttVistaReporte.nmonto          "999,999.99"                   Arial                          _pageno                        Arial                          	"Pagina:"                      Arial                          	"Numero:"                      Arial                          ttVistaReporte.nid_anticipo                                     "999999999"                    Arial                          ttVistaReporte.nid_viaje       Arial                          "Monto Anticipo:"              Arial                          	"Chofer:"                      Arial                          "Total Viajes:"                Arial                          ttVistaReporte.cid_chofer      "99"                           Arial                          "Viajes a Realizar:"           Arial                          "Numero"                       Arial                          "Origen"                       Arial                          	"Destino"                      Arial                          P"Tipo: INT (Despacho interno de la empresa), EXT (Despacho fuera de la empresa)"                 Arial                          Halltrim(ttVistaReporte.cid_chofer)+",  "+alltrim(ttVistaReporte.cnombre)                         Arial                          "Recibi Conforme:"             Arial                          6'Observaciones: '+alltrim(ttVistaReporte.cobservacion)          Arial                          #!empty(ttVistaReporte.cobservacion)                             [alltrim(str(ttVistaReporte.nid_sucursal_ch))+",  "+alltrim(ttVistaReporte.cdescripcion_sch)      Arial                          "Sucursal:"                    Arial                          ""IANCARINA C.A. Rif. J-08503328-9"                              Arial                          Talltrim(str(ttVistaReporte.nid_origen))+",  "+alltrim(ttVistaReporte.cdescripcion_o)             Arial                          Ualltrim(str(ttVistaReporte.nid_destino))+",  "+alltrim(ttVistaReporte.cdescripcion_d)            Arial                          Chr(27) + CHR(15)              Courier New                    Chr(18)                        Courier New                    replicate('=',160)             Courier New                    replicate('-',160)             Courier New                    replicate('-',50)              Courier New                    ttVistaReporte.cid_vehiculo                                     Arial                          "Placa"                        Arial                          ICHR(27)+CHR(87)+CHR(49) + 'ANTICIPO DE VIAJE' +   CHR(27)+CHR(87)+CHR(48)                        Courier New                    Chr(27) + CHR(15)              Courier New                    replicate('-',160)             Courier New                    -IIF(ttVistaReporte.ntipo_viaje=1,"INT","EXT")                   Arial                          "Tipo"                         Arial                          "Orden de Carga / Fact."       Arial                          ttVistaReporte.corden_carga                                     Arial                          Courier New                    Arial                          Arial                          dataenvironment                _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                                   �PROCEDURE AfterCloseTables
set century ON
_ASCIICOLS = 80
_ASCIIROWS = 66
ENDPROC
PROCEDURE BeforeOpenTables
set talk off
set century off
SET EXACT ON


_ASCIICOLS = 130
_ASCIIROWS = 33
ENDPROC
                    >���    %  %                        A   %   �       �      �           �  U  !  G � T�>��P�� T�?��B�� U  -  G2� G� G � T�>����� T�?��!�� U   AfterCloseTables,     �� BeforeOpenTablesQ     ��1 a � � 2 a a a � � 1                       L         s   �       )   %                   �-