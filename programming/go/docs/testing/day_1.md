---
layout: programming
title: Go Docs Testing
lang: en
---
{% include go-logo-float-right.html %}

# Testing (Work In Progress)

* [Testing Day 1](day-1.html) <span class="badge badge-primary"><< new</span>


Let's learn by example. 
We will start from a very simple code and separate and test an specific function.

**main.go**
{% highlight go %}
package main

import (
   "fmt"
)

// Function to test
func Hello() string {
  return "Hello, world"
}

func main() {
  fmt.Println(Hello())
}
{% endhighlight %}

In the same src directory of your project, alonside your code, create the test code i a new file:

**hello_test.go**
{% highlight go %}
package main

import "testing"

func TestHello(t *testing.T) {
  got := Hello()
  want := "Hello, world"

  if got != want {
    t.Errorf("got '%s' want '%s'", got, want)
  }
}
{% endhighlight %}

Now, simply,let run our test code using go test command:

{% highlight shell %}
$ pwd
/home/gomix/go/src/gochess-00

$ tree
.
├── hello_test.go
└── main.go

$ go test
PASS
ok      gochess-00      0.002s
{% endhighlight %}

