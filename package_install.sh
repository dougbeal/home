#!/bin/sh
brew install gawk markdown git bash-completion cask ispell exiftool hub ddcctl
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
    #brew install carthage 
    brew install go faswatch
    brew cask install github-desktop
    (
        go get github.com/fatih/gomodifytags golang.org/x/tools/cmd/goimports
    )&

    # OCRmyPDF https://github.com/jbarlow83/OCRmyPDF
    brew install tesseract-lang ocrmypdf

    # kubernetes and kubeless
    brew install kubernetes-cli kubeless helm
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    # kubectl create -f https://github.com/kubeless/kafka-trigger/releases/download/v1.0.2/kafka-zookeeper-v1.0.2.yaml
)&



