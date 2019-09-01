---
layout: default
title: Fedora
lang: en
---
{% include fedora-logo-float-right.html %}

# Fedora
My notes on Fedora.

## Upgrading F29 -> F30

First, make sure your Fedora 29 is updated:

{% highlight shell %}
  # dnf upgrade --refresh
{% endhighlight %}

Then, be sure you have installed the dnf-plugin-system-upgrade:

{% highlight shell %}
  # dnf install 'dnf-command(system-upgrade)'
{% endhighlight %}

Start the system upgrade download with DNF:

{% highlight shell %}
  # dnf system-upgrade download --releasever=30
{% endhighlight %}

Reboot and upgrade.

Once the previous command finishes downloading all of the upgrades, your system will be ready for rebooting. To boot your system into the upgrade process, type the following command in a terminal:

{% highlight shell %}
  # dnf system-upgrade reboot
{% endhighlight %}

More details in [Fedora Magazine](https://fedoramagazine.org/upgrading-fedora-29-to-fedora-30/).


