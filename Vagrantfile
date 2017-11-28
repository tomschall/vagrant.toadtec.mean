# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # box to build virtual evironment to build off of.
  config.vm.box = "CentOS-7-x86_64-v20171127"
  # config.vm.box_download_checksum = "cf92ef32edf0f8e4ab45bcab1bc79277f58c67ff86aab55b5230199297cfffb5"
  # config.vm.box_download_checksum_type = "sha256"
  # config.vm.box_url = "https://www.dropbox.com/s/4yk8dhopfk6cwoe/CentOS-7-x86_64-v20171127.box"
    
  # set auto_update to false, if you do NOT want to check the correct
  # additions version when booting this machine
  config.vbguest.auto_update = true

  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = false
    
  # NFS Mounting See http://drpebcak.svbtle.com/nfs-configuration-with-vagrant for further Information
  config.vm.synced_folder ".", "/vagrant",
    :nfs => true,
    :mount_options => ['noatime,soft,nfsvers=3'],
    :export_options => ['async,insecure,no_subtree_check,no_acl,no_root_squash']

  # configurating the vm 
  config.vm.provider "virtualbox" do |v|
    v.name = "toadtechnologies_mean_vm"
    # max 75% CPU cap
    v.customize [
        "modifyvm", :id,
        "--natdnsproxy1", 'on',
        "--natdnshostresolver1", 'on',
        "--memory", "4096",
        "--cpus", "2",
        "--cpuexecutioncap", "90",
        "--name", "local.www.toadtec.ch"
    ]
  end

  # run "bootstrap.sh" shell script when setting up our machine
  config.vm.provision :shell, :privileged => false, :path => "bootstrap.sh"


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 3000, host: 3000
    
  # Forward all ports in 'dev_ports' to the host machine
  # 'auto_correct' is used to resolve any possible conflicts.
  dev_ports = [
    # Node JS
    3000,
    4200,
    5000,
    1337,
    # Mongo DB
    27017,
    28017
  ]
    
  dev_ports.each do |p|
    config.vm.network 'forwarded_port', guest: p, host: p, auto_correct: true
  end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network :private_network, ip: "179.16.0.60"
  config.vm.hostname = "local.www.toadtec.ch"


  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network


  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./data", "/vagrant_data", create: "true"
  
  config.vm.post_up_message = " \
    =========================================================================== \n \
    | \n \
    | TOADTEC MEAN STACK \n \
    | IP:         179.16.0.60 \n \
    | Hostname:   local.www.toadtec.ch \n \
    | Open Ports: 3000, 4200, 5000, 1337, 27017 \n \
    | Test your Server: nodemon /vagrant/node/app.js \n \
    | Open URL in Browser: http://local.www.toadtec.ch:3000 \n \
    | \n \
    =========================================================================== "

end
