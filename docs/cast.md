# Casting




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


## Hexadecimal from decimal

```q
q)hex:"0123456789abcdef"
q)hd:{hex 16 vs/:x}
q)hd 10
,"a"
q)hd 20
"14"
q)hd 10 12 19 1 28 100
,"a"
,"c"
"13"
,"1"
"1c"
"64"
q)hd 10 12 19 1 28 300
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
q)hex:"0123456789abcdef"
q)x:" abcdef"
q)"i"$x
32 97 98 99 100 101 102
q)16 vs/: "i"$x
2 0
6 1
6 2
6 3
6 4
6 5
6 6
q)hex 16 vs/: "i"$x
"20"
"61"
"62"
"63"
"64"
"65"
"66"
q)" ",'hex 16 vs/: "i"$x
" 20"
" 61"
" 62"
" 63"
" 64"
" 65"
" 66"
q)raze " ",'hex 16 vs/: "i"$x
" 20 61 62 63 64 65 66"
q)x:"GOLDEN"
q)raze" ",'flip hex 16 vs "i"$x
"47 4f 4c 44 45 4e"
q)raze " ",'hex 16 vs/: "i"$x
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


## Represent x in radix 10 100 1000

```q
q)10 100 1000 vs 123456
1 23 456
q) 10 100 1000 vs 123456789
4 56 789
```

