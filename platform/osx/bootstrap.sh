#!/bin/sh
#bash -xc "$(curl -fsSL https://raw.githubusercontent.com/dougbeal/home/master/platform/osx/bootstrap.sh)"
git clone https://github.com/dougbeal/home ~/git/home
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install iterm2
brew install emacs
brew install Caskroom/cask/iterm
brew install Caskroom/cask/divvy
brew install Caskroom/cask/google-chrome
brew install Caskroom/cask/google-drive

