---
layout: programming
title: Go Tutorial Day 1
lang: en
---
{% include go-logo-float-right.html %}

# Go - tutorial day 1

Installation, follow your OS instructions.

## GOPATH, Go Workspace and Code Organization

Go requires an specific way to organize the code.

By convention, all your code and the imported code should live in a single workspace.
The workspace is just a directory structure on your filesystem pointed by GOPATH environment variable.

In our examples:

{% highlight shell %}
  go
  ├── bin
  ├── pkg
  └── src
{% endhighlight %}

Where:

{% highlight shell %}
  $ echo $GOPATH
  /home/gomix/go
{% endhighlight %}

* *bin*: contains executables binaries.
  * Go builds and installs binaries executables in this directory.
  * All Go programs meant to be executables muts have in the source code an special package called main *main* which defines the entry point of the program in a function called *main()*.

* *src*: contains the Go source files.
  *src* directory tipically contains several source code repos under version control systems with one or more Go packages.
  * Every single source code Go file belongs to a package.
  * Usually new subdirectories are created in the repo for each Go package.

* *pkg*: contains Go package files (.a).
  * All the shared libraries, non executables, are stored en this directory.
  * These libraries (packages) cant be executed directly) since those are no binaries. Usually imported and used by other executables packages.

## Hello World

### Subdirectory

{% highlight shell %}
$ cd go
$ mkdir src/hola
{% endhighlight %}

{% highlight shell %}
/home/gomix/go
├── bin
├── pkg
└── src
    └── hola
{% endhighlight %}

## Source code

*src/hola/hola.go*

{% highlight go %}
package main

import "fmt"

func main() {
	fmt.Println("Hola Go Gomix@Fedora, 世界")
}
{% endhighlight %}

### Running you app

{% highlight shell %}
~(gomix) go run hola                                                                                      
Hola Go Gomix@Fedora, 世界 
{% endhighlight %}

### Building the binary

*go run* compiles and execute but do not produces a binary. To produce a binary use *go build*:

{% highlight shell %}
~(gomix) go build hola                                                                                    
~(gomix) ls                                                                                               
bin  hola  pkg  src                                                                     
~(gomix) ./hola                                                                                           
Hola Go Gomix@Fedora, 世界  
{% endhighlight %}

### Building and installation in bin

Simillar to *go build* but result gets installed in bin.
{% highlight shell %}
$ go install hola
{% endhighlight %}

{% highlight shell %}
.
├── bin
│   └── hola
├── pkg
└── src
    └── hola
        └── hola.go
{% endhighlight %}
