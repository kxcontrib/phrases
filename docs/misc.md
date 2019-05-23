# Miscellaneous





## Cyclic counter 

Length `x`, repeating 1 through `y`

```q
q)x:10
q)y:8
q)1+til x
1 2 3 4 5 6 7 8 9 10
q)1+(1+til x)mod y
2 3 4 5 6 7 8 1 2 3
```


## Selection by encoded list

```q
q)"abcdefgh"[2 sv 1 0 1]
"f"
q)"abcdefgh"[2 sv 0 0 0]
"a"
q)"abcdefgh"[2 sv 1 1 1]
"h"
q)"abcdefgh" 2 sv flip 3 3 #1 0 1 0 0 0 1 1 1
"fah"
```


## Remove duplicate rows

```q
q)x:("to";"be";"or";"not";"to";"be")
q)distinct x
"to"
"be"
"or"
"not"
```


## Name variable according to x

```q
q)test          / not defined
'test
  [0]  test
       ^
q)`test set 42
`test
q)test
42
q)(`$"foo")set 43
`foo
q)foo
43
```


## Y-shaped array of numbers from x[0] to x[1]-1

```q
q)x:4 9
q)y:3 4
q)y#first[x]+prd[y]?(-)over reverse x
4 6 8 8
5 8 7 7
4 6 5 8
```


## Y items selected with replacement from til x

Roll.

```q
q)y:3 5
q)x:7
q)y?x
6 2 1 2 2
4 4 6 3 0
6 3 4 5 1
q)3 5#7?7
5 1 2 1 2
0 3 5 1 2
1 2 0 3 5
```

==DROP Not an idiom; just how Roll works.==


## Y objects selected without replacement from til x

Deal.

```q
q)-6?8
5 7 3 2 0 4
```

==DROP Not an idiom; just how Deal works.==


## Count of x between endpoints (l,h)

```q
q)show x:(66 8 6 4 86;82 91 52 53 89;43 0 62 3 17;0 26 80 2 12;37 41 41 72 10)
66 8  6  4  86
82 91 52 53 89
43 0  62 3  17
0  26 80 2  12
37 41 41 72 10
q)sum raze (x>l)&x<h        / exclusive range
12i
q)sum raze (x>=l)&x<=h      / inclusive range
14i
```


## Sum items of y by ordered codes g in x

```q
q)(x;y)
e  c  b  b b  a c  e  e  a  e  c  c  b  e  c  b a  e  a
12 40 10 1 26 9 26 43 26 37 20 29 38 33 24 37 4 45 41 2
q)group x
e| 0 7 8 10 14 18
c| 1 6 11 12 15
b| 2 3 4 13 16
a| 5 9 17 19
q)g:"abcde"
q)group g,x
a| 0 10 14 22 24
b| 1 7 8 9 18 21
c| 2 6 11 16 17 20
d| ,3
e| 4 5 12 13 15 19 23
q)sum each ((count[g]#0),y)group g,x
a| 93
b| 74
c| 170
d| 0
e| 166
q)sum each ((count[g]#0),y)value group g,x
93 74 170 0 166
```


## Range; nub; remove duplicates

```q
q)x:"wirlsisl"
q)distinct x
"wirls"
q)distinct (1 2 3;4 5;1 2 3;4 5;1 2 3)
1 2 3
4 5
```

==DROP: not an idiom==


## Assign x to one of y classes of width h, starting with g

```q
q)f:{[x;y;g;h] value -1+ -1 _ count each group(1+til y),neg floor neg(x-g)%h}
q)x:32 56 36 48 36 24 28 44 52 32
q)y:4
q)h:10
q)g:10
q)f[x;y;g;h]
0 2 4 2
```

==FIXME==



## Move x into first quadrant

```q
q)sm:{x-min x}
q)show x:(1 6 4;3 4 7;7 8 6)
1 6 4
3 4 7
7 8 6
q)sm each x
0 5 3
0 1 4
1 2 0
```

==FIXME Confirm category==


## Contour levels y at points with altitude x

