/ Title: Constants and functions from the Q Phrasebook
/ URL: https://code.kx.com/phrases/phrases.q
DEC:"0123456789"
HEX:"0123456789abcdef"
PI:3.141592653589793238
PUN:",;:.!?"
depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan 1b,-1_{1=count distinct count each x}each raze scan x]}
fac:{prd 1+til x}                   	/ factorial
ly:{mod[;2] sum 0=x mod\:4 100 400}   	/ is x a leap year?
oa:{x xexp/:0 1}                       	/ ones and all Xs (float)
oe:{x xexp\:0 1}                       	/ 1 and each X (float)
shape:{$[0=d:depth x; 
  0#0j; 
  d#{first raze over x}each(d{each[x;]}\count)@\:x]}
tc:til count@
tt:{2 vs til "j"$2 xexp x}				/ truth table of order x
zm:{(2#count x)#0}                  	/ zero matrix (square matrix)
