---
layout: programming
title: CCplus
lang: en
---
{% include ccpp-logo-float-right.html %}
# C/C++ Day 01 in Fedora

Install the compiler:

{% highlight shell %}
# dnf install gcc
{% endhighlight %}

## Helo World 

Fire your favorite editor and create hello_world.c, the source code:

{% highlight c %}
#include <stdio.h>
/* This is a comment */

int main()
{
    printf("Hello, world!\n");
    return 0;
}
{% endhighlight %}


## Compiling my code

{% highlight shell %}
$ gcc hello_world.c 
$ ls
a.out  hello_world.c
{% endhighlight %}

## Executing it
{% highlight shell %}
$ ls
a.out  hello_world.c
$ ./a.out 
Helo, World!
{% endhighlight %}

## Naming the binary

Using -o option we can name the resulting binary.

{% highlight shell %}
$ gcc hello_world.c -o hello_world
$ ls
hello_world  hello_world.c
$ ./hello_world 
Helo, World!
{% endhighlight %}

## Dissecting the program

{% highlight c linenos  %}
#include <stdio.h>
/* This is a comment */

int main()
{
    printf("Hello, world!\n");
    return 0;
}
{% endhighlight %}


