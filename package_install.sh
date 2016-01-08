#!/bin/sh
brew install gawk markdown git bash-completion cask ispell exiftool
(

    brew install nodejs python ruby

    (
        npm install -g coffee-script coffeelint jshint js2coffee exec-sync node-inspector async mocha
        echo "node packages installed."
    )&
    (
        pip install pylint yolk greenlet feedparser setuptools rope ropemacs ropemode dingus PyYAML ipdb argparse virtualenv
        echo "python packages installed."
    )&
    (
        gem install tidy github-pages jekyll json bundle maid exiftool
        echo "ruby packages installed."
    )&
    ## os x development    
    brew install go carthage
    brew cask install github-desktop
)&

