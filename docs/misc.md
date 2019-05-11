# Miscellaneous


## All pairs of `til[x]` and `til[y]`

```q
q)x:3
q)y:4
q)(x,y) vs til x*y
0 0 0 0 1 1 1 1 2 2 2 2
0 1 2 3 0 1 2 3 0 1 2 3
q)flip til[x] cross til y
0 0 0 0 1 1 1 1 2 2 2 2
0 1 2 3 0 1 2 3 0 1 2 3
```



## Indices of an array

The [_depth_](/v2/basics/glossary.md#depth) of a list is the number of nesting levels at which it is rectangular. 
Its _shape_ is a vector of its count at each level at which it is rectangular, and corresponds to the left argument of [Take](/v2/ref/take/).

```q
q)depth:{$[type[x]<0; 0; "j"$sum(and)scan{1=count distinct count each x}each(raze\)x]}
q)shape:{$[0=d:depth x; 0#0j; d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}
q)ix:('[{x vs til prd x};shape])
q)ix til 6
0 1 2 3 4 5
q)ix 2 3#til 6
0 0 0 1 1 1
0 1 2 0 1 2
q)ix 2 3 2#til 12
0 0 0 0 0 0 1 1 1 1 1 1
0 0 1 1 2 2 0 0 1 1 2 2
0 1 0 1 0 1 0 1 0 1 0 1
```


## Find items of y in array x

```q
q)show x:2 3#6?10
5 1 2
2 0 3
q)show y:4 5#20?10
2 2 1 7 3
1 4 0 6 4
6 7 6 3 8
4 8 0 1 0
q)shape[x] vs where raze[y]in raze x
0 0 0 1 1 0 0 1 0 0
0 1 2 1 2 1 1 2 0 1
```


## Cyclic counter 

Length `x`, repeating 1 through `y`

```q
q)x:10
q)y:8
q)1+til x
1 2 3 4 5 6 7 8 9 10
q)1+(1+til x)mod y
2 3 4 5 6 7 8 1 2 3
```


## Selection by encoded list

```q
q)"abcdefgh"[2 sv 1 0 1]
"f"
q)"abcdefgh"[2 sv 0 0 0]
"a"
q)"abcdefgh"[2 sv 1 1 1]
"h"
q)"abcdefgh" 2 sv flip 3 3 #1 0 1 0 0 0 1 1 1
"fah"
```


## Remove duplicate rows

```q
q)x:("to";"be";"or";"not";"to";"be")
q)distinct x
"to"
"be"
"or"
"not"
```


## Remove trailing blanks

```q
q)x:"trailing blanks    "
q)(neg sum mins reverse " "=x)_ x
"trailing blanks"
```

`sum` and `mins` must evaluate the whole vector. But Find terminates with the first hit. 

```q
q)(neg reverse[x=" "]?0b)_ x
"trailing blanks"
```

Reversing a string is faster than reversing a boolean vector.

```q
q)neg[(reverse[x]=" ")?0b]_ x
"trailing blanks"
```



## Is year a leap year?

Leap year from 463.

```q
q)ly:{sum[0=x mod/:4 100 400]mod 2}
```


## Number of days in month x of Gregorian year y 

```q
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 7 1996
31
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 4 1996
30
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 2 1996
29
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 2 1997
28
```


## Justify right

```q
q)x:"trailing blanks   "
q)neg[(reverse[x]=" ")?0b]rotate x
"   trailing blanks"
q)rj:{neg[(reverse[x]=" ")?0b]rotate x}
q)rj each ("a     ";"bc    ";"d e   ";"fg h  ";"ij kl ";"mnopqr")
"     a"
"    bc"
"   d e"
"  fg h"
" ij kl"
"mnopqr"
```


## Find last non-blank

```q
q)x:"blanks at end   "
q)x=" "
0000001001000111b
q)(" "=reverse x)?0b
4
```

Reversing the string is faster than reversing the boolean.


!!! detail "Historical note"

   Ancestral languages APL and k support the boolean vector as left argument (encoding system) of what in q is `sv`. Reversing the boolean vector could thus be omitted. `sv` does not support that.


## Scattered indexing

```q
q)show x:2 3 4#.Q.a
"abcd" "efgh" "ijkl"
"mnop" "qrst" "uvwx"
q)x ./:(0 0 0;1 1 3;1 2 2)
"atw"
```


## Raveled index from general index

```q
q)x:2 3 4#.Q.a
q)x[1;1;3]
"t"
q)shape x
2 3 4
q)2 3 4 sv 1 1 3
19
q)raze/[x]
"abcdefghijklmnopqrstuvwx"
q)raze/[x] 19
"t"
```


## Name variable according to x

```q
q)test          / not defined
'test
  [0]  test
       ^
q)`test set 42
`test
q)test
42
q)(`$"foo")set 43
`foo
q)foo
43
```


