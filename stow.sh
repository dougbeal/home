#!/bin/bash
if [[ $OS =~ Window.*  ]]; then
    win_path=$( cd $(dirname ${BASH_SOURCE[0]}); cygpath -ma . )
    unix_path=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )
else
    unix_path=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )
fi
paths=( $unix_path $win_path )
perl=$(which perl)
stow=$(which stow)
  
if [ ! -e ~/.emacs ]; then
    t=""
    # create lisp strings
    for path in ${paths[@]}; do
	t="$t \"$path\""
    done
    echo """
(require 'cl)
(loop for path in '($t) do
    (if (file-exists-p (concat path \"/emacs/init.el\"))
        (progn (load (concat path \"/emacs/init.el\"))
            (throw 'break nil))))
""" > $HOME/.emacs
fi

$perl $stow --dir=. --target=$HOME home
$perl $stow --dir=. --target=$HOME/.ssh .ssh

