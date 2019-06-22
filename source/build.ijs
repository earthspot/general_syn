NB. general_syn repo - build
0 :0
Thursday 20 June 2019  02:23:35
-
open BUILTFILE
)

cocurrent 'base'

NB.==================================
GIT=. '~Gitsyn'  NB. for JAL release
APP=. 'syn'
NB.==================================

NB. TO LOAD JUST THIS BUILTFILE:  fn⌘F9
NB. DITTO THEN RUN:               fnF9

smoutput '--- Build: started for: ',GIT

date_z_=: 6!:0 bind 'YYYY-MM-DD  hh:mm:ss'

NOW=: date''
HEADERFILE_z_=: GIT,'/source/header.ijs'
BUILTFILE_z_=: GIT,'/',APP,'.ijs'

  NB. Modify header.ijs with current date written into it
HEADERFILE fappend~ LF,'AABUILT=: ',quote NOW

  NB. build BUILTFILE
writesourcex_jp_ (GIT,'/source');BUILTFILE

smoutput '--- Build: completed for: ',GIT