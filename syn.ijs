0 :0
Tuesday 18 June 2019  21:25:07
-
SYN: sequential/syntax machine editor
)

require 'format/zulu'

clear 'syn'
coclass 'syn'
onload_z_=: empty

PARENTDIR=: (zx i:'/'){.zx=.jpathsep>(4!:4<'zx'){4!:3''[zx=.'syn builtfile'

AABUILT=: '2019-06-19  01:03:24'
AABUILT=: '2019-06-19  04:44:18'
AABUILT=: '2019-06-19  04:44:43'
AABUILT=: '2019-06-19  04:47:06'
AABUILT=: '2019-06-19  04:48:40'
AABUILT=: '2019-06-19  04:55:15'

'==================== [syn] forms ===================='
0 :0
Tuesday 18 June 2019  22:21:04
-
  wd'psel syn; qform'
  sminfo_z_=: wdinfo_z_=: echo_z_
 ]POS=: wd 'psel syn; getp xywh'
-
>>> cc sbar static MUST be followed by cn "…"; else no-workee
)

cocurrent 'syn'

POS=: 810 23 574 490

op=: 3 : 0
open sw'~Gitsyn/(y).ijs'
)

lp=: 3 : 0
load sw'~Gitsyn/(y).ijs'
)

PROMPT=: 0 : 0
  sjjb sjj
  sjc sj
  sjj
  display sj

LOAD A SYN TO WORK ON…
  lp'syn0'
  lp'syn1'
  lp'syn2'
  op'syn3'
  lp'syn4'
  lp'syn5'
  lp'syn9'
)

SYNHELP=: 0 : 0
`(=Click): overtype echobuf then Enter
⇧`: refresh the display
``: doedis phrase
    i.e. open phrase if starts: '~'
⇧``: load/do the phrase
⌘``: do phrase, smoutput result
⌥``: textview *phrase

OUTPUT CODES
space	no output
[ 	mark start of wd
: 	emit wd, mark start of next
] 	emit wd, park j
+ 	emit +wd, mark start of next
# 	emit +wd, park j
! 	halt the machine
)

SYNFORM=: 0 : 0
pc syn;pn SYN;
cc pane listbox;
bin h;
 cc lb0 static; cn "#:";
 cc ed0 edit;
 cc lb3 static; cn "STATE:";
 cc ed3 edit;
 cc lb4 static; cn "stoc:";
 cc ed4 edit;
 cc lb1 static; cn "char:";
 cc ed1 edit;
 cc lb2 static; cn "SYMBOL:";
 cc ed2 edit;
bin z;
cc edisbuf edit;
bin h;
 cc lb5 static; cn "IN:";
 cc echobuf edit;
bin z;
bin h;
 cc lb6 static; cn "EX:";
 cc workbuf edit readonly;
bin z;
bin h;
 cc bnundo button;cn "undo";
 cc bnnewST button;cn "new STATE";
 cc bndelST button;cn "del STATE";
 cc bns button;cn "=s";
 cc bns1 button;cn "=s1";
 cc bns2 button;cn "=s2";
 cc bns3 button;cn "=s3";
bin z;
bin h;
 cc bnTrace button;cn "trace";
 cc bn1 button;cn "bn1";
 cc bn2 button;cn "bn2";
 cc bn3 button;cn "bn3";
 cc bn4 button;cn "bn4";
 cc bngen button;cn "gen";
 cc bnHelp button;cn "HELP";
bin z;
cc sbar static; cn "Type into field IN - else click a line to edit the state table...";
pshow
)

'==================== [syn] handlers ===================='
0 :0
Tuesday 18 June 2019  22:47:28
)

cocurrent 'syn'

syn_bngen_button=: gen

syn_bnundo_button=: undo

syn_bnHelp_button=: 3 : 'tv SYNHELP'

syn_bns_button=: 3 : 0

wd 'set echobuf text *',echobuf=: s
syn_echobuf_changed''
)

syn_bns1_button=: 3 : 0

wd 'set echobuf text *',echobuf=: s1
syn_echobuf_changed''
)

syn_bns2_button=: 3 : 0

wd 'set echobuf text *',echobuf=: s2
syn_echobuf_changed''
)

syn_bns3_button=: 3 : 0

wd 'set echobuf text *',echobuf=: s3
syn_echobuf_changed''
)

syn_edisbuf_changed=: empty

syn_echobuf_changed=: 3 : 0

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

smoutput sysevent,'=: empty'
)

syn_resize=: empty

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


syn_pane_select=: 3 : 0

