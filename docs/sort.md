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


## Sort 

```q
q)asc "quick brown fox"     / sort list ascending
`s#"  bcfiknooqruwx"
q)desc "quick brown fox"    / sort list descending
"xwurqoonkifcb  "
q)show x:(6 3 3 9 7;9 4 7 8 9;9 4 4 7 9)
6 3 3 9 7
9 4 7 8 9
9 4 4 7 9
q)asc x                     / sort rows ascending
6 3 3 9 7
9 4 4 7 9
9 4 7 8 9
q)desc x                    / sort rows descending
9 4 7 8 9
9 4 4 7 9
6 3 3 9 7
```


## Sort rows on column

```q
q)show x:5 6#30?100
37 41 41 72 60 0
91 59 5  19 17 26
24 90 28 63 42 56
75 67 45 14 38 49
85 11 23 61 64 44
q)y:2
q)x[;y]
41 5 28 45 23
q)iasc x[;y]
1 4 2 0 3
q)x iasc x[;y]
91 59 5  19 17 26
85 11 23 61 64 44
24 90 28 63 42 56
37 41 41 72 60 0
75 67 45 14 38 49
```


## Sort ascending indices x according to data y

```q
q)x:2 3 4 5 0 1 8 7 6
q)y:79 74 78 76 77 75 73 72 71
q)x iasc y x
8 7 6 1 5 3 4 2 0
```



## Choose grading direction

```q
q)show x:10?100
66 36 37 44 28 20 30 34 77 61
q)x iasc x
20 28 30 34 36 37 44 61 66 77
q)x iasc x*-1
77 66 61 44 37 36 34 30 28 20
q)x iasc each x*/:1 -1
20 28 30 34 36 37 44 61 66 77
77 66 61 44 37 36 34 30 28 20
```


## Sort y on x

```q
q)show x:6?10
q)x
9 2 3 1 9 3
q)show y:6?20
7 8 17 11 16 6
q)y iasc x
11 8 17 6 7 16
```


## Move flagged items to one end

```q
q)x:"mjinase"
q)x idesc 0100110b          / move flagged items to start
"jasmine"
q)x:" sign if i cant "
q)x iasc x=" "              / move blanks to end of text
"significant     "
```



## Invert permutation 

The inverse of a permutation puts it in ascending order.

```q
q)show x:-7?7
q)x
5 3 2 0 6 4 1
q)iasc x
3 6 2 1 5 0 4
q)x iasc x      / check
0 1 2 3 4 5 6
```


## Sort y b y value into x classes 

Between min and max y.

```q
q)show y:20?100
39 64 49 82 40 88 77 30 17 23 12 66 36 37 44 28 20 30 34 77
q)4 xrank y
2 2 2 3 2 3 3 1 0 0 0 3 1 1 2 0 0 1 1 3
q)group 4 xrank y
2| 0 1  2  4  14
3| 3 5  6  11 19
1| 7 12 13 17 18
0| 8 9  10 15 16
q)y group 4 xrank y
2| 39 64 49 40 44
3| 82 88 77 66 77
1| 30 36 37 30 34
0| 17 23 12 28 20
q)value asc y group 4 xrank y
17 23 12 28 20
30 36 37 30 34
39 64 49 40 44
82 88 77 66 77
```


## Mesh


_Merge `x`, `y`, and `z` under control of `g`_

<big>`(x,y,z…)rank g`</big> 

```q
q)x:"abcd"
q)y:"123456789"
q)z:"zz"
q)g:1 0 1 1 2 1 2 1 1 0 1 0 1 0 1
q)iasc iasc g
4 0 5 6 13 7 14 8 9 1 10 2 11 3 12
q)rank g
4 0 5 6 13 7 14 8 9 1 10 2 11 3 12
q)(x,y,z)rank g
"1a23z4z56b7c8d9"
```


<big>`(x,y,z…)iasc idesc g`</big>

```q
q)x:5 9 8 7 4 3
q)y:10 20 30 40
q)g:1 0 1 1 0 0 1 0 1 1
q)(x,y)iasc idesc g
5 10 9 8 20 30 7 40 4 3
```


<i class="far fa-hand-point-right"></i>
Reference: 
[`iasc`](https://code.kx.com/v2/ref/iasc/), 
[`rank`](https://code.kx.com/v2/ref/rank/), 
[Case](https://code.kx.com/v2/ref/maps/#case)


## Playing order of x ranked players

```q
q)x:6
q)show f:1+2 sv reverse tt neg floor neg 2 xlog x
1 5 3 7 2 6 4 8
q)f*f<=x
1 5 3 0 2 6 4 0
```


## Merge items from x and y alternately

```q
q)x:1 3 5 7
q)y:2 4 6 8
q)raze x,'y
1 2 3 4 5 6 7 8
```


## Assign x to one of y classes of width h, starting with g

```q
q)f:{[x;y;g;h] value -1+ -1 _ count each group(1+til y),neg floor neg(x-g)%h}
q)x:32 56 36 48 36 24 28 44 52 32
q)y:4
q)h:10
q)g:10
q)f[x;y;g;h]
0 2 4 2
```

==FIXME==


## Which class of y x belongs to

```q
q)cl:{-1+sum x>/:y}
q)x:87 9 931 7 27 92 654 1416 7 911
q)y:0 50 100 1000
q)sum x>/:y
2 1 3 1 1 2 3 4 1 3
q)x>/:y
1111111111b
1010011101b
0010001101b
0000000100b
q)-1 sum x>/:y
'type
q)-1+ sum x>/:y
1 0 2 0 0 1 2 3 0 2
q)cl[x;y]
1 0 2 0 0 1 2 3 0 2
```





## Sorting and grading sublists

<i class="far fa-hand-point-right"></i>
[Operations on sublists](sub.md#apply-uniform-function-to-sublists)