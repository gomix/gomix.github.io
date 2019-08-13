---
layout: programming
title: C Types I
lang: en
---
{% include ccpp-logo-float-right.html %}

# C Types
*** 

<img src="../images/primary-data-type.png" class="w-50 mr-5 rounded float-right" alt="C Data Types"> 
Before you go and declare a variable, you must know what kind of value will it hold.


* Primary data types:
  * char
  * int
  * float
  * double


* Modifiers:
  * unsigned
  * signed
  * long
  * short
  * const

*** 

### Character
Let's start with the smallest type, char. It is guaranteed to be large enough to hold one byte's worth, and it's always fixed size. If people will tell you that a byte is always eight bits, better think again. Every popular hardware architecture indeed uses eight-bit bytes, but there are exceptions, so don't make assumptions if you want to write portable code. On x86, since a byte is eight bits, a char (unsigned) can hold values from 0 to 255, that is 28. If a char is signed, then it can hold values from -128 to 127. But the name may mislead you: a character can indeed be stored in a char, but if you're using Unicode, we're talking multibyte there and you'll have to use wchar_t, but more on that later.

char and unsigned char have no diferences. Actually on many platforms unqualified char is signed. The same way -- e.g. if you have an 8-bit char, 7 bits can be used for magnitude and 1 for sign. So an unsigned char might range from 0 to 255, whilst a signed char might range from -128 to 127 (for example).

In my Fedora Linux:

{% highlight c %}
/* char.c */
#include <stdio.h>
/* Exploring data types */

int main()
{
  char c;
  signed char sc;
  unsigned char uc;

  /* Assignments */
  c = 'a';
  sc = 'b';
  uc = 'c';

  /* Print them as Characters */
  printf("c = %c\n", c);
  printf("sc = %c\n", sc);
  printf("uc = %c\n", uc);

  /* Print them as Integers */
  printf("c = %i\n", c);
  printf("sc = %i\n", sc);
  printf("uc = %i\n", uc);

  return 0;
}
{% endhighlight %}

Compiling and running it:

{% highlight shell %}
~(gomix) gcc char.c -o char
~(gomix) ./char
c = a
sc = b
uc = c
c = 97
sc = 98
uc = 99
{% endhighlight %}

### Integer
There are the following integer types available in the C Language:

* short int
* unsigned short int
* int
* unsigned int
* long int
* unsigned long int


{% highlight c %}

{% endhighlight %}

In my Fedora Linux:

{% highlight c %}
short s;
unsigned short us;
int i;
unsigned u;
long l;
unsigned long ul;
float f;
double d;
long double ld;
const int ci;
{% endhighlight %}



## limits.h

In Fedora, glibc-headers includes limits.h header file which you can browse ot the actual limits of data types for your architectura.


