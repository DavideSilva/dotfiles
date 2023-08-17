FROM alpine:latest

RUN apk update

RUN apk add openssh sudo bash ansible

RUN rm -rf /var/cache/apk/*

RUN ssh-keygen -A && echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config

ARG ssh_pub_key
RUN mkdir /root/.ssh/ && echo -e "$ssh_pub_key" > /root/.ssh/authorized_keys

# vagrant user to enable vagrant ssh and vagrant provision
RUN adduser -s /bin/bash vagrant; echo -n 'vagrant:vagrant' | chpasswd
RUN echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant
RUN chmod 440 /etc/sudoers.d/vagrant

RUN mkdir -p /home/vagrant/.ssh
RUN chmod 700 /home/vagrant/.ssh
RUN echo -e "$ssh_pub_key" > /home/vagrant/.ssh/authorized_keys
RUN chmod 600 /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
#
RUN sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers
RUN sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config

RUN rm /etc/motd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
