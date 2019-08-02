FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y vim \
                       curl \
                       software-properties-common \
                       git \
                       tree \
                       fish \
                       mosh \
                       python3 \
                       python3-pip 

RUN pip3 install pipenv \
                 black

COPY .vimrc /root/.vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall

RUN chsh --shell /usr/bin/fish
RUN curl -L https://get.oh-my.fish -o omf.fish
RUN fish omf.fish --noninteractive 
RUN fish -c "omf install foreign-env"
