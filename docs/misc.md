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


## Efficient execution of f x where x has repeated values

```q
q)x:1 2 3 2 3 2 1
q)show u:distinct x
1 2 3
q)u?x
0 1 2 1 2 1 0
q)f:{10*x}
q)f u
10 20 30
q)(f u)[0 1 2 1 2 1 0]
10 20 30 20 30 20 10
q)(f u)[(u:distinct x)?x]
10 20 30 20 30 20 10
q).Q.fu[f;x]
10 20 30 20 30 20 10
```


## Sum items of y by ordered codes g in x

```q
q)(x;y)
e  c  b  b b  a c  e  e  a  e  c  c  b  e  c  b a  e  a
12 40 10 1 26 9 26 43 26 37 20 29 38 33 24 37 4 45 41 2
q)group x
e| 0 7 8 10 14 18
c| 1 6 11 12 15
b| 2 3 4 13 16
a| 5 9 17 19
q)g:"abcde"
q)group g,x
a| 0 10 14 22 24
b| 1 7 8 9 18 21
c| 2 6 11 16 17 20
d| ,3
e| 4 5 12 13 15 19 23
q)sum each ((count[g]#0),y)group g,x
a| 93
b| 74
c| 170
d| 0
e| 166
q)sum each ((count[g]#0),y)value group g,x
93 74 170 0 166
```


## Range; nub; remove duplicates

```q
q)x:"wirlsisl"
q)distinct x
"wirls"
q)distinct (1 2 3;4 5;1 2 3;4 5;1 2 3)
1 2 3
4 5
```

==DROP: not an idiom==


## Is range of x 1?

Are all items of x the same?

```q
q)x:1 1 1 1 1
q)1=count distinct x
1b
q)y:1 1 0 1 1
q)1=count distinct y
0b
```


## List of x zeros preceded by (y-x) ones

```q
q)x:5
q)y:9
q)((y-x)#1),x#0
1 1 1 1 0 0 0 0 0
q)1 0 where(y-x),x
1 1 1 1 0 0 0 0 0
```


## List of x ones preceded by (y-x) zeros

```q
q)x:3
q)y:9
q)xr:{((y-x)#0),x#1}
q)xr[x;y]
0 0 0 0 0 0 1 1 1
q)x:2 5 7 4 9 3 6
q)x xr\:y           / bar chart
0 0 0 0 0 0 0 1 1
0 0 0 0 1 1 1 1 1
0 0 1 1 1 1 1 1 1
0 0 0 0 0 1 1 1 1
1 1 1 1 1 1 1 1 1
0 0 0 0 0 0 1 1 1
0 0 0 1 1 1 1 1 1
q)1 0 where(y-x),x
1 1 1 1 1 1 0 0 0
q)@[y#1;til y-x;:;0]
```


## List of x zeros followed by (y-x) ones

```q
q)x:3
q)y:9
q)(x#0),(y-x)#1
0 0 0 1 1 1 1 1 1
q)zl:{(x#0),(y-x)#1}
q)zl[x;y]
0 0 0 1 1 1 1 1 1
q)0 1 where x,y-x
0 0 0 1 1 1 1 1 1
q)@[y#1;til x;:;0]
0 0 0 1 1 1 1 1 1
q)x:2 5 7 4 9 3 6
q)x zl\:y           / bar chart
0 0 1 1 1 1 1 1 1
0 0 0 0 0 1 1 1 1
0 0 0 0 0 0 0 1 1
0 0 0 0 1 1 1 1 1
0 0 0 0 0 0 0 0 0
0 0 0 1 1 1 1 1 1
0 0 0 0 0 0 1 1 1
```


## List of x ones followed by (y-x) zeros

