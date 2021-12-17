# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV["LC_ALL"] = "en_US.UTF-8"

class String
def red;            "\e[31m#{self}\e[0m" end
def bold;           "\e[1m#{self}\e[22m" end
end

`git fetch`
`git status | grep behind`
if $?.exitstatus == 0
  abort("!!\n!! There are updates in the remote, please `git pull` and call `vagrant reload` to keep your VM up to date.\n!!".red.bold)
end

settings = YAML.load_file 'vagrant.default.yml'

if File.exist?("vagrant.local.yml")
    local_settings = YAML.load_file "vagrant.local.yml"
    settings.merge!(local_settings)
end

Vagrant.configure("2") do |config|
  config.vm.define "brooksdigital"

  config.vm.box = "debian/bullseye64"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: settings["ip"]

  config.vm.provider "virtualbox" do |vb|
    # vb.gui = true

    vb.cpus = settings['cpus']
    vb.memory = settings['memory']
    # To help with DNS issues
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Copy over git global configs
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig", run: "always"
  # Copy over your local ssh keys and other potential ssh settings.
  config.vm.provision "file", source: "~/.ssh", destination: "/tmp/host/.ssh", run: "always"

  config.vm.provision "shell", path: "provision.sh", run: "always"
end
