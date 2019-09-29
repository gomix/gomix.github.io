---
layout: default
title: Containers
lang: en
---
Some notes about Buildah.

# Introduction
Buildah is designed to create a rootfs directory on disk and allow other tools to populate the directory, then create the JSON file. Finally, Buildah creates the OCI image and push it to a container registry where it could be used by any container engine, like Docker, Podman, CRI-O, or another Buildah.

Buildah also supports Dockerfile, since we know the bulk of people building containers have created Dockerfiles.

## Tutorials
* [Building my first container with Buildah](my-first-container.html) <span class="badge badge-primary"><< new</span>


[README](README.html)