```q
q)cl:{y[-1+sum not y>x]}
q)y:-100 0 10 100 1000 10000
q)cl[-5;y]
-100
q)cl[0;y]
0
q)cl[99;y]
10
q)cl[9;y]
0
q)cl[10;y]
10
```


## Which class of y x belongs to

```q
q)cl:{-1+sum x>/:y}
q)x:87 9 931 7 27 92 654 1416 7 911
q)y:0 50 100 1000
q)sum x>/:y
2 1 3 1 1 2 3 4 1 3
q)x>/:y
1111111111b
1010011101b
0010001101b
0000000100b
q)-1 sum x>/:y
'type
q)-1+ sum x>/:y
1 0 2 0 0 1 2 3 0 2
q)cl[x;y]
1 0 2 0 0 1 2 3 0 2
```


## Numeric array and its negative

```q
q)show x:3+3 4#til 12
3  4  5  6
7  8  9  10
11 12 13 14
q)x,''neg x
3 -3   4 -4   5 -5   6 -6
7  -7  8  -8  9  -9  10 -10
11 -11 12 -12 13 -13 14 -14
q)((1 -1*)'')x
3 -3   4 -4   5 -5   6 -6
7  -7  8  -8  9  -9  10 -10
11 -11 12 -12 13 -13 14 -14
```


## Remove trailing blank rows

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


## Remove trailing blank columns

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


## Remove leading blank columns

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


## Remove leading blank rows

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

==DROP: not an idiom==


## Number of occurrences of x in y

```q
q)show y:3+7?6
6 4 7 7 6 6 4
q)x:7
q)sum x=y
2
```


## Randomize the random seed

```q
q)\S
-314159
q)\S -1154371779
q)\S
-1154371779
```

==DROP: not an idiom==


## Offset enumeration

```q
q)x:10
q)y:3
q)x+til y
10 11 12

q)x:10 20 30
q)y:3 4 2
q)raze x+til each y
10 11 12 20 21 22 23 30 31
```


## Mask from positive integers in x

```q
q)x:2 3 3 -2 4 4 -1
q)x in til 1+max x
00111b
```


## Identity for floating-point maximum, negative infinity

```q
q)max 0#0.0
-0w
q)-1e100|-0w
-1e+100
q)-1e100|-0W
-2.147484e+09
q)-123456789|-0w
-1.234568e+08
q)-123456789|-0W
-123456789
```


## Identity for floating point minimum, positive infinity

```q
q)min 0#0.0
0w
q)1e100&0w
1e+100
q)1e100&0W
2.147484e+09
q)123456789&0w
1.234568e+08
q)123456789&0W
123456789
```


## Pairwise match

```q
q)x:("123";"123";"45";"45")
q)x
"123"
"123"
"45"
"45"
q)~':[x]
0101b
q)~':[x],0b
01010b
q)(~':[x]),0b
01010b
q)pm:{1 _ (~':[x]),0b}
q)pm 1 1 1 1 2 2 3 4 4 4
1110100110b
q)1 rotate(~)prior x
1010b
q)1 rotate(~)prior 1 1 1 1 2 2 3 4 4 4
1110100110b
```


## Count of occurrences of x in y

```q
q)x:"q"
q)y:"quaquaqua"
q)sum x=y
3
```

Or.

```q
q)y:"quackadoodledo"
q)x:"qua"
q)x=\:y
10000000000000b
01000000000000b
00100100000000b
q)sum each x=\:y
1 1 2i
q)count each group y
q| 1
u| 1
a| 2
c| 1
k| 1
d| 3
o| 3
l| 1
e| 1
q)(count each group y)x
1 1 2
```


## Count of scalars

```q
q)cs:{count raze over x}
q)cs 1
1
q)cs[1 2]
2
q)cs[(1 2;3 4 5)]
5
q)cs[(1 2;(3 4;5))]
5
q)cs[("ab";("cd";"efg"))]
7
q)cs[til 0]
0
```


## Insert row x in matrix y after row g

