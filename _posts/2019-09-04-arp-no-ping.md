---
layout: post
title:  "arp but no ping"
author: gomix
tags: [linux, debug, networking]
lang: en
---
# arp but no ping

This post is yet another case of _what's going on here_ type of situation.

The phenomena:

## arp works, but no ping
{% highlight shell %}
# arp -d 10.199.101.103       <-- removing specific address
# arp -n | grep 103           <-- just proving is not there 
# ping -w1 -c1 10.199.101.103 <-- using ping to force arp resolution 
<!--more-->
PING 10.199.101.103 (10.199.101.103) 56(84) bytes of data.

--- 10.199.101.103 ping statistics ---
2 packets transmitted, 0 received, 100% packet loss, time 999ms <-- no echo response

# arp -n | grep 103          
10.199.101.103           ether   ca:ca:ca:ca:ca:a3   C  <-- worked
{% endhighlight %}

## Observations

1. Ethernet packets are passing through the network.
2. ICMP ping is not working.

## Possibilities and expected behaviour

In our setup there's no packet filtering at the destination IP, so we expect ICMP ping to work.

**Target host**
{% highlight shell %}
# iptables -L INPUT -nv
Chain INPUT (policy ACCEPT 141K packets, 11M bytes)
 pkts bytes target     prot opt in     out     source               destination
{% endhighlight %}

And here comes the obvious thing to ask about, what's the net setup at the target besides net filtering.

{% highlight shell %}
# ip l l
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: em1: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq master bond0 state UP mode DEFAULT group default qlen 1000
    link/ether d4:ae:52:c5:e3:2a brd ff:ff:ff:ff:ff:ff
3: em2: <BROADCAST,MULTICAST> mtu 1500 qdisc mq master on0445daeca7cf4 state DOWN mode DEFAULT group default qlen 1000
    link/ether d4:ae:52:c5:e3:2b brd ff:ff:ff:ff:ff:ff
19: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc noqueue master ovirtmgmt state UP mode DEFAULT group default qlen 1000
    link/ether d4:ae:52:c5:e3:2a brd ff:ff:ff:ff:ff:ff
20: ovirtmgmt: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether d4:ae:52:c5:e3:2a brd ff:ff:ff:ff:ff:ff
21: on0445daeca7cf4: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default qlen 1000
    link/ether d4:ae:52:c5:e3:2b brd ff:ff:ff:ff:ff:ff
22: docker0: <BROADCAST,MULTICAST> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether 02:42:35:2c:4a:03 brd ff:ff:ff:ff:ff:ff
23: tap2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN mode DEFAULT group default qlen 100
    link/ether 86:21:80:09:ae:26 brd ff:ff:ff:ff:ff:ff
24: ;vdsmdummy;: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether e6:06:a2:62:70:0f brd ff:ff:ff:ff:ff:ff
25: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master ovirtmgmt state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:ca:ca:ca:ca:a0 brd ff:ff:ff:ff:ff:ff
26: vnet1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master ovirtmgmt state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:ca:ca:ca:ca:a1 brd ff:ff:ff:ff:ff:ff
27: vnet2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master ovirtmgmt state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:ca:ca:ca:ca:a2 brd ff:ff:ff:ff:ff:ff
28: vnet3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master ovirtmgmt state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:ca:ca:ca:ca:a3 brd ff:ff:ff:ff:ff:ff
29: vnet4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master ovirtmgmt state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:ca:ca:ca:ca:a4 brd ff:ff:ff:ff:ff:ff
{% endhighlight %}

Ok, this not a so simple case. Lets capture some net traffic at the target host.

{% highlight shell %}
# tshark -i any arp -w capture
...
# tshark -r capture 
Running as user "root" and group "root". This could be dangerous.
  1 0.000000000 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  2 0.000000000 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  3 0.000018656 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  4 0.000028880 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  5 0.000036139 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  6 0.000043661 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  7 0.000055125 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  8 0.000000000 02:2d:69:1b:38:48 ->              ARP 62 Who has 10.199.101.103?  Tell 10.199.101.55
  9 0.000208100 ca:ca:ca:ca:ca:a3 ->              ARP 44 10.199.101.103 is at ca:ca:ca:ca:ca:a3
 10 0.000226461 ca:ca:ca:ca:ca:a3 ->              ARP 44 10.199.101.103 is at ca:ca:ca:ca:ca:a3
 11 0.000228426 ca:ca:ca:ca:ca:a3 ->              ARP 44 10.199.101.103 is at ca:ca:ca:ca:ca:a3

# tshark -r capture -V | less 
...
    Sender MAC address: ca:ca:ca:ca:ca:a3 (ca:ca:ca:ca:ca:a3)
    Sender IP address: 10.199.101.103 (10.199.101.103)
    Target MAC address: 02:2d:69:1b:38:48 (02:2d:69:1b:38:48)
    Target IP address: 10.199.101.55 (10.199.101.55)
...
{% endhighlight %}

There is no doubt ARP is doing its job. Now ICMP turn.

{% highlight shell %}
# tshark -i any icmp -c 2
Running as user "root" and group "root". This could be dangerous.
Capturing on 'any'
  1 0.000000000 10.199.101.55 -> 10.199.101.103 ICMP 100 Echo (ping) request  id=0x1ff5, seq=559/12034, ttl=64
  2 0.000000000 10.199.101.55 -> 10.199.101.103 ICMP 100 Echo (ping) request  id=0x1ff5, seq=559/12034, ttl=64
2 packets captured
{% endhighlight %}

That is enough prove we receive ICMP packets but our host is not responding. Go back to take a look at packet filters more deeply.

At first i reviewed filter INPUT chain:

{% highlight shell %}
# iptables -t filter -L INPUT -nv
Chain INPUT (policy ACCEPT 339K packets, 102M bytes)
 pkts bytes target     prot opt in     out     source               destination
{% endhighlight %}

Is that enough? No.

{% highlight shell %}
# iptables -t filter -L -nv

Chain INPUT (policy ACCEPT 340K packets, 102M bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy DROP 26968 packets, 4749K bytes)
 pkts bytes target     prot opt in     out     source               destination         
26968 4749K DOCKER-ISOLATION  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 DOCKER     all  --  *      docker0  0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     all  --  *      docker0  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  docker0 !docker0  0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     all  --  docker0 docker0  0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 307K packets, 39M bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain DOCKER (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain DOCKER-ISOLATION (1 references)
 pkts bytes target     prot opt in     out     source               destination         
26968 4749K RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           
{% endhighlight %}

What about the other chains and tables in netfilter? Then i started to look closer and found:

{% highlight shell %}
Chain FORWARD (policy DROP 26968 packets, 4749K bytes)
 pkts bytes target     prot opt in     out     source               destination
{% endhighlight %}

Please notice **DROP** as the default policy of the chain.

**Magic solution**
{% highlight shell %}
# iptables -P FORWARD ACCEPT
{% endhighlight %}

Then the ICMP ping started to flow regularly.

{% highlight shell %}
# ping 10.199.101.103
PING 10.199.101.103 (10.199.101.103) 56(84) bytes of data.
64 bytes from 10.199.101.103: icmp_seq=1081 ttl=64 time=0.478 ms
64 bytes from 10.199.101.103: icmp_seq=1082 ttl=64 time=0.411 ms
64 bytes from 10.199.101.103: icmp_seq=1083 ttl=64 time=0.457 ms
64 bytes from 10.199.101.103: icmp_seq=1084 ttl=64 time=0.384 ms
{% endhighlight %}

So yes, there were a packet filter in the middle.

On the why FORWARD policy is DROP is out the scope of this post.
