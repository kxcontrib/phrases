# Mathematics


## Polynomial with roots x

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


## Saddle-point indices

```q
q)x
4 2 4 4 2 4
5 3 5 5 3 5
4 2 4 4 2 4
1 2 4 4 2 4
5 3 5 5 3 5
4 2 4 4 2 4
```


### Flag row minimums

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


### Flag column maximums

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


### Flag minmax of rows and columns

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


### Find flags in ravel of Boolean matrix

```q
q)ones:{where raze minmax x}
q)ones x
7 10 25 28
```


### Row-column indices 

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


## Value of saddle point

```q
q)show x:(5 4 6 4 12 5;16 2 4 5 16 18;8 18 7 12 16 11;20 17 16 14 16 20;16 8 12 9 17 13)
5  4  6  4  12 5
16 2  4  5  16 18
8  18 7  12 16 11
20 17 16 14 16 20
16 8  12 9  17 13
q)rn:{x=min each x}
q)cx:{x=\:max x}
q)minmax:{(rn x)&cx x}
q)minmax x
000000b
000000b
000000b
000100b
000000b
q)where raze minmax x
,21
q)raze[x]where raze minmax x


q)x:(5 4 6 4 12 5;16 2 4 5 16 18;8 18 7 12 16 11;20 17 16 14 16 20;16 8 12 9 17 13)
q)rn:{x=' min each x}
q)cx:{x=\:max x}
q)minmax:{(rn x)&(cx x)}
q)minmax x
(000000b;000000b;000000b;000100b;000000b)
q)ones:{where raze minmax x}
q)ones x
,21
q)(raze x)[ones[x]]
,14
```


## Connectivity list from connectivity matrix

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


## Connectivity matrix from connectivity list

<!-- FIXME: complete -->

```q
q)y:(0 1;0 2;1 0;1 2;2 2)
q)x:3
q)x sv/:y
1 2 3 5 8
q)(til 9)in x sv/:y
011101001b
```


## Node matrix from connection matrix

(Inverse to 157.)

```q
q)x
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
```

Each column in `x` represents a path between 2 nodes:

-   From node 0 to node 2
-   From node 0 to node 1
-   From node 2 to node 3
-   From node 1 to node 2
-   From node 1 to node 3

```q
q)show a:1 -1=\:x
11000b 00011b 00100b 00000b
00000b 01000b 10010b 00101b
q)mul:{(mmu\:) . "f"$(flip each x;y)}
q)show b:mul[a;til count x]
0 0 2 1 1
2 1 3 2 3
q)nc:{mul[1 -1=\:x;til count x]}
q)nc x
0 0 2 1 1
2 1 3 2 3
```


## Connection matrix from node matrix

(Inverse to 148)

Node matrix top and bottom rows give from and to nodes.

