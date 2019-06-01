---
keywords: ascending sort, iasc, kdb+, q, sort
---

# Items and parts


It is sometimes convenient to represent a nested list by two vectors: 
its content, and the division into items: its _parts_. 
The division into parts can be defined by a vector of either

-   flags
-   part lengths
-   group indexes 

For example

```q
q)t:("the";"quick";"brown";"fox")
```

can be represented below as `x` and either `f`, `g`, or `p`.

```q
q)x:"thequickbrownfox"                  / content
q)f:1 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0     / flags for part starts
q)g:1 1 1 2 2 2 2 2 3 3 3 3 3 3 3 3     / group indexes
q)(x;f;g)
t h e q u i c k b r o w n f o x
1 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0
1 1 1 2 2 2 2 2 3 3 3 3 3 3 3 3
q)p:3 5 5 3                             / part lengths
```

Some operations on parts manipulate `x` without cutting it into a nested list. 



## Convert

### Vector from items

Fuse the items of a nested list.

One level of nesting.

```q
q)"" sv ("the";"quick";"brown";"fox")        / text
"thequickbrownfox"
q)raze ("the";"quick";"brown";"fox")        
"thequickbrownfox"
```

Multiple levels of nesting.

```q
q)raze over ("aaa";("bb";"cccc";("ddd";"e");"ff");("gg";"hh"))
"aaabbccccdddeffgghh"
```


### Items from parts

Cut `x` at flags `y`.

```q
x:3 4 8 2 5 6 9 4 5 4
y:1 1 0 0 0 1 0 0 1 1
q)(where y)_x
,3
4 8 2 5
6 9 4
,5
,4
```

Cut `x` into lengths `y`.

```q
q)y:1 4 3 1 1               / part lengths
q)(0,sums -1_y)_x
,3
4 8 2 5
6 9 4
,5
,4
```


### Start flags from lengths

```q
q)x:1 2 3 4 5
q)(til sum x)in sums 0,x
110100100010000b
```

Or.

```q
q)raze(signum x),'(x-1)#'0i
1 1 0 1 0 0 1 0 0 0 1 0 0 0 0i
```


### End flags from lengths

```q
q)x:1 2 3 4 5
q)sums x
1 3 6 10 15
q)-1+sums x
0 2 5 9 14
q)sum x
15
q)@[(sum x)#0;-1+sums x;:;1]
1 0 1 0 0 1 0 0 0 1 0 0 0 0 1
```

Or.

```q
q)(1+til sum x)in sums x
101001000100001b
```


### Start indexes from flags

```q
q)x:1 0 1 0 0 0 1 0 1 1
q)where x
0 2 6 8 9
```


### Start indexes from lengths

```q
q)x:2 3 1 5
q)sums -1 _0,x
0 2 5 6
q)sl:{sums -1 _ 0,x}
q)sl x
0 2 5 6
```


### End indexes from lengths

```q
q)x:4 7 13 15 20
q)sums[x]-1
3 10 23 38 58
```


### Start indexes for x fields of length y

```q
q)x:5
q)y:3
q)@[(x*y)#0;y*til x;:;1]
1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
q)where @[(x*y)#0;y*til x;:;1]
0 3 6 9 12
```

Or.

```q
q)(til x*y)mod 3
0 1 2 0 1 2 0 1 2 0 1 2 0 1 2
q)0=(til x*y)mod 3
100100100100100b
q)where 0=(til x*y)mod 3
0 3 6 9 12
```


### End indexes for x fields of length y

```q
q)x:5
q)y:3
q)x#y
3 3 3 3 3
q)sums x#y
3 6 9 12 15
q)-1+sums x#y
2 5 8 11 14
```


### Lengths from start indexes

```q
q)x:1 0 1 0 0 1 0 0 0 1 0
q)1_deltas where x,1
2 3 4 2
```



## Apply 

### Reverse each part

```q
q)x:"thequickbrownfox"                              / vector
q)y:3 5 5 3                                         / part lengths
q)il:{-1_ sums 0,x}                                 / indexes from lengths
q)il y                                              / start indexes
0 3 8 13
q)x reverse idesc sums tc[x] in 0 3 8 13            / from indexes
"ehtkciuqnworbxof"
q)x reverse idesc sums tc[x] in il y                / from part lengths
"ehtkciuqnworbxof"
```


### Rotate each part

Rotate left one place parts flagged by x.

```q
q)y:"abcdefghij"
q)x:1 0 1 0 0 1 1 0 0 0
q)y[iasc x + sums x]
"badecfhijg"
```


### Apply uniform function to each part

Uniform functions return results of the same shape as their argument.
Use `raze` to fuse the items.

