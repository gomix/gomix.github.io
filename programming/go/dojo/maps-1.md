---
layout: programming
title: Go Maps I
lang: en
---
{% include go-logo-float-right.html %}

# Go Maps

A map maps keys to values.

* The zero value of a map is nil. 
* A nil map has no keys, nor can keys be added.

# Examples

Some examples of working code;

{% highlight go %}
package acronym

// Abbreviate function.
func Abbreviate(s string) string {
  // Solution based on Go Maps
  // map
  //   key   - string
  //   value - string
  m := make(map[string]string)

  m["Portable Network Graphics"] = "PNG"
  m["Ruby on Rails"] = "ROR"
  m["First In, First Out"] = "FIFO"
  m["GNU Image Manipulation Program"] = "GIMP"
  m["Complementary metal-oxide semiconductor"] = "CMOS"
  m["Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"] = "ROTFLSHTMDCOALM"
  m["Something - I made up from thin air"] = "SIMUFTA"
  m["Halley's Comet"] = "HC"
  m["The Road _Not_ Taken"] = "TRNT"

  return m[s]
}
{% endhighlight %}

