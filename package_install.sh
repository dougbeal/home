#!/bin/sh
brew install nodejs python ruby markdown git bash-completion 
(
    npm install -g coffee-script coffeelint jshint js2coffee exec-sync node-inspector async mocha
    echo "node packages installed."
)&
(
    pip install pylint yolk greenlet feedparser setuptools rope ropemacs ropemode dingus PyYAML ipdb argparse virtualenv
    echo "python packages installed."
)&
(
    gem install tidy github-pages jekyll rake json
    echo "ruby packages installed."
)&
