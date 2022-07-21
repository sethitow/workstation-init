FROM ubuntu:latest

COPY . /root/src/workstation-init
WORKDIR /root/src/workstation-init
RUN bash init.sh

RUN pip3 install pipenv \
                 black

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Install doctl (Digital Ocean command line)
RUN curl -sL https://github.com/digitalocean/doctl/releases/download/v1.26.0/doctl-1.26.0-linux-amd64.tar.gz | tar -xzv && \
mv doctl /usr/local/bin

# Install Helm
RUN curl -L https://git.io/get_helm.sh | bash

WORKDIR /root

EXPOSE 22
CMD zsh && tail -f /dev/null
