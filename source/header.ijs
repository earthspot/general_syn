0 :0
Tuesday 18 June 2019  21:25:07
-
SYN: sequential/syntax machine editor
)

require 'format/zulu'

clear 'syn'	NB. >>>>> DISABLE THIS LINE IN RELEASED ADDON
coclass 'syn'
onload_z_=: empty

PARENTDIR=: (zx i:'/'){.zx=.jpathsep>(4!:4<'zx'){4!:3''[zx=.'syn builtfile'

AABUILT=: '2019-06-19  01:03:24'