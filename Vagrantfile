Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  
  config.vm.hostname = "ov-dz1-vm"
  
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  
  config.vm.provision "shell", path: "provision.sh"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ov-dz1-vm"
    vb.memory = 1024
    vb.cpus = 1
  end
end
