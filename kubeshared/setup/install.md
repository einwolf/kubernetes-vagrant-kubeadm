# Kubeadm

Do `vagrant up --no-parallel` so control is configured before worker.

## Install

```bash
# Need to install a Container Runtime Interface (CRI) runtime like containerd or cri-o.
./install-crio.sh
```

```bash
# Install
cp -v etc/sysctl.d/kubernetes.conf /etc/sysctl.d
cp -v etc/yum.repos.d/kubernetes.repo /etc/yum.repos.d/kubernetes.repo

dnf install -y --disableexcludes=kubernetes kubelet kubeadm kubectl
systemctl enable kubelet
```

## Init

```bash
# Config
kubeadm config print init-defaults
# podSubnet is needed for calico
```

```bash
# Init
kubeadm init --config kubeadm-config.yaml
```

## Join

## Reset

Best effort delete the cluster configuration.

```bash
vagrant destroy --force
kubeadm reset
rm -rfv /etc/cni/net.d/*
```
