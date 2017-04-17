#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install NVM
if ! [ -e "$(which nvm)" ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
fi

#install Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Brew stuff
# only for MacOs
if [[ `uname` == 'Darwin' ]]; then
  if ! [ -e "$(which brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  brew upgrade

  brew install tree
  brew install entr
  brew install tmux
  brew install cmake

  brew cleanup
else
  sudo apt-get install tree
  sudo apt-get install entr
  sudo apt-get install tmux
fi

# Font stuff
source $BASEDIR/fonts.sh

# Make sure Vundle.vim is installed for vim.
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim -c ":PluginInstall" -c ":qa"
  cd ~/.vim/bundle/vimproc.vim/ && make
fi

# Make sure TPM is installed for tmux.
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
