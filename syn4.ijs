NB. syn4.ijs - [uu] cutuuc
0 :0
Monday 10 June 2019  02:52:49
-
Returns boxed[3]: (value ; units ; nominal_units)
)
cocurrent 'syn'

NAME=: 'Line of UUC table'

SYMBOL=: Cut '|XX|SP|A%|LB|RB'

mj=: 0 $~ 256                     		NB. XX
mj=: 1 ch}mj [ ch=. a.i. SP,TAB		NB. SP
mj=: 2 ch}mj [ ch=. a.i. az,AZ,n9,'._-/^*%'	NB. A%
mj=: 3 ch}mj [ ch=. a.i. '['			NB. LB
mj=: 4 ch}mj [ ch=. a.i. ']'			NB. RB


STATE=: b4f }: 0 define
whspace
value
units
simple units
]-state
[-state
)

sj=: +. ".&> }. cutLF (0 define)
  X    S    A    [    ]   NB. "input class"
 1j1  0j0  1j1  1j1  1j1  NB. 0 space (starts in this state)
 1j0  2j2  1j0  3j0  1j0  NB. 1 value		3jx, x e. i.4
 2j2  2j0  2j0  5j2  2j0  NB. 2 units
 3j0  3j0  3j0  3j2  4j2  NB. 3 simple units	5jx, only x=2 works
 4j6  4j6  4j6  4j6  4j6  NB. 4 ]-state stops, doesn't return descr
 3j1  3j1  3j1  3j1  3j1  NB. 5 [-state, eats [ -->3
)

  NB. TEST TAPES (s s1 s2…)
s=:  '1e_10 m	[Ang]	Angstrom-unit'
s1=: '1 kg m/s/s [N]	Force; Newton'
s2=: '6.67428e_11 N m^2/kg^2	[G]	gravitational constant'

onload 'identify s'
