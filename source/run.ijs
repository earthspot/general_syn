NB. general_syn repo - run
0 :0
Tuesday 18 June 2019  21:37:47
-
open BUILTFILE
open TESTFILE
)

cocurrent 'base'

NB.=================================
GIT=. '~Gitsyn'  NB. for JAL release
APP=. 'syn'
NB.=================================

BUILTFILE_z_=: GIT,'/',APP,'.ijs'
TESTFILE_z_=: GIT,'/test/*.ijs'

NB. ---------------------------------------------------------

clear APP
load BUILTFILE
smoutput sw'+++ run.ijs: BUILTFILE=[(BUILTFILE)] loaded ok'

loadall TESTFILE

smoutput sw'--- run.ijs: TESTFILE=[(TESTFILE)] completed ok'

onload_z_=: do  NB. restore for ad-hoc edits of /source/*.ijs