```q
q)y:3 4 8 2 5 6 9 4 5 4
q)x:1 1 0 0 0 1 1 0 0 1
q)asc each where[x]_y           / sort items
`s#,3
`s#2 4 5 8
`s#,6
`s#4 5 9
`s#,4
q)raze asc each where[x]_y
3 2 4 5 8 6 4 5 9 4
q)raze iasc each where[x]_y     / grade up each item
0 2 0 3 1 0 1 2 0 0
```


### Aggregate each part

Aggregate functions remove one level of depth.
For example, returns an atom from a vector, or a vector from a matrix.

Use `each` to apply an aggregate function to each item of a list.

```q
q)x:1 1 0 0 0 1 1 0 0 1
q)y:3 4 8 2 5 6 9 4 5 4
q)min each where[x]_y           / item minimums
3 2 6 4 4
q)max each where[x]_y           / item maximums
3 8 6 9 4
q)y:" the quick brown fox"
q)-1+count each where[y=" "]_y
3 5 5 3
```

Above, the aggregate function returns an atom from each item; the result is a vector.

Or-reduce parts of `y` marked by `x`:

```q
q)x:1 0 0 1 0 0 0 1 0 0 0 0
q)y:0 0 0 0 1 0 0 0 0 0 1 0
q)max each(where x)_y
0 1 1
```

And-reduce parts of `y` marked by `x`:

```q
q)x:1 0 0 1 0 0 0 1 0 0 0 0
q)y:0 1 1 1 1 1 1 1 1 1 1 0
q)min each(where x)_y
0 1 0
```



## Arithmetic

### Maximums of parts flagged by y

```q
q)x:-17 7 30 12 5 2 -5 6 -3 -19
q)show y:10#1 1 0
1 1 0 1 1 0 1 1 0 1
q)where[y]_x
,-17
7 30
,12
5 2
,-5
6 -3
,-19
q)max each where[y]_x
-17 30 12 5 -5 6 -19
```


### Sums of parts with lengths y

```q
q)x:1+til 10
q)y:2 3 2 3
q)a:sums 0,-1 _ y
q)a
0 2 5 7
q)a _ x
1 2
3 4 5
6 7
8 9 10
q)sum each a _ x
3 12 13 27
q)sum each sums[0,-1_ y] _ x
3 12 13 27
```

Or.

```q
q)deltas sums[x] sums[y]-1
3 12 13 27
```


### Sums of parts grouped by y

```q
q)x:1 2 3 4 5 6 7
q)y:1 1 1 2 2 3 3
q)x group y
1| 1 2 3
2| 4 5
3| 6 7
q)sum each x group y
1| 6
2| 9
3| 13
q)value sum each x group y
6 9 13
```


### Sums of parts flagged by y

```q
q)x:1 2 3 4 5
q)y:1 0 1 0 1
q)a:where y
q)b:a _ x
q)b
1 2
3 4
,5
q)c:sum each b
q)c
3 7 5
q)sum each(where y)_x
3 7 5
```


### Running sums of parts flagged by y

```q
q)x:1 2 3 4 5 6 7 8 9
q)y:1 0 0 0 1 0 0 0 1
q)where y
0 4 8
q)where[y] _ x
1 2 3 4
5 6 7 8
,9
q)sums each where[y] _ x
1 3 6 10
5 11 18 26
,9
q)raze sums each where[y] _ x
1 3 6 10 5 11 18 26 9
```


### Maximum sum of parts

```q
q)x:-100 2 3 4 -100 6 7 8 9 -100
q)max 0 (0|+)\x
30
q)(x;0 (0|+)\x)
-100 2 3 4 -100 6 7  8  9  -100
0    2 5 9 0    6 13 21 30 0
```

Above, `(0|+)` composes the unary projection `0|` with Add. The composition becomes the argument to Scan, which derives the ambivalent function `(0|+)\`, which is then applied infix to 0 and `x` to return cumulative sums.

If we take `-100` to flag parts of `x`, the expression `max 0 (0|+)\x` returns the largest of the sums of the parts. 



## Find 

### Find part y of parts beginning with first of x

```q
q)x:"abcabbbaccccaddd"
q)y:2
q)y=sums x=first x
0001111000000000b
q)x[where y=sums x=first x]
"abbb"
q)y:4
q)x[where y=sums x=first x]
"addd"
```


### Start indexes of equal-item parts

```q
q)x:"baackkkegtt"
q)differ x
11011001110b
q)where differ x
0 1 3 4 7 8 9
```


### End indexes of equal-item parts

```q
q)x:"baackkkegtt"
q)(x;(<>)prior x)
b a a c k k k e g t t
1 1 0 1 1 0 0 1 1 1 0
q)(x;(1_(<>)prior x),1b)
b a a c k k k e g t t
1 0 1 1 0 0 1 1 1 0 1
q)where(1_(<>)prior x),1b
0 2 3 6 7 8 10
```


## Flags

### Running parity of parts flagged by y

```q
q)x:1 0 0 1 1 1 0 0 1 0 1 1 0 0
q)y:1 0 0 0 0 1 0 0 0 0 1 0 0 0
q)where y
0 5 10
q)where[y] _ x
1 0 0 1 1
1 0 0 1 0
1 1 0 0
q)sums each where[y] _ x
1 1 1 2 3
1 1 1 2 2
1 2 2 2
q)(sums each where[y] _ x)mod 2
1 1 1 0 1
1 1 1 0 0
1 0 0 0
q)raze(sums each where[y] _ x)mod 2
1 1 1 0 1 1 1 1 0 0 1 0 0 0
```


### Groups of 1s flagged by y

```q
q)x:0 0 0 1 1 1 0 1 1 1 0 1 1 1 1 1
q)y:0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 1     / flag start and end of parts
q)(x;y;"j"$(<>)scan y)
0 0 0 1 1 1 0 1 1 1 0 1 1 1 1 1
0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 1
0 0 0 1 1 0 0 0 0 0 0 1 1 1 1 0
q)(x;y;"j"${x|(<)prior x}(<>)scan y)
0 0 0 1 1 1 0 1 1 1 0 1 1 1 1 1
0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 1
0 0 0 1 1 1 0 0 0 0 0 1 1 1 1 1
q)x&a|(<)prior a:(<>)scan y
0 0 0 1 1 1 0 0 0 0 0 1 1 1 1 1
```

Or.

```q
q)x:1 1 1 0 0 1 1
q)y:0 1 0 1 0 0 0                           / flag 1st but not 2nd group of 1s
q)-1 _ 0,x
0 1 1 1 0 0 1
q)x > -1 _ 0,x
1 0 0 0 1 0 0
q)(>)prior x
1 0 0 0 1 0 0
q)sums(>)prior x
1 1 1 1 1 2 2
q)y&x
0 1 0 0 0 0 0
q)a:sums(>)prior x
q)a where y&x
,1i
q)a in enlist 1
1111100b
q)x & a in enlist 1
1 1 1 0 0 0 0
q)x and a in(a:sums(>)prior x) where y&x
1 1 1 0 0 0 0
```


### Insert 0s after each part

Insert y[i] zeroes after i-th part.

```q
q)x:0 0 1 0 1 0 1 1
q)y:1 2 2 1
q)(0,where x)_x
0 0
1 0
1 0
,1
,1
q)raze((0,where x)_x),'(0,y)#'0
0 0 1 0 0 1 0 0 0 1 0 0 1 0
```

See also 264.


### Or-scan of parts flagged by y

```q
q)x:1 0 0 1 0 1 0 0
q)y:1 0 1 0 0 0 1 0
q)a:where y
q)a
0 2 6
q)b:a _ x
q)b
1 0
0 1 0 1
0 0
q)c:max each b
q)c
1 1 0
q)c:maxs each b
q)c
1 1
0 1 1 1
0 0
q)raze c
1 1 0 1 1 1 0 0
q)raze maxs each where[y]_ x
1 1 0 1 1 1 0 0
```


### And-scan of parts flagged by y

```q
q)x:1 0 0 1 0 1 0 0
q)y:1 0 1 0 0 0 1 0
q)a:where y
q)b:a _ x
q)b
1 0
0 1 0 1
0 0
q)c:mins each b
q)c
1 0
0 0 0 0
0 0
q)raze c
1 0 0 0 0 0 0 0
q)raze mins each where[y]_ x
1 0 0 0 0 0 0 0
```


### Gth part flagged by y

```q
q)x:"abcdefghijk"
q)y:1 0 0 1 0 1 0 0 0 1 0
q)(x;y)
a b c d e f g h i j k
1 0 0 1 0 1 0 0 0 1 0
q)g:2
q)where[y]_x
"abc"
"de"
"fghi"
"jk"
q)(where[y]_x) g
"fghi"
```



## Insert

### Insert y after each item of x

```q
q)x:"abc"
q)y:"d"
q)raze x,'y
"adbdcd"
```


### Append y items g to each item of x

```q
q)x:1 3 5
q)y:2
q)g:10
q)raze x,\:y#g
1 10 10 3 10 10 5 10 10
```


### Prepend y items of g to each item of x

```q
q)x:1 3 5
q)y:2
q)g:10
q)y#g
10 10
q)(y#g),/:x
10 10 1
10 10 3
10 10 5
q)raze (y#g),/:x
10 10 1 10 10 3 10 10 5
```


### Insert 0 after indexes y

```q
q)x:"abc,def,gh"
q)show y:(where x=","),#x
3 7 10
q)(count x)>(iasc (til count x),y)
1111011110110b
```


### Insert g copies of h after indexes y

```q
q)x:"abcd=,def=,gh="
q)show y:where x="="
4 9 13
q)g:4
q)h:"x"
q)show a:g*count y
12
q)(x,a#h)[iasc (til count x),a#y]
"abcd=xxxx,def=xxxx,gh=xxxx"
```


### Insert g copies of h before indexes y

```q
q)x:"1234,234,34"
q)y:0 5 9
q)g:5
q)h:"*"
q)a:g*count y
q)((a#h),x)[iasc (a#y),til count x]
"*****1234,*****234,*****34"
```



