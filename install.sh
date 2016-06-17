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

find_command="find \"$BASEDIR/fonts/Menlo-for-Powerline\" \( -name '*.[o,t]tf'
-or -name '*.pcf.gz' \) -type f -print0"

# Install fonts if necessary
# See https://github.com/powerline/fonts/blob/master/install.sh
if ! ["$(ls -A $BASEDIR/fonts/Menlo-for-Powerline)"]
then
	git submodule init
	git submodule update
	echo "Menlo for Powerline fonts have been installed... Now placing them
	in correct locations"
	if [[ `uname` == 'Darwin' ]]
	then
		# MacOS
		font_dir="$HOME/Library/Fonts"
	else
		# Linux
		# font_dir="$HOME/.local/share/fonts"
		# mkdir -p $font_dir
		# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
		# wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
		# mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
		# fc-cache -vf ~/.fonts
		# mkdir ~/.fonts.conf.d/
		# mv 10-powerline-symbols.conf ~/.fonts.conf.d/
	fi

	# Copy fonts to user directory
	eval $find_command | xargs -0 -I % cp "%" "$font_dir/"

	# Reset font cache on Linux
	if command -v fc-cache @>dev/null
	then
		echo "Resetting font cache, this may take a moment..."
		fc-cache -f $font_dir
	fi

	echo "Fonts have been set up. Make sure to go into terminal preferences
	and change them!"
fi

for file in "${FILES[@]}"
do
  ln -si ${BASEDIR}/${file} ~/.${file}
done
