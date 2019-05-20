# Statistics


## Normal deviates from interval (0,1)

```q
q)\P 4
q)4?1.
0.7418 0.007865 0.4953 0.1869
```

==DROP Not an idiom; just how Roll works. Or explain relation to “normal deviates”==


## Maximum of x with weights y

```q
q)x:1 2 3 4 5
q)y:5 4 3 2 1
q)max x*y
9
```


## Minimum of x with weights y

```q
q)x:1 2 3 4 5
q)y:5 4 3 2 1
q)min x*y
5
```


## Average (mean) of x weighted by y

```q
q)y:78 80 90 88 72
q)x:20 15 20 22 19
q)x*y
1560 1200 1800 1936 1368
q)sum x*y
7864
q)(sum x*y)%count x
1572.8
```


## Moving sum

```q
q)y:3
q)x:1 2 3 5 7 11
q)y msum 1 2 3 5 7 11
1 3 6 10 15 23
```


## Running sum

```q
q)sums x
1 21 321 4321
```


## Standard deviation

```q
q)x:44 77 48 24 28 36 17 49 90 91
q)sqrt sum{x*x}[x-(sum x)%c]%c:count x
25.48411
```


## Variance (dispersion)

```q
q)x:44 77 48 24 28 36 17 49 90 91.0
q)sum {x*x}[x-(sum x)%c]%c:count x
649.44
```


## Average (mean)

```q
q)av:{(sum x)%count x}
q)av[1 10 100]
37f
```


## Maximum

```q
q)x:5 3 7 2
q)max x
7
```


## Non-negative maximum

```q
q)x:-1 -2 -3 -4 -5
q)max 0,x
0
```


