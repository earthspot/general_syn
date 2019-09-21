	NB. syn - sample.ijs
'==================== [syn] sample ===================='
0 :0
Saturday 21 September 2019  09:07:55
-
BUILT-IN SAMPLE
currently: taken from tempsyn 10
-
syn0.ijs - the J parser: default x-arg of monad: Words (;:)
from: https://www.jsoftware.com/help/dictionary/d332.htm
)

coclass 'syn'

NAME=: 'Factory default for Words(;:)'

SYMBOL=: (<;._1) '|*|SP|Az|N|B|9|(.)|(:)|('')'
mj=: 256$0                     NB. X other
mj=: 1 (9,a.i.' ')}mj          NB. S space and tab
mj=: 2 ((a.i.'Aa')+/i.26)}mj   NB. A A-Z a-z excluding N B
mj=: 3 (a.i.'N')}mj            NB. N the letter N
mj=: 4 (a.i.'B')}mj            NB. B the letter B
mj=: 5 (a.i.'0123456789_')}mj  NB. 9 digits and _
mj=: 6 (a.i.'.')}mj            NB. D .
mj=: 7 (a.i.':')}mj            NB. C :
mj=: 8 (a.i.'''')}mj           NB. Q quote

NB. STATE=: Cut '|space|other|alphanum|N|NB|NB:|num|QT|DQ|ignore'
STATE=: (<;._1) '|whspace|punct`n|name|''N''|''NB''|''NB.''|number|openQT|closeQT|comment'

sj=: _2]\"1 }.".;._2 (0 : 0) 
' X    S    A    N    B    9    D    C    Q ']0
 1 1  0 0  2 1  3 1  2 1  6 1  1 1  1 1  7 1  NB. 0 space
 1 2  0 3  2 2  3 2  2 2  6 2  1 0  1 0  7 2  NB. 1 other
 1 2  0 3  2 0  2 0  2 0  2 0  1 0  1 0  7 2  NB. 2 alp/num
 1 2  0 3  2 0  2 0  4 0  2 0  1 0  1 0  7 2  NB. 3 N
 1 2  0 3  2 0  2 0  2 0  2 0  5 0  1 0  7 2  NB. 4 NB
 9 0  9 0  9 0  9 0  9 0  9 0  1 0  1 0  9 0  NB. 5 NB.
 1 4  0 5  6 0  6 0  6 0  6 0  6 0  1 0  7 4  NB. 6 num
 7 0  7 0  7 0  7 0  7 0  7 0  7 0  7 0  8 0  NB. 7 '
 1 2  0 3  2 2  3 2  2 2  6 2  1 2  1 2  7 0  NB. 8 ''
 9 0  9 0  9 0  9 0  9 0  9 0  9 0  9 0  9 0  NB. 9 comment
)

  NB. TEST TAPE (t)
t1=: 'sum=. (i.3 4)+/ .*0j4+pru 4'
t2=: 'sum=. (i.3 4)+/.*0j4+pru 4'
t3=: 'sum=. (i.3 4)'
t=: t3



