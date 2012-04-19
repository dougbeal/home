#!/bin/bash
perl=$(which perl)
stow=$(which stow)
$perl $stow --dir=. --target=$HOME home
