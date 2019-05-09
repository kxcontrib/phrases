# Mathematics


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


## Present value of cash flows 

Example: a 3-year bond with an annual 10% coupon and discount rate of 0.9

```q
q)c:0.1 0.1 1.1     / cash flows
q)t:1 2 3           / times
q)d:0.9             / discount rate
q)sum c*d xexp t
0.9729
```


## Future value of cash flows

```q
q)x:10 15 20 25                         / cash flows
q)y:5                                   / interest rate
q)sum x* (1+y%100) xexp reverse tc x
74.11375
```


## Is matrix x antisymmetric?

```q
q)show x:(0 -7 1; 7 0 -4; -1 4 0)
0  -7 1
7  0  -4
-1 4  0
q)x~neg flip x
1b
```


## Is matrix x symmetric?

```q
q)show x:(0 4 7 1; 4 8 6 4; 7 6 2 0; 1 4 0 6)
0 4 7 1
4 8 6 4
7 6 2 0
1 4 0 6
q)x~flip x
1b

q)show x:4 4#16?10
6 6 3 3
9 7 9 4
4 7 9 9
4 7 8 9
q)x~flip x
0b
```


## 87. Number of decimals

Maximum 7.

```q
q)nd:{$[1=count x;0;-2+count x]}
q)ff:{string x-floor x}
q)ff 6.567
"0.567"
q)nd ff 1.234
3
q)nd ff 1234
0
q)nd ff 78.1234567
7
q)nd ff 78.12345678
7
```


## Normal deviates from interval (0,1)

```q
q)\P 4
q)4?1.
0.7418 0.007865 0.4953 0.1869
```

==DROP Not an idiom; just how Roll works. Or explain relation to “normal deviates”==


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



## Complementary angle (arccos sin x)

```q
q)x:0.25
q)acos sin x
1.320796
q)x+acos sin x / should be 0.5*pi, approximately
1.570796
q)2*x+acos sin x
3.141593
```


## Rotation matrix for angle x (in radians) counter-clockwise

```q
q)x:0.25
q)((cos x;neg sin x);(sin x;cos x))
0.9689124 -0.247404
0.247404  0.9689124
```


## Degrees from radians

```q
q)x:0.5
q)57.295779513082323*x
28.64789
```


## Radians from degrees

```q
q)x:0.5
q)z:57.295779513082323*x
q)z
28.64789
q)0.017453292519943295*z
0.5
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