## Execute rows of character matrix

```q
q)x1:4
q)x2:9
q)show x:2 5#"y1:x1y2:x2"
"y1:x1"
"y2:x2"
q)parse each x
: `y1 `x1
: `y2 `x2
q)('[eval;parse])each x
4 9
q)(y1;y2)
4 9
```


## Indexing arbitrary rank array

```q
q)x:2 3 4 5#til 120
q)x[1]
60 61 62 63 64      65 66 67 68 69      70 71 72 73 74      75 76 77 78 79
80 81 82 83 84      85 86 87 88 89      90 91 92 93 94      95 96 97 98 99
100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119
q)x . enlist 1
60 61 62 63 64      65 66 67 68 69      70 71 72 73 74      75 76 77 78 79
80 81 82 83 84      85 86 87 88 89      90 91 92 93 94      95 96 97 98 99
100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119
q)x . 0 0
0  1  2  3  4
5  6  7  8  9
10 11 12 13 14
15 16 17 18 19
q)x . 0 0 0
0 1 2 3 4
q)x . 0 0 0 0
0
q)x[0;0;0;0]
0
```

Not an idiom. Just how indexing and Index work.


## Sum numbers in character matrix

```q
q)show x:string til 5
,"0"
,"1"
,"2"
,"3"
,"4"
q)sum parse " " sv x
10
```


## Case structure

```q
$[c0;t0;f]
$[c0;t0;c1;t1;f]
$[c0;t0;c1;t1;c2;t2;f]
$[c0;t0;c1;t1;c2;t2;c3;t3;f]
```

Et cetera.
In the first case, if `c0` is nonzero, the result is `t0`; otherwise `f`.
In all cases, the result is the `t` corresponding to the first non-zero `c`.
If all the `c` are zero the result is `f`.

==DROP Again, not an idiom, just how Cond works.==

==FIXME Example of dictionary as case structure. Also Case operator.==


## Y-shaped array of numbers from x[0] to x[1]-1

```q
q)x:4 9
q)y:3 4
q)y#first[x]+prd[y]?(-)over reverse x
4 6 8 8
5 8 7 7
4 6 5 8
```


## Y items selected with replacement from til x

Roll.

```q
q)y:3 5
q)x:7
q)y?x
6 2 1 2 2
4 4 6 3 0
6 3 4 5 1
q)3 5#7?7
5 1 2 1 2
0 3 5 1 2
1 2 0 3 5
```

==DROP Not an idiom; just how Roll works.==


## Y objects selected without replacement from til x

Deal.

```q
q)-6?8
5 7 3 2 0 4
```

==DROP Not an idiom; just how Deal works.==


## Find distinct items

```q
q)x:"ajhajhja"
q)x?distinct x      / first occurrences
0 1 2
q)group x           / all occurrences
a| 0 3 7
j| 1 4 6
h| 2 5
q)value group x
0 3 7
1 4 6
2 5
```


## Count of x between endpoints (l,h)

```q
q)show x:(66 8 6 4 86;82 91 52 53 89;43 0 62 3 17;0 26 80 2 12;37 41 41 72 10)
66 8  6  4  86
82 91 52 53 89
43 0  62 3  17
0  26 80 2  12
37 41 41 72 10
q)sum raze (x>l)&x<h        / exclusive range
12i
q)sum raze (x>=l)&x<=h      / inclusive range
14i
```


## Locations of string x in string y

Including overlaps.

```q
q)x:"XX"
q)y:"XabcugjXXjyXXXkmhixXX12"
q)y ss x                                            / without overlaps
7 11 19
q)z where x~/:y (z:where y=first x)+\:til count x   / with overlaps
7 11 12 19
```


