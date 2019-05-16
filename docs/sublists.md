---
keywords: ascending sort, iasc, kdb+, q, sort
---

# Operations on sublists




## Partition a list

<big>`(…)_y`</big>

Partition list `y` at flags `x`

```q
x:1 1 0 0 0 1 0 0 1 1       / flags
y:3 4 8 2 5 6 9 4 5 4
q)(where x)_y
,3
4 8 2 5
6 9 4
,5
,4
```

Partition list `y` into lengths `x`

```q
q)x:1 4 3 1 1               / partition lengths
q)(0,sums -1_x)_y
,3
4 8 2 5
6 9 4
,5
,4
```


## Unify sublists

Use `raze` to unify sublists.

```q
q)y~raze(0,sums -1_x)_y
1b
```


## Reverse each sublist

```q
q)x:"thequickbrownfox"                              / vector
q)y:3 5 5 3                                         / partition lengths
q)il:{-1_ sums 0,x}                                 / indices from lengths
q)il y                                              / partition indices
0 3 8 13
q)x reverse idesc sums til[count x] in 0 3 8 13     / from indices
"ehtkciuqnworbxof"
q)x reverse idesc sums til[count x] in il y         / from partition lengths
"ehtkciuqnworbxof"
```


## Apply aggregate function to sublists

<big>`ƒ each (…)_y`</big>

Aggregate functions remove one level of depth.
For example, returns an atom from a vector, or a vector from a matrix.

Use `each` to apply an aggregate function to each sublist.

```q
q)x:1 1 0 0 0 1 1 0 0 1
q)y:3 4 8 2 5 6 9 4 5 4
q)min each where[x]_y       / subvector minimums
3 2 6 4 4
q)max each where[x]_y       / subvector maximums
3 8 6 9 4
q)y:" the quick brown fox"
q)-1+count each where[y=" "]_y
3 5 5 3
```

Above, the aggregate function returns an atom from each sublist; the result is a vector.


## Apply uniform function to sublists

<big>`raze ƒ each (…)_y`</big>

Uniform functions return results of the same shape as their argument.
Use `raze` to unify the result sublists.

```q
q)y:3 4 8 2 5 6 9 4 5 4
q)x:1 1 0 0 0 1 1 0 0 1
q)asc each where[x]_y           / sort sublists
`s#,3
`s#2 4 5 8
`s#,6
`s#4 5 9
`s#,4
q)raze asc each where[x]_y
3 2 4 5 8 6 4 5 9 4
q)raze iasc each where[x]_y     / grade up sublists
0 2 0 3 1 0 1 2 0 0
```


## Insert y "*" after "=" in x

```q
q)x:"abc=,d=,fgh="
q)y:5
q)show g:where x="="
3 6 11
q)(x,"*")[(count x)&iasc (til count x),(y*count g)#g]
"abc=*****,d=*****,fgh=*****"

q)raze ((0,1+-1_ g)_ x),\:y#"*"
"abc=*****,d=*****,fgh=*****"

