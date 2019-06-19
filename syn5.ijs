NB. syn5.ijs - smcut3 from handy4uu
0 : 0
Tuesday 11 June 2019  12:45:31
-
inefficient (and should end at LF)
)
cocurrent 'syn'

NAME=: 'smcut3 from handy4uu'

STATE=: b4f }: 0 :0
lead-in
scan wd0
1st sepr
scan wd1
2nd sepr
residue
)

sj=: 6 3 2$0 0 0 0 1 1 2 3 2 3 1 0 2 0 2 0 3 1 4 3 4 3 3 0 4 0 4 0 5 1 0 3 5 0 5 0

SYMBOL=: Cut '|LF|SP|XX'

mj=: < LF ; NUL,SP,TAB

  NB. TEST TAPE (s)
s=: 'firstwd secondwd + everything else NB. and a comment'
s=: 'firstwd secondwd + everything else NB.comment',LF,'2nd row etcetera'
s=: 'wd1 wd2 residue'

onload 'identify s'