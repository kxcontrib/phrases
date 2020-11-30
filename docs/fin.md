# Finance




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


## Compound interest for principals y at percentages g for periods x

```q
q)x:1 2 3
q)y:100 200 300 400
q)g:0.5 1 1.5 2
q)y*\:(1+g%100)xexp\:x
100.5 101    101.51 101   102.01 103.03 101.5 103.02 104.57 102   104.04 106.12
201 202    203.02   202 204.02 206.06   203 206.04 209.14   204 208.08 212.24
301.5 303.01 304.52 303   306.03 309.09 304.5 309.07 313.7  306   312.12 318.36
402 404.01 406.03   404 408.04 412.12   406 412.09 418.27   408 416.16 424.48
```


## Annuity coefficient for x periods at interest rate y%

```q
q)x:10 15 20 25
q)y:8 9 10 15
q)flip 1-xexp\:[(1+y%100);neg x]
0.5368065 0.5775892 0.6144567 0.7528153
0.6847583 0.725462  0.760608  0.8771055
0.7854518 0.8215691 0.8513564 0.9388997
0.8539821 0.8840322 0.907704  0.9696224
q)\P 3
q)flip 1-xexp\:[(1+y%100);neg x]
0.537 0.578 0.614 0.753
0.685 0.725 0.761 0.877
0.785 0.822 0.851 0.939
0.854 0.884 0.908 0.97
q)ac:{(y%100)%/:flip 1-xexp\:[(1+y%100);neg x]}
q)ac[x;y]
0.149  0.156 0.163 0.199
0.117  0.124 0.131 0.171
0.102  0.11  0.117 0.16
0.0937 0.102 0.11  0.155
```


## Fifo stock y decremented with x units

```q
q)x:5
q)y:1 2 3 4 5
q)sums y
1 3 6 10 15
q)(sums y)-x
-4 -2 1 5 10
q)g:0|(sums y)-x
q)g
0 0 1 5 10
q)deltas 0,g
0 0 0 1 4 5
q)1_ deltas 0,g
0 0 1 4 5
q)ff:{1_deltas 0,0|(sums y)-x}
q)ff[x;y]
0 0 1 4 5
```


## Payback

Cumulative accumulation factors.

:fontawesome-solid-globe:
[Zark APL Tutor](http://www.dyalog.com/dyalogue-newsletters.htm?nl=19&a=135) News 1998 Quarter 2

```txt
B initial balance
T time of withdrawal: 0 start of period, 1 end
R interest rate per period
W withdrawal amount
```

```q
q)pay:{[B;T;R;W]C:prds(count W)#1+R; C*B-sums W%(count W)#T _ 1,C}
q)pay2:{[B;END;R;W]CPA:prds A:1+R; CPA*B-sums W%CPA%A*1-END}
q)B:1000
q)T:0
q)R:0.05
q)W:200 300 400 200
q)pay[B;T;R;W]
840 567 175.35 -25.8825
q)T:1
q)pay[B;T;R;W]
850 592.5 222.125 33.23125
q)R:0.05 0.04 0.06 0.05
q)T:0
q)pay[B;T;R;W]
840 561.6 171.296 -30.1392
q)T:1
q)pay[B;T;R;W]
850 584 219.04 29.992
```

The version `pay2` replaces `T` by `END`, and permits `END` to be any value between 0 and 1.


## Round

### Round to nearest integer

```q
q)ri:{floor 0.5+x}
q)x:4.5 3.21 80.9 -2.4 -9.6
q)ri x
5 3 81 -2 -10
```


### Round to nearest even integer

```q
q)re:{floor x+not 1>x mod 2}
q)x:0.9 1 2.5 3.1 -0.2 -1.9
q)re x
0 2 2 4 0 -2
```


### Round, but to nearest even integer if fractional part is 0.5

```q
q)rn:{floor x+0.5*not 0.5=x mod 2}
q)x:23.6 40.5 3.2 -14.02 3.5 4.5
q)rn x
24 40 3 -14 4 4
```


### Round to two decimal places

```q
q)rh:{0.01*floor 0.5+x*100}
q)x:3.1414 2.71828 -12.66666
q)rh x
3.14 2.72 -12.67
```


### Round y to x decimals

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


### Round x to nearest multiple of y

```q
q)x:100
q)y:12
q)y*floor 0.5+x%y
96
q){y*floor 0.5+x%y}[11.50;.12]  / $11.50 to nearest multiple of 12 cents
11.52
```


### Round x to zero if magnitude less than y

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

### Round summands

Ensure sum of rounded summands matches round of sum

```q
q)rs:{i:floor Y:y%x; x*@[i;{(floor .5+/x)#idesc x}Y-i;+;1]}
q)
q)y:42.35 38.45 19.20
q)(floor .5+sum y;sum 0N!rs[1;y])
42 39 19
100 100
q)
q)y:42.65 37.60 19.75
q)(floor .5+sum y;sum 0N!rs[1;y])
43 37 20
100 100
```