q)a:where 0b,x="="
q)(x,(y*count a)#"*")rank raze (deltas[a]#'0),\:y#1
"abc=*****,d=*****,fgh=*****"
```


## Maxima of sublists of x specified by boolean list y

```q
q)x:-17 7 30 12 5 2 -5 6 -3 -19
q)show y:10#1 1 0
1 1 0 1 1 0 1 1 0 1
q)where[y]_x
,-17
7 30
,12
5 2
,-5
6 -3
,-19
q)max each where[y]_x
-17 30 12 5 -5 6 -19
```


## Running parity of sublists of y indicated by x

```q
q)x:1 0 0 0 0 1 0 0 0 0 1 0 0 0
q)y:1 0 0 1 1 1 0 0 1 0 1 1 0 0
q)where x
0 5 10
q)where[x] _ y
1 0 0 1 1
1 0 0 1 0
1 1 0 0
q)sums each where[x] _ y
1 1 1 2 3
1 1 1 2 2
1 2 2 2
q)(sums each where[x] _ y)mod 2
1 1 1 0 1
1 1 1 0 0
1 0 0 0
q)raze(sums each where[x] _ y)mod 2
1 1 1 0 1 1 1 1 0 0 1 0 0 0
```


## Running sum of sublists of y indicated by x

```q
q)x:1 0 0 0 1 0 0 0 1
q)y:1 2 3 4 5 6 7 8 9
q)where x
0 4 8
q)where[x] _ y
1 2 3 4
5 6 7 8
,9
q)sums each where[x] _ y
1 3 6 10
5 11 18 26
,9
q)raze sums each where[x] _ y
1 3 6 10 5 11 18 26 9
```


## Groups of 1s in y pointed at by x

```q
q)y:0 0 0 1 1 1 0 1 1 1 0 1 1 1 1 1
q)x:0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 1
q)x:0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 1
q)a:sums >':[y]
q)a
1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3
q)a:sums >':[0,y]
q)a
1 1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3
q)a:+\>':[0,y]
'\
q)a:sums >':[0,y]
q)a:sums >':[y]
q)a
1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3
q)a-1
0 0 0 1 1 1 1 1 1 1 1 2 2 2 2 2
q)a:a-1
q)y&a=maxs x*a
0 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1
```

==FIXME What is this about? How are the groups in `y` ‘pointed at’ by `x`?==


## Sums of sublists of x determined by lengths y

```q
q)x:1+til 10
q)y:2 3 2 3
q)a:sums 0,-1 _ y
q)a
0 2 5 7
q)a _ x
1 2
3 4 5
6 7
8 9 10
q)sum each a _ x
3 12 13 27
q)sum each sums[0,-1_ y] _ x
3 12 13 27
```

Or.

```q
q)deltas sums[x] sums[y]-1
3 12 13 27
```


## Insert x[i] zeroes after i-th infix of y

```q
q)y:0 0 1 0 1 0 1 1
q)x:1 2 2 1
q)(0,where y)_y
0 0
1 0
1 0
,1
,1
q)raze((0,where y)_y),'(0,x)#'0
0 0 1 0 0 1 0 0 0 1 0 0 1 0
```

See also 264.


## End flags from lengths

```q
q)x:1 2 3 4 5
q)sums x
1 3 6 10 15
q)-1+sums x
0 2 5 9 14
q)sum x
15
q)@[(sum x)#0;-1+sums x;:;1]
1 0 1 0 0 1 0 0 0 1 0 0 0 0 1
```

Or.

```q
q)(1+til sum x)in sums x
101001000100001b
```


## Start flags from lengths

```q
q)x:1 2 3 4 5
q)(til sum x)in sums 0,x
110100100010000b
```

Or.

```q
q)raze(signum x),'(x-1)#'0i
1 1 0 1 0 0 1 0 0 0 1 0 0 0 0i
```


## 283. Find field y of fields beginning with first of x

```q
q)x:"abcabbbaccccaddd"
q)y:2
q)y=sums x=first x
0001111000000000b
q)x[where y=sums x=first x]
"abbb"
q)y:4
q)x[where y=sums x=first x]
"addd"
```


## Sum items of x marked by y

```q
q)x:1 2 3 4 5 6 7
q)y:1 1 1 2 2 3 3
q)x group y
1| 1 2 3
2| 4 5
3| 6 7
q)sum each x group y
1| 6
2| 9
3| 13
q)value sum each x group y
6 9 13
```


## Or-scan of sublists of y flagged by x

```q
q)y:1 0 0 1 0 1 0 0
q)x:1 0 1 0 0 0 1 0
q)a:where x
q)a
0 2 6
q)b:a _ y
q)b
1 0
0 1 0 1
0 0
q)c:max each b
q)c
1 1 0
q)c:maxs each b
q)c
1 1
0 1 1 1
0 0
q)raze c
1 1 0 1 1 1 0 0
q)raze maxs each where[x]_ y
1 1 0 1 1 1 0 0
```


## And-scan of sublists of y flagged by x

```q
q)y:1 0 0 1 0 1 0 0
q)x:1 0 1 0 0 0 1 0
q)a:where x
q)b:a _ y
q)b
1 0
0 1 0 1
0 0
q)c:mins each b
q)c
1 0
0 0 0 0
0 0
q)raze c
1 0 0 0 0 0 0 0
q)raze mins each where[x]_ y
1 0 0 0 0 0 0 0
```


## Sums of sublists of y flagged by x

```q
q)y:1 2 3 4 5
q)x:1 0 1 0 1
q)a:where x
q)b:a _ y
q)b
1 2
3 4
,5
q)c:sum each b
q)c
3 7 5
q)sum each(where x)_y
3 7 5
```


## Groups of 1s in y flagged by x

```q
q)y:1 1 1 0 0 1 1
q)x:0 1 0 1 0 0 0
q)-1 _ 0,y
0 1 1 1 0 0 1
q)y > -1 _ 0,y
1 0 0 0 1 0 0
q)(>)prior y
1 0 0 0 1 0 0
q)sums(>)prior y
1 1 1 1 1 2 2
q)x&y
0 1 0 0 0 0 0
q)a:sums(>)prior y
q)a where x&y
,1i
q)a in enlist 1
1111100b
q)y & a in enlist 1
1 1 1 0 0 0 0
q)y and a in(a:sums(>)prior y) where x&y
1 1 1 0 0 0 0
```


## 296. Starting positions of sublists from lengths x

```q
q)x:2 3 1 5
q)sums -1 _0,x
0 2 5 6
q)sl:{sums -1 _ 0,x}
q)sl x
0 2 5 6
```


## Gth sublist of y flagged by x

```q
q)x:1 0 0 1 0 1 0 0 0 1 0
q)y:"abcdefghijk"
q)a:where x
q)a
0 3 5 9
q)b:a _ y   /original says x but must be y
q)b
"abc"
"de"
"fghi"
"jk"
q)b 2
"fghi"
q)((where x)_ y)[g]
"fghi"
```

