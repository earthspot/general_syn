NB. syn2.ijs - [uu] smtime
0 :0
Monday 10 June 2019  02:07:39
-
Returns boxed[2] hh;mm or boxed[3] hh;mm;ss
)
cocurrent 'syn'

NAME=: 'smtime - hh:mm:ss'

NB.    0   1   2   3   4   5   6   y-class
NB.    LF  SP  CO  DT  D5  D9  XX  class-name
t=. ,: 0   0   0j6 0j6 1j1 1j1 0j6	NB. STATE 0 pass over leading w/s
t=. t, 0j6 0j6 0j6 0j6 2   2   0j6	NB. STATE 1 expect 2nd digit of hour;
t=. t, 0j6 0j6 3j3 0j6 0j6 0j6 0j6	NB. STATE 2 expect colon; emit
t=. t, 0j6 0j6 0j6 0j6 4j1 4j1 0j6	NB. STATE 3 expect 1st digit of min
t=. t, 0j6 0j6 0j6 0j6 5   5   0j6	NB. STATE 4 expect 2nd digit of min
t=. t, 0j6 0j6 6j3 0j6 0j6 0j6 0j6	NB. STATE 5 expect colon; emit
t=. t, 0j6 0j6 0j6 0j6 7j1 7j1 0j6	NB. STATE 6 expect 1st digit of sec
t=. t, 0j6 0j6 0j6 0j6 8   8   0j6	NB. STATE 7 expect 2nd digit of sec
t=. t, 0j3 0j3 0j6 9   0j6 0j6 0j6	NB. STATE 8 expect end or DT
t=. t, 0j6 0j6 0j6 0j6 10  10  0j6	NB. STATE 9 expect a decimal digit
t=. t, 0j3 0j3 0j6 0j6 10  10  0j6	NB. STATE 10 expect more decimal digits
sj=: +. t

STATE=: b4f }: 0 :0
pass over leading w/s
2nd digit of hour
colon; emit
1st digit of min
2nd digit of min
colon; emit
1st digit of sec
2nd digit of sec
end or DT
a decimal digit
more decimal digits
)

NB.class 0    1              2    3     4          5      6
mj=:   < LF ; (NUL,SP,TAB) ; CO ; DT ; '012345' ; '6789'  NB.all else

SYMBOL=: Cut '|LF|SP|CO|DT|D5|D9|XX'

  NB. TEST TAPES (s s1 s2…)
s=: '23:58:59'

onload 'identify s'
