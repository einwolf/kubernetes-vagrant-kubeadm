#!/bin/bash

# Remove the vagrant 192.168.121.1 nameserver
sed -i "s/^nameserver.*192\.168\.121\.[0-9]+*//" /etc/resolv.conf
