#!/bin/bash
this=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )
source "$this/sh/common.sh"

############################################################
# generate .emacs file, which loads repo init.el  
if [ ! -e ~/.emacs ]; then
    ./generate_dotemacs.sh > $HOME/.emacs
fi

stow_source="$this"
stow_destination=$( cd $HOME; pwd -P )

# todo: move to platform specific, this is an osx-ism
command -v stow || brew install stow

stow --verbose=3 "--dir=$stow_source" --target="$stow_destination" --stow home sh
stow --verbose=3 "--dir=$stow_source" --target="$stow_destination/.ssh" --stow .ssh

( cd "$stow_destination" && ln -s .gitconfig_${platform} .gitconfig )
git submodule init
git submodule update

./package_install.sh

