NB. syn3.ijs - [uu] smddmmyy
0 :0
Tuesday 11 June 2019  12:15:51
)
cocurrent 'syn'

NAME=: 'smddmmyy -from UU'

STATE=: b4f }: 0 :0
pass over leading w/s
2nd digit of dd
slash; emit
1st digit of mm
2nd digit of mm
slash; emit
1st digit of yy
2nd digit of yy
LF or SP
)

NB.    0   1   2   3   4   5   6   y-class
NB.    LF  SP  SL  D1  D3  D9  XX  class-name
t=. ,: 0   0   0j6 1j1 1j1 0j6 0j6	NB. STATE 0 pass over leading w/s
t=. t, 0j6 0j6 0j6 2   2   2   0j6	NB. STATE 1 expect 2nd digit of dd;
t=. t, 0j6 0j6 3j3 0j6 0j6 0j6 0j6	NB. STATE 2 expect slash; emit
t=. t, 0j6 0j6 0j6 4j1 0j6 0j6 0j6	NB. STATE 3 expect 1st digit of mm
t=. t, 0j6 0j6 0j6 5   5   5   0j6	NB. STATE 4 expect 2nd digit of mm
t=. t, 0j6 0j6 6j3 0j6 0j6 0j6 0j6	NB. STATE 5 expect slash; emit
t=. t, 0j6 0j6 0j6 7j1 0j6 0j6 0j6	NB. STATE 6 expect 1st digit of yy
t=. t, 0j6 0j6 0j6 8   8   8   0j6	NB. STATE 7 expect 2nd digit of yy
t=. t, 0j3 0j3 0j6 0j6 0j6 0j6 0j6	NB. STATE 8 expect LF or SP
sj=: +. t

SYMBOL=: Cut '|LF|SP|SL|D1|D3|D9|XX'
mj=:   < LF ; (NUL,SP,TAB) ; SL ; '01' ; '23' ; '456789'  NB.all else

  NB. TEST TAPE (s)
s=: '31/12/18'

onload 'identify s'