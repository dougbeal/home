#!/bin/bash
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'
defaults write com.apple.dock use-new-list-stack -bool YES
killall Dock
