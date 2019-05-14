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


