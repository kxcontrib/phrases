# Strings






## Remove trailing blanks

```q
q)x:"trailing blanks    "
q)(neg sum mins reverse " "=x)_ x
"trailing blanks"
```

`sum` and `mins` must evaluate the whole vector. But Find terminates with the first hit. 

```q
q)(neg reverse[x=" "]?0b)_ x
"trailing blanks"
```

Reversing a string is faster than reversing a boolean vector.

```q
q)neg[(reverse[x]=" ")?0b]_ x
"trailing blanks"
```


## Removing leading and trailing blanks

```q
q)x:"   abcd e  fg   "
q)a:not x=" "
q)a
0001111010011000b
q)(maxs a) and reverse maxs reverse a
0001111111111000b
q)where (maxs a) and reverse maxs reverse a
3 4 5 6 7 8 9 10 11 12
q)x where maxs[a]and reverse maxs reverse a:x<>" "
"abcd e  fg"
```

Or.

```q
q)x where(&/)0 1(reverse/)'flip maxs" "<>flip 1 reverse\x
"abcd e  fg"
```

Or Find and  Drop rather than `maxs` Index.

```q
q)x{y _ x}/1 -1*(" "=1 reverse\x)?'0b
"abcd e  fg"
```



## Justify right

```q
q)x:"trailing blanks   "
q)neg[(reverse[x]=" ")?0b]rotate x
"   trailing blanks"
q)rj:{neg[(reverse[x]=" ")?0b]rotate x}
q)rj each ("a     ";"bc    ";"d e   ";"fg h  ";"ij kl ";"mnopqr")
"     a"
"    bc"
"   d e"
"  fg h"
" ij kl"
"mnopqr"
```


## Move blanks to end of string

```q
q)x:"sign if i cant"
q)x[iasc x=" "]
"significant   "
q)be:{x[iasc x=" "]}
q)y:("yo ho ho";"and a bottle";"of rum")
q)be each y
"yohoho  "
"andabottle  "
"ofrum "
```


## Ordinal of word in x pointed at by y

```q
q)ow:{sum not y<1+where x=" "}
q)x:"ordinal of word in x pointed at by y"
q)ow[x;5]
0
q)ow[x;6]
0
q)ow[x;7]
0
q)ow[x;8]
1
q)ow[x;26]
5
```


## Find start of string x in string y

```q
q)x:"st"
q)y:"indices of start of string x in string y"
q)y ss x
11 20 32
```

==DROP Not an idiom==


## Find first occurrence of string x in string y

```q
q)x:"st"
q)y:"index of first occurrence of string x in string y"
q)first y ss x
12
```

== DROP Not an idiom ==


## Right-justify fields x of length y to length g

```q
q)x:"abcdefghij"
q)y:2 3 4 1
q)g:5
q)a:sums 0,-1_y
q)a
0 2 5 9
q)a _ x
"ab"
"cde"
"fghi"
,"j"
q)(g#" "),/:a _ x
"     ab"
"     cde"
"     fghi"
"     j"
q)b:(neg g)#/:(g#" "),/:a _ x
q)b
"   ab"
"  cde"
" fghi"
"    j"
q)raze b
"   ab  cde fghi    j"
q)rj:{[x;y;g]raze(neg g)#/:(g#" "),/:(sums 0,-1_y) _ x}
q)rj[x;y;g]
"   ab  cde fghi    j"
```


## Left-justify fields x of length y to length g

```q
q)x:"abcdefghij"
q)y:2 3 4 1
q)g:5
q)a:sums 0,-1_y
q)a
0 2 5 9
q)a _ x
"ab"
"cde"
"fghi"
,"j"
q)((sums 0,-1_y)_x),\:g#" "
"ab     "
"cde     "
"fghi     "
"j     "
q)g#/:((sums 0,-1_y)_x),\:g#" "
"ab   "
"cde  "
"fghi "
"j    "
q)ljust:{[x;y;g]raze g#/:((sums 0,-1_y)_x),\:g#" "}
q)ljust[x;y;g]
"ab   cde  fghi j    "
```


## Rows of matrix x starting with y

```q
q)x:("sit";"sat";"sin";"tin")
q)y:"si"
q)x[;tc y]
"si"
"sa"
"si"
"ti"
q)x[;tc y]~\:y
1010b
q)x where x[;tc y]~\:y
"sit"
"sin"
```


## Single blank row from multiple

Collapse multiple embedded blanks in string.

```q
q)s:"a bc  def    g"
q)" "<>s
10110011100001b
q){x&1_x,1b}" "<>s
00100011000001b
q){x|1_x,1b}" "<>s
11110111100011b
q)s where{x|1_x,1b}" "<>s
"a bc def g"
```

Remove multiple blanks rows from matrix.

```q
q)show x:3#'s
"aaa"
"   "
"bbb"
"ccc"
"   "
"   "
"ddd"
"eee"
"fff"
"   "
"   "
"   "
"   "
"ggg"
q)" "<>x
111b
000b
111b
111b
000b
000b
111b
111b
111b
000b
000b
000b
000b
111b
q)(or)over" "<>x
111b
q)(or)over" "<>flip x
10110011100001b
q)x where{x|1_x,1b}(or)over" "<>flip x
"aaa"
"   "
"bbb"
"ccc"
"   "
"ddd"
"eee"
"fff"
"   "
"ggg"
```


## Remove duplicate blank columns

```q
q)show x:3 9#"a b c   d"
"a b c   d"
"a b c   d"
"a b c   d"
q)flip rs flip x
"a b c d"
"a b c d"
"a b c d"
```


## Remove blank rows

```q
q)show x:("aaa";"bbb";"   ";"ccc";"   ")
"aaa"
"bbb"
"   "
"ccc"
"   "
q)x except enlist count[first x]#" "
"aaa"
"bbb"
"ccc"
```

Or.

```q
q)show x:("aaa";"bbb";"   ";"ccc";"   ")
"aaa"
"bbb"
"   "
"ccc"
"   "
q)" "<>flip x
11010b
11010b
11010b
q)max " " <> flip x
11010b
q)x where max " " <> flip x
"aaa"
"bbb"
"ccc"
```


## Remove blank columns

Convert to the blank rows of #225.

```q
q)show x:flip 4 4#"xxxx    hhhh  ii"
"x h "
"x h "
"x hi"
"x hi"
   flip(flip x)except enlist count[x]#" "
"xh "
"xh "
"xhi"
"xhi"
```

Or.

```q
q)x<>" "
1010b
1010b
1011b
1011b
q)max x<>" "
1011b
q)x[;where max x<>" "]
"xh "
"xh "
"xhi"
"xhi"
```


## Is y a row of x?

```q
q)show x:("xxx";"yyy";"zzz";"yyy")
q)"yyy" in x
1b
q)"abc" in x
0b
```

== DROP Keyword, not idiom ==


## Which rows of x contain elements different from y?

```q
q)show x:("aaa";"bbb";"ooo";"pop")
q)y:"o"
q)x<>y
111b
111b
000b
101b
q)max each x<>y
1101b
```


## Center text x in line of width y

```q
q)x:"1234567890"
q)y:16
q)y#x,y#" "
"1234567890      "
q)y-count x
6
q)floor(y-count x)%2
3
q)neg[floor(y-count x)%2]rotate y#x,y#" "
"   1234567890   "
```

Or.

```q
q)@[y#" ";(floor(y-count x)%2)+tc x;:;x]
"   1234567890   "
```

Above should be faster but breaks where `y<count x`.



