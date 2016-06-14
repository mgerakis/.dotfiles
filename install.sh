#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -si ${BASEDIR}/vimrc ~/.vimrc

# tmux
ln -si ${BASEDIR}/tmux.conf ~/.tmux.conf

# zsh
ln -si ${BASEDIR}/zshrc ~/.zshrc
