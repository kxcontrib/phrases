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

