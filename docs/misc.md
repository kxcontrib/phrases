# Miscellaneous




```q
tc:('[til;count])     / {til count x}
```

## Amend

### Zero items of x not flagged by y

```q
q)x:3 7 15 1 292
q)y:1 0 1 1 0
q)@[x;where not y;:;0]
3 0 15 1 0
q)@[`x;where not y;:;0]
`x
q)x
3 0 15 1 0
```

Using indexes is efficient, especially where amending in place a table column on disk.

In less demanding contexts, we remember truth values are expressed as flags.

```q
q)x*y
3 0 15 1 0
```


### Zero items of x in y

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


### Zero items of x not in y

```q
q)x: 2 3 4 5 6 7 8 9 10 11
q)y:2 3 5 7 11
q)x in y
1101010001b
q)x*x in y
2 3 0 5 0 7 0 0 0 11
```


### Replace items of y flagged by x with 1

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


### Replace items of y flagged by x with g

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


### Replace items of x with value y[0] with y[1]

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


### Replace first item of x with y

```q
q)x:"abbccdefcdab"
q)y:"t"
q)@[x;0;:;y]
"tbbccdefcdab"
```

Or.

```q
q)y,1_ x
"tbbccdefcdab"
```

Or in place.

```q
q)@[`x;0;:;y]
`x
q)x
"tbbccdefcdab"
q)x:"abbccdefcdab"
q)x[0]:y
q)x
"tbbccdefcdab"
```


### Replace last item of x with y

```q
q)x:"abbccdefcdab"
q)y:"t"
q)@[x;-1+count x;:;y]
"abbccdefcdat"
```

Or.

```q
q)(-1_ x),y
"abbccdefcdat"
```

Or in place.

```q
q)@[`x;count[x]-1;:;y]
`x
q)x
"abbccdefcdat"
q)x:"abbccdefcdab"
q)x[count[x]-1]:y
q)x
"abbccdefcdat"
```


### Limiting x between l and h, inclusive

```q
q)show x:5 6#30?100
12 10 1  90 73 90
43 90 84 63 93 54
38 97 88 58 68 45
2  39 64 49 82 40
88 77 30 17 23 12
q)l:30
q)h:70
q)l|h&x
30 30 30 70 70 70
43 70 70 63 70 54
38 70 70 58 68 45
30 39 64 49 70 40
70 70 30 30 30 30
```


### Change sign of y where x is 1

```q
q)show y:1+til 6
1 2 3 4 5 6
q)x:0 1 0 1 1 0
q)y*1 -1 x
1 -2 3 -4 -5 6
```



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

