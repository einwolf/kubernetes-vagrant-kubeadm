#!/bin/bash

# cri-o on RHEL is apparently only supported in OpenShift
# https://github.com/cri-o/cri-o/blob/main/install.md

# OS=CentOS_9_Stream
OS=CentOS_8
VERSION=1.24

curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/devel:kubic:libcontainers:stable.repo

# URL error and doesn't have CentOS_9_Stream version
# curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo
curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:1.24:1.24.6/$OS/devel:kubic:libcontainers:stable:cri-o:1.24:1.24.6.repo

dnf install -y cri-o
systemctl enable --now crio

