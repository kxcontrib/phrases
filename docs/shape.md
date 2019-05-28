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


## Drop first y rows from top of matrix x

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


## Drop first y columns from matrix x

```q
q)show x:3 4#til 12
0 1 2  3
4 5 6  7
8 9 10 11
q)2_'3 4#til 12
2  3
6  7
10 11
```


## Conditional drop of y items from list x

```q
q)x:4 3#til 12
q)g:0           / conditional
q)y:2
q)(y*g)_ x
0 1  2
3 4  5
6 7  8
9 10 11
q)g:1           / conditional
q)(y*g)_ x
6 7  8
9 10 11
```


## Conditional drop of last item of list x

```q
q)show x:4 3#til 12
0 1  2
3 4  5
6 7  8
9 10 11
q)g:0           / conditional
q)(neg g)_x
0 1  2
3 4  5
6 7  8
9 10 11
q)g:1           / conditional
q)(neg g)_x
0 1 2
3 4 5
6 7 8
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


## Initial empty row to start matrix of x columns

```q
q)(),5 4#.Q.a
"abcd"
"efgh"
"ijkl"
"mnop"
"qrst"
```

Ancestor languages of q, such as APL, used a zero-row matrix as a ‘template’ to which rows could be joined. In q this would look like 

```q
q)(0 4#" "),5 4#.Q.a
'length
  [0]  (0 4#" "),5 4#.Q.a
           ^
q)0 4#" "
'length
  [0]  0 4#" "
          ^
```

but q does not require zero-row matrixes with a defined number of columns, nor allow their definition. 


## 485. Append empty row on matrix

```q
q)x:("ab";"cd";"ef")
q)flip(flip x),'" "
"ab"
"cd"
"ef"
"  "
q)show x:3 4#til 12
0 1 2  3
4 5 6  7
8 9 10 11
q)flip(flip x),'0
0 1 2  3
4 5 6  7
8 9 10 11
0 0 0  0
```

Or – depends what _empty_ means. 

```q
q)y:("ab";"cd";"ef")
q){x count x}y 0            / null for y
" "
q){c#x c:count x}y 0
"  "
q)y,{(1,c)#x c:count x}y 0
"ab"
"cd"
"ef"
"  "
q)x
0 1 2  3
4 5 6  7
8 9 10 11
q)x,{(1,c)#x c:count x}x 0
0 1 2  3
4 5 6  7
8 9 10 11

q)last x,{(1,c)#x c:count x}x 0
0N 0N 0N 0N
```


## Number of columns in matrix x

```q
q)x:2 7#" "
q)count x
2
q)count each x
7 7
q)count first x
2 7
```


## Number of rows in matrix x

```
q)x:2 7#" "
q)count x
2
```


## Matrix with diagonal x

```q
q)x:5 9 6 7 2
q)(2#count x)#raze x,'(2#count x)#0
5 0 0 0 0
0 9 0 0 0
0 0 6 0 0
0 0 0 7 0
0 0 0 0 2
```

Or.

```q
q)neg[tc x]rotate'x,\:(count[x]-1)#0
5 0 0 0 0
0 9 0 0 0
0 0 6 0 0
0 0 0 7 0
0 0 0 0 2

