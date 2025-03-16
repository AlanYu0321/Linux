#!/bin/bash 
set -e
set -v

# Dependencies needed to install the graphite-api 
# We need to manually retrieve all the dependencies
sudo apt install python3-pip python3-setuptools python3-dev

sudo apt install python3-cairocffi python3-flask python3-pyparsing python3-tz python3-tzlocal libjs-sphinxdoc sphinx-rtd-theme-common

