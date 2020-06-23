# Index of phrases


Constants and functions referred to in the Q Phrasebook. 

<i class="fas fa-download"></i>
[`phrases.q`](phrases.q)

```q
DEC:"0123456789"
HEX:"0123456789abcdef"
PI:3.141592653589798238
PUN:",;:.!?"
depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan{1=count distinct count each x}each raze over x]}
fac:{prd 1+til x}                       / factorial
ly:{mod[;2] sum 0=x mod\:4 100 400}     / is x a leap year?
oa:{x xexp/:0 1}                        / ones and all Xs (float)
oe:{x xexp\:0 1}                        / 1 and each X (float)
shape:{$[0=d:depth x; 
  0#0j; 
  d#{first raze over x}each(d{each[x;]}\count)@\:x]}  / FIXME correct for shape 0#0
tc:('[til;count])
tt:{2 vs til "j"$2 xexp x}              / truth table of order x
zm:{(2#count x)#0}                      / zero matrix (square matrix)
```


## Arithmetic

new | description | phrase
---:|-------------|-------
100 | [sum a vector](arith.md#sum-a-vector) | `sum x`
101 | [sum columns of matrix](arith.md#sum-columns-of-matrix) | `sum x`
102 | [sum rows of matrix](arith.md#sum-rows-of-matrix) | `sum each x`
103 | [sum items grouped by y](arith.md#sum-items-grouped-by-y) | `sum each x value group y`
104 | [add vector to each row of matrix](arith.md#add-x-to-each-row-of-y) | `x+/:y`
105 | [add vector to each column of matrix](arith.md#add-x-to-each-column-of-y) | `x+'y`
106 | [add x to last item of y](arith.md#add-x-to-last-item-of-y) | `@[y;count[y]-1;+;x]`
107 | [sum reciprocal series](arith.md#sum-reciprocal-series) | `sum y%x`
108 | [sum over subsets of x specified by y](arith.md#sum-over-subsets-of-x-specified-by-y) | `x mmu y`
109 | [sum squares](arith.md#sum-squares) | `sum x*x`
110 | [alternating sum](arith.md#alternating-sum) | `sum x*(count x)#1 -1`
111 | [alternating sum series](arith.md#alternating-sum-series) | `sums x*(count x)#1 -1`
112 | [increase absolute value without sign change](arith.md#increase-absolute-value-without-sign-change) | `x+y*(x=0)+signum x`
113 | [vector and its negative](arith.md#vector-and-its-negative) | `1 -1*/:x`
114 | [numeric array and its negative](arith.md#numeric-array-and-its-negative) |  `x,''neg x`
115 | [first difference](arith.md#first-difference) | `deltas x`
116 | [pairwise difference](arith.md#pairwise-difference) | `1_neg deltas x`
117 | [zeroing an array](arith.md#zeroing-an-array) | `x*0`
118 | [product](arith.md#product) | `prd x`
119 | [multiplication table of order x](arith.md#multiplication-table-of-order-x) | `{x*\:x}1+til x`
120 | [square x retaining sign](arith.md#square-x-retaining-sign) | `x*abs x`
121 | [multiply each column by vector](arith.md#multiply-each-column-by-vector) | `x*y`
122 | [multiply each row by vector](arith.md#multiply-each-row-by-vector) | `x*\:y`
123 | [vector (cross) product](arith.md#vector-cross-product) | `(-).(*/')(1 neg\1 -1)rotate''2 2#(x;y)`
124 | [alternating product](arith.md#alternating-product) | `prd x xexp(count x)#1 -1`
125 | [direct matrix product](arith.md#direct-matrix-product) | `flip each x*\:\:y`
126 | [matrix product](arith.md#matrix-product) | `x mmu y`
127 | [dot product of vectors](arith.md#dot-product-of-vectors) | `sum x*y`
128 | [product over subsets of x specified by y](arith.md#product-over-subsets-of-x-specified-by-y) | `x('[prd;xexp])\:y`
129 | [divide by 0](arith.md#divide-by-0) | `not[z]*y%x+z:x=0`
130 | [divisors](arith.md#divisors) | `where 0=x mod/:til 1+x`
131 | [greatest common divisor](arith.md#greatest-common-divisor) | `1+last where min each 0=x mod/:1+til min x`
132 | [pairwise ratios](arith.md#pairwise-ratios) | `1_ratios x`
133 | [maximum table](arith.md#maximum-table) | `{x|\:x}til x`
134 | [minimum table](arith.md#minimum-table) | `{x&\:x}til x`
135 | [consecutive integers from x to y](arith.md#consecutive-integers-from-x-to-y) | `x+til 1+y-x`
136 | [arithmetic progression of y numbers from x with step g](arith.md#arithmetic-progression-of-y-numbers-from-x-with-step-g) | `x+g*til y`
137 | [arithmetic progression from x to y with step g](arith.md#arithmetic-progression-from-x-to-y-with-step-g) | `x+g*til 1+ floor (y-x)%g`
138 | [primes to n](arith.md#primes-to-n) | `a where not a in distinct raze a*/:\:a:2_ til x`
139 | [x first triangular numbers](arith.md#x-first-triangular-numbers) | `sums til x`
140 | [first 10 figurate numbers of order x](arith.md#first-10-figurate-numbers-of-order-x) | `x+\/10#1`
141 | [fractional part](arith.md#fractional-part) | `x mod 1`
142 | [integer and fractional parts of positive x](arith.md#integer-and-fractional-parts-of-positive-x) | `f,'x-f:floor x`
143 | [magnitude of fractional part](arith.md#magnitude-of-fractional-part) | `a-floor a:abs x`
144 | [fractional part with sign](arith.md#fractional-part-with-sign) | `signum[x]*abs[x]mod 1`
145 | [leading digit of numeric code abbb](arith.md#leading-digit-of-numeric-code-abbb) | `floor x%1000`
146 | [last part of abbb](arith.md#last-part-of-abbb) | `x mod 1000`
147 | [identity for floating-point maximum, negative infinity](arith.md#identity-for-floating-point-maximum-negative-infinity) | `max 0#0.0`
148 | [identity for floating point minimum, positive infinity](arith.md#identity-for-floating-point-minimum-positive-infinity) | `min 0#0.0`



## Casting and representation

new| description | phrase
---:|-------------|-------
200 | [binary from integer](cast.md#binary-from-integer) | `2 vs x`, `0b vs x`, `0x0 vs x` 
201 | [integer from binary](cast.md#integer-from-binary) | `2 sv x`
202 | [hexadecimals from integers](cast.md#hexadecimal-from-integer) | `HEX 16 vs x`
203 | [hexadecimals from decimal characters](cast.md#hexadecimal-from-decimal-characters) | `HEX 16 vs "i"$x`
204 | [decimal digits from integer](cast.md#decimal-digits-from-integer) | `10 vs x`
205 | [integer in base y](cast.md#integer-in-base-y) | `y vs x`
206 | [integer in base 10 100 1000](cast.md#integer-x-in-base-10-100-1000) | `10 100 1000 vs x`
207 | [integer from hexadecimal](cast.md#integer-from-hexadecimal) | `16 sv HEX?x`
208 | [vector from date](cast.md#vector-from-date) | `100000 100 100 vs x`
209 | [integer from date](cast.md#integer-from-date) |`"I"$ string[x] except "."`
210 | [number from string](cast.md#number-from-string)| `parse x`
211 | [number from string, default y](cast.md#number-from-string-x-default-y) | `parse $[x~"";y;x]`
212 | [numeric codes from string](cast.md#numeric-codes-from-string) | `"i"$x`
213 | [integer from Roman](cast.md#integer-from-roman) | `d:0,1000 500 100 50 10 5 1 "MDCLXVI"`<br/>`sum floor a*-1 xexp a<1 rotate a:d?x`
214 | [numbers from text matrix](cast.md#numbers-from-text-matrix) | `parse each x`
215 | [numbers from evaluating rows of text matrix](cast.md#numbers-from-evaluating-rows-of-text-matrix) | `raze('[eval;parse])each x`



## Execution

new | description | phrase
---:|-------------|-------
300 | [case structure](exec.md#case-structure) | `$[c0;t0;c1;t1;c2;t2;f]`
301 | [choose x or y depending on flag g](exec.md#choose-x-or-y-depending-on-flag-g) | `$[g;x;y]`
302 | [reverse on condition y](exec.md#reverse-on-condition-y) | `y reverse/x`
303 | [conditional change of sign](exec.md#conditional-change-of-sign) | `y*1 -1 x`
304 | [efficient execution of f x where x has repeated values](exec.md#efficient-execution-of-f-x-where-x-has-repeated-values) | `u:distinct x`<br/>`(f u)u?x`
305 | [error to stop execution](exec.md#error-to-stop-execution) | ``'`stop``
306 | [execute rows of character matrix](exec.md#execute-rows-of-character-matrix) | `('[eval;parse])each x`
307 | [sum numbers in character matrix](exec.md#sum-numbers-in-character-matrix) | `sum parse " " sv x`




## Finance

new | description | phrase
---:|-------------|-------
400 | [present value of cash flows c at times t and discount rate d](fin.md#present-value-of-cash-flows)| `sum c*d xexp t`
401 | [future value of cash flows](fin.md#future-value-of-cash-flows) | `sum x* (1+y%100) xexp reverse tc x`
402 | [compound interest for principals y at percentages g for periods x](fin.md#compound-interest-for-principals-y-at-percentages-g-for-periods-x) | `y*\:(1+g%100)xexp\:x`
403 | [annuity coefficient for x periods at interest rate y%](fin.md#annuity-coefficient-for-x-periods-at-interest-rate-y) | `y%/:100*flip 1-(1+y%100)xexp\:neg x`
404 | [fifo stock y decremented with x units](fin.md#fifo-stock-y-decremented-with-x-units) | `1_deltas 0,0|(sums y)-x`
405 | [payback](fin.md#) | `C:prds(count W)#1+R`<br/>`C*B-sums W%(count W)#T _ 1,C`
406 | [round to nearest integer](fin.md#round-to-nearest-integer) | `floor 0.5+x`
407 | [round to two decimal places](fin.md#round-to-two-decimal-places) | `0.01*floor 0.5+x*100`
408 | [round y to x decimals](fin.md#round-y-to-x-decimals) | ``(10 xexp neg x)*`long$y*10 xexp x``
409 | [round to nearest even integer](fin.md#round-to-nearest-even-integer) | `floor x+not 1>x mod 2`
410 | [round, but to nearest even integer if fractional part is 0.5](fin.md#round-but-to-nearest-even-integer-if-fractional-part-is-05) | `floor x+0.5*not 0.5=x mod 2`
411 | [round x to nearest multiple of y](fin.md#round-x-to-nearest-multiple-of-y) | `y*floor 0.5+x%y`
412 | [round x to zero if magnitude less than y](fin.md#round-x-to-zero-if-magnitude-less-than-y) | `@[x;where y>abs x;:;0.0]`
413 | [round summands](fin.md#round-summands) | `i:floor Y:y%x`<br/>`a:{(floor .5+/x)#idesc x}Y-i`<br/>`x*@[i;a;+;1]`



## Find

new | description | phrase
---:|-------------|-------
500 | [y in x](find.md#y-in-x) | `x?y`
501 | [flags](find.md#flags) | `where x`
502 | [all occurrences of y in x](find.md#all-occurrences-of-y-in-x)| `where x in y`
503 | [first occurrence of y](find.md#first-occurrence-of-y) | `x?y`
504 | [first occurrence of maximum](find.md#first-occurrence-of-maximum) | `x?max x`
505 | [first occurrence of minimum](find.md#first-occurrence-of-minimum) | `x?min x`
506 | [first occurrence of g (circularly) after y](find.md#first-occurrence-of-g-circularly-after-y) | `q)mod[;count x] y+(y rotate x)?g`
507 | [last occurrence of y](find.md#last-occurrence-of-y) | `count[x]-1+reverse[x]?y`
508 | [last occurrence of y, counted from the rear](find.md#last-occurrence-of-y-counted-from-the-rear) | `reverse[x]?y`
509 | [distinct items](find.md#distinct-items) | `value group x`
510 | [first differing item of x and y](find.md#first-differing-item-of-x-and-y) | `first where x<>y`
511 | [items not in y](find.md#items-not-in-y) | `not x in y`
512 | [consecutive repeated items](find.md#consecutive-repeated-items) | `where differ x`
513 | [rows of matrix y in matrix x](find.md#rows-of-matrix-y-in-matrix-x) | `x?y`
514 | [items of y in array x](find.md#items-of-y-in-array-x) | `shape[x] vs where raze[x] in raze y`
515 | [rows of y in in corresponding rows of x](find.md#rows-of-y-in-in-corresponding-rows-of-x) | `x?'y`
516 | [first blank](find.md#first-blank) | `x?" "`
517 | [last non-blank](find.md#last-non-blank) | `(" "=reverse x)?0b`
518 | [string x in string y](find.md#string-x-in-string-y) | `z:where y=first x`<br/>`z where x~/:y z+\:tc x`
519 | [blank rows](find.md#blank-rows) | `all flip x=" "`
520 | [rows starting with item of y](find.md#rows-starting-with-item-of-y) | `x where x[;0]in y`


## Flags

new | description | phrase
---:|-------------|-------
600 | [invert 0s after first 1](flag.md#invert-0s-after-first-1) | `maxs x`
601 | [invert 1s after first 1](flag.md#invert-1s-after-first-1) | `(tc x)=x?1`
602 | [invert 0s after first 0](flag.md#invert-0s-after-first-0) | `tc[x]<>x?0`
603 | [invert 1s after first 0](flag.md#invert-1s-after-first-0) | `mins x`
604 | [smearing 1s between pairs of 1s](flag.md#smearing-1s-between-pairs-of-1s) | `x or(<>)scan x`
605 | [invert fields marked by pairs of 1s](flag.md#invert-fields-marked-by-pairs-of-1s) | `(not x)&(sums x)mod 2`
606 | [invert all but first 1 in group of 1s](flag.md#invert-all-but-first-1-in-group-of-1s) | `x>-1 _ 0,x`
607 | [insert 0 in list of 1s x after indexes y](flag.md#insert-0-in-list-of-1s-x-after-indexes-y) | `raze @[x,\:();y;,;0]`
608 | [zero all items](flag.md#zero-all-items) | ` x&0`
609 | [flags at y for vector x](flag.md#flags-at-y-for-vector-x) | `(tc x) in y`
610 | [vector length x with 1s at y](flag.md#vector-length-x-with-1s-at-y) | `(til x) in y`
611 | [vector length y with 0s at x](flag.md#vector-length-y-with-0s-at-x) | `@[y#1;x;:;0]`
612 | [1s followed by 0s](flag.md#1s-followed-by-0s) | `x>til y`
613 | [0s followed by 1s](flag.md#0s-followed-by-1s) | `x<=til y`
614 | [1s preceded by 0s](flag.md#1s-preceded-by-0s) | `(til y)>=y-x`
615 | [0s preceded by 1s](flag.md#0s-preceded-by-1s) | `(til y)<y-x`
616 | [interlace 1s and 0s](flag.md#interlace-1s-and-0s) | `(raze/)flip(x;y)#''1 0`
617 | [alternate takes of 1s and 0s](flag.md#alternate-takes-of-1s-and-0s) | `(count[x]#1 0)where x`
618 | [flag positive integers](flag.md#flag-positive-integers) | `x in til 1+max x`
619 | [count 1s](flag.md#count-1s) | `sum x`
620 | [lengths of groups of 1](flag.md#lengths-of-groups-of-1) | `deltas sums[x]where 1_(<)prior x,0`
621 | [first 1 in x](flag.md#first-1-in-x) | `x?1`
622 | [first 1 after index y](flag.md#first-1-after-index-y) | `first a where y<a:where x`
623 | [yth 1](flag.md#yth-1) | `(sums x)?1`
624 | [all](flag.md#all) | `all x`
625 | [any](flag.md#any) | `any x`
626 | [none](flag.md#none) | `not any x`
627 | [x implies y](flag.md#x-implies-y) | `x<=y`
628 | [x but not y](flag.md#x-but-not-y) | `x>y`
629 | [exclusive or](flag.md#exclusive-or) | `x<>y`
630 | [Kronecker delta](flag.md#kronecker-delta) | `x=y`
631 | [simple parity](flag.md#simple-parity) | `(sum x) mod 2`
632 | [running parity](flag.md#running-parity) | `(sums x) mod 2`
633 | [first group of 1s](flag.md#first-group-of-1s) | `x and(and)scan x=(or)scan x`
634 | [first 1s in groups of 1s](flag.md#first-1s-in-groups-of-1s) | `1_(>)prior 0,x`
635 | [last 1s in groups of 1s](flag.md#last-1s-in-groups-of-1s) | `1_(<)prior x,0`
636 | [select items flagged by y](flag.md#select-items-flagged-by-y) | `x[;;where y]`


## Format

new | description | phrase
---:|-------------|-------
700 | [formatted integers](form.md#formatted-integers) | `flip DEC 10 vs x`
701 | [count of format](form.md#count-of-format) | `('[count;string])`
702 | [leading zeros for positive integers in field width y](form.md#leading-zeros-for-positive-integers-x-in-field-width-y) | `1_'string x+10 xexp y`
703 | [number of decimals](form.md#number-of-decimals) | `count each 2_'string x mod 1`
704 | [number of decimals, maximum y](form.md#number-of-decimals-maximum-y) | `y&count each 2_'string x mod 1`
705 | [number of positions in nonnegative integer](form.md#number-of-positions-in-non-negative-integer) | `1+floor log10 x+0=x`
706 | [number of positions in integer](form.md#number-of-positions-in-integer) | `1+(x<0)+floor 10 xlog abs x+0=x`
707 | [time hh:mm:ss from integer hhmmss](form.md#time-hhmmss-from-integer-hhmmss) | `":"sv 0 2 4_ string x`
708 | [date yyyy/mm/dd from integer yyyymmdd](form.md#date-yyyymmdd-from-integer-yyyymmdd) | `"/"sv 0 4 6_ string x`
709 | [indexing plotting characters with flags](form.md#indexing-plotting-characters-with-flags) | `" X" x`
710 | [histogram](form.md#histogram) | `" *"(1+ til max x)<=/:x`
711 | [barchart of integer list](form.md#barchart-of-integer-list)| `" X" reverse til[max x]<\:x`
712 | [horizontal barchart of integers](form.md#horizontal-barchart-of-integers) | `" X" x>\:til max x`
713 | [horizontal barchart, normalized to length y](form.md#horizontal-barchart-normalized-to-length-y) | `" X" (floor x*y%max x)>\:til y`



## Geometry

new | description | phrase
---:|-------------|-------
800 | [degrees from degrees and minutes](trig.md#degrees-from-degrees-and-minutes) | `sum x%1 60`
801 | [degrees from radians](trig.md#degrees-from-radians) | `57.295779513082323*x`
802 | [radians from degrees](trig.md#radians-from-degrees) | `0.017453292519943295*x`
803 | [nautical miles from radians](trig.md#nautical-miles-from-radians) | `x*180*60%PI`
804 | [great circle distance](trig.md#great-circle-distance) | `cos distinct(prd sin x)+(prd cos x)*cos(-/)y`
805 | [area of triangle with sides x (Heron’s rule)](trig.md#area-of-triangle-with-sides-x) | `sqrt prd(sum x%2)-0,x`
806 | arctangent y÷x | `atan y%x`
807 | [complementary angle (arccos sin x)](trig.md#complementary-angle-arccos-sin-x) | `acos sin x`
808 | [rotation matrix for angle x (in radians) counter-clockwise](trig.md#rotation-matrix-for-angle-x-in-radians-counter-clockwise) | `((cos x;neg sin x);(sin x;cos x))`
809 | [contour levels y at points with altitude x](trig.md#contour-levels-y-at-points-with-altitude-x) | `y -1+sum not y>x`



## Indexes

new | description | phrase
---:|-------------|-------
900 | [all indexes of vector x](indexes.md#all-indexes-of-vector-x) | `tc x`
901 | [y-wide sublists of x](indexes.md#y-wide-sublists-of-x) | `y+til count[x]-y-1`
902 | [sublists of length y, starting at x](indexes.md#sublists-of-length-y-starting-at-x) | `x+\:til y`
903 | [all pairs of `til[x]` and `til[y]`](indexes.md#all-pairs-of-tilx-and-tily) | `ap:{x vs til prd x}x,y`
904 | [indexes of an array](indexes.md#indexes-of-an-array) | `ap shape x`
905 | [scattered indexing](indexes.md#scattered-indexing) | `x ./: y`
906 | [raveled index from general index](indexes.md#raveled-index-from-general-index) | `shape[x] sv y`
907 | [index an arbitrary-rank array](indexes.md#index-an-arbitrary-rank-array)| `x . y`



## Mathematics

new | description | phrase
---:|-------------|-------
1000 | [Beta function](math.md#beta-function) | `gamma:prd"f"$1_til@`<br/>`((gamma x)*gamma y)%gamma[x+y]`
1001 | [number of combinations of n objects taken k at a time](math.md#number-of-combinations-of-n-objects-taken-k-at-a-time) | `fac[n]%fac[n-k]*fac[k]`
1002 | [number of permutations of n objects taken k at a time](math.md#number-of-permutations-of-n-objects-taken-k-at-a-time) | `prd(n-k-1)+til k`
1003 | [permutations](math.md#permutations) | `(1 0#x){raze(1 rotate)scan'x,'y}/x`
1004 | [invert permutation](math.md#invert-permutation) | `iasc x`
1005 | [connectivity list from connectivity matrix](math.md#connectivity-list-from-connectivity-matrix) | `rc[x;]where raze x`
1006 | [connectivity matrix from connectivity list](math.md#connectivity-matrix-from-connectivity-list)| `(2#x)#(til x*x)in x sv/:y`
1007 | [node matrix from connection matrix](math.md#node-matrix-from-connection-matrix)| `b:flip each x=/:1 -1`<br/>`(mmu\:) . "f"$(b;tc x)`
1008 | [connection matrix from node matrix](math.md#connection-matrix-from-node-matrix) | `(-/)flip x=/:tc distinct raze x`
1009 | [first y Fibonacci numbers](math.md#fibonacci-numbers) | `y{x,sum -2#x}/0 1`
1010 | [maximum separation of items of x](math.md#maximum-separation-of-items-of-x) | `(max x)-min x`
1011 | [partitions of y with no part less than x](math.md#partitions-of-y-with-no-part-less-than-x) | `part:{t:x _ til 1+floor y%2;(raze t,''t part'y-t),y}`
1012 | [Pascal’s triangle](math.md#pascals-triangle) | `x {0+':x,0}\ 1`
1013 | [pointer chasing](math.md#pointer-chasing) | `((r*til p)mod p)\[1]`
1014 | [polygon area](math.md#polygon-area) | `0.5*sum last[x]{(-/)y*reverse x}':x`
1015 | [quadraticsolution](math.md#quadratic-solution) | `q:0.5*y+signum[y]*sqrt(y*y)-4*x*z`<br/>`(q%x),z%q`
1016 | [saddle-point indexes](math.md##saddle-point-indexes) | `rc[x;]where raze minmax x`
1017 | flag row minimums | `rn:{x=min each x}`
1018 | flag column maximums | `cx:{x=\:max x}`
1019 | flag minmaxs | `minmax:{(rn x)&cx x}`
1020 | row-column indexes of ravel-indexes y in matrix x | `rc:{(div;mod).\:(y;count first x)}`
1021 | [value of saddle point](math.md#value-of-saddle-point) | `raze[x]where raze minmax x`
1022 | [set union](math.md#set-union) | `distinct y,x`
1023 | [set difference](math.md#set-difference) | `x except y`
1024 | [set intersection](math.md#set-intersection) | `x where x in y`
1025 | [range union](math.md#range-union) | `f:{(x b;1 rotate a b:0,where x>1+a:-1 rotate maxs y)}`<br/>`flip f . flip asc x`
1026 | [Taylor series](math.md#taylor-series) | `sum y*(x xexp a)%prds 1|a:tc y`
1027 | [value of Taylor series with coefficients y at x](math.md#value-of-taylor-series-with-coefficients-y-at-x) | `sum y*prds 1.0,x%1+til(count y)-1`





## Matrixes

new | description | phrase
---:|-------------|-------
1100 | [apply to dimension 1 function defined on dimension 0](matrix.md#apply-to-dimension-1-function-defined-on-dimension-0) | `f each x`
1101 | [truth table of order x](matrix.md#truth-table-of-order-x) | `2 vs til "j"$2 xexp x`
1102 | [upper triangular matrix of order x](matrix.md#upper-triangular-matrix-of-order-x) | `{x<=\:x}til x`
1103 | [lower triangular matrix of order x](matrix.md#lower-triangular-matrix-of-order-x) | `{x>=\:x}til x`
1104 | [identity matrix of order x](matrix.md#identity-matrix-of-order-x) | `{x=/:x}til x`
1105 | [Hilbert matrix of order x](matrix.md#hilbert-matrix-of-order-x) | `reciprocal 1+{x+/:x}til x`
1106 | [empty row to start matrix of x columns](matrix.md#empty-row-to-start-matrix-of-x-columns) | `()`
1107 | [main diagonal](matrix.md#main-diagonal) | `x ./:2#'tc x`
1108 | [diagonals from columns](matrix.md#diagonals-from-columns) | `(neg til 5)rotate'x`
1109 | [columns from diagonals](matrix.md#columns-from-diagonals) | `(til 5)rotate'x`
1110 | [add vector y to main diagonal of x](matrix.md#add-vector-y-to-main-diagonal-of-x) | `@'[x;tc x;+;y]`
1111 | [extend distance table to next leg](matrix.md#extend-distance-table-to-next-leg) | `x('[min;+])\:x`
1112 | [extend a transitive binary relation](matrix.md#extend-a-transitive-binary-relation) | `x('[any;&])\:x`
1113 | [first column as a matrix](matrix.md#first-column-as-a-matrix) | `x[;enlist 0]`
1114 | [value of two-by-two determinant](matrix.md#value-of-two-by-two-determinant) | `(-)over(x 0)*reverse x 1`
1115 | [Shur product](matrix.md#shur-product) | `((last shape x)#x) * (first shape y)#'y`
1116 | [Shur sum](matrix.md#shur-sum) | `((last shape x)#x) + (first shape y)#'y`



## Miscellaneous

new | description | phrase
---:|-------------|-------
1200 | [zero items of x not flagged by y](misc.md#zero-items-of-x-not-flagged-by-y) | `x*y`
1201 | [zero items of x not in y](misc.md#zero-items-of-x-not-in-y) | `x*x in y`
1202 | [zero items of x not in y](misc.md#zero-items-of-x-not-in-y) | `y*y in x`
1203 | [replace items of y flagged by x with 1](misc.md#replace-items-of-y-flagged-by-x-with-1) | `y xexp not x`
1204 | [replace items of y flagged by x with g](misc.md#replace-items-of-y-flagged-by-x-with-g) | `@[y;where x;:;g]`
1205 | [replace items of x with value y\[0\] with y\[1\]](misc.md#replace-items-of-x-with-value-y0-with-y1) | `@[x;where x=y 0;:;y 1]`
1206 | [replace first item of x with y](shape.md#replace-first-item-of-x-with-y) | `@[x;0;:;y]`
1207 | [replace last item of x with y](shape.md#replace-last-item-of-x-with-y) | `@[x;-1+count x;:;y]`
1208 | [limiting x between l and h, inclusive](misc.md#limiting-x-between-l-and-h-inclusive) | `l|h&x`
1209 | [change sign of y where x is 1](misc.md#change-sign-of-y-where-x-is-1) | `x*1 -1 y`
1210 | [apply f over all of x](misc.md#apply-f-over-all-of-x) | `(f//)x`
1211 | [arithmetic precision of system in decimals](misc.md#arithmetic-precision-of-system-in-decimals) | `reverse[string 10 xlog 3]?"."`
1212 | [avoid parentheses using reverse](misc.md#avoid-parentheses-using-reverse) | `reverse 1,count x`
1213 | [count occurrences of x in y](misc.md#count-occurrences-of-x-in-y) | `sum y=x`
1214 | [count of x between endpoints (l,h)](misc.md#count-of-x-between-endpoints-lh) | `sum raze (x<h)&x>l`
1215 | [cyclic counter](misc.md#cyclic-counter) | `1+(1+til x)mod y`
1216 | [insert x in y after index g](misc.md#insert-x-in-y-after-index-g) | `y[til g+1],x,(g+1)_y`
1217 | [insert row x in matrix y after row g](misc.md#insert-row-x-in-matrix-y-after-row-g) | `(y,enlist x)iasc(tc y),g`
1218 | [move x into first quadrant](misc.md#move-x-into-first-quadrant) | `{x-min x}each x`
1219 | [name variable according to x](misc.md#name-variable-according-to-x) | ``(`$x)set y``
1220 | [y items selected with replacement from til x](misc.md#y-items-selected-with-replacement-from-til-x) | `y?x`
1221 | [y objects selected without replacement from til x](misc.md#y-objects-selected-without-replacement-from-til-x) | `neg[y]?x`
1222 | [y-shaped array of numbers from x\[0\] to x\[1\]-1](misc.md#y-shaped-array-of-numbers-from-x0-to-x1-1) | `y#x[0]+prd[y]?x[1]-x[0]`
1223 | [randomize the random seed](misc.md#randomize-the-random-seed) | `\S x`
1224 | [remove y from x](misc.md#remove-y-from-x) | `x except y`
1225 | [remove every y-th item of x](misc.md#remove-every-y-th-item-of-x) | `x where 0<(1+tc x)mod 3`
1226 | [remove every second item](misc.md#remove-every-second-item) | `x where(count x)#0 1`
1227 | [remove leading, multiple and trailing ys from x](misc.md#remove-leading-multiple-and-trailing-ys-from-x) | `a[0]_x where not a and 1 rotate a:x=y` 
1228 | [range; nub; remove duplicates](misc.md#range-nub-remove-duplicates) | ` distinct x`
1229 | [right to left scan](misc.md#right-to-left-scan) | `reverse(y\)reverse x`
1230 | [y where x is 0](misc.md#y-where-x-is-0) | `x+y*x=0`
1231 | [select from y according to sign of x](misc.md#select-from-y-according-to-sign-of-x) | `y 1+signum x`
1232 | [select every y-th item of y](misc.md#select-every-y-th-item-of-y) | `x where 0=(1+tc x)mod 3`
1233 | [items of x divisible by y](misc.md#items-of-x-divisible-by-y) | `x where 0=x mod y`
1234 | [select from g based on index of x in y](misc.md#select-from-g-based-on-index-of-x-in-y) | `g y?x`
1235 | [select x or y depending on g](misc.md#select-x-or-y-depending-on-g) | `g'[x;y]`
1236 | [selection by encoded list](misc.md#selection-by-encoded-list) | `2 vs x`
1237 | [drop first, suffix 0](misc.md#drop-first-suffix-0) | `1_x,0`
1238 | [drop last, prefix 0](misc.md#drop-last-prefix-0) | `-1_0,x`
1239 | [shift x right y, fill 0](misc.md#shift-x-right-y-fill-0) | `(y#0),neg[y]_x`
1240 | [shift x left y, fill 0](misc.md#shift-x-left-y-fill-0) | `(y _ x),y#0`
1241 | [rotate rows left](misc.md#rotate-rows-left) | `y rotate x`
1242 | [rotate rows right](misc.md#rotate-rows-right) | `neg[y]rotate x`
1243 | [streak of numbers with same sign](misc.md#streak-of-numbers-with-same-sign) | `{1+(x;0)y}\[1;]differ signum x`
1244 | [sum items of y by ordered codes g in x](misc.md#sum-items-of-y-by-ordered-codes-g-in-x) | `sum each((count[g]#0),y)value group g,x`




## Parts and items

new | description | phrase
---:|-------------|-------
1300 | [vector from items](part.md#vector-from-items) | `raze over x`
1301 | [items from parts](part.md#items-from-parts) | `y _ x`
1302 | [start flags from lengths](part.md#start-flags-from-lengths) | `(til sum x)in sums 0,x` 
1303 | [end flags from lengths](part.md#end-flags-from-lengths) | `(1+til sum x)in sums x`
1304 | [start indexes from flags](part.md#start-indexes-from-flags) | `where x`
1305 | [start indexes from lengths](part.md#start-indexes-from-lengths) | `sums -1_0,x`
1306 | [end indexes from lengths](part.md#end-indexes-from-lengths) | `sums[x]-1`
1307 | [start indexes for x fields of length y](part.md#start-indexes-for-x-fields-of-length-y) | `where 0=(til x*y)mod 3`
1308 | [end indexes for x fields of length y](part.md#end-indexes-for-x-fields-of-length-y) | `-1+sums x#y`
1309 | [lengths from start indexes](part.md#lengths-from-start-indexes) | `1_deltas where x,1`
1310 | [reverse each part](part.md#reverse-each-part) | `x reverse idesc sums tc[x] in y`
1311 | [rotate each part](part.md#rotate-each-part) | `x iasc y+sums y`
1312 | [apply uniform function to each part](part.md#apply-uniform-function-to-each-part) | `raze x each(…)_y` 
1313 | [aggregate each part](part.md#aggregate-each-part) | `x each(…)_y` 
1314 | [maximums of parts flagged by y](part.md#maximums-of-parts-flagged-by-y) | `max each where[y]_x`
1315 | [sums of parts with lengths y](part.md#sums-of-parts-with-lengths-y) | `deltas sums[x] sums[y]-1`
1316 | [sums of parts grouped by y](part.md#sums-of-parts-grouped-by-y) | `value sum each x group y`
1317 | [sums of parts flagged by y](part.md#sums-of-parts-flagged-by-y) | `sum each where[y]_x`
1318 | [running sums of parts flagged by y](part.md#running-sums-of-parts-flagged-by-y) | `raze sums each where[y] _ x` 
1319 | [maximum sum of parts](part.md#maximum-sum-of-parts) | `max 0 (0|+)\x`
1320 | [find part y of parts beginning with first of x](part.md#find-part-y-of-parts-beginning-with-first-of-x) | `x where y=sums x=first x`
1321 | [start indexes of equal-item parts](part.md#start-indexes-of-equal-item-parts) | `where differ x`
1322 | [end indexes of equal-item parts](part.md#end-indexes-of-equal-item-parts) | `where(1_(<>)prior x),1b`
1323 | [running parity of parts flagged by y](part.md#running-parity-of-parts-flagged-by-y) | `raze(sums each where[x] _ y)mod 2`
1324 | [groups of 1s flagged by y](part.md#groups-of-1s-flagged-by-y) | `x&a|(<)prior a:(<>)scan y`
1325 | [insert 0s after each part](part.md#insert-0s-after-each-part) | `raze((0,where y)_y),'(0,x)#'0`
1326 | [or-scan of parts flagged by y](part.md#or-scan-of-parts-flagged-by-y) | `raze maxs each where[y]_ x`
1327 | [and-scan of parts flagged by y](part.md#and-scan-of-parts-flagged-by-y) | `raze mins each where[y]_ x`
1328 | [gth part flagged by y](part.md#gth-part-flagged-by-y) | `(where[y]_x) g`
1329 | [insert y after each item of x](part.md#insert-y-after-each-item-of-x) | `raze x,'y`
1330 | [append y items g to each item of x](part.md#append-y-items-g-to-each-item-of-x) | `raze x,\:y#g`
1331 | [prepend y items of g to each item of x](part.md#prepend-y-items-of-g-to-each-item-of-x) | `raze(y#g),/:x`
1332 | [insert 0 after indexes y](part.md#insert-0-after-indexes-y) | `count[x]>iasc(tc x),y`
1333 | [insert g copies of h after indexes y](part.md#insert-g-copies-of-h-after-indexes-y) | `a:g*count y`<br>`(x,a#h)iasc(tc x),a#count y`
1334 | [insert g copies of h before indexes y](part.md#insert-g-copies-of-h-before-indexes-y) | `a:g*count y`<br>`((a#h),x)iasc(a#y),tc x`





## Polynomials

new | description | phrase
---:|-------------|-------
1400 | [polynomial with roots x](poly.md#polynomial-with-roots-x) | `{(x,0)-y*0,x} over 1,x`
1401 | [polynomial product](poly.md#polynomial-product) | `sum(tc x)rotate'(1_'zm x),'y*/:x`
1402 | [polynomial derivative](poly.md#polynomial-derivative) | `-1 _ x*reverse tc x`
1403 | [value of ascending polynomial coefficients y at points x](poly.md#value-of-ascending-polynomial-coefficients-y-at-points-x) |`x sv\:y`
1404 | [coefficients of best linear fit of points (x,y) (least squares)](poly.md#coefficients-of-best-linear-fit-of-points-xy-least-squares) | `oa:{x xexp/:0 1}`<br/>`cbf:{first(enlist y)lsq oa x}`
1405 | [predicted values of best linear fit (least squares)](poly.md#predicted-values-of-best-linear-fit-least-squares) | `oe:{x xexp\:0 1}`<br/>`pvbf:{(oe x)mmu cbf[x;y]}`
1406 | [coefficients of exponential fit of points (x,y)](poly.md#coefficients-of-exponential-fit-of-points-xy) | `(*). exp(1;x)*cbf[x;log y]`
1407 | [predicted values of exponential fit](poly.md#predicted-values-of-exponential-fit) | `exp pvbf[x;log y]`
1408 | [G-degree polynomial fit of points (x,y)](poly.md#g-degree-polynomial-fit-of-points-xy) | `a:x xexp/:til g+1`<br/>`b:first(enlist y)lsq a`<br/>`reverse b`
1409 | [extrapolated value of abscissa x and ordinate y at g](poly.md#extrapolated-value-of-abscissa-x-and-ordinate-y-at-g) | `a:x xexp/:reverse tc x`<br/>`b:(enlist y) lsq a`<br/>`g sv raze b`
1410 | [y-th moment of x](poly.md#y-th-moment-of-x) | `c:count x`<br/>`(sum(x-(sum x)%c)xexp y)%c`




## Rank

new | description | phrase
---:|-------------|-------
1500 | [rank of an array (number of dimensions)](rank.md#rank-of-an-array) | `depth x`
1501 | shape of an array | `shape:{$[0=d:depth x; 0#0j; d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}`
1502 | [atom from 1-item vector](rank.md#atom-from-1-item-vector) | `first x`
1503 | [vector from array](rank.md#vector-from-array) | `(raze/)x`
1504 | [vector from column y of matrix](rank.md#vector-from-column-y-of-matrix) | `x[;y]`
1505 | [1-row matrix from vector](rank.md#1-row-matrix-from-vector) | `enlist x`
1506 | [1-row matrix from atom or vector](rank.md#1-row-matrix-from-atom-or-vector) | `{$[0<type x;(1,count x)#x;1 1#x]}`
1507 | [2-row matrix from two vectors](rank.md#2-row-matrix-from-two-vectors) | `(x;y)`
1508 | [y-row matrix from vector x](rank.md#y-row-matrix-from-vector-x) | `y#enlist x`
1509 | [1-column matrix from vector](rank.md#1-column-matrix-from-vector) | `1#'x`
1510 | [2-column matrix from two vectors](rank.md#2-column-matrix-from-two-vectors) | `x,'y`
1511 | [2-column matrix from vector](rank.md#2-column-matrix-from-vector) | `2 cut x,(count[x]mod 2)#" "`
1512 | [x-column matrix from vector y](rank.md#x-column-matrix-from-vector-y) | `x#'y`
1513 | [matrix with diagonal x](rank.md#matrix-with-diagonal-x) | `x*{x=/:\:x}tc x`
1514 | [increase rank of y to rank of x](rank.md#increase-rank-of-y-to-rank-of-x) | `(depth[x]-depth y)enlist/y`



## Shape

new | description | phrase
---:|-------------|-------
1600 | [conform table x rows to list y](shape.md#conform-table-x-rows-to-list-y)| `s:(count y),count first x`<br/>`s#(raze x),(prd s)#0`
1601 | [conform table x columns to list y](shape.md#conform-table-x-columns-to-list-y) | `a:(count each(x;y))#0`<br/>`a[;til count first x]:x`
1602 | [empty vector](shape.md#empty-vector) | `()`
1603 | [y cyclic repetitions of vector x](shape.md#y-cyclic-repetitions-of-vector-x) | `(y*count x)#x`
1604 | [array with shape of y and x as its rows](shape.md#array-with-shape-of-y-and-x-as-its-rows) | `count[y]#enlist x`
1605 | [replicate a dimension of `rank`-3 array x y-fold](shape.md#replicate-a-dimension-of-rank-3-array-x-y-fold) | `x[;raze(y#1)*\:til(shape x)1;]`
1606 | [replicate y x times](shape.md#replicate-y-x-times) | `x#y`
1607 | [join atom to each list item](shape.md#join-atom-to-each-list-item) | `x,'y`
1608 | [append y at the bottom of matrix x](shape.md#append-y-at-the-bottom-of-matrix-x) | `x,enlist y`
1609 | [fill x to length y with x’s last item](shape.md#fill-x-to-length-y-with-xs-last-item) | `y#x,y#last x`
1610 | [append empty row on matrix](shape.md#append-empty-row-on-matrix) | `flip(flip x),'" "`
1611 | [count items](shape.md#count-items) | `count x`
1612 | [count atoms](shape.md#count-atoms) | `count raze over x`
1613 | [first atom in x](shape.md#first-atom-in-x) | `(first/)x`
1614 | [count rows in matrix x](shape.md#count-rows-in-matrix-x) | `count x`
1615 |[count columns in matrix x](shape.md#count-columns-in-matrix-x) | `count first x`
1616 | [count columns in array x](shape.md#count-columns-in-array-x) | `last shape x`
1617 | depth (rank) of an array | [`phrases.q`](phrases.q)
1618 | shape of an array | [`phrases.q`](phrases.q)
1619 | [all axes of rectangular array x](shape.md#all-axes-of-rectangular-array-x) | `til depth x`
1620 | [drop first y rows from top of matrix x](shape.md#drop-first-y-rows-from-top-of-matrix-x) | `y _ x`
1621 | [drop first y columns from matrix x](shape.md#drop-first-y-columns-from-matrix-x) | `y _'x`
1622 | [conditional drop of y items from list x](shape.md#conditional-drop-of-y-items-from-list-x) | `(y*g)_ x`
1623 | [conditional drop of last item of list x](shape.md#conditional-drop-of-last-item-of-list-x) | `(neg g)_x`
1624 | [remove columns y from x](shape.md#remove-columns-y-from-x) | `s:til each shape x`<br/>`x . (-1_s),enlist(last s)except y`
1625 | [transpose matrix x on condition y](shape.md#transpose-matrix-x-on-condition-y) | `y flip/x`
1626 | [transpose planes of three-dimensional x](shape.md#transpose-planes-of-three-dimensional-x) | `flip each x`
1627 | [tree from depth;value](shape.md#tree-from-depthvalue) | `tdv:{[d;v](1#v),(c _ d-1)tdv'(c:where 1=d)_ v}`
1628 | [depth from tree](shape.md#depth-from-tree) | `dt:{0,/1+dt'[1_ x]}`
1629 | [value from tree](shape.md#value-from-tree) | `vt:{(1#x),/vt each 1_ x}`
1630 | [list from atom or list](shape.md#list-from-atom-or-list) | `(),x`


## Sort and merge

new | description | phrase
---:|-------------|-------
1700 | [ordinals (ranking, all different)](sort.md#ordinals-ranking-all-different) | `idesc idesc x`
1701 | [ordinals (ranking, shareable)](sort.md#ordinals-ranking-shareable) | `asc[x]?x`
1702 | [choose grading direction](sort.md#choose-grading-direction) | `x iasc x*1 -1[y]`
1703 | grade up x according to key y | `x iasc y?x`
1704 | [playing order of x ranked players](sort.md#playing-order-of-x-ranked-players) | `f:1+2 sv reverse tt neg floor neg 2 xlog x`<br/>`f*f<=x`
1705 | [sort x](sort.md#sort-x) | `asc x`, `desc x`
1706 | [sort y on x](sort.md#sort-y-on-x) | `y iasc x`
1707 | [sort rows of x on column y](sort.md#sort-rows-of-x-on-column-y) | `x iasc x[;y]`
1708 | [sort ascending indexes x according to data y](sort.md#sort-ascending-indexes-x-according-to-data-y) | `x iasc y x`
1709 | [move flagged items to one end](sort.md#move-flagged-items-to-one-end) | `x idesc y`
1710 | [sort y by value into x classes](sort.md#sort-y-by-value-into-x-classes) | `value asc y group x xrank y`
1711 | [which class of y x belongs to](sort.md#which-class-of-y-x-belongs-to) | `-1+sum x>/:y`
1712 | [assign x to one of y classes of width h, starting with g](sort.md#assign-x-to-one-of-y-classes-of-width-h-starting-with-g) | `a:x where (x>=g)&x<g+y*h`<br/>`@[;0;1_](g,a){x asc key x}group floor(g,a)%h`
1713 | [merge x y by g](sort.md#mesh) | `(x,y)[iasc idesc g]`
1714 | [mesh: merge x y z under control of g](sort.md#mesh) | `(x,y,z)rank g`
1715 | [merge items from x and y alternately](sort.md#merge-items-from-x-and-y-alternately) | `raze x,'y`
1716 | [ripple shuffle](sort.md#ripple-shuffle) | `x iasc idesc count[x]#0 1`




## Statistics

new | description | phrase
---:|-------------|-------
1800 | [maximum](stat.md#maximum) | `max x`
1801 | [non-negative maximum](stat.md#non-negative-maximum) | `max 0,x`
1802 | [maximum of x with weights y](stat.md#maximum-of-x-with-weights-y) | `max x*y`
1803 | minimum | `min x`
1804 | [minimum of x with weights y](stat.md#minimum-of-x-with-weights-y) | `min x*y`
1805 | [average (mean)](stat.md#average-mean) | `avg x`
1806 | [average (mean) of x weighted by y](stat.md#average-mean-of-x-weighted-by-y) | `y wavg x`
1807 | median of x | `med x`
1808 | [standard deviation](stat.md#standard-deviation) | `dev x`
1809 | [variance (dispersion)](stat.md#variance-dispersion) | `var x`
1810 | [normal deviates from interval (0,1)](stat.md##normal-deviates-from-interval-01) | `x?1.`
1811 | [running sum](stat.md#running-sum) | `sums x`
1812 | [moving sum](stat.md#moving-sum) | `y msum x`



## Strings

new | description | phrase
---:|-------------|-------
1900 | [alphabetic comparison](string.md#alphabetic-comparison) | `x<y`
1901 | [remove blanks](string.md#remove-blanks) | `x except " "`
1902 | [remove trailing blanks](string.md#remove-trailing-blanks) | `(neg reverse[x=" "]?0b)_ x`
1903 | [remove leading blanks](string.md#remove-leading-blanks) | `x where maxs x<>" "`
1904 | [remove leading and trailing blanks](string.md#remove-leading-and-trailing-blanks) | `x{y _ x}/1 -1*(" "=1 reverse\x)?'0b`
1905 | [collapse multiple blanks](string.md#collapse-multiple-blanks) | `x where 1b,1_(or)prior" "<>x`
1906 | [move blanks to end](string.md#move-blanks-to-end) | `x iasc x=" "`
1907 | [justify right](string.md#justify-right) | `neg[(reverse[x]=" ")?0b]rotate x`
1908 | [center text x in line of width y](string.md#center-text-x-in-line-of-width-y) | `neg[floor(y-count x)%2]rotate y#x,y#" "`
1909 | [insert spaces in text](string.md#insert-spaces-in-text) | `-1_raze x,'" "`
1910 | [conditional text](string.md#conditional-text) | `$[x;"true";"false"]`
1911 | double quotes | `ssr[x;"\"";"\"\""]`
1912 | [remove leading zeros](string.md#remove-leading-zeros) | `((x="0")?0b) _ x`
1913 | [remove punctuation characters](string.md#remove-punctuation-characters) | `x except PUN`
1914 | [ordinal of word in x pointed at by y](string.md#ordinal-of-word-in-x-pointed-at-by-y) | `sum not y<1+where x=" "`
1915 | [find start of string x in string y](string.md#find-start-of-string-x-in-string-y) | `y ss x`
1916 | [find first occurrence of string x in string y](string.md#find-first-occurrence-of-string-x-in-string-y) | `first y ss x`
1917 | [locate quotes and text between them](string.md#locate-quotes-and-text-between-them) | `(or)prior(<>)scan x="\""`
1918 | [locate text between quotes](string.md#locate-text-between-quotes) | `(and)prior(<>)scan x="\""`
1919 | [depth of parentheses](string.md#depth-of-parentheses) | `sums({x-0b,-1_y}/)"()"=\:x`
1920 | [first word in string x](string.md#first-word-in-string-x) | 
1921 | [insert blank in y after flag in x](string.md#insert-blank-in-y-after-flag-in-x) | `raze y,'x#'" "`
1922 | [insert x\[i\] blanks after y\[g\[i\]\]](string.md#insert-xi-blanks-after-ygi) | `raze((0,1+g)_y),'(x,0)#'" "`
1923 | [spread flagged field heads right](string.md#spread-flagged-field-heads-right) | `x raze(count each a _ x)#'a:where y`



## Temporal

new | description | phrase
---:|-------------|-------
2000 | [is year x a leap year?](temp.md#is-year-x-a-leap-year) | `ly:{sum[0=x mod\:4 100 400]mod 2}`
2001 | [days in month x of Gregorian year y](temp.md#days-in-month-x-of-gregorian-year-y) | `$[x=2;28+ly y;(0,12#7#31 30)x]`
2002 | [date in ascending format](temp.md#date-in-ascending-format) | `"/"sv reverse 0 4 6_ x`
2003 | [current time of 12-hour clock](temp.md#current-time-of-12-hour-clock) |`p:x>11:59:59`<br/>`string[x-43200*p]," ","AP"[p],"M"`
2004 | [current date, American format](temp.md#current-date-american-format) | `"/"sv string 1 rotate parse ssr[;".";" "] string x`


## Tests

new | description | phrase
---:|-------------|-------
2100 | [do ranges of x and y match?](test.md#do-ranges-of-x-and-y-match) | `(~)over('[asc;distinct])each(x;y)`
2101 | [quick membership for non-negative integers](test.md#quick-membership-for-non-negative-integers) | `@[(1+max x,y)#0;y;:;1]x`
2102 | [do x and y have items in common?](test.md#do-x-and-y-have-items-in-common) | `any x in y`
2103 | [is x a subset of y?](test.md#is-x-a-subset-of-y) | `all x in y`
2104 | [does x match y?](test.md#does-x-match-y) | `x~y`
2105 | [do x and y match?](test.md#do-x-and-y-match) | `x~y`
2106 | [pairwise match](test.md#pairwise-match) | `1 rotate(~)prior x`
2107 | [are x and y permutations of each other?](test.md#are-x-and-y-permutations-of-each-other) | `(asc x)~asc y`
2108 | [is matrix x symmetric?](test.md#is-matrix-x-symmetric) | `x~flip x`
2109 | [is matrix x antisymmetric?](test.md#is-matrix-x-antisymmetric) | `x~neg flip x`
2110 | [is x upper triangular?](test.md#is-x-upper-triangular) | `zm[x]~x*{x>\:x}tc x`
2111 | [is x lower triangular?](test.md#is-x-lower-triangular) | `zm[x]~x*{x<\:x}tc x`
2112 | [is y a row of x?](test.md#is-y-a-row-of-x) | `y in x`
2113 | [are items integral?](test.md#are-items-integral) | `x=floor x`
2114 | [are items even?](test.md#are-items-even) | `not x mod 2`
2115 | [is range of x 1?](test.md#is-range-of-x-1) | `1=count distinct x`
2116 | [are items 1s and 0s only (boolean)?](test.md#are-items-1s-and-0s-only) | `{t:abs type x; $[t~1;1b;t in 5 6 7 9h;all x in t$0 1;0b]}`
2117 | [are items in interval \[y\)?](test.md#are-items-in-interval-y) | `(</')x<\:y`
2118 | [are items integers in interval \[g,h)?](test.md#are-items-integers-in-interval-gh) | `(x=floor x)&(</)x<g,h`
2119 | [are items in interval \[ y \)?](test.md#are-items-in-interval-y) | `(<)over x<y`
2120 | [are items in interval \( y \]?](test.md#are-items-in-interval-y) | `(<)over x<=y`
2121 | [are items in interval ( y\[0\],y\[1\] )](test.md#are-items-in-interval-y0y1) | `(<)over x<y+0 1`
2122 | [are items in interval \[ y\[0\],y\[1\]](test.md#are-items-in-interval-y0y1_1) | `(<)over x<y+1 0`
2123 | [are items in ascending order?](test.md#are-items-in-ascending-order) | `all(>=)prior x`
2124 | [are items unique?](test.md#are-items-unique) | `x~distinct x`
2125 | [does item differ from previous one?](test.md#does-item-differ-from-previous-one)
2126 | [does item differ from next one?](test.md#does-item-differ-from-next-one) | `1_ differ x`
2127 | [is x a permutation?](test.md#is-x-a-permutation) | `x~rank x`
2128 | [is count of atoms 1?](test.md#is-count-of-atoms-1) | `1=count raze over x`
2129 | [is x a vector?](test.md#is-x-a-vector) | `0<type x`
2130 | [is x empty?](test.md#is-x-empty) | `0=count raze over x`



## Text

new | description | phrase
---:|-------------|-------
2200 | [left-justify fields of length y to length g](text.md#left-justify-fields-of-length-y-to-length-g) | `raze g#/:((sums 0,-1_y)_x),\:g#" "`
2201 | [right-justify fields of length y to length g](text.md#right-justify-fields-of-length-y-to-length-g) | `raze(neg g)#/:(g#" "),/:(sums 0,-1_y) _ x`
2202 | [collapse multiple occurrences](text.md#collapse-multiple-occurrences) | `x where 1 rotate(or)prior a:x<>y`
2203 | [comma-separated list from matrix](text.md#comma-separated-list-from-matrix) | `","sv x`
2204 | [rows starting with y](text.md#rows-starting-with-y) | `x where x[;tc y]~\:y`
2205 | [rows with items different from y](text.md#rows-with-items-different-from-y) | `max y<>flip x`
2206 | [frame character matrix](text.md#frame-character-matrix) | `flip"-",'(flip"|",'x,'"|"),'"-"`
2207 | [insert y "*" after "="](text.md#insert-y-after) |`g:where x="="`<br>`raze((0,1+-1_ g)_x),\:y#"*"`
2208 | [matrix from string at parts flagged by x](text.md#matrix-from-string-at-parts-flagged-by-x) | `a:(where y)_x`<br/>`a,'#'[;" "]max[b]-b:count each a` 
2209 | [remove duplicate rows](text.md#remove-duplicate-rows) | `distinct x`
2210 | [variable length lines](text.md#variable-length-lines) | `(x;y;z)`
2211 | [collapse whitespace](text.md#collapse-whitespace) | `x where{x|1_x,1b}max" "<>flip x`
2212 | [remove blank rows](text.md#remove-blank-rows) | `x where max" "<>flip x`
2213 | [remove leading blank rows](text.md#remove-leading-blank-rows) | `((min each x=" ")?0b)_ x`
2214 | [remove trailing blank rows](text.md#remove-trailing-blank-rows) | `(neg sum mins reverse(and/)each x=" ")_ x`
2215 | [remove blank columns](text.md#remove-blank-columns) | `x where max" "<>x`
2216 | [remove leading blank columns](text.md#remove-leading-blank-columns) | `sum[mins min x=" "]_'x`
2217 | [remove trailing blank columns](text.md#remove-trailing-blank-columns) | `neg[sum mins reverse min x=" "]_'x`
2218 | [append empty row](text.md#append-empty-row) | `flip(flip x),'" "`
2219 | [insert empty row after row y](text.md#insert-empty-row-after-row-y) | `a:flip(flip x),'" "`<br/>`a rank@[count[a]#1;y+1;+;1]`



