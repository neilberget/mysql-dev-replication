# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network "private_network", ip: "192.168.50.2"
  config.vm.network "forwarded_port", guest: 3306, host: 3366

  config.vm.provision "docker",
    images: ["ubuntu"]

  # config.vm.provision "shell",
  #   inline: "cd /vagrant && 
  #            docker build -t mysql-master mysql-master &&
  #            docker build -t mysql-slave mysql-slave"
end


