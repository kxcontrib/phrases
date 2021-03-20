# :fontawesome-solid-book-reader: Q Phrasebook



The phrasebook is a collection of q expressions used for common tasks. 

Because q is a terse language, the phrasebook is a particularly useful tool for programmers. This collection of q expressions solves common problems and serves both as a library for coders and a set of problems for those learning the language. 


## Repository

This is an open-source collection, and a repository of community programming knowledge. 

You can contribute to the project at
:fontawesome-brands-github:
[kxcontrib/phrases](https://github.com/kxcontrib/phrases/).
Or write to librarian@kx.com.


## Genealogy

The q phrases derive originally from the [FinnAPL Idiom Library](https://aplwiki.com/wiki/FinnAPL_idiom_library), a legendary resource for vector programmers. 

Iverson’s reboot of APL was the [J programming language](https://jsoftware.com/), where the idioms became [phrases](https://code.jsoftware.com/wiki/Phrases).

[Eugene McDonnell](https://en.wikipedia.org/wiki/Eugene_McDonnell) 
ported the FinnAPL Idiom Library to the [k language](https://code.kx.com/q/basics/exposed-infrastructure/#the-k-programming-language). A partial translation of that into q was hosted – as an extraordinarily long page – on the old wiki.

:fontawesome-solid-comment:
[Kdb+ and the history of the Q Phrasebook](https://kx.com/blog/kdb-and-the-history-of-the-q-phrasebook/)

The k idiom list and its partial translation as the QIdioms page were exercises by experienced programmers who at the time were getting to know the respective languages. 

The Q Phrasebook aims to fulfill their project of producing a q equivalent of the FinnAPL Idiom Library and the J Phrases. 

Many of the original problems have the same solution in q. 
The numbering inherited from the ancestor lists has not been preserved. 
The phrases have been renumbered. 
The [index to QIdioms](index2.md) maps old to new numbers. 


## Paint the town red

The meaning of an idiom is given by customary usage. It cannot be understood by analyzing the words in it. 

For example, someone who _paints the town red_ might not use paint of any color; but just goes out for a good time.  

The Q Phrases are not idioms. They can be understood by analysis, and reward study. So _phrases_, not _idioms_.


## That’s a phrase?

Some of the ‘phrases’ turn out to be just q operators or keywords. 
For example, [_Case structure_](exec.md#case-structure) is nothing but the [Cond operator](https://code.kx.com/q/ref/cond/ "Reference"). 

They are included here because, although they are elementary in q, readers coming from verbose languages might reasonably expect them to be at least a phrase. 


## :fontawesome-solid-download: `phrases.q`

Some forms, such as `til count` recur so frequently they have been included in the script [`phrases.q`](phrases.md) and used as parts of other phrases. 