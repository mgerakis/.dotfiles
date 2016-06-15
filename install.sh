#!/bin/bash

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
