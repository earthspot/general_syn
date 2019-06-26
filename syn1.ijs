NB. syn1.ijs - the syn used as a sample in ~proj/smtemplate.ijs
0 :0
Tuesday 11 June 2019  16:05:53
-
Returns boxed[2]
  ++ the first word, terminated by whitespace
  ++ subsequent text
)
cocurrent 'syn'

NAME=: 'First word'

STATE=: Cut '|leadingSP|firstWd|nextSP|residue'

NB.    LF  SP  X
t=.,: 0j0 0j0 1j1	NB. STATE 0 pass over leading whitespace
t=.t, 2j3 2j3 1j0	NB. STATE 1 accumulate first word
t=.t, 2j0 2j0 3j1	NB. STATE 2 pass over separating whitespace
t=.t, 0j3 3j0 3j0	NB. STATE 3 accumulate subsequent text (to LF)
sj=: +. t

SYMBOL=: Cut '|LF|SP|*'

mj=: < LF ; NUL,SP,TAB

  NB. TEST TAPES (s)
s=: 'firstwd',SP,'the rest is description'
s1=: 'firstwd',TAB,'the rest is description'
s2=: SP,SP,'firstwd',SP,SP,'the rest is description',SP,SP,SP

onload 'identify s'
