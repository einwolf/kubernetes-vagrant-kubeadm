# -*- mode: ruby -*-
# vi: set ft=ruby :

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
  # This is how vagrant access vms. Also vagrant ssh and such.

  # config.vm.network "public_network", :adapter=>1 , type: "dhcp", :bridge => 'en4: Thunderbolt Ethernet'
  # config.vm.network :private_network, :type => "dhcp"

  config.vm.network :private_network, :type => "dhcp", :libvirt__network_name => "br0"

  # Host only network with specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # config.vm.network "public_network"

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

  # Shell provisioning
  # config.vm.provision "shell", inline: <<-SHELL
  #   date > /start-date.txt
  # SHELL

  config.vm.define :control1 do |control1|
    # Set vagrant box
    # control1.vm.box = "almalinux/9"
    # control1.vm.box_version = "9.3.20231118"

    # Set cpu, memory, and other resources that are provider specific
    config.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
      # domain.nested = true
      domain.disk_driver :cache => 'none'
    end

    # Shared directories
    control1.vm.synced_folder "./shared1", "/shared1", type: "sshfs"

    # Shell provisioning
    control1.vm.provision "shell", inline: <<-SHELL
      date > /control1-start-date.txt
    SHELL

  end

  config.vm.define :worker1 do |worker1|
    # Set vagrant box
    # worker1.vm.box = "almalinux/9"
    # worker1.vm.box_version = "9.3.20231118"

    # Set cpu, memory, and other resources that are provider specific
    config.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
      # domain.nested = true
      domain.disk_driver :cache => 'none'
    end

    # Shared directories
    worker1.vm.synced_folder "./shared1", "/shared1", type: "sshfs"

    # Shell provisioning
    worker1.vm.provision "shell", inline: <<-SHELL
      date > /worker1-start-date.txt
    SHELL

  end

  config.vm.define :worker2 do |worker2|
    # Set vagrant box
    # worker2.vm.box = "almalinux/9"
    # worker2.vm.box_version = "9.3.20231118"

    # Set cpu, memory, and other resources that are provider specific
    config.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
      # domain.nested = true
      domain.disk_driver :cache => 'none'
    end

    # Shared directories
    worker2.vm.synced_folder "./shared1", "/shared1", type: "sshfs"

    # Shell provisioning
    worker2.vm.provision "shell", inline: <<-SHELL
      date > /worker2-start-date.txt
    SHELL

  end

end
