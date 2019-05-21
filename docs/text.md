# Text






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

Or.

```q
q)x where reverse maxs reverse x<>" "
"trailing blanks"
```


## Remove leading blanks

```q
q)x:"  phrase 267  "
q)x where maxs x<>" "
"phrase 267  "
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
q)x where(and)over 0 1 reverse/'maxs each 1 reverse\x<>" "
"abcd e  fg"
```

Or Find and  Drop rather than `maxs` and Index.

```q
q)x{y _ x}/1 -1*(" "=1 reverse\x)?'0b
"abcd e  fg"
```


## Collapse multiple blanks

<i class="far fa-hand-point-right"></i> 379, 426

```q
q)x:"a    b       c    d"
q)x where 1 rotate(or)prior a:x<>" "
"a b c d"
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


## Insert x[i] blanks after y[g[i]]

```q
q)y:"Thequickbrownfox."
q)g:2 7 12 16
q)x:2 3 4 5
q)(0,1+ -1 _ g_ _ y
'(
  [0]  (0,1+ -1 _ g_ _ y
                       ^
q)(0,1+ -1 _ g) _ y
"The"
"quick"
"brown"
"fox."
q)raze((0,1+g)_y),'(x,0)#'" "
"The  quick   brown    fox.     "
```

See also 265.


## Locate quotes and text between them

```q
q)x:"The \"quick\" brown fox jumps over the \"lazy\" dog."
q)(<>)scan x="\""
000011111100000000000000000000000000011111000000b
q)(or)prior(<>)scan x="\""
000011111110000000000000000000000000011111100000b
q)x where (or)prior (<>)scan x="\""
"\"quick\"\"lazy\""
```

Or, for a single pair of quotes.

```q
q)x:"abc\"de\"f"
q)count x
8
q)a:x="\""
q)a
00010010b
q)b:where a
q)b
3 6
q)c:(first b)+til 1+ neg -/[b]
q)c
3 4 5 6
q)@[(count x)#0;c;:;1]
0 0 0 1 1 1 1 0
```


## Locate text between quotes

```q
q)x
"The \"quick\" brown fox jumps over the \"lazy\" dog."
q)x="\""
000010000010000000000000000000000000010000100000b
q)(<>)prior x="\""
000011000011000000000000000000000000011000110000b
q)(<>)scan x="\""
000011111100000000000000000000000000011111000000b
q)(and)prior(<>)scan x="\""
000001111100000000000000000000000000001111000000b
q)x where(and)prior(<>)scan x="\""
"quicklazy"
```

Or, for a single pair of quotes.

```q
q)x:"abc\"de\"f"
q)show b:where x="\""
3 6
q)show c:b+1 -1
4 5
q)d:(first c)+til 1+neg(-)over c
q)d
4 5
q)@[(count x)#0;d;:;1]
0 0 0 0 1 1 0 0
```


## Depth of parentheses

```q
q)x:"a(b((c)de)f)g(h)"
q)"()"=\:x
0101100000000100b
0000001001010001b
q)({x-0b,-1_y}/)"()"=\:x
0 1 0 1 1 0 0 -1 0 0 -1 0 -1 1 0 0i
q)sums({x-0b,-1_y}/)"()"=\:x
0 1 1 2 3 3 3 2 2 2 1 1 0 1 1 1i
```


## Spread flagged field heads right

```q
q)x:"abcdef"
q)y:1 1 0 0 1 0
q)a:where y
q)a
0 1 4
q)a _ x
,"a"
"bcd"
"ef"
q)count a _ x
3
q)count each a _ x
1 3 2
q)
q)b:count each a _ x
q)c:b#'a
q)c
,0
1 1 1
4 4
q)d:raze c
q)d
0 1 1 1 4 4
q)x[d]
"abbbee"
q)x raze(count each a _ x)#'a:where y
"abbbee"
```


## First word in string x

```q
q)x:"twas brillig and the slith"
q)x?" "
4
q)(x?" ")#x
"twas"
q)fw:{(x?" ")#x}
q)fw x
"twas"
```


## Remove leading zeros

```q
q)x:"00002345600345000"
q)((x="0")?0b) _ x
"2345600345000"
```


## 441. Comma-separated list from table

```q
q)show x:("Swift";"Austen";"Dickens")
"Swift"
"Austen"
"Dickens"
q)","sv x
"Swift,Austen,Dickens"
```

And.

```q
q)show x:("Jonathan Swift ";"Jane Austen    ";"Charles Dickens")
"Jonathan Swift "
"Jane Austen    "
"Charles Dickens"
q){neg[(reverse x=" ")?0b]_x}each x                     / trim
"Jonathan Swift"
"Jane Austen"
"Charles Dickens"
q){"\"",x,"\""}each{neg[(reverse x=" ")?0b]_x}each x    / quote
"\"Jonathan Swift\""
"\"Jane Austen\""
"\"Charles Dickens\""
q)","sv{"\"",x,"\""}each{neg[(reverse x=" ")?0b]_x}each x
"\"Jonathan Swift\",\"Jane Austen\",\"Charles Dickens\""
```


## Framing character matrix x

```q
q)show x:4 4#"abcdefghijklmnop"
"abcd"
"efgh"
"ijkl"
"mnop"
q)flip"-",'(flip"|",'x,'"|"),'"-"
"------"
"|abcd|"
"|efgh|"
"|ijkl|"
"|mnop|"
"------"
```


## Append empty row on matrix

```q
q)x
"ab"
"cd"
"ef"
q)1 0+shape x
4 2
q)@[(1 0+shape x)#" ";tc x;:;x]
"ab"
"cd"
"ef"
"  "
q)x,enlist(count first x)#" "
"ab"
"cd"
"ef"
"  "
q)flip(flip x),'" "
"ab"
"cd"
"ef"
"  "
```


## Insert empty row in x after row y

```q
q)show x:("ab";"cd";"ef")
"ab"
"cd"
"ef"
q)(flip(flip x),'" ")rank@[(1+count x)#1;y+1;+;1]
"ab"
"cd"
"  "
"ef"
q)@[x raze(1+tc[x]=y)#'tc x;y+1;:;" "]
"ab"
"cd"
" "
"ef"
```


## Table from string y at partitions flagged by x

```q
q)y:"eachwordinarow"
q)x:1 0 0 0 1 0 0 0 1 0 1 1 0 0
q)(where x) _ y
"each"
"word"
"in"
,"a"
"row"
```


## Insert spaces in text

```q
q)x:"wider"
q)-1_raze x,'" "
"w i d e r"
```

Or.

```q
q)c:-1+2*count x
q)@[c#" ";where c#1 0;:;x]
"w i d e r"
```


## Remove punctuation characters

```q
q)x:"oh! no, stop it. you will?"
q)PUN:",;:.!?"
q)x except y
"oh no stop it you will"
```

