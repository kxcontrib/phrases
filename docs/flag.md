# Flags


Flags are booleans or integers in the range \[0,1\]. 




## Count of 1s in boolean list

```q
q)x:1 0 0 1 0 1 1
q)sum x
4
```


## List of x zeros preceded by (y-x) ones

```q
q)x:5
q)y:9
q)((y-x)#1),x#0
1 1 1 1 0 0 0 0 0
q)1 0 where(y-x),x
1 1 1 1 0 0 0 0 0
```


## List of x ones preceded by (y-x) zeros

```q
q)x:3
q)y:9
q)xr:{((y-x)#0),x#1}
q)xr[x;y]
0 0 0 0 0 0 1 1 1
q)x:2 5 7 4 9 3 6
q)x xr\:y           / bar chart
0 0 0 0 0 0 0 1 1
0 0 0 0 1 1 1 1 1
0 0 1 1 1 1 1 1 1
0 0 0 0 0 1 1 1 1
1 1 1 1 1 1 1 1 1
0 0 0 0 0 0 1 1 1
0 0 0 1 1 1 1 1 1
q)1 0 where(y-x),x
1 1 1 1 1 1 0 0 0
q)@[y#1;til y-x;:;0]
```


## List of x zeros followed by (y-x) ones

```q
q)x:3
q)y:9
q)(x#0),(y-x)#1
0 0 0 1 1 1 1 1 1
q)zl:{(x#0),(y-x)#1}
q)zl[x;y]
0 0 0 1 1 1 1 1 1
q)0 1 where x,y-x
0 0 0 1 1 1 1 1 1
q)@[y#1;til x;:;0]
0 0 0 1 1 1 1 1 1
q)x:2 5 7 4 9 3 6
q)x zl\:y           / bar chart
0 0 1 1 1 1 1 1 1
0 0 0 0 0 1 1 1 1
0 0 0 0 0 0 0 1 1
0 0 0 0 1 1 1 1 1
0 0 0 0 0 0 0 0 0
0 0 0 1 1 1 1 1 1
0 0 0 0 0 0 1 1 1
```


## List of x ones followed by (y-x) zeros

```q
q)x:5
q)y:9
q)(x#1),(y-x)#0
1 1 1 1 1 0 0 0 0
q)xl:{(x#1),(y-x)#0}
q)xl[x;y]
1 1 1 1 1 0 0 0 0
q)1 0 where x,y-x
1 1 1 1 1 0 0 0 0
q)@[y#0;til x;:;1]
1 1 1 1 1 0 0 0 0
q)x:2 5 7 4 9 3 6
q)x xl\:y
1 1 0 0 0 0 0 0 0
1 1 1 1 1 0 0 0 0
1 1 1 1 1 1 1 0 0
1 1 1 1 0 0 0 0 0
1 1 1 1 1 1 1 1 1
1 1 1 0 0 0 0 0 0
1 1 1 1 1 1 0 0 0
```


## Interlace x[i]#1 and y[i]#0

```q
q)x:1 3
q)y:2 4
q)raze x,'y
1 2 3 4
q){count[x]#1 0}raze x,'y
1 0 1 0
q){x#'count[x]#1 0}raze x,'y
,1
0 0
1 1 1
0 0 0 0
q)raze{x#'count[x]#1 0}raze x,'y
1 0 0 1 1 1 0 0 0 0
```

Or.

```q
q)(raze/)flip(x;y)#''1 0
1 0 0 1 1 1 0 0 0 0
```


## X alternate takes of 1s and 0s

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


## First group of 1s

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


## Smearing 1s between pairs of 1s

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


## Invert 0s following first 1

```q
q)x:0 0 1 0 0 1 1
q)maxs x
0 0 1 1 1 1 1
```


## Invert fields marked by pairs of 1s

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


## Invert all 1s after first 0

```q
q)x:1 1 0 1 0 1 0
q)mins x
1 1 0 0 0 0 0
```


## Invert all 1s after first 1

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


## Invert all 0s after first 0

```q
q)x:1 0 0 1 1 0
q)a:x?0
q)a
1
q)til count x
0 1 2 3 4 5
q)b:(a+1)_tc x
q)b
2 3 4 5
q)@[x;b;:;1]
1 0 1 1 1 1
q)@[x;(1+x?0)_tc x;:;1]
1 0 1 1 1 1
```

Or.

```q
q)x or tc[x]<>x?x
1 0 1 1 1 1
```


## None

```q
q)x:7#0
q)not any x
1b
q)show x:7#0 1
0 1 0 1 0 1 0
q)not any x
0b
```


## Any

```q
q)any 1 0 1
1b
q)any 0 0 0
0b
```


## All

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


## Invert all but first 1 in group of 1s

```q
q)x:0 0 1 1 1 0 1 1 0 1
q)x>-1 _ 0,x
0010001001b
```


## Parity

```q
q)show x:2 vs til 8
0 0 0 0 1 1 1 1
0 0 1 1 0 0 1 1
0 1 0 1 0 1 0 1
q)(sum x)mod 2
0 1 1 0 1 0 0 1
```


## Running parity

```q
q)x:0 1 1 1 1 0 1 0 0
q)(sums x)mod 2
0 1 0 1 0 0 1 1 1
```


