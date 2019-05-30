# Forms



## Apply a binary between two values

```q
q)x:2 3
q){x*5+y} . x           / lambda
16
q)(xexp) . x            / keyword
8f
q)(*) . x               / operator
6
```

Using [Over](https://code.kx.com/v2/ref/accumulators/) is possible but more verbose.

```q
q){x*5+y} over x
16
q)(xexp) over x
8f
q)(*) over x
6
```

```q
q)x:2 8 5 6 3 1 7 7 10 4
q)y:6 9 1 1 6 7 1 4 1 5
q)(-) over prd each(1 neg\1 -1)rotate''2 2#(x;y)        / vector product
4 28 46 -27 -41 39 45 3 -19 -58
q)prd each(1 neg\1 -1)rotate''2 2#(x;y)                 / a 2-list
40 30 54 3  1  42 49 10 16 2
36 2  8  30 42 3  4  7  35 60
q)(-). prd each(1 neg\1 -1)rotate''2 2#(x;y)
4 28 46 -27 -41 39 45 3 -19 -58
```

Use Over only when aggregating a list of unknown or variable length.
Using [Apply](https://code.kx.com/v2/ref/apply/) tells your reader to expect two items in the list. 

```q
q)show x:(0 0 2 1 1;2 1 3 2 3)          / node matrix
0 0 2 1 1
2 1 3 2 3
q)x=/:tc distinct raze x                / where is x equal to each of it
11000b 00000b
00011b 01000b
00100b 10010b
00000b 00101b
q)/ connection matrix
q)(-/)each x=/:tc distinct raze x       / subtract "to" from "from" matrix
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
q)shape x=/:tc distinct raze x
4 2 5
q)shape flip x=/:tc distinct raze x     / 2-list
2 4 5
q)(-). flip x=/:tc distinct raze x      / clearer: single subtraction
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
```


## Project to avoid parens

Preserve the reading flow of expressions by using projections to avoid parentheses.

```q
q)y:1900 1901 1904 1999 2000 2100               / years
q){(sum 0=x mod\:4 100 400)mod 2}each y         / leap years
0 0 1 0 1 0
q){mod[;2] sum 0=x mod\:4 100 400}each y
0 0 1 0 1 0
```



## Compose to avoid multiple iterators

[Compose](https://code.kx.com/v2/ref/compose/) a unary function with another function into a single iterable object. 
Composition makes `peach` more efficient. 

rank of g | not this           | nor this              | but this
:--------:| ------------------ | ----------------------|-------------------
1         | `f each g each x`  | `{f g x}each x`       | `('[f;g])each x`
2         | `f each x g'y`     | `x{f g[x;y]}'y`       | `x('[f;g])'y`
3         | `f each g'[x;y;z]` |`{f g[x;y;z]}'[x;y;z]` | `('[f;g])'[x;y;z]`

Extend Compose with Over to compose multiple unary functions with another function.

```q
q)foo:(('[;])over (d;e;f;g))
q)foo each x                    / unary g
..
q)x foo'y                       / binary g
..
q)foo'[x;y;z]                   / ternary g
..
```

rank of g | not this                    | but this
:--------:|-----------------------------|---------------
1         | `{d e f g x}each x`         | `foo each x` 
2         | `x{d e f g[x;y]}'y`         | `x foo'y`
3         | `{d e f g[x;y;x]}'[x;yx;z]` | `foo'[x;y;z]`


Operators and their projections can be [composed by juxtaposition](https://code.kx.com/v2/ref/compose/#implicit-composition).

```q
q)x:-100 2 3 4 -100 6 7 8 9 -100
q)(x;0 (0|+)\x)
-100 2 3 4 -100 6 7  8  9  -100
0    2 5 9 0    6 13 21 30 0
```


