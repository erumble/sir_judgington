# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
vagrantfile_api_version = "2"

# definitions for the machines provisioned by this vagrant file
box_params = {
  box: 'erumble/centos7-x64',
  hostname: 'sir-judgington.dev',
  ip: '192.168.5.31',
  playbook: 'ansible/playbook.yml',
  galaxy_role_file: 'ansible/dependencies.yml'
}

# make the vagrant machine(s)
Vagrant.configure(vagrantfile_api_version) do |config|
  config.vm.define box_params.fetch(:hostname) do |box|

    # specify the box, hostname, and ip address
    box.vm.box = box_params.fetch :box
    box.vm.hostname = box_params.fetch :hostname
    box.vm.network :private_network, ip: box_params.fetch(:ip)

    # provision the thing
    box.vm.provision :ansible do |ansible|
      ansible.playbook = box_params.fetch :playbook
      ansible.galaxy_role_file = box_params[:galaxy_role_file]
    end

  end # config.vm.define
end # Vagrant.configure
