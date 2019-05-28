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


## Y-th moment of x

```q
q)x:44 77 48 24 28 36 17 49
q)ym:{(sum(x-(sum x)%c)xexp y)%c:count x}
q)x ym/:2 0 1 3
309.2344 1 4.440892e-16 3889.934
```



