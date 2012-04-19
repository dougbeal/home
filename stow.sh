#!/bin/bash
perl=$(which perl)
stow=$(which stow)
$perl $stow --dir=. --target=$HOME home
$perl $stow --dir=. --target=$HOME/.ssh .ssh
