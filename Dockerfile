FROM ubuntu:latest

RUN apt update && apt install -y ssh sudo bash zsh ansible neovim

RUN rm -rf /var/cache/apt/*

RUN ssh-keygen -A && echo -n "PasswordAuthentication no" >> /etc/ssh/sshd_config

ARG ssh_pub_key
RUN mkdir /root/.ssh/ && echo "$ssh_pub_key" > /root/.ssh/authorized_keys

# vagrant user to enable vagrant ssh and vagrant provision
RUN useradd -s /bin/bash -U -m vagrant; echo -n 'vagrant:vagrant' | chpasswd
RUN echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant
RUN chmod 440 /etc/sudoers.d/vagrant

RUN mkdir -p /run/sshd

RUN mkdir -p /home/vagrant/.ssh
RUN chmod 700 /home/vagrant/.ssh

RUN echo "$ssh_pub_key" > /home/vagrant/.ssh/authorized_keys
RUN chmod 600 /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
#
RUN sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers
RUN sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
