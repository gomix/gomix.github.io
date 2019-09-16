---
layout: default
title: Ansible Kafka Topics
lang: en
---
{% include ansible-logo-float-right.html %}
# Kafka Topics with Ansible

These are some snippets on how you can manage some Topics basic operations on your Apache Kafka with Ansible and command module.


### Create Topics

{% highlight yaml linenos %}
---
- name: Create topics
  hosts: localhost
  vars:
    kafka_topics: /opt/kafka_2.11-1.1.0/bin/kafka-topics.sh 
    kafka_server: 172.16.107.21
    kafka_port: 9093
    kafka: {% raw %}"{{ kafka_server }}:{ { kafka_port }}"{% endraw %}
    zookeeper_server: 172.16.107.21
    zookeeper_port: 2182
    zookeeper: {% raw %}"{{ zookeeper_server }}:{ { zookeeper_port }}"{% endraw %}
    replication_factor: 3
    partitions: 3

  tasks:

    - name: Load CERT topics to create
      include_vars:
        file: ../vars/create_topics.yml

    - name: Create Topics
      command:
        argv: 
          - {% raw %}"{{ kafka_topics }}"{% endraw %}
          - --create
          - --zookeeper
          - {% raw %}"{{ zookeeper }}"{% endraw %}
          - --replication-factor 
          - {% raw %}"{{ replication_factor }}"{% endraw %}
          - --partitions 
          - {% raw %}"{{ partitions }}"{% endraw %}
          - --topic
          - {% raw %}"{{ item }}"{% endraw %}
      loop: {% raw %}"{{ topics }}"{% endraw %}

{% endhighlight %}

**create_topics.yml**
{% highlight yaml linenos %}
---
topics: 
  - ansible-topic-1
  - ansible-topic-2
  - ansible-topic-3

{% endhighlight %}


### List Topics

{% highlight yaml linenos %}
---
- name: List topics
  hosts: localhost
  vars:
    kafka_topics: /opt/kafka_2.11-1.1.0/bin/kafka-topics.sh 
    kafka_server: 172.16.107.21
    kafka_port: 9093
    kafka: {% raw %}"{{ kafka_server }}:{{ kafka_port }}"{% endraw %}
    zookeeper_server: 172.16.107.21
    zookeeper_port: 2182
    zookeeper: {% raw %}"{{ zookeeper_server }}:{{ zookeeper_port }}"{% endraw %}

  tasks:
    - name: List Topics
      command: 
        argv: 
          - {% raw %}"{{ kafka_topics }}"{% endraw %}
          - --list
          - --zookeeper 
          - {% raw %}"{{ zookeeper }}"{% endraw %}

{% endhighlight %}

### Delete Topics

{% highlight yaml linenos %}
---
- name: Delete topics
  hosts: localhost
  vars:
    kafka_topics: /opt/kafka_2.11-1.1.0/bin/kafka-topics.sh 
    kafka_server: 172.16.107.21
    kafka_port: 9093
    kafka: {% raw %}"{{ kafka_server }}:{{ kafka_port }}"{% endraw %}
    zookeeper_server: 172.16.107.21
    zookeeper_port: 2182
    zookeeper: {% raw %}"{{ zookeeper_server }}:{{ zookeeper_port }}"{% endraw %}

  tasks:
    - name: Load CERT topics to create
      include_vars:
        file: ../vars/delete_topics.yml

    - name: Delete Topics
      command:
        argv: 
          - {% raw %}"{{ kafka_topics }}"{% endraw %}
          - --delete
          - --zookeeper
          - {% raw %}"{{ zookeeper }}"{% endraw %}
          - --topic
          - {% raw %}"{{ item }}"{% endraw %}
      loop: {% raw %}"{{ topics }}"{% endraw %}
      register: topics

{% endhighlight %}

**delete_topics.yml**
{% highlight yaml linenos %}
---
topics: 
  - ansible-topic-1
  - ansible-topic-2
  - ansible-topic-3

{% endhighlight %}
