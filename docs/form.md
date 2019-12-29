# Format



```q
DEC:"0123456789"
```


## Cast to string 

### Formatted integers

```q
q)show x:5?100
14 13 9 74 55
q)10 vs x
1 1 0 7 5
4 3 9 4 5
q)flip DEC 10 vs x
"14"
"13"
"09"
"74"
"55"
q)string x
"14"
"13"
,"9"
"74"
"55"
```

<i class="far fa-hand-point-right"></i>
Reference: 
[`string`](/q/ref/string/), 
[`vs`](/q/ref/vs/)


### Count of format

```q
q)cf:{count string x}
q)cf 12.345
6
q)cf -1
2
q)cf 1e-12
5
q)string 1e-12
"1e-12"
```


### Leading zeros for positive integers in field width y

```q
q)y:3
q)show x:10?40
12 10 1 26 9 26 26 37 20 29
q)1_'string x+10 xexp y
"012"
"010"
"001"
"026"
"009"
"026"
"026"
"037"
"020"
"029"
```


## Precision

### Number of decimals

Limited by print precision: see Reference [`\P`](https:
//code.kx.com/q/basics/syscmds/##p-precision).

```q
q)x:1.4321 1.21 10
q)x mod 1
0.4321 0.21 0
q)count each 2_'string x mod 1
4 2 0
```


### Number of decimals, maximum y

```q
q)x:1.4321 1.21 10
q)y:3
q)x mod 1
0.4321 0.21 0
q)count each 2_'string x mod 1
4 2 0
q)y&count each 2_'string x mod 1
3 2 0
```


### Number of positions in non-negative integer

```q
q)x:0 13 523 16008
q)1+floor log10 x+0=x
1 2 3 5
```


### Number of positions in integer

```q
q)x:1234 -1234 0 7 12345678
q)1+(x<0)+floor 10 xlog abs x+0=x
4 5 1 1 8
```

Or.

```q
q)1+floor 10 xlog(x=0)+x*1 -10[x<0]
4 5 1 1 8
```


## Temporal 

### Time hh:mm:ss from integer hhmmss

```q
q)":" sv 0 2 4 _ string 121129
"12:11:29"
q)("::",string 121129)rank 11011011b
"12:11:29"
```


### Date yyyy/mm/dd from integer yyyymmdd

```q
q)"/"sv 0 4 6 _ string 20190507
"2019/05/07"
q)("//",string 20190507)rank 1111011011b
"2019/05/07"
```

Not quite the same as above:

```q
q)ssr[;".";"/"]string .z.D
"2019/05/07"
```



## Charts

### Indexing plotting characters with flags

```q
q)/ flag primes to x
q)p:{til[x]in a where not a in distinct raze a*/:\:a:2_ til x}
q)p 1200
00110101000101000101000100000101000001000101000100000100000101000001000101000..
q)where p 1200
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 10..
q)20 60#p 1200
001101010001010001010001000001010000010001010001000001000001b
010000010001010000010001000001000000010001010001010001000000b
000000010001000001010000000001010000010000010001000001000001b
010000000001010001010000000000010000000000010001010001000001b
010000000001000001000001000001010000010001010000000001000000b
000000010001010001000000000000010000010000000001010001000001b
000000010000010000010001000001000000010001000000010000000001b
010000000001010000010001000001000000010001010001000000000001b
000000010001000000010001000001000000000001010000000000000000b
010000010000000001000001000001010000010000000001000001000001b
010000010000010001010000000000010000000001010001000001000001b
010000000000010001000001000000010000000001000000010000000001b
000000010000010000010001000000010000010001000000010001000000b
000000010000000001000000000001010000000001010001010000000001b
000000000000010001010001000000000000010001010001000000000000b
000000010001000000010000000001000000010001000001000001000000b
000000010001000001000001000000010000010000000000010001000001b
010000000001010000010000000001010000000001010000010000000000b
000000010001010001000001000001000000010000010000010000000000b
000000000001010000000001000000010000000001000001000001000000b
q)" X" 20 60#p 1200  / distribution of primes to 1200
"  XX X X   X X   X X   X     X X     X   X X   X     X     X"
" X     X   X X     X   X     X       X   X X   X X   X      "
"       X   X     X X         X X     X     X   X     X     X"
" X         X X   X X           X           X   X X   X     X"
" X         X     X     X     X X     X   X X         X      "
"       X   X X   X             X     X         X X   X     X"
"       X     X     X   X     X       X   X       X         X"
" X         X X     X   X     X       X   X X   X           X"
"       X   X       X   X     X           X X                "
" X     X         X     X     X X     X         X     X     X"
" X     X     X   X X           X         X X   X     X     X"
" X           X   X     X       X         X       X         X"
"       X     X     X   X       X     X   X       X   X      "
"       X         X           X X         X X   X X         X"
"             X   X X   X             X   X X   X            "
"       X   X       X         X       X   X     X     X      "
"       X   X     X     X       X     X           X   X     X"
" X         X X     X         X X         X X     X          "
"       X   X X   X     X     X       X     X     X          "
"           X X         X       X         X     X     X      "
```


### Histogram

```q
q)v:8 3 11 9 9 4 6 6 3 3 9 7 9  / values
q)show x:1+til max v            / x-axis scale
1 2 3 4 5 6 7 8 9 10 11
q)show y:@[count[x]#0;v-1;+;1]  / y-axis values
0 0 3 1 0 2 1 1 4 0 1
q)" *"(1+til max y)<=/:y        / histogram
"    "
"    "
"*** "
"*   "
"    "
"**  "
"*   "
"*   "
"****"
"    "
"*   "
q)reverse flip " *"(1+til max y)<=/:y
"        *  "
"  *     *  "
"  *  *  *  "
"  ** **** *"
q)x!" *"(1+ til max y)<=/:y
1 | "    "
2 | "    "
3 | "*** "
4 | "*   "
5 | "    "
6 | "**  "
7 | "*   "
8 | "*   "
9 | "****"
10| "    "
11| "*   "
```


### Barchart of integer list 

```q
q)x:2 5 7 4 9 3 6
q)til[max x]
0 1 2 3 4 5 6 7 8
q)reverse til[max x]<\:x
0000100b
0000100b
0010100b
0010101b
0110101b
0111101b
0111111b
1111111b
1111111b
q)" X" reverse til[max x]<\:x
"    X  "
"    X  "
"  X X  "
"  X X X"
" XX X X"
" XXXX X"
" XXXXXX"
"XXXXXXX"
"XXXXXXX"
q)
q)xl:{(x#1),(y-x)#0}        / or {1 0 where(y-x),x}
q)"X " flip x xl\:max x
"    X  "
"    X  "
"  X X  "
"  X X X"
" XX X X"
" XXXX X"
" XXXXXX"
"XXXXXXX"
"XXXXXXX"
```


### Horizontal barchart of integers

Compare `bh` here with `xl` in #172.

```q
q)bh:{@[y#0;til x;:;1]}
q)" X" x bh\:max x
"XX        "
"XXXXXXXX  "
"XXXXX     "
"XXXXXX    "
"XXX       "
"X         "
"XXXXXXX   "
"XXXXXXX   "
"XXXXXXXXXX"
"XXXX      "
q)" X" x>/:\:til max x
"XX        "
"XXXXXXXX  "
"XXXXX     "
"XXXXXX    "
"XXX       "
"X         "
"XXXXXXX   "
"XXXXXXX   "
"XXXXXXXXXX"
"XXXX      "
```


### Horizontal barchart, normalized to length y

```q
q)x:2 8 5 6 3 1 7 7 10 4
q)y:5
q)floor x*y%max x
1 4 2 3 1 0 3 3 5 2
q)(floor x*y%max x)>\:til y
10000b
11110b
11000b
11100b
10000b
00000b
11100b
11100b
11111b
11000b
q)" X" (floor x*y%max x)>\:til y
"X    "
"XXXX "
"XX   "
"XXX  "
"X    "
"     "
"XXX  "
"XXX  "
"XXXXX"
"XX   "
```