q)x*{x=/:\:x}tc x
5 0 0 0 0
0 9 0 0 0
0 0 6 0 0
0 0 0 7 0
0 0 0 0 2
```


## Replace first item of x with y

```q
q)x:"abbccdefcdab"
q)y:"t"
q)@[x;0;:;y]
"tbbccdefcdab"
```

Or.

```q
q)y,1_ x
"tbbccdefcdab"
```

Or in place.

```q
q)@[`x;0;:;y]
`x
q)x
"tbbccdefcdab"
q)x:"abbccdefcdab"
q)x[0]:y
q)x
"tbbccdefcdab"
```


## Replace last item of x with y

```q
q)x:"abbccdefcdab"
q)y:"t"
q)@[x;-1+count x;:;y]
"abbccdefcdat"
```

Or.

```q
q)(-1_ x),y
"abbccdefcdat"
```

Or in place.

```q
q)@[`x;count[x]-1;:;y]
`x
q)x
"abbccdefcdat"
q)x:"abbccdefcdab"
q)x[count[x]-1]:y
q)x
"abbccdefcdat"
```


## Select items of x according to flags in y

```q
q)show x:2 3 4#1+til 24
1 2  3  4   5 6  7  8   9 10 11 12
13 14 15 16 17 18 19 20 21 22 23 24
q)y:1 0 0 1
q)x[;;where y]
1 4   5 8   9 12
13 16 17 20 21 24
```


## Empty matrix

In q’s ancestor languages arrays were rectangular. A matrix might have five columns but no rows. Any rows joined to it could have only five columns. 
Such an ‘empty matrix’ would be `0 5#0`, but this signals a length error in q.

In q arrays are lists. A five-column matrix `x` is a list in which the items _happen_ themselves to all have five items. (Being a five-column matrix is a property that emerges from the items of `x`.It is not a property of `x` itself.) 

The nearest equivalent in q to an ‘empty matrix’ is the generic empty list `()`.


## Apply to dimension 1 function defined on dimension 0

```q
q)x:3 4#1+!12
q)sum x
15 18 21 24
q)sum each x
10 26 42
```


## Transpose matrix x on condition y

```q
q)show x:2 3 #til 6
0 1 2
3 4 5
q)0 flip/x
0 1 2
3 4 5
q)1 flip/x
0 3
1 4
2 5
```


## Matrix with x columns from list y

```q
q)x:4
q)y:"abc"
q)x#'y
"aaaa"
"bbbb"
"cccc"
```


## 525. Main diagonal

```q
q)show x:3 4#1+til 12
1 2  3  4
5 6  7  8
9 10 11 12
q)show y:2#'tc x
0 0
1 1
2 2
q)x ./:y
1 6 11
```


## Transpose planes of three-dimensional x

```q
q)show x:2 3 4#1+til 24
1 2  3  4   5 6  7  8   9 10 11 12
13 14 15 16 17 18 19 20 21 22 23 24
q)shape x
2 3 4
q)flip each x
1 5 9    2 6 10   3 7 11   4 8 12
13 17 21 14 18 22 15 19 23 16 20 24
q)shape flip each x
2 4 3
q)shape flip flip each x
4 2 3
```


## Rotate rows left

```q
q)x:3 4#1+til 12
q)1 rotate 'x
2  3  4  1
6  7  8  5
10 11 12 9
```

## Rotate rows right

```q
q)x:3 4#1+til 12
q)-1 rotate 'x
4  1 2  3
8  5 6  7
12 9 10 11
```


## All axes of rectangular array x

```q
q)show x:2 3 4 5#til 120
0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19                  ..
60 61 62 63 64      65 66 67 68 69      70 71 72 73 74      75 76 77 78 79   ..
q)depth x
4
q)til depth x
0 1 2 3
```


## All indices of vector x

```q
q)show x:10?.Q.a
"uwgbyfenjc"
q)tc x
0 1 2 3 4 5 6 7 8 9
```


### Empty vector

```q
q)()        / general
q)0#0b      / boolean
q)0#0.0     / float
q)0#" "     / character
..
```


## First column as a matrix

```q
q)show x:3 4#til 12
0 1 2  3
4 5 6  7
8 9 10 11
q)x[;enlist 0]
0
4
8
```


## 2-row matrix from two vectors

```q
q)x:"abcd"
q)y:"efgh"
q)(x;y)
"abcd"
"efgh"

q)flip x,'y
"abcd"
"efgh"

q)(enlist x),enlist y
"abcd"
"efgh"
```


## 2-column matrix from two vectors

```q
q)x:"abcd"
q)y:"efgh"
q)x,'y
"ae"
"bf"
"cg"
"dh"

q)flip(x;y)
"ae"
"bf"
"cg"
"dh"
```


## Increasing rank of y to rank of x

