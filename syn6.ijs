NB. syn6.ijs - example from NuVoc semico
0 : 0
Monday 16 September 2019  17:27:07
-
needs ijrc defining, as: 0 _1 0 0
(default is: 0 _1 0 _1)
 example gives 0 for c
)
cocurrent 'syn'

NAME=: 'example from NuVoc semico: C hex'

STATE=: b4f }: 0 :0
wait for 0
expect x
expect 1st digit
expect nondigit/end
)

NB.   ZERO  X   HEX  OTHER
t=.,: 1j1  0j0  0j0  0j0  NB. waiting for 0
t=.t, 0j0  2j0  0j0  0j0  NB. expecting x
t=.t, 3j0  0j0  3j0  0j0  NB. expecting 1st digit
t=.t, 3j3  0j3  3j0  0j3  NB. expect nondigit/end
sj=: +. t

SYMBOL=: Cut '|ZERO|X|HEX|OTHER'

mj=: < '0' ; 'x' ; '123456789abcdefABCDEF'

ijrc=: 0 _1 0 0  NB. specs (0) as final action code

  NB. TEST TAPE (s)
s=: '0x91'
s1=: 'qqq0x30x30x40x0xxxx'
s2=: 'qqq0x30x30x40x0x34a'

onload 'identify s'