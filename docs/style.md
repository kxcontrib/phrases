# Style




Fluency with the [syntax of q](https://code.kx.com/q/basics/syntax/) promotes clarity of expression and thought, and reduces maintenance costs. 


## Apply a binary between two values

The Over iterator can be used to ‘map reduce’ a list using a binary.
Where a list has just two items it can also be used to apply a binary to them. 
This is a form convenient in ancestor vector languages, redundant in q.

Where a list is _known_ to have two items, use 
[Apply](https://code.kx.com/q/ref/apply/), which tells your reader to expect a 2-list. 

For example, not this: 

```q
q)x:2 3
q){x*5+y} over x
16
q)(xexp) over x
8f
q)(*) over x
6
```

but this:

```q
q){x*5+y} . x           / lambda
16
q)(xexp) . x            / keyword
8f
q)(*) . x               / operator
6
```

Example – vector product:

```q
q)x:2 8 5 6 3 1 7 7 10 4
q)y:6 9 1 1 6 7 1 4 1 5
q)(-) over prd each(1 neg\1 -1)rotate''2 2#(x;y)
4 28 46 -27 -41 39 45 3 -19 -58
```

Above, the Subtract Over reduction is an unnecessarily general way to get the difference of two lists. 

```q
q)prd each(1 neg\1 -1)rotate''2 2#(x;y)                 / a 2-list
40 30 54 3  1  42 49 10 16 2
36 2  8  30 42 3  4  7  35 60
q)(-). prd each(1 neg\1 -1)rotate''2 2#(x;y)            / Apply, not Over
4 28 46 -27 -41 39 45 3 -19 -58
```

Example – connection matrix from node matrix:

```q
q)show x:(0 0 2 1 1;2 1 3 2 3)          / node matrix
0 0 2 1 1
2 1 3 2 3
q)x=/:tc distinct raze x                / where is x equal to each of it
11000b 00000b
00011b 01000b
00100b 10010b
00000b 00101b
q)(-/)each x=/:tc distinct raze x       / connection matrix
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
```

The last expression above returns the difference between two matrixes. 
Flipping them makes this clearer. 

```q
q)shape x=/:tc distinct raze x
4 2 5
q)shape flip x=/:tc distinct raze x     / 2-list
2 4 5
q)(-). flip x=/:tc distinct raze x      / single subtraction
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
```

:fontawesome-solid-hand-point-right:
[Coefficients of exponential fit of points (x,y)](poly.md#coefficients-of-exponential-fit-of-points-xy)

## Project to avoid parens

Improve the reading flow of expressions by using projections to avoid parentheses.

```q
q)y:1900 1901 1904 1999 2000 2100               / years
q){(sum 0=x mod\:4 100 400)mod 2}each y         / leap years
0 0 1 0 1 0
q){mod[;2] sum 0=x mod\:4 100 400}each y
0 0 1 0 1 0
```



## Compose to avoid multiple iterators

[Compose](https://code.kx.com/q/ref/compose/) a unary function with another function into a single iterable object. 
Composition makes `peach` more efficient. 

rank of g | not this           | nor this               | but this
:--------:| ------------------ | -----------------------|-------------------
1         | `f each g each x`  | `{f g x}each x`        | `('[f;g])each x`
2         | `f each x g'y`     | `x{f g[x;y]}'y`        | `x('[f;g])'y`
3         | `f each g'[x;y;z]` | `{f g[x;y;z]}'[x;y;z]` | `('[f;g])'[x;y;z]`

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


Operators and their projections can be [composed by juxtaposition](https://code.kx.com/q/ref/compose/#implicit-composition).

```q
q)x:-100 2 3 4 -100 6 7 8 9 -100
q)(x;0 (0|+)\x)                     / running sums of parts
-100 2 3 4 -100 6 7  8  9  -100
0    2 5 9 0    6 13 21 30 0
```


