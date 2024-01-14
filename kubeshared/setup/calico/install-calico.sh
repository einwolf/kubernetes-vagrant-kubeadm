#!/bin/bash

# calico needs podSubnet set in kubeadm config and its config.

# kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/tigera-operator.yaml
# kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/custom-resources.yaml

kubectl create -f /kubeshared/setup/calico/tigera-operator.yaml
kubectl create -f /kubeshared/setup/calico/custom-resources.yaml
