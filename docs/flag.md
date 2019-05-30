# Flags


Flags are booleans or integers in the range \[0,1\]. 

Tests return flags. Working with flag vectors is a core q skill.




## Count of 1s

```q
q)x:1 0 0 1 0 1 1
q)sum x
4
```


## Zero all items

```q
q)x:0 1 0 1 1 0 0 1 1 1 0
q)0&x
0 0 0 0 0 0 0 0 0 0 0
```


## Construct

### Flags at y for vector x

```q
q)x:"abcdefghijklmn"
q)y:3 79
q)y:3 7 9
q)tc[x] in y
00010001010000b
```


### Vector length x with 1s at y

```q
q)x:10
q)y:1 3 7
q)til[x]in y
0101000100b
```

Or.

```q
q)@[x#0;y;:;1]
0 1 0 1 0 0 0 1 0 0
```


### Vector length y with 0s at x

```q
q)x:1 3 7
q)y:10
q)not til[y]in x
1010111011b

q)@[y#1;x;:;0]
1 0 1 0 1 1 1 0 1 1
```


### X 1s followed by (y-x) 0s

```q
q)x:5
q)y:9
q)(x#1),(y-x)#0
1 1 1 1 1 0 0 0 0

q)1 0 where x,y-x
1 1 1 1 1 0 0 0 0

q)@[y#0;til x;:;1]
1 1 1 1 1 0 0 0 0

q)x>til y
111110000b
```


### X 0s followed by (y-x) 1s

```q
q)x:3
q)y:9
q)(x#0),(y-x)#1
0 0 0 1 1 1 1 1 1

q)0 1 where x,y-x
0 0 0 1 1 1 1 1 1

q)@[y#1;til x;:;0]
0 0 0 1 1 1 1 1 1

q)x<=til y
000111111b
```


### X 1s preceded by (y-x) 0s

```q
q)x:3
q)y:9
q)(y-x)#0),x#1
0 0 0 0 0 0 1 1 1

q)0 1 where(y-x),x
0 0 0 0 0 0 1 1 1

q)@[y#1;til y-x;:;0]
0 0 0 0 0 0 1 1 1

q)(til y)>=y-x
000000111b
```


### X 0s preceded by (y-x) 1s

```q
q)x:5
q)y:9
q)((y-x)#1),x#0
1 1 1 1 0 0 0 0 0

q)1 0 where(y-x),x
1 1 1 1 0 0 0 0 0

q)(til y)<y-x
111111000b
```


### Interlace x[i] 1s and y[i] 0s

```q
q)x:1 3
q)y:2 4
q)raze x,'y
1 2 3 4
q){count[x]#1 0}raze x,'y
1 0 1 0
q){(count[x]#1 0)where x}raze x,'y
1 0 0 1 1 1 0 0 0 0
```

Or.

```q
q)raze over flip(x;y)#''1 0
1 0 0 1 1 1 0 0 0 0
```


### X alternate takes of 1s and 0s

```q
q)x:1 2 3 4 5
q)(count x)#1 0
1 0 1 0 1
q)x#'(count x)#1 0
,1
0 0
1 1 1
0 0 0 0
1 1 1 1 1
q)raze x#'(count x)#1 0
1 0 0 1 1 1 0 0 0 0 1 1 1 1 1
```

Or.

```q
q)(count[x]#1 0)where x
1 0 0 1 1 1 0 0 0 0 1 1 1 1 1
```


### Flags for positive integers in x

```q
q)x:2 3 3 -2 4 4 -1
q)x in til 1+max x
00111b
```



## Find 

### First 1 in x

```q
q)x:0 0 1 0 1 0 0 1 1 0
q)x?1
2

q)first where x
2
```


### First 1 in x after position y

```q
q)x:1 0 0 1 1 0 1 1 0
q)y:3
q)a+first where (a:y+1) _ x
4
q)first a where y<a:where x
4

q)1+y+(y _ x)?1
4
```


### Yth 1 in x

```q
q)x:1 0 0 1 1 0 1 1 0
q)y:3
q)sums[x]?y
4
```


## Select

### First group of 1s

```q
q){x and (and)scan x=(or)scan x}0 0 0 1 1 0 1
0 0 0 1 1 0 0
q){x and (and)scan x=(or)scan x}0 0 0 1 1 0 1
0 0 0 1 1 0 0
q){x and (and)scan x=(or)scan x}1 1 1 0 1 0 1
1 1 1 0 0 0 0
q){x and (and)scan x=(or)scan x}0 1 0 1 0 1 0
0 1 0 0 0 0 0
q){x&(&\)x=(|\)x}0 1 0 1 0 1 0
0 1 0 0 0 0 0
```


### First 1s in groups of 1s

