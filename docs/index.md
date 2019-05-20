# Index of phrases





## Casting and representation

# | description | phrase
--:|-------------|-------
45 | [binary representation of positive integer](cast.md#binary-representation-of-a-positive-integer) | `2 vs x`, `0b vs x`, `0x0 vs x` 
49 | [hexadecimals from integers](cast.md#hexadecimal-from-integer) | `HEX 16 vs x`
56 | [hexadecimals from decimal characters](cast.md#hexadecimal-from-decimal-characters) | `HEX 16 vs "i"$x`
53 | [decimal digits from integer](cast.md#decimal-digits-from-integer) | `10 vs x`
54 | [represent y in base x](cast.md#represent-y-in-base-x) | `x vs y`
57 | [vector from date](cast.md#vector-from-date) | `100000 100 100 vs x`
63 | [represent x in radix 10 100 1000](cast.md#represent-x-in-radix-10-100-1000) | `10 100 1000 vs x`
72 | [encode date as integer](misc.md#encode-date-as-integer) |`"I"$ string[x] except "."`
75 | [decimal from hexadecimal](cast.md#decimal-from-hexadecimal) | `16 sv HEX?x`
78 | [number from alphanumeric](cast.md#number-from-alphanumeric)| `parse x`
84 | [scalar from boolean vector](cast.md#scalar-from-boolean-vector) | `2 sv x`
93 | [numbers from alphanumeric matrix](cast.md#numbers-from-alphanumeric-matrix) | `parse each x`
94 | [number from alphanumeric x, default y](cast.md#number-from-alphanumeric-x-default-y) | `parse $[x~"";y;x]`
95 | [numeric from proper alphanumeric non-negative integer](cast.md#numeric-from-proper-alphanumeric-non-negative-integer) | `parse x`
99 | [numeric vector from evaluating rows of character matrix](cast.md#numeric-vector-from-evaluating-rows-of-character-matrix) | `raze('[eval;parse])each x`
342 | [Arabic from Roman number](cast.md#arabic-from-roman-number) | `a:0,1000 500 100 50 10 5 1 "MDCLXVI"?x`<br/>`sum floor a*-1 xexp a<1 rotate a`



## Execution

# | description | phrase
--:|-------------|-------
96 | conditional execution | `$[1b;x;y]`<br/>`if[1b;x:42]`
98 | [execute rows of character matrix](exec.md#execute-rows-of-character-matrix) | `('[eval;parse])each x`
101 | [sum numbers in character matrix](exec.md#sum-numbers-in-character-matrix) | `sum parse " " sv x`
115, 116, 117 | [case structure](exec.md#case-structure) | `$[c0;t0;c1;t1;c2;t2;c3;t3;f]`
151 | [efficient execution of f x where x has repeated values](exec.md#efficient-execution-of-f-x-where-x-has-repeated-values) | `u:distinct x`<br/>`(f u)u?x`



## Finance

# | description | phrase
--:|-------------|-------
77 | [present value of cash flows c at times t and discount rate d](fin.md#present-value-of-cash-flows)| `sum c*d xexp t`
82 | [future value of cash flows](fin.md#future-value-of-cash-flows) | `sum x* (1+y%100) xexp reverse tc x`
146 | [compound interest for principals y at percentages g for periods x](fin.md#compound-interest-for-principals-y-at-percentages-g-for-periods-x) | `y*\:(1+g%100)xexp\:x`
186 | [annuity coefficient for x periods at interest rate y%](fin.md#annuity-coefficient-for-x-periods-at-interest-rate-y) | `y%/:100*flip 1-(1+y%100)xexp\:neg x`
286 | [fifo stock y decremented with x units](fin.md#fifo-stock-y-decremented-with-x-units) | `1_deltas 0,0|(sums y)-x`



## Flags

# | description | phrase
--:|-------------|-------
165 | [list of x zeros preceded by (y-x) ones](flag.md#list-of-x-zeros-preceded-by-y-x-ones) | `1 0 where(y-x),x`
167 | [list of x ones preceded by (y-x) zeros](flag.md#list-of-x-ones-preceded-by-y-x-zeros) | `1 0 where(y-x),x`
168 | [list of x zeros followed by (y-x) ones](flag.md#list-of-x-zeros-followed-by-y-x-ones) | `0 1 where x,y-x`
169, 172 | [list of x ones followed by (y-x) zeros](flag.md#list-of-x-ones-followed-by-y-x-zeros) | `1 0 where x,y-x`
247 | [interlace x\[i\]#1 and y\[i\]#0](flag.md#interlace-xi1-and-yi0) | `(raze/)flip(x;y)#''1 0`
252 | [x alternate takes of 1s and 0s](flag.md#x-alternate-takes-of-1s-and-0s) | `(count[x]#1 0)where x`
261 | [first group of 1s](flag.md#first-group-of-1s) | `x and(and)scan x=(or)scan x`
303 | [smearing 1s between pairs of 1s](flag.md#smearing-1s-between-pairs-of-1s) | `x or(sums x)mod 2`
304 | [invert 0s following first 1](flag.md#invert-0s-following-first-1) | `maxs x`
305 | [invert fields marked by pairs of 1s](flag.md#invert-fields-marked-by-pairs-of-1s) | `(not x)&(sums x)mod 2`
306 | [invert all 1s after first 0](flag.md#invert-all-1s-after-first-0) | `mins x`
307 | [invert all 1s after first 1](flag.md#invert-all-1s-after-first-1) | `(tc x)=x?1`
308 | [invert all 0s after first 0](flag.md#invert-all-0s-after-first-0) | `@[x;(1+x?0)_tc x;:;1]`
361 | [parity](flag.md#parity) | `(sum x) mod 2`
309 | [running parity](flag.md#running-parity) | `(sums x)mod 2`
355 | [none](flag.md#none) | `not any x`
356 | any | `any x`
360 | [all](flag.md#all) | `all x`
370 | [count of 1s in boolean list](flag.md#count-of-1s-in-boolean-list) | `sum x`
381 | [invert all but first 1 in group of 1s](flag.md#invert-all-but-first-1-in-group-of-1s) | `x>-1 _ 0,x`
407 | [vector length y of x 1s, the rest 0s](flag.md#vector-length-y-of-x-1s-the-rest-0s) | `x>til y`


## Format

# | description | phrase
--:|-------------|-------
46 | [formatted integers](form.md#formatted-integers) | `flip DEC 10 vs x`
64 | [character time hh:mm:ss from integer hhmmss](form.md#character-time-hhmmss-from-integer-hhmmss) | `":"sv 0 2 4_ string x`
65 | [character date yyyy/mm/dd from integer yyyymmdd](form.md#character-date-yyyymmdd-from-integer-yyyymmdd) | `"/"sv 0 4 6_ string x`
87 | [number of decimals](math.md#number-of-decimals) | `count[string x-floor x]-2`
106 | [leading zeros for positive integers x in field width y](form.md#leading-zeros-for-positive-integers-x-in-field-width-y) | `1_'string x+10 xexp y`
111 | [count of format of x](form.md#count-of-format-of-x) | `('[count;string])`
144 | [histogram](form.md#histogram) | `" *"(1+ til max x)<=/:x`
166 | [barchart of integer list x](form.md#barchart-of-integer-list-x)| `" X" reverse til[max x]<\:x`
170 | [horizontal barchart of x, normalized to length y](form.md#horizontal-barchart-of-x-normalized-to-length-y) | `" X" (floor x*y%max x)>\:til y`
171 | [horizontal barchart of integers](form.md#horizontal-barchart-of-integers) | `" X" x>\:til max x`
149 | [number of decimals in x, maximum y](form.md#number-of-decimals-in-x-maximum-y) | `sum each maxs each "0"<>reverse each string floor(10 xexp y)*x mod 1`



## Geometry

# | description | phrase
--:|-------------|-------
129 | arctangent y÷x | `atan y%x`
131 | [complementary angle (arccos sin x)](trig.md#complementary-angle-arccos-sin-x) | `acos sin x`
132 | [rotation matrix for angle x (in radians) counter-clockwise](trig.md#rotation-matrix-for-angle-x-in-radians-counter-clockwise) | `((cos x;neg sin x);(sin x;cos x))`
133 | [degrees from radians](trig.md#degrees-from-radians) | `57.295779513082323*x`
134 | [radians from degrees](trig.md#radians-from-degrees) | `0.017453292519943295*x`
318 | [area of triangle with sides x (Heron’s rule)](trig.md#area-of-triangle-with-sides-x) | `sqrt prd(sum x%2)-0,x`



## Mathematics

# | description | phrase
--:|-------------|-------
47 | [polynomial with roots y](math.md#polynomial-with-roots-y) | `{(x,0)-y*0,x} over 1,x`
48 | [saddle-point indices](math.md##saddle-point-indices) | `rc[x;]where raze minmax x`
48a | flag row minimums | `rn:{x=min each x}`
48b | flag column maximums | `cx:{x=\:max x}`
48c | flag minmaxs | `minmax:{(rn x)&cx x}`
48e | row-column indices of ravel-indices y in matrix x | `rc:{(div;mod).\:(y;count first x)}`
262 | [value of saddle point](math.md#value-of-saddle-point) | `raze[x]where raze minmax x`
50 | [connectivity list from connectivity matrix](misc.md#connectivity-list-from-connectivity-matrix) | `rc[x;]where raze x`
71 | [connectivity matrix from connectivity list](math.md#connectivity-matrix-from-connectivity-list)| ==FIXME==
148 | [node matrix from connection matrix](math.md#node-matrix-from-connection-matrix)| `b:flip each x=/:1 -1`<br/>`(mmu\:) . "f"$(b;tc x)`
157 | [connection matrix from node matrix](math.md#connection matrix from node matrix) | `(-/)flip x=/:tc distinct raze x`
52, 59, 60 | [truth table of order x](math.md#truth-table-of-order-x) | `2 vs til "j"$2 xexp x`
62 | [integer and fractional parts of positive x](math.md#integer-and-fractional-parts-of-positive-x) | `{f,'x-f:floor x}x`
67 | [extrapolated value of abscissa x and ordinate y at g](math.md#extrapolated-value-of-abscissa-x-and-ordinate-y-at-g) | `g sv raze(enlist y) lsq x xexp/: reverse tc x`
69, 227 | [value of ascending polynomial coefficients y at points x](math.md#value-of-ascending-polynomial-coefficients-y-at-points-x) |`x sv\:y`
124 | [predicted values of exponential fit](math.md#predicted-values-of-exponential-fit) | `a:x xexp/:0 1`<br/>`exp flip[a]mmu first(enlist log y)lsq a`
125 | [predicted values of best linear fit (least squares)](math.md#predicted-values-of-best-linear-fit-least-squares) | `a:x xexp/:0 1`<br/>`(flip a)mmu first(enlist y)lsq a`
126 | [G-degree polynomial fit of points (x,y)](math.md#g-degree-polynomial-fit-of-points-xy) | `a:x xexp/:til g+1`<br/>`reverse first (enlist y)lsq a`
127 | [coefficients of exponential fit of points (x,y)](math.md#coefficients-of-exponential-fit-of-points-xy) | ==FIXME==
128 | [coefficients of best linear fit of points (x,y) (least squares)](math.md#coefficients-of-best-linear-fit-of-points-xy-least-squares) | `(enlist y)lsq x xexp/:0 1`
135 | [number of permutations of n objects taken k at a time](math.md#number-of-permutations-of-n-objects-taken-k-at-a-time) | `prd(n-k-1)+til k`
136, 1007 | [Pascal’s triangle](math.md#pascals-triangle) | `x {0+':x,0}\ 1`
137 | [Taylor series](math.md#taylor-series) | `sum y*(x xexp a)%prds 1|a:tc y`
281 | [value of Taylor series with coefficients y at x](math.md#value-of-Taylor-series-with-coefficients-y-at-x) | `sum y*prds 1.0,x%1+til(count y)-1`
139 | [Beta function](math.md#beta-function) | ==FIXME==
142 | [number of combinations of n objects taken k at a time](math.md#number-of-combinations-of-n-objects-taken-k-at-a-time) | `fac[n]%fac[n-k]*fac[k]`
150 | [sum items of x given by y](math.md#sum-items-of-x-given-by-y) | `sum each x value group y`
155 | [greatest common divisor](math.md#greatest-common-divisor) | `1+last where min each 0=x mod/:1+til min x`
302 | [x first triangular numbers](math.md#x-first-triangular-numbers) | `sums til x`
163 | [polynomial product](math.md#polynomial-product) | `sum(tc x)rotate'(1_'zm x),'y*/:x`
164 | [divisors](math.md#divisors) | `where 0=x mod/:til 1+x`
175 | [primes to n](math.md#primes-to-n) | `1+where 2=sum 0=x mod/:x:1+til n`
183 | [maximum table](math.md#maximum-table) | `{x&\:x}til x`
187 | [direct matrix product](math.md#direct-matrix-product) | `flip each x*\:\:y`
188 | [Shur product](math.md#shur-product) | `((last shape x)#x) * (first shape y)#'y`
191 | [Shur sum](math.md#shur-sum) | `((last shape x)#x) + (first shape y)#'y`
189, 190 | [add x to each row of y](math.md#add-x-to-each-row-of-y) | `x+/:y`
192,193 | [add x to each column of y](math.md#add-x-to-each-column-of-y) | `x+'y`
195 | [upper triangular matrix of order x](math.md#upper-triangular-matrix-of-order-x) | `{x<=\:x}til x`
196 | [lower triangular matrix of order x](math.md#lower-triangular-matrix-of-order-x) | `{x>=\:x}til x`
197 | [identity matrix of order x](math.md#identity-matrix-of-order-x) | `{x=/:x}til x`
198 | [Hilbert matrix of order x](math.md#hilbert-matrix-of-order-x) | `reciprocal 1+{x+/:x}til x`
199 | [multiplication table of order x](math.md#multiplication-table-of-order-x) | `{x*\:x}1+til x`
224 | [extend distance table to next leg](math.md#extend-distance-table-to-next-leg) | `x('[min;+])\:x`
230 | [extend a transitive binary relation](math.md#extend-a-transitive-binary-relation) | ==FIXME==
239 | [sum reciprocal series](math.md#sum-reciprocal-series) | `sum y%x`
240 | [matrix product](math.md#matrix-product) | `x mmu y`
241 | [sum over subsets of x specified by y](math.md#sum-over-subsets-of-x-specified-by-y) | ==FIXME==
242, 246 | [sum squares of x](math.md#sum-squares-of-x) | `sum x*x`
243 | [dot product of vectors](math.md#dot-product-of-vectors) | `sum x*y`
244 | [product over subsets of x specified by y](math.md#product-over-subsets-of-x-specified-by-y) | `x('[prd;xexp])\:y`
260 | [first 10 figurate numbers of order x](math.md#first-10-figurate-numbers-of-order-x) | `x+\/10#1`
301 | [alternating sum series](math.md#alternating sum series) | `sums x*(count x)#1 -1`
312 | [maximum separation of items of x](math.md#maximum-separation-of-items-of-x) | `(max x)-min x`
313, 314 | [value of two-by-two determinant](math.md#value-of-two-by-two-determinant) | `(-)over(x 0)*reverse x 1`
321 | [y-th moment of x](math.md#y-th-moment-of-x) | `(sum(x-(sum x)%c)xexp y)%c:count x`
363 | [solve quadratic](math.md#solve-quadratic) | `q:0.5*y+signum[y]*sqrt(y*y)-4*x*z`<br/>`(q%x),z%q`
369 | [alternating sum](math.md#alternating-sum) | `sum x*(count x)#1 -1`
368 | [product](math.md#product) | `prd x`
367 | [alternating product](math.md#alternating-product) | `prd x xexp(count x)#1 -1`
374 | [sum a vector](math.md#sum-a-vector) | `sum x`
372 | [sum columns of matrix](math.md#sum-columns-of-matrix) | `sum x`
373 | [sum rows of matrix](math.md#sum-rows-of-matrix) | `sum each x`


## Miscellaneous

# | description | phrase
--:|-------------|-------
61 | [cyclic counter](misc.md#cyclic-counter) | `1+(1+til x)mod y`
66 | [selection by encoded list](misc.md#selection-by-encoded-list) | `2 vs x`
70, 327 | [remove duplicate rows](misc.md#remove-duplicate-rows) | `distinct x`
88 | [name variable according to x](misc.md#name-variable-according-to-x) | ``(`$x)set y``
121 | [y-shaped array of numbers from x\[0\] to x\[1\]-1](misc.md#y-shaped-array-of-numbers-from-x0-to-x1-1) | `y#x[0]+prd[y]?x[1]-x[0]`
122 | [y items selected with replacement from til x](misc.md#y-items-selected-with-replacement-from-til-x) | `y?x`
123 | [y objects selected without replacement from til x](misc.md#y objects-selected-without-replacement-from-til-x) | `neg[y]?x`
145 | [count of x between endpoints (l,h)](misc.md#count-of-x-between-endpoints-lh) | `sum raze (x<h)&x>l`
152 | [sum items of y by ordered codes g in x](misc.md#sum-items-of-y-by-ordered-codes-g-in-x) | `sum each((count[g]#0),y)value group g,x`
154 | [range; nub; remove duplicates](misc.md#range-nub-remove-duplicates) ` distinct x`
173 | [assign x to one of y classes of width h, starting with g](misc.md#assign-x-to-one-of-y-classes-of-width-h-starting-with-g) | ==FIXME==
174 | [move x into first quadrant](misc.md#move-x-into-first-quadrant) | `{x-min x}each x`
179 | [contour levels y at points with altitude x](misc.md#contour-levels-y-at-points-with-altitude-x) | `y -1+sum not y>x`
181 | [which class of y x belongs to](misc.md#which-class-of-y-x-belongs-to) | `-1+sum x>/:y`
204 | [numeric array and its negative](misc.md#numeric-array-and-its-negative) |  `x,''neg x`
236 | [number of occurrences of x in y](misc.md#number-of-occurrences-of-x-in-y) | `sum y=x`
245 | [randomize the random seed](misc.md#randomize-the-random-seed) | `\S x`
249, 268 | [offset enumeration](misc.md#offset-enumeration) | `x+til y`
329 | [mask from positive integers in x](misc.md#mask-from-positive-integers-in-x) | `x in til 1+max x`
331 | [identity for floating-point maximum, negative infinity](misc.md#identity-for-floating-point-maximum-negative-infinity) | `max 0#0.0`
337 | [identity for floating point minimum, positive infinity](misc.md#identity-for-floating-point-minimum-positive-infinity) | `min 0#0.0`
344 | [pairwise match](misc.md#pairwise-match) | `1 rotate(~)prior x`
362 | [count of occurrences of x in y](misc.md#count-of-occurrences-of-x-in-y) | `sum x=y`
366 | [count of scalars](misc.md#count-of-scalars) | `count raze over x`
375 | [insert row x in matrix y after row g](misc.md#insert row x in matrix y after row g) | `(y,enlist x)iasc(tc y),g`
379 | [remove leading, multiple and trailing ys from x](misc.md#remove-leading-multiple-and-trailing-ys-from-x) | `a[0]_x where not a and 1 rotate a:x=y` 
380 | [change items of x with value y\[0\] to y\[1\]](misc.md#change-items-of-x-with-value-y0-to-y1) | `@[x;where x=y 0;:;y 1]`
382 | [insert x in y after index g](misc.md#insert-x-in-y-after-index-g) | `y[til g+1],x,(g+1)_y`
383 | [pairwise difference](misc.md#pairwise-difference) | `1_neg deltas x`
406 | [add y to last item of x](misc.md#add-y-to-last-item-of-x) | `x[count[x]-1]+:y`


## Search

# | description | phrase
--:|-------------|-------
22 | find first occurrence of minimum of x | `x?min x`
23 | find first occurrence of maximum of x | `x?max x`
41, 280 | find flags in boolean vector | `where x`
55 | [find items of y in array x](misc.md#find-items-of-y-in-array-x) | `shape[x] vs where raze[x] in raze y`
282 | [find first blank](search.md#find-first-blank) | `x?" "`
79 | [find last non-blank](misc.md#find-last-non-blank) | `(" "=reverse x)?0b`
143 | [find distinct items](misc.md#find-distinct-items) | `value group x`
147, 219 | [find string x in string y](misc.md#find-string-x-in-string-y) | `z:where y=first x`<br/>`z where x~/:y z+\:tc x`
153 | [find rows of y in in corresponding rows of x](search.md#find-rows-of-y-in-in-corresponding-rows-of-x) | `x?'y`
182 | [find consecutive repeated elements](misc.md#find-consecutive-repeated-elements) | `where differ x`
207 | [find rows of matrix y in matrix x](search.md#find-rows-of-matrix-y-in-matrix-x) | `x?y`
217 | [find last non-blank in string](search.md#find-last-non-blank-in-string)| `last where x<>" "`
330 | [find first occurrence of maximum item of x](search.md#find-first-occurrence-of-maximum-item-of-x) | `x?max x`
336 | [find first occurrence of minimum](search.md#find-first-occurrence-of-minimum) | `x?min x`
338 | [find first occurrence in x of an item of y](search.md#find-first-occurrence-in-x-of-an-item-of-y) | `x?y`
359 | [find blank rows](search.md#find-blank-rows) | `all flip x=" "`


## Shapes and indexes

# | description | phrase
--:|-------------|-------
58 | [all pairs of `til[x]` and `til[y]`](shape.md#all-pairs-of-tilx-and-tily) | `ap:{x vs til prd x}x,y`
51 | [indices of an array](shape.md#indices-of-an-array) | `ap shape x`
10, 51a | depth of an array | `depth:{$[type[x]<0; 0; "j"$sum(and)scan{1=count distinct count each x}each(raze\)x]}`
51b | shape of an array | `shape:{$[0=d:depth x; 0#0j; d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}`
80 | [scattered indexing](shape.md#scattered-indexing) | `x ./: y`
81 | [raveled index from general index](shape.md#raveled-index-from-general-index) | `shape[x] sv y`
100 | [indexing arbitrary rank array](misc.md#indexing-arbitrary rank-array)| `x . y`
200 | [replicating a dimension of rank-3 array x y-fold](shape.md#replicating-a-dimension-of-rank-3-array-x-y-fold) | `x[;raze(y#1)*\:til(shape x)1;]`
201 | [moving index y-wide for x](shape.md#moving-index-y-wide-for-x) | `y+til count[x]-y-1`
202 | [indexes of infixes of length y](shape.md#indexes-of-infixes-of-length-y) | `x+\:til y`
203 | [one-column matrix from numeric vector](shape.md#one-column-matrix-from-numeric-vector) | `1#'x`
250, 251, 253 | [replicate y x times](shape.md#replicate-y-x-times) | `x#y`
273, 274 | [join scalar to each list item](shape.md#join-scalar-to-each-list-item) | `x,'y`
328 | [number of items](shape.md#number of items) ` count x`
371 | [scalar from 1-item list](shape.md#scalar-from-1-item-list) | `first x`
376 | [append y at the bottom of matrix x](shape.md#append-y-at-the-bottom-of-matrix-x) | `x,enlist y`
377 | [fill x to length y with x’s last item](shape.md#fill-x-to-length-y-with-xs-last-item) | `y#x,y#last x`
384 | [drop first, suffix 0](shape.md#drop-first-suffix-0) | `1_x,0`
385 | [drop last, prefix 0](shape.md#drop-last-prefix-0) | `-1_0,x`
386 | [shift x right y, fill 0](shape.md#shift-x-right-y-fill-0) | `(y#0),neg[y]_x`
387 | [shift x left y, fill 0](shape.md#shift-x-left-y-fill-0) | `(y _ x),y#0`
388 | [drop y rows from top of matrix x](shape.md#drop-y-rows-from-top-of-matrix-x) | `y _ x`
390 | [conform table x rows to list y](shape.md#conform-table-x-rows-to-list-y)| `s:(count y),count first x`<br/>`s#(raze x),(prd s)#0`
391 | [conform table x columns to list y](shape.md#conform-table-x-columns-to-list-y) | `a:(count each(x;y))#0`<br/>`a[;til count first x]:x`
392, 402 | [matrix from scalar or vector](shape.md#matrix-from-scalar-or-vector) | `{$[0<type x;(1,count x)#x;1 1#x]}`
396 | [remove columns y from x](shape.md#remove-columns-y-from-x) | `s:til each shape x`<br/>`x . (-1_s),enlist(last s)except y`
398 | [diagonals from columns](shape.mddiagonals-from-columns) | `(neg til 5)rotate'x`
399 | [columns from diagonals](shape.md#columns-from-diagonals) | `(til 5)rotate'x`
408 | [initial empty row to start matrix of x columns](shape.md#initial-empty-row-to-start-matrix-of-x-columns) | `()`
410 |[number of columns in matrix x](shape.md#number-of-columns-in-matrix-x) | `count first x`
411 | [number of rows in matrix x](shape.md#411.-Number-of-rows-in-matrix-x) | `count x`



## Sort and merge

# | description | phrase
--:|-------------|-------
1  | [ascending ordinals (ranking, shareable)](sort.md#ordinals-ranking-shareable) | `asc[x]?x`
8, 9, 35, 38, 44 | [sort (rows) ](sort.md#sort-rows) | `asc x`, `desc x`
16 | [merge x y by g](sort.md#mesh) | `(x,y)[iasc idesc g]`
11, 12, 31 | [mesh: merge x y z under control of g](sort.md#mesh) | `(x,y,z)rank g`
13 | [ascending ordinals (ranking, all different)](sort.md#ordinals-ranking-all-different) | `iasc iasc x`
17 | [descending ordinals (ranking, all different)](sort.md#ordinals-ranking-all-different) | `idesc idesc x`
18, 19 | [sort char matrix x ascending by internal alphabet](sort.md) | `x[iasc x]`, ``x[iasc`$x]``
30 | grade up x according to key y | `x iasc y?x`
32 | [sort ascending indices x according to data y](sort.md#sort-ascending-indices-x-according-to-data-y) | `x iasc y x`
33 | [sort rows on column](sort.md#sort-rows-on-column) | `x iasc x[;y]`
34 | [choose grading direction](sort.md#Choose-grading-direction) | `x iasc x*1 -1[y]`
36 | [sort y on x](sort.md#sort-y-on-x) | `y iasc x`
37 | [invert permutation](sort.md#invert-permutation) | `iasc x`
42, 43 | [move flagged items to one end](sort.md#move-flagged-items-to-one-end) | `x idesc y`
156 | [sort y by value into x classes](sort.md#sort-y-by-value-into-x-classes) | `value asc y group x xrank y`
389 | [playing order of x ranked players](sort.md#playing-order-of-x-ranked-players) | `f:1+2 sv reverse tt neg floor neg 2 xlog x`<br/>`f*f<=x`



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




## Sublists

# | description | phrase
--:|-------------|-------
– | [indices from flags x](sublists.md#partition-a-list) | `where x`
5b | [indices from lengths x](sublists.md#partition-a-list) | `0,sums -1_x`
– | [partition list y into sublists](sublists.md#partition-a-list) | `(…)_y`
6, 14 | [aggregate function x on sublists of y](sublists.md#apply-aggregate-function-to-sublists) | `x each(…)_y` 
2, 3, 5, 7, 15  | [uniform function x on sublists of y](sublists.md#apply-uniform-function-to-sublists) | `raze x each(…)_y` 
21| rotate to the left 1 place each sublist of y determined by flags x | `y[iasc x+sums x]`
26 | [insert y "*" after "=" in x](sublists.md#insert-y-after-in-x) |`g:where x="="`<br>`raze((0,1+-1_ g)_x),\:y#"*"`
27 | insert 0 after indices of y of x | `count[x]>iasc(tc x),y`
28 | insert g items h after indices y of x | `a:g*count y`<br>`(x,a#h)iasc(tc x),a#count y`
29 | insert g items h before indices y of x | `a:g*count y`<br>`((a#h),x)iasc(a#y),tc x`
39, 40 | [reverse each sublist](sublists.md#reverse-each-sublist) | `x reverse idesc sums tc[x] in y`
213 | [maxima of sublists of x specified by boolean list y](sublists.mdmaxima-of-sublists-of-x-specified-by-boolean-list-y) | `max each where[y]_x`
254 | [running parity of sublists of y indicated by x](sublists.md#running-parity-of-sublists-of-y-indicated-by-x) | `raze(sums each where[x] _ y)mod 2`
255 | [running sum of sublists of y indicated by x](sublists.md#running-sum-of-sublists-of-y-indicated-by-x) | `raze sums each where[x] _ y` 
256 | [groups of 1s in y pointed at by x](sublists.md#groups-of-1s-in-y-pointed-at-by-x) | ==FIXME==
257 | [sums of sublists of x determined by lengths y](sublists.md#sums of sublists-of-x-determined-by-lengths-y) | `deltas sums[x] sums[y]-1`
265, 279 | [insert x\[i\] zeroes after i-th infix of y](sublists.md#insert-xi-zeroes-after-i-th-infix-of-y) | `raze((0,where y)_y),'(0,x)#'0`
277 | [end flags from lengths](sublists.md#end-flags-from-lengths) | `(1+til sum x)in sums x`
278 | [start flags from lengths](sublists.md#start-flags-from-lengths) | `(til sum x)in sums 0,x` 
283 | [find field y of fields beginning with first of x](sublists.md#find-field-y-of-fields-beginning-with-first-of-x) | `x where y=sums x=first x`
284 | [sum items of x marked by y](sublists.md#sum-items-of-x-marked-by-y) | `value sum each x group y`
289 | [or-scan of sublists of y flagged by x](sublists.md#or-scan-of-sublists-of-y-flagged-by-x) | `raze maxs each where[x]_ y`
290 | [and-scan of sublists of y flagged by x](sublists.md#and-scan-of-sublists-of-y-flagged-by-x) | `raze mins each where[x]_ y`
291 | [sums of sublists of y flagged by x](sublists.md#sums-of-sublists-of-y-flagged-by-x) | `sum each where[x]_y`
292 | [groups of 1s in y flagged by x](sublists.md#groups-of-1s-in-y-flagged-by-x) | `a:sums(>)prior y`<br/>`y and a in a where x&y`
296 | [starting positions of sublists from lengths x](sublists.md#starting-positions-of-sublists-from-lengths-x) | `sums -1_0,x`
404 | [end points for x fields of length y](sublists.md#end-points-for-x-fields-of-length-y) | `-1+sums x#y`
405 | [start points for x fields of length y](sublists.md#start-points-for-x-fields-of-length-y) | `where 0=(til x*y)mod 3`
414 | [ending indices from field lengths](sublists.md#ending-indices-from-field-lengths) | `sums[x]-1`
300 | [gth sublist of y flagged by x](sublists.md#gth-sublist-of-y-flagged-by-x) | `((where x)_ y)g`
415 | [lengths of infixes of 1 in x](sublists.md#lengths-of-infixes-of-1-in-x) | `deltas sums[x]where 1_(<)prior x,0`
417 | [end points of equal infixes](sublists.md#end-points-of-equal-infixes) | `where 1_(<)prior((=)prior x),0b`



## Temporal

# | description | phrase
--:|-------------|-------
74 | [number of days in month x of Gregorian year y](temp.md#number-of-days-in-month-x-of-Gregorian-year-y) | `{$[2=x;28+ly y;(0,12#7#31 30)x]}`
104| [date in ascending format](temp.md#date-in-ascending-format) | `"/"sv reverse 0 4 6_ x`
105 | [current time of 12-hour clock](temp.md#current-time-of-12-hour-clock) |`p:x>11:59:59`<br/>`string[x-43200*p]," ","AP"[p],"M"`
107 | [current date, American format](temp.md#current-date-American-format) | `"/"sv string 1 rotate parse ssr[;".";" "] string x`


## Tests

# | description | phrase
--:|-------------|-------
– | [is year x a leap year?](temp.md#is-year-a-leap-year) | `sum[0=x mod\:4 100 400]mod 2`
4  | are x and y permutations of each other? | `(asc x)~asc y`
20, 346 | is x a permutation? | `x~iasc iasc x`
85 | [is matrix x antisymmetric?](test.md#is-matrix-x-antisymmetric) | `x~neg flip x`
86 | [is matrix x symmetric?](test.md#is-matrix-x-symmetric) | `x~flip x`
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



## Text

# | description | phrase
--:|-------------|-------
25 | doubling quotes | `ssr[x;"\"";"\"\""]`
73, 266, 272, 298, 397 | [remove trailing blanks](text.md#remove-trailing-blanks) | `(neg reverse[x=" "]?0b)_ x`
267, 299 | [remove leading blanks](text.md#remove-leading-blanks) | `x where maxs x<>" "`
259 | [remove leading and trailing blanks](text.md#remove-leading-and-trailing-blanks) | `x{y _ x}/1 -1*(" "=1 reverse\x)?'0b`
76, 275 | [justify right](text.md#justify-right) | `neg[(reverse[x]=" ")?0b]rotate x`
160 | [move blanks to end of string](text.md#move blanks-to-end-of-string) | `x iasc x=" "`
177 | [ordinal of word in x pointed at by y](text.md#ordinal-of-word-in-x-pointed-at-by-y) | `sum not y<1+where x=" "`
177 | [find start of string x in string y](text.md#find-start-of-string-x-in-string-y) | `y ss x`
178 | [find first occurrence of string x in string y](text.md#find-first-occurrence-of-string-x-in-string-y) | `first y ss x`
184, 412 | [right-justify fields x of length y to length g](text.md#right-justify-fields-x-of-length-y-to-length-g) | `raze(neg g)#/:(g#" "),/:(sums 0,-1_y) _ x`
185, 276 | [left-justify fields x of length y to length g](text.md#left-justify-fields-x-of-length-y-to-length-g) | `raze g#/:((sums 0,-1_y)_x),\:g#" "`
205 | [remove trailing blank rows](text.md#remove-trailing-blank-rows) | `(neg sum mins reverse(and/)each x=" ")_ x`
209 | [remove trailing blank columns](text.md#remove-trailing-blank-columns) | `neg[sum mins reverse min x=" "]_'x`
210 | [remove leading blank columns](text.md#remove-leading-blank-columns) | `sum[mins min x=" "]_'x`
211 | [remove leading blank rows](text.md#remove-leading-blank-rows) | `((min each x=" ")?0b)_ x`
206 | [remove duplicate rows](strings.md#remove-duplicate-rows) | `distinct x`
216 | [rows of matrix x starting with y](text.md#rows-of-matrix-x-starting-with-y) | `x where x[;tc y]~\:y`
218 | [single blank row from multiple](text.md#single-blank-row-from-multiple) | `x where{x|1_x,1b}max" "<>flip x`
220 | [remove duplicate blank columns](text.md#remove-duplicate-blank-columns) | `x where{x|1_x,1b}max" "<>x`
225| [remove blank rows](text.md#remove-blank-rows) | `x where max" "<>flip x`
226| [remove blank columns](text.md#remove-blank-columns) | `x where max" "<>x`
231 | [which rows of x contain elements different from y?](text.md#which rows-of-x-contain-elements-different-from-y) | `max y<>flip x`
248, 323, 393 | [center text x in line of width y](text.md#center-text-x-in-line-of-width-y) | `neg[floor(y-count x)%2]rotate y#x,y#" "`
264, 271 | [insert x\[i\] blanks after y\[g\[i\]\]](text.md#insert-xi-blanks-after-ygi) | `raze((0,1+g)_y),'(x,0)#'" "`
293 | [locate quotes and text between them](text.md#locate-quotes-and-text-between-them) | `(or)prior(<>)scan x="\""`
294 | [locate text between quotes](text.md#locate-text-between-quotes) | `(and)prior(<>)scan x="\""`
295 | [depth of parentheses](text.md#depth-of-parentheses) | `sums({x-0b,-1_y}/)"()"=\:x`
297 | [spread flagged field heads right](text.md#spread-flagged-field-heads-right) | `x raze(count each a _ x)#'a:where y`
401 | [first word in string x](text.md#first-word-in-string-x) | 


## Utilities and constants

<i class="fas fa-download"></i>
[`phrases.q`](phrases.q)


```q
DEC:"0123456789"
HEX:"0123456789abcdef"
depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan{1=count distinct count each x}each(raze\)x]}
fac:{prd 1+til x}           / factorial
shape:{$[0=d:depth x; 
  0#0j; 
  d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}
tc:('[til;count])
zm:{(2#count x)#0}          / zero matrix (square matrix)
```