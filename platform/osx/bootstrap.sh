#!/bin/bash
#bash -xc "$(curl -fsSL https://raw.githubusercontent.com/dougbeal/home/master/platform/osx/bootstrap.sh)"
git clone https://github.com/dougbeal/home ~/git/home
command -v brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install stow
brew install bash
bash ~/git/home/install.sh
brew install Caskroom/cask/brew-cask
brew install emacs --with-cocoa --with-d-bus --with-gnutls --with-imagemagik --with-librsvg --with-mailutils
brew cask install iterm
brew cask install divvy
brew cask install google-chrome
brew cask install google-drive
brew install coreutils
brew install findutils
brew tap homebrew/dupes
brew install homebrew/dupes/grep

