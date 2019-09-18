	NB. syn - start.ijs
'==================== [syn] start ===================='
0 :0
Saturday 22 June 2019  18:36:26
)

cocurrent 'syn'

VERSION=: '?.?.?'  NB. overridden by: manifest.ijs

start=: 3 : 0
  NB. y is optionally the test tape: s
load PARENTDIR,'/manifest.ijs'  NB. overrides VERSION
window_close''
wd SYNFORM
NB. wd 'set echobuf font "Menlo" 14'
NB. wd 'set edisbuf font "Menlo" 14'
NB. wd 'set pane font "Menlo" 14'
NB. wd 'set workbuf font "Menlo" 14'
wd 'set echobuf text *',echobuf=: ,y
refresh''
wd 'psel syn; pmove ' , ":POS
onload_z_=: do  NB. restore for ad-hoc edits of source files
i.0 0
)

syn_z_=: start_syn_

immexj 0 : 0  NB. execute in immediate mode after load...
cocurrent'syn'
smclear''
synload 'syn0'
smoutput PROMPT
)
