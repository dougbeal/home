#!/bin/bash
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'
defaults write com.apple.dock use-new-list-stack -bool YES
killall Dock
defaults write com.apple.Finder AppleShowAllFiles YES
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.dashboard mcx-disabled -boolean YES
defaults write com.tapbots.TweetbotMac OpenURLsDirectly YES
