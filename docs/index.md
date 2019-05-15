# Index of phrases




Groupings under headings are provisional.
Numbers in the tables refer to the defunct wiki page [QIdioms](wikipage.md).

!!! tip "Follow the links to worked examples and alternative solutions."



## Casting and formatting

# | description | phrase
--:|-------------|-------
45 | [binary representation of positive integer](cast.md#binary-representation-of-a-positive-integer) | `2 vs x`, `0b vs x`, `0x0 vs x` 
46 | [formatted integers](cast.md#formatted-integers) | `flip DEC 10 vs x`
49 | [hexadecimals from integers](cast.md#hexadecimal-from-integer) | `HEX 16 vs x`
56 | [hexadecimals from decimal characters](cast.md#hexadecimal-from-decimal-characters) | `HEX 16 vs "i"$x`
53 | [decimal digits from integer](cast.md#decimal-digits-from-integer) | `10 vs x`
54 | [represent y in base x](cast.md#represent-y-in-base-x) | `x vs y`
57 | [vector from date](cast.md#vector-from-date) | `100000 100 100 vs x`
63 | [represent x in radix 10 100 1000](cast.md#represent-x-in-radix-10-100-1000) | `10 100 1000 vs x`
64 | [character time hh:mm:ss from integer hhmmss](cast.md#character-time-hhmmss-from-integer-hhmmss) | `":"sv 0 2 4_ string x`
65 | [character date yyyy/mm/dd from integer yyyymmdd](cast.md#character-date-yyyymmdd-from-integer-yyyymmdd) | `"/"sv 0 4 6_ string x`
72 | [encode date as integer](misc.md#encode-date-as-integer) |`"I"$ string[x] except "."`
75 | [decimal from hexadecimal](cast.md#decimal-from-hexadecimal) | `16 sv HEX?x`
78 | [number from alphanumeric](cast.md#number-from-alphanumeric)| `parse x`
84 | [scalar from boolean vector](cast.md#scalar-from-boolean-vector) | `2 sv x`
93 | [numbers from alphanumeric matrix](cast.md#numbers-from-alphanumeric-matrix) | `parse each x`
94 | [number from alphanumeric x, default y](cast.md#number-from-alphanumeric-x-default-y) | `parse $[x~"";y;x]`
95 | [numeric from proper alphanumeric non-negative integer](cast.md#numeric-from-proper-alphanumeric-non-negative-integer) | `parse x`
99 | [numeric vector from evaluating rows of character matrix](cast.md#numeric-vector-from-evaluating-rows-of-character-matrix) | `raze('[eval;parse])each x`
106 | [leading zeros for positive integers x in field width y](cast.md#leading-zeros-for-positive-integers-x-in-field-width-y) | `1_'string x+10 xexp y`
111 | [count of format of x](cast.md#count-of-format-of-x) | `('[count;string])`
144 | [histogram](cast.md#histogram) | `" *"(1+ til max x)<=/:x`
166 | [barchart of integer list x](cast.md#barchart-of-integer-list-x)| `" X" reverse til[max x]<\:x`
170 | [horizontal barchart of x, normalized to length y](cast.md#horizontal-barchart-of-x-normalized-to-length-y) | `" X" (floor x*y%max x)>\:til y`
171 | [horizontal barchart of integers](cast.md#horizontal-barchart-of-integers) | `" X" x>\:til max x`
149 | [number of decimals in x, maximum y](cast.md#number-of-decimals-in-x-maximum-y) | `sum each maxs each "0"<>reverse each string floor(10 xexp y)*x mod 1`


## Mathematics

# | description | phrase
--:|-------------|-------
4  | are x and y permutations of each other? | `(asc x)~asc y`
20 | is x a permutation? | `x~iasc iasc x`
24 | median of x | `t:.5*1-count x`<br>`.5*sum over x[(iasc x) (neg floor t;floor neg t)]`
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
158. 52, 59, 60 | [truth table of order x](math.md#truth-table-of-order-x) | `2 vs til "j"$2 xexp x`
62 | [integer and fractional parts of positive x](math.md#integer-and-fractional-parts-of-positive-x) | `{f,'x-f:floor x}x`
67 | [extrapolated value of abscissa x and ordinate y at g](math.md#extrapolated-value-of-abscissa-x-and-ordinate-y-at-g) | `g sv raze(enlist y) lsq x xexp/: reverse tc x`
69, 227 | [value of ascending polynomial coefficients y at points x](math.md#value-of-ascending-polynomial-coefficients-y-at-points-x) |`x sv\:y`
77 | [present value of cash flows c at times t and discount rate d](math.md#present-value-of-cash-flows)| `sum c*d xexp t`
82 | [future value of cash flows](math.md#future-value-of-cash-flows) | `sum x* (1+y%100) xexp reverse tc x`
85 | [is matrix x antisymmetric?](math.md#is-matrix-x-antisymmetric) | `x~neg flip x`
86 | [is matrix x symmetric?](math.md#is-matrix-x-symmetric) | `x~flip x`
87| [number of decimals](math.md#number-of-decimals) | `count[string x-floor x]-2`
123.1 | [normal deviates from interval (0,1)](math.md##normal-deviates-from-interval-01) | `x?1.`
124 | [predicted values of exponential fit](math.md#predicted-values-of-exponential-fit) | `a:x xexp/:0 1`<br/>`exp flip[a]mmu first(enlist log y)lsq a`
125 | [predicted values of best linear fit (least squares)](math.md#predicted-values-of-best-linear-fit-least-squares) | `a:x xexp/:0 1`<br/>`(flip a)mmu first(enlist y)lsq a`
126 | [G-degree polynomial fit of points (x,y)](math.md#g-degree-polynomial-fit-of-points-xy) | `a:x xexp/:til g+1`<br/>`reverse first (enlist y)lsq a`
127 | [coefficients of exponential fit of points (x,y)](math.md#coefficients-of-exponential-fit-of-points-xy) | ==FIXME==
128 | [coefficients of best linear fit of points (x,y) (least squares)](math.md#coefficients-of-best-linear-fit-of-points-xy-least-squares) | `(enlist y)lsq x xexp/:0 1`
129 | arctangent y÷x | `atan y%x`
131 | [complementary angle (arccos sin x)](math.md#complementary-angle-arccos-sin-x) | `acos sin x`
132 | [rotation matrix for angle x (in radians) counter-clockwise](math.md#rotation-matrix-for-angle-x-in-radians-counter-clockwise) | `((cos x;neg sin x);(sin x;cos x))`
133 | [degrees from radians](math.md#degrees-from-radians) | `57.295779513082323*x`
134| [radians from degrees](math.md#radians-from-degrees) | `0.017453292519943295*x`
135 | [number of permutations of n objects taken k at a time](math.md#number-of-permutations-of-n-objects-taken-k-at-a-time) | `prd(n-k-1)+til k`
136, 1007 | [Pascal’s triangle](math.md#pascals-triangle) | `x {0+':x,0}\ 1`
137 | [Taylor series](math.md#taylor-series) | `sum y*(x xexp a)%prds 1|a:tc y`
139 | [Beta function](math.md#beta-function) | ==FIXME==
142 | [number of combinations of n objects taken k at a time](math.md#number-of-combinations-of-n-objects-taken-k-at-a-time) | `fac[n]%fac[n-k]*fac[k]`
146 | [compound interest for principals y at percentages g for periods x](math.md#compound-interest-for-principals-y-at-percentages-g-for-periods-x) | `y*\:(1+g%100)xexp\:x`
150 | [sum items of x given by y](math.md#sum-items-of-x-given-by-y) | `sum each x value group y`
155 | [greatest common divisor](math.md#greatest-common-divisor) | `1+last where min each 0=x mod/:1+til min x`
161 | [is x upper triangular?](math.md#is-x-upper-triangular) | `zm[x]~x*{x>\:x}tc x`
162 | [is x lower triangular?](math.md#is-x-lower-triangular) | `zm[x]~x*{x<\:x}tc x`
163 | [polynomial product](math.md#polynomial-product) | `sum(tc x)rotate'(1_'zm x),'y*/:x`
164 | [divisors](math.md#divisors) | `where 0=x mod/:til 1+x`
175 | [primes to n](math.md#primes-to-n) | `1+where 2=sum 0=x mod/:x:1+til n`
183 | [maximum table](math.md#maximum-table) | `{x&\:x}til x`
186 | [annuity coefficient for x periods at interest rate y%](math.md#annuity-coefficient-for-x-periods-at-interest-rate-y) | `y%/:100*flip 1-(1+y%100)xexp\:neg x`
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
222 | [maximum of x with weights y](math.md#maximum-of-x-with-weights-y) | `max x*y`
223 | [minimum of x with weights y](math.md#minimum-of-x-with-weights-y) | `min x*y`
224 | [extend distance table to next leg](math.md#extend-distance-table-to-next-leg) | `x('[min;+])\:x`
230 | [extend a transitive binary relation](math.md#extend-a-transitive-binary-relation) | ==FIXME==
237 | [average (mean) of x weighted by y](math.md#average-mean-of-x-weighted-by-y) | `(sum x*y)%count x`
239 | [sum reciprocal series](math.md#sum-reciprocal-series) | `sum y%x`
240 | [matrix product](math.md#matrix-product) | `x mmu y`
241 | [sum over subsets of x specified by y](math.md#sum-over-subsets-of-x-specified-by-y) | ==FIXME==
242, 246 | [sum squares of x](math.md#sum-squares-of-x) | `sum x*x`
243 | [dot product of vectors](math.md#dot-product-of-vectors) | `sum x*y`
244 | [product over subsets of x specified by y](math.md#product-over-subsets-of-x-specified-by-y) | `x('[prd;xexp])\:y`
260 | [first 10 figurate numbers of order x](math.md#first-10-figurate-numbers-of-order-x) | `x+\/10#1`



## Merge

# | description | phrase
--:|-------------|-------
11, 12, 31 | [mesh: merge x y z under control of g](merge.md) | `(x,y,z)rank g`
16 | [merge x y by g](merge.md) | `(x,y)[iasc idesc g]`


## Miscellaneous

# | description | phrase
--:|-------------|-------
25 | doubling quotes | `ssr[x;"\"";"\"\""]`
58 | [all pairs of `til[x]` and `til[y]`](misc.md#all-pairs-of-tilx-and-tily) | `ap:{x vs til prd x}x,y`
51 | [indices of an array](misc.md#indices-of-an-array) | `ap shape x`
10, 51a | depth of an array | `depth:{$[type[x]<0; 0; "j"$sum(and)scan{1=count distinct count each x}each(raze\)x]}`
51b | shape of an array | `shape:{$[0=d:depth x; 0#0j; d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}`
61 | [cyclic counter](misc.md#cyclic-counter) | `1+(1+til x)mod y`
66 | [selection by encoded list](misc.md#selection-by-encoded-list) | `2 vs x`
70 | [remove duplicate rows](misc.md#remove-duplicate-rows) | `distinct x`
80 | [scattered indexing](misc.md#scattered-indexing) | `x ./: y`
81 | [raveled index from general index](misc.md#raveled-index-from-general-index) | `shape[x] sv y`
88 | [name variable according to x](misc.md#name-variable-according-to-x) | ``(`$x)set y``
96 | conditional execution | `$[1b;x;y]`<br/>`if[1b;x:42]`
98 | [execute rows of character matrix](misc.md#execute-rows-of-character-matrix) | `('[eval;parse])each x`
100 | [indexing arbitrary rank array](misc.md#indexing-arbitrary rank-array)| `x . y`
101 | [sum numbers in character matrix](misc.md#sum-numbers-in-character-matrix) | `sum parse " " sv x`
115, 116, 117 | [case structure](misc.md#case-structure) | `$[c0;t0;c1;t1;c2;t2;c3;t3;f]`
121 | [y-shaped array of numbers from x\[0\] to x\[1\]-1](misc.md#y-shaped-array-of-numbers-from-x0-to-x1-1) | `y#x[0]+prd[y]?x[1]-x[0]`
122 | [y items selected with replacement from til x](misc.md#y-items-selected-with-replacement-from-til-x) | `y?x`
123 | [y objects selected without replacement from til x](misc.md#y objects-selected-without-replacement-from-til-x) | `neg[y]?x`
145 | [count of x between endpoints (l,h)](misc.md#count-of-x-between-endpoints-lh) | `sum raze (x<h)&x>l`
151 | [efficient execution of f x where x has repeated values](misc.md#efficient-execution-of-f-x-where-x-has-repeated-values) | `u:distinct x`<br/>`(f u)u?x`
152 | [sum items of y by ordered codes g in x](misc.md#sum-items-of-y-by-ordered-codes-g-in-x) | `sum each((count[g]#0),y)value group g,x`
154 | [range; nub; remove duplicates](misc.md#range-nub-remove-duplicates) ` distinct x`
159, 214, 215 | [is range of x 1?](misc.md#is-range-of-x-1) | `1=count distinct x`
165 | [list of x zeros preceded by (y-x) ones](misc.md#list-of-x-zeros-preceded-by-y-x-ones) | `1 0 where(y-x),x`
167 | [list of x ones preceded by (y-x) zeros](misc.md#list-of-x-ones-preceded-by-y-x-zeros) | `1 0 where(y-x),x`
168 | [list of x zeros followed by (y-x) ones](misc.md#list-of-x-zeros-followed-by-y-x-ones) | `0 1 where x,y-x`
169, 172 | [list of x ones followed by (y-x) zeros](misc.md#list-of-x-ones-followed-by-y-x-zeros) | `1 0 where x,y-x`
173 | [assign x to one of y classes of width h, starting with g](misc.md#assign-x-to-one-of-y-classes-of-width-h-starting-with-g) | ==FIXME==
174 | [move x into first quadrant](misc.md#move-x-into-first-quadrant) | `{x-min x}each x`
179 | [contour levels y at points with altitude x](misc.md#contour-levels-y-at-points-with-altitude-x) | `y -1+sum not y>x`
180 | [is x in range \[y\)](misc.md#is-x-in-range-y) | `(</')x<\:y`
181 | [which class of y x belongs to](misc.md#which-class-of-y-x-belongs-to) | `-1+sum x>/:y`
200 | [replicating a dimension of rank-3 array x y-fold](misc.md#replicating-a-dimension-of-rank-3-array-x-y-fold) | `x[;raze(y#1)*\:til(shape x)1;]`
201 | [moving index y-wide for x](misc.md#moving-index-y-wide-for-x) | `y+til count[x]-y-1`
202 | [indexes of infixes of length y](misc.md#indexes-of-infixes-of-length-y) | `x+\:til y`
203 | [one-column matrix from numeric vector](misc.md#one-column-matrix-from-numeric-vector) | `1#'x`
204 | [numeric array and its negative](misc.md#numeric-array-and-its-negative) |  `x,''neg x`
221 | [is x an integer in interval [g,h)?](misc.md#is-x-an-integer-in-interval-gh) | `(x=floor x)&(</)x<g,h`
233 | [is x within range \[ y \)?](misc.md#is-x-within-range-y) | `(<)over x<y`
234, 235 | [is x within range \( y \]?](misc.md#is-x-within-range-y) | `(<)over x<=y`
232 | [is y a row of x?](misc.md#is-y-a-row-of-x) | `y in x`
236 | [number of occurrences of x in y](misc.md#number-of-occurrences-of-x-in-y) | `sum y=x`
245 | [randomize the random seed](misc.md#randomize-the-random-seed) | `\S x`
247 | [interlace x\[i\]#1 and y\[i\]#0](misc.md#interlace-xi1-and-yi0) | `(raze/)flip(x;y)#''1 0`
249 | [offset enumeration](misc.md#offset-enumeration) | `x+til y`
250, 251, 253 | [replicate y x times](misc.md#replicate-y-x-times) | `x#y`
252 | [x alternate takes of 1s and 0s](misc.md#x-alternate-takes-of-1s-and-0s) | `(count[x]#1 0)where x`
261 | [first group of 1s](misc.md#first-group-of-1s) | `x and(and)scan x=(or)scan x`



## Search

# | description | phrase
--:|-------------|-------
22 | find first occurrence of minimum of x | `x?min x`
23 | find first occurrence of maximum of x | `x?max x`
41 | find flags in boolean vector | `where x`
55 | [find items of y in array x](misc.md#find-items-of-y-in-array-x) | `shape[x] vs where raze[x] in raze y`
79 | [find last non-blank](misc.md#find-last-non-blank) | `(" "=reverse x)?0b`
143 | [find distinct items](misc.md#find-distinct-items) | `value group x`
147, 219 | [find string x in string y](misc.md#find-string-x-in-string-y) | `z:where y=first x`<br/>`z where x~/:y z+\:tc x`
153 | [find rows of y in in corresponding rows of x](search.md#find-rows-of-y-in-in-corresponding-rows-of-x) | `x?'y`
182 | [find consecutive repeated elements](misc.md#find-consecutive-repeated-elements) | `where differ x`
207 | [find rows of matrix y in matrix x](search.md#find-rows-of-matrix-y-in-matrix-x) | `x?y`
217 | [find last non-blank in string](search.md#find-last-non-blank-in-string)| `last where x<>" "`



## Sort

# | description | phrase
--:|-------------|-------
1  | [ascending ordinals (ranking, shareable)](sort.md#ordinals-ranking-shareable) | `asc[x]?x`
8, 9, 35, 38, 44 | [sort (rows) ](sort.md#sort-rows) | `asc x`, `desc x`
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


## Sublists

# | description | phrase
--:|-------------|-------
n/a | [indices from flags x](sublists.md#partition-a-list) | `where x`
5b | [indices from lengths x](sublists.md#partition-a-list) | `0,sums -1_x`
n/a | [partition list y into sublists](sublists.md#partition-a-list) | `(…)_y`
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



## Temporal

# | description | phrase
--:|-------------|-------
– | [is year x a leap year?](temp.md#is-year-a-leap-year) | `sum[0=x mod\:4 100 400]mod 2`
74 | [number of days in month x of Gregorian year y](temp.md#number-of-days-in-month-x-of-Gregorian-year-y) | `{$[2=x;28+ly y;(0,12#7#31 30)x]}`
104| [date in ascending format](temp.md#date-in-ascending-format) | `"/"sv reverse 0 4 6_ x`
105 | [current time of 12-hour clock](temp.md#current-time-of-12-hour-clock) |`p:x>11:59:59`<br/>`string[x-43200*p]," ","AP"[p],"M"`
107 | [current date, American format](temp.md#current-date-American-format) | `"/"sv string 1 rotate parse ssr[;".";" "] string x`


## Text

# | description | phrase
--:|-------------|-------
73 | [remove trailing blanks](text.md#remove-trailing-blanks) | `neg[(reverse[x]=" ")?0b]_ x`
259 | [remove leading and trailing blanks](text.md#remove-leading-and-trailing-blanks) | `x{y _ x}/1 -1*(" "=1 reverse\x)?'0b`
76 | [justify right](text.md#justify-right) | `neg[(reverse[x]=" ")?0b]rotate x`
160 | [move blanks to end of string](text.md#move blanks-to-end-of-string) | `x iasc x=" "`
177 | [ordinal of word in x pointed at by y](text.md#ordinal-of-word-in-x-pointed-at-by-y) | `sum not y<1+where x=" "`
177 | [find start of string x in string y](text.md#find-start-of-string-x-in-string-y) | `y ss x`
178 | [find first occurrence of string x in string y](text.md#find-first-occurrence-of-string-x-in-string-y) | `first y ss x`
184 | [right-justify fields x of length y to length g](text.md#right-justify-fields-x-of-length-y-to-length-g) | `raze(neg g)#/:(g#" "),/:(sums 0,-1_y) _ x`
185 | [left-justify fields x of length y to length g](text.md#left-justify-fields-x-of-length-y-to-length-g) | `raze g#/:((sums 0,-1_y)_x),\:g#" "`
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
228, 229 | [is y a row of x?](text.md#is-y-a-row-of-x) | `y in x`
231 | [which rows of x contain elements different from y?](text.md#which rows-of-x-contain-elements-different-from-y) | `max y<>flip x`
248 | [center text x in line of width y](text.md#center-text-x-in-line-of-width-y) | `neg[floor(y-count x)%2]rotate y#x,y#" "`



## Utilities and constants

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