```q
q)x:0 1 1 0 1 1 1 0 0 1
q)(>)prior x
1100100001b
q)(x;(>)prior x)
0 1 1 0 1 1 1 0 0 1
1 1 0 0 1 0 0 0 0 1
q)(x;1_(>)prior 0,x)
0 1 1 0 1 1 1 0 0 1
0 1 0 0 1 0 0 0 0 1
q)1_(>)prior 0,x
0100100001b
```


### Last 1s in groups of 1s

```q
q)x:0 1 1 0 1 1 1 0 0 1
q)x>1 _ x,0
0010001001b
q)1_(<)prior x,0
0010001001b
```


### Select items of x according to flags in y

```q
q)show x:2 3 4#1+til 24
1 2  3  4   5 6  7  8   9 10 11 12
13 14 15 16 17 18 19 20 21 22 23 24
q)y:1 0 0 1
q)x[;;where y]
1 4   5 8   9 12
13 16 17 20 21 24
```



## Amend

### Invert 0s after first 1

```q
q)x:0 0 1 0 0 1 1
q)maxs x
0 0 1 1 1 1 1
```


### Invert 1s after first 1

```q
q)x:0 0 1 1 0 1
q)(count x)#x
0 0 1 1 0 1
q)(count x)#0
0 0 0 0 0 0
q)x?1
2
q)@[(count x)#0;x?1;:;1]
0 0 1 0 0 0
```

Or.

```q
q)(tc x)=x?1
001000b
```


### Invert 0s after first 0

```q
q)x:1 0 0 1 1 0
q)@[x|1;x?0;:;0]
1 0 1 1 1 1
```

Or.

```q
q)tc[x]<>x?0
101111b
```


### Invert 1s after first 0

```q
q)x:1 1 0 1 0 1 0
q)mins x
1 1 0 0 0 0 0
```


### Smearing 1s between pairs of 1s

```q
q)x:0 1 0 0 1 0 1 0 1 0 1 1 0
q)a:(sums x)mod 2
q)a
0 1 1 1 0 0 1 1 0 0 1 0 0
q)x or a
0 1 1 1 1 0 1 1 1 0 1 1 0
q)x|a
0 1 1 1 1 0 1 1 1 0 1 1 0
q)x or (sums x) mod 2
0 1 1 1 1 0 1 1 1 0 1 1 0
```

Or.

```q
q)(x;x or(<>)scan x)
0100101010110b
0111101110110b
q)x|(<>\)x
0111101110110b
```


### Invert fields marked by pairs of 1s

```q
q)x:1 0 1 0 0 1 0 0 1
q)a:(sums x)mod 2
q)a
1 1 0 0 0 1 1 1 0
q)not x
010110110b
q)(not x)&a
0 1 0 0 0 0 1 1 0
q)(not x)&(sums x)mod 2
0 1 0 0 0 0 1 1 0
```


### Invert all but first 1 in group of 1s

```q
q)x:0 0 1 1 1 0 1 1 0 1
q)x>-1 _ 0,x
0010001001b
```


### Insert 0 in list of 1s x after indexes y

```q
q)x:1 1 1 1 1 1 1 1 1 1
q)y:1 3 7
q)@[x,\:();y;,;0]
,1
1 0
,1
1 0
,1
,1
,1
1 0
,1
,1
q)raze@[x,\:();y;,;0]
1 1 0 1 1 0 1 1 1 1 0 1 1
```

Using `x` as the first argument of `@` signals a type error: `x` is a vector and its items cannot be amended to lists. 
Joining each item to the empty list `x,\:()` replaces each atom with a 1-list.

```q
q)(enlist each x)~x,\:()
1b
```


## Parity

### Simple parity

```q
q)show x:2 vs til 8
0 0 0 0 1 1 1 1
0 0 1 1 0 0 1 1
0 1 0 1 0 1 0 1
q)(sum x)mod 2
0 1 1 0 1 0 0 1
```


### Running parity

```q
q)x:0 1 1 1 1 0 1 0 0
q)(sums x)mod 2
0 1 0 1 0 0 1 1 1
```


## Logic

### X implies y

```q
q)x:0 1  0 1
q)y:0 0 1 1
q)x<=y
1011b
```


### X but not y

```q
q)x:0 1  0 1
q)y:0 0 1 1
q)x>y
0100b
```


### Exclusive or

```q
q)x:0 0 1 1
q)y:0 1 0 1
q)x<>y
0110b
```


### Kronecker delta of x and y

```q
q)x:0 0 1 1
q)y:0 1 0 1
q)x=y
1001b
```




## Aggregates

### None

```q
q)x:7#0
q)not any x
1b
q)show x:7#0 1
0 1 0 1 0 1 0
q)not any x
0b
```


### Any

```q
q)any 1 0 1
1b
q)any 0 0 0
0b
```


### All

```q
q)x:1 1 0 1
q)min x
0
q)all x
0
q)x:1 1 1 1
q)min x
1
q)all x
1
q)x:0 0 0 0
q)min x
0
a)all x
0
```


