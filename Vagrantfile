Vagrant.configure("2") do |config|
  config.ssh.private_key_path = "/Users/davidesilva/.ssh/id_rsa"

  config.vm.hostname = "duck"

  config.vm.define "docker-container" do |machine|
    machine.vm.provider "docker" do |docker|
      ssh_pub_key = File.readlines("/Users/davidesilva/.ssh/id_rsa.pub").first.strip

      docker.build_dir = "."
      docker.build_args = ["--build-arg", "ssh_pub_key=#{ssh_pub_key}", "-t", "alpine-vagrant"]

      docker.create_args = ["-p", "7777:22", "--name", "alpine-container"]

      docker.has_ssh = true
    end

    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end
end