```q
q)y:4 3#1+til 12
q)y
1  2  3
4  5  6
7  8  9
10 11 12
q)x:13 14 15
q)g:2
q)a:y,enlist x
q)a
1  2  3
4  5  6
7  8  9
10 11 12
13 14 15
q)b:iasc(til count y),g
q)b
0 1 2 4 3
q)a[b]
1  2  3
4  5  6
7  8  9
13 14 15
10 11 12
q)(y,enlist x)[iasc(til count y),g]
1  2  3
4  5  6
7  8  9
13 14 15
10 11 12
```


## Remove leading, multiple and trailing ys from x

```q
q)x:0 0 1 2 0 0 3 4 0 5 0 0 0
q)y:0
q)a:x=y
q)b:not a&1 rotate a
q)b
0111011111000b
q)a
1100110010111b
q)x[where b]
0 1 2 0 3 4 0 5
q)a[0]_ x[where b]
1 2 0 3 4 0 5
```


## Change items of x with value y[0] to y[1]

```q
q)x:"ddaeecadbbcbedc"
q)y:"d "
q)@[x;where x=y 0;:;y 1]
"  aeeca bbcbe c"

q)x
"ddaeecadbbcbedc"
q)@[`x;where x=y 0;:;y 1]
`x
q)x
"  aeeca bbcbe c"

q)x:"ddaeecadbbcbedc"
q)x[where x=y 0]:y 1
q)x
"  aeeca bbcbe c"
```


## Insert x in y after index g

```q
q)x:1 2 3
q)y:10*1+til 7
q)y
10 20 30 40 50 60 70
q)g:3
q)((g+1)#y),x,(g+1)_ y
10 20 30 40 1 2 3 50 60 70
```

Or.

```q
q)y[til g+1],x,(g+1)_y
10 20 30 40 1 2 3 50 60 70
q)raze((0,g+1)_y),'(x;())
10 20 30 40 1 2 3 50 60 70
q)(y,x)rank raze((g+1),(count x),count[y]-1+count x)#'1 2 1
10 20 30 40 1 2 3 50 60 70
```


## Drop first, suffix 0

```q
q)x:3 4 5 6
q)1_ x,0
4 5 6 0
```


## Drop last, prefix 0

```q
q)x:3 4 5 6
q)-1 _ 0,x
0 3 4 5
```


## Shift x right y, fill 0

```q
q)x:1+til 12
q)y:3
q)@[(neg y) mod  x; til y;:;0]
0 0 0 1 2 3 4 5 6 7 8 9
```

Or.

```q
q)(y#0),neg[y]_x
0 0 0 1 2 3 4 5 6 7 8 9
```


## Shift x left y, fill 0

```q
q)x:1+til 12
q)y:3
q)@[y rotate x;((count x)-y)+til y;:;0]
4 5 6 7 8 9 10 11 12 0 0 0
```

Or.

```q
q)(y _ x),y#0
4 5 6 7 8 9 10 11 12 0 0 0
```


## Add y to last item of x

```q
q)x:1 2 3 4 5
q)y:100
q)@[x;-1+count x;+;y]
1 2 3 4 105
```

Or.

```q
q)x:1 2 3 4 5
q)y:100
q)x[count[x]-1]+:y
q)x
1 2 3 4 105
```


## 449. Limiting x between l and h, inclusive

```q
q)x:(58 9 37 84 39 99;60 30 45 97 77 35;49 87 82 79 8 30;46 61 20 51 12 34;31 51 29 35 17 89)
q)l:30
q)h:70
q)l|h&x
58 30 37 70 39 70
60 30 45 70 70 35
49 70 70 70 30 30
46 61 30 51 30 34
31 51 30 35 30 70
```


## Arithmetic precision of system in decimals

```q
q)10 xlog 3
0.4771213
q)/ set maximum precision
q)\P 0
q)10 xlog 3
0.47712125471966244
q)string 10 xlog 3
"0.47712125471966244"
q)reverse[string 10 xlog 3]?"."
17
```


