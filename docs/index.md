# Index of phrases




[Q Idiom](wikipage.md) | description | phrase
--:|-------------|-------
1  | [ascending ordinals (ranking, shareable)](sorts.md#ordinals-ranking-shareable) | `asc[x]?x`
13 | [ascending ordinals (ranking, all different)](sorts.md#ordinals-ranking-all-different) | `iasc iasc x`
17 | [descending ordinals (ranking, all different)](sorts.md#ordinals-ranking-all-different) | `idesc idesc x`
   | [indices from flags x](sublists.md#partition-a-list) | `where x`
5b | [indices from lengths x](sublists.md#partition-a-list) | `0,sums -1_x`
   | [partition list y into sublists](sublists.md#partition-a-list) | `(…)_y`
6, 14 | [aggregate function x on sublists of y](sublists.md#apply-aggregate-function-to-sublists) | `x each(…)_y` 
2, 3, 5, 7, 15  | [uniform function x on sublists of y](sublists.md#apply-uniform-function-to-sublists) | `raze x each(…)_y` 
4  | are x and y permutations of each other? | `(asc x)~asc y`
8, 9 | sort rows ascending | `asc each x`
10  | [==depth==](wikipage.md#10a-depth) 
11, 12 | [mesh: merge x y z under control of g](merge.md) | `(x,y,z)[iasc iasc g]`
16 | [merge x y by g](merge.md) | `(x,y)[iasc idesc g]`
18, 19 | [sort char matrix x ascending by internal alphabet](sorts.md) | `x[iasc x]`, ``x[iasc`$x]``
20 | is x a permutation? | `x~iasc iasc x`
21| rotate to the left 1 place each sublist of y determined by flags x | `y[iasc x+sums x]`
22 | index of first occurrence of minimum of x | `x?min x`
23 | index of first occurrence of maximum of x | `x?max x`
24 | median of x | `t:.5*1-count x`<br>`.5*sum over x[(iasc x) (neg floor t;floor neg t)]`
25 | doubling quotes | `ssr[x;"\"";"\"\""]`
26 | insert y after "=" in x |`g:where x="="`<br>`(x,"*")[count[x]&iasc til[count x],(y*count g)#g]`
27 | insert 0 after indices of y of x | `count[x]>iasc(til count x),y`
28 | insert g items h after indices y of x | `a:g*count y`<br>`(x,a#h)iasc(til count x),a#count y`
29 | insert g items h before indices y of x | `a:g*count y`<br>`((a#h),x)iasc(a#y),til count x`
30 | grade up x according to key y | `x[iasc y?x]`
