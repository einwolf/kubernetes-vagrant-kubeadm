# Readme

Kubernetes cluster
* host: fedora
* provider: libvirt through fedora vagrant packages
* Almalinux 9
* kubeadm

STATUS: paused

DNS is not working between eth0 (vagrant nat) and eth1 (bridged br0).

## Vagrant defaults

To set libvirt default storage pool add to `~/.vagrant.d/Vagrantfile`.

```ruby
Vagrant.configure("2") do |config|
  config.vm.provider :libvirt do |libvirt|
    libvirt.storage_pool_name = "local_pool"
  end
end
```