## Arithmetic progression from x to y with step g

```q
q)ap:{[x;y;g]x+g*til 1+ floor (y-x)%g}
q)ap[3;20;5]
3 8 13 18
q)ap[3;-20;-5]
3 -2 -7 -12 -17
```


## Select every y-th item of y

```q
q)show x:4+til 10
4 5 6 7 8 9 10 11 12 13
q)y:3
q)til count x
0 1 2 3 4 5 6 7 8 9
q)(1+tc x)mod 3
1 2 0 1 2 0 1 2 0 1
q)0=(1+tc x)mod 3
0010010010b
q)where 0=(1+tc x)mod 3
2 5 8
q)x where 0=(1+tc x)mod 3
6 9 12
```


## Remove y from x

```q
q)x:"abcdeabc"
q)y:"ad"
q)x where not x in y
"bcebc"
q)y:"a"
q)x where x<>y
"bcdebc"
q)y:"ae"
q)x except y
"bcdbc"
```


## Remove every y-th item of x

```q
q)x where 0<(1+tc x)mod 3
4 5 7 8 10 11 13
```


## Remove every second item

```q
q)x:"abcdefghijklmn"
q)x where(count x)#0 1
"bdfhjln"
q)x where 0=(1+tc x)mod 2
"bdfhjln"
```


## Replace items of x in y by 0

```q
q)show x:6?5
4 0 2 1 2 1
q)show y:5?7
2 3 2 5 4
q)y in x
10101b
q)@[y;where y in x;:;0]
0 3 0 5 0
```

Or.

```q
q)y*not y in x
0 3 0 5 0
```


### Replace items of x not in y by 0

```q
q)x:1 2 3 4 5
q)y:2 4
q)x in y
01010b
q)x*x in y
0 2 0 4 0
```


## Replace items of y flagged by x with g

```q
q)x:1 0 0 0 1 0 1 1 0 1
q)y:"abcdefghij"
q)g:" "
q)@[y;where x;:;g]
" bcd f  i "
```

Or in place:

```q
q)@[`y;where x;:;g]
`y
q)y
" bcd f  i "
q)y:"abcdefghij"
q)y[where x]:" "
q)y
" bcd f  i "
```


## Items of x divisible by y

```q
q)x:95 33 64 10 78 1 47 20 92 95
q)y:4
q)x mod y
3 1 0 2 2 1 3 0 0 3
q)0=x mod y
0010000110b
q)where 0=x mod y
2 7 8
q)x where 0=x mod y
64 20 92
```


## Right to left scan

```q
q)x:1 2 3 4 5
q)reverse sums reverse x
15 14 12 9 5
q)reverse(+\)reverse x
15 14 12 9 5
```

Generally,for any binary object y, `reverse(y\)reverse x`.


## Apply f over all of x

```q
q)show m:2 3 4#1+til 24
1 2  3  4   5 6  7  8   9 10 11 12
13 14 15 16 17 18 19 20 21 22 23 24
q)((+)over)over m
300
q)(+//)m
300
q)ao:{[f;x](f//)x}
q)ao[+;m]
300
q)ao[*;m*1.0]
6.204484e+23
q)ao[+;neg m]
-300
```


## Avoiding parentheses using reverse

```q
q)x:1 2 3 4 5
q)(count x),1
5 1
q)reverse 1,count x
5 1
```


## Zero items of y not in x

```q
q)y: 2 3 4 5 6 7 8 9 10 11
q)x:2 3 5 7 11
q)y in x
1101010001b
q)y*y in x
2 3 0 5 0 7 0 0 0 11
```


## Select from g based on index of x in y

```q
q)g:("William Shakespeare";"John Milton";"Jonathan Swift";"Jane Austen";"John Keats";"Charles Dickens")
q)y:1564 1608 1667 1775 1795 1812
q)x:1775
q)g[y?x]
"Jane Austen"
```


## Select x or y depending on g

