#!/bin/bash

kubeadm config images pull
kubeadm init --config /kubeshared/setup/kubeadm-config.yaml

