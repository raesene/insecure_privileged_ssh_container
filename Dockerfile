FROM ubuntu:18.04
RUN apt update && apt install -y openssh-server
RUN echo "root:reallyinsecure" | chpasswd
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.14.4/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin
COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

# This is a Dumb Hack
CMD ["/entrypoint.sh"]
