---
layout: programming
title: Go Docs My First Package
lang: en
---
{% include go-logo-float-right.html %}
# My First Package

One first Go form to keep our code DRY are functions, second one, packages.

This chapter is about creating our first package so we can reuse it from any other Go program in our system.


# Code organization
We are going to use the same hello world program but exporting it to an independente package.

{% highlight shell %}
    ~(gomix) tree -L 2 .
    .
    ├── bin
    ├── pkg
    │   └── linux_amd64
    └── src
        └── hello
            └── main.go
{% endhighlight %}

# Our executable code

{% highlight go %}
    package main                                                                                              

    import (                                                                                                  
       "fmt"                                                                                                  
       hello "hello/hello"                                                                                    
      )                                                                                                       

    func main() {                                                                                             
      fmt.Println(hello.SayHello())                                                                           
    }  
{% endhighlight %}

1.  **import**: we will import a package under the same tree with the same name **hello**.
2.  We have replace the string to be printed in our main function with a function call imported from the hello packg: **SayHello()**.

# Our Package, the where

In the same directory of our hello project, lets create a new subdirectory called **hello** with the folllowing source code in the source file **hello.go**:

{% highlight shell %}
    ├── hello
        ├── hello
        │   └── hello.go
        └── main.go
{% endhighlight %}

We have a simple design, **main**, the binary loads **hello** package in order to call an exported function in it to achieve the same result of the original program. The benefit, any other Go program could use it.

# Our Package, the code

{% highlight go %}
    package hello                                                                                             
    func SayHello() string {                                                                                  
      return("Hello Go Gomix@Fedora, 世界")                                                                   
    } 
{% endhighlight %}

1. First line we declared the name of our package: **hello**
2. We have create a simple function **SayHello**.
 * The first letter in the name **must be** uppercase in order to be exported.
        expuesta al exterior.

# Package building and installation

{% highlight shell %}
    $ go install hello/hello
    $ tree -L 3 pkg/
    pkg/
    └── linux_amd64
        ├── github.com
        ├── gochess-00
        │   └── hello.a
        ├── golang.org
        │   └── x
        └── hello
            └── hello.a     <- pkg compiled
{% endhighlight %}

# Sample run output

{% highlight shell %}
    $ go run src/hello/main.go 
    Hello Go Gomix@Fedora, 世界
{% endhighlight %}

Voilá!

Even i did simplified a lot, i think you have a base ground from where to start and move forward creating your own Go packages and reuse them effectivelly following one of the major mantras of software development: reuse the code, DRY.

