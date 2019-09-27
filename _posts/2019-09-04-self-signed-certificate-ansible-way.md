---
layout: post
title:  "Self Signed SSL Certificate: Ansible Way"
author: gomix
tags: [linux, security, automation]
---
{% include ansible-logo-float-right.html %}

# Self Signed SSL Certificate, the Ansible Way

This post will be just Ansible code, the purpose is to let code speak itself, if you already know some about Ansible, you should be good to go, if not, well follow a begginers tutorial and then comeback.
<!--more-->

{% highlight yml linenos %}
    - name: Create SSL directories
      file:
        path: {% raw %}"{{ item }}"{% endraw %}
        state: directory
      loop:
        - /etc/ssl/crt
        - /etc/ssl/csr 
        - /etc/ssl/private

    - name: Generate an OpenSSL private key with the default values (4096 bits, RSA)
      openssl_privatekey:
        path: /etc/ssl/private/ansible.com.pem
        type: RSA

    - name: Generate an OpenSSL Certificate Signing Request
      openssl_csr:
        path: /etc/ssl/csr/www.ansible.com.csr
        privatekey_path: /etc/ssl/private/ansible.com.pem
        country_name: CL
        organization_name: Ansible
        email_address: jdoe@ansible.com
        common_name: ansible.com
        subject_alt_name: 'DNS:www.ansible.com,DNS:m.ansible.com'

    - name: Generate a Self Signed OpenSSL certificate
      openssl_certificate:
        path: /etc/ssl/crt/ansible.com.crt
        privatekey_path: /etc/ssl/private/ansible.com.pem
        csr_path: /etc/ssl/csr/www.ansible.com.csr
        provider: selfsigned
{% endhighlight %}

I included a couple of alternate names in the certificate for your benefit. 

Please look a the references for further documentation and possible uses.

## References

**Ansible Modules**
1. [openssl_privatekey](https://docs.ansible.com/ansible/latest/modules/openssl_privatekey_module.html)
1. [openssl_csr](https://docs.ansible.com/ansible/latest/modules/openssl_csr_module.html)
1. [openssl_certificate](https://docs.ansible.com/ansible/latest/modules/openssl_certificate_module.html)

