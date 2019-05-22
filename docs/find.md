# Find






## Find all occurrences of y in x

```q
q)x:"abcdefgab"
q)y:"afc*"          / list
q)x in y
101001010b
q)where x in y
0 2 5 7
```

Or.

```q
q)x:"abcdeabc"
q)y:"a"             / atom
q)where x=y
0 5
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


## Find first blank

```q
q)x:"ab c d"
q)x?" "
2
q)show x:("ab c d";" a bc";"abcd ")
"ab c d"
" a bc"
"abcd "
q)x?\:" "
2 0 4
```


## Find last non-blank

```q
q)x:"blanks at end   "
q)x=" "
0000001001000111b
q)(" "=reverse x)?0b
4
```

!!! detail "Historical note"

   Ancestral languages APL and k support the boolean vector as left argument (encoding system) of what in q is `sv`. Reversing the boolean vector could thus be omitted. `sv` does not support that.


## Find last occurrence of y in x

```q
q)x:3 0 4 3 1 4 4 3 3 1
q)y:4                           / atom
q)where x=y
2 5 6
q)last where x=y
6
```

Or.

```q
q)count x
10
q)(reverse x)?y
3
q)count[x]-1+(reverse x)?y
6
q)y:4 0                         / vector
q)count[x]-1+(reverse x)?y
6 1
```


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


## Find last non-blank in string

```q
q)show x:("love's not ";"time's fool ";"though rosy ")
q)ln:{last where not " "=x}
q)ln each x
9 10 10
```


## Find first occurrence of maximum item of x

```q
q)x:5 3 7 0 5 7 2
q)x?max x
2
```


## Find first occurrence of minimum

```q
q)x?min x
3
```


## Find first occurrence in x of an item of y

```q
q)x:"banana dream"
q)x?"band"
0 1 2 7
q)x?"bandana"
0 1 2 7 1 2 1
```


## Find blank rows

```q
q)show x:flip 5 6#"a bc d"
"aaaaa"
"     "
"bbbbb"
"ccccc"
"     "
"ddddd"
q)all flip x=" "
010010b
```


## 471. Find first occurrence of g in x (circularly) after y

```q
q)x:6 6 0 0 8 9 8 1 0 2 9 4 6 3 5
q)g:0 6 5
q)y:9
q)(y+(y rotate x)?g)mod count x
2 12 14
```


## 499. Rows of y starting with item of x

```q
q)show x:("abcd";"efgh";"ijkl";"mnop")
"abcd"
"efgh"
"ijkl"
"mnop"
q)y:"ai"
q)x[;0]in y
1010b
q)x where x[;0]in y
"abcd"
"ijkl"
```


## Find last occurrence of y in x, counted from the rear

```q
q)x:8 4 9 1 5 7
q)y:8 2 3 4 9 5 7 1 10 6 8 2
q)reverse[x]?y
5 6 6 4 3 1 0 2 6 6 5 6
```


## For each item of y, the index of its last occurrence in x

```q
q)x:"aabbbcccc"
q)show y:x,"ddd"
"aabbbccccddd"
q)x?y
0 0 2 2 2 5 5 5 5 9 9 9
q)reverse[x]?y
7 7 4 4 4 0 0 0 0 9 9 9
q)count[x]-reverse[x]?y
2 2 5 5 5 9 9 9 9 0 0 0
q)count[x]-1+reverse[x]?y
1 1 4 4 4 8 8 8 8 -1 -1 -1
q)0|count[x]-1+reverse[x]?y
1 1 4 4 4 8 8 8 8 0 0 0
```


## Find first differing item of x and y

```q
q)x:3 1 4 1 6 0
q)y:3 1 4 1 5 9
q)(x<>y)?1b
4
```

Or.

```q
q)first where x<>y
4
```


## Flag items of x not in y

```q
q)x:2 3 4 5 6 7 8 9 10 11
q)y:2 3 5 7 11
q)not x in y
0010101110b
```


## Find y in x

```q
q)x:" abcdefgh"
q)y:"faded head"
q)x?y
6 1 4 5 4 0 8 5 1 4
q)y:"deaf adder"
q)x?y
4 5 1 6 0 1 4 4 5 9
```

