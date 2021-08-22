---
layout: post
title: One more time, 2021
author: gomix
tags: [foss]
lang: en
comments: true
---
<div>
<a href="{{ page.url }}">
  <img src="/assets/images/redhat/redhat-logo-4-transparent.png" 
     alt="tmux Terminal Multiplexer logo" 
     class="img-fluid float-right m-2"
    width="260px">
  </a>
</div>

<div>
 <a href="{{ page.url }}">
  <h1>{{ page.title }}</h1>
 </a>
</div>

Mucho ha ocurrido desde mi última publicación, Covid-19, Red Hat, República Checa, una pierna rota, OpenShift... No sé por donde empezar así que creo que ni siquiera lo voy a intentar sino resumiendo que ahora vivo en Brno y trabajo para Red Hat y mi principal responsabilidad técnica está asociada directamente con el despliegue y mantenimiento de clusters OpenShift, muchos de ellos, diferentes arquitecturas, tamaños y sabores.

<!--more-->
* [tmux plugins at github](https://github.com/tmux-plugins)

If you are new to tmux plugins, as i am, start by reviewing your tmux version. This is what i get from my F29 installation.

{% highlight shell %}
~(gomix) tmux -V
tmux 2.9a

~(gomix) rpm -qi tmux
Name        : tmux
Version     : 2.9a
Release     : 2.fc29
Architecture: x86_64
Install Date: Sun 09 Jun 2019 09:35:43 AM EDT
Group       : Unspecified
Size        : 827204
License     : ISC and BSD
Signature   : RSA/SHA256, Sun 12 May 2019 09:36:38 PM EDT, Key ID a20aa56b429476b4
Source RPM  : tmux-2.9a-2.fc29.src.rpm
Build Date  : Sun 12 May 2019 09:29:29 PM EDT
Build Host  : buildvm-24.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : https://tmux.github.io/
Bug URL     : https://bugz.fedoraproject.org/tmux
Summary     : A terminal multiplexer
Description :
tmux is a "terminal multiplexer."  It enables a number of terminals (or
windows) to be accessed and controlled from a single terminal.  tmux is
intended to be a simple, modern, BSD-licensed alternative to programs such

{% endhighlight %}

As i can verify from tmux main site at github, we have in F29 a very recent version. Also, before trying to install from other methods, i made a search on dnf repos:

* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)

_Guillermo_