```q
q)x:5
q)y:9
q)(x#1),(y-x)#0
1 1 1 1 1 0 0 0 0
q)xl:{(x#1),(y-x)#0}
q)xl[x;y]
1 1 1 1 1 0 0 0 0
q)1 0 where x,y-x
1 1 1 1 1 0 0 0 0
q)@[y#0;til x;:;1]
1 1 1 1 1 0 0 0 0
q)x:2 5 7 4 9 3 6
q)x xl\:y
1 1 0 0 0 0 0 0 0
1 1 1 1 1 0 0 0 0
1 1 1 1 1 1 1 0 0
1 1 1 1 0 0 0 0 0
1 1 1 1 1 1 1 1 1
1 1 1 0 0 0 0 0 0
1 1 1 1 1 1 0 0 0
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



## Move x into first quadrant

```q
q)sm:{x-min x}
q)show x:(1 6 4;3 4 7;7 8 6)
1 6 4
3 4 7
7 8 6
q)sm each x
0 5 3
0 1 4
1 2 0
```

==FIXME Confirm category==


## Contour levels y at points with altitude x

```q
q)cl:{y[-1+sum not y>x]}
q)y:-100 0 10 100 1000 10000
q)cl[-5;y]
-100
q)cl[0;y]
0
q)cl[99;y]
10
q)cl[9;y]
0
q)cl[10;y]
10
```


## 180. Is x in range [y)

```q
q)x:19 20 21 39 40 41
q)y:20 40
q)x<\:y
11b
01b
01b
01b
00b
00b
q)01b~/:x<\:y
011100b
q)((<)over)each x<\:y
011100b
q)(</')x<\:y            / elide keywords when composing iterators
011100b
```


## 181. Which class of y x belongs to

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


## Replicating a dimension of rank-3 array x y-fold

Three copies along second axis.

```q
q)show x:2 3 3#1+til 18
1 2 3    4 5 6    7 8 9
10 11 12 13 14 15 16 17 18
q)y:3
q)x[;raze(y#1)*\:til(shape x)1;]
1 2 3    4 5 6    7 8 9    1 2 3    4 5 6    7 8 9    1 2 3    4 5 6    7 8 9
10 11 12 13 14 15 16 17 18 10 11 12 13 14 15 16 17 18 10 11 12 13 14 15 16 17 18
```


## Moving index y-wide for x

```q
q)x:"abcdef"
q)y:3
q)y+til count[x]-y-1
3 4 5 6
```


## Indexes of infixes of length y

```q
q)x:4+til 5
q)y:3
q)x+\:til y
4 5 6
5 6 7
6 7 8
7 8 9
8 9 10
```


## 203. One-column matrix from numeric vector

```q
q)x:34 31 51 29 35 17 89
q)flip enlist x
34
31
51
29
35
17
89
q)1#'x
34
31
51
29
35
17
89
```


## 204. Numeric array and its negative

```q
q)show x:3+3 4#til 12
3  4  5  6
7  8  9  10
11 12 13 14
q)x,''neg x
3 -3   4 -4   5 -5   6 -6
7  -7  8  -8  9  -9  10 -10
11 -11 12 -12 13 -13 14 -14
q)((1 -1*)'')x
3 -3   4 -4   5 -5   6 -6
7  -7  8  -8  9  -9  10 -10
11 -11 12 -12 13 -13 14 -14
```


## Remove trailing blank rows

```q
q)show x:flip 5 9#"abc de   "
"aaaaa"
"bbbbb"
"ccccc"
"     "
"ddddd"
"eeeee"
"     "
"     "
"     "
q)(and/) each x=" "
000100111b
q)reverse(and/) each x=" "
111001000b
q)mins reverse(and/)each x=" "
111000000b
q)neg sum mins reverse(and/)each x=" "
-3i
q)(neg sum mins reverse(and/)each x=" ")_ x
"aaaaa"
"bbbbb"
"ccccc"
"     "
"ddddd"
"eeeee"
```


## Remove trailing blank columns

We can convert this to to the trailing blank rows of #205 and use `rtr`.

```q
q)rtr:{x where reverse maxs reverse not  x~\:(count flip x)#" "}
q)show x:3 9#"abc de   "
"abc de   "
"abc de   "
"abc de   "
q)rtr x
"abc de   "
"abc de   "
"abc de   "
q)rtr flip x
"aaa"
"bbb"
"ccc"
"   "
"ddd"
"eee"
q)flip rtr flip x
"abc de"
"abc de"
"abc de"
```

Or.

```q
q)x=" "
000100111b
000100111b
000100111b
q)min x=" "
000100111b
q)reverse min x=" "
111001000b
q)mins reverse min x=" "
111000000b
q)sum mins reverse min x=" "
3i
q)neg[sum mins reverse min x=" "]_'x
"abc de"
"abc de"
"abc de"
```


## Remove leading blank columns

Again we can convert this to the trailing blanks of #205 and use `rtr`.

```q
q)rtr:{x where reverse maxs reverse not  x~\:(count flip x)#" "}
q)show x:3 9#"   ed cha"
"   ed cha"
"   ed cha"
"   ed cha"
q)flip reverse rtr reverse flip x
"ed cha"
"ed cha"
"ed cha"
```

Or.

```q
q)x=" "
111001000b
111001000b
111001000b
q)min x=" "
111001000b
q)mins min x=" "
111000000b
q)(mins min x=" ")?0b
3
q)((mins min x=" ")?0b)_'x
"ed cha"
"ed cha"
"ed cha"
q)sum[mins min x=" "]_'x
"ed cha"
"ed cha"
"ed cha"
```


## Remove leading blank rows

Again we can convert this to the trailing blanks of #205 and use `rtr`.

```q
q)rtr:{x where reverse maxs reverse not  x~\:(count flip x)#" "}
q)show x:reverse flip 3 9#"abc de   "
"   "
"   "
"   "
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
q)reverse rtr reverse x
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
```

Or.

```q
q)x=" "
111b
111b
111b
000b
000b
111b
000b
000b
000b
q)min each x=" "
111001000b
q)(min each x=" ")?0b
3
q)((min each x=" ")?0b)_ x
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
q)(sum mins min " "=flip x)_x
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
```


## Remove duplicate rows

```q
q)show x:("abc";"def";"abc";"ghi";"jkl";"abc";"ghi";"abc")
"abc"
"def"
"abc"
"ghi"
"jkl"
"abc"
"ghi"
"abc"
q)distinct x
"abc"
"def"
"ghi"
"jkl"
```

==DROP: not an idiom==


## Is x an integer in interval [g,h)?

```q
q)g:6;h:12
q)x:3 5 6 7.5 11 12 13
q)x<\:g,h
11b
11b
01b
01b
01b
00b
00b
q)(</)each x<\:g,h
0011100b
q)x where(</)each x<\:g,h
6 7.5 11
q)(x=floor x)&(</)each x<\:g,h
1110111b
```


## Is x within range [ y )?

```q
q)x:9
q)show y:(1 9;9 16;5 7;10 20;6 10)
1  9
9  16
5  7
10 20
6  10
q)x<y
00b
01b
00b
11b
01b
q)(</)each x<y
01001b
```


## Is x within range ( y ]?

```q
q)show y:(1 9;9 16;5 7;10 20;6 10)
1  9
9  16
5  7
10 20
6  10
q)x<=y
01b
11b
00b
11b
01b
q)(</)each x<=y
10001b
```


## Is y a row of x?

```q
q)show x:("aaa";"bbb";"ooo";"ppp";"kkk")
q)y:"ooo"
q)y in x
1b
```

==DROP: keyword not idiom==


## Number of occurrences of x in y

```q
q)show y:3+7?6
6 4 7 7 6 6 4
q)x:7
q)sum x=y
2
```


## Randomize the random seed

```q
q)\S
-314159
q)\S -1154371779
q)\S
-1154371779
```

==DROP: not an idiom==


## Interlace x[i]#1 and y[i]#0

```q
q)x:1 3
q)y:2 4
q)raze x,'y
1 2 3 4
q){count[x]#1 0}raze x,'y
1 0 1 0
q){x#'count[x]#1 0}raze x,'y
,1
0 0
1 1 1
0 0 0 0
q)raze{x#'count[x]#1 0}raze x,'y
1 0 0 1 1 1 0 0 0 0
```

Or.

```q
q)(raze/)flip(x;y)#''1 0
1 0 0 1 1 1 0 0 0 0
```


## Offset enumeration

```q
q)x:10
q)y:3
q)x+til y
10 11 12

