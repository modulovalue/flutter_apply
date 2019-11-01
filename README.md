TODO document but in a nutshell:

Abstracts widget tree operations by using exploiting the fact that all
widgets have a child. Child-passing can then be replaced with an operation.

This allows easier prototyping and composition of widgets. 
Also less parentheses are needed and the nesting level is reduces.


Further thoughts:

What is the next level of widget abstraction? this could maybe
be used to convert a limited grammar of human speech into layouts.
Current widget definition mix layout and style. this library mainly
takes the design aspect away and focuses on design... 