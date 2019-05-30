# Rank



All arrays are lists. A list of atoms of the same type is a vector. 

An $x \times y$ matrix is a list of `x` vectors of length `y`, all of the same type.
A matrix has rank 2: it has two dimensions. 

The rank of an array is the depth to which it is rectangular.

```q
depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan{1=count distinct count each x}each raze over x]}
shape:{$[0=d:depth x; 
  0#0j; 
  d#{first raze over x}each(d{each[x;]}\count)@\:x]}
tc:('[til;count])
```


## Read 

### Rank of an array

The number of dimensions: the depth of nesting to which the array is rectangular.

```q
depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan{1=count distinct count each x}each raze over x]}
```

```q
q)depth 3                                   / atom
0
q)depth enlist 0                            / 1-item vector
1
q)depth "the quick brown fox"               / vector
1
q)depth("the";"quick";"brown";"fox")        / list - not rectangular at any depth
0
q)depth("the  ";"quick";"brown";"fox  ")    / matrix
2
q)depth 2 3 4#til 24
3
q)depth 2 1 2 1 3 1 4#0
7
```


### Shape of an array

The shape of an array is its count in each dimension: each level of nesting at which it is rectangular. 

```q
depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan{1=count distinct count each x}each(raze\)x]}
```

```q
q)x:2 1 2 1 3 1 4#0
q)shape x
2 1 2 1 3 1 4
```

The depth of an array is also the count of its shape.

```q
q)count shape x
7
q)depth x
7
q)depth 0
0
```

The shape of an atom is an empty vector. 

```q
q)shape 2 3 4#til 24                        / rank-3 array
2 3 4
q)shape("the  ";"quick";"brown";"fox  ")    / matrix
4 5
q)shape "the quick brown fox"               / vector
,19
q)shape 3                                   / atom
`long$()
```

==FIXME shape  and depth of a non-rectangular list==

```q
q)depth("the";"quick";"brown";"fox")        / wrong
0
q)depth("the";"quick";"brown";"fox")        / right
1
q)shape("the";"quick";"brown";"fox")        / wrong
`long$()
q)shape("the";"quick";"brown";"fox")        / right
,4
```

The shape of an empty list is `1#0 `.

```q
q)shape 3#"abcdef"
,3
q)shape 2#"abcdef"
,2
q)shape 1#"abcdef"
,1
q)shape 0#"abcdef"      / wrong
`long$()
q)shape 0#"abcdef"      / right
,0
```

==FIXME correct shape function==


## Decrease rank

### Atom from 1-item vector

```q
q)show x:enlist 3
,3
q)first x
3
```


### Vector from array

```q
q)show x:2 3 4#til 24
0 1 2  3    4 5 6  7    8 9 10 11
12 13 14 15 16 17 18 19 20 21 22 23
q)raze x
0  1  2  3
4  5  6  7
8  9  10 11
12 13 14 15
16 17 18 19
20 21 22 23
q)raze over x
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
q)
q)show y:("The quick brown fox ";"jumps over ";"the lazy dog.")
"The quick brown fox "
"jumps over "
"the lazy dog."
q)raze over y
"The quick brown fox jumps over the lazy dog."
```

Not quite. A vector has uniform type. If the array does not have uniform type, only casting can return a vector. 

<i class="far fa-hand-point-right"></i>
Reference: [Over](https://code.kx.com/v2/ref/accumulators/)


### Vector from column y of matrix

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



## Increase rank

### 1-row matrix from vector

```q
q)shape x:2 3 5 7 11
,5
q)shape enlist x
1 5
```


### 1-row matrix from atom or vector

```q
q){$[0<type x;enlist x;1 1#x]}1
1
q){$[0<type x;enlist x;1 1#x]}1 2
1 2
q)count {$[0<type x;enlist x;1 1#x]}1 2
1
```


### 2-row matrix from two vectors

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


### Y-row matrix from vector x

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


### 1-column matrix from vector

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
q)x+\:1#0       / numeric x only
34
31
51
29
35
17
89
```


### 2-column matrix from two vectors

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


### 2-column matrix from vector 

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


### X-column matrix from vector y

```q
q)x:4
q)y:"abc"
q)x#'y
"aaaa"
"bbbb"
"cccc"
```


### Matrix with diagonal x

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


### Increase rank of y to rank of x

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



## Empty matrix

In q’s ancestor languages arrays were rectangular. A matrix might have five columns but no rows. Any row joined to it could have only five columns. 
Such an ‘empty matrix’ would be `0 5#0`, but in q this actually signals a length error.

In q arrays are lists. A five-column matrix `x` is a list in which the items _happen_ themselves to all have five items. (Being a five-column matrix is a property that emerges from the items of `x`.It is not a property of `x` itself.) 

The closest q has to an ‘empty matrix’ is the generic empty list `()`.