if. shf= {. ". sysmodifiers do. refresh'' end.
sllog 'syn_pane_select sysmodifiers pane_select'
lino=. ".pane_select
stateno=. <:lino
wd 'psel syn; set edisbuf text *',pane
putsb 'state: ',":stateno
)

syn_bnnewST_button=: 3 : 0

t=. #sjj
sllog 'syn_bnnewST_button t'
snap''
STATE=: STATE,< 'STATE',":t
sj=: convert sjj=: sjj , ({:$sjj)$t
refresh''
)

sjj1=: 3 : 0

'h w'=. d=. $sjj
(y <: d$w#i.h) * (y<: 9&o. sjj)
)

syn_bndelST_button=: 3 : 0

t=. (i.#sjj)-. L=. <:".pane_select
sllog 'syn_bndelST_button t'
snap''
STATE=: t{STATE
sj=: convert sjj=: (sjj1 L) -~ sjj=: t{sjj
refresh''
)

'==================== [syn] main ===================='
0 :0
Wednesday 19 June 2019  00:40:18
)

cocurrent 'syn'

msg=: sllog=: empty
DIRTY=: 0
UCP=: 0
OUTCODE=: ' [:]+#!'
s=: s1=: s2=: s3=: 'unset'
'nix shf cmd opt'=: 0 1 2 4

absent=: [: +./ 0 > [: nc ;:
altLines=: ] {~ [: >: [: +: [: i. [: <. [: -: #
Cut=: <;._1
tv=: textview_jqtide_
window_close=: 3 : 'wd :: empty ''psel syn; pclose;'''

convert=: 3 : 0

if. 3=$$y do.
  msg '... convert: sj-->sjj'
  j./y
else.
  msg '... convert: sjj-->sj'
  +. y
end.
)

content=: 3 : 0
boxc 1
z=. ": display sj
boxc 0
altLines z
)

refresh=: 3 : 0
sllog 'refresh'
wd 'set pane items *', , dquote"1 content''
wd 'set edisbuf text *',edisbuf=: ''
work echobuf
)

0 :0
fixup=: 3 : 0


if. absent 'NAME' do.
  smoutput '...fixup: NAME'
end.
if. absent 'SYMBOL' do.
  smoutput '...fixup: SYMBOL'
end.
if. absent 'STATE' do.
  smoutput '...fixup: STATE'
end.
if. absent 'ssj' do.
  smoutput '...fixup: ssj'
end.
)

snap=: 3 : 0

'SYMBOL0 STATE0 sj0 sjj0'=: SYMBOL ; STATE ; sj ; sjj
)

undo=: 3 : 0

'sj sj0'=: sj0 ; sj
'sjj sjj0'=: sjj0 ; sjj
'STATE STATE0'=: STATE0 ;< STATE
'SYMBOL SYMBOL0'=: SYMBOL0 ;< SYMBOL
refresh''
)

renamed=: 4 : 0

sllog 'renamed x y'
STATE=: (<dltb y) x}STATE
)

j4stoc=: 3 : 0

state=. ". y-.OUTCODE
oc=. {. OUTCODE i. y-.'0123456789 '
state j. oc
)
0 :0
  j4stoc '3'
  j4stoc ,'3'
  j4stoc '3 '
  j4stoc '3['
  j4stoc '3[ '
  j4stoc '3[  '
  j4stoc ' 3[ '
  j4stoc '13[ '
  j4stoc '13['
  j4stoc ' 13['
)

sjjsub=: 4 : 0

oldline=. x pick sjj
snap''
sj=: convert sjj=: y x}sjj
)

doedis=: 3 : 0

if. DIRTY do.
  z=. Cut }:edisbuf
  if. '|#'-:2{.edisbuf do.
    msg '... doedis --update SYMBOL with [(edisbuf)]'
    snap''
    SYMBOL=: 2}.z
    refresh''
  elseif. '|'={.edisbuf do.
    state=. ". 0 pick z
    msg '... doedis --update state:(state) with [(edisbuf)]'
    state renamed dtb 1 pick z
    state sjjsub ; j4stoc each 2}.z
    refresh''
  elseif. do. ssw '>>> doedis --cannot handle [(edisbuf)]'
  end.
end.
)

putsb=: 3 : 0

wd 'psel syn; set sbar text *',":,y
)

gen1=: 3 : 0


if. 0=#y do. y=. 60 end.
smoutput 'NB','.',(y-3)#'-'
smoutput '".''synt=: '',LF-.~ 0 :','0'
smoutput (-y)&(]\) 5!:5 <'synt'
smoutput ')'
smoutput 'NB','.',(y-3)#'-'
smoutput 'smoutput synt ',quote s
)

