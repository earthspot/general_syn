	NB. syn - forms.ijs
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

PROMPT=: 0 : 0
  sjjb sjj    NB. boxed symbolic sj
  sjc sj     NB. complex sj
  sjj        NB. complex sj
  display sj NB. tabulation of sj

LOAD A SYN TO WORK ON…
  lp'syn0'   NB. the J parser: default x-arg of monadic Words (;:)
  lp'syn1'   NB. <first word terminated by whitespace> ; <remainder>
  lp'syn2'   NB. [uu] smtime
  op'syn3'   NB. [uu] smddmmyy
  lp'syn4'   NB. [uu] cutuuc
  lp'syn5'   NB. [uu] smcut3
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