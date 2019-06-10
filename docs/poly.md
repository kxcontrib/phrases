# Polynomials




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


## Polynomial derivative

```q
q)x:1 2 3 4 5
q)-1 _ x*reverse tc x
4 6 6 4
```


## Value of ascending polynomial coefficients y at points x

```q
q)x:-1 0 2
q)y: 4 0 5 1
q)x sv\:y
-8 1 43
```


## Coefficients of best linear fit of points (x,y) (least squares)

```q
q)x:64 70 77 82 92 107 125 143 165 189f
q)y:56 60 66 70 78  88 102 118 136 155f
q)x xexp/:0 1
1  1  1  1  1  1   1   1   1   1
64 70 77 82 92 107 125 143 165 189
q)oa:{x xexp/:0 1}                              / ones and all Xs (float)
q)first(enlist y)lsq oa x
4.587803 0.7927486
q)cbf:{first(enlist y)lsq oa x}                 / coefficients of best fit
```

Note that `lsq` requires float arguments and `oa` returns floats. 
Defining `cbf` as `{first(enlist"f"$y)lsq oa x}` would allow integer arguments.


## Predicted values of best linear fit (least squares)

```q
q)x:64 70 77 82 92 107 125 143 165 189f
q)y:56 60 66 70 78  88 102 118 136 155f
q)oe:{x xexp\:0 1}                              / 1 and each X
q)oe x
1 64
1 70
1 77
1 82
1 92
1 107
1 125
1 143
1 165
1 189
q)(oe x)mmu cbf[x;y]
55.32371 60.08021 65.62945 69.59319 77.52068 89.41191 103.6814 117.9509 135.3913 154.4173
q)pvbf:{(oe x)mmu cbf[x;y]}
```



## Coefficients of exponential fit of points (x,y)

```q
q)x:64 70 77 82 92 107 125 143 165 189
q)y:56 60 66 70 78 88 102 118 136 155
q)cbf[log y;x]
3.563398 0.00817742
q)(1;x)*cbf[x;log y]
3.563398
0.5233549 0.5724194 0.6296613 0.6705484 0.7523226 0.8749839 1.022177 1.169371..
q)exp(1;x)*cbf[x;log y]
35.2829
1.68768 1.77255 1.876975 1.955309 2.121923 2.398837 2.77924 3.219967 3.854627..
q)(*). exp(1;x)*cbf[x;log y]
59.54624 62.54071 66.22511 68.98898 74.86758 84.63791 98.05964 113.6098 136.0..
```

`log` returns floats, so neither `x` nor `y` need be floats in this example.


## Predicted values of exponential fit

```q
q)x:64 70 77 82 92
q)y:56 60 66 70 78
q)exp (oe x)mmu cbf[x;log y]
56.10745 60.28622 65.55641 69.60062 78.45289
q)exp pvbf[x;log y]
56.10745 60.28622 65.55641 69.60062 78.45289
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


## Y-th moment of x

```q
q)x:44 77 48 24 28 36 17 49
q)ym:{(sum(x-(sum x)%c)xexp y)%c:count x}
q)x ym/:2 0 1 3
309.2344 1 4.440892e-16 3889.934
```



