'==================== [syn] utilities ===================='

cocurrent 'z'	NB. <<<<<<<<<<<<<<<<<<<<<<<<<<<< _z_ NOT _syn_

loadall=: [: load&.> ([: pathof&.> <&jpath) ,&.> [: {."1 [: 1!:0 <&jpath

trace=: 3 : 0
NB. enable/disable tracing verbs: msg, sllog
NB. y== boolean or empty
NB. EXTENDED from: [cal] dashboard.ijs to include toggle trace
notrace=. 3 : '''empty''-:5!:5<''sllog'''
if. y-:1 do.
  msg=: smoutput&sw
  sllog=: smoutput&llog
elseif. y-:0 do.
  msg=: empty
  sllog=: empty
elseif. 0=#y do. trace notrace'' return.  NB. toggle trace
elseif. do. ssw '>>> trace: invalid option: [(y)]'
end.
msg '+++ trace_(>coname$0)_ : (-.notrace$0)'
)
