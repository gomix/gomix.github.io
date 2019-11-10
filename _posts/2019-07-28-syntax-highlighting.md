---
layout: post
title: Testing syntax highlighting
author: gomix
lang: en
comments: true
---

<div>
 <a href="{{ page.url }}">
  <h1>{{ page.title }}</h1>
 </a>
</div>

## Ruby
{% highlight ruby %}
app = App.new('a', False)
very_long_line = "Hello my friend, this very long string assignment is to text horizontal scrolling in the view, in particular, on mobile devices"
{% endhighlight %}

## Python
{% highlight python %}
x = ('a', 1, False)
{% endhighlight %}

## Go

{% highlight go %}
package main

import "fmt"

func main() {
	fmt.Println("Hello, 世界")
{% endhighlight %}

## C

{% highlight c %}
#include <stdio.h>

int main() {
   /* my first program in C */
   printf("Hello, World! \n");
   
   return 0;
}
{% endhighlight %}
