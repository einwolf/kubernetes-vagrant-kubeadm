# -*- mode: ruby -*-
# vi: set ft=ruby :

# hostnames are not set by vm.hostname = xxx
# Needs vagrant reload to provision and fix hostname.

# Default user is vagrant/vagrant
Vagrant.configure("2") do |config|
  # libvirt provider specific
  config.vm.provider :libvirt do |libvirt|
    libvirt.default_prefix = "kubev1-"
  end

  # Don't do host modifications.
  # Kubernetes nodes are bridged and should get dhcp and dns as normal systems.
  config.vm.allow_fstab_modification = false
  config.vm.allow_hosts_modification = false

  # Set vagrant box
  config.vm.box_check_update = false
  config.vm.box = "almalinux/9"
  config.vm.box_version = "9.3.20231118"

  # Set cpu, memory, and other resources that are provider specific
  # config.vm.provider :libvirt do |domain|
  #   domain.memory = 2048
  #   domain.cpus = 2
  #   domain.nested = true
  #   domain.disk_driver :cache => 'none'
  # end

  # config.ssh.forward_agent = true
  # config.ssh.forward_x11 = true
  # config.ssh.keep_alive = true

  # Networking
  # Vagrant requires eth0 to connect to vagrant-libvirt with dhcp/nat.
  # This is how vagrant access vms.
  # vagrant creates/deletes private networks on up/destroy.

  # config.vm.network "public_network", :adapter=>1, type: "dhcp", :bridge => 'en4: Thunderbolt Ethernet'
  # config.vm.network :private_network, :type => "dhcp"

  # eth0 is private nat to vagrant-libvirt and uses dhcp
  # eth1 is public bridged to br0 and uses dhcp
  config.vm.network :public_network, :dev => 'br0', :type => 'bridge'

  # Port forward host 8080 to guest 80
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Port forward host 8080 to guest 80 but restrict ips that can access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Shared directories
  # Default is to rsync the base directory (where Vagrantfile is) to /vagrant
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # Adding more directories uses nfs by default
  # config.vm.synced_folder "./shared1", "/shared1"
  # config.vm.synced_folder "./shared1", "/shared1", type: "rsync"
  config.vm.synced_folder "./kubeshared", "/kubeshared", type: "sshfs"

  # Shell provisioning for all hosts
  config.vm.provision "shell", inline: <<-SHELL
    date > /provision-date.txt
    dnf install -y nano bind-utils
  SHELL

  config.vm.define :kv1control1 do |kv1control1|
    config.vm.hostname = "kv1control1"

    # Set vagrant box
    # control1.vm.box = "almalinux/9"
    # control1.vm.box_version = "9.3.20231118"

    # Set cpu, memory, and other resources that are provider specific
    kv1control1.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
      # domain.nested = true
      domain.disk_driver :cache => 'none'
    end

    # Shared directories
    # kv1control1.vm.synced_folder "./shared1", "/shared1", type: "sshfs"

    # Shell provisioning
    kv1control1.vm.provision "shell", inline: <<-SHELL
      nmcli general hostname "kv1control11"
      systemctl restart NetworkManager
      sudo /kubeshared/setup/setup-vagrant.sh
      sudo /kubeshared/setup/install-kube.sh
      sudo /kubeshared/setup/install-crio.sh
      # sudo /kubeshared/setup/kubeadm-init.sh | tee /kubeshared/setup/kubeadm-init-log.txt
    SHELL

  end

  config.vm.define :kv1worker1 do |kv1worker1|
    config.vm.hostname = "kv1worker1"

    # Set vagrant box
    # worker1.vm.box = "almalinux/9"
    # worker1.vm.box_version = "9.3.20231118"

    # Set cpu, memory, and other resources that are provider specific
    kv1worker1.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
      # domain.nested = true
      domain.disk_driver :cache => 'none'
    end

    # Shared directories
    # kv1worker1.vm.synced_folder "./shared1", "/shared1", type: "sshfs"

    # Shell provisioning
    kv1worker1.vm.provision "shell", inline: <<-SHELL\
      hostnamectl set-hostname "kv1worker1"
      sudo /kubeshared/setup/install-crio.sh
      sudo /kubeshared/setup/install-kube.sh
      sudo /kubeshared/setup/kubeadm-init.sh
    SHELL

  end

  config.vm.define :kv1worker2 do |kv1worker2|
    config.vm.hostname = "kv1worker2"

    # Set vagrant box
    # worker2.vm.box = "almalinux/9"
    # worker2.vm.box_version = "9.3.20231118"

    # Set cpu, memory, and other resources that are provider specific
    kv1worker2.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
      # domain.nested = true
      domain.disk_driver :cache => 'none'
    end

    # Shared directories
    # worker2.vm.synced_folder "./shared1", "/shared1", type: "sshfs"

    # Shell provisioning
    kv1worker2.vm.provision "shell", inline: <<-SHELL
      hostnamectl set-hostname "kv1worker2"
      sudo /kubeshared/setup/install-crio.sh
      sudo /kubeshared/setup/install-kube.sh
    SHELL

  end

end
