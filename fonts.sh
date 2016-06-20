#!/bin/bash

# Install fonts if necessary
find_command="find \"$BASEDIR/fonts/Menlo-for-Powerline\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"
font_dir=''

# See https://github.com/powerline/fonts/blob/master/install.sh
if [[ `uname` == 'Darwin' ]]
then
	# MacOS
	if ! ( find "$BASEDIR/fonts/Menlo-for-Powerline" \
		-mindepth 1 \
		-print -quit \
		| grep -q .) 
	then
		git submodule init
		git submodule update
		echo "Menlo for Powerline fonts have been installed... Now placing them in correct locations"
		font_dir="$HOME/Library/Fonts"
		# Copy fonts to user directory
		eval $find_command | xargs -0 -I % cp "%" "$font_dir/"
		echo "Fonts have been set up. Make sure to go into terminal preferences and change them!"
	fi
else
	# Linux
	font_dir="$HOME/.local/share/fonts"
	mkdir -p $font_dir
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
	wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
	mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
	fc-cache -vf ~/.fonts
	mkdir ~/.fonts.conf.d/
	mv 10-powerline-symbols.conf ~/.fonts.conf.d/
fi

if command -v fc-cache @>/dev/null
then
	echo "Resetting font cache, this may take a moment..."
	fc-cache -f $font_dir
fi

