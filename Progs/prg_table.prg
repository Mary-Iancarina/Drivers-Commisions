Parameters XTABLA
*XTABLA = 'CARGA2    '
XTABLA = Alltrim(XTABLA)
XTABLA2 = XTABLA  + '_EXT'

Create Cursor &XTABLA2  (CAMPO C (12),TIPO C(10), ENT N(4),DEC N (2))

If Used(XTABLA)
	Select &XTABLA
Else
	Select 210
	Use &XTABLA
Endif



Afields(xARRAY)



For I= 1 To Fcount()


	A001 = Alltrim(xARRAY(I,1))
	A002 = Alltrim(xARRAY(I,2))
	A004 = xARRAY(I,4)

	If xARRAY(I,4) > 0
		A003 = xARRAY(I,3)- (xARRAY(I,4) + 1)
	Else
		A003 = xARRAY(I,3)
	Endif

	Select &XTABLA2
	Append Blank
	Replace CAMPO With A001
	Replace TIPO  With A002
	Replace ENT   With A003
	Replace DEC   With A004

Endfor
