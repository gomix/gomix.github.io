---
layout: programming
title: Go Docs TDD Day 1
lang: en
---
{% include go-logo-float-right.html %}

# TDD with Go

Prerequisites:

* [Testing Day 1](day_1.html): we will start from there. 

## Test Code Goes First

Let create the test **first**, that's the idea, design and create the test code, of course, it will fail. Remember, we must got Red, Green, Refactor cycle.

**bye_test.go**
{% highlight go %}
package main

import "testing"

func TestBye(t *testing.T) {
  got := Bye()
  want := "Bye, world"

  if got != want {
    t.Errorf("got '%s' want '%s'", got, want)
  }
}
{% endhighlight %}

{% highlight shell %}
$ go test
# gochess-00 [gochess-00.test]
./bye_test.go:6:10: undefined: Bye
FAIL    gochess-00 [build failed]
{% endhighlight %}

At this point it fails because the function do not even exists, let start code and make our test pass.

## Production Code

{% highlight go %}

package main

import (
   "fmt"
   hello "gochess-00/hello"
)

func Hello() string {
  return "Hello, world"
}

func Bye() string {
  return "Bye, world"
}

func main() {
  fmt.Println(Hello())
}
{% endhighlight %}

Test it again:

{% highlight shell %}
$ go test
PASS
ok      gochess-00      0.003s
{% endhighlight %}

Voilá!!! It's a very simple example but it gives the basics of TDD on Go language. Start from the test, it fails, implement the production code and make it pass.

After this, it comes the time to refactor the code, what it means, it subjects to improvements.

