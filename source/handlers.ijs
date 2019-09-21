	NB. syn - handlers.ijs
'==================== [syn] handlers ===================='
0 :0
Tuesday 18 June 2019  22:47:28
)

coclass 'syn'

syn_bngen_button=: gen  NB. generate source for: synt

syn_bnundo_button=: undo

syn_bn1_button=:	3 : 'textview_jqtide_ PROMPT'

syn_bnHelp_button=: 3 : 'textview_jqtide_ SYNHELP'  NB. show a help panel

syn_bns_button=: 3 : 0
  NB. work on string: t
wd 'set echobuf text *',echobuf=: t
syn_echobuf_changed''
)

syn_bns1_button=: 3 : 0
  NB. work on string: t1 (-->t)
wd 'set echobuf text *',echobuf=: t1
syn_echobuf_changed''
)

syn_bns2_button=: 3 : 0
  NB. work on string: t2 (-->t)
wd 'set echobuf text *',echobuf=: t2
syn_echobuf_changed''
)

syn_bns3_button=: 3 : 0
  NB. work on string: t3 (-->t)
wd 'set echobuf text *',echobuf=: t3
syn_echobuf_changed''
)

syn_edisbuf_changed=: empty

syn_echobuf_changed=: 3 : 0
  NB. refresh display each time a char is added to: echobuf
  work echobuf
  traj=: scan echobuf
  'step symb mapc state stoc'=: {:"1 traj
  wd 'psel syn; set ed0 text *',":step
  wd 'psel syn; set ed1 text *',":symb
  wd 'psel syn; set ed2 text *',":mapc pick SYMBOL
  wd 'psel syn; set ed3 text *',":state
  wd 'psel syn; set ed4 text *',":stoc
  wd 'psel syn; set pane select ',":>:state
)

syn_close=: window_close

syn_default=: 3 : 0
  NB. warns of a missing handler
NB. smoutput llog 'syn_default sysevent syschild pane_select'
smoutput sysevent,'=: empty'
)

syn_resize=: empty

syn_bnTrace_button=: trace

0 :0
syn_bnTrace_button=: 3 : 0
if. 'empty'-: 5!:5<'sllog' do.
  sllog=: smoutput&llog
  msg=: smoutput&sw
  putsb 'trace ON'
else.
  sllog=: empty
  msg=: empty
  putsb 'trace OFF'
end.
i.0 0
)

syn_echobuf_char=: empty

syn_edisbuf_char=: 3 : 0
ssw '...syn_edisbuf_char: sysdata=[(sysdata)]'
DIRTY=: 1
)

syn_edisbuf_button=: 3 : 'doedis edisbuf'
  NB. …edit sjj with what is in the edit-sjj-buffer

syn_pane_select=: 3 : 0
  NB. setup phrase to be executed in: edisbuf
if. shf= {. ". sysmodifiers do. refresh'' end.
sllog 'syn_pane_select sysmodifiers pane_select'
lino=. ".pane_select
stateno=. <:lino
wd 'psel syn; set edisbuf text *',pane
putsb 'state: ',":stateno
)

syn_bnnewST_button=: 3 : 0
  NB. append new dumb state to sjj
t=. #sjj
sllog 'syn_bnnewST_button t'
snap''
STATE=: STATE,< 'STATE',":t
sj=: convert sjj=: sjj , ({:$sjj)$t
refresh''
)

sjj1=: 3 : 0
  NB. incr/decr for sjj from state (y) downwards
'h w'=. d=. $sjj
(y <: d$w#i.h) * (y<: 9&o. sjj)
)

syn_bndelST_button=: 3 : 0
  NB. delete selected state from sjj
t=. (i.#sjj)-. L=. <:".pane_select
sllog 'syn_bndelST_button t'
snap''
STATE=: t{STATE
sj=: convert sjj=: (sjj1 L) -~ sjj=: t{sjj
refresh''
)
