Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"

  # 1. Web Server (Nginx)
  config.vm.define "web" do |web|
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.56.10"
    web.vm.provider "virtualbox" do |v|
      v.name = "infra-web"
      v.memory = 1024
      v.cpus = 1
    end
    web.vm.provision "shell", path: "provision/web.sh"
  end

  # 2. Database Server (PostgreSQL)
  config.vm.define "db" do |db|
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.56.20"
    db.vm.provider "virtualbox" do |v|
      v.name = "infra-db"
      v.memory = 1024
      v.cpus = 1
    end
    db.vm.provision "shell", path: "provision/db.sh"
  end
end