gen2=: 3 : 0


if. 0=#y do. y=. 60 end.
smclear''
smoutput 'cocurrent ''base'''
smoutput li=. 'NB','.',(y-3)#'-'
smoutput 'sj=. +. ". >cutopen 0 :','0'
smoutput ' ',.":sjj
smoutput ')'
smoutput 'mj=. ". LF-.~ 0 :','0'
smoutput ' ',.": 16 16 $ mj
smoutput ')'
if. UCP do. smoutput 'synt=: ((0;sj;mj) ;: ucp)"1'
else.       smoutput 'synt=: ((0;sj;mj) ;: ])"1'
end.
smoutput li
smoutput 'smoutput synt ',quote s
clone''
smclear''
smoutput <'synt -generated in new temp file'
)

gen=: gen2

display=: 3 : 0

'h w'=.$ z=. sjjb sjj=: sjc y
z=. z ,.~ STATE
z=. z ,.~ <"0 i.h
z=. z ,~ '#';'STATE`';SYMBOL
)

sdate=: smoutput&date_z_

crox=: 3 : 0
if. isStr y do. quote y return. end.
deco=. quote
deco=. ]
for_item. y[z=.''[p=.'' do.
  z=. z, p, deco >item
  p=. ' ¶ '
  p=. ' ; '
  p=. '|'
end.
'Cut ',quote p,z
)

make_synt=: 3 : 0
if. UCP do.
  synt=: ((0;sj;mj) ;: ucp)"1
else.
  synt=: ((0;sj;mj) ;: ])"1
end.
i.0 0
)

identify_z_=: identify=: 3 : 0

make_synt''
smoutput 'NAME:' ; NAME
smoutput < y
smoutput synt y
smoutput display sj
smoutput date''
start s
)

sjc=: j./"1
sjjb=: subsj"0

subsj=: 3 : 0

z=. ":real y
select. imag y
case. 0 do. <z
case. 1 do. <z, 1{OUTCODE
case. 2 do. <z, 2{OUTCODE
case. 3 do. <z, 3{OUTCODE
case. 4 do. <z, 4{OUTCODE
case. 5 do. <z, 5{OUTCODE
case. 6 do. <z, 6{OUTCODE
end.
)

spout=: 3 ddefine

w=. {:$z=. vv y
for_k. i.x-w do.
  z=. SP,.z
end.
,z
)

SCANLABELS=: b4f }: 0 :0
        step#
1 wd start ix
2 state
3 mj symbol#
4 ->state
5 oc (0-6)
6 ->state,oc
7 tape
)

scan=: 3 : 0

suboc=. 3 : '<y{OUTCODE' "0
if. 0=#y do. z=. 1 6$0
else. z=. (5;sj;mj);: ,y
end.
w=. {: $z=. <"0 |: z
z=. z , b4x ;"1 ": each |: (4{z),:suboc 5{z
z=. z , boxedtape=: <"0 w{.y
z=. (2 }.each SCANLABELS {.~ #z),. z
z{~ 0 7 3 2 6
)

nosynt=: 3 : 0

ssw '>>> nosynt: --synt has failed with y=[(y)]'
a:
)

work=: 3 : 0


if. UCP do.
  synt=. ((0;sj;mj) ;: ucp)"1
else.
  synt=. ((0;sj;mj) ;: ])"1
end.
z=. synt :: nosynt y
if. 3= # ": z do.
  boxc 1
  z=. 1 pick ": z
  boxc 0
elseif. isEmpty z do.
  z=. '(empty list)'
end.
wd 'psel syn; set workbuf text *',":z
)

'==================== [syn] start ===================='
0 :0
Wednesday 19 June 2019  00:40:10
)

cocurrent 'syn'

VERSION=: '?.?.?'

start=: 3 : 0

load PARENTDIR,'/manifest.ijs'
window_close''
wd SYNFORM
wd 'set echobuf font "Menlo" 14'
wd 'set edisbuf font "Menlo" 14'
wd 'set pane font "Menlo" 14'
wd 'set workbuf font "Menlo" 14'
wd 'set echobuf text *',echobuf=: ,y
refresh''
wd 'psel syn; pmove ' , ":POS
onload_z_=: do
i.0 0
)

syn_z_=: start_syn_
immexj 0 : 0
cocurrent'syn'
smclear''
lp'syn0'
smoutput PROMPT
)
