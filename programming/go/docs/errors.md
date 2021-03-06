---
layout: programming
title: Go Docs Errors
lang: en
---
{% include go-logo-float-right.html %}

# Errors

A simple example on how to return a custom error from a function.

{% highlight go linenos %}
package grains

import "errors"

// Square computes grains numbers on each square of a chessboard
// where it each amount doubles previous amount existing on previous square
func Square(n int) (uint64, error) {
  var grains uint64
	
  // Zero or negative numbers through an error
  if n <= 0 || n > 64 {
    return 0, errors.New("Square: cannot process such number")
  }

  // Positive gets calculated
  for i := 1; i <= n; i++ {
    if i > 1 {
      grains = 2 * grains
    } else {
      grains = 1
    }
  }
  return grains, nil
}
{% endhighlight %}

## Guides
<ul>
    <li><a href="https://medium.com/gett-engineering/error-handling-in-go-53b8a7112d04">Error Handling in Go</a></li>
</ul>

