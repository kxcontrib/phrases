# Text






Phrases relating to character matrixes and nested lists, such as correspond to text files.

<i class="far fa-hand-point-right"></i>
[Strings](string.md)


## Align

### Left-justify fields of length y to length g

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


### Right-justify fields of length y to length g

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


## Collapse multiple occurrences

<i class="far fa-hand-point-right"></i> 424

```q
q)x:"bccbceekl"
q)y:"c"
q)x where 1 rotate(or)prior a:x<>y
"bcbceekl"
```


## Comma-separated list from matrix

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


## Find

### Rows starting with y

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


### Rows with items different from y

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



## Frame character matrix

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


## Insert y "*" after "="

```q
q)x:"abc=,d=,fgh="
q)y:5
q)show g:where x="="
3 6 11
q)(x,"*")[(count x)&iasc (til count x),(y*count g)#g]
"abc=*****,d=*****,fgh=*****"

q)raze ((0,1+-1_ g)_ x),\:y#"*"
"abc=*****,d=*****,fgh=*****"

q)a:where 0b,x="="
q)(x,(y*count a)#"*")rank raze (deltas[a]#'0),\:y#1
"abc=*****,d=*****,fgh=*****"
```


## Matrix from string at parts flagged by x

```q
q)x:"eachwordinarow"
q)y:1 0 0 0 1 0 0 0 1 0 1 1 0 0
q)x:"eachwordinarow"
q)y:1 0 0 0 1 0 0 0 1 0 1 1 0 0
q)show a:(where y)_x
"each"
"word"
"in"
,"a"
"row"
q)show b:count each a
4 4 2 1 3
q)a,'(max[b]-b:count each a:(where y)_x)#'" "
"each"
"word"
"in  "
"a   "
"row "
q)a,'#'[;" "]max[b]-b:count each a:(where y)_x
"each"
"word"
"in  "
"a   "
"row "
```


## Remove duplicate rows

```q
q)show x:("abc";"def";"abc";"ghi";"jkl";"abc";"ghi";"abc")
"abc"
"def"
"abc"
"ghi"
"jkl"
"abc"
"ghi"
"abc"
q)distinct x
"abc"
"def"
"ghi"
"jkl"
```


## Variable length lines

```q
q)x:"The quick brown fox"
q)y:"jumps over"
q)z:"the lazy dog."
q)(x;y;z)
"The quick brown fox"
"jumps over"
"the lazy dog."
```



## Whitespace


### Collapse whitespace

Collapse multiple blanks in string.

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

Collapse multiple blank rowsof a matrix.

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


Collapse duplicate blank columns of a matrix.

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


### Remove blank rows

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


### Remove leading blank rows

Again we can convert this to the trailing blanks of #205 and use `rtr`.

```q
q)rtr:{x where reverse maxs reverse not  x~\:(count flip x)#" "}
q)show x:reverse flip 3 9#"abc de   "
"   "
"   "
"   "
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
q)reverse rtr reverse x
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
```

Or.

```q
q)x=" "
111b
111b
111b
000b
000b
111b
000b
000b
000b
q)min each x=" "
111001000b
q)(min each x=" ")?0b
3
q)((min each x=" ")?0b)_ x
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
q)(sum mins min " "=flip x)_x
"eee"
"ddd"
"   "
"ccc"
"bbb"
"aaa"
```


### Remove trailing blank rows

```q
q)show x:flip 5 9#"abc de   "
"aaaaa"
"bbbbb"
"ccccc"
"     "
"ddddd"
"eeeee"
"     "
"     "
"     "
q)(and/) each x=" "
000100111b
q)reverse(and/) each x=" "
111001000b
q)mins reverse(and/)each x=" "
111000000b
q)neg sum mins reverse(and/)each x=" "
-3i
q)(neg sum mins reverse(and/)each x=" ")_ x
"aaaaa"
"bbbbb"
"ccccc"
"     "
"ddddd"
"eeeee"
```


### Remove blank columns

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


### Remove leading blank columns

Again we can convert this to the trailing blanks of #205 and use `rtr`.

```q
q)rtr:{x where reverse maxs reverse not  x~\:(count flip x)#" "}
q)show x:3 9#"   ed cha"
"   ed cha"
"   ed cha"
"   ed cha"
q)flip reverse rtr reverse flip x
"ed cha"
"ed cha"
"ed cha"
```

Or.

```q
q)x=" "
111001000b
111001000b
111001000b
q)min x=" "
111001000b
q)mins min x=" "
111000000b
q)(mins min x=" ")?0b
3
q)((mins min x=" ")?0b)_'x
"ed cha"
"ed cha"
"ed cha"
q)sum[mins min x=" "]_'x
"ed cha"
"ed cha"
"ed cha"
```


### Remove trailing blank columns

We can convert this to to the trailing blank rows of #205 and use `rtr`.

```q
q)rtr:{x where reverse maxs reverse not  x~\:(count flip x)#" "}
q)show x:3 9#"abc de   "
"abc de   "
"abc de   "
"abc de   "
q)rtr x
"abc de   "
"abc de   "
"abc de   "
q)rtr flip x
"aaa"
"bbb"
"ccc"
"   "
"ddd"
"eee"
q)flip rtr flip x
"abc de"
"abc de"
"abc de"
```

Or.

```q
q)x=" "
000100111b
000100111b
000100111b
q)min x=" "
000100111b
q)reverse min x=" "
111001000b
q)mins reverse min x=" "
111000000b
q)sum mins reverse min x=" "
3i
q)neg[sum mins reverse min x=" "]_'x
"abc de"
"abc de"
"abc de"
```


### Append empty row

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


### Insert empty row after row y

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


