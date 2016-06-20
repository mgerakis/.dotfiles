#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Brew stuff
# only for MacOs
if [[ `uname` == 'Darwin' ]]
then
	source $BASEDIR/brew.sh
fi

# Font stuff
source $BASEDIR/fonts.sh

# Make sure Vundle.vim is installed for vim.
if ! [ -e ${VUNDLE} ]
then
	git clone https://github.com/VundleVim/Vundle.vim.git \
		~/.vim/bundle/Vundle.vim
fi

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