```q
q)show x:(0 0 2 1 1;2 1 3 2 3)
0 0 2 1 1
2 1 3 2 3
q)/ Enumerate count of range
q)key count distinct raze x
0 1 2 3
q)/ Where is x equal to each of it
q)x=/:til count distinct raze x
11000b 00000b
00011b 01000b
00100b 10010b
00000b 00101b
q)/ Subtract "to" matrix from "from" matrix
q)(-/)each x=/:til count distinct raze x
1  1  0  0  0
0  -1 0  1  1
-1 0  1  -1 0
0  0  -1 0  -1
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


## Integer and fractional parts of positive x

```q
q)x:12.3 23.4 5.33 8.999
q){f,'x-f:floor x}x
12 0.3
23 0.4
5  0.33
8  0.999
```


## Extrapolated value of abscissa x and ordinate y at g

```q
q)tc:('[til;count])
q)x:-1 0 1
q)y:1 0 1f                  / squares of x
q)reverse tc x
2 1 0
q)x xexp/: reverse tc x
1  0 1
-1 0 1
1  1 1
q)(enlist y) lsq x xexp/: reverse tc x
1 0 4.440892e-16
q)10 sv raze(enlist y) lsq x xexp/: reverse tc x
100f
q)5 sv raze(enlist y) lsq x xexp/: reverse tc x
25f
```


## Value of ascending polynomial coefficients y at points x

```q
q)x:-1 0 2
q)y: 4 0 5 1
q)x sv\:y
-8 1 43
```


## Predicted values of exponential fit

```q
q)x:64 70 77 82 92
q)y:56 60 66 70 78
q)show a:x xexp/:0 1
1  1  1  1  1
64 70 77 82 92
q)log y
4.025352 4.094345 4.189655 4.248495 4.356709
q)lsq[enlist log y;a]
3.261029 0.01197249
q)exp flip[a] mmu first (enlist log y)lsq a
56.10745 60.28622 65.55641 69.60062 78.45289
```


## Predicted values of best linear fit (least squares)

```q
q)x:64 70 77 82 92 107 125 143 165 189f
q)y:56 60 66 70 78  88 102 118 136 155f
q)a:x xexp/:0 1
q)(flip a) mmu first enlist[y] lsq a
55.32371 60.08021 65.62945 69.59319 77.52068 89.41191 103.6814 117.9509 135.3913 154.4173
```


## G-degree polynomial fit of points (x,y)

```q
q)g:3
q)x:64 70 77 82 92 107 125 143 165 189
q)show y:(5*x xexp 3)+(-1*x xexp 2)+(4*x)+182
1307062 1710562 2277226 2750626 3885526 6114376 9750682 1.460134e+07 2.243424..
q)reverse first enlist[y] lsq x xexp/:til g+1
5 -1 4 182f
```


## Coefficients of exponential fit of points (x,y)

```q
q)x:64 70 77 82 92 107 125 143 165 189
q)y:56 60 66 70 78 88 102 118 136 155
q)a:lsq[enlist log y;x xexp/:0 1]
q)a
3.563398 0.00817742
q)a[0]:exp[a[0]]
q)a
35.2829 0.00817742
q)a[0]*exp[x*a[1]]
59.54624 62.54071 66.22511 68.98898 74.86758 84.63791 98.05964 113.6098 136.0..
q)y
56 60 66 70 78 88 102 118 136 155
```

==FIXME==


## Coefficients of best linear fit of points (x,y) (least squares)

```q
q)x:64 70 77 82 92 107 125 143 165 189f
q)y:56 60 66 70 78  88 102 118 136 155f
q)lsq[enlist y;x xexp/:0 1]
4.587803 0.7927486
```



## Number of permutations of n objects taken k at a time

```q
q)fac:{prd 1+til x}
q)pn:{[n;k] fac[n]%fac[n-k]}
q)pn[5;3]
60f
```

Refactoring…

```q
q)n:5
q)k:3
q)fac[n]%fac[n-k]
60f
q)(prd 1+til k)%prd 1+til n-k
60f
q)prd 1+(n-k)_til n             / no floating-point op
60
q)prd(n-k-1)+til k              / reduce length of vector
60
```


## Pascal’s triangle

```q
q)pt:{0+':x,0}
q)4 pt\ 1
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
```


## Taylor series 

With coefficients y at point x.

```q
q)x:3
q)y:1 1 1
q)a:til count y
q)sum y*(x xexp a)%fac each a
8.5
q)sum y*(x xexp a)%prds 1|a     / refactor factorials
q)y:30#1
q)x:1
q)a:til count y
q)sum y*(x xexp a)%prds 1|a
2.718282
```


## Value of Taylor series with coefficients y at x

```q
q)x:12
q)y:7 5 6 6
q)1+til -1+count y
1 2 3
q)1+til -1+count y
1 2 3
q)1.0,x%1+til -1 +count y
1 12 6 4f
q)prds 1.0,x%1+til -1 +count y
1 12 72 288f
q)y*prds 1.0,x%1+til -1 +count y
7 60 432 1728f
q)sum y*prds 1.0,x%1+til(count y)-1
2227f
```


## Beta function

See gamma in appendix.

`Beta:{((gamma x)*gamma y)%gamma[x+y]}`

==DROP – WTF?==


## Number of combinations of n objects taken k at a time

```q
q)binn:{[n;k]fac[n]%fac[n-k]*fac[k]}
q)binn[12;7]
792f
q)binn[10;4]
210f
```


## Sum items of x given by y

```q
q)show x:log 1+til 5
0 0.6931472 1.098612 1.386294 1.609438
q)y:1 4 1 4 1
q)show a:value group y
0 2 4
1 3
q)sum each x[a]
2.70805 2.079442
q)sum x[0 2 4]
2.70805
q)sum x[1 3]
2.079442
q)sum each x value group y
2.70805 2.079442
```


## Greatest common divisor

```q
q)x:6 9 12
q)1+til min x
1 2 3 4 5 6
q)x mod/:1+til min x
0 0 0
0 1 0
0 0 0
2 1 0
1 4 2
0 3 0
q)0=x mod/:1+til min x
111b
101b
111b
001b
000b
101b
q)min each 0=x mod/:1+til min x
101000b
q)where min each 0=x mod/:1+til min x
0 2
q)1+last where min each 0=x mod/:1+til min x
3
```


## X first triangular numbers

```q
q)x:6
q)sums til x
0 1 3 6 10 15
```



## Is x upper triangular?

```q
q)zm:{(2#count x)#0}  / zero matrix (square matrix)
q)show x:(1 0 0 1;0 2 1 0;0 0 1 2;0 0 0 0)
1 0 0 1
0 2 1 0
0 0 1 2
0 0 0 0
q)tc:('[til;count])
q){x>\:x}tc x
0000b
1000b
1100b
1110b
q)x*{x>\:x}tc x
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
q)zm x
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
q)zm[x]~x*{x>\:x}tc x
1b
q){zm[x]~x*{x>\:x}tc x}flip x
0b
```


## Is x lower triangular?

```q
)show x:(1 0 0 0;0 2 0 0;0 1 1 0;1 0 2 0)
1 0 0 0
0 2 0 0
0 1 1 0
1 0 2 0
q){x<\:x}tc x
0111b
0011b
0001b
0000b
q)zm[x]~x*{x<\:x}tc x
1b
q){zm[x]~x*{x<\:x}tc x}flip x
0b
```


## Polynomial product

```q
q)x:1 2 1
q)y:1 3 3 1
q)y*/:x
1 3 3 1
2 6 6 2
1 3 3 1
q)1 _ 'zm x
0 0
0 0
0 0
q)(1 _' zm x),'y*/:x
0 0 1 3 3 1
0 0 2 6 6 2
0 0 1 3 3 1
q)(tc x)rotate' (1 _' zm x),'y*/:x
0 0 1 3 3 1
0 2 6 6 2 0
1 3 3 1 0 0
q)sum(tc x)rotate'(1_'zm x),'y*/:x
1 5 10 10 5 1
```


## Divisors

```q
q)dv:{where 0=x mod/:key 1+x}
q)x:363
q)dv x
1 3 11 33 121 363
q)x:365
q)dv x
1 5 73 365
q)dv 367
1 367
q)dv each 1 2 3 4 5 6 7 8 9 10
,1
1 2
1 3
1 2 4
1 5
1 2 3 6
1 7
1 2 4 8
1 3 9
1 2 5 10
```


## Primes to n

```q
q)n:10
q)show x:1+til n
1 2 3 4 5 6 7 8 9 10
q)x mod/:x:1+til n
0 0 0 0 0 0 0 0 0 0
1 0 1 0 1 0 1 0 1 0
1 2 0 1 2 0 1 2 0 1
1 2 3 0 1 2 3 0 1 2
1 2 3 4 0 1 2 3 4 0
1 2 3 4 5 0 1 2 3 4
1 2 3 4 5 6 0 1 2 3
1 2 3 4 5 6 7 0 1 2
1 2 3 4 5 6 7 8 0 1
1 2 3 4 5 6 7 8 9 0
q)sum 0=x mod/:x:1+til n
1 2 2 3 2 4 2 4 3 4
q)2=sum 0=x mod/:x:1+til n
0110101000b
q)0b,2=sum 0=x mod/:x:1+til n
00110101000b
q)where 0b,2=sum 0=x mod/:x:1+til n
2 3 5 7
q)pn:{[n]where 0b,2=sum 0=x mod/:x:1+til n}
q)pn 30
2 3 5 7 11 13 17 19 23 29
q)/Classic:
q)p:{x[where not (x in distinct raze x*/:\:x:2_ key x)]}
q)p 10
2 3 5 7
q)p 30
2 3 5 7 11 13 17 19 23 29
```


## Maximum table

```q
q)x:til 10
q)x&\:x
0 0 0 0 0 0 0 0 0 0
0 1 1 1 1 1 1 1 1 1
0 1 2 2 2 2 2 2 2 2
0 1 2 3 3 3 3 3 3 3
0 1 2 3 4 4 4 4 4 4
0 1 2 3 4 5 5 5 5 5
0 1 2 3 4 5 6 6 6 6
0 1 2 3 4 5 6 7 7 7
0 1 2 3 4 5 6 7 8 8
0 1 2 3 4 5 6 7 8 9
```


## Direct matrix product

```q
q)x:1+3 2#til 6
q)y:1+2 4#til 8
q)flip each x*\:\:y
1 2 3 4     2 4 6 8     5  6  7  8  10 12 14 16
3 6 9  12   4 8 12 16   15 18 21 24 20 24 28 32
5 10 15 20  6 12 18 24  25 30 35 40 30 36 42 48
q)dp:{flip each x*\:\:y}
```


## Shur product

```q
q)show x:3 2#til 6
1 2
3 4
5 6
q)show y:2 4#1+til 8
1 2 3 4
5 6 7 8
q)((last shape x)#x) * (first shape y)#'y
1  4
15 24
```


## Shur sum

```q
q)show x:3 2#til 6
1 2
3 4
5 6
q)show y:2 4#1+til 8
1 2 3 4
5 6 7 8
q)((last shape x)#x) + (first shape y)#'y
2 4
8 10
```


## Add x to each row of y

```q
q)x:1+til 4
q)show y:3 4#2+til 12
2  3  4  5
6  7  8  9
10 11 12 13
q)x+/:y
3  5  7  9
7  9  11 13
11 13 15 17
```


## Add x to each column of y

```q
q)x:1+til 2
q)show y:2 5#3+til 10
3 4 5  6  7
8 9 10 11 12
q)x+'y
4  5  6  7  8
10 11 12 13 14
```


## Upper triangular matrix of order x

```q
q)x:5
q){x<=\:x}til x
11111b
01111b
00111b
00011b
00001b
```


## Lower triangular matrix of order x

```q
q){x>=\:x}til 5
10000b
11000b
11100b
11110b
11111b
```


## Identity matrix of order x

```q
q)id:{(2#x)#1,x#0}
q)id 5
1 0 0 0 0
0 1 0 0 0
0 0 1 0 0
0 0 0 1 0
0 0 0 0 1
q){x=/:x}til 5
10000b
01000b
00100b
00010b
00001b
```


## Hilbert matrix of order x

```q
q)hm:{reciprocal 1+(til x)+/:til x}
q)hm 5
1         0.5       0.3333333 0.25      0.2
0.5       0.3333333 0.25      0.2       0.1666667
0.3333333 0.25      0.2       0.1666667 0.1428571
0.25      0.2       0.1666667 0.1428571 0.125
0.2       0.1666667 0.1428571 0.125     0.1111111
```


## Multiplication table of order x

```q
q)mt:{{x*\:x}1+til x}
q)mt 5
1 2  3  4  5
2 4  6  8  10
3 6  9  12 15
4 8  12 16 20
5 10 15 20 25
```


## Extend distance table to next leg

```q
q)show x:(0 50 80 20 999; 50 0 20 40 30; 80 20 0 999 30; 20 40 999 0 10; 999 30 30 10 0)
0   50 80  20  999
50  0  20  40  30
80  20 0   999 30
20  40 999 0   10
999 30 30  10  0
```

Notice `x[0;2]` is `80` while `x[0;1]+x[1;2]` is `70`.

```q
q)x('[min;+])\:x
0  50 70 20 30
50 0  20 40 30
70 20 0  40 30
20 40 40 0  10
30 30 30 10 0
```


## Extend a transitive binary relation

==FIXME: Solve==

```q
q)show x:(0 1 0 0;0 0 1 1;1 0 0 0;0 0 1 0)
0 1 0 0
0 0 1 1
1 0 0 0
0 0 1 0
q)x(|/[&])\:x  / but how to parse that?
0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
q)x &\:x  / did I miss something?
0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
```


## Sum reciprocal series

```q
q)x:10 9 10 7 8
q)y:80 63 70 63 64
q)sum y%x
39f
```


## Matrix product

```q
q)show x:`float$(1 2 3;4 5 6)
1 2 3
4 5 6
q)show y:`float$(1 2;3 4;5 6)
1 2
3 4
5 6
q)x mmu y
22 28
49 64
```

==DROP: keyword not idiom==


## Sum over subsets of x specified by y

```q
q)show x:`float$1+3 4#til 12
1 2  3  4
5 6  7  8
9 10 11 12
q)show y:`float$4 3#1 0
1 0 1
0 1 0
1 0 1
0 1 0
q)x mmu y
4  6  4
12 14 12
20 22 20
```

==FIXME: how does y specify subsets of x?==


## Sum squares of x

```q
q)x:1 2 3 4 5
q)sum x*x
55
```

==DROP: trivial==


## Dot product of vectors

```q
q)x:1 2 3 4 5
q)y:10 20 30 40 50
q)sum x*y
550
```

== DROP Trivial ==


## Product over subsets of x specified by y

```q
q)show x:1+3 4#til 12
1 2  3  4
5 6  7  8
9 10 11 12
q)show y:4 3#1 0
1 0 1
0 1 0
1 0 1
0 1 0
q)x('[prd;xexp])\:y
3  8   3
35 48  35
99 120 99
```


## First 10 figurate numbers of order x

```q
q)fg:{x+\/10#1}
q)fg 0
1 1 1 1 1 1 1 1 1 1
q)fg 1
1 2 3 4 5 6 7 8 9 10
q)fg 2
1 3 6 10 15 21 28 36 45 55
q)fg 3
1 4 10 20 35 56 84 120 165 220
q)fg 4
1 5 15 35 70 126 210 330 495 715
```


## Alternating sum series

```q
q)x:1+til 10
q)x
1 2 3 4 5 6 7 8 9 10
q)a:((count x)#1 -1)
q)a
1 -1 1 -1 1 -1 1 -1 1 -1
q)b:x*a
q)b
1 -2 3 -4 5 -6 7 -8 9 -10
q)sums b
1 -1 2 -2 3 -3 4 -4 5 -5
q)as:{sums x*(count x)#1 -1}
q)as[x]
1 -1 2 -2 3 -3 4 -4 5 -5
```


## Maximum separation of items of x

```q
q)x:17 14 14 17 14 17 18
q)(max x)-min x
4
```


## Value of two-by-two determinant

```q
q)x:(13 21;34 55)
q)(-)over(x 0)*reverse x 1
1
```


## Y-th moment of x

```q
q)x:44 77 48 24 28 36 17 49
q)ym:{(sum(x-(sum x)%c)xexp y)%c:count x}
q)x ym/:2 0 1 3
309.2344 1 4.440892e-16 3889.934
```


## Solve quadratic

```q
q)qu:{(q%x),(z%q:qq[x;y;z])}
q)qq:{-0.5*y+sg[y]*ds[x;y;z]}
q)ds:{sqrt[(y*y)-(4*x*z)]}
q)sg:{(x>0)-(x<0)}   /or use the builtin signum
q)a:1
q)b:-1e30
q)c:1
q)sg[b]
-1
q)ds[a;b;c]
1e+30
q)qq[a;b;c]
1e+30
q)qu[a;b;c]
1e+30 1e-30
q)qu[1;-8;15]
5 3f
q){(q%x),z%q:0.5*y+signum[y]*sqrt(y*y)-4*x*z}[1;-8;15]
-5 -3f
```


## Alternating sum

```q
q)x:1+til 10
q)x
1 2 3 4 5 6 7 8 9 10
q)a:((count x)#1 -1)
q)b:x*a
q)sum b
-5
q)sum x*(count x)#1 -1
-5
```


## Product

```q
q)x:1 2 3 4 5
q)prd x
120
```


## Alternating product

```q
q)x:1 2 3 4 5
q)a:(count x)#1 -1
q)a
1 -1 1 -1 1
q)prd xexp[x;a]
1.875
q)xexp[x;a]
1 0.5 3 0.25 5
```


## Sum a vector

```q
q)x:1 2 3 4 5
q)sum x
15
```


## Sum columns of matrix

```q
q)x:1+3 4#til 12
q)x
1 2  3  4
5 6  7  8
9 10 11 12
q)sum x
15 18 21 24
```


## Sum rows of matrix

```q
q)x:1+3 4#til 12
q)x
1 2  3  4
5 6  7  8
9 10 11 12
q)sum each x
10 26 42
```

