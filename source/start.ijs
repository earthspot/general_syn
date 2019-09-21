	NB. syn - start.ijs
'==================== [syn] start ===================='
0 :0
Saturday 22 June 2019  18:36:26
)

coclass 'syn'

VERSION=: '?.?.?'  NB. overridden by: manifest.ijs

syn_z_=: start_syn_

start=: 3 : 0
  NB. y ignored
  NB. IN TIME: will need to locate+load HANDY verbs
load PARENTDIR,'/manifest.ijs'  NB. overrides VERSION
window_close''
wd SYNFORM
NB. wd 'set echobuf font "Menlo" 14'
NB. wd 'set edisbuf font "Menlo" 14'
NB. wd 'set pane font "Menlo" 14'
NB. wd 'set workbuf font "Menlo" 14'
wd 'set echobuf text *',echobuf=: ,t
refresh''
wd 'psel syn; pmove ' , ":POS
onload_z_=: do  NB. restore for ad-hoc edits of source files
i.0 0
)

immexj }: 0 : 0
cocurrent 'syn'
start''
)
