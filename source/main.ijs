	NB. syn - main.ijs
'==================== [syn] main ===================='
0 :0
Wednesday 19 June 2019  00:40:18
)

cocurrent 'syn'

msg=: sllog=: empty
IJRD=: 0 _1 0 _1            NB. default ijrd
DIRTY=: 0
UCP=: 0                     NB. 1==use widechars 0==use ASCII
OUTCODE=: ' [:]+#!'         NB. output codes as literals
s=: s1=: s2=: s3=: 'unset'  NB. sample strings (some overridden)
'nix shf cmd opt'=: 0 1 2 4

absent=: [: +./ 0 > [: nc ;:
altLines=: ] {~ [: >: [: +: [: i. [: <. [: -: #
Cut=: <;._1
tv=: textview_jqtide_
window_close=: 3 : 'wd :: empty ''psel syn; pclose;'''

convert=: 3 : 0
  NB. convert: sj<-->sjj -detects whichever (y) is
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
NB. wd 'set pane items *',(x2f dquote"1 content'') rplc LF;SP
NB. wd 'set pane items *',(x2f dquote"1 content'')-.LF
wd 'set pane items *', , dquote"1 content''
wd 'set edisbuf text *',edisbuf=: ''
work echobuf
fill_table real sjj	NB. from tempforms 210
NB. cell_colors imag sjj	NB. from tempforms 210
)

0 :0
fixup=: 3 : 0
  NB. defaults missing caches & data
  NB. UNUSED, UNFINISHED <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
  NB. snapshot sj sjj for subsequent: undo
'SYMBOL0 STATE0 sj0 sjj0'=: SYMBOL ; STATE ; sj ; sjj
)

undo=: 3 : 0
  NB. revert the last backed-up reassignment of sj sjj
'sj sj0'=: sj0 ; sj
'sjj sjj0'=: sjj0 ; sjj
'STATE STATE0'=: STATE0 ;< STATE
'SYMBOL SYMBOL0'=: SYMBOL0 ;< SYMBOL
refresh''
)

renamed=: 4 : 0
  NB. rename state (x) to: (y)
sllog 'renamed x y'
STATE=: (<dltb y) x}STATE
)

j4stoc=: 3 : 0
  NB. convert "state,output code" (stoc) (y): '3['--> 3j1
NB. state=. ". 0{y	NB. eg: 3
state=. ". y-.OUTCODE
oc=. {. OUTCODE i. y-.'0123456789 ' NB. eg: 1
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
  NB. replace state (x) of sjj with y
oldline=. x pick sjj
NB. smoutput x;'sjjsub';y; 'old line:' ; oldline ; 'new line:' ; y
snap''  NB. for undo of…
sj=: convert sjj=: y x}sjj
)

doedis=: 3 : 0
  NB. edit symbol table from wd cache: edisbuf
if. DIRTY do.
  z=. Cut }:edisbuf
  if. '|#'-:2{.edisbuf do.   NB. edited display header line
    msg '... doedis --update SYMBOL with [(edisbuf)]'
    snap''
    SYMBOL=: 2}.z
    refresh''
  elseif. '|'={.edisbuf do. NB. edited display state line
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
  NB. show (string/num) y in statusbar
wd 'psel syn; set sbar text *',":,y
)

gen1=: 3 : 0
  NB. generate source code for syn
  NB. non-empty (y) is width of generated code (default 60)
if. 0=#y do. y=. 60 end.
smoutput 'NB','.',(y-3)#'-'
smoutput '".''synt=: '',LF-.~ 0 :','0'
smoutput (-y)&(]\) 5!:5 <'synt'
smoutput ')'
smoutput 'NB','.',(y-3)#'-'
smoutput 'smoutput synt ',quote s
)

gen2=: 3 : 0
  NB. generate source code for syn
  NB. non-empty (y) is width of generated code (default 60)
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
  NB. tabulate sj (y)
