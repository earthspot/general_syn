	NB. syn - start.ijs
'==================== [syn] start ===================='
0 :0
Wednesday 19 June 2019  00:40:10
)

cocurrent 'syn'

VERSION=: '?.?.?'  NB. overridden by: manifest.ijs

start=: 3 : 0
  NB. y is optionally the test tape: s
load PARENTDIR,'/manifest.ijs'  NB. overrides VERSION
window_close''
wd SYNFORM
wd 'set echobuf font "Menlo" 14'
wd 'set edisbuf font "Menlo" 14'
wd 'set pane font "Menlo" 14'
wd 'set workbuf font "Menlo" 14'
wd 'set echobuf text *',echobuf=: ,y
refresh''
wd 'psel syn; pmove ' , ":POS
)

syn_z_=: start_syn_

NB. syn_z_=: load bind '~proj/syn.ijs'

immexj 0 : 0  NB. execute in immediate mode after load...
cocurrent'syn'
smclear''
lp'syn0'
smoutput PROMPT
start s
)

NB. withdrawn
NB. i.0 0
NB. lp'syn5'
NB. smoutput PROMPT
NB. display sj
NB. scan 'firstwd secondwd + everything else NB. and a comment 2nd row'
NB. scan s