<i class="far fa-hand-point-right"></i>
Reference: [Over](https://code.kx.com/q/ref/accumulators/)


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

<i class="far fa-hand-point-right"></i>
Reference: [`\P`](https://code.kx.com/q/basics/syscmds/#p-precision)


## Avoid parentheses using reverse

```q
q)x:1 2 3 4 5
q)(count x),1
5 1
q)reverse 1,count x
5 1
```


## Count 

### Count occurrences of x in y

```q
q)show y:3+7?6
6 4 7 7 6 6 4
q)x:7
q)sum x=y
2

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



### Count of x between endpoints (l,h)

```q
q)x:66 8 6 4 86 82 91 52 53 89 43 0 62 3 17 0 26 80 2 12 37 41 41 72 10
q)l:10
q)h:80
q)sum(x>=l)&x<=h                    / inclusive range
14i
q)sum(x>l)&x<h                      / exclusive range
12i
```

The inclusivity of the range is determined by the operators used. 
It can be controlled by data instead.

```q
q)r:l,h                             / range
q)sum(<)over x</:r+0 1              / inclusive
14i
q)sum(<)over x</:r+1 0              / exclusive
12i
```

For a matrix, first raze.

```q
q)show y:5 5#x
66 8  6  4  86
82 91 52 53 89
43 0  62 3  17
0  26 80 2  12
37 41 41 72 10
q)sum(<)over raze[y]</:r+0 1        / inclusive
14i
q)sum(<)over raze[y]</:r+1 0        / exclusive 
12i
```

For higher-rank arrays, raze more.

```q
q)show z:5 2 5#x
66 8  6  4  86 82 91 52 53 89
43 0  62 3 17  0  26 80 2 12
37 41 41 72 10 66 8  6  4  86
82 91 52 53 89 43 0  62 3  17
0  26 80 2  12 37 41 41 72 10
q)sum(<)over raze/[z]</:r+0 1
28i
q)sum(<)over raze/[z]</:r+1 0
24i
```

<i class="far fa-hand-point-right"></i>
Reference: [Over](https://code.kx.com/q/ref/accumulators/)


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


## Insert

### Insert x in y after index g

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


### Insert row x in matrix y after row g

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


## Random

### Y items selected with replacement from til x

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



### Y objects selected without replacement from til x

Deal.

```q
q)-6?8
5 7 3 2 0 4
```



### Y-shaped array of numbers from x[0] to x[1]-1

```q
q)x:4 9
q)y:3 4
q)y#first[x]+prd[y]?(-). reverse x
4 6 8 8
5 8 7 7
4 6 5 8
```



### Randomize the random seed

```q
q)\S
-314159
q)\S -1154371779
q)\S
-1154371779
```

<i class="far fa-hand-point-right"></i>
Reference: [`\S`](https://code.kx.com/q/basics/syscmds/#s-random-seed)


## Remove 

### Remove y from x

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


### Remove every y-th item of x

```q
q)x where 0<(1+tc x)mod 3
4 5 7 8 10 11 13
```


### Remove every second item

```q
q)x:"abcdefghijklmn"
q)x where(count x)#0 1
"bdfhjln"
q)x where 0=(1+tc x)mod 2
"bdfhjln"
```


### Remove leading, multiple and trailing ys from x

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


### Range; nub; remove duplicates

```q
q)x:"wirlsisl"
q)distinct x
"wirls"
q)distinct (1 2 3;4 5;1 2 3;4 5;1 2 3)
1 2 3
4 5
```




## Right to left scan

```q
q)x:1 2 3 4 5
q)reverse sums reverse x
15 14 12 9 5
q)reverse(+\)reverse x
15 14 12 9 5
```

Generally, for any binary object y, `reverse(y\)reverse x`.


## Select

### Y where x is 0

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


### Select from y according to sign of x

```q
q)y:"-0+"
q)signum -4.5 0 6.78
-1 0 1i
q)y 1+signum -4.5 0 6.78
"-0+"
```


### Select every y-th item of y

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


### Items of x divisible by y

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


### Select from g based on index of x in y

```q
q)g
"William Shakespeare"
"John Milton"
"Jonathan Swift"
"Jane Austen"
"John Keats"
"Charles Dickens"
q)y:1564 1608 1667 1775 1795 1812
q)x:1775
q)g[y?x]
"Jane Austen"
```


### Select x or y depending on g

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


### Selection by encoded list

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



## Shift

### Drop first, suffix 0

```q
q)x:3 4 5 6
q)1_ x,0
4 5 6 0
```


### Drop last, prefix 0

```q
q)x:3 4 5 6
q)-1 _ 0,x
0 3 4 5
```


### Shift x right y, fill 0

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


### Shift x left y, fill 0

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


### Rotate rows left

```q
q)x:3 4#1+til 12
q)1 rotate 'x
2  3  4  1
6  7  8  5
10 11 12 9
```

### Rotate rows right

```q
q)x:3 4#1+til 12
q)-1 rotate 'x
4  1 2  3
8  5 6  7
12 9 10 11
```


## Streak of numbers with same sign

```q
q)n:2 3 4 -2 -7 1 4 2
q){1+(x;0)y}\[1;]differ signum n
1 2 3 1 2 1 2 3
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



