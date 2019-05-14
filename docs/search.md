# Search






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


## Find string x in string y

Including overlaps.

```q
q)x:"XX"
q)y:"XabcugjXXjyXXXkmhixXX12"
q)y ss x                                            / without overlaps
7 11 19
q)z where x~/:y (z:where y=first x)+\:til count x   / with overlaps
7 11 12 19
```


## Find rows of y in in corresponding rows of x

Column-by-column find.

```q
q)show x:1+3 4#til 12
1 2  3  4
5 6  7  8
9 10 11 12
q)q)show y:(1 0 3 0;0 6 0 8;9 0 0 12)
1 0 3 0
0 6 0 8
9 0 0 12
q)x?'y
0 4 2 4
4 1 4 3
0 4 4 3
```


## Find consecutive repeated elements

```q
q)x:"aaabccccdeee"
q)where differ x
0 3 4 8 9
```


## Find rows of matrix y in matrix x

```q
q)show x:flip 3 8#"abcdefgh"
"aaa"
"bbb"
"ccc"
"ddd"
"eee"
"fff"
"ggg"
"hhh"
q)show y:flip 3 4#"afmc"
"aaa"
"fff"
"mmm"
"ccc"
q)x?y
0 5 8 2
```

==DROP: not an idiom==


