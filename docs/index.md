# Index of phrases





## Arithmetic

# | description | phrase
--:|-------------|-------
374 | [sum a vector](arith.md#sum-a-vector) | `sum x`
372 | [sum columns of matrix](arith.md#sum-columns-of-matrix) | `sum x`
373 | [sum rows of matrix](arith.md#sum-rows-of-matrix) | `sum each x`
150 | [sum items of x given by y](arith.md#sum-items-of-x-given-by-y) | `sum each x value group y`
189, 190 | [add x to each row of y](arith.md#add-x-to-each-row-of-y) | `x+/:y`
192, 193 | [add x to each column of y](arith.md#add-x-to-each-column-of-y) | `x+'y`
406 | [add x to last item of y](arith.md#add-x-to-last-item-of-y) | `@[y;count[y]-1;+;x]`
239 | [sum reciprocal series](arith.md#sum-reciprocal-series) | `sum y%x`
241 | [sum over subsets of x specified by y](arith.md#sum-over-subsets-of-x-specified-by-y) | ==FIXME==
242, 246 | [sum squares of x](arith.md#sum-squares-of-x) | `sum x*x`
369 | [alternating sum](arith.md#alternating-sum) | `sum x*(count x)#1 -1`
301 | [alternating sum series](arith.md#alternating-sum-series) | `sums x*(count x)#1 -1`
475 | [increase absolute value without sign change](arith.md#increase-absolute-value-without-sign-change) | `x+y*(x=0)+signum x`
583, 621 | [vector and its negative](arith.md#vector-and-its-negative) | `1 -1*/:x`
204 | [numeric array and its negative](arith.md#numeric-array-and-its-negative) |  `x,''neg x`
442 | [first difference](arith.md#first-difference) | `deltas x`
383, 420 | [pairwise difference](arith.md#pairwise-difference) | `1_neg deltas x`
608 | [zeroing an array](arith.md#zeroing-an-array) | `x*0`
368 | [product](arith.md#product) | `prd x`
199 | [multiplication table of order x](arith.md#multiplication-table-of-order-x) | `{x*\:x}1+til x`
477 | [square x retaining sign](arith.md#square-x-retaining-sign) | `x*abs x`
516 | [multiply each column of x by y](arith.md#multiply-each-column-of-x-by-y) | `x*y`
611 | [multiply each row of x by vector y](arith.md#multiply-each-row-of-x-by-vector-y) | `x*\:y`
528 | [vector (cross) product](arith.md#vector-cross-product) | `(-).(*/')(1 neg\1 -1)rotate''2 2#(x;y)`
367 | [alternating product](arith.md#alternating-product) | `prd x xexp(count x)#1 -1`
187 | [direct matrix product](arith.md#direct-matrix-product) | `flip each x*\:\:y`
240 | [matrix product](arith.md#matrix-product) | `x mmu y`
243 | [dot product of vectors](arith.md#dot-product-of-vectors) | `sum x*y`
244 | [product over subsets of x specified by y](arith.md#product-over-subsets-of-x-specified-by-y) | `x('[prd;xexp])\:y`
572 | [divide by 0](arith.md#divide-by-0) | `not[z]*y%x+z:x=0`
164, 468 | [divisors](arith.md#divisors) | `where 0=x mod/:til 1+x`
155 | [greatest common divisor](arith.md#greatest-common-divisor) | `1+last where min each 0=x mod/:1+til min x`
419 | [pairwise ratios](arith.md#pairwise-ratios) | `1_ratios x`
183 | [maximum table](arith.md#maximum-table) | `{x|\:x}til x`
–   | [minimum table](arith.md#minimum-table) | `{x&\:x}til x`
558 | [consecutive integers from x to y](arith.md#consecutive-integers-from-x-to-y) | `x+til 1+y-x`
557 | [arithmetic progression of y numbers from x with step g](arith.md#arithmetic-progression-of-y-numbers-from-x-with-step-g) | `x+g*til y`
451 | [arithmetic progression from x to y with step g](arith.md#arithmetic-progression-from-x-to-y-with-step-g) | `x+g*til 1+ floor (y-x)%g`
175 | [primes to n](arith.md#primes-to-n) | `a where not a in distinct raze a*/:\:a:2_ til x`
302 | [x first triangular numbers](arith.md#x-first-triangular-numbers) | `sums til x`
260 | [first 10 figurate numbers of order x](arith.md#first-10-figurate-numbers-of-order-x) | `x+\/10#1`
478 | [fractional part](arith.md#fractional-part) | `x mod 1`
62 | [integer and fractional parts of positive x](arith.md#integer-and-fractional-parts-of-positive-x) | `f,'x-f:floor x`
465 | [magnitude of fractional part](arith.md#magnitude-of-fractional-part) | `a-floor a:abs x`
476 | [fractional part with sign](arith.md#fractional-part-with-sign) | `signum[x]*abs[x]mod 1`
459 | [leading digit of numeric code abbb](arith.md#leading-digit-of-numeric-code-abbb) | `floor x%1000`
479 | [last part of abbb](arith.md#last-part-of-abbb) | `x mod 1000`
331 | [identity for floating-point maximum, negative infinity](arith.md#identity-for-floating-point-maximum-negative-infinity) | `max 0#0.0`
337 | [identity for floating point minimum, positive infinity](arith.md#identity-for-floating-point-minimum-positive-infinity) | `min 0#0.0`



## Casting and representation

# | description | phrase
--:|-------------|-------
45 | [binary from integer](cast.md#binary-from-integer) | `2 vs x`, `0b vs x`, `0x0 vs x` 
84 | [integer from binary](cast.md#integer-from-binary) | `2 sv x`
49 | [hexadecimals from integers](cast.md#hexadecimal-from-integer) | `HEX 16 vs x`
56 | [hexadecimals from decimal characters](cast.md#hexadecimal-from-decimal-characters) | `HEX 16 vs "i"$x`
53 | [decimal digits from integer](cast.md#decimal-digits-from-integer) | `10 vs x`
54 | [integer y in base x](cast.md#integer-y-in-base-x) | `x vs y`
63 | [integer x in base 10 100 1000](cast.md#integer-x-in-base-10-100-1000) | `10 100 1000 vs x`
75 | [integer from hexadecimal](cast.md#integer-from-hexadecimal) | `16 sv HEX?x`
57 | [vector from date](cast.md#vector-from-date) | `100000 100 100 vs x`
72 | [integer from date](cast.md#integer-from-date) |`"I"$ string[x] except "."`
78, 95 | [number from string](cast.md#number-from-string)| `parse x`
94 | [number from string x, default y](cast.md#number-from-string-x-default-y) | `parse $[x~"";y;x]`
561 | [numeric codes from string](cast.md#numeric-codes-from-string) | `"i"$x`
342 | [integer from Roman](cast.md#integer-from-roman) | `a:0,1000 500 100 50 10 5 1 "MDCLXVI"?x`<br/>`sum floor a*-1 xexp a<1 rotate a`
93 | [numbers from text matrix](cast.md#numbers-from-text-matrix) | `parse each x`
99 | [numbers from evaluating rows of text matrix](cast.md#numbers-from-evaluating-rows-of-text-matrix) | `raze('[eval;parse])each x`



## Execution

# | description | phrase
--:|-------------|-------
96, 115, 116, 117 | [case structure](exec.md#case-structure) | `$[c0;t0;c1;t1;c2;t2;f]`
493 | [choose x or y depending on flag g](exec.md#choose-x-or-y-depending-on-flag-g) | `$[g;x;y]`
533 | [reverse x on condition y](exec.md#reverse-x-on-condition-y) | `y reverse/x`
603 | [conditional change of sign](exec.md#conditional-change-of-sign) | `y*1 -1 x`
151 | [efficient execution of f x where x has repeated values](exec.md#efficient-execution-of-f-x-where-x-has-repeated-values) | `u:distinct x`<br/>`(f u)u?x`
629 | [error to stop execution](exec.md#error-to-stop-execution) | ``'`stop``
98 | [execute rows of character matrix](exec.md#execute-rows-of-character-matrix) | `('[eval;parse])each x`
101 | [sum numbers in character matrix](exec.md#sum-numbers-in-character-matrix) | `sum parse " " sv x`




## Finance

# | description | phrase
--:|-------------|-------
77 | [present value of cash flows c at times t and discount rate d](fin.md#present-value-of-cash-flows)| `sum c*d xexp t`
82 | [future value of cash flows](fin.md#future-value-of-cash-flows) | `sum x* (1+y%100) xexp reverse tc x`
146 | [compound interest for principals y at percentages g for periods x](fin.md#compound-interest-for-principals-y-at-percentages-g-for-periods-x) | `y*\:(1+g%100)xexp\:x`
186 | [annuity coefficient for x periods at interest rate y%](fin.md#annuity-coefficient-for-x-periods-at-interest-rate-y) | `y%/:100*flip 1-(1+y%100)xexp\:neg x`
286 | [fifo stock y decremented with x units](fin.md#fifo-stock-y-decremented-with-x-units) | `1_deltas 0,0|(sums y)-x`
1001 | [payback](fin.md#) | `C:prds(count W)#1+R`<br/>`C*B-sums W%(count W)#T _ 1,C`
1002 | [round summands](fin.md#round-summands) | `i:floor Y:y%x`<br/>`a:{(floor .5+/x)#idesc x}Y-i`<br/>`x*@[i;a;+;1]`


## Find

# | description | phrase
--:|-------------|-------
562 | [y in x](find.md#y-in-x) | `x?y`
41, 280, 506 | [flags](find.md#flags) | `where x`
495, 503 | [all occurrences of y in x](find.md#all-occurrences-of-y-in-x)| `where x in y`
338 | [first occurrence in x of y](find.md#first-occurrence-in-x-of-y) | `x?y`
23, 330 | [first occurrence of maximum](find.md#first-occurrence-of-maximum) | `x?max x`
22, 336 | [first occurrence of minimum](find.md#first-occurrence-of-minimum) | `x?min x`
471 | [first occurrence of g in x (circularly) after y](find.md#first-occurrence-of-g-in-x-circularly-after-y) | `q)mod[;count x] y+(y rotate x)?g`
530, 531 | [last occurrence of y in x](find.md#last-occurrence-of-y-in-x) | `count[x]-1+reverse[x]?y`
532 | [last occurrence of y in x, counted from the rear](find.md#last-occurrence-of-y-in-x-counted-from-the-rear) | `reverse[x]?y`
143 | [distinct items](find.md#distinct-items) | `value group x`
551 | [first differing item of x and y](find.md#first-differing-item-of-x-and-y) | `first where x<>y`
552 | [items of x not in y](find.md#items-of-x-not-in-y) | `not x in y`
182 | [consecutive repeated elements](find.md#consecutive-repeated-elements) | `where differ x`
207 | [rows of matrix y in matrix x](find.md#rows-of-matrix-y-in-matrix-x) | `x?y`
55 | [items of y in array x](find.md#items-of-y-in-array-x) | `shape[x] vs where raze[x] in raze y`
153 | [rows of y in in corresponding rows of x](find.md#rows-of-y-in-in-corresponding-rows-of-x) | `x?'y`
282 | [first blank](find.md#first-blank) | `x?" "`
79, 217 | [last non-blank](find.md#last-non-blank) | `(" "=reverse x)?0b`
147, 219 | [string x in string y](find.md#string-x-in-string-y) | `z:where y=first x`<br/>`z where x~/:y z+\:tc x`
359 | [blank rows](find.md#blank-rows) | `all flip x=" "`
499 | [rows of x starting with item of y](find.md#rows-of-x-starting-with-item-of-y) | `x where x[;0]in y`


## Flags

# | description | phrase
--:|-------------|-------
370 | [count of 1s](flag.md#count-of-1s) | `sum x`
566, 624 | [zero all items](flag.md#zero-all-items) | ` x&0`
529 | [flags at y for vector x](flag.md#flags-at-y-for-vector-x) | `(tc x) in y`
165, 540, 543 | [vector length x with 1s at y](flag.md#vector-length-x-with-1s-at-y) | `(til x) in y`
539 | [vector length y with 0s at x](flag.md#vector-length-y-with-0s-at-x) | `@[y#1;x;:;0]`
169, 172, 407 | [x 1s followed by (y-x) 0s](flag.md#x-1s-followed-by-y-x-0s) | `x>til y`
168 | [x 0s followed by (y-x) 1s](flag.md#x-0s-followed-by-y-x-1s) | `x<=til y`
167 | [x 1s preceded by (y-x) 0s](flag.md#x-1s-preceded-by-y-x-0s) | `(til y)>=y-x`
–   | [x 0s preceded by (y-x) 1s](flag.md#x-0s-preceded-by-y-x-1s) | `(til y)<y-x`
247 | [interlace x\[i\]#1 and y\[i\]#0](flag.md#interlace-xi-1s-and-yi-0s) | `(raze/)flip(x;y)#''1 0`
252 | [x alternate takes of 1s and 0s](flag.md#x-alternate-takes-of-1s-and-0s) | `(count[x]#1 0)where x`
329 | [flags for positive integers in x](flag.md#flags-for-positive-integers-in-x) | `x in til 1+max x`
559 | [first 1 in x](flag.md#first-1-in-x) | `x?1`
438 | [first 1 in x after position y](flag.md#first-1-in-x-after-position-y) | `first a where y<a:where x`
–   | [yth 1 in x](flag.md#yth-1-in-x) | `(sums x)?1`
261 | [first group of 1s](flag.md#first-group-of-1s) | `x and(and)scan x=(or)scan x`
440 | [first 1s in groups of 1s](flag.md#first-1s-in-groups-of-1s) | `1_(>)prior 0,x`
439 | [last 1s in groups of 1s](flag.md#last-1s-in-groups-of-1s) | `1_(<)prior x,0`
512 | [select items of x according to flags in y](flag.md#select-items-of-x-according-to-flags-in-y) | `x[;;where y`
304 | [invert 0s after first 1](flag.md#invert-0s-after-first-1) | `maxs x`
307 | [invert 1s after first 1](flag.md#invert-1s-after-first-1) | `(tc x)=x?1`
308 | [invert 0s after first 0](flag.md#invert-0s-after-first-0) | `tc[x]<>x?0`
306 | [invert 1s after first 0](flag.md#invert-1s-after-first-0) | `mins x`
303 | [smearing 1s between pairs of 1s](flag.md#smearing-1s-between-pairs-of-1s) | `x or(<>)scan x`
305 | [invert fields marked by pairs of 1s](flag.md#invert-fields-marked-by-pairs-of-1s) | `(not x)&(sums x)mod 2`
381 | [invert all but first 1 in group of 1s](flag.md#invert-all-but-first-1-in-group-of-1s) | `x>-1 _ 0,x`
538 | [insert 0 in list of 1s x after indexes y](flag.md#insert-0-in-list-of-1s-x-after-indexes-y) | `raze @[x,\:();y;,;0]`
361 | [simple parity](flag.md#simple-parity) | `(sum x) mod 2`
309 | [running parity](flag.md#running-parity) | `(sums x) mod 2`
570 | [x implies y](flag.md#x-implies-y) | `x<=y`
571 | [x but not y](flag.md#x-but-not-y) | `x>y`
573 | [exclusive or](flag.md#exclusive-or) | `x<>y`
575 | [Kronecker delta of x and y](flag.md#kronecker-delta-of-x-and-y)` x=y`
355 | [none](flag.md#none) | `not any x`
356 | any | `any x`
360 | [all](flag.md#all) | `all x`


## Format

# | description | phrase
--:|-------------|-------
46 | [formatted integers](form.md#formatted-integers) | `flip DEC 10 vs x`
111 | [count of format of x](form.md#count-of-format-of-x) | `('[count;string])`
106 | [leading zeros for positive integers x in field width y](form.md#leading-zeros-for-positive-integers-x-in-field-width-y) | `1_'string x+10 xexp y`
87 | [number of decimals](form.md#number-of-decimals) | `count each 2_'string x mod 1`
149 | [number of decimals in x, maximum y](form.md#number-of-decimals-in-x-maximum-y) | `y&count each 2_'string x mod 1`
456 | [number of positions in nonnegative integer x](form.md#number-of-positions-in-non-negative-integer-x) | `1+floor log10 x+0=x`
452, 455 | [number of positions in integer x](form.md#number-of-positions-in-integer-x) | `1+(x<0)+floor 10 xlog abs x+0=x`
64 | [time hh:mm:ss from integer hhmmss](form.md#time-hhmmss-from-integer-hhmmss) | `":"sv 0 2 4_ string x`
65 | [date yyyy/mm/dd from integer yyyymmdd](form.md#date-yyyymmdd-from-integer-yyyymmdd) | `"/"sv 0 4 6_ string x`
605 | [indexing plotting characters with flags](form.md#indexing-plotting-characters-with-flags) | " X" x
144 | [histogram](form.md#histogram) | `" *"(1+ til max x)<=/:x`
166 | [barchart of integer list x](form.md#barchart-of-integer-list-x)| `" X" reverse til[max x]<\:x`
171 | [horizontal barchart of integers](form.md#horizontal-barchart-of-integers) | `" X" x>\:til max x`
170 | [horizontal barchart of x, normalized to length y](form.md#horizontal-barchart-of-x-normalized-to-length-y) | `" X" (floor x*y%max x)>\:til y`



## Geometry

# | description | phrase
--:|-------------|-------
1011 | [degrees from degrees and minutes](trig.md#degrees-from-degrees-and-minutes) | `sum x%1 60`
133 | [degrees from radians](trig.md#degrees-from-radians) | `57.295779513082323*x`
134 | [radians from degrees](trig.md#radians-from-degrees) | `0.017453292519943295*x`
1010 | [nautical miles from radians](trig.md#nautical-miles-from-radians) | `x*180*60%PI`
1009 | [great circle distance](trig.md#great-circle-distance) | `cos distinct(prd sin x)+(prd cos x)*cos(-/)y`
318 | [area of triangle with sides x (Heron’s rule)](trig.md#area-of-triangle-with-sides-x) | `sqrt prd(sum x%2)-0,x`
129 | arctangent y÷x | `atan y%x`
131 | [complementary angle (arccos sin x)](trig.md#complementary-angle-arccos-sin-x) | `acos sin x`
132 | [rotation matrix for angle x (in radians) counter-clockwise](trig.md#rotation-matrix-for-angle-x-in-radians-counter-clockwise) | `((cos x;neg sin x);(sin x;cos x))`
179 | [contour levels y at points with altitude x](trig.md#contour-levels-y-at-points-with-altitude-x) | `y -1+sum not y>x`



## Indexes

# | description | phrase
--:|-------------|-------
556 | [all indexes of vector x](indexes.md#all-indexes-of-vector-x) | `tc x`
201 | [y-wide sublists of x](indexes.md#y-wide-sublists-of-x) | `y+til count[x]-y-1`
202, 249, 268 | [sublists of length y, starting at x](indexes.md#sublists-of-length-y-starting-at-x) | `x+\:til y`
58 | [all pairs of `til[x]` and `til[y]`](indexes.md#all-pairs-of-tilx-and-tily) | `ap:{x vs til prd x}x,y`
51 | [indexes of an array](indexes.md#indexes-of-an-array) | `ap shape x`
80, 522 | [scattered indexing](indexes.md#scattered-indexing) | `x ./: y`
81 | [raveled index from general index](indexes.md#raveled-index-from-general-index) | `shape[x] sv y`
100 | [index an arbitrary-rank array](indexes.md#index-an-arbitrary-rank-array)| `x . y`



## Mathematics

# | description | phrase
--:|-------------|-------
139 | [Beta function](math.md#beta-function) | ==FIXME==
142 | [number of combinations of n objects taken k at a time](math.md#number-of-combinations-of-n-objects-taken-k-at-a-time) | `fac[n]%fac[n-k]*fac[k]`
135 | [number of permutations of n objects taken k at a time](math.md#number-of-permutations-of-n-objects-taken-k-at-a-time) | `prd(n-k-1)+til k`
1017 | [permutations](math.md#permutations) | `(1 0#x){raze(1 rotate)scan'x,'y}/x`
50 | [connectivity list from connectivity matrix](math.md#connectivity-list-from-connectivity-matrix) | `rc[x;]where raze x`
71 | [connectivity matrix from connectivity list](math.md#connectivity-matrix-from-connectivity-list)| ==FIXME==
148 | [node matrix from connection matrix](math.md#node-matrix-from-connection-matrix)| `b:flip each x=/:1 -1`<br/>`(mmu\:) . "f"$(b;tc x)`
157 | [connection matrix from node matrix](math.md#connection-matrix-from-node-matrix) | `(-/)flip x=/:tc distinct raze x`
1012 | [first y Fibonacci numbers](math.md#fibonacci-numbers) | `y{x,sum -2#x}/0 1`
312 | [maximum separation of items of x](math.md#maximum-separation-of-items-of-x) | `(max x)-min x`
1006 | [partitions of y with no part less than x](math.md#partitions-of-y-with-no-part-less-than-x) | `part:{t:x _ til 1+floor y%2;(raze t,''t part'y-t),y}`
136, 1007 | [Pascal’s triangle](math.md#pascals-triangle) | `x {0+':x,0}\ 1`
1005 | [pointer chasing](math.md#pointer-chasing) | `((r*til p)mod p)\[1]`
1008 | [polygon area](math.md#polygon-area) | `0.5*sum last[x]{(-/)y*reverse x}':x`
363 | [quadraticsolution](math.md#quadratic-solution) | `q:0.5*y+signum[y]*sqrt(y*y)-4*x*z`<br/>`(q%x),z%q`
48 | [saddle-point indices](math.md##saddle-point-indices) | `rc[x;]where raze minmax x`
48a | flag row minimums | `rn:{x=min each x}`
48b | flag column maximums | `cx:{x=\:max x}`
48c | flag minmaxs | `minmax:{(rn x)&cx x}`
48e | row-column indices of ravel-indices y in matrix x | `rc:{(div;mod).\:(y;count first x)}`
262 | [value of saddle point](math.md#value-of-saddle-point) | `raze[x]where raze minmax x`
497 | [set union](math.md#set-union) | `distinct y,x`
498 | [set difference](math.md#set-difference) | `x except y`
500 | [set intersection](math.md#set-intersection) | `x where x in y`
1004 | [range union](math.md#range-union) | `f:{(x b;1 rotate a b:0,where x>1+a:-1 rotate maxs y)}`<br/>`flip f . flip asc x`
137 | [Taylor series](math.md#taylor-series) | `sum y*(x xexp a)%prds 1|a:tc y`
281 | [value of Taylor series with coefficients y at x](math.md#value-of-taylor-series-with-coefficients-y-at-x) | `sum y*prds 1.0,x%1+til(count y)-1`





## Matrixes

# | description | phrase
--:|-------------|-------
514 | [apply to dimension 1 function defined on dimension 0](matrix.md#apply-to-dimension-1-function-defined-on-dimension-0) | `f each x`
52, 59, 60 | [truth table of order x](matrix.md#truth-table-of-order-x) | `2 vs til "j"$2 xexp x`
195 | [upper triangular matrix of order x](matrix.md#upper-triangular-matrix-of-order-x) | `{x<=\:x}til x`
196 | [lower triangular matrix of order x](matrix.md#lower-triangular-matrix-of-order-x) | `{x>=\:x}til x`
197, 582 | [identity matrix of order x](matrix.md#identity-matrix-of-order-x) | `{x=/:x}til x`
198 | [Hilbert matrix of order x](matrix.md#hilbert-matrix-of-order-x) | `reciprocal 1+{x+/:x}til x`
408, 513 | [empty row to start matrix of x columns](matrixes.md#empty-row-to-start-matrix-of-x-columns) | `()`
525, 526 | [main diagonal](matrix.md#main-diagonal) | `x ./:2#'tc x`
398 | [diagonals from columns](matrix.md#diagonals-from-columns) | `(neg til 5)rotate'x`
399 | [columns from diagonals](matrix.md#columns-from-diagonals) | `(til 5)rotate'x`
–   | [add vector y to main diagonal of x](matrix.md#add-vector-y-to-main-diagonal-of-x) | `@'[x;tc x;+;y]`
224 | [extend distance table to next leg](matrix.md#extend-distance-table-to-next-leg) | `x('[min;+])\:x`
230 | [extend a transitive binary relation](matrix.md#extend-a-transitive-binary-relation) | `x('[any;&])\:x`
587 | [first column as a matrix](matrix.md#first-column-as-a-matrix) | `x[;enlist 0]`
313, 314 | [value of two-by-two determinant](matrix.md#value-of-two-by-two-determinant) | `(-)over(x 0)*reverse x 1`
188 | [Shur product](matrix.md#shur-product) | `((last shape x)#x) * (first shape y)#'y`
191 | [Shur sum](matrix.md#shur-sum) | `((last shape x)#x) + (first shape y)#'y`


## Miscellaneous

# | description | phrase
--:|-------------|-------
622 | [zero items of x not flagged by y](misc.md#zero-items-of-x-not-flagged-by-y) | `x*y`
480, 481, 483 | [zero items of x not in y](misc.md#zero-items-of-x-not-in-y) | `x*x in y`
545 | [zero items of x not in y](misc.md#zero-items-of-x-not-in-y) | `y*y in x`
569 | [replace items of y flagged by x with 1](misc.md#replace-items-of-y-flagged-by-x-with-1) | `y xexp not x`
504 | [replace items of y flagged by x with g](misc.md#replace-items-of-y-flagged-by-x-with-g) | `@[y;where x;:;g]`
380, 425 | [replace items of x with value y\[0\] with y\[1\]](misc.md#replace-items-of-x-with-value-y0-with-y1) | `@[x;where x=y 0;:;y 1]`
432 | [replace first item of x with y](shape.md#replace-first-item-of-x-with-y) | `@[x;0;:;y]`
433 | [replace last item of x with y](shape.md#replace-last-item-of-x-with-y) | `@[x;-1+count x;:;y]`
449 | [limiting x between l and h, inclusive](misc.md#limiting-x-between-l-and-h-inclusive) | `l|h&x`
623 | [change sign of y where x is 1](misc.md#change-sign-of-y-where-x-is-1) | `x*1 -1 y`
511 | [apply f over all of x](misc.md#apply-f-over-all-of-x) | `(f//)x`
450 | [arithmetic precision of system in decimals](misc.md#arithmetic-precision-of-system-in-decimals) | `reverse[string 10 xlog 3]?"."`
535 | [avoid parentheses using reverse](misc.md#avoid-parentheses-using-reverse) | `reverse 1,count x`
236, 362 | [count occurrences of x in y](misc.md#count-occurrences-of-x-in-y) | `sum y=x`
145 | [count of x between endpoints (l,h)](misc.md#count-of-x-between-endpoints-lh) | `sum raze (x<h)&x>l`
61 | [cyclic counter](misc.md#cyclic-counter) | `1+(1+til x)mod y`
382 | [insert x in y after index g](misc.md#insert-x-in-y-after-index-g) | `y[til g+1],x,(g+1)_y`
375 | [insert row x in matrix y after row g](misc.md#insert-row-x-in-matrix-y-after-row-g) | `(y,enlist x)iasc(tc y),g`
174 | [move x into first quadrant](misc.md#move-x-into-first-quadrant) | `{x-min x}each x`
88 | [name variable according to x](misc.md#name-variable-according-to-x) | ``(`$x)set y``
122 | [y items selected with replacement from til x](misc.md#y-items-selected-with-replacement-from-til-x) | `y?x`
123 | [y objects selected without replacement from til x](misc.md#y-objects-selected-without-replacement-from-til-x) | `neg[y]?x`
121 | [y-shaped array of numbers from x\[0\] to x\[1\]-1](misc.md#y-shaped-array-of-numbers-from-x0-to-x1-1) | `y#x[0]+prd[y]?x[1]-x[0]`
245 | [randomize the random seed](misc.md#randomize-the-random-seed) | `\S x`
509 | [remove y from x](misc.md#remove-y-from-x) | `x except y`
466 | [remove every y-th item of x](misc.md#remove-every-y-th-item-of-x) | `x where 0<(1+tc x)mod 3`
469 | [remove every second item](misc.md#remove-every-second-item) | `x where(count x)#0 1`
379 | [remove leading, multiple and trailing ys from x](misc.md#remove-leading-multiple-and-trailing-ys-from-x) | `a[0]_x where not a and 1 rotate a:x=y` 
154, 422, 505 | [range; nub; remove duplicates](misc.md#range-nub-remove-duplicates) | ` distinct x`
484 | [right to left scan](misc.md#right-to-left-scan) | `reverse(y\)reverse x`
574 | [y where x is 0](misc.md#y-where-x-is-0) | `x+y*x=0`
602 | [select from y according to sign of x](misc.md#select-from-y-according-to-sign-of-x) | `y 1+signum x`
467 | [select every y-th item of y](misc.md#select-every-y-th-item-of-y) | `x where 0=(1+tc x)mod 3`
470 | [items of x divisible by y](misc.md#items-of-x-divisible-by-y) | `x where 0=x mod y`
554 | [select from g based on index of x in y](misc.md#select-from-g-based-on-index-of-x-in-y) | `g y?x`
567 | [select x or y depending on g](misc.md#select-x-or-y-depending-on-g) | `g'[x;y]`
66 | [selection by encoded list](misc.md#selection-by-encoded-list) | `2 vs x`
384 | [drop first, suffix 0](misc.md#drop-first-suffix-0) | `1_x,0`
385 | [drop last, prefix 0](misc.md#drop-last-prefix-0) | `-1_0,x`
386 | [shift x right y, fill 0](misc.md#shift-x-right-y-fill-0) | `(y#0),neg[y]_x`
387 | [shift x left y, fill 0](misc.md#shift-x-left-y-fill-0) | `(y _ x),y#0`
536 | [rotate rows left](misc.md#rotate-rows-left) | `y rotate x`
537 | [rotate rows right](misc.md#rotate-rows-right) | `neg[y]rotate x`
1016 | [streak of numbers with same sign](misc.md#streak-of-numbers-with-same-sign) | `{1+(x;0)y}\[1;]differ signum x`
152 | [sum items of y by ordered codes g in x](misc.md#sum-items-of-y-by-ordered-codes-g-in-x) | `sum each((count[g]#0),y)value group g,x`





## Polynomials

# | description | phrase
--:|-------------|-------
47 | [polynomial with roots x](poly.md#polynomial-with-roots-x) | `{(x,0)-y*0,x} over 1,x`
163 | [polynomial product](poly.md#polynomial-product) | `sum(tc x)rotate'(1_'zm x),'y*/:x`
430 | [polynomial derivative](poly.md#polynomial-derivative) | `-1 _ x*reverse tc x`
69, 227 | [value of ascending polynomial coefficients y at points x](poly.md#value-of-ascending-polynomial-coefficients-y-at-points-x) |`x sv\:y`
128 | [coefficients of best linear fit of points (x,y) (least squares)](poly.md#coefficients-of-best-linear-fit-of-points-xy-least-squares) | `(enlist y)lsq x xexp/:0 1`
125 | [predicted values of best linear fit (least squares)](poly.md#predicted-values-of-best-linear-fit-least-squares) | `a:x xexp/:0 1`<br/>`(flip a)mmu first(enlist y)lsq a`
127 | [coefficients of exponential fit of points (x,y)](poly.md#coefficients-of-exponential-fit-of-points-xy) | ==FIXME==
124 | [predicted values of exponential fit](poly.md#predicted-values-of-exponential-fit) | `a:x xexp/:0 1`<br/>`exp flip[a]mmu first(enlist log y)lsq a`
126 | [G-degree polynomial fit of points (x,y)](poly.md#g-degree-polynomial-fit-of-points-xy) | `a:x xexp/:til g+1`<br/>`reverse first (enlist y)lsq a`
67 | [extrapolated value of abscissa x and ordinate y at g](poly.md#extrapolated-value-of-abscissa-x-and-ordinate-y-at-g) | `g sv raze(enlist y) lsq x xexp/: reverse tc x`
321 | [y-th moment of x](poly.md#y-th-moment-of-x) | `(sum(x-(sum x)%c)xexp y)%c:count x`




## Rank

# | description | phrase
--:|-------------|-------
612 | [rank of an array (number of dimensions)](rank.md#rank-of-an-array) | `depth x`
51b | shape of an array | `shape:{$[0=d:depth x; 0#0j; d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}`
371, 616 | [atom from 1-item vector](rank.md#atom-from-1-item-vector) | `first x`
592 | [vector from array](rank.md#vector-from-array) | `(raze/)x`
607 | [vector from column y of matrix](rank.md#vector-from-column-y-of-matrix) | `x[;y]`
595 | [1-row matrix from vector](rank.md#1-row-matrix-from-vector) | `enlist x`
392, 402 | [1-row matrix from atom or vector](rank.md#1-row-matrix-from-atom-or-vector) | `{$[0<type x;(1,count x)#x;1 1#x]}`
588 | [2-row matrix from two vectors](rank.md#2-row-matrix-from-two-vectors) | `(x;y)`
593 | [y-row matrix from vector x](rank.md#y-row-matrix-from-vector-x) | `y#enlist x`
203, 534, 594 | [1-column matrix from vector](rank.md#1-column-matrix-from-vector) | `1#'x`
589 | [2-column matrix from two vectors](rank.md#2-column-matrix-from-two-vectors) | `x,'y`
591 | [2-column matrix from vector](rank.md#2-column-matrix-from-vector) | `2 cut x,(count[x]mod 2)#" "`
521 | [x-column matrix from vector y](rank.md#x-column-matrix-from-vector-y) | `x#'y`
429 | [matrix with diagonal x](rank.md#matrix-with-diagonal-x) | `x*{x=/:\:x}tc x`
590 | [increase rank of y to rank of x](rank.md#increase-rank-of-y-to-rank-of-x) | `(depth[x]-depth y)enlist/y`



## Round

# | description | phrase
--:|-------------|-------
462 | [round to nearest integer](round.md#round-to-nearest-integer) | `floor 0.5+x`
461 | [round to two decimal places](round.md#round-to-two-decimal-places) | `0.01*floor 0.5+x*100`
460 | [round y to x decimals](round.md#round-y-to-x-decimals) | `(10 xexp neg x)*`long$y*10 xexp x`
453 | [round to nearest even integer](round.md#round-to-nearest-even-integer) | `floor x+not 1>x mod 2`
454 | [round, but to nearest even integer if fractional part is 0.5](round.md#round-but-to-nearest-even-integer-if-fractional-part-is-05) | `floor x+0.5*not 0.5=x mod 2`
– | [round x to nearest multiple of y](round.md#round-x-to-nearest-multiple-of-y) | `y*floor 0.5+x%y`
474 | [round x to zero if magnitude less than y](round.md#round-x-to-zero-if-magnitude-less-than-y) | `@[x;where y>abs x;:;0.0]`



## Shape

# | description | phrase
--:|-------------|-------
390 | [conform table x rows to list y](shape.md#conform-table-x-rows-to-list-y)| `s:(count y),count first x`<br/>`s#(raze x),(prd s)#0`
391 | [conform table x columns to list y](shape.md#conform-table-x-columns-to-list-y) | `a:(count each(x;y))#0`<br/>`a[;til count first x]:x`
563 | [empty vector](shape.md#empty-vector) | `()`
610 | [y cyclic repetitions of vector x](shape.md#y-cyclic-repetitions-of-vector-x) | `(y*count x)#x`
614 | [array with shape of y and x as its rows](shape.md#array-with-shape-of-y-and-x-as-its-rows) | `count[y]#enlist x`
200 | [replicate a dimension of `rank`-3 array x y-fold](shape.md#replicate-a-dimension-of-rank-3-array-x-y-fold) | `x[;raze(y#1)*\:til(shape x)1;]`
250, 251, 253 | [replicate y x times](shape.md#replicate-y-x-times) | `x#y`
273, 274 | [join atom to each list item](shape.md#join-atom-to-each-list-item) | `x,'y`
376 | [append y at the bottom of matrix x](shape.md#append-y-at-the-bottom-of-matrix-x) | `x,enlist y`
377 | [fill x to length y with x’s last item](shape.md#fill-x-to-length-y-with-xs-last-item) | `y#x,y#last x`
–   | [append empty row on matrix](shape.md#append-empty-row-on-matrix) | `flip(flip x),'" "`
328 | [count items](shape.md#count-items) ` count x`
366 | [count atoms](shape.md#count-atoms) | `count raze over x`
615 | [first atom in x](shape.md#first-atom-in-x) | `(first/)x`
411, 446 | [count rows in matrix x](shape.md#411.-count-rows-in-matrix-x) | `count x`
410, 445, 600 |[count columns in matrix x](shape.md#count-columns-in-matrix-x) | `count first x`
599 | [count columns in array x](shape.md#count-columns-in-array-x) | `last shape x`
10, 51 | rank of an array | [`phrases.q`](phrases.q)
51 | shape of an array | [`phrases.q`](phrases.q)
555 | [all axes of rectangular array x](shape.md#all-axes-of-rectangular-array-x) | `til depth x`
388, 444 | [drop first y rows from top of matrix x](shape.md#drop-first-y-rows-from-top-of-matrix-x) | `y _ x`
443 | [drop first y columns from matrix x](shape.md#drop-first-y-columns-from-matrix-x) | `y _'x`
447 | [conditional drop of y items from list x](shape.md#conditional-drop-of-y-items-from-list-x) | `(y*g)_ x`
448| [conditional drop of last item of list x](shape.md#conditional-drop-of-last-item-of-list-x) | `(neg g)_x`
396 | [remove columns y from x](shape.md#remove-columns-y-from-x) | `s:til each shape x`<br/>`x . (-1_s),enlist(last s)except y`
518 | [transpose matrix x on condition y](shape.md#transpose-matrix-x-on-condition-y) | `y flip/x`
527 | [transpose planes of three-dimensional x](shape.md#transpose-planes-of-three-dimensional-x) | `flip each x`
1013 | [tree from depth;value](shape.md#tree-from-depth-value) | `tdv:{[d;v](1#v),(c _ d-1)tdv'(c:where 1=d)_ v}`
1014 | [depth from tree](shape.md#depth-from-tree) | `dt:{0,/1+dt'[1_ x]}`
1015 | [value from tree](shape.md#value-from-tree) | `vt:{(1#x),/vt each 1_ x}`



## Sort and merge

# | description | phrase
--:|-------------|-------
1  | [ascending ordinals (ranking, shareable)](sort.md#ordinals-ranking-shareable) | `asc[x]?x`
8, 9, 35, 38, 44 | [sort (rows) ](sort.md#sort-rows) | `asc x`, `desc x`
16 | [merge x y by g](sort.md#mesh) | `(x,y)[iasc idesc g]`
11, 12, 31, 482 | [mesh: merge x y z under control of g](sort.md#mesh) | `(x,y,z)rank g`
13 | [ascending ordinals (ranking, all different)](sort.md#ordinals-ranking-all-different) | `iasc iasc x`
17 | [descending ordinals (ranking, all different)](sort.md#ordinals-ranking-all-different) | `idesc idesc x`
18, 19 | [sort char matrix x ascending by internal alphabet](sort.md) | `x[iasc x]`, ``x[iasc`$x]``
30 | grade up x according to key y | `x iasc y?x`
32 | [sort ascending indices x according to data y](sort.md#sort-ascending-indices-x-according-to-data-y) | `x iasc y x`
33 | [sort rows on column](sort.md#sort-rows-on-column) | `x iasc x[;y]`
34 | [choose grading direction](sort.md#Choose-grading-direction) | `x iasc x*1 -1[y]`
36 | [sort y on x](sort.md#sort-y-on-x) | `y iasc x`
37, 550, 553 | [invert permutation](sort.md#invert-permutation) | `iasc x`
42, 43 | [move flagged items to one end](sort.md#move-flagged-items-to-one-end) | `x idesc y`
156 | [sort y by value into x classes](sort.md#sort-y-by-value-into-x-classes) | `value asc y group x xrank y`
389 | [playing order of x ranked players](sort.md#playing-order-of-x-ranked-players) | `f:1+2 sv reverse tt neg floor neg 2 xlog x`<br/>`f*f<=x`
578 | [merge items from x and y alternately](sort.md#merge-items-from-x-and-y-alternately) | `raze x,'y`
173 | [assign x to one of y classes of width h, starting with g](sort.md#assign-x-to-one-of-y-classes-of-width-h-starting-with-g) | ==FIXME==
181 | [which class of y x belongs to](misc.md#which-class-of-y-x-belongs-to) | `-1+sum x>/:y`



## Statistics

# | description | phrase
--:|-------------|-------
24 | median of x | `t:.5*1-count x`<br>`.5*sum over x[(iasc x) (neg floor t;floor neg t)]`
123.1 | [normal deviates from interval (0,1)](stat.md##normal-deviates-from-interval-01) | `x?1.`
222 | [maximum of x with weights y](stat.md#maximum-of-x-with-weights-y) | `max x*y`
223 | [minimum of x with weights y](stat.md#minimum-of-x-with-weights-y) | `min x*y`
237 | [average (mean) of x weighted by y](stat.md#average-mean-of-x-weighted-by-y) | `(sum x*y)%count x`
285 | [moving sum](stat.md#moving-sum) | `y msum x`
310 | [running sum](stat.md#running-sum) | `sums x`
319 | [standard deviation](stat.md#standard-deviation) | `sqrt sum{x*x}[x-(sum x)%c]%c:count x`
320 | [variance (dispersion)](stat.md#variance-dispersion) | `sum {x*x}[x-(sum x)%c]%c:count x`
325, 326, 332, 364, 365 | [average (mean)](stat.md#average-mean) | `(sum x)%count x`
335 | [maximum](stat.md#maximum) | `max x`
334 | [non-negative maximum](stat.md#non-negative-maximum) `max 0,x`
339 | minimum | `min x`



## Strings

# | description | phrase
--:|-------------|-------
25 | doubling quotes | `ssr[x;"\"";"\"\""]`
510 | [remove blanks](string.md#remove-blanks) | `x except " "`
73, 266, 272, 298, 397, 428 | [remove trailing blanks](string.md#remove-trailing-blanks) | `(neg reverse[x=" "]?0b)_ x`
267, 299 | [remove leading blanks](string.md#remove-leading-blanks) | `x where maxs x<>" "`
259 | [remove leading and trailing blanks](string.md#remove-leading-and-trailing-blanks) | `x{y _ x}/1 -1*(" "=1 reverse\x)?'0b`
424 | [collapse multiple blanks](string.md#collapse-multiple-blanks) | `x where 1 rotate(or)prior a:x<>" "`
76, 275 | [justify right](string.md#justify-right) | `neg[(reverse[x]=" ")?0b]rotate x`
160 | [move blanks to end of string](string.md#move blanks-to-end-of-string) | `x iasc x=" "`
177 | [ordinal of word in x pointed at by y](string.md#ordinal-of-word-in-x-pointed-at-by-y) | `sum not y<1+where x=" "`
177 | [find start of string x in string y](string.md#find-start-of-string-x-in-string-y) | `y ss x`
178 | [find first occurrence of string x in string y](string.md#find-first-occurrence-of-string-x-in-string-y) | `first y ss x`
248, 323, 393 | [center text x in line of width y](string.md#center-text-x-in-line-of-width-y) | `neg[floor(y-count x)%2]rotate y#x,y#" "`
507 [insert blank in y after flag in x](string.md#insert-blank-in-y-after-flag-in-x) | `raze y,'x#'" "`
264, 271 | [insert x\[i\] blanks after y\[g\[i\]\]](string.md#insert-xi-blanks-after-ygi) | `raze((0,1+g)_y),'(x,0)#'" "`
293 | [locate quotes and text between them](string.md#locate-quotes-and-text-between-them) | `(or)prior(<>)scan x="\""`
294 | [locate text between quotes](string.md#locate-text-between-quotes) | `(and)prior(<>)scan x="\""`
295 | [depth of parentheses](string.md#depth-of-parentheses) | `sums({x-0b,-1_y}/)"()"=\:x`
297 | [spread flagged field heads right](string.md#spread-flagged-field-heads-right) | `x raze(count each a _ x)#'a:where y`
401 | [first word in string x](string.md#first-word-in-string-x) | 
437 | [remove leading zeros](string.md#remove-leading-zeros) | `((x="0")?0b) _ x`
490, 580 | [insert spaces in text](string.md#insert-spaces-in-text) | `-1_raze x,'" "`
496 | [remove punctuation characters](string.md#remove-punctuation-characters) | `x except PUN`
508 | [conditional text](string.md#conditional-text) | `$[x;"true";"false"]`
549 | [alphabetic comparison](string.md#alphabetic-comparison) | `x<y`



## Sublists

# | description | phrase
--:|-------------|-------
– | [indices from flags x](sub.md#partition-a-list) | `where x`
5b | [indices from lengths x](sub.md#partition-a-list) | `0,sums -1_x`
– | [partition list y into sublists](sub.md#partition-a-list) | `(…)_y`
6, 14, 491, 492 | [aggregate function x on sublists of y](sub.md#apply-aggregate-function-to-sublists) | `x each(…)_y` 
2, 3, 5, 7, 15  | [uniform function x on sublists of y](sub.md#apply-uniform-function-to-sublists) | `raze x each(…)_y` 
21| rotate to the left 1 place each sublist of y determined by flags x | `y[iasc x+sums x]`
26 | [insert y "*" after "=" in x](sub.md#insert-y-after-in-x) |`g:where x="="`<br>`raze((0,1+-1_ g)_x),\:y#"*"`
27 | insert 0 after indices of y of x | `count[x]>iasc(tc x),y`
28 | insert g items h after indices y of x | `a:g*count y`<br>`(x,a#h)iasc(tc x),a#count y`
29 | insert g items h before indices y of x | `a:g*count y`<br>`((a#h),x)iasc(a#y),tc x`
39, 40 | [reverse each sublist](sub.md#reverse-each-sublist) | `x reverse idesc sums tc[x] in y`
213 | [maxima of sublists of x specified by boolean list y](sub.md#maxima-of-sublists-of-x-specified-by-boolean-list-y) | `max each where[y]_x`
254 | [running parity of sublists of y indicated by x](sub.md#running-parity-of-sublists-of-y-indicated-by-x) | `raze(sums each where[x] _ y)mod 2`
255 | [running sum of sublists of y indicated by x](sub.md#running-sum-of-sublists-of-y-indicated-by-x) | `raze sums each where[x] _ y` 
256 | [groups of 1s in y pointed at by x](sub.md#groups-of-1s-in-y-pointed-at-by-x) | ==FIXME==
257 | [sums of sublists of x determined by lengths y](sub.md#sums of sublists-of-x-determined-by-lengths-y) | `deltas sums[x] sums[y]-1`
265, 279 | [insert x\[i\] zeroes after i-th infix of y](sub.md#insert-xi-zeroes-after-i-th-infix-of-y) | `raze((0,where y)_y),'(0,x)#'0`
277 | [end flags from lengths](sub.md#end-flags-from-lengths) | `(1+til sum x)in sums x`
278 | [start flags from lengths](sub.md#start-flags-from-lengths) | `(til sum x)in sums 0,x` 
283 | [find field y of fields beginning with first of x](sub.md#find-field-y-of-fields-beginning-with-first-of-x) | `x where y=sums x=first x`
284 | [sum items of x marked by y](sub.md#sum-items-of-x-marked-by-y) | `value sum each x group y`
289 | [or-scan of sublists of y flagged by x](sub.md#or-scan-of-sublists-of-y-flagged-by-x) | `raze maxs each where[x]_ y`
290 | [and-scan of sublists of y flagged by x](sub.md#and-scan-of-sublists-of-y-flagged-by-x) | `raze mins each where[x]_ y`
291 | [sums of sublists of y flagged by x](sub.md#sums-of-sublists-of-y-flagged-by-x) | `sum each where[x]_y`
292 | [groups of 1s in y flagged by x](sub.md#groups-of-1s-in-y-flagged-by-x) | `a:sums(>)prior y`<br/>`y and a in a where x&y`
296 | [starting positions of sublists from lengths x](sub.md#starting-positions-of-sublists-from-lengths-x) | `sums -1_0,x`
404 | [end points for x fields of length y](sub.md#end-points-for-x-fields-of-length-y) | `-1+sums x#y`
405 | [start points for x fields of length y](sub.md#start-points-for-x-fields-of-length-y) | `where 0=(til x*y)mod 3`
414 | [ending indices from field lengths](sub.md#ending-indices-from-field-lengths) | `sums[x]-1`
300 | [gth sublist of y flagged by x](sub.md#gth-sublist-of-y-flagged-by-x) | `((where x)_ y)g`
415 | [lengths of sublists of 1 in x](sub.md#lengths-of-infixes-of-1-in-x) | `deltas sums[x]where 1_(<)prior x,0`
418 | [starting indices of equal-item sublists](sub.md#starting-indices-of-equal-item-sublists) | `differ x`
417 | [end indices of equal-item sublists](sub.md#end-indices-of-equal-item-sublists) | `(1_(<>)prior x),1b`
423 | [lengths from start indexes](sub.md#lengths-from-start-indexes) | `1_deltas where x,1`
426 | [change all multiple sublists of y in x to single](sub.md#change-all-multiple-sublists-of-y-in-x-to-single) | `x where 1 rotate(or)prior a:x<>y`
1003 | [maximum sum of sublists](sub.md#maximum-sum-of-sublists) | `max 0 (0|+)\x`
577 | [append y items g to each item of x](sub.md#append-y-items-g-to-each-item-of-x) | `raze x,\:y#g`
576 | [prepend y items of g to each item of x](sub.md#prepend-y-items-of-g-to-each-item-of-x) | `raze(y#g),/:x`
581 | [insert y after each item of x](sub.md#insert-y-after-each-item-of-x) | `raze x,'y`



## Temporal

# | description | phrase
--:|-------------|-------
463 | [is year x a leap year?](temp.md#is-year-x-a-leap-year) | `ly:{sum[0=x mod\:4 100 400]mod 2}`
74 | [number of days in month x of Gregorian year y](temp.md#number-of-days-in-month-x-of-Gregorian-year-y) | `$[x=2;28+ly y;(0,12#7#31 30)x]`
104| [date in ascending format](temp.md#date-in-ascending-format) | `"/"sv reverse 0 4 6_ x`
105 | [current time of 12-hour clock](temp.md#current-time-of-12-hour-clock) |`p:x>11:59:59`<br/>`string[x-43200*p]," ","AP"[p],"M"`
107 | [current date, American format](temp.md#current-date-American-format) | `"/"sv string 1 rotate parse ssr[;".";" "] string x`


## Tests

# | description | phrase
--:|-------------|-------
4  | are x and y permutations of each other? | `(asc x)~asc y`
20, 346 | is x a permutation? | `x~iasc iasc x`
85, 519 | [is matrix x antisymmetric?](test.md#is-matrix-x-antisymmetric) | `x~neg flip x`
86, 520 | [is matrix x symmetric?](test.md#is-matrix-x-symmetric) | `x~flip x`
159, 214, 215, 311, 315, 316, 317, 324, 340, 341, 343, 347, 349, 352, 354, 358 | [is range of x 1?](test.md#is-range-of-x-1) | `1=count distinct x`
161 | [is x upper triangular?](test.md#is-x-upper-triangular) | `zm[x]~x*{x>\:x}tc x`
162 | [is x lower triangular?](test.md#is-x-lower-triangular) | `zm[x]~x*{x<\:x}tc x`
180 | [is x in range \[y\)?](test.md#is-x-in-range-y) | `(</')x<\:y`
221 | [is x an integer in interval [g,h)?](test.md#is-x-an-integer-in-interval-gh) | `(x=floor x)&(</)x<g,h`
228, 229, 232 | [is y a row of x?](test.md#is-y-a-row-of-x) | `y in x`
233 | [is x within range \[ y \)?](test.md#is-x-within-range-y) | `(<)over x<y`
234, 235 | [is x within range \( y \]?](test.md#is-x-within-range-y) | `(<)over x<=y`
268, 270 | [is x in ascending order?](sort.md#is-x-in-ascending-order) | `all(>=)prior x`
333 | [quick membership for non-negative integers](test.md#quick-membership-for-non-negative-integers) | `@[(1+max x,y)#0;y;:;1]x`
345 | [do ranges of x and y match?](test.md#doranges-of-x-and-y-match) | `(~)over('[asc;distinct])each(x;y)`
348 | [do x and y have items in common?](test.md#do-x-and-y-have-items-in-common) | `any x in y`
350 | [is x 1s and 0s only (boolean)?](test.md#is-x-1s-and 0s only) | `{t:abs type x; $[t~1;1b;t in 5 6 7 9h;all x in t$0 1;0b]}`
351 | [is x a subset of y?](test.md#is-x-a-subset-of-y) | `all x in y`
353 | [are items unique?](test.md#are-items-unique) | `x~distinct x`
357 | [does x match y?](test.md#does-x-match-y) | `x~y`
432 | [does item differ from previous one?](test.md#does-item-differ-from-previous-one)
431 | [does item differ from next one?](test.md#does-item-differ-from-next-one) | `1_ differ x`
457 | [is x integral?](test.md#is-x-integral) | `x=floor x`
473 | [is x even?](test.md#is-x-even) | `not x mod 2`
544 | [do x and y match?](test.md#do-x-and-y-match) | `x~y`
546 | [is count of atoms 1?](test.md#is-count-of-atoms-1) | `1=count raze over x`
547 | [is x vector?](test.md#is-x-vector) | `0<type x`
548 | [is x empty?](test.md#is-x-empty) | `0=count raze over x`
564 | [is x within range ( y\[0\],y\[1\] )](test.md#is-x-within-range-y0y1) | `(<)over x<y+0 1`
565 | [is x within range \[ y\[0\],y\[1\] \](test.md#is-x-within-range-y0y1-1) | `(<)over x<y+1 0`
344 | [pairwise match](misc.md#pairwise-match) | `1 rotate(~)prior x`



## Text

# | description | phrase
--:|-------------|-------
184, 412 | [right-justify fields x of length y to length g](text.md#right-justify-fields-x-of-length-y-to-length-g) | `raze(neg g)#/:(g#" "),/:(sums 0,-1_y) _ x`
185, 276 | [left-justify fields x of length y to length g](text.md#left-justify-fields-x-of-length-y-to-length-g) | `raze g#/:((sums 0,-1_y)_x),\:g#" "`
205 | [remove trailing blank rows](text.md#remove-trailing-blank-rows) | `(neg sum mins reverse(and/)each x=" ")_ x`
209 | [remove trailing blank columns](text.md#remove-trailing-blank-columns) | `neg[sum mins reverse min x=" "]_'x`
210 | [remove leading blank columns](text.md#remove-leading-blank-columns) | `sum[mins min x=" "]_'x`
211 | [remove leading blank rows](text.md#remove-leading-blank-rows) | `((min each x=" ")?0b)_ x`
70, 206, 327 | [remove duplicate rows](text.md#remove-duplicate-rows) | `distinct x`
216 | [rows of matrix x starting with y](text.md#rows-of-matrix-x-starting-with-y) | `x where x[;tc y]~\:y`
218 | [single blank row from multiple](text.md#single-blank-row-from-multiple) | `x where{x|1_x,1b}max" "<>flip x`
220 | [remove duplicate blank columns](text.md#remove-duplicate-blank-columns) | `x where{x|1_x,1b}max" "<>x`
225 | [remove blank rows](text.md#remove-blank-rows) | `x where max" "<>flip x`
226 | [remove blank columns](text.md#remove-blank-columns) | `x where max" "<>x`
231 | [which rows of x contain elements different from y?](text.md#which rows-of-x-contain-elements-different-from-y) | `max y<>flip x`
441, 613 | [comma-separated list from table](text.md#comma-separated-list-from-table) | `","sv x`
464 | [framing character matrix x](text.md#framing-character-matrix-x) | `flip"-",'(flip"|",'x,'"|"),'"-"`
485 | [append empty row on matrix](text.md#append-empty-row-on-matrix) | `flip(flip x),'" "`
487 | [insert empty row in x after row y](text.md#insert-empty-row-in-x-after-row-y) | `a:flip(flip x),'" "`<br/>`a rank@[count[a]#1;y+1;+;1]`
489 | [table from string y at partitions flagged by x](text.md#table-from-string-y-at-partitions-flagged-by-x) | `(where x)_y` 
579 | [variable length lines](text.md#variable-length-lines) | `(x;y;z)`



## Utilities and constants

<i class="far fa-hand-point-right"></i>
[`phrases.q`](phrases.md)

