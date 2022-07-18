FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y zsh \
                       vim \
                       curl \
                       wget \
                       build-essential \
                       software-properties-common \
                       git \
                       tree \
                       mosh \
                       openssh-server \
                       python3 \
                       python3-pip 

RUN pip3 install pipenv \
                 black

COPY .vimrc /root/.vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall

RUN chsh --shell /usr/bin/zsh
run sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl


RUN curl -sL https://github.com/digitalocean/doctl/releases/download/v1.26.0/doctl-1.26.0-linux-amd64.tar.gz | tar -xzv && \
mv doctl /usr/local/bin

RUN curl -L https://git.io/get_helm.sh | bash

EXPOSE 22
CMD zsh && tail -f /dev/null
