# Rounding





## Round to nearest integer

```q
q)ri:{floor 0.5+x}
q)x:4.5 3.21 80.9 -2.4 -9.6
q)ri x
5 3 81 -2 -10
```


## Round to nearest even integer

```q
q)re:{floor x+not 1>x mod 2}
q)x:0.9 1 2.5 3.1 -0.2 -1.9
q)re x
0 2 2 4 0 -2
```


## Rounding, but to nearest even integer if fractional part is 0.5

```q
q)rn:{floor x+0.5*not 0.5=x mod 2}
q)x:23.6 40.5 3.2 -14.02 3.5 4.5
q)rn x
24 40 3 -14 4 4
```


## Round to two decimal places

```q
q)rh:{0.01*floor 0.5+x*100}
q)x:3.1414 2.71828 -12.66666
q)rh x
3.14 2.72 -12.67
```


## Round y to x decimals

```q
q)rn:{(10 xexp neg x)*`long$y*10 xexp x}
q)y:3.3256789
q)x:3
q)rn[x;y]
3.3259999999999978
q)\P 7
q)rn[x;y]
3.326
q)rn[2;123123123123.123123]
123123123123.12
```


## Round x to nearest multiple of y

```q
q)x:100
q)y:12
q)y*floor 0.5+x%y
96
q){y*floor 0.5+x%y}[11.50;.12]  / $11.50 to nearest multiple of 12 cents
11.52
```


## Round x to zero if magnitude less than y

```q
q)show x:1e-4 -1e-8 -1e-12 1e-16
0.0001 -1e-08 -1e-12 1e-16
q)y:1e-9
q)y<=abs x
1100b
q)x*y<=abs x
0.0001 -1e-08 -0 0
q)@[x;where y>abs x;:;0.0]
0.0001 -1e-08 0 0
```

==FIXME== What and why is `-0`?

