---
layout: programming
title: Go Docs Packages
lang: en
---
{% include go-logo-float-right.html %}

# Packages

Every Go program is made up of packages.

Programs start running in package main.

This program is using the packages with import paths "fmt" and "math/rand".

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


By convention, the package name is the same as the last element of the import path. For instance, the "math/rand" package comprises files that begin with the statement package rand.

Note: The environment in which these programs are executed is deterministic, so each time you run the example program rand.Intn will return the same number.

(To see a different number, seed the number generator; see rand.Seed. Time is constant in the playground, so you will need to use something else as the seed.) 

## Related pages
* [My First Package](/programming/go/docs/my_first_package.html) <span class="badge badge-primary"><< new</span>
