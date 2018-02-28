#!/bin/bash
wget https://raw.githubusercontent.com/joeyism/.files/master/.tmux.conf ~/
wget https://raw.githubusercontent.com/joeyism/.files/master/.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo 'export PROMPT_COMMAND="history -a; history -n"' >> .bashrc
