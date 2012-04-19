#!/bin/bash
this=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )
perl=$(which perl)
stow=$(which stow)
  
if [ ! -e ~/.emacs ]; then
    echo "(load \"$this/emacs/init.el\")" > $HOME/.emacs
fi

$perl $stow --dir=. --target=$HOME home
$perl $stow --dir=. --target=$HOME/.ssh .ssh

