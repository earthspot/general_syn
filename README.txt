# general_syn

# TO DO

What if state pointed-to is deleted?

recognise alt formats for mj
  make: gen output in the correct format.
  make gen write directly to a temp file, avoiding smoutput's

create sj from sjj and v-v if either is absent

fixup STATE and SYMBOL if not given.

Init mini 2-state syn* befoe any are loaded.

See how it looks on the GitHub website

Import 2-state example from Hui Lab.

Make the addon work with jcon

-
Wednesday 19 June 2019  00:44:38 ian
New github repo seems to work ok

gen2 works, and writes source for a working: synt.


-
Tuesday 18 June 2019  22:11:09 ian
+++ FROM THE HEADER OF '~proj/syn.ijs' ...
-
UTILITIES
  wd'psel syn; qform'
  sminfo_z_=: wdinfo_z_=: echo_z_
 ]POS=: wd 'psel syn; getp xywh'
-
NEXT TO DO
Add both row (new state) and col (new symb)
Default SYMBOL and STATE if not provided in syn*.ijs
New: gen'' to break up synt into sj mj
Convert 256-mj into boxed form, and vv?
  boxed form better for add/del column of sjj
Make some common builtin symbol-sets
  also some subroutine syns -eg
    recognise comment
    ignore leading/trailing whitespace
    extract quoted/bracketed text
    find arrows up/down to decorate sj-table
-
The labs “Sequential Machines” and “Huffman Coding”
 contain further examples on the use of sequential machines.
-
WISHLIST
  design a palette to perform the steps
  store subroutines, e.g. search for NB.
  merge a stock syn
  load an existing syn from anywhere
  break up the J-parsing syn
  Single-step
  Build syn step-by-step
  Convert state-table between complex array and char mx
    boxed display of symbol set
  Manage the symbol-set
    have stock symbol set components
  Work with wide chars by default
    represent common sets with standard ucps
  dashboard with a toolbar
  build selection of test tapes to be scanned
  adapt f5 to build a "trajectory"

# TERMINOLOGY

SYNTAX MACHINE (syn)
  the assembled syntax machine…
    synt=: ((0;sj;mj) ;: ])"1
    synt=: ((0;sj;mj) ;: ucp)"1

SYMBOL SET (aka mapped input)
  boxed set of tape symbols corresp to columns of state-table.

STATE [TRANSITION] TABLE
  3-D mx of integers
    ROWS <--> the numbered states
    COLS <--> the boxes of the symbol set

SCAN (a tape)
  apply (synt) to a given tape.

TRAJECTORY
  display what happens at each step of a scan.

FUNCTION CODE (f)
  an integer between 0 and 5
  becomes the first item of boxed list: syn
0	<y{~j+i.i-j	the word boxed
1	y{~j+i.i-j	the word
2	j,i-j	  	word index and length
3	c+q*r	  	state table index
4	j,(i-j),c+q*r	both 2 and 3 above
5	i,j,r,c,s{~<r,c	trace

OUTPUT CODE (eg 3 in: 0j3)
  0    no output
[ 1    j=.i		mark start of wd
: 2    j=.i  [ ew(i,j,r,c)	emit wd, mark start of next
] 3    j=._1 [ ew(i,j,r,c)	emit wd, park j
+ 4    j=.i  [ ev(i,j,r,c)	emit +wd, mark start of next
# 5    j=._1 [ ev(i,j,r,c)	emit +wd, park j
! 6    			stop

-
Tuesday 18 June 2019  21:18:12 ian
Repo created today for population with ~proj/syn*.ijs source files
