# Execution




## Execute rows of character matrix

```q
q)x1:4
q)x2:9
q)show x:2 5#"y1:x1y2:x2"
"y1:x1"
"y2:x2"
q)parse each x
: `y1 `x1
: `y2 `x2
q)('[eval;parse])each x
4 9
q)(y1;y2)
4 9
```


## Sum numbers in character matrix

```q
q)show x:string til 5
,"0"
,"1"
,"2"
,"3"
,"4"
q)sum parse " " sv x
10
```


## Case structure

```q
$[c0;t0;f]
$[c0;t0;c1;t1;f]
$[c0;t0;c1;t1;c2;t2;f]
$[c0;t0;c1;t1;c2;t2;c3;t3;f]
```

Et cetera.
In the first case, if `c0` is nonzero, the result is `t0`; otherwise `f`.
In all cases, the result is the `t` corresponding to the first non-zero `c`.
If all the `c` are zero the result is `f`.

==DROP Again, not an idiom, just how Cond works.==

==FIXME Example of dictionary as case structure. Also Case operator.==


## Efficient execution of f x where x has repeated values

```q
q)x:1 2 3 2 3 2 1
q)show u:distinct x
1 2 3
q)u?x
0 1 2 1 2 1 0
q)f:{10*x}
q)f u
10 20 30
q)(f u)[0 1 2 1 2 1 0]
10 20 30 20 30 20 10
q)(f u)[(u:distinct x)?x]
10 20 30 20 30 20 10
q).Q.fu[f;x]
10 20 30 20 30 20 10
```


## Choose x or y depending on flag g

```q
q)x:"abcdef"
q)y:"xyz"
q)g:0
q)$[g;x;y]
"xyz"
q)g:1
q)$[g;x;y]
"abcdef"
```

