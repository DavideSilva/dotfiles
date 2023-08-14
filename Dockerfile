FROM alpine:latest

RUN apk update && apk add openssh && rm -rf /var/cache/apk/*

RUN ssh-keygen -A && echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config

ARG ssh_pub_key
RUN mkdir /root/.ssh/ && echo -e "$ssh_pub_key" > /root/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
