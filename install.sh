#!/bin/bash
this=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )
source "$this/sh/common.sh"

############################################################
# generate .emacs file, which loads repo init.el  
if [ ! -e ~/.emacs ]; then
    $this/generate_dotemacs.sh > $HOME/.emacs
fi

stow_source="$this"
stow_destination=$( cd $HOME; pwd -P )

# todo: move to platform specific, this is an osx-ism
command -v stow || brew install stow
command -v w3m || brew install w3m

# to ~/
stow --verbose=3 "--dir=$stow_source" --target="$stow_destination" --stow home sh

# to ~/.ssh
dst="$stow_destination/.ssh"
mkdir -p "$dst"
stow --verbose=3 "--dir=$stow_source" --target="$dst" --stow .ssh

# to ~/bin
src="$stow_source/bin/"
dst="$stow_destination/bin"
ln -s "$src" "$dst" 

src="$this/git"
stow --verbose=3 "--dir=$src" --target="$stow_source/bin" --stow gist.sh


( cd "$stow_destination" && ln -s .gitconfig_${platform} .gitconfig )
git submodule init
git submodule update


$this/package_install.sh

themeDir="~/Library/Developer/Xcode/UserData/FontAndColorThemes/"
stow --verbose=3 "$stow_source/xcode/xcode-themes" --target "$themeDir" --stow *.dvtcolortheme
