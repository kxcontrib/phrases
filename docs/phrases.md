# `phrases.q`




Constants and functions referred to in the Q Phrasebook.

```q
DEC:"0123456789"
HEX:"0123456789abcdef"
PI:3.141592653589798238
PUN:",;:.!?"
depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan{1=count distinct count each x}each raze over x]}
fac:{prd 1+til x}                   	/ factorial
ly:{mod[;2] sum 0=x mod\:4 100 400}   	/ is x a leap year
shape:{$[0=d:depth x; 
  0#0j; 
  d#{first raze over x}each(d{each[x;]}\count)@\:x]}  / FIXME correct for shape 0#0
tc:('[til;count])
zm:{(2#count x)#0}                  	/ zero matrix (square matrix)
```


<i class="fas fa-download"></i>
[`phrases.q`](phrases.q)