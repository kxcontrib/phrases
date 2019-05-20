# Shapes and indexes



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


## Join scalar to each list item

```q
q)"a","XYZ"
"aXYZ"
q)"a",'"XYZ"
"aX"
"aY"
"aZ"
q)"XYZ",'"a"
"Xa"
"Ya"
"Za"
q)99,'3 4#til 12
99 0 1 2  3
99 4 5 6  7
99 8 9 10 11
```


## Number of items

```q
q)count "abcd"
4
```

Then it depends what you consider items.
Strictly:

```q
q)count(1;2 3;4 5 6)
3
q)count 2 3 4#til 24
'length
```

Or. 

```q
q)prd shape 2 3 4#til 24
24
```


## Scalar from 1-item list

```q
q)enlist 5
,5
q)first enlist 5
5
```


## Append y at the bottom of matrix x

```q
q)x:4 3#1+til 12
q)x
1  2  3
4  5  6
7  8  9
10 11 12
q)y:13 14 15
q)x,enlist y
1  2  3
4  5  6
7  8  9
10 11 12
13 14 15
```


## Fill x to length y with x’s last item

```q
q)x:"quiz"
q)y:9
q)a:(til y)&-1+count x
q)a
0 1 2 3 3 3 3 3 3
q)x[a]
"quizzzzzz"
q)x[(til y)&-1+count x]
"quizzzzzz"
q)y#x,y#last  x
"quizzzzzz"
```


## Drop y rows from top of matrix x

```q
q)x:6 3#til 18
q)x
0  1  2
3  4  5
6  7  8
9  10 11
12 13 14
15 16 17
q)y:2
q)y _ x
6  7  8
9  10 11
12 13 14
15 16 17
```


## Conform table x rows to list y

```q
q)x:3 3#1+!9
q)y:1 2 3 4
q)s#(raze x),(prd s:(count y),count first x)#0
1 2 3
4 5 6
7 8 9
0 0 0
```


## Conform table x columns to list y

```q
q)x:4 2#9
q)y:5#8
q)show a:(count each(x;y))#0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
q)a[;til count first x]:x
q)a
9 9 0 0 0
9 9 0 0 0
9 9 0 0 0
9 9 0 0 0
```


## Matrix from scalar or vector

```q
q){$[0<type x;(1,count x)#x;1 1#x]}1
1
q){$[0<type x;(1,count x)#x;1 1#x]}1 2
1 2
q)count {$[0<type x;(1,count x)#x;1 1#x]}1 2
1
```


## Remove columns y from x

```q
q)show x:2 3 4#1+til 24
1 2  3  4   5 6  7  8   9 10 11 12
13 14 15 16 17 18 19 20 21 22 23 24
q)x[0;;]
1 2  3  4
5 6  7  8
9 10 11 12
q)x[1;;]
13 14 15 16
17 18 19 20
21 22 23 24
q)x[;;1 3]
2  4  6  8  10 12
14 16 18 20 22 24

q)s:til each shape x
q)s
0 1
0 1 2
0 1 2 3
q)(-1_s),enlist(last s)except 0 2
0 1
0 1 2
1 3
q)x . (-1_s),enlist(last s)except 0 2
2  4  6  8  10 12
14 16 18 20 22 24
```


## Diagonals from columns

```q
q)show x:5 5 #1+til 25
1  2  3  4  5
6  7  8  9  10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25
q)(neg til 5)rotate'x
1  2  3  4  5
10 6  7  8  9
14 15 11 12 13
18 19 20 16 17
22 23 24 25 21
```


## Columns from diagonals

```q
q)x:(1 2 3 4 5;10 6 7 8 9;14 15 11 12 13;18 19 20 16 17;22 23 24 25 21)
q)(til 5)rotate'x
1  2  3  4  5
6  7  8  9  10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25
```

