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


