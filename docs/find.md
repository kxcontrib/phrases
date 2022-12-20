# Find




To find something is to return indexes for it.




## Y in x

```q
q)x:" abcdefgh"
q)y:"faded head"
q)x?y
6 1 4 5 4 0 8 5 1 4
q)y:"deaf adder"
q)x?y
4 5 1 6 0 1 4 4 5 9

q)x:("cow";"sheep";"cat";"dog")         / matrixes are lists of rows
q)y:("cat";"cow";"cat";"dog";"sheep")
q)x?y
2 0 2 3 1
```

Here, `x~distinct x`, so `x?y` finds where the items of `y` occur in `x`.

Where `x` contains repeated items, `x?y` finds [first occurrence in `x` of `y`](#first-occurrence-in-x-of-y).


## Flags

Flags are booleans or integers in the range \[0,1\]. 
Finding flags is finding the 1s.

```q
q)where 010101b         / booleans
1 3 5
q)where 0 1 0 1 0 1     / integers
1 3 5
```


## All occurrences of y in x

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


```q
q)x:("apple";"banana";"orange";"pear")
q)y:("banana";"apple";"cherry")
q)where x in y
0 1
```


## First

### First occurrence of y

```q
q)x:"banana dream"
q)x?"band"
0 1 2 7
q)x?"bandana"
0 1 2 7 1 2 1
```

Or.

```q
q)x:3 0 4 3 1 4 4 3 3 1
q)y:4                           / atom
q)where x=y
2 5 6
q)first where x=y
2
```

Find (`?`) is more efficient than Equal (`=`), because its search terminates at the first match. 


### First occurrence of maximum

```q
q)x:5 3 7 0 5 7 2
q)x?max x
2
```


### First occurrence of minimum

```q
q)x?min x
3
```


### First occurrence of g (circularly) after y

```q
q)x:6 6 0 0 8 9 8 1 0 2 9 4 6 3 5
q)g:0 6 5
q)y:9
q)(y+(y rotate x)?g)mod count x
2 12 14
```


## Last

### Last occurrence of y

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



### Last occurrence of y, counted from the rear

```q
q)x:8 4 9 1 5 7
q)y:8 2 3 4 9 5 7 1 10 6 8 2
q)reverse[x]?y
5 6 6 4 3 1 0 2 6 6 5 6
```


## Difference

### Distinct items

```q
q)x:("banana";"pear";"apple";"cherry";"apple";"orange";"pear")
q)distinct x
"banana"
"pear"
"apple"
"cherry"
"orange"
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
q)
```


### First differing item of x and y

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


### Items not in y

```q
q)x:2 3 4 5 6 7 8 9 10 11
q)y:2 3 5 7 11
q)not x in y
0010101110b
q)where not x in y
2 4 6 7 8
```


### Consecutive repeated items

```q
q)x:"aaabccccdeee"
q)where differ x
0 3 4 8 9
```


## Matrixes

### Rows of matrix y in matrix x

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


### Items of y in array x

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


### Rows of y in in corresponding rows of x

Column-by-column find.

```q
q)show x:1+3 4#til 12
1 2  3  4
5 6  7  8
9 10 11 12
q)show y:(1 0 3 0;0 6 0 8;9 0 0 12)
1 0 3 0
0 6 0 8
9 0 0 12
q)x?'y
0 4 2 4
4 1 4 3
0 4 4 3
```


## Strings 

### First blank

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


### Last non-blank

```q
q)x:"blanks at end   "
q)x=" "
0000001001000111b
q)(" "=reverse x)?0b
4

q)show x:("love's not ";"time's fool ";"though rosy ")
q)ln:{last where not " "=x}
q)ln each x
9 10 10
```

!!! detail "Historical note"

   Ancestral languages APL and k support the boolean vector as left argument (encoding system) of what in q is `sv`. Reversing the boolean vector could thus be omitted. `sv` does not support that.


### String x in string y

Including overlaps.

```q
q)x:"XX"
q)y:"XabcugjXXjyXXXkmhixXX12"
q)y ss x                                            / without overlaps
7 11 19
q)z where x~/:y (z:where y=first x)+\:til count x   / with overlaps
7 11 12 19
```


## Text

### Blank rows

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


### Rows starting with item of y

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


