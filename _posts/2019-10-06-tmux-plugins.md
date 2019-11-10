---
layout: post
title:  "tmux plugins (en)"
author: gomix
tags: [foss]
lang: en
comments: true
---
<img src="/assets/images/tmux/tmux-logo-dark-medium.png" 
     alt="tmux Terminal Multiplexer logo" 
     class="img-fluid float-right m-2"
    width="260px">

# Just discovered tmux plugins

As always in my carrer i've been pushed by the needs to solve and specific problem, this time i was just about to upgrade my Fedora 29 to Fedora 30, i'm already late! Then i was to reboot and proceed and then accounted my tmux list-sessions to try to recover them later on. Then it came to me the idea that there should be a sort of "restore my session" support for tmux, and as almost always happens with FOSS,  we have a solution and searching the net the way to go.

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

{% highlight shell %}
~(gomix) dnf search tmux
...
======================================= Name Exactly Matched: tmux =======================================
tmux.x86_64 : A terminal multiplexer
====================================== Name & Summary Matched: tmux ======================================
tmux-powerline.noarch : Powerline for tmux
python2-libtmux.noarch : Scripting library for tmux
python3-libtmux.noarch : Scripting library for tmux
tmuxinator-doc.noarch : Documentation for tmuxinator
tmuxinator.noarch : Create and manage complex tmux sessions easily
tmux-top.x86_64 : Monitoring information for your tmux status line.
{% endhighlight %}

We don't really have a first support for tmux plugins from Fedora packages, perhaps you can start packaging some to get involved in Fedora.

Moving on into my cruise to F29 -> F30 upgrade and "restore my sessions in tmux", the tmux plugins needed to solve the problem are:

* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
* [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

So, i need to install them, how? We know already know we can't from Fedora official repos, what about third party repos? After a quick search on third party common dnf/yum repos, i don't find any, so i move forward with [Tmux Plugin Manager (tpm)](https://github.com/tmux-plugins/tpm) instructions.

{% highlight shell %}
~(gomix) git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
Cloning into '/home/gomix/.tmux/plugins/tpm'...
remote: Enumerating objects: 904, done.
remote: Total 904 (delta 0), reused 0 (delta 0), pack-reused 904
Receiving objects: 100% (904/904), 189.41 KiB | 132.00 KiB/s, done.
Resolving deltas: 100% (577/577), done.
{% endhighlight %}

My ~/.tmux.conf added lines:

{% highlight shell %}
...
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'
{% endhighlight %}

Since tmux is running, i do have to reload the configuration:

{% highlight shell %}
~(gomix) tmux source ~/.tmux.conf
{% endhighlight %}

## Installing plugins with tpm
    
Add new plugin to ~/.tmux.conf with set -g @plugin '...'

{% highlight shell %}
...
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
{% endhighlight %}

Press prefix + I (capital i, as in Install) to fetch the plugins in a tmux session. You can see the sources are installed looking at your configured tmux plugins directory:

{% highlight shell %}
~(gomix) ls ~/.tmux/plugins/ 
tmux-continuum  tmux-resurrect  tmux-sensible  tpm
{% endhighlight %}

Final setup just needs another configuration line added:

{% highlight shell %}
set -g @continuum-restore 'on'
{% endhighlight %}

## Usage

With this configuration, there’s no need to do anything manually. Your tmux sessions will be automatically saved every 15 minutes and automatically restored when tmux is started (e.g. after a reboot). You can manually save with prefix-Ctrl-s and manually restore with prefix-Ctrl-r if desired.

_Guillermo_