'h w'=.$ z=. sjjb sjj=: sjc y
z=. z ,.~ STATE
z=. z ,.~ <"0 i.h
NB. z=. z ,~ '#▼';'STATE`▼';SYMBOL
z=. z ,~ '#';'STATE`';SYMBOL
NB. z=. z ,~ SP;'SYMBOL#▶';<"0 i.w
)

sdate=: smoutput&date_z_

crox=: 3 : 0
NB.   linearize boxed/open y
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
  synt=: ((0;sj;mj;ijrd) ;: ucp)"1
else.
  synt=: ((0;sj;mj;ijrd) ;: ])"1
end.
i.0 0
)

identify_z_=: identify=: 3 : 0
  NB. called by syn*.ijs on being loaded
make_synt''
smoutput 'NAME:' ; NAME
smoutput < y
smoutput synt y
smoutput display sj
smoutput date''
start s
)

sjc=: j./"1    NB. sj (y) as complex table
sjjb=: subsj"0  NB. sjj-: sjc sj (y) as symbolic entries

subsj=: 3 : 0
  NB. symbolic string-repn of (complex) sj entry (y)
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
  NB. space out vector: y -used by: scan
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
  NB. diagnostic display for tape: (y)
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
  NB. called when synt fails
ssw '>>> nosynt: --synt has failed with y=[(y)]'
a:
)

work=: 3 : 0
  NB. apply syn to tape (y) and display result
  NB. employ a LOCAL version of: synt
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

NB. ============= from tempforms 210 ===============

syn_states_button=:	empty
syn_states_mark=:		empty
syn_states_mbldbl=:	empty
syn_states_mbldown=:	empty
syn_states_mblup=:		empty
syn_states_select=:	empty
syn_resize=:		empty

syn_default=: needsHnd	NB. defined in: handy.ijs

0 :0
display=: 3 : 0
  NB. tabulate sj (y)
'h w'=.$ z=. sjjb sjj=: sjc y
z=. z ,.~ STATE
z=. z ,.~ <"0 i.h
NB. z=. z ,~ '#▼';'STATE`▼';SYMBOL
z=. z ,~ '#';'STATE`';SYMBOL
NB. z=. z ,~ SP;'SYMBOL#▶';<"0 i.w
)

fill_table=: 3 : 0
z=. }. display sj  NB. boxed display EXCLUDING hdr: SYMBOL
wd 'psel syn'
wd 'set states font "Menlo" 14'
wd 'set states shape ',":SHAPE=:$z
NB. wd 'set states protect ',": , SHAPE$ 1 0 0 0 0  NB. protect col0
NB. wd 'set states hdr ',o4b dquote each '#';'STATE`' ; SYMBOL
wd 'set states hdr ',o4b dquote each '#▼';'STATE`▼';SYMBOL
wd 'set states data ',o4b dquote@": each ,z
wd 'set states resizecol'
)

0 :0
fill_table=: 3 : 0
wd 'psel syn'
wd 'set states font "Menlo" 14'
wd 'set states shape ',":SHAPE=.$y
wd 'set states protect ',": , SHAPE$ 1 0 0 0 0  NB. protect col0
NB. wd 'set states hdr *col0 col1 col2 col3 col4'
wd 'set states data *', ": , y
wd 'set states resizecol'
)

get_table=: 3 : 0
wd 'psel syn'
z=. wd 'get states table'
($sjj) $ b4f z rplc DEL ; LF
)

PALETTE=: '#',each b4f }: 0 : 0
ffffff
ffcccc
ff0000
ccffcc
00ff00
ccccff
0000ff
)

cell_colors=: 3 : 0
wd 'psel syn'
wd 'set states block ',": , 0,. <: $y
wd 'set states background ',o4b ,y{PALETTE
)

0 :0
syn_run=: 3 : 0	NB. UNUSED in this app <<<<<<<<<<<<<<<<<<<<<<<<
smclear''
smoutput '+++ syn_run: ENTER…' ,LF, '   cocurrent ''form210'''
NB.
syn_close''
wd FM
fill_table real sjj
cell_colors imag sjj
wd 'pmove 0 22 400 0'
wd 'psel syn; pshow'	NB. paranoid psel, but good to use
)
