---
layout: post
title:  "wget fails, curl works"
author: gomix
tags: [linux, debug, http]
---
# Wget fails, Curl works 

This post is about a simple case of _what's going on here_ type of situation.

The phenomena:

## curl works
{% highlight shell %}
[root@9479f6c84cfc /]# curl http://localhost                                                              
<!--more-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"><html><he
ad>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
                <title>Apache HTTP Server Test Page powered by CentOS</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link href="/noindex/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="noindex/css/open-sans.css" type="text/css" />

<style type="text/css"><!--    
{% endhighlight %}

## wget fails
{% highlight shell %}
[root@9479f6c84cfc /]# wget http://localhost   
--2019-08-28 20:08:15--  http://localhost/
Resolving localhost (localhost)... ::1, 127.0.0.1
Connecting to localhost (localhost)|::1|:80... connected.
HTTP request sent, awaiting response... 403 Forbidden
2019-08-28 20:08:15 ERROR 403: Forbidden.
{% endhighlight %}

## Lets get more information

Let try to see the http request details:

### `curl --verbose`
{% highlight shell %}
[root@9479f6c84cfc /]# curl --verbose  http://localhost                                                   
* About to connect() to localhost port 80 (#0)
*   Trying ::1...
* Connected to localhost (::1) port 80 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.29.0
> Host: localhost
> Accept: */*
> 
< HTTP/1.1 403 Forbidden
< Date: Wed, 28 Aug 2019 20:11:02 GMT
< Server: Apache/2.4.6 (CentOS)
< Last-Modified: Thu, 16 Oct 2014 13:20:58 GMT
< ETag: "1321-5058a1e728280"
< Accept-Ranges: bytes
< Content-Length: 4897
< Content-Type: text/html; charset=UTF-8
< 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"><html><he
ad>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
                <title>Apache HTTP Server Test Page powered by CentOS</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link href="/noindex/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="noindex/css/open-sans.css" type="text/css" />

<style type="text/css"><!--              

body {
  font-family: "Open Sans", Helvetica, sans-serif;
  font-weight: 100;
  color: #ccc;
  background: rgba(10, 24, 55, 1);
  font-size: 16px;
}
... (content suppresed)
{% endhighlight %}

### `wget --debug`
{% highlight shell %}
[root@9479f6c84cfc /]# wget --debug  http://localhost                                                     
DEBUG output created by Wget 1.14 on linux-gnu.

URI encoding = 'ANSI_X3.4-1968'
Converted file name 'index.html' (UTF-8) -> 'index.html' (ANSI_X3.4-1968)
Converted file name 'index.html' (UTF-8) -> 'index.html' (ANSI_X3.4-1968)
--2019-08-28 20:14:28--  http://localhost/
Resolving localhost (localhost)... ::1, 127.0.0.1
Caching localhost => ::1 127.0.0.1
Connecting to localhost (localhost)|::1|:80... connected.
Created socket 3.
Releasing 0x000000000169d4d0 (new refcount 1).

---request begin---
GET / HTTP/1.1
User-Agent: Wget/1.14 (linux-gnu)
Accept: */*
Host: localhost
Connection: Keep-Alive

---request end---
HTTP request sent, awaiting response... 
---response begin---
HTTP/1.1 403 Forbidden
Date: Wed, 28 Aug 2019 20:14:28 GMT
Server: Apache/2.4.6 (CentOS)
Last-Modified: Thu, 16 Oct 2014 13:20:58 GMT
ETag: "1321-5058a1e728280"
Accept-Ranges: bytes
Content-Length: 4897
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8

---response end---
403 Forbidden
Registered socket 3 for persistent reuse.
URI content encoding = 'UTF-8'
Disabling further reuse of socket 3.
Closed fd 3
2019-08-28 20:14:28 ERROR 403: Forbidden.
{% endhighlight %}

## Pay attention and read

Actually this case is no bug at all or missbehaviour of the web server, let review some details:

1. Both wget and curl reports HTTP response status code 403 Forbidden.
2. curl show some html content.
3. wget does not show such content, so the issue is with wget behaviour.

Reading further about wget:

       --content-on-error
           If this is set to on, wget will not skip the content when the server responds with a http
           status code that indicates error.

So voilá, this is no mistery, just add `--content-on-error` option to get the same content as curl does.


{% highlight shell %}
[root@9479f6c84cfc ansible]#  wget --content-on-error -O - http://localhost | head
--2019-08-29 03:55:32--  http://localhost/
Resolving localhost (localhost)... ::1, 127.0.0.1
Connecting to localhost (localhost)|::1|:80... connected.
HTTP request sent, awaiting response... 403 Forbidden
Saving to: 'STDOUT'

100%[================================================================>] 4,897       --.-K/s   in 0s      

2019-08-29 03:55:32 ERROR 403: Forbidden.

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"><html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
                <title>Apache HTTP Server Test Page powered by CentOS</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link href="/noindex/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="noindex/css/open-sans.css" type="text/css" />

<style type="text/css"><!--         
{% endhighlight  %}
