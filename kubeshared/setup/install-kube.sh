#!/bin/bash

cd /kubeshared/setup
cp -v etc/sysctl.d/kubernetes.conf /etc/sysctl.d/
cp -v etc/modules-load.d/kubernetes.conf /etc/modules-load.d/
cp -v etc/yum.repos.d/kubernetes.repo /etc/yum.repos.d/kubernetes.repo

modprobe br_netfilter
sysctl --system

dnf install -y --disableexcludes=kubernetes kubelet kubeadm kubectl
systemctl enable kubelet
