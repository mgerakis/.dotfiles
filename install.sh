#!/bin/bash

VUNDLE=$HOME/.vim/bundle/Vundle.vim

if ! [ -e ${VUNDLE} ]
then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES=(
  "gitconfig"
  "tmux.conf"
  "vimrc"
  "zshrc"
)

for file in "${FILES[@]}"
do
  ln -si ${BASEDIR}/${file} ~/.${file}
done
