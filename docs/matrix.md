# Matrixes




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


<i class="far fa-hand-point-right"></i>
[Tests: Is x lower or upper triangular?](test.md#is-x-lower-triangular)


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
q)x('[min;+])\:x        / x{min x+y}\:x
0  50 70 20 30
50 0  20 40 30
70 20 0  40 30
20 40 40 0  10
30 30 30 10 0
```


## Extend a transitive binary relation

```q
q)show x:(0 1 0 0;0 0 1 1;1 0 0 0;0 0 1 0)
0 1 0 0
0 0 1 1
1 0 0 0
0 0 1 0
q)x('[max;&])\:x
0 0 1 1
1 0 1 0
0 1 0 0
1 0 0 0
q)x('[any;&])\:x        / x{any x&y}\:x
0011b
1010b
0100b
1000b
```


## Value of two-by-two determinant

```q
q)x:(13 21;34 55)
q)(-)over(x 0)*reverse x 1
1
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


## Add vector y to main diagonal of x

```q
q)show x:3 4#til 12
0 1 2  3
4 5 6  7
8 9 10 11
q)y:10 100 1000
q)@'[x;tc x;+;y]
10 1   2    3
4  105 6    7
8  9   1010 11
```

The `@'` above can be analysed as three Amends:

```q
q)(@[x 0;0;+;y 0];@[x 1;1;+;y 1];@[x 2;2;+;y 2])
10 1   2    3
4  105 6    7
8  9   1010 11
```

<i class="far fa-hand-point-right"></i>
Reference:[Each](https://code.kx.com/v2/ref/maps/#each)



