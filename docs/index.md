# Index of phrases




Groupings under headings are provisional.
Numbers in the tables refer to the defunct wiki page [QIdioms](wikipage.md).



## Cast

Q Idiom | description | phrase
--:|-------------|-------
45 | [binary representation of positive integer](cast.md#binary-representation-of-a-positive-integer) | `2 vs x`, `0b vs x`, `0x0 vs x` 
46 | [formatted integers](misc.md#formatted-integers) | `flip "0123456789" 10 vs x`
49 | [hexadecimals from integers](cast.md#hexadecimal-from-integer) | `"0123456789abcdef" 16 vs/:x`
56 | [hexadecimals from decimal characters](cast.md#hexadecimal-from-decimal-characters) | `"0123456789abcdef" 16 vs/: "i"$x`
53 | [decimal digits from integer](cast.md#decimal-digits-from-integer) | `10 vs x`
54 | [represent y in base x](cast.md#represent-y-in-base-x) | `x vs y`
57 | [vector from date](cast.md#vector-from-date) | `100000 100 100 vs x`
63 | [represent x in radix 10 100 1000](cast.md#represent-x-in-radix-10-100-1000) | `10 100 1000 vs x`


## Merge

Q Idiom | description | phrase
--:|-------------|-------
11, 12, 31 | [mesh: merge x y z under control of g](merge.md) | `(x,y,z)rank g`
16 | [merge x y by g](merge.md) | `(x,y)[iasc idesc g]`


## Miscellaneous

Q Idiom | description | phrase
--:|-------------|-------
4  | are x and y permutations of each other? | `(asc x)~asc y`
20 | is x a permutation? | `x~iasc iasc x`
21| rotate to the left 1 place each sublist of y determined by flags x | `y[iasc x+sums x]`
22 | find first occurrence of minimum of x | `x?min x`
23 | find first occurrence of maximum of x | `x?max x`
24 | median of x | `t:.5*1-count x`<br>`.5*sum over x[(iasc x) (neg floor t;floor neg t)]`
25 | doubling quotes | `ssr[x;"\"";"\"\""]`
41 | find flags in boolean vector | `where x`
42, 43 | [move flagged items to one end](sorts.mdmove-flagged-items-to-one-end) | `x idesc y`
47 | [polynomial with roots y](misc.md#polynomial-with-roots-y) | `{(x,0)-y*0,x} over 1,x`
48 | [saddle-point indices](misc.md##saddle-point-indices) | `rc[x;]where raze minmax x`
48a | flag row minimums | `rn:{x=min each x}`
48b | flag column maximums | `cx:{x=\:max x}`
48c | flag minmaxs | `minmax:{(rn x)&cx x}`
48e | row-column indices of ravel-indices y in matrix x | `rc:{(div;mod).\:(y;count first x)}`
50 | [connectivity list from connectivity matrix](misc.md#connectivity-list-from-connectivity-matrix) | `rc[x;]where raze x`
58 | [all pairs of `til[x]` and `til[y]`](misc.md#all-pairs-of-tilx-and-tily) | `ap:{x vs til prd x}x,y`
51 | [indices of an array](misc.md#indices-of-an-array) | `ap shape x`
10, 51a | depth of an array | `depth:{$[type[x]<0; 0; "j"$sum(and)scan{1=count distinct count each x}each(raze\)x]}`
51b | shape of an array | `shape:{$[0=d:depth x; 0#0j; d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}`
52, 59, 60 | [truth table of order x](misc.md#truth-table-of-order-x) | `2 vs til "j"$2 xexp x`
55 | [find items of y in array x](misc.md#find-items-of-y-in-array-x) | `shape[x] vs where raze[x] in raze y`
61 | [cyclic counter](misc.md#cyclic-counter) | `1+(1+til x)mod y`
62 | [integer and fractional parts of positive x](misc.md#integer-and-fractional-parts-of-positive-x) | `{f,'x-f:floor x}x`


## Sort

Q Idiom | description | phrase
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


## Sublists

Q Idiom | description | phrase
--:|-------------|-------
-   | [indices from flags x](sublists.md#partition-a-list) | `where x`
5b | [indices from lengths x](sublists.md#partition-a-list) | `0,sums -1_x`
-  | [partition list y into sublists](sublists.md#partition-a-list) | `(…)_y`
6, 14 | [aggregate function x on sublists of y](sublists.md#apply-aggregate-function-to-sublists) | `x each(…)_y` 
2, 3, 5, 7, 15  | [uniform function x on sublists of y](sublists.md#apply-uniform-function-to-sublists) | `raze x each(…)_y` 
26 | insert y after "=" in x |`g:where x="="`<br>`(x,"*")[count[x]&iasc til[count x],(y*count g)#g]`
27 | insert 0 after indices of y of x | `count[x]>iasc(til count x),y`
28 | insert g items h after indices y of x | `a:g*count y`<br>`(x,a#h)iasc(til count x),a#count y`
29 | insert g items h before indices y of x | `a:g*count y`<br>`((a#h),x)iasc(a#y),til count x`
39, 40 | [reverse each sublist](sublists.md#reverse-each-sublist) | `x reverse idesc sums til[count x]in y`


