Vagrant.configure("2") do |config|
  config.vm.define "devVM" do |dapps|
    dapps.vm.box = "ubuntu/jammy64"
    # Change from "~/DAPPS" to an existing, and non-encrypted, folder on your host if the mount fails
    dapps.vm.synced_folder "~/DAPPS", "/home/vagrant/DAPPS", nfs: false, nfs_udp: false, create: true
    dapps.vm.network "private_network", type: "dhcp"

    # Webpack server
    dapps.vm.network :forwarded_port, guest: 8000, host: 8000, host_ip: "127.0.0.1"

    # Eth node
    dapps.vm.network :forwarded_port, guest: 8545, host: 8545, host_ip: "127.0.0.1"

    # IPFS
    dapps.vm.network :forwarded_port, guest: 4001, host: 4001, host_ip: "127.0.0.1"
    dapps.vm.network :forwarded_port, guest: 5001, host: 5001, host_ip: "127.0.0.1"
    dapps.vm.network :forwarded_port, guest: 8080, host: 8080, host_ip: "127.0.0.1"

    dapps.vm.provider "virtualbox" do |v|
      host = RbConfig::CONFIG['host_os']

      # Give VM 1/5 system memory & access to all cpu cores on the host
      if host =~ /darwin/
        cpus = `sysctl -n hw.ncpu`.to_i
        # sysctl returns Bytes and we need to convert to MB
        # mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 2
        mem = 4096
      elsif host =~ /linux/
        #cpus = `nproc`.to_i
        cpus = 1
        # meminfo shows KB and we need to convert to MB
        # mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
        mem = 4096
      else # sorry Windows folks, I can't help you
        cpus = 1
        mem = 4096
      end

      v.customize ["modifyvm", :id, "--memory", mem]
      v.customize ["modifyvm", :id, "--cpus", cpus]
      v.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
      v.customize ["modifyvm", :id, "--uartmode1", "file", File.join(Dir.pwd, "ubuntu-jammy-22.04-cloudimg-console.log")]
      v.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000]
    end

    dapps.vm.provision "file", source: "dotscreenrc", destination: "~/.screenrc"

    dapps.vm.provision :shell, path: "bootstrap.sh"
  end
  # config.ssh.username = "ubuntu"
  # config.ssh.password = "cdce84730f0efe3c8bdf3638"
  # config.ssh.insert_key = false
end
