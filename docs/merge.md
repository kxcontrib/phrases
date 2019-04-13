# Mesh


_Merge `x`, `y`, and `z` under control of `g`_

<big>`(x,y,z)[iasc iasc g]`</big>

```q
q)x:"abcd"
q)y:"123456789"
q)z:"zz"
q)g:1 0 1 1 2 1 2 1 1 0 1 0 1 0 1
q)(x,y,z)[iasc iasc g]
"1a23z4z56b7c8d9"
```


<big>`(x,y,z)[iasc idesc g]`</big>

```q
q)x:5 9 8 7 4 3
q)y:10 20 30 40
q)g:1 0 1 1 0 0 1 0 1 1
q)(x,y)[iasc idesc g]
5 10 9 8 20 30 7 40 4 3
```


<i class="far fa-hand-point-right"></i>
Reference: 
[`iasc`](https://code.kx.com/v2/ref/iasc/), 
[Case](https://code.kx.com/v2/ref/maps/#case)