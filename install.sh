#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES=(
  "gitconfig"
  "tmux.conf"
  "vimrc"
  "zshrc"
  "bashrc"
  "aliases"
)

for file in "${FILES[@]}"
do
  ln -si ${BASEDIR}/${file} ~/.${file}
done

