# Miscellaneous


## Formatted integers

```q
q)show x:5?100
14 13 9 74 55
q)10 vs x
1 1 0 7 5
4 3 9 4 5
q)flip "0123456789" 10 vs x
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



## 47. Polynomial with roots x

```q
q)x:1 -6 8
q){(x,0)-y*0,x} over 1,x
1 -3 -46 48

q)x:2 4
q){(x,0)-y*0,x} over 1,x
1 -6 8

q)x:1 2
q){(x,0)-y*0,x} over 1,x
1 -3 2

q)x:1 2 3
q){(x,0)-y*0,x} over 1,x
1 -6 11 -6
```


## 48. Saddle-point indices

```q
q)x
4 2 4 4 2 4
5 3 5 5 3 5
4 2 4 4 2 4
1 2 4 4 2 4
5 3 5 5 3 5
4 2 4 4 2 4
```


### 48a. Flag row minimums

```q
q)rn:{x=min each x}
q)rn x
010010b 
010010b
010010b
100000b
010010b
010010b
```


### 48b. Flag column maximums

```q
q)cx:{x=\:max x}
q)cx x
000000b
111111b
000000b
000000b
111111b
000000b
```


### 48c. Flag minmax of rows and columns

```q
q)minmax:{(rn x)&cx x}
q)minmax x
000000b
010010b
000000b
000000b
010010b
000000b
```


### 48d. Find flags in ravel of Boolean matrix

```q
q)ones:{where raze minmax x}
q)ones x
7 10 25 28
```


### 48e. Row-column indices 

Where `y` are indices into the ravel of matrix `x`, returns the `x` row-column indices of `y`.

```q
q)rc:{(div;mod).\:(y;count first x)}
```

Find saddle-point indices.

```q
q)sp:{rc[x;ones x]} 
q)sp x
1 1 4 4
1 4 1 4
```


## 50. Connectivity list from connectivity matrix

```q
q)show m:(1 0 1;1 0 1)
1 0 1
1 0 1
q)raze m
1 0 1 1 0 1
q)where raze m
0 2 3 5
q)rc[m;] where raze m
0 0 1 1
0 2 0 2
q)lm:{rc[x;]where raze x}
q)lm m
0 0 1 1
0 2 0 2
```


## All pairs of `til[x]` and `til[y]`

```q
q)x:3
q)y:4
q)(x,y) vs til x*y
0 0 0 0 1 1 1 1 2 2 2 2
0 1 2 3 0 1 2 3 0 1 2 3
q)flip til[x] cross til y
0 0 0 0 1 1 1 1 2 2 2 2
0 1 2 3 0 1 2 3 0 1 2 3
```



## Indices of an array

The [_depth_](/v2/basics/glossary.md#depth) of a list is the number of nesting levels at which it is rectangular. 
Its _shape_ is a vector of its count at each level at which it is rectangular, and corresponds to the left argument of [Take](/v2/ref/take/).

```q
q)depth:{$[type[x]<0; 0; "j"$sum(and)scan{1=count distinct count each x}each(raze\)x]}
q)shape:{$[0=d:depth x; 0#0j; d#{first(raze/)x}each(d{each[x;]}\count)@\:x]}
q)ix:('[{x vs til prd x};shape])
q)ix til 6
0 1 2 3 4 5
q)ix 2 3#til 6
0 0 0 1 1 1
0 1 2 0 1 2
q)ix 2 3 2#til 12
0 0 0 0 0 0 1 1 1 1 1 1
0 0 1 1 2 2 0 0 1 1 2 2
0 1 0 1 0 1 0 1 0 1 0 1
```


## Find items of y in array x

```q
q)show x:2 3#6?10
5 1 2
2 0 3
q)show y:4 5#20?10
2 2 1 7 3
1 4 0 6 4
6 7 6 3 8
4 8 0 1 0
q)shape[x] vs where raze[y]in raze x
0 0 0 1 1 0 0 1 0 0
0 1 2 1 2 1 1 2 0 1
```




## Truth table of order x

```q
q)tt:{2 vs til "j"$2 xexp x}
q)tt 1
0 1
q)tt 2
0 0 1 1
0 1 0 1
q)tt 3
0 0 0 0 1 1 1 1
0 0 1 1 0 0 1 1
0 1 0 1 0 1 0 1
```


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


## Integer and fractional parts of positive x

```q
q)x:12.3 23.4 5.33 8.999
q){f,'x-f:floor x}x
12 0.3
23 0.4
5  0.33
8  0.999
```


