#!/bin/bash

perl=$(which perl)
stow=$(which stow)

############################################################
# generate .emacs file, which loads repo init.el  
if [ ! -e ~/.emacs ]; then
    ./generate_dotemacs.sh > $HOME/.emacs
fi

$perl $stow --dir=. --target=$HOME home
$perl $stow --dir=. --target=$HOME/.ssh .ssh

