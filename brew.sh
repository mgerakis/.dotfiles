#!/bin/bash

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
brew install node
brew install zsh

brew cleanup

