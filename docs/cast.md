# Casting





```q
DEC:"0123456789"
HEX:"0123456789abcdef"
```


## Binary representation of a positive integer

```q
q)2 vs 20
1 0 1 0 0
q)0b vs 20
0000000000000000000000000000000000000000000000000000000000010100b
q)0x0 vs 20
0x0000000000000014
q)0x0 vs 20h
0x0014
q)0b vs 20h
0000000000010100b
q)2 vs 20h
1 0 1 0 0
q)(2;0b;0x0) vs/:\: (20h;20i;20j)
1 0 1 0 0         1 0 1 0 0                         1 0 1 0 0                ..
0000000000010100b 00000000000000000000000000010100b 0000000000000000000000000..
0x0014            0x00000014                        0x0000000000000014       ..
```


## Formatted integers

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
[`string`](/v2/ref/string), 
[`vs`](/v2/ref/vs)



## Hexadecimal from decimal

```q
q)HEX 16 vs 10
,"a"
q)HEX 16 vs 20
"14"
q)HEX 16 vs 10 12 19 1 28 100
"001016"
"ac31c4"
q)flip HEX 16 vs 10 12 19 1 28 100
"0a"
"0c"
"13"
"01"
"1c"
"64"
q){HEX 16 vs x}each 10 12 19 1 28 300
,"a"
,"c"
"13"
,"1"
"1c"
"12c"
```


## Decimal digits from integer

```q
q)10 vs 2001
2 0 0 1
q)10 vs 123456789
1 2 3 4 5 6 7 8 9
```

```q
/not quite the same
q){("i"$string x)-48} 2001  /C. Skelton
2 0 0 1
q){("i"$string x)-48} 1234567890
1 2 3 4 5 6 7 8 9 0
```


## Represent y in base x

```q
q)16 vs 256
1 0 0
q)2 vs 36
1 0 0 1 0 0
q)10 vs 123
1 2 3
```

```q
q)0x0 vs 256
0x00000100
q)0b vs 36
00000000000000000000000000100100b
q)0b vs 36h
0000000000100100b
```


## Hexadecimal from decimal characters

```q
q)"i"$" abcdef"
32 97 98 99 100 101 102i
q)16 vs"i"$" abcdef"
2 6 6 6 6 6 6
0 1 2 3 4 5 6
q)HEX 16 vs"i"$" abcdef"
"2666666"
"0123456"
q)flip HEX 16 vs"i"$" abcdef"
"20"
"61"
"62"
"63"
"64"
"65"
"66"
q)raze" ",'flip HEX 16 vs"i"$"GOLDEN"
" 47 4f 4c 44 45 4e"
```


## Vector from date

```q
q)100000 100 100 vs 19980522
1998 5 22
```

```q
/not quite the same as above
q)dt:gtime .z.Z
q)(dt.year;dt.mm;dt.dd)
2007 7 21
```


## Character time hh:mm:ss from integer hhmmss

```q
q)":" sv 0 2 4 _ string 121129
"12:11:29"
q)("::",string 121129)rank 11011011b
"12:11:29"
```


## Character date yyyy/mm/dd from integer yyyymmdd

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


## Represent x in radix 10 100 1000

```q
q)10 100 1000 vs 123456
1 23 456
q) 10 100 1000 vs 123456789
4 56 789
```


## Encode date as integer

```q
q)string .z.d
"2019.05.08"
q)"I"$string[.z.d]except"."
20190508i
```


## Decimal from hexadecimal

```q
q)x:("ff";"a9";"8ac";"ffff")
q)x
("ff"
"a9"
"8ac"
"ffff")
q)"0123456789abcdef"?/:"ff"
15 15
q)"0123456789abcdef"?/:/:x
15 15
10 9
8 10 12
15 15 15 15
q)16 sv/: "0123456789abcdef"?/:/:x
255 169 2220 65535
```

```q
/not quite the same
q)16 sv'hex?/:x
255 169 2220 65535
```


## Number from alphanumeric

```q
q)x:"1998 51"
q)parse x
1998 51
q)3+parse x
2001 54
```


## Scalar from boolean vector

```q
q)2 sv 1 0 0 1 1 1 0 1
157
```


## Numbers from alphanumeric matrix

```q
q)show x:4 3#" 1 12 0.5"
" 1 "
"12 "
"0.5"
" 1 "
q)x=" "
110b
100b
111b
000b
q)min each x=" "
0010b
q)
q)where min each x=" "
,2
q)z:.:'x
''
q)z:parse x
'type
q)z:parse each x
q)z
1
12
::
0.5
q)@[z;,2;:;0]
',
q)@[z;enlist 2;:;0]
1
12
0
0.5
q)@[parse each x;where min each x=" ";:;0]
1
12
0
0.5
```

But there may be no all-blank rows

```q
q)show y:4 3#"  1 123450.5"
"  1"
" 12"
"345"
"0.5"
q)@[parse each y;where min each y=" ";:;0]
1
12
345
0.5
q)na:{@[parse each x;where min each x=" ";:;0]}
q)na y
1
12
345
0.5
```


## Number from alphanumeric x, default y

```q
q)x:""
q)y:"-1"
   .((x~"")#"y"),x
"-1"
q)x:"234.5"
   .((x~"")#"y"),x
234.5
```

```q
q)na:{[x;y]$[x~"";parse y;parse x]}
q)na["";"-1"]
-1
q)na["123";"-1"]
123
```


## Numeric from proper alphanumeric non-negative integer

```q
q)x:"123 438"
q)eval parse each  " "vs x
123 438
```


## Numeric vector from evaluating rows of character matrix

```q
q)show x:2 5#"1+2 41+3 6"
"1+2 4"
"1+3 6"
q)parse each x
+ 1 2 4
+ 1 3 6
q)('[eval;parse])each x
3 5
4 7
q)raze('[eval;parse])each x
3 5 4 7
```