```q
q)x:("abcd";"efgh")
q)y:"ijkl"
q)depth x
2
q)depth y
1
q)(depth[x]-depth y)enlist/y
"ijkl"
q)shape (depth[x]-depth y)enlist/y
1 4
```


## Reshape vector x into 2-column matrix

```q
q)x:"abcdefghi"
q)2 cut x
"ab"
"cd"
"ef"
"gh"
,"i"
q)count[x]mod 2
1
q)2 cut x,(count[x]mod 2)#" "
"ab"
"cd"
"ef"
"gh"
"i "
```


## Vector from array

```q
q)show x:2 3 4#til 24
0 1 2  3    4 5 6  7    8 9 10 11
12 13 14 15 16 17 18 19 20 21 22 23
q)(raze/)x
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
q)
q)show y:("The quick brown fox ";"jumps over ";"the lazy dog.")
"The quick brown fox "
"jumps over "
"the lazy dog."
q)(raze/)y
"The quick brown fox jumps over the lazy dog."
```

Not quite. A vector has uniform type. If the array does not have uniform type, only casting can return a vector. 


## Matrix of y rows, each x

```q
q)x:"abcd"
q)y:3
q)y#enlist x
"abcd"
"abcd"
"abcd"

q)flip y#'x'
"abcd"
"abcd"
"abcd"
```


## One-row matrix from vector

```q
q)shape x:2 3 5 7 11
,5
q)shape enlist x
1 5
```


## Number of columns in matrix x

```q
q)x:3 19#0
q)count first x
19
```


## Number of columns in array x

```q
q)x:1 1 1 1 1 678#0
q)shape x
1 1 1 1 1 678
q)last shape x
678
```


## Vector from column y of matrix

```q
q)x:3 4#til 12
q)x
0 1 2  3
4 5 6  7
8 9 10 11
q)y:0
q)x[;y]
0 4 8
```


## Y cyclic repetitions of vector x

```q
q)x:"abcd"
q)y:3
q)(y*count x)#x
"abcdabcdabcd"

q)raze y#enlist x
"abcdabcdabcd"
```


## Rank of array y (number of dimensions)

```q
q)x:2 1 2 1 3 1 4#0
q)shape x
2 1 2 1 3 1 4
q)count shape x
7
q)depth x
7
q)depth 0
0
q)depth enlist 0
1
```


## Array with shape of y and x as its rows

Implies `count[x]~count first y`

```q
q)y:3 4#til 12
q)x:"abcd"
q)count[y]#enlist x
"abcd"
"abcd"
"abcd"
```


## First atom in x

```q
q)show x:(("The";"quick");"brown";"fox";(("jumps";"over");(("the";"lazy");"dog")))
("The";"quick")
"brown"
"fox"
(("jumps";"over");(("the";"lazy");"dog"))
q)(first/)x
"T"
```


## Scalar from one-item vector

```q
q)show x:enlist 3
,3
q)first x
3
```


## Count atoms

```q
q)cs:{count raze over x}
q)cs 1
1
q)cs[1 2]
2
q)cs[(1 2;3 4 5)]
5
q)cs[(1 2;(3 4;5))]
5
q)cs[("ab";("cd";"efg"))]
7
q)cs[til 0]
0
```


## Tree from depth;value

```q
q)tdv:{[d;v](1#v),(c _ d-1)tdv'(c:where 1=d)_ v}
```


## Depth from tree

```q
q)dt:{0,/1+dt'[1_ x]}
```


## Value from tree

```q
q)vt:{(1#x),/vt each 1_ x}
q)show t:tdv[d;v]
0
(1;,2;,3)
,4
,5
q)dt t
0 1 2 2 1 1
q)vt t
0 1 2 3 4 5
```

These three recursions stop when they run out of data.


## Y-shaped array of numbers from x[0] to x[1]-1

```q
q)x:4 9
q)y:3 4
q)y#first[x]+prd[y]?(-)over reverse x
4 6 8 8
5 8 7 7
4 6 5 8
```


### Offset indexes

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


