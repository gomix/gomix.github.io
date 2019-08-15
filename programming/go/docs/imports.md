---
layout: programming
title: Go Docs Imports
lang: en
---
{% include go-logo-float-right.html %}

# Imports

This code groups the imports into a parenthesized, "factored" import statement.

{% highlight go %}
package main

import (
	"fmt"
	"math/rand"
)

func main() {
	fmt.Println("My favorite number is", rand.Intn(10))
}
{% endhighlight %}

You can also write multiple import statements, like:

{% highlight go %}
import "fmt"
import "math"
{% endhighlight %}

But it is good style to use the factored import statement. 
