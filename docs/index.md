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
144 | [histogram](cast.md#histogram) | `" *"(1+ til max x)<=\:/:x`
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
50 | [connectivity list from connectivity matrix](misc.md#connectivity-list-from-connectivity-matrix) | `rc[x;]where raze x`
71 | [connectivity matrix from connectivity list](math.md#connectivity-matrix-from-connectivity-list)| ==FIXME==
148 | [node matrix from connection matrix](math.md#node-matrix-from-connection-matrix)| `b:flip each x=/:1 -1`<br/>`(mmu\:) . "f"$(b;tc x)`
52, 59, 60 | [truth table of order x](math.md#truth-table-of-order-x) | `2 vs til "j"$2 xexp x`
62 | [integer and fractional parts of positive x](math.md#integer-and-fractional-parts-of-positive-x) | `{f,'x-f:floor x}x`
67 | [extrapolated value of abscissa x and ordinate y at g](math.md#extrapolated-value-of-abscissa-x-and-ordinate-y-at-g) | `g sv raze(enlist y) lsq x xexp/: reverse tc x`
69 | [value of ascending polynomial coefficients y at points x](math.md#value-of-ascending-polynomial-coefficients-y-at-points-x) |`x sv\:y`
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


## Strings

# | description | phrase
--:|-------------|-------
73 | [remove trailing blanks](misc.md#remove-trailing-blanks) | `neg[(reverse[x]=" ")?0b]_ x`
76 | [justify right](misc.md#justify-right) | `neg[(reverse[x]=" ")?0b]rotate x`



## Search

# | description | phrase
--:|-------------|-------
22 | find first occurrence of minimum of x | `x?min x`
23 | find first occurrence of maximum of x | `x?max x`
41 | find flags in boolean vector | `where x`
55 | [find items of y in array x](misc.md#find-items-of-y-in-array-x) | `shape[x] vs where raze[x] in raze y`
79 | [find last non-blank](misc.md#find-last-non-blank) | `(" "=reverse x)?0b`
143 | [find distinct items](misc.md#find-distinct-items) | `value group x`
147 | [find string x in string y](misc.md#find-string-x-in-string-y) | `z:where y=first x`<br/>`z where x~/:y z+\:tc x`


## Sort

# | description | phrase
--:|-------------|-------
1  | [ascending ordinals (ranking, shareable)](sorts.md#ordinals-ranking-shareable) | `asc[x]?x`
8, 9, 35, 38, 44 | [sort (rows) ](sorts.md#sort-rows) | `asc x`, `desc x`
13 | [ascending ordinals (ranking, all different)](sorts.md#ordinals-ranking-all-different) | `iasc iasc x`
17 | [descending ordinals (ranking, all different)](sorts.md#ordinals-ranking-all-different) | `idesc idesc x`
18, 19 | [sort char matrix x ascending by internal alphabet](sorts.md) | `x[iasc x]`, ``x[iasc`$x]``
30 | grade up x according to key y | `x iasc y?x`
32 | [sort ascending indices x according to data y](sorts.md#sort-ascending-indices-x-according-to-data-y) | `x iasc y x`
33 | [sort rows on column](sorts.md#sort-rows-on-column) | `x iasc x[;y]`
34 | [choose grading direction](sorts.md#Choose-grading-direction) | `x iasc x*1 -1[y]`
36 | [sort y on x](sorts.md#sort-y-on-x) | `y iasc x`
37 | [invert permutation](sorts.md#invert-permutation) | `iasc x`
42, 43 | [move flagged items to one end](sorts.md#move-flagged-items-to-one-end) | `x idesc y`


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


## Temporal

# | description | phrase
--:|-------------|-------
– | [is year x a leap year?](temp.md#is-year-a-leap-year) | `sum[0=x mod\:4 100 400]mod 2`
74 | [number of days in month x of Gregorian year y](temp.md#number-of-days-in-month-x-of-Gregorian-year-y) | `{$[2=x;28+ly y;(0,12#7#31 30)x]}`
104| [date in ascending format](temp.md#date-in-ascending-format) | `"/"sv reverse 0 4 6_ x`
105 | [current time of 12-hour clock](temp.md#current-time-of-12-hour-clock) |`p:x>11:59:59`<br/>`string[x-43200*p]," ","AP"[p],"M"`
107 | [current date, American format](temp.md#current-date-American-format) | `"/"sv string 1 rotate parse ssr[;".";" "] string x`


## Utilities

```q
DEC:"0123456789"
HEX:"0123456789abcdef"
fac:{prd 1+til x}           / factorial
tc:('[til;count])
```