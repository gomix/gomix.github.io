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

Line 1: The first one is a preprocessor directive which asks for the stdio.h file, which provides the definition for the printf function. Header files are files that usually contain various definitions (functions, variables...) and make .c files less cluttered. All what a source file (.c) will need is an #include statement and possibly an argument to the linker. Everything that's defined in the included header file will be available in your source code.

Line 2: It is a single line comment, delimited by \/*  */

Line 3: It is a blank line, also ignored as comments.

Line 5,8: The curly braces that begin and end the main function delimit its' execution block, that is, what happens in main(), stays in main(). You may have noticed the semicolons at the end of the statements: they are mandatory as a sign that the current statement ended there, but they are not to be used in preprocessor directives as #include.

Line 4: main() is a mandatory function in every C program. As the name states, the main activity will happen here, regardless of how many functions you have defined. int main() means that this function does not have any arguments (the empty parentheses) and that it returns an integer (the initial int). 

Line 6: Here is the printf function, which takes our text as an argument and displays it. "\n" means "newline" and it's the equivalent of using the Enter key (or ^M). It is called an escape sequence and all escape sequences in C begin with "\". 

Line 7: return 0 tells the compiler that everything is ok and the execution of main() function ends there. That is because 0 is the code for successful execution, while values greater than 0 (integers) is an indication that something went wrong. 

Line 5,8: The curly braces that begin and end the main function delimit its' execution block, that is, what happens in main(), stays in main(). You may have noticed the semicolons at the end of the statements: they are mandatory as a sign that the current statement ended there, but they are not to be used in preprocessor directives as #include.
