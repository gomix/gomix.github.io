---
layout: post
title:  "tmux plugins (es)"
author: gomix
tags: [foss]
lang: es
---
<img src="/assets/images/tmux/tmux-logo-dark-medium.png" 
     alt="tmux Terminal Multiplexer logo" 
     class="img-fluid float-right m-2"
    width="260px">

# Descubriendo los plugins de tmux

Como siempre en mi carrera, ocurre que se presenta la necesidad de resolver un problema específico, en esta ocasión estaba por actualizar mi Fedora 29 a Fedora 30, ya estoy algo retrasado! Estaba por reiniciar y proceder y me acordé de mis sesiones tmux activas y pensaba de si existía alguna manera de recuperarlas. Entonces se ocurrió la idea de que debería existir algún tipo de soporte para "restaurar mi sesión" en tmux y como suele ocurrir muy frecuentemente en el mundo del software libre, encontré solución buscando en la red, descubrí los plugins tmux:

<!--more-->
* [tmux plugins at github](https://github.com/tmux-plugins)

Si usted como yo, es nuevo con los plutins de tmux,  comience por revisar la versión de tmux instalada. En mi caso en F29 obtengo:

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

Como pude verificar en el sitio principal de tmux en github, tenemos en F29 una versión suficientemente reciente. También, antes de intentar instalar por otros métodos, hice una búsqueda en los repos dnf:

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

No tenemos realmente un soporte de primer nivel para los plugins tmux en los paquetes Fedora, tal vez usted pueda iniciar su proyecto de empaquetamiento en Fedora.

Descartando los repos dnf como método de instalación y continuando con mi proceso de actualización F29 -> F30, los plugins que necesitaba para resolver el asunto son:

* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
* [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

Entonces, a instalar. Cómo? Ya sabemos que no podemos desde los repos oficiales Fedora. Qué tal desde repos de terceros? Después de una búsqueda rápida en los repos comunes de terceros para Fedora, no encontré ningún paquete que me ayudara, de allí que decidí seguir las instrucciones en [Tmux Plugin Manager (tpm)](https://github.com/tmux-plugins/tpm) para avanzar.

{% highlight shell %}
~(gomix) git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
Cloning into '/home/gomix/.tmux/plugins/tpm'...
remote: Enumerating objects: 904, done.
remote: Total 904 (delta 0), reused 0 (delta 0), pack-reused 904
Receiving objects: 100% (904/904), 189.41 KiB | 132.00 KiB/s, done.
Resolving deltas: 100% (577/577), done.
{% endhighlight %}

Las líneas que agregué a mi ~/.tmux.conf:

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

Ya que tmux se está ejecutando, debo recargar la configuración (para no cerrar mis sesiones)::

{% highlight shell %}
~(gomix) tmux source ~/.tmux.conf
{% endhighlight %}

## Instalando plugins con tpm
    
Agregue el nuevo plugin a ~/.tmux.conf con set -g @plugin '...'

{% highlight shell %}
...
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
{% endhighlight %}

Presione su prefijo + I (I mayúscula) para descargar los plugins en la sesión tmux. Puede ver los fuentes descargados e instalados en el directorio configurado de tmux:

{% highlight shell %}
~(gomix) ls ~/.tmux/plugins/ 
tmux-continuum  tmux-resurrect  tmux-sensible  tpm
{% endhighlight %}

El ajuste final es una línea más en el archivo de configuración:

{% highlight shell %}
set -g @continuum-restore 'on'
{% endhighlight %}

## Uso

Con esta configuración no hay necesidad de hacer nada manualmente. Sus sesiones tmux serán automáticamente guardadas cada 15 minutos y automáticamente restauradas cuando tmux se inicie (e.g. después de un reinicio). Usted, si lo desea, puede manualmente forzar guardar y restaurar con prefijo-Ctrl-s y prefijo-Ctrl-r respectivamente.

_Guillermo_

