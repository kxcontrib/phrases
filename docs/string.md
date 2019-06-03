# Strings 



Character vectors are known informally in q as _strings_.

For phrases relating to character matrixes and nested lists, see [Text](text.md).



## Alphabetic comparison

```q
q)"a"<"b"
1b
q)"a">"b"
0b
q)"i"$";"
59
q){enlist[" ",x],x,'" *"x<\:x}PUN,{upper[x],x}.Q.a
" ,;:.!?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
", *** *****************************************************"
";     *****************************************************"
": *   *****************************************************"
". **  *****************************************************"
"!**** *****************************************************"
"?      ****************************************************"
"A       ***************************************************"
"B        **************************************************"
"C         *************************************************"
"D          ************************************************"
"E           ***********************************************"
"F            **********************************************"
"G             *********************************************"
"H              ********************************************"
"I               *******************************************"
"J                ******************************************"
"K                 *****************************************"
"L                  ****************************************"
"M                   ***************************************"
"N                    **************************************"
"O                     *************************************"
..
```



## Blanks

### Remove blanks

```q
q)x:" bcde bc"
q)x where x<>" "
"bcdebc"
q)x except " "
"bcdebc"
```


### Remove trailing blanks

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


### Remove leading blanks

```q
q)x:"  phrase 267  "
q)x where maxs x<>" "
"phrase 267  "
```


### Remove leading and trailing blanks

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


### Collapse multiple blanks

<i class="far fa-hand-point-right"></i> 379, 426

```q
q)x:"a    b       c    d"
q)x where 1 rotate(or)prior a:x<>" "
"a b c d"
```


### Move blanks to end

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


### Justify right

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


### Center text x in line of width y

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


### Insert spaces in text

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


## Conditional text

```q
q)x:0
q)raze((not x)#'"in"),"correct"
"incorrect"
q)x:1
q)raze((not x)#'"in"),"correct"
"correct"
```

Or.

```q
q)x:0
q)$[x;"true";"false"]
"false"
q)x:1
q)$[x;"true";"false"]
"true"
```


## Remove leading zeros

```q
q)x:"00002345600345000"
q)((x="0")?0b) _ x
"2345600345000"
```


## Remove punctuation characters

```q
q)x:"oh! no, stop it. you will?"
q)PUN:",;:.!?"
q)x except y
"oh no stop it you will"
```




## Search

### Ordinal of word in x pointed at by y

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


### Find start of string x in string y

```q
q)x:"st"
q)y:"indexes of start of string x in string y"
q)y ss x
11 20 32
```



### Find first occurrence of string x in string y

```q
q)x:"st"
q)y:"index of first occurrence of string x in string y"
q)first y ss x
12
```


### Locate quotes and text between them

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


### Locate text between quotes

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


### Depth of parentheses

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


### First word in string x

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



## Substrings 

### Insert blank in y after flag in x

```q
q)x:1 0 0 0 0 1 0 0
q)y:"abcdefgh"
q)y,'x#'" "
"a "
,"b"
,"c"
,"d"
,"e"
"f "
,"g"
,"h"
q)raze y,'x#'" "
"a bcdef gh"
```

Or.

```q
q)c:count[x]+sum x
q)@[c#" ";til[c]except where x;:;y]
" abcd efgh"
```



### Insert x[i] blanks after y[g[i]]

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


### Spread flagged field heads right

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


