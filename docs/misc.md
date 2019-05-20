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


## Pairwise difference

```q
q)x:9 3 5 2 0
q)deltas x
9 -6 2 -3 -2
q)1_ deltas x
-6 2 -3 -2
q)1_ neg deltas x
6 -2 3 2
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


