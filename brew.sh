#!/bin/bash

if ! [ -e "$(which brew)" ]
then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brew install tree
brew install vim --with-override-system-vi
brew install git
brew install node
brew install zsh

brew cleanup

