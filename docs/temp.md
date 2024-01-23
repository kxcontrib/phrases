# Temporal




## Is year x a leap year?

Leap year from 463.

```q
ly:{mod[;2] sum 0=x mod\:4 100 400}
q)ly each 1900 1901 1904 1999 2000 2100
0 0 1 0 1 0
```


## Days in month x of Gregorian year y 

```q
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 7 1996
31
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 4 1996
30
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 2 1996
29
q){$[x=2;28+ly y;(0,12#7#31 30)x]} . 2 1997
28
```


## Date in ascending format

```q
q){x 9 10 0 6 7 0 1 2 3 4}"/",string"d"$.z.p
"01/01/2019"
q)"/"sv reverse 0 4 6_ except[;"."]string"d"$.z.p
"01/01/2019"
```

Not quite the same as above:

```q
q)show dt:.z.p
2019.01.01D22:31:55.416124000
q)"."sv string (dt.dd;dt.mm; dt.year)
"1.1.2019"
q)raze string each(dt.year;".";dt.mm;".";dt.dd)
"2019.1.1"
```


## Current time of 12-hour clock

```q
q)a:01:58:57
q)p:13:59:59
q)prd 12 60 60  / seconds in 12 hours
43200
q)hm:{p:x>11:59:59; string[x-43200*p]," ","AP"[p],"M"}
q)hm a
"01:58:57 AM"
q)hm p
"01:59:59 PM"
```


## Current date, American format

```q
q)dt:2018.09.15
q)"/"sv string `mm`dd`year$\:dt
"9/15/2018"
```

An alternative, preserving the leading zeros is:

```q
q)dt:2018.09.15
q)"/"sv("."vs string dt)1 2 0
"09/15/2018"
```
