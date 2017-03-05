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
if [[ `uname` == 'Darwin' ]]
  if ! [ -e "$(which brew)" ]
  then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  brew upgrade

  brew install vim --with-override-system-vi
  brew install tree
  brew install entr
  brew install git
  brew install zsh

  brew cleanup
fi

# Font stuff
source $BASEDIR/fonts.sh

# Make sure Vundle.vim is installed for vim.
if ! [ -e ${VUNDLE} ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

