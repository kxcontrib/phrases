---
title: Geometry & trigonometry – Q Phrasebook
description: Geometrical and trigonometrical expressions in the q programming language
keywords: angle, area, contour, degrees, geometry, kdb+, q, radians, rotation matrix, minutes, triangle, trigonometry
---
# Geometry & trigonometry



## Degrees from degrees and minutes

```q
q)dfdm:{sum x%1 60}
q)dfdm 60 0
60f
q)dfdm 60 3
60.05
q)dfdm 60 10
60.16667
q)dfdm 60 30
60.5
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


## Nautical miles from radians

```q
q)nmr:{x*180*60%3.141592653589798238}
```


## Great-circle distance

```q
q)gcd:{cos distinct(prd sin x)+(prd cos x)*cos(-/)y}
```

The great-circle distance in radians between two points on a sphere whose latitudes in radians are in `x` and longitudes in radians are in `y`.


## Area of triangle with sides x

Heron’s rule.

```q
q)hr:{sqrt (prd (sum x%2)-0,x)}
q)hr x
6f
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


## Contour levels y at points with altitude x

```q
q)cl:{y[-1+sum not y>x]}
q)y:-100 0 10 100 1000 10000
q)cl[-5;y]
-100
q)cl[0;y]
0
q)cl[99;y]
10
q)cl[9;y]
0
q)cl[10;y]
10
```


