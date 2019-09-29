---
layout: programming
title: Go Docs Slices
lang: en
---
{% include go-logo-float-right.html %}

<h1>Slices <span class="badge badge-warning"><< wip</span></h1>

A slice is a dynamically-sized, flexible view into the elements of an array. In practice, slices are much more common than arrays.

The type <span class="badge badge-light">[]T</span> is a slice with elements of type T.

A slice is formed by specifying two indices, a low and high bound, separated by a colon: <span class="badge badge-light">a[low : high]</span>

This selects a half-open range which includes the first element, but excludes the last one.

The following expression creates a slice which includes elements 1 through 3 of a: <code class="badge badge-light">a[1:4]</code>

{% highlight go linenos %}
{% endhighlight %}


