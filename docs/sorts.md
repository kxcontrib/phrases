---
keywords: ascending, idiom, phrase, rank, ranking, shareable, sort, sorted
---
# Sorts


<i class="far fa-hand-point-right"></i>
Reference:
[`asc`, `iasc`, `xasc`](https://code.kx.com/v2/ref/asc/),
[`desc`, `idesc`, `xdesc`](https://code.kx.com/v2/ref/desc/)


## Ordinals: ranking, shareable

<big>`asc[x]?x`</big>  
<big>`desc[x]?x`</big>

```q
q)x:11 17 12 13 13 13 13 18
q)asc[x]
`s#11 12 13 13 13 13 17 18
q)asc[x]?x
0 6 1 2 2 2 2 7
```

`asc x` returns the items of `x` sorted in ascending order. 
`asc[x]?x` then finds the first position of each item in the sorted list. 

Similarly for `desc`.

The result is a **ranking** in which the positions are **shareable**: for example, the fourth to seventh items of `x` share the ranking of 2.


## Ordinals: ranking, all different

```q
q)x:15 16 13 18 15 12 13
q)iasc iasc x
3 5 1 6 4 0 2
q)idesc idesc x
5 6 3 0 4 1 2
```


## Sort rows 

```q
q)show x:(6 3 3 9 7;9 4 4 7 9;9 4 7 8 9)
6 3 3 9 7
9 4 4 7 9
9 4 7 8 9
q)desc x        / sort rows descending
9 4 7 8 9
9 4 4 7 9
6 3 3 9 7
q)asc each x    / sort each row ascending
3 3 6 7 9
4 4 7 9 9
4 7 8 9 9
```




## Sorting and grading sublists

<i class="far fa-hand-point-right"></i>
[Operations on sublists](sublists.md#apply-uniform-function-to-sublists)