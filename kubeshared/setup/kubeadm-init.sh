#!/bin/bash

kubeadm init --config /kubeshared/setup/kubeadm-config.yaml | tee /kubeshared/setup/kubeadm-init-log.txt

