# Shape


The _depth_ of an array is the depth of nesting to which it remains rectangular. 
It corresponds to the dimensions of a rectangular array, thus the array’s _rank_: the number of indexes to which it can be applied. 
(Q arrays are not required to be rectangular.)

The _shape_ of an array is its count in each dimension. 
For example, the shape of a 3-by-4 matrix is `3 4`. 

The shape itself is always a vector. 
E.g. the shape of `"abcdef"` is `1#6`. 

The depth of an array is the count of its shape. 

An atom has no dimensions, so its depth is 0 (it has no indexes) and its shape is an empty vector. 

An empty list has 1 dimension, so its depth is 1. Its shape is `1#0`. 


## Conform

### Conform table x rows to list y

```q
q)x:3 3#1+!9
q)y:1 2 3 4
q)s#(raze x),(prd s:(count y),count first x)#0
1 2 3
4 5 6
7 8 9
0 0 0
```


### Conform table x columns to list y

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


## Construct

### Empty vector

```q
q)()        / general
q)0#0b      / boolean
q)0#0.0     / float
q)0#" "     / character
..
```


### List from atom or list

```q
q)(),42
,42
q)(),42 43
42 43
```


### Y cyclic repetitions of vector x

```q
q)x:"abcd"
q)y:3
q)(y*count x)#x
"abcdabcdabcd"

q)raze y#enlist x
"abcdabcdabcd"
```


### Array with shape of y and x as its rows

Implies `count[x]~count first y`

```q
q)y:3 4#til 12
q)x:"abcd"
q)count[y]#enlist x
"abcd"
"abcd"
"abcd"
```



## Extend

### Replicate a dimension of rank-3 array x y-fold

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


### Replicate y x times

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


### Join atom to each list item

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


### Append y at the bottom of matrix x

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


### Fill x to length y with x’s last item

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


### Append empty row on matrix

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



## Read

### Count items

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
2
```

Or count cells. 

```q
q)prd shape 2 3 4#til 24
24
```


### Count atoms

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


### First atom in x

```q
q)show x:(("The";"quick");"brown";"fox";(("jumps";"over");(("the";"lazy");"dog")))
("The";"quick")
"brown"
"fox"
(("jumps";"over");(("the";"lazy");"dog"))
q)first over x
"T"
```


### Count rows in matrix x

```q
q)x:2 7#" "
q)count x
2
```


### Count columns in matrix x

```q
q)x:2 7#" "
q)count x
2
q)count each x
7 7
q)count first x
2 7
```


### Count columns in array x

```q
q)x:1 1 1 1 1 678#0
q)shape x
1 1 1 1 1 678
q)last shape x
678
```


### Depth of an array

<i class="far fa-hand-point-right"></i>
[`phrases.q`](phrases.md)


### Shape of an array

<i class="far fa-hand-point-right"></i>
[`phrases.q`](phrases.md)



### All axes of rectangular array x

```q
q)show x:2 3 4 5#til 120
0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19                  ..
60 61 62 63 64      65 66 67 68 69      70 71 72 73 74      75 76 77 78 79   ..
q)depth x
4
q)til depth x
0 1 2 3
```


## Shrink

### Drop first y rows from top of matrix x

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


### Drop first y columns from matrix x

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


### Conditional drop of y items from list x

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


### Conditional drop of last item of list x

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


### Remove columns y from x

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



## Transpose

### Transpose matrix x on condition y

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


### Transpose planes of three-dimensional x

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


## Trees

### Tree from depth;value

```q
q)tdv:{[d;v](1#v),(c _ d-1)tdv'(c:where 1=d)_ v}
```


### Depth from tree

```q
q)dt:{0,/1+dt'[1_ x]}
```


### Value from tree

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


