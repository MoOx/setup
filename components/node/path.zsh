#!/bin/zsh

export NODE_PATH=/usr/local/lib/node_modules

# local bin, then local npm bin, then global npm bin
export PATH=./bin:./node_modules/.bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH
