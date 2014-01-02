#!/bin/bash
this=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )

source "$this/sh/common.sh"

perl=$(which perl)
stow=$(which stow)

############################################################
# generate .emacs file, which loads repo init.el  
if [ ! -e ~/.emacs ]; then
    ./generate_dotemacs.sh > $HOME/.emacs
fi

stow_source="$this"
stow_destination=$( cd $HOME; pwd -P )

$perl $stow --verbose=3 "--dir=$stow_source" --target="$stow_destination" --stow home sh
$perl $stow --verbose=3 "--dir=$stow_source" --target="$stow_destination/.ssh" --stow .ssh

