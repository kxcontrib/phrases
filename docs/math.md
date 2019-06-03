# Mathematics




### Beta function

See gamma in appendix.

`Beta:{((gamma x)*gamma y)%gamma[x+y]}`

==DROP – WTF?==


## Combinations & permutations

### Number of combinations of n objects taken k at a time

```q
q)binn:{[n;k]fac[n]%fac[n-k]*fac[k]}
q)binn[12;7]
792f
q)binn[10;4]
210f
```


### Number of permutations of n objects taken k at a time

```q
q)fac:{prd 1+til x}
q)pn:{[n;k] fac[n]%fac[n-k]}
q)pn[5;3]
60f
```

Refactoring…

```q
q)n:5
q)k:3
q)fac[n]%fac[n-k]
60f
q)(prd 1+til k)%prd 1+til n-k
60f
q)prd 1+(n-k)_til n             / no floating-point op
60
q)prd(n-k-1)+til k              / reduce length of vector
60
```


### Permutations

```q
q)perm:{(1 0#x){raze(1 rotate)scan'x,'y}/x}
q)perm`a`b`c
a b c
b c a
c a b
b a c
a c b
c b a
q)
```


### Invert permutation 

The inverse of a permutation puts it in ascending order.

<big>`iasc x`</big>

```q
q)show x:-7?7
5 3 2 0 6 4 1
q)iasc x
3 6 2 1 5 0 4
q)x iasc x      / check
0 1 2 3 4 5 6
```


## Connectivity 

### Connectivity list from connectivity matrix

```q
q)show m:(1 0 1;1 0 1)
1 0 1
1 0 1
q)raze m
1 0 1 1 0 1
q)where raze m
0 2 3 5
q)rc[m;] where raze m
0 0 1 1
0 2 0 2
q)lm:{rc[x;]where raze x}
q)lm m
0 0 1 1
0 2 0 2
```


### Connectivity matrix from connectivity list

<!-- FIXME: complete -->

```q
q)y:(0 1;0 2;1 0;1 2;2 2)
q)x:3
q)x sv/:y
1 2 3 5 8
q)(til 9)in x sv/:y
011101001b
```


### Node matrix from connection matrix

(Inverse to 157.)

```q
q)x
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
```

Each column in `x` represents a path between 2 nodes:

-   From node 0 to node 2
-   From node 0 to node 1
-   From node 2 to node 3
-   From node 1 to node 2
-   From node 1 to node 3

```q
q)show a:1 -1=\:x
11000b 00011b 00100b 00000b
00000b 01000b 10010b 00101b
q)mul:{(mmu\:) . "f"$(flip each x;y)}
q)show b:mul[a;til count x]
0 0 2 1 1
2 1 3 2 3
q)nc:{mul[1 -1=\:x;til count x]}
q)nc x
0 0 2 1 1
2 1 3 2 3
```


### Connection matrix from node matrix

(Inverse to 148)

Node matrix top and bottom rows give from and to nodes.

```q
q)show x:(0 0 2 1 1;2 1 3 2 3)
0 0 2 1 1
2 1 3 2 3
q)/ Enumerate count of range
q)key count distinct raze x
0 1 2 3
q)/ Where is x equal to each of it
q)x=/:til count distinct raze x
11000b 00000b
00011b 01000b
00100b 10010b
00000b 00101b
q)/ Subtract "to" matrix from "from" matrix
q)(-/)each x=/:til count distinct raze x
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
```


## Fibonacci numbers

First 10 Fibonacci numbers.

```q
q)10 {x,sum -2#x}/0 1
0 1 1 2 3 5 8 13 21 34 55 89
```


## Maximum separation of items of x

```q
q)x:17 14 14 17 14 17 18
q)(max x)-min x
4
```


## Partitions of y with no part less than x

```q
q)part:{t:x _ til 1+ floor y%2;(raze t,''t part'y-t),y}  / recurses
q)part[3;10]
3 3 4
3 7
4 6
5 5
10
q)part[1;6]
1 1 1 1 1 1
1 1 1 1 2
1 1 1 3
1 1 2 2
1 1 4
1 2 3
1 5
2 2 2
2 4
3 3
6
q)count each part[1]'[1+til 10]
1 2 3 5 7 11 15 22 30 42
```


## Pascal’s triangle

```q
q)pt:{0+':x,0}
q)4 pt\ 1
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
```


## Pointer chasing

For `r` a primitive root of prime `p`, the additive list formed by `(r*til p)mod p` has an interesting property, first discussed by August Crelle in the early 19th century. For example, if we take such a list for the primitive root 3 of 7:

```q
q)show a:(3*til 7)mod 7  / list of successive sums of 3, starting from 0, mod 7
0 3 6 2 5 1 4
```

then if we treat the items of this list as pointers, and write

```q
q)a\[1]
1 3 2 6 4 5
```

we find that the new list is the successive powers of 3, mod 7.


## Polygon area

```q
q)area:{0.5*sum last[x]{(-)over y*reverse x}':x}
```

The binary `{(-)over y*reverse x}` yields the determinant of a 2-by-2 matrix. The binary `area` yields the area of a polygon whose x-y coordinates are, in order, the rows of a 2-column matrix.

```q
q)area(10 5;6 8;3 6;4 3;7 2)
24.5
```


## Quadratic solution

```q
q)qu:{(q%x),(z%q:qq[x;y;z])}
q)qq:{-0.5*y+sg[y]*ds[x;y;z]}
q)ds:{sqrt[(y*y)-(4*x*z)]}
q)sg:{(x>0)-(x<0)}   /or use the builtin signum
q)a:1
q)b:-1e30
q)c:1
q)sg[b]
-1
q)ds[a;b;c]
1e+30
q)qq[a;b;c]
1e+30
q)qu[a;b;c]
1e+30 1e-30
q)qu[1;-8;15]
5 3f
q){(q%x),z%q:0.5*y+signum[y]*sqrt(y*y)-4*x*z}[1;-8;15]
-5 -3f
```



## Saddle points

### Saddle-point indexes

```q
q)x
4 2 4 4 2 4
5 3 5 5 3 5
4 2 4 4 2 4
1 2 4 4 2 4
5 3 5 5 3 5
4 2 4 4 2 4
```


### Flag row minimums

```q
q)rn:{x=min each x}
q)rn x
010010b 
010010b
010010b
100000b
010010b
010010b
```


### Flag column maximums

```q
q)cx:{x=\:max x}
q)cx x
000000b
111111b
000000b
000000b
111111b
000000b
```


### Flag minmax of rows and columns

```q
q)minmax:{(rn x)&cx x}
q)minmax x
000000b
010010b
000000b
000000b
010010b
000000b
```


#### Find flags in ravel of Boolean matrix

```q
q)ones:{where raze x}
q)ones minmax x
7 10 25 28
```


### Row-column indexes 

Where `y` are indexes into the ravel of matrix `x`, returns the `x` row-column indexes of `y`.

```q
q)rc:{(div;mod).\:(y;count first x)}
```

Find saddle-point indexes.

```q
q)sp:{rc[x;ones minmax x]} 
q)sp x
1 1 4 4
1 4 1 4
```


### Value of saddle point

```q
q)show x:(5 4 6 4 12 5;16 2 4 5 16 18;8 18 7 12 16 11;20 17 16 14 16 20;16 8 12 9 17 13)
5  4  6  4  12 5
16 2  4  5  16 18
8  18 7  12 16 11
20 17 16 14 16 20
16 8  12 9  17 13
q)rn:{x=min each x}
q)cx:{x=\:max x}
q)minmax:{(rn x)&cx x}
q)minmax x
000000b
000000b
000000b
000100b
000000b
q)where raze minmax x
,21
q)raze[x]where raze minmax x
14
```



## Sets

### Set union

```q
q)x:"12345"
q)y:"4567890"
q)y,x where not x in y
"4567890123"
```

Or – gives different result with repeated items:

```q
q)distinct y,x
"4567890123"
```


### Set difference

```q
q)x:"12345"
q)y:"4567890"
q)x except y
"123"
```


### Set intersection

```q
q)x:"abcdefghijxyz"
q)y:"yacqwopzbx"
q)x where x in y
"abcxyz"
```


### Range union

```q
q)/ given ordered (lefts;rights)
q)/ interval 0 and where left is greater than 1+ max previous right
q)show r:(1 3;8 10;11 12;2 4)  / ranges
1  3
8  10
11 12
2  4
q)f:{(x b;1 rotate a b:0,where x>1+a:-1 rotate maxs y)}
q)flip f . flip asc r
1 4
8 12
q)
q)flip asc r
1 2 8  11
3 4 10 12
q){-1 rotate(|\)y} . flip asc r
12 3 4 10
q){-1 rotate maxs y} . flip asc r
12 3 4 10
q){x>1+-1 rotate maxs y} . flip asc r
0010b
q){0,where x>1+-1 rotate maxs y} . flip asc r
0 2
q){a b:0,where x>1+a:-1 rotate maxs y} . flip asc r
12 4
q){1 rotate a b:0,where x>1+a:-1 rotate maxs y} . flip asc r
4 12
q){(x b;1 rotate a b:0,where x>1+a:-1 rotate maxs y)} . flip asc r
1 8
4 12
q)flip {(x b;1 rotate a b:0,where x>1+a:-1 rotate maxs y)} . flip asc r
1 4
8 12
```



## Taylor

### Taylor series 

With coefficients y at point x.

```q
q)x:3
q)y:1 1 1
q)a:til count y
q)sum y*(x xexp a)%fac each a
8.5
q)sum y*(x xexp a)%prds 1|a     / refactor factorials
q)y:30#1
q)x:1
q)a:til count y
q)sum y*(x xexp a)%prds 1|a
2.718282
```


### Value of Taylor series with coefficients y at x

```q
q)x:12
q)y:7 5 6 6
q)1+til -1+count y
1 2 3
q)1+til -1+count y
1 2 3
q)1.0,x%1+til -1 +count y
1 12 6 4f
q)prds 1.0,x%1+til -1 +count y
1 12 72 288f
q)y*prds 1.0,x%1+til -1 +count y
7 60 432 1728f
q)sum y*prds 1.0,x%1+til(count y)-1
2227f
```


