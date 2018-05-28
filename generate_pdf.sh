#!/usr/bin/env bash

if [[ ! `which svgexport` ]]; then
  npm install -g svgexport
fi

if [[ ! `which calibre` ]]; then
  brew cask install calibre
fi

echo "Generating pdf of gitbook"
gitbook pdf ./ ./jumpstart-gitbook.pdf