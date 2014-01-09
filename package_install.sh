#!/bin/sh
(
    brew install nodejs
    npm install -g coffee-script coffeelint jshint js2coffee js-yaml jsonminify
    echo "node packages installed."
)&
(
    brew install python
    pip install pylint yolk greenlet feedparser setuptools rope ropemacs ropemode dingus PyYAML ipdb argparse virtualenv
    echo "python packages installed."
)&
(
    brew install ruby
    gem install tidy github-pages jekyll rake
    echo "ruby packages installed."
)&
