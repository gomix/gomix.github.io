---
layout: default
title: Running Fedora with Podman
lang: en
---
{% include podman-logo-float-right.html %}
# Running Fedora with Podman

In this quick example, im trying to show you how easy is to have a Fedora latest running container for playing around with it. I won't cover installation, use your package manager (i.e. dnf/yum install podman, etc).

> You don't need to be root!

{% highlight shell %}
# podman run -it --name fedora fedora  /bin/bash
Trying to pull docker.io/library/fedora...
Getting image source signatures
Copying blob d318c91bf2a8 done
Copying config f0858ad3fe done
Writing manifest to image destination
Storing signatures
[root@eeefdbdfef0b /]# cat /etc/fedora-release 
Fedora release 31 (Thirty One)
{% endhighlight %}

After this quick command, and i believe simple, podman has downloaded the latest fedora image from docker.io, created a running container, gave it a name for easier handling and started an interactive bash shell, the command that we specified at the end of it.

-it flags meaning, -i interactive, keep stdin open, -t allocatte a pseudo tty.

If we do exit the shell now, container will be stopped (exited) but not removed.

{% highlight shell %}
$ podman ps -a
CONTAINER ID  IMAGE                            COMMAND    CREATED        STATUS                   PORTS  NAMES
45a22b919c21  docker.io/library/fedora:latest  /bin/bash  9 minutes ago  Exited (0) 1 second ago         fedora
{% endhighlight %}

Since our container has stopped, let's start it again.

{% highlight shell %}
# podman start fedora
fedora
 podman ps -a
CONTAINER ID  IMAGE                            COMMAND    CREATED         STATUS             PORTS  NAMES
45a22b919c21  docker.io/library/fedora:latest  /bin/bash  13 minutes ago  Up 31 seconds ago         fedora
{% endhighlight %}

It's running again, however, detached from our terminal, then what? Let's attach our terminal to it!

{% highlight shell %}
# podman attach fedora
[root@45a22b919c21 /]# cat /etc/fedora-release 
Fedora release 30 (Thirty)
[root@45a22b919c21 /]# 
{% endhighlight %}

I must admit, that was intuitive, even for beginners.

And finally, if you want to remove it:

{% highlight shell %}
# podman rm fedora
eeefdbdfef0bd4034fae29ab0ff85f5ea6d2131c297dcdb90fc204bb1ff5dade
{% endhighlight %}

_Gomix_
