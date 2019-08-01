FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y vim curl git tree fish 

COPY .vimrc ~/.vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall

RUN chsh --shell /usr/bin/fish
RUN curl -L https://get.oh-my.fish -o omf.fish
RUN fish omf.fish --noninteractive 
RUN fish -c "omf install foreign-env"
