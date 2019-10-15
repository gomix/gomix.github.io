---
layout: programming
title: Go Docs Goroutines
lang: en
---
{% include go-logo-float-right.html %}

# Goroutines

Concurrent programming in many environments is made difficult by the subtleties required to implement correct access to shared variables. 

Go encourages a different approach in which shared values are passed around on **channels** and, in fact, never actively shared by separate threads of execution. Only one goroutine has access to the value at any given time. Data races cannot occur, by design. To encourage this way of thinking we have reduced it to a slogan:

Do not communicate by sharing memory; instead, share memory by communicating.

Although Go’s approach to concurrency originates in Hoare’s Communicating Sequential Processes (CSP), it can also be seen as a type-safe generalization of Unix pipes.
{% highlight go %}
package main

import (
  "fmt"
  "math/cmplx"
)
{% endhighlight %}

# External References and Links
<ul>
  <li><a href="https://blog.golang.org/concurrency-is-not-parallelism">Concurrency is not parallelism</a></li>
  <li><a href="https://medium.com/rungo/achieving-concurrency-in-go-3f84cbf870ca">Achieving Concurrency in Go</a></li>
</ul>
