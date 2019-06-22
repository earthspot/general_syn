'==================== [syn] utilities ===================='

cocurrent 'syn'

loadall_z_=: [: load&.> ([: pathof&.> <&jpath) ,&.> [: {."1 [: 1!:0 <&jpath

trace=: 3 : 0
  NB. enable/disable tracing verbs: msg, sllog
  NB. y== boolean
  NB. copied from: [cal] dashboard.ijs
if. y do.
  msg=: smoutput&sw
  sllog=: smoutput&llog
else.
  msg=: empty
  sllog=: empty
end.
NB. smoutput '+++ trace ',":y
i.0 0
)