```q
q)x:`hot`white`short`old
q)y:`cold`black`tall`young
q)g:1 0 0 1

q)x,'y
hot   cold
white black
short tall
old   young
q)tc[g],'g
0 1
1 0
2 0
3 1
q)(x,'y)./:tc[g],'g
`cold`white`short`young

q)?["b"$g;y;x]                  / vector conditional
`cold`white`short`young
q)g'[x;y]                       / Case
`cold`white`short`young
```


## Change y to one if x

```q
q)y:10 5 7 12 20.0
q)x:0 1 0 1 1
q)@[y;where x;:;1.]             /note that 1. --otherwise 'type as 9h=type y
10 1 7 1 1f

q)y xexp not x
10 1 7 1 1f
```

Or in place:

```q
q)@[`y;where x;:;1.]
`y
q)y
q)y:10 5 7 12 20.0
q)y[where x]:1.
q)y
10 1 7 1 1f
```


## Y where x is 0

```q
q)x:0 7 8 0 2
q)y:10 4 6 7 3
q)x+y*x=0
10 7 8 7 2

q)?[x=0;y;x]                    / vector conditional
10 7 8 7 2

q)(0+x=0)'[x;y]                 / Case
10 7 8 7 2
```


## Append y items g to each item of x

```q
q)x:1 3 5
q)y:2
q)g:10
q)raze x,\:y#g
1 10 10 3 10 10 5 10 10
```


## Prepend y items of g to each item of x

```q
q)x:1 3 5
q)y:2
q)g:10
q)y#g
10 10
q)(y#g),/:x
10 10 1
10 10 3
10 10 5
q)raze (y#g),/:x
10 10 1 10 10 3 10 10 5
```


## Insert y after each item of x

```q
q)x:"abc"
q)y:"d"
q)raze x,'y
"adbdcd"
```


## Vector and its negative

```q
q)x:1 -3 5
q)x,'neg x
1  -1
-3 3
5  -5

q)1 -1*/:x
1  -1
-3 3
5  -5
```


## Choosing from y according to sign of x

```q
q)y:"-0+"
q)signum -4.5 0 6.78
-1 0 1i
q)y 1+signum -4.5 0 6.78
"-0+"
```


## Conditional change of sign

```q
q)show y:1+til 6
1 2 3 4 5 6
q)x:0 1 0 1 1 0
q)y*1 -1 x
1 -2 3 -4 -5 6
```


## Zeroing an array

```q
q)show x:3 4#til 12
0 1 2  3
4 5 6  7
8 9 10 11
q)x*0
0 0 0 0
0 0 0 0
0 0 0 0
q)x[;]:0
q)x
0 0 0 0
0 0 0 0
0 0 0 0
```


## Retain value of items marked by y, zero others

```q
q)x:3 7 15 1 292
q)y:1 0 1 1 0
q)x*y
3 0 15 1 0
```


## Conditional change of sign

```q
q)x:5 -3 20 9 -10
q)y:1 0 1 0 1
q)@[x;where y;neg]
-5 -3 -20 9 10
q)
q)x*1 -1 y
-5 -3 -20 9 10
q)x*-1 xexp y
-5 -3 -20 9 10f
```


## Tree from depth;value

```q
q)tdv:{[d;v](1#v),(c _ d-1)tdv'(c:where 1=d)_ v}
```


## Depth from tree

```q
q)dt:{0,/1+dt'[1_ x]}
```


## Value from tree

```q
q)vt:{(1#x),/vt each 1_ x}
q)show t:tdv[d;v]
0
(1;,2;,3)
,4
,5
q)dt t
0 1 2 2 1 1
q)vt t
0 1 2 3 4 5
```

These three recursions stop when they run out of data.


## Streak of numbers with same sign

```q
q)n:2 3 4 -2 -7 1 4 2
q){1+(x;0)y}\[1;]differ signum n
1 2 3 1 2 1 2 3
```


## Permutations

```q
q)perm:{(1 0#x){raze(1 rotate)scan'x,'y}/x}
q)perm`a`b`c
a b c
b c a
c a b
b a c
a c b
c b a
q)
```
