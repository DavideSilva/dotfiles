Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |docker|
    ssh_pub_key = File.readlines("/Users/davidesilva/.ssh/id_rsa.pub").first.strip

    docker.build_dir = "."
    docker.build_args = ["--build-arg", "ssh_pub_key=#{ssh_pub_key}", "-t", "alpine-vagrant-ssh"]
    docker.create_args = ["-p", "7777:22", "--name", "ansible-container"]
  end
end
