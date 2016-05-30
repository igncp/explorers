#!/bin/sh

# Install many of the tools in a Ubuntu distribution.

sudo apt-get install -y git-extras jq

# This requires node, it is a more recent version
# of the apt-get one.
sudo apt-get remove -y cloc
npm i -g cloc