q)x:10 20 30
q)y:3 4 2
q)raze x+til each y
10 11 12 20 21 22 23 30 31
```


## Replicate y x times

```q
q)x:3 4 2
q)y:10 20 30
q)x#'y
10 10 10
20 20 20 20
30 30
q)raze x#'y
10 10 10 20 20 20 20 30 30
```


## X alternate takes of 1s and 0s

```q
q)x:1 2 3 4 5
q)(count x)#1 0
1 0 1 0 1
q)x#'(count x)#1 0
,1
0 0
1 1 1
0 0 0 0
1 1 1 1 1
q)raze x#'(count x)#1 0
1 0 0 1 1 1 0 0 0 0 1 1 1 1 1
```

Or.

```q
q)(count[x]#1 0)where x
1 0 0 1 1 1 0 0 0 0 1 1 1 1 1
```


## First group of 1s

```q
q){x and (and)scan x=(or)scan x}0 0 0 1 1 0 1
0 0 0 1 1 0 0
q){x and (and)scan x=(or)scan x}0 0 0 1 1 0 1
0 0 0 1 1 0 0
q){x and (and)scan x=(or)scan x}1 1 1 0 1 0 1
1 1 1 0 0 0 0
q){x and (and)scan x=(or)scan x}0 1 0 1 0 1 0
0 1 0 0 0 0 0
q){x&(&\)x=(|\)x}0 1 0 1 0 1 0
0 1 0 0 0 0 0